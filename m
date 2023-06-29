Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387C0EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 19:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgG/btx9KPMGl1FKjkfOdugTyS7tAwC6bfnktFxF9EA=; b=pmXfyZcLtV/T7C89wbes02JiLe
	4Y4tVdF0N+0snGpjn4HkIf8pGO0Zo2PHehYDvYRIrpij+9IoJu5l/o8k9fJn/PoG317ix7IxO664F
	Lz88msYE6nu2Vo75ZhoNBA8KpRkXx1AYi2LMK3K1TWT/cW0D8KYvUsdsG27qI0h6OKLXfdgXxc8fQ
	d7HlbwSdNlA68JBYCAichW3UVceSxjkaGH7yD7SLuojGp4aWV5UC1BDfhpbUzp2bTzxKfeJh9AhLm
	UthKbrAMX3d8RAF8mCSxxTYF/hG7EEOwLEF3fksjVJc7M6SAFJZ57fjKNVPdo0IFoaa7emXlP7X6S
	+zF5tEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qExG9-001wN9-02;
	Thu, 29 Jun 2023 19:24:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qExG2-001wJQ-0O
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jun 2023 19:24:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D87861626;
	Thu, 29 Jun 2023 19:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB296C433CB;
	Thu, 29 Jun 2023 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688066683;
	bh=L9C7oOakDN59nBwxio4rrnZ5puCMWHaJhaQkT95aTVs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tIh/Xv1fjjFllaWns4oz4Nak8x4gAUKrBLHf7Xgu65f26Q6G0PLLaEcyWYQ7zNkOL
	 5oKn78ofQ2lwfXdUb7ncxnpUZe7vY4e0Dop96CCxzxZLND6S/yBdP+OEVSiYaKdh7a
	 CfZaBLGa/siBHomfr/EGpOAQRVBrAKG40/LIx+uiCJB6MtHk3Od7iycx7nKZSBDTgU
	 JHeFB1GLERTyamYrx0gI7Zpcu7kdSqFQmLgDjZDl2qxFFjrNJg8pgKHqoP7jFqMCPw
	 v0RkKgxaMVPeC3WZOv5McxSh7ujI6LttGFY8RGRLQC4lTSm5jwjVkzIM+92X79N1x8
	 BIoHXxjErQXqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A334AE5381B;
	Thu, 29 Jun 2023 19:24:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 1/3] Bluetooth: btusb: mediatek: readx_poll_timeout
 replaces open coding
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <168806668365.29593.2167157062342737212.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jun 2023 19:24:43 +0000
References: <80efe66b16d933e3457bd38b1a60a5d51d4dee9e.1687991820.git.objelf@gmail.com>
In-Reply-To: <80efe66b16d933e3457bd38b1a60a5d51d4dee9e.1687991820.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 chris.lu@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, jenhao.yang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com,
 michaelfsun@google.com, mmandlik@google.com, abhishekpandit@chromium.org,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_122446_500359_EBFC5777 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 29 Jun 2023 06:54:55 +0800 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Use readx_poll_timeout instead of open coding to poll the hardware reset
> status until it is done.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> 
> [...]

Here is the summary with links:
  - [v8,1/3] Bluetooth: btusb: mediatek: readx_poll_timeout replaces open coding
    https://git.kernel.org/bluetooth/bluetooth-next/c/c56e5f834e13
  - [v8,2/3] Bluetooth: btmtk: introduce btmtk reset work
    https://git.kernel.org/bluetooth/bluetooth-next/c/ed2e80b8b6a7
  - [v8,3/3] Bluetooth: btusb: mediatek: add MediaTek devcoredump support
    https://git.kernel.org/bluetooth/bluetooth-next/c/872f8c253cb9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



