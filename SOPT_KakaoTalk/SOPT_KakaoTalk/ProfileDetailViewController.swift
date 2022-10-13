import UIKit
import SnapKit

//MARK: - ProfileDetailViewController
class ProfileDetailViewController: UIViewController {
    
    //MARK: - UI Components
    private let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "profile_closeBtn"), for: .normal)
        
        return button
    }()
    
    private let profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        
        return stackView
    }()
    
    private let profileView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_userImg")
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "김민"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        
        return label
    }()
    
    private let menuLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        
        return stackView
    }()
    
    //chat button
    private let chatContainerView:  UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let chatView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let chatImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileTalkImg")
        
        return imageView
    }()
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        
        return label
    }()
    
    //edit profile button
    private let editProfileContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let editProfileView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let editProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_editImg")
        
        return imageView
    }()
    
    private let editProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        
        return label
    }()
    
    
    //kakaoStory Button
    private let kakaoStoryContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let kakaoStoryView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let kakaoStoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileStoryImg")
        
        return imageView
    }()
    
    private let kakaoStoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        
        return label
    }()
    
    //MARK: - Private functions
    private func addViewTapGestures() {
        let chatViewGesture = UITapGestureRecognizer(target: self, action: #selector(touchupChatContainerView))
        chatContainerView.addGestureRecognizer(chatViewGesture)
        
        let editProfileViewGesture = UITapGestureRecognizer(target: self, action: #selector(touchupEditProfileContainerView))
        editProfileContainerView.addGestureRecognizer(editProfileViewGesture)
        
        let kakaoStoryViewGesture = UITapGestureRecognizer(target: self, action: #selector(touchupKakaoStoryContainerView))
        kakaoStoryContainerView.addGestureRecognizer(kakaoStoryViewGesture)
    }
    

    //MARK: - Objc functions
    @objc func touchupChatContainerView() {
        print("나와의 채팅 클릭됨!")
    }
    
    @objc func touchupEditProfileContainerView() {
        print("프로필 편집 클릭됨!")
    }
    
    @objc func touchupKakaoStoryContainerView() {
        print("카카오스토리 클릭됨!")
    }

    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout()
        self.config()
        self.addViewTapGestures()
    }
}

//MARK: - Extensions
extension ProfileDetailViewController {
    
    //MARK: - Layout
    private func layout() {
        view.addSubviews([backButton, profileStackView, menuStackView, menuLineView])
        profileView.addSubview(profileImageView)
        
        [profileView, nameLabel].forEach {
            profileStackView.addArrangedSubview($0)
        }
        
        [chatContainerView, editProfileContainerView, kakaoStoryContainerView].forEach {
            menuStackView.addArrangedSubview($0)
        }
        
        chatContainerView.addSubviews([chatView, chatLabel])
        chatView.addSubviews([chatImageView])
        
        editProfileContainerView.addSubviews([editProfileView, editProfileLabel])
        editProfileView.addSubviews([editProfileImageView])
        
        kakaoStoryContainerView.addSubviews([kakaoStoryView, kakaoStoryLabel])
        kakaoStoryView.addSubviews([kakaoStoryImageView])
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(13)
            make.height.equalTo(14)
        }
        
        menuStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-47)
            make.centerX.equalToSuperview()
            make.width.equalTo(288)
            make.height.equalTo(72)
        }
        
        chatView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.centerX.equalToSuperview()
            make.height.equalTo(19)
            make.width.equalTo(19)
        }
        
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(self.chatView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        chatImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        editProfileView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.centerX.equalToSuperview()
            make.height.equalTo(19)
            make.width.equalTo(19)
        }
        
        editProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(self.chatView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        editProfileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        kakaoStoryView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.centerX.equalToSuperview()
            make.height.equalTo(19)
            make.width.equalTo(19)
        }
        
        kakaoStoryLabel.snp.makeConstraints { make in
            make.top.equalTo(self.chatView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        kakaoStoryImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        menuLineView.snp.makeConstraints { make in
            make.bottom.equalTo(self.menuStackView.snp.top).offset(-12)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        profileStackView.snp.makeConstraints { make in
            make.bottom.equalTo(self.menuLineView.snp.top).offset(-42)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(130)
        }

        
        profileView.snp.makeConstraints { make in
            make.width.equalTo(profileView.snp.height).multipliedBy(1.0 / 1.0)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
    
    //MARK: - Config
    private func config() {
        view.backgroundColor = UIColor(red: 133/255, green: 145/255, blue: 153/255, alpha: 1.0)
    }

}

