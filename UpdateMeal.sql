  
  
  
  
  
  
  
  
CREATE Procedure [dbo].[SP_EP_UpdateMeal]   
 @mealId  int,               
 @mealName  nvarchar(200),         
 @mealDetails nvarchar(500),         
 @mealImage nvarchar(200),            
 @modifiedBy nvarchar(30)      
AS     
  
Begin  
  
 update Meal_Menu set Name=@mealName, Details=@mealDetails, Image_Name=@mealImage, Modified_By=@modifiedBy, Modified_Date=dbo.GetDateOwn()  where id=@mealId;  
  
 select 'Record Updated'  
   
END  
  
  
  