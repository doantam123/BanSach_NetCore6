﻿using BanSach.DataAccess.Data;
using BanSach.DataAccess.Repository;
using BanSach.DataAccess.Repository.IRepository;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Stripe;
using BanSach.DataAccess.DbInitializer;
using Bansach.Utility;
using BanSach.Models;
using WebBanSach.Common;
using WebBanSach.DesignPattern_Tam.Command;
using WebBanSach.DesignPattern_Tam.Observer;





var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages().AddRazorRuntimeCompilation();


builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
builder.Services.AddScoped<IDbInitializer, DbInitializer>();
builder.Services.AddDbContext<ApplicationDbContext>(
        options => options.UseSqlServer(
              builder.Configuration.GetConnectionString("DefaultConnection")
    ), ServiceLifetime.Scoped);

Global.ConnectionString =  builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.Configure<StripeSettings>(builder.Configuration.GetSection("Stripe"));//ánh xạ setting Stripe

builder.Services.AddIdentity<IdentityUser, IdentityRole>().AddDefaultTokenProviders()
    .AddEntityFrameworkStores<ApplicationDbContext>();


builder.Services.AddAuthentication()
    .AddGoogle(googleOptions => {
        // Đọc cấu hình
        IConfigurationSection googleAuthNSection = builder.Configuration.GetSection("Authentication:Google");
        googleOptions.ClientId = googleAuthNSection["ClientId"];
        googleOptions.ClientSecret = googleAuthNSection["ClientSecret"];
    })
    .AddFacebook(facebookOptions => {
        // Đọc cấu hình
        IConfigurationSection facebookAuthNSection = builder.Configuration.GetSection("Authentication:Facebook");
        facebookOptions.AppId = facebookAuthNSection["AppId"];
        facebookOptions.AppSecret = facebookAuthNSection["AppSecret"];
        // Thiết lập đường dẫn Facebook chuyển hướng đến
        // facebookOptions.CallbackPath = "/signin-facebook";
    });

builder.Services.AddSession();

//thêm Email Configs
//var emailConfig = builder.Configuration.GetSection("EmailConfiguration").Get<EmailConfiguration>();
//builder.Services.AddSingleton(emailConfig);

//builder.Services.AddScoped<IEmailService,EmailService>();
builder.Services.AddScoped<IEmailSender,EmailSender>();
builder.Services.AddScoped<INotiService, NotiService>();
builder.Services.AddSingleton<Stack<IUndoItem>>();
builder.Services.AddSingleton<CategoryObserver>();

builder.Services.AddTransient(typeof(DeleteCommand<>)); // Đảm bảo DeleteCommand được đăng ký



builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = $"/Identity/Account/Login";
    options.LogoutPath = $"/Identity/Account/Logout";
    options.AccessDeniedPath = $"/Identity/Account/AccessDenied";
}); //cấu hình lại

//builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
//    .AddEntityFrameworkStores<ApplicationDbContext>();

var app = builder.Build();


// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
StripeConfiguration.ApiKey = builder.Configuration.GetSection("Stripe:SecretKey").Get<string>();
SeedDatabase();

app.UseAuthentication();
app.UseAuthorization();
app.UseSession();

app.MapRazorPages(); //map identity vs project
app.MapControllerRoute(
    name: "default",
    pattern: "{area=Customer}/{controller=Home}/{action=Index}/{id?}");

app.Run();


void SeedDatabase()
{
    using (var scope = app.Services.CreateScope())
    {
        var dbInitializer = scope.ServiceProvider.GetRequiredService<IDbInitializer>();
        dbInitializer.Initialize(); 
    }
}
