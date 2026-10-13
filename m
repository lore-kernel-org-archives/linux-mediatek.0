Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63991CC6B08
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kyLZJ/2rfXN5bZbtrxEBotazNxgP7vYhNpb4oPxzhY=; b=kQYyDqMZFaqGPi8Cm41WAVIlNY
	bVqwvVxOTpPPVthrvOBwKiUTYUKQr0nHwc3f3lSovN7LrG5bB6i+NTo6lNkpOtT2dYtCGj/vouNIt
	pTZ+t48iN6iAfGdw5ch/Bd09C6SaeTLnrOtUux5zJW1HYHgc7RUJntCaPsCY4xd1eB7skhiULio9E
	UgXU+Dli369qEjmMPRtb9GJiu4WM+SJUpz02q5PHMzyLILmIXSBBj4fVEOI5BLhe6B8w3VJi05fYV
	zNWe4uFYbV4PVKxWnfzvQaTPOrwtNZZqZ0CK5iOKdpQmsNBZdo06pN5O9jiox2unX0rPVi8/7mUHU
	BHDxb62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdMR-0000000D4NR-15QK;
	Tue, 13 Oct 2026 14:20:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdMQ-0000000D4Mh-0qas
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 14:20:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E2AE4394B;
	Tue, 13 Oct 2026 14:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F901F00893;
	Tue, 13 Oct 2026 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901209;
	bh=2kyLZJ/2rfXN5bZbtrxEBotazNxgP7vYhNpb4oPxzhY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MfpQ2EdMaE/194szPZg+JGL4yINUy7oRhQg0hdw31KFf74oNOPNS8kK/cJrAyA+W2
	 rbTeJJb2NXa3k8EUAxzg6tScLag8ug1HgMus1vXP8NV7tUetCFLgJHnC2yE2ugkbNd
	 JCYIX2hA1dRvfRt3yrcu+DzOXB57eVP+HZeeZQsqDodV/xA6XReGIvZIPts1L20wDU
	 UpHSM6AH2/oTLaVugq3voH2RknWEPV8j0vHViu3vAKopVFNTNewwwoWkcvtxu+KWpp
	 /6d1ixxn17pW4QpB+YrA0jMZxZ79GYSvo5OFRmv9yhnN8J+61xHyEZ8cH0PHIh38O5
	 sHUXH1PrOGISw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773FA39D237D;
	Tue, 13 Oct 2026 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] Bluetooth: btmtk: Add MT7928 support
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <179190120801.334087.12991106842776362785.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 14:20:08 +0000
References: <20261008085559.813654-1-chris.lu@mediatek.com>
In-Reply-To: <20261008085559.813654-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, will-cy.Lee@mediatek.com, ss.wu@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 8 Oct 2026 16:55:59 +0800 you wrote:
> Add support for MT7928 (internal device ID is MT7935) which requires
> additional firmware (CBMCU firmware) loading before Bluetooth firmware.
> 
> CBMCU is a new component on MT7928 to handle common part shared across
> the combo chip, providing a better user experience through improved
> coordination between subsystems.
> 
> [...]

Here is the summary with links:
  - [v4] Bluetooth: btmtk: Add MT7928 support
    https://git.kernel.org/bluetooth/bluetooth-next/c/2c5f7c9b12f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



