    
    
    
CREATE Procedure [dbo].[SP_EP_Dashboard_GetTickerNews] --'E000301', '05-01-2023', '05-01-2023'                      
    
AS                              
    
--declare @nextDays int set @nextDays =4;    
    
Begin                              
                               
 select Id, Name, Message, Active_From, Active_To, Is_Active, Priority ,     
 convert(varchar, Active_From, 101) Active_From_To_Show,    
 convert(varchar, Active_To, 101) Active_To_To_Show    
 from Ticker_News    
 where isnull(is_deleted, 0)=0 and isnull(Is_Active, 1)=1 and dbo.GetDateOwn() between Active_From and Active_To    
 order by Is_Active desc, Priority    
                  
                              
End 