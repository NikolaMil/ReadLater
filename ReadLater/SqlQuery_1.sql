﻿CREATE TABLE [dbo].[Bookmarks] (
    [ID] [int] NOT NULL IDENTITY,
    [URL] [nvarchar](500),
    [ShortDescription] [nvarchar](max),
    [CategoryId] [int],
    [CreateDate] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.Bookmarks] PRIMARY KEY ([ID])
)
CREATE INDEX [IX_CategoryId] ON [dbo].[Bookmarks]([CategoryId])
ALTER TABLE [dbo].[Bookmarks] ADD CONSTRAINT [FK_dbo.Bookmarks_dbo.Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([ID])
CREATE TABLE [dbo].[__MigrationHistory] (
    [MigrationId] [nvarchar](150) NOT NULL,
    [ContextKey] [nvarchar](300) NOT NULL,
    [Model] [varbinary](max) NOT NULL,
    [ProductVersion] [nvarchar](32) NOT NULL,
    CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201405071026235_Initial', N'ReadLater.Data.Migrations.Configuration',  0x1F8B0800000000000400ED59DB6EE336107D2FD07F10F4D416592BC9A2401BD8BBD87592C2D8DC10258BBE058C347688A54895A4021B45BFAC0FFDA4FE4287BA8BB46C394D82B628020432C939731FCE487FFEFEC7F8FD3261DE234845059FF807A37DDF031E8998F2C5C4CFF4FCCD0FFEFB775F7F353E8993A5F7B93AF7D69C434AAE26FE83D6E95110A8E80112A246098DA45062AE47914802128BE0707FFFC7E0E0200084F011CBF3C6D719D73481FC07FE9C0A1E41AA33C2CE450C4C95EBB813E6A8DE054940A52482897F0D243E231AE4E89868E27B1F18252845086CEE7B8473A18946198F6E15845A0ABE08535C20EC6695029E9B13A6A094FDA8393E548DFD43A346D010565051A6B44876043C785BDA25B0C99F645DBFB61B5AEE042DAC5746EBDC7A137F8A465B08B9F23D9BD9D1944973B06DDC9C9C821A55647B5EB5B457C701868BF9DBF3A619D3998409874C4BC2F6BCABEC9ED1E813AC6EC417E0139E31D6960EE5C3BDCE022E5D499182D4AB6B989732CF8E7D2FE8D20536614DD6A229B49971FDF6D0F72E9039B967503BBFA579A885849F80834435E32BA25177F4DD2C86DC7C0E778B97F95F71C368C3A4F1BD73B23C03BED00F13FF7BCC9253BA84B85A2805B8E514530C69B4CCA0CB631C348EDBE8CE8F427C4988FCB2A33B2BB2FFDDB986D7EDF5D9466FEEEE4E9747F820A43E0615499A1699DECB101F9F816195C0B3D832E4163209488835B60E70F37C434DC03B2EB0A02EC8235DE41EE991C5F7AE81E507D4034D8BEA5D87E65D73EA548AE45AB056B8D79B77A1C8646484137D276E885C801E965F1F941211CD45B212AC11A7ABE4098FBDADB215AE6D6B871EC6ECA229E6138A31F1BF73ACB709B852A905DC58AB0BBC3F1A1D38D8988B204D32108697AEC2ECA65CBB894B794453C2B68961110ECC79E3849A85BD730C297093AEDB6C3B84773BF45D196A565645DA66A371D00A16B746238D460A90A510751136FD8AD984A55E53B4B15F29EBB62AF3DA8E0A031E82EEEA8605DCF79A907662C289AD2E4A65DE75204DC45A202DF55DA456F6B6CEF5A6B8ED952159552BD191DF71F0903C6A41B50D6A5F525D8DD79493DAE94DEB1A14BD6BD5E3063D4DEEF89CA42956FE56D35BAE7861D1F14EDF84BBB783498111446A4D57584B5B73C27B932CC0DA45D628E929954A9BD8BD27A6D44FE3C439B636C47B02AF62E944B1EBBE2A1E2B12F36CE5543E048CFAA2A9B1E529AA9798AA927708AED7D790E6D3076144AE6948A6826509EF2F70FDD445C7D8A62F565C847160C9EE1430C74256D4DA361FE49126A3FE8643EAD2B1BB43FA495FC62179CFD726CF1786D3BBFD5C1BCCDD1D8EDCBEBDDA989B6EB50D68AD7EAE83D65A7FE520748AA77DA4E65E1751AB588ECBC2B5FDB58153C98A23BE87667AA4B1A962E14A69488A000E7F61534651DFE6C039E1740E4A1723908FD3FBA1F5F6E19FF32620502A66035F07BCFA1C478D55B74E6ADB668C0D93387F24327A20D299C51BCCE718BCFF1B866BCDBC3D76DB62B8E1236E85FF4D4296DFEE0AEA8EB1B9399C3E7A862DFD72E2FF9A931D79B39FEF1ACA3DEF5262261F79FBDE6F3BF377E6E1189FF5F679F82526CEA6C77EEA20E836C74F9C569F34516E68D85E6C82FCF74C8C6ED73D68145C6D1C048BFB0EA3F65EA0A78B68DD30F2F40D8A1BE7C4753C7A27B4571A236DE374BBFE2153E3DA81F3656644B79DC1E06A7D2BC1E05674D140982F271CA24E58D567667C2EAA08B724AA8E5835EE1C34C1AA463E484DE724D2B81D8152F97BC9CF846578E424B98778C62F339D661A5586E49E75CC68B26413FF7C10EECA3CBECCAF09F51C2AA098D414E64BFE31A32CAEE53E5D53987B204CFA9517ACF1A53617ED6255235D083E10A8345F5D356E20491982A94B1E9247788A6CB70ACE6041A255D595F6836C7744D7ECE3634A169224AAC468E8CDF7BFC07C007CF7176730A901321C0000 , N'6.1.0-30225')

INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'202006211641105_Chaned default connection in IdentityModels.cs to ReadLaterDataContext', N'ReadLater.Data.Migrations.Configuration',  0x1F8B0800000000000400ED59DB6EE336107D2FD07F10F4D416592BC9A2401BD8BBD87592C2D8DC10258BBE058C347688A54895A4021B45BFAC0FFDA4FE4287BA8BB46C394D82B628020432C939731FCE487FFEFEC7F8FD3261DE234845059FF807A37DDF031E8998F2C5C4CFF4FCCD0FFEFB775F7F353E8993A5F7B93AF7D69C434AAE26FE83D6E95110A8E80112A246098DA45062AE47914802128BE0707FFFC7E0E0200084F011CBF3C6D719D73481FC07FE9C0A1E41AA33C2CE450C4C95EBB813E6A8DE054940A52482897F0D243E231AE4E89868E27B1F18252845086CEE7B8473A18946198F6E15845A0ABE08535C20EC6695029E9B13A6A094FDA8393E548DFD43A346D010565051A6B44876043C785BDA25B0C99F645DBFB61B5AEE042DAC5746EBDC7A137F8A465B08B9F23D9BD9D1944973B06DDC9C9C821A55647B5EB5B457C701868BF9DBF3A619D3998409874C4BC2F6BCABEC9ED1E813AC6EC417E0139E31D6960EE5C3BDCE022E5D499182D4AB6B989732CF8E7D2FE8D20536614DD6A229B49971FDF6D0F72E9039B967503BBFA579A885849F80834435E32BA25177F4DD2C86DC7C0E778B97F95F71C368C3A4F1BD73B23C03BED00F13FF7BCC9253BA84B85A2805B8E514530C69B4CCA0CB631C348EDBE8CE8F427C4988FCB2A33B2BB2FFDDB986D7EDF5D9466FEEEE4E9747F820A43E0615499A1699DECB101F9F816195C0B3D832E4163209488835B60E70F37C434DC03B2EB0A02EC8235DE41EE991C5F7AE81E507D4034D8BEA5D87E65D73EA548AE45AB056B8D79B77A1C8646484137D276E885C801E965F1F941211CD45B212AC11A7ABE4098FBDADB215AE6D6B871EC6ECA229E6138A31F1BF73ACB709B852A905DC58AB0BBC3F1A1D38D8988B204D32108697AEC2ECA65CBB894B794453C2B68961110ECC79E3849A85BD730C297093AEDB6C3B84773BF45D196A565645DA66A371D00A16B746238D460A90A510751136FD8AD984A55E53B4B15F29EBB62AF3DA8E0A031E82EEEA8605DCF79A907662C289AD2E4A65DE75204DC45A202DF55DA456F6B6CEF5A6B8ED952159552BD191DF71F0903C6A41B50D6A5F525D8DD79493DAE94DEB1A14BD6BD5E3063D4DEEF89CA42956FE56D35BAE7861D1F14EDF84BBB783498111446A4D57584B5B73C27B932CC0DA45D628E929954A9BD8BD27A6D44FE3C439B636C47B02AF62E944B1EBBE2A1E2B12F36CE5543E048CFAA2A9B1E529AA9798AA927708AED7D790E6D3076144AE6948A6826509EF2F70FDD445C7D8A62F565C847160C9EE1430C74256D4DA361FE49126A3FE8643EAD2B1BB43FA495FC62179CFD726CF1786D3BBFD5C1BCCDD1D8EDCBEBDDA989B6EB50D68AD7EAE83D65A7FE520748AA77DA4E65E1751AB588ECBC2B5FDB58153C98A23BE87667AA4B1A962E14A69488A000E7F61534651DFE6C039E1740E4A1723908FD3FBA1F5F6E19FF32620502A66035F07BCFA1C478D55B74E6ADB668C0D93387F24327A20D299C51BCCE718BCFF1B866BCDBC3D76DB62B8E1236E85FF4D4296DFEE0AEA8EB1B9399C3E7A862DFD72E2FF9A931D79B39FEF1ACA3DEF5262261F79FBDE6F3BF377E6E1189FF5F679F82526CEA6C77EEA20E836C74F9C569F34516E68D85E6C82FCF74C8C6ED73D68145C6D1C048BFB0EA3F65EA0A78B68DD30F2F40D8A1BE7C4753C7A27B4571A236DE374BBFE2153E3DA81F3656644B79DC1E06A7D2BC1E05674D140982F271CA24E58D567667C2EAA08B724AA8E5835EE1C34C1AA463E484DE724D2B81D8152F97BC9CF846578E424B98778C62F339D661A5586E49E75CC68B26413FF7C10EECA3CBECCAF09F51C2AA098D414E64BFE31A32CAEE53E5D53987B204CFA9517ACF1A53617ED6255235D083E10A8345F5D356E20491982A94B1E9247788A6CB70ACE6041A255D595F6836C7744D7ECE3634A169224AAC468E8CDF7BFC07C007CF7176730A901321C0000 , N'6.1.0-30225')

INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'202006211658279_SecondTry', N'ReadLater.Data.Migrations.Configuration',  0x1F8B0800000000000400ED59DB6EE336107D2FD07F10F4D416592BC9A2401BD8BBD87592C2D8DC10258BBE058C347688A54895A4021B45BFAC0FFDA4FE4287BA8BB46C394D82B628020432C939731FCE487FFEFEC7F8FD3261DE234845059FF807A37DDF031E8998F2C5C4CFF4FCCD0FFEFB775F7F353E8993A5F7B93AF7D69C434AAE26FE83D6E95110A8E80112A246098DA45062AE47914802128BE0707FFFC7E0E0200084F011CBF3C6D719D73481FC07FE9C0A1E41AA33C2CE450C4C95EBB813E6A8DE054940A52482897F0D243E231AE4E89868E27B1F18252845086CEE7B8473A18946198F6E15845A0ABE08535C20EC6695029E9B13A6A094FDA8393E548DFD43A346D010565051A6B44876043C785BDA25B0C99F645DBFB61B5AEE042DAC5746EBDC7A137F8A465B08B9F23D9BD9D1944973B06DDC9C9C821A55647B5EB5B457C701868BF9DBF3A619D3998409874C4BC2F6BCABEC9ED1E813AC6EC417E0139E31D6960EE5C3BDCE022E5D499182D4AB6B989732CF8E7D2FE8D20536614DD6A229B49971FDF6D0F72E9039B967503BBFA579A885849F80834435E32BA25177F4DD2C86DC7C0E778B97F95F71C368C3A4F1BD73B23C03BED00F13FF7BCC9253BA84B85A2805B8E514530C69B4CCA0CB631C348EDBE8CE8F427C4988FCB2A33B2BB2FFDDB986D7EDF5D9466FEEEE4E9747F820A43E0615499A1699DECB101F9F816195C0B3D832E4163209488835B60E70F37C434DC03B2EB0A02EC8235DE41EE991C5F7AE81E507D4034D8BEA5D87E65D73EA548AE45AB056B8D79B77A1C8646484137D276E885C801E965F1F941211CD45B212AC11A7ABE4098FBDADB215AE6D6B871EC6ECA229E6138A31F1BF73ACB709B852A905DC58AB0BBC3F1A1D38D8988B204D32108697AEC2ECA65CBB894B794453C2B68961110ECC79E3849A85BD730C297093AEDB6C3B84773BF45D196A565645DA66A371D00A16B746238D460A90A510751136FD8AD984A55E53B4B15F29EBB62AF3DA8E0A031E82EEEA8605DCF79A907662C289AD2E4A65DE75204DC45A202DF55DA456F6B6CEF5A6B8ED952159552BD191DF71F0903C6A41B50D6A5F525D8DD79493DAE94DEB1A14BD6BD5E3063D4DEEF89CA42956FE56D35BAE7861D1F14EDF84BBB783498111446A4D57584B5B73C27B932CC0DA45D628E929954A9BD8BD27A6D44FE3C439B636C47B02AF62E944B1EBBE2A1E2B12F36CE5543E048CFAA2A9B1E529AA9798AA927708AED7D790E6D3076144AE6948A6826509EF2F70FDD445C7D8A62F565C847160C9EE1430C74256D4DA361FE49126A3FE8643EAD2B1BB43FA495FC62179CFD726CF1786D3BBFD5C1BCCDD1D8EDCBEBDDA989B6EB50D68AD7EAE83D65A7FE520748AA77DA4E65E1751AB588ECBC2B5FDB58153C98A23BE87667AA4B1A962E14A69488A000E7F61534651DFE6C039E1740E4A1723908FD3FBA1F5F6E19FF32620502A66035F07BCFA1C478D55B74E6ADB668C0D93387F24327A20D299C51BCCE718BCFF1B866BCDBC3D76DB62B8E1236E85FF4D4296DFEE0AEA8EB1B9399C3E7A862DFD72E2FF9A931D79B39FEF1ACA3DEF5262261F79FBDE6F3BF377E6E1189FF5F679F82526CEA6C77EEA20E836C74F9C569F34516E68D85E6C82FCF74C8C6ED73D68145C6D1C048BFB0EA3F65EA0A78B68DD30F2F40D8A1BE7C4753C7A27B4571A236DE374BBFE2153E3DA81F3656644B79DC1E06A7D2BC1E05674D140982F271CA24E58D567667C2EAA08B724AA8E5835EE1C34C1AA463E484DE724D2B81D8152F97BC9CF846578E424B98778C62F339D661A5586E49E75CC68B26413FF7C10EECA3CBECCAF09F51C2AA098D414E64BFE31A32CAEE53E5D53987B204CFA9517ACF1A53617ED6255235D083E10A8345F5D356E20491982A94B1E9247788A6CB70ACE6041A255D595F6836C7744D7ECE3634A169224AAC468E8CDF7BFC07C007CF7176730A901321C0000 , N'6.1.0-30225')

