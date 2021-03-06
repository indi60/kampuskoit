class Univbeasiswa < ActiveRecord::Base
	belongs_to :univ, :foreign_key => :univ_id

	validates :nama_beasiswa, presence: true, length: { maximum: 255 }, :uniqueness => { :scope => [:instansi, :periode, :univ_id], case_sensitive: false }
	validates :instansi, presence: true, length: { maximum: 255 }
	validates :periode, presence: true, length: { maximum: 10 }
	validates :nilai, presence: true
	validates :univ, presence: true
end
