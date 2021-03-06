class ProdiFasil < ActiveRecord::Base
	belongs_to :prodi, :foreign_key => :prodi_id
	has_many :prodi_fasilitas_galleries, :dependent => :delete_all

	validates :fasilitas, presence: true, uniqueness: { case_sensitive: false }
	validates :prodi, presence: true
end
