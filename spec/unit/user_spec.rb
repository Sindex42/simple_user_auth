describe User do
  let!(:user) { User.create(email: 'test@test.com', password: 'secret123')}
  let(:user2) { User.create(email: 'test@test.com', password: 'secret123')}
  let(:user_short) {User.create(email: 'short@password.com', password: 'a')}
  describe '#authenticate' do
    it "returns nil if user doesn't exist" do
      expect(User.authenticate('wrong@email.com', 'wrongpassword')).to eq nil
    end

    it "returns nil if wrong password" do
      expect(User.authenticate('test@test.com', 'wrongpassword')).to eq nil
    end

    it 'returns the user if user exists and password is correct' do
      expect(User.authenticate('test@test.com', 'secret123')).to eq user
    end
  end

  describe '#valid?' do
    it 'checks to see if the user email exists' do
      expect(user.valid?).to eq true
    end

    it "checks to see if the user is unique" do
      expect(user2.valid?).to eq false
    end
  end
end
