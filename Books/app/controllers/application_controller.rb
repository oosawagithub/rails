class ApplicationController < ActionController::Base


	#deviseを利用する機能（ユーザ登録、ログイン認証など）が実行される前に、configure_permitted_parametersが実行されます。
	before_action :configure_permitted_parameters, if: :devise_controller?

	#before_actionで指定されたメソッドはこのコントローラが実行される前に実行されます
	#今回の場合、app/controllers/application_controller.rbに記述したので、全てのコントローラで、最初にこのアクションメソッドが実行されます。
	#authenticate_userはdeviceで用意されているメソッドです。
	#:authenticate_user!とすることによってログイン認証がされていなければrootパスへリダイレクトするという機能を実装する


	def after_sign_up_path_for(resource)
	  flash[:sign_up] = " signup successfully."
      user_path(current_user)
    end

    def after_sign_in_path_for(resource)
      flash[:sign_in] = " signin successfully."
      user_path(current_user)
    end

    def after_sign_out_path_for(resource)
       flash[:sign_out] = "signout successfully."
       root_path
    end

	protected

	#configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています
	#今回の場合、ユーザ登録(sign_up)の際、ユーザ名(name)のデータ操作が許可されることになります。
	#protectedは呼び出された他のコントローラからも参照ができるストロングパラメータとなります。
		def configure_permitted_parameters

			devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
			devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
			devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])

		end

end
