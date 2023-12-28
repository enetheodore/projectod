class MailItem {
  String title, description, content, time;
  bool isRead;
  MailItem({
    this.title,
    this.description,
    this.content,
    this.time,
    this.isRead,
  });
}

double MySize = 0.0;
double kPadding = MySize * 0.025;

List<MailItem> mailList = [
  MailItem(
    title: 'Google',
    description: 'This mail is from google',
    content: 'Dummy content for the mail app!',
    time: '4:00 pm',
    isRead: false,
  ),
  MailItem(
    title: 'Udemy',
    description: 'Specially designed for your need.',
    content: 'Dummy content for the mail app!',
    time: '3:30 pm',
    isRead: true,
  ),
  MailItem(
    title: 'Medium',
    description: 'Latest Content for you waiting.',
    content: 'Dummy content for the mail app!',
    time: '2:00 am',
    isRead: false,
  ),
  MailItem(
    title: 'Google',
    description: 'Your account may have been tampered!',
    content: 'Dummy content for the mail app!',
    time: '5:40 pm',
    isRead: true,
  ),
  MailItem(
    title: 'Instagram',
    description: 'Waste of time if you use alot',
    content: 'Dummy content for the mail app!',
    time: '5:30 pm',
    isRead: false,
  ),
  MailItem(
    title: 'Quora',
    description: 'Read more content',
    content: 'Dummy content for the mail app!',
    time: '12:20 pm',
    isRead: false,
  ),
  MailItem(
    title: 'Medium',
    description: 'Flutter 2.0 is waiting.',
    content: 'Dummy content for the mail app!',
    time: '1:00 pm',
    isRead: false,
  ),
  MailItem(
    title: 'FreeIcon',
    description: 'Get the best free icons',
    content: 'Dummy content for the mail app!',
    time: '4:00 am',
    isRead: true,
  ),
  MailItem(
    title: 'Jio',
    description: 'Your plan is about to expire',
    content: 'Dummy content for the mail app!',
    time: '2:00 am',
    isRead: false,
  ),
  MailItem(
    title: 'Google',
    description: 'This mail is from google',
    content: 'Dummy content for the mail app!',
    time: '9:00 pm',
    isRead: false,
  ),
];
