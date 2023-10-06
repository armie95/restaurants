  
  
  
          
    
CREATE Procedure [dbo].[SP_EP_AddMeal]        
 @mealName  nvarchar(200),               
 @mealType  nvarchar(20),          
 @mealDetails nvarchar(500),        
 @mealDate nvarchar(20),            
 @mealImage nvarchar(200),      
 @createdBy nvarchar(30)      
AS             
   
--Declare @mealName nvarchar(200) set @mealName = 'test meal';  
--Declare @mealType nvarchar(200) set @mealType = 'Dinner';  
--Declare @mealDetails nvarchar(200) set @mealDetails = 'det';  
--Declare @mealDate nvarchar(20) set @mealDate = '06/07/2023';  
--Declare @createdBy nvarchar(200) set @createdBy = 'WS1';  
  
Begin    
  
 Declare @ValidMeal INT=(select count(id) from Meal_Menu where isnull(Is_Deleted,0)=0 and Type=@mealType and Meal_Date=@mealDate )         
 if (@ValidMeal>=1)       
 BEGIN  
  select 'Already Exists'  
 END  
 else  
 BEGIN  
  insert into Meal_Menu(Name, Type, Meal_Date, Details, Image_Name, Created_Date, Created_By)    
  values (@mealName, @mealType, @mealDate, @mealDetails, @mealImage, dbo.GetDateOwn(), @createdBy)    
  select 'Record Added'     
 END  
END          