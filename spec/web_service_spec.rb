describe "Web Service" do
  it "should validate correct" do
    WebService.validateText("Hellp, #inspect").should == ["Hellp"]
    WebService.validateText("Hello, #inspect").should == []

  end
end