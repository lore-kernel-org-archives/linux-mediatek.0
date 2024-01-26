Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4619EC47DDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 02:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1u6tFWnaDpsTXyzP7hk3MsxX22qkV4reJwZJVs9h+OQ=; b=m19SAl1a3ejw+t/TZla3tONoM9
	tfHr9qfmcTIwocYJbcnQzFrxzQ7bJUy9ti5sxQE9+VBDf9wd2c8/S6q0nc7c6DCqjR7Dig4Px30EW
	TFkfvyAU6DzXMybATbO/Q4amrEgktkrJzv0JakjoDPUR4d0WlS1eflpIdRrYoJxPG6Rgn1mI+p61h
	aaoZrZHCyuCTOxILVU66TTpwFvese2FlIeowe6AtwghGEedtkSjHWXQYoI2xmlB8CB8BUz6+0twzS
	XYvIxbRtJD8EyKmO67wB12tp0cRFXRgt+F4eqFS0odT1zl8kh6guDQ99RLnUSGCd1j9xWl2t0KxUI
	RQJ3FigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBpU-00000002r9a-3uA5;
	Fri, 26 Jan 2024 02:20:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBpR-00000002r8i-3lfU;
	Fri, 26 Jan 2024 02:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A65826239C;
	Fri, 26 Jan 2024 02:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DE65C43390;
	Fri, 26 Jan 2024 02:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706235624;
	bh=XydMzCkZqpTSrk2ptn7qOu5OKTaNmw3EnRJU88OcBbQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VexiKbuh70fuOyNI3mszktMmJESVD9zUPTEjBgzUiBCtSFQ+XTs6+rx27uAfLJx7J
	 gVQg+WDfvETqIlZR92KWLUkcZCiFXFZUM3alPeQ3LyFc63hKgbSy+PEe3w5Y0M8DRn
	 crNaRswG1FV3X29jUynaEYvdGAF3MVRYfqH8Pr/yU3daeLBdzKd2pKpEJbPAwnKfIo
	 s6WdLyL/SEgpxlyJd+AGxDxrq9HCT+56iidx/3GuLp6PnQYGRsHCFD5J37EkUhg4qC
	 uprI5WdHRxFYMfkqb1S9RQ0JAYMAlq4BER547AR2YYP94AILLMq6MOb5rXFooWi22A
	 zHJ23XmM44deA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33BF9DFF765;
	Fri, 26 Jan 2024 02:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: phy: mediatek-ge-soc: sync driver with MediaTek SDK
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170623562420.30678.3476943936130627365.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jan 2024 02:20:24 +0000
References: <f2195279c234c0f618946424b8236026126bc595.1706071311.git.daniel@makrotopia.org>
In-Reply-To: <f2195279c234c0f618946424b8236026126bc595.1706071311.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: dqfext@gmail.com, SkyLake.Huang@mediatek.com, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 john@phrozen.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_182025_997899_37DCCE2D 
X-CRM114-Status: UNSURE (   8.06  )
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

On Wed, 24 Jan 2024 05:18:23 +0000 you wrote:
> Sync initialization and calibration routines with MediaTek's reference
> driver. Improves compliance and resolves link stability issues with
> CH340 IoT devices connected to MT798x built-in PHYs.
> 
> Fixes: 98c485eaf509 ("net: phy: add driver for MediaTek SoC built-in GE PHYs")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net] net: phy: mediatek-ge-soc: sync driver with MediaTek SDK
    https://git.kernel.org/netdev/net/c/ff63cc2e9506

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



