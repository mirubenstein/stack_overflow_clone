describe Question do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :question }
end
