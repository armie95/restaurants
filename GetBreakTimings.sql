      
      
CREATE Procedure [dbo].[SP_EP_Dashboard_GetBreakTimings]                  
AS                                
      
Begin                                
                                 
 select BT.Id, BT.Break_Name, BT.Day_Time, BT.From_Time, BT.To_Time, BT.Details, BT.Shift_Id, S.Name as Shift_Name, Priority, BT.Is_Active,       
 FORMAT(CAST(BT.From_Time AS datetime),'hh:mm tt')  From_Time_To_Show,      
 FORMAT(CAST(BT.To_Time AS datetime),'hh:mm tt') To_Time_To_Show,    
    
 CASE When CAST(dbo.GetDateOwn() AS time) between     
 CASE WHEN Break_Name in ('Lunch', 'Dinner')  Then DATEADD(minute, -15, BT.From_Time) else BT.From_Time end     
  and     
  CASE WHEN Break_Name in ('Lunch', 'Dinner') Then DATEADD(minute, 15, BT.To_Time) else BT.To_Time end    
 Then 1 else 0 end as Current_Break    
    
 from Break_Timings BT      
 inner join Shifts S on BT.Shift_Id=S.Shift_Id      
 where isnull(BT.is_deleted, 0)=0 and isnull(S.is_deleted, 0)=0 and isnull(S.Is_Active, 1)=1       
 order by BT.Shift_Id, Priority      
                                
End 