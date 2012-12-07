class Post < ActiveRecord::Base
  attr_accessible :text, :title
  #Это изменение позволяет быть уверенным, что все изменения, сделанные с помощью формы HTML, смогут отредактировать содержимое полей text и title.


  validates :title, :presence => :true,
                    :length => { :minimum => 5}

  #Эти изменения позволят быть уверенным, что все публикации имеют заголовок длиной как минимум пять символов

  has_many :comments

end
