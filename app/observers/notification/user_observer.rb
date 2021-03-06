# encoding: UTF-8
class Notification::UserObserver < ActiveRecord::Observer
  observe :user

  def after_save(record)
    return unless record.account && record.account_id_changed?
    record.account.users.each do |account_user|
      next if account_user == record # don't get notified when I join
      Notification::NewUser.create!(recipient:account_user, subject:record)
    end
  ensure
    return true
  end

end
