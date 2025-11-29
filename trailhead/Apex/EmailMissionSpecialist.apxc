public class EmailMissionSpecialist {

    public PageReference sendReadyForLaunchEmail() {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        String[] toAddresses = new String[] { UserInfo.getUserEmail() };
        mail.setToAddresses(toAddresses);

        mail.setSubject('Launch Site Status: Ready for Launch');
        mail.setPlainTextBody('The system checks are complete. The launch site is ready for launch. Please proceed with the final countdown.');

        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

        if (results[0].isSuccess()) {
            System.debug('Email send successfully!');
        } else {
            System.debug('Email failed to send: ' + results[0]);
        }
        return null;
    }
}