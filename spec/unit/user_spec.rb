describe User do
  describe '#authenticate' do
    let!(:user) { User.create(email: 'test@test.com', password: 'secret123')}

    it "returns nil if user doesn't exist" do
      expect(User.authenticate('invalid@test.com', 'wrongpassword')).to eq nil
    end

    it "returns nil if wrong password" do
      expect(User.authenticate('test@test.com', '123')).to eq nil
    end
  end
end
