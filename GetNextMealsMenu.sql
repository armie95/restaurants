    
CREATE Procedure [dbo].[SP_EP_Dashboard_GetNextMealsMenu] --'E000301', '05-01-2023', '05-01-2023'                      
 @nextDays int    
AS                              
    
--declare @nextDays int set @nextDays =7;    
    
Begin                              
                               
 select top 8 Id, Name, Type, convert(varchar, Meal_Date, 101) as Meal_Date, DATENAME(WEEKDAY, Meal_Date) Meal_Day, Details, Image_Name     
 from meal_menu     
 where isnull(is_deleted, 0)=0 and  DATEADD(dd, 0, DATEDIFF(dd, 0, dbo.GetDateOwn())) < Meal_Date and dbo.GetDateOwn()+@nextDays>=Meal_Date    
 order by Meal_Date, Type desc    
                  
                              
End 