require "rails_helper"

  describe TaskMailer, type: :mailer do
    let(:task) { FactoryBot.create(:task, name: 'メイラースペックを書く', description: '送信したメールの内容を確認します')}
    let(:text_body) do
      part = mail.body.parts.detect { |part| part.content_type == 'text/plain; charset=UTF-8' }
      part.body.raw_source
    end
    let(:html_body) do
      part = mail.body.parts.detect { |part| part.content_type == 'text/html; charset=UTF-8' }
    end
  end

  describe '#creation_email' do
    #TODO
    let(:mail) { TaskMailer.creation_email(task) }

    it '想定通りのメールが生成されている' do
      expect(mail.subject).to eq('タスク作成完了メール')
      expect(mail.to).to eq(['user@example.com'])
      expect(mail.from).to eq(['taskleaf@example.com'])

      expect(text_body).to match('以下のタスクを作成しました')
      expect(text_body).to match('メイラーSpecを書く')
      expect(text_body).to match('送信したメールの内容を確認します')

      expect(html_body).to match('以下のタスクを作成しました')
      expect(html_body).to match('メイラーSpecを書く')
      expect(html_body).to match('送信したメールの内容を確認します')
    end
  end