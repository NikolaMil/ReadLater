namespace ReadLater.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SeedUsers : DbMigration
    {
        public override void Up()
        {
            Sql(@"
                    INSERT INTO [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'17d2f890-99d2-49d5-9e96-4a3056859571', N'guest@test.com', 0, N'ABYhku10mLJfcX17ccBsdhLJNHVUXQxFdYSdrl+0gEfQiSr9v4oAPl13cePDGQLXsw==', N'cce09e99-dc99-4545-be0e-94800bf3525a', NULL, 0, 0, NULL, 1, 0, N'guest@test.com')
                    INSERT INTO [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'26aae0cb-91ea-4da1-9b6b-c77c849b7813', N'admin@test.com', 0, N'AHWqoEsrUVl+JRsRpg4ti7T82Ejeb4TN62QDJs/TIuN1v/6IKCMPqIusvB1Asjy2Lg==', N'e68700d0-4078-4a69-b141-1a11f477c5ce', NULL, 0, 0, NULL, 1, 0, N'admin@test.com')
                    INSERT INTO [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3449bbee-a9a7-471b-83fb-f0651a945fc6', N'nikola@test.com', 0, N'AIv5VfnVL6eTKnxpU8IM4AkCsyf8EhiYx25MdifybDv1sl2RGq265mrzCspo3TNx7A==', N'23c80028-db72-483b-80f9-c515fea7e818', NULL, 0, 0, NULL, 1, 0, N'nikola@test.com')
                    
                    INSERT INTO [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'a6f17223-d1a5-481d-8323-553841ce5b33', N'CanManage')
               
                    INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'26aae0cb-91ea-4da1-9b6b-c77c849b7813', N'a6f17223-d1a5-481d-8323-553841ce5b33')

                ");
        }
        
        public override void Down()
        {
        }
    }
}
