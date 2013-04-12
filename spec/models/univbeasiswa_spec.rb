require 'spec_helper'

describe Univbeasiswa do
  before { @univbeasiswa = Univbeasiswa.new(nama_beasiswa: "IKA ITS Scholarship", instansi:"IKA ITS", periode:"2014", nilai:"500.000") }

  subject{ @univbeasiswa }
  it { should respond_to(:nama_beasiswa) }
  it { should respond_to(:instansi) }
  it { should respond_to(:periode) }
  it { should respond_to(:nilai) }

  it { should belong_to(:univ) }

  describe "When nama_beasiswa is blank" do
    before { @univbeasiswa.nama_beasiswa = " " } 
    it { should_not be_valid }
  end

  describe "When instansi is blank" do
    before { @univbeasiswa.instansi = " " }
    it { should_not be_valid }
  end
  describe "When periode is blank" do
    before { @univbeasiswa.periode = " " } 
    it { should_not be_valid }
  end

  describe "When nilai is blank" do
    before { @univbeasiswa.nilai = " " }
    it { should_not be_valid }
  end
end
