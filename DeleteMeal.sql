  
  
  
  
  
        
        
CREATE Procedure [dbo].[SP_EP_DeleteMeal]        
 @recordId integer,    
 @modifiedBy nvarchar(30)    
AS           
        
Begin          
  
 update meal_menu set Is_Deleted=1, Modified_By=@modifiedBy, Modified_Date=dbo.GetDateOwn() where id=@recordId        
 select 'Record Deleted'    
   
END        
        