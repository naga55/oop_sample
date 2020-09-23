require 'rails_helper'

RSpec.describe CreateArticleAndSendMail, type: :model do
  describe "#save" do
    let(:mock_article) { instance_double('article', save: return_save) }
    let(:decorator) { CreateArticleAndSendMail.new(mock_article) }

    context "保存に成功した場合" do
      let(:return_save) { true }
      before { allow(ArticleMailer).to receive_message_chain(:new_article, :deliver_now) { true } }

      it do
        expect(decorator.save).to be_truthy
        expect(ArticleMailer).to have_received(:new_article).with(mock_article)
      end
    end

    context "保存に失敗した場合" do
      let(:return_save) { false }
      before { allow(ArticleMailer).to receive_message_chain(:new_article, :deliver_now) { true }}

      it do
        expect(decorator.save).to be_falsey
        expect(ArticleMailer).not_to have_received(:new_article).with(mock_article)
      end
    end
  end
end
