require 'station'

describe Station do
  context "name is" do
    it "will tell you the name of the station" do
      expect(subject).to respond_to(:name)
    end
  end
  context "zone is" do
    it 'tells you what zone it is in' do
      expect(subject.zone).to eq(1)
    end
  end
end
