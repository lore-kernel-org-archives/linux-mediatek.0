Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9E9C36002
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Mar 2025 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvDFGa0AiC4mciFUVZshqlfDKr+59gJqRmAfgNgMOCw=; b=2CDzduy9uc3uP4EV0IPE0GfNzD
	RzTbQAuv1OAMRvprxau8vJOZ5es8yA5ODIXVLiYj8xJDzIEFOOEgrHKs5ZP5U7scr7iOATb4GiVD0
	tyJCdU9O6ct8wbc92a8IwliYRhPOPkn5sN594G8zQ0cvAvif19lQfiwbwB3wSRXfkdYewFHDqrnj6
	piqIPp/pgrec1NiBfcjKa7Whob+tx8k7TkeGdvj9srgvRqBkx4wvA52q2eWkPO+18eC3PticOdwDb
	jUd3pGNxKnDRA0s/7/qzolPQUqkj+R4H2km29dEuX7Erfup3uXishmxnUzH/CHUwgRuVmeYcJNO1l
	kyyXHLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvL7l-0000000D0Zd-0LTb;
	Thu, 20 Mar 2025 19:00:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvL7i-0000000D0Xf-3Fi2
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Mar 2025 19:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 175F2A4965B;
	Thu, 20 Mar 2025 18:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194D4C4CEDD;
	Thu, 20 Mar 2025 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742497209;
	bh=6fanAW7Ye2sXSBOuAm9kPC3g0KEELfp9nEJRpCc3foA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Tq5wk36++F0UVn4WlaOwBP9t5bSKS9tPuAXNLKMTwWeV1/LdCtr5wM/2nA0ItFmMB
	 fWN7gRkymKE8O4tMtvAlscQjSj974pHJknpLxSaCA70JdkrIWKplewWvf32hrwVT1e
	 04r6rCNAc5wth33x+miWdzM8uXlndBxMsZ+pSLtSx+F927NmKv54rr0WvWADt935yx
	 zeTaAScGB3TXq5vH+2uspg9VsyD0KGavNhUV4KWaDHjrQ86Xrdkzj50UUfmhO7jiNi
	 XP8ueedyXyrJmH58W7Kx5zeJFOpyCzKs2BDZilKpqGcCPA1CyzgrwOIgSlopvhYYRu
	 uugDkP+lCoQXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34C183806654;
	Thu, 20 Mar 2025 19:00:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtksdio: Prevent enabling interrupts after IRQ
 handler removal
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <174249724504.1878155.13264790532381616265.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 19:00:45 +0000
References: <20250312012522.53604-1-sean.wang@kernel.org>
In-Reply-To: <20250312012522.53604-1-sean.wang@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, sean.wang@mediatek.com,
 pedro.tsai@mediatek.com, felix.freimann@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_120010_895515_063A4907 
X-CRM114-Status: UNSURE (   8.13  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 11 Mar 2025 18:25:22 -0700 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Ensure interrupts are not re-enabled when the IRQ handler has already been
> removed. This prevents unexpected IRQ handler execution due to stale or
> unhandled interrupts.
> 
> Modify btmtksdio_txrx_work to check if bdev->func->irq_handler exists
> before calling sdio_writel to enable interrupts.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtksdio: Prevent enabling interrupts after IRQ handler removal
    https://git.kernel.org/bluetooth/bluetooth-next/c/01c13f057bb7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



