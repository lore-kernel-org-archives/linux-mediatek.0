Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C09CFF8867
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 00:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+hOZla+fHGrW+nOCfLkGxd3pKOnpc+0h1833Nj+FZY=; b=hixtwyOSX+04badt2C2Zy4/QmS
	aHwFnOcgm5IaOC87a3Q0H5djy6jHbktxdsxOGoqTJs5R3I4tC/SUjbzW3zOaMfQMbEFQIi4LH3HKx
	fm/WkefU06GR2NeZ5psOI1xlM2HsGmKK5LlKPqP2NiLMdrefnqJnbArLFrHc1tZRpE1KifOM8JXKV
	Pwj0gfxBFgEq0g7ON+azPrWdxADgTW6o5y0j/SjEJytRD1aK6AVc4b926aGm50RFeCHEOPrRYgVTk
	Q0fu8gihacLl1U4GPeaJNQgQR5VfSJmGfpC89aaM7ARRL6mvaeOsE4rRMQET8MKRVR/S5Ixp6oinT
	wws8zxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfM-00000000MDl-1n52;
	Tue, 28 Apr 2026 00:51:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfG-00000000MB2-0wWQ;
	Tue, 28 Apr 2026 00:51:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67CE542E0B;
	Tue, 28 Apr 2026 00:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DAC2BCB4;
	Tue, 28 Apr 2026 00:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777337461;
	bh=5Ri8joccBWwhmyuhXiC1KxUz9bPRfRNan1t6eJUwBF4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k/aPE3NirdiDQEeSxlWHEYdYma2Gt4QD1ICwCL3RppzMGrxq4x5PPRsdu1O5O3vcT
	 HRyB4Pj8E8O3od1jV6iC+qskIf4y0Nn5qgNuYlCkz86B9z4UhjXzafXqDgJn09da2q
	 Jw3BSmi+p0UMVPNEZmpnJ0GJnMYsbFk5RN8wApJp8ToBQ9gl2NutZ0AnBgej8dFvRu
	 5ph/tP2NSdDUw6y6gawin3dyCEYam3PDkQp6cuyrugSitv7iI151oV37TyZEnpnSPS
	 aXNEApI3//fwf8tW7kldmzAaxvuqQhtohcSf7IdjqvkufqT8cLqCo4ihLssvPDhNeO
	 q6xVIv2b3lneg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9D0838119DB;
	Tue, 28 Apr 2026 00:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: stop net_device TX queue before updating
 CPU index
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177733741829.177472.11417413578434219767.git-patchwork-notify@kernel.org>
Date: Tue, 28 Apr 2026 00:50:18 +0000
References: <20260421-airoha-xmit-stop-condition-v1-1-e670d6a48467@kernel.org>
In-Reply-To: <20260421-airoha-xmit-stop-condition-v1-1-e670d6a48467@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_175102_326978_E1023888 
X-CRM114-Status: UNSURE (   9.27  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 21 Apr 2026 08:43:07 +0200 you wrote:
> Currently, airoha_eth driver updates the CPU index register prior of
> verifying whether the number of free descriptors has fallen below the
> threshold.
> Move net_device TX queue length check before updating the TX CPU index
> in order to update TX CPU index even if there are more packets to be
> transmitted but the net_device TX queue is going to be stopped
> accounting the inflight packets.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: stop net_device TX queue before updating CPU index
    https://git.kernel.org/netdev/net/c/3854de7b38be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



