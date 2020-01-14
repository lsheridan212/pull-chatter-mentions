global class GetMentionedUsersFromChatter {
  @InvocableMethod(label='Get Mentioned Users')
    public static list<list<String>>GetMentionedUsers(list<String> feedElementId) {
         
      String communityID='internal';
      String feedElementIDstr=feedElementId[0];
      list<list<String>> itemListList = new list<list<String>>(); 
        
      ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.getFeedElement(communityId, feedElementIdstr);
      list<ConnectApi.MessageSegment> messageSegments = feedElement.body.messageSegments;
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
