class Prodi < ActiveRecord::Base
	extend FriendlyId
	include ThinkingSphinx::Scopes	
	
	belongs_to :univ, :foreign_key => :univ_id
	belongs_to :kota, :foreign_key => :kota_id
	belongs_to :jenjang_prodi, :foreign_key => :jenjang_prodi_id
	has_many :prodi_prestasis, :dependent => :delete_all
	has_many :prodi_fasils, :dependent => :delete_all
	has_many :prodi_silabuses, :dependent => :delete_all
	has_many :prodi_galleries, :dependent => :delete_all
	has_many :prodi_akreditasis, :dependent => :delete_all
	has_many :prodi_biayas, :dependent => :delete_all

	validates :nama_prodi, presence: true, length: { maximum: 255 }, :uniqueness => { :scope => [:jenjang_prodi_id, :univ_id], case_sensitive: false }
	validates :fakultas, presence: true
	validates :tahun_berdiri, presence: true
	validates :alamat, presence: true
	validates :telepon, presence: true
	validates :website, presence: true
	validates :univ, presence: true
	validates :kota, presence: true
	validates :jenjang_prodi, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	#validates :slug, presence: true
	friendly_id :nama_prodi, :use => :scoped, :scope => :univ

	mount_uploader :logo, ProdiLogoUploader
	mount_uploader :featured_image, ProdiFeaturedImageUploader

	before_validation :add_url_protocol

	#url validation
	protected

	def add_url_protocol
			unless self.website[/^http:\/\//] || self.website[/^https:\/\//]
				self.website = 'http://' + self.website
			end
	end

end
