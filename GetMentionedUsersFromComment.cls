public class GetMentionedUsersFromComment {
 @InvocableMethod(label='Get Mentioned Users Comment')
    public static list<list<String>>GetMentionedUsers(list<String> feedCommentId) {
         
      String communityID='internal';
      String feedCommentIDstr=feedCommentId[0];
      list<list<String>> itemListList = new list<list<String>>(); 
        
      ConnectApi.Comment feedComment = ConnectApi.ChatterFeeds.getComment(communityId, feedCommentIdstr);
      list<ConnectApi.MessageSegment> messageSegments = feedComment.body.messageSegments;
      list<String> MentionedList=new list<string>();
        
        for (ConnectApi.MessageSegment messageSegment : messageSegments) {
            if(messageSegment instanceof ConnectApi.MentionSegment) {
                ConnectApi.MentionSegment mentionSegment = (ConnectApi.MentionSegment) messageSegment;
                MentionedList.add(mentionSegment.record.id);
            }
        }
        itemListList.add(MentionedList);
      Return itemListList;
    }
}
