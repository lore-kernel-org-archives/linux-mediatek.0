Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39587E7C4EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 19:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nAhymJNVPum0mDzUbsodaQP/OOuWN40YZNYRehXyB8=; b=jK9mBdgjGc6ee95KHGt5lpYMBs
	0WVrttl69nnmbpbQ8AxfgdTFrjb1Sefm2+f+W3XixhcORHdHWqf3wrO4eateg4Uk7+0se2EhYx7Z6
	1h1EfsDIR0OMfesk1XGqFNlLHnscoW7O/mzYncz6Ngoir40p+ouXVy12tZIrZ6JP+Dlgoa3/GRXQw
	fo+y6Ais7cDHi3WjkuT3jG3GwIFdx2WXivhUEATSlFcIhYCmm4B1Nk7NiHVF5/wK58ZxGGmJxOmbd
	VOOc6kVMb45IZpzLDwAk4kHt2ZPehqDYBWykBB8VkT7TSdICgVTlaHBdXg/GIcdyYFItVMofL+gcI
	2bjiJklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo7Zv-000nqd-2U;
	Wed, 04 Oct 2023 19:30:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo7Zs-000npX-2O;
	Wed, 04 Oct 2023 19:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0441DB82064;
	Wed,  4 Oct 2023 19:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13C8AC433C7;
	Wed,  4 Oct 2023 19:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696447833;
	bh=Rll2hLODlO0jmujFPX4lrfv0Ine7ZvmL97hOB+GB6RY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hDM501ce2NuFndagwuaawZtKJIGNc+HB30HRbNGnHEARoTlNypCWEBGYxJWMgmP6Y
	 PaJXTNmxofQLvPi0cPNlTTRZb+ht1MrSa5P1eRwy27NCN/ETtNTuAxO4DYz4Dkmi7S
	 JjCO0XGHneUF7PgmgQLREd2ka2OXk1ItQ2h/J2eE9vS8UisOiamVWDqq4Tsfxt/IJ4
	 6c4nwh9iVBfgrCziALT2eT4f95gU8V5dneMMZU8kHFuhOyb0XouGbFHzS71dAD00vO
	 5QsMm4fr+7QNoTl4BYcg8xnugsUFiQGMStS7hkC4ymMoFqfo6NViSmvgGw1x1MVvPZ
	 PIl8HDWxMMgHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA586E632D7;
	Wed,  4 Oct 2023 19:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: dsa: mt753x: remove
 mt753x_phylink_pcs_link_up()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169644783295.9933.15690171576616695923.git-patchwork-notify@kernel.org>
Date: Wed, 04 Oct 2023 19:30:32 +0000
References: <E1qlTQS-008BWe-Va@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1qlTQS-008BWe-Va@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, arinc.unal@arinc9.com,
 daniel@makrotopia.org, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_123036_922531_20664EBB 
X-CRM114-Status: UNSURE (   9.87  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 27 Sep 2023 13:13:56 +0100 you wrote:
> Remove the mt753x_phylink_pcs_link_up() function for two reasons:
> 
> 1) priv->pcs[i].pcs.neg_mode is set true, meaning it doesn't take a
>    MLO_AN_FIXED anymore, but one of PHYLINK_PCS_NEG_*. However, this
>    is inconsequential due to...
> 2) priv->pcs[port].pcs.ops is always initialised to point at
>    mt7530_pcs_ops, which does not have a pcs_link_up() member.
> 
> [...]

Here is the summary with links:
  - [net-next] net: dsa: mt753x: remove mt753x_phylink_pcs_link_up()
    https://git.kernel.org/netdev/net-next/c/d5a590b1b614

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



