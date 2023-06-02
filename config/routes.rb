Rails.application.routes.draw do
  resources :permissions do
    get '/page/:page', action: :index, on: :collection
  end

  resources :daily_statements do
    get '/page/:page', action: :index, on: :collection
  end

  resources :chambers do
    get '/page/:page', action: :index, on: :collection
  end

  get 'generate_pdf', to: 'home#generate_pdf'
  get 'generate_csv', to: 'home#generate_csv'

  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :chambers do
        get '/page/:page', action: :index, on: :collection
      end
      resources :daily_statements do
        get '/page/:page', action: :index, on: :collection
      end
      resources :permissions do
        get '/page/:page', action: :index, on: :collection
      end
      devise_scope :user do
        post 'sign_up', to: 'registrations#create'
        post 'sign_in', to: 'sessions#create'
        delete 'sign_out', to: 'sessions#signout'
      end
    end
  end
  resources :users
  root 'home#index'
end

# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                              permissions GET    /permissions(.:format)                                                                            permissions#index
#                                          POST   /permissions(.:format)                                                                            permissions#create
#                           new_permission GET    /permissions/new(.:format)                                                                        permissions#new
#                          edit_permission GET    /permissions/:id/edit(.:format)                                                                   permissions#edit
#                               permission GET    /permissions/:id(.:format)                                                                        permissions#show
#                                          PATCH  /permissions/:id(.:format)                                                                        permissions#update
#                                          PUT    /permissions/:id(.:format)                                                                        permissions#update
#                                          DELETE /permissions/:id(.:format)                                                                        permissions#destroy
#                         daily_statements GET    /daily_statements(.:format)                                                                       daily_statements#index
#                                          POST   /daily_statements(.:format)                                                                       daily_statements#create
#                      new_daily_statement GET    /daily_statements/new(.:format)                                                                   daily_statements#new
#                     edit_daily_statement GET    /daily_statements/:id/edit(.:format)                                                              daily_statements#edit
#                          daily_statement GET    /daily_statements/:id(.:format)                                                                   daily_statements#show
#                                          PATCH  /daily_statements/:id(.:format)                                                                   daily_statements#update
#                                          PUT    /daily_statements/:id(.:format)                                                                   daily_statements#update
#                                          DELETE /daily_statements/:id(.:format)                                                                   daily_statements#destroy
#                                 chambers GET    /chambers(.:format)                                                                               chambers#index
#                                          POST   /chambers(.:format)                                                                               chambers#create
#                              new_chamber GET    /chambers/new(.:format)                                                                           chambers#new
#                             edit_chamber GET    /chambers/:id/edit(.:format)                                                                      chambers#edit
#                                  chamber GET    /chambers/:id(.:format)                                                                           chambers#show
#                                          PATCH  /chambers/:id(.:format)                                                                           chambers#update
#                                          PUT    /chambers/:id(.:format)                                                                           chambers#update
#                                          DELETE /chambers/:id(.:format)                                                                           chambers#destroy
#                             generate_pdf GET    /generate_pdf(.:format)                                                                           home#generate_pdf
#                             generate_csv GET    /generate_csv(.:format)                                                                           home#generate_csv
#                         new_user_session GET    /users/sign_in(.:format)                                                                          devise/sessions#new
#                             user_session POST   /users/sign_in(.:format)                                                                          devise/sessions#create
#                     destroy_user_session DELETE /users/sign_out(.:format)                                                                         devise/sessions#destroy
#                        new_user_password GET    /users/password/new(.:format)                                                                     devise/passwords#new
#                       edit_user_password GET    /users/password/edit(.:format)                                                                    devise/passwords#edit
#                            user_password PATCH  /users/password(.:format)                                                                         devise/passwords#update
#                                          PUT    /users/password(.:format)                                                                         devise/passwords#update
#                                          POST   /users/password(.:format)                                                                         devise/passwords#create
#                 cancel_user_registration GET    /users/cancel(.:format)                                                                           devise/registrations#cancel
#                    new_user_registration GET    /users/sign_up(.:format)                                                                          devise/registrations#new
#                   edit_user_registration GET    /users/edit(.:format)                                                                             devise/registrations#edit
#                        user_registration PATCH  /users(.:format)                                                                                  devise/registrations#update
#                                          PUT    /users(.:format)                                                                                  devise/registrations#update
#                                          DELETE /users(.:format)                                                                                  devise/registrations#destroy
#                                          POST   /users(.:format)                                                                                  devise/registrations#create
#                           api_v1_sign_up POST   /api/v1/sign_up(.:format)                                                                         api/v1/registrations#create {:format=>:json}
#                           api_v1_sign_in POST   /api/v1/sign_in(.:format)                                                                         api/v1/sessions#create {:format=>:json}
#                          api_v1_sign_out DELETE /api/v1/sign_out(.:format)                                                                        api/v1/sessions#signout {:format=>:json}
#                                    users GET    /users(.:format)                                                                                  users#index
#                                          POST   /users(.:format)                                                                                  users#create
#                                 new_user GET    /users/new(.:format)                                                                              users#new
#                                edit_user GET    /users/:id/edit(.:format)                                                                         users#edit
#                                     user GET    /users/:id(.:format)                                                                              users#show
#                                          PATCH  /users/:id(.:format)                                                                              users#update
#                                          PUT    /users/:id(.:format)                                                                              users#update
#                                          DELETE /users/:id(.:format)                                                                              users#destroy
#                                     root GET    /                                                                                                 home#index
#         turbo_recede_historical_location GET    /recede_historical_location(.:format)                                                             turbo/native/navigation#recede
#         turbo_resume_historical_location GET    /resume_historical_location(.:format)                                                             turbo/native/navigation#resume
#        turbo_refresh_historical_location GET    /refresh_historical_location(.:format)                                                            turbo/native/navigation#refresh
#            rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#       edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
#            rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#                                          PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
# new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
# rails_conductor_inbound_email_incinerate POST   /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                            rails/conductor/action_mailbox/incinerates#create
#                       rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create
