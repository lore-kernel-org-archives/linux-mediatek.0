Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0184C07E8E
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 11:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ib4Jnpik5LK6IxLKwjqmweYbi/kSjHrLQkuwFIzHViU=; b=W36e+Ci94IqwvQvhngh16fkqdI
	TnRF96pc/YKl86ayc/tBPwm+AYyCD1uMKOPT6yKGslWfiycscemwFaEbr6B0U16prRcrG6o477b/I
	RKNgt4E7IapLrLrsTD30pugJD6Bm5oC+WK5SYWY/kRnrRRCs0eP9XIrBS0GKnyySsm6twrZNhVAlc
	zBulT1UqCD1Tftz5pVQCxZtDOTRa6KnsFSfECNq3MCseTuJZWuUBXjsBzuYBRso9TFQESVeXjfFX6
	j8Rx1w9CHlSDU9GBIl3NVt+jOoEw6z14cBJ7Rs6+VhvEh9dkiyXi2E5RYaTl9e9C8jbdFT9Kj+zGA
	6S7KDLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaWR-00000003quy-3rvn;
	Wed, 24 Apr 2024 11:10:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaWE-00000003qm2-31Im;
	Wed, 24 Apr 2024 11:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CB746197E;
	Wed, 24 Apr 2024 11:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E210BC32781;
	Wed, 24 Apr 2024 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713957026;
	bh=Ckxhz825vmza6vvWz/TLutSmlDWafm3SUwU+g4hqtAQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bVAGBNaM7DF00r6IsRzTLUj8CSJoy9XYR8ymyWFycWjZFrAU5SQq81tGhcuF2U/PC
	 eUKTwL0QBd9POnCBbt8hJ9uLWdFYiP30TmXHtXKwCdUOYyidMwCqxJn/IRevcBVjOU
	 55o+uv9QjLsMcdxJ/cKynz16F9GJPeYzm+bZKDqKWbKnMDOkg2MoiLb3Lh5yY73Tjc
	 lQTG3EplQ3d9F44iTDCFeGVwg71NNMOA7/oSg33U0qPK9uxkOwu0YOVMwl1a2NnGj6
	 SwbiUdScEGocf1tJ4IL3p7Tn947X9d5nZH7VEodftC4Br2fDlxnbbOPhn8qFxLFUKP
	 ImdVKMeFRUnJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF635C43614;
	Wed, 24 Apr 2024 11:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: phy: mediatek-ge-soc: follow netdev LED trigger
 semantics
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171395702684.12181.223647631542261480.git-patchwork-notify@kernel.org>
Date: Wed, 24 Apr 2024 11:10:26 +0000
References: <4983a6b197ed999808c5690d01ec1ffb4f6407b7.1713656093.git.daniel@makrotopia.org>
In-Reply-To: <4983a6b197ed999808c5690d01ec1ffb4f6407b7.1713656093.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: dqfext@gmail.com, SkyLake.Huang@mediatek.com, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_041030_826814_1C527323 
X-CRM114-Status: UNSURE (   9.78  )
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
by David S. Miller <davem@davemloft.net>:

On Sun, 21 Apr 2024 01:08:31 +0100 you wrote:
> Only blink if the link is up on a LED which is programmed to also
> indicate link-status.
> 
> Otherwise, if both LEDs are in use to indicate different speeds, the
> resulting blinking being inverted on LEDs which aren't switched on at
> a specific speed is quite counter-intuitive.
> 
> [...]

Here is the summary with links:
  - [net] net: phy: mediatek-ge-soc: follow netdev LED trigger semantics
    https://git.kernel.org/netdev/net/c/5b5f724b05c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



