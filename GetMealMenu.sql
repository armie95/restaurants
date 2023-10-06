  
  
  
  
  
        
                            
CREATE Procedure [dbo].[SP_EP_GetMealMenu] --'E000301', '05-01-2023', '05-01-2023'                    
 @mealType  nvarchar(20),                       
 @fromDate  nvarchar(20),                       
 @toDate  nvarchar(20)  
AS                            
  
  
Begin                            
                             
 select Id, Name, Type, convert(varchar, Meal_Date, 101) as Meal_Date, DATENAME(WEEKDAY, Meal_Date) Meal_Day, Details, Image_Name   
 from meal_menu   
 where isnull(is_deleted, 0)=0 and (@mealType='All' or (@mealType<>'All' and Type=@mealType))        
 and Meal_Date between @fromDate and @toDate  
 order by Meal_Date, Type desc  
                
                            
End   