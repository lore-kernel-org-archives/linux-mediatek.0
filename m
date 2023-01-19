Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCB5C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seyXkCmfyPZMAbZ6E4TFFewn/D+ClXKceDJJ64cR0Ec=; b=bX0ONLsVzPoY9+Z2WG3JzPy1n2
	sitsY2Utg3rKtglIdzVmcSMSFwjTQQIsX8X053lIDFoWqAJmAlC18/ZNAH4B1d+3GaQYQ+t6fxjL4
	biEDFxC1CmPSiFSTI49EQx2OeOy6/ykcODrtORdYBXZU9sXtGisS3PDnlIAcfgWWcwHwPkWV11PCu
	n0nNhPKFOG2jr7xRwZ6BMQ+xYs3uMeSSPQAzOmBY3Xj9jyustm8edoKtkMYfbBEfxzqSCzHyZLTiL
	3MG5BKg7San/LTuinmYfHXIrW5LpO3Vo264H8W7zjMYUaJYaj1rlfaXfq3h1oCquJAIZIuNzjdCOY
	Xqpy1VwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIWs6-005et1-3z; Thu, 19 Jan 2023 15:30:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIWru-005ep6-C3; Thu, 19 Jan 2023 15:30:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CFBD8B8252B;
	Thu, 19 Jan 2023 15:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62A2EC433EF;
	Thu, 19 Jan 2023 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674142218;
	bh=FP4ru6E8Oo1JNr9DNk54UNNPsvn5fuH6fMcjfdBl9lY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bFB7tr99GI5Hq9EBVHmPrjqEzs9dqNrQDOhNaSTZhid/ub9KtLtAbp6OrBy+XmNZd
	 Ys9K9qWgQGZpyCFNH5lCqncShoKEdtrNFA266NAB6zpE/qD6ZzYuobsVgof6W0XFC3
	 smDWAszIxvhLusZnZm+S1wiJcv/xWWC4lmGNyooLA6sEPZtCMcTIueGF/qexVHMRL0
	 GSqDqp59ittarba+p35/hEqdy+bVRKTY6oyU5blSnT90PMfmI5yNaNsMw1XGzUl31k
	 gDr0yNHZtLCad1rWNA2lx7AZFozMamdVIkRPdHcdbqG9lVoP8sQvqoLVo+ySOAT4NR
	 Eh/O2sbpfBD4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2E094E54D27;
	Thu, 19 Jan 2023 15:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/6] net: phy: Remove probe_capabilities
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167414221817.31934.14400606803161415762.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jan 2023 15:30:18 +0000
References: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
In-Reply-To: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, matthias.bgg@gmail.com, bryan.whitehead@microchip.com,
 UNGLinuxDriver@microchip.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, joel@jms.id.au, andrew@aj.id.au,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 andrew@lunn.ch, jesse.brandeburg@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_073022_752834_6EC2BFF3 
X-CRM114-Status: GOOD (  13.69  )
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

This series was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Jan 2023 11:01:35 +0100 you wrote:
> With all the drivers which used .probe_capabilities converted to the
> new c45 MDIO access methods, we can now decide based upon these whether
> a bus driver supports c45 and we can get rid of the not widely used
> probe_capabilites.
> 
> Unfortunately, due to a now broader support of c45 scans, this will
> trigger a bug on some boards with a (c22-only) Micrel PHY. These PHYs
> don't ignore c45 accesses correctly, thinking they are addressed
> themselves and distrupt the MDIO access. To avoid this, a blacklist
> for c45 scans is introduced.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/6] net: mdio: Move mdiobus_scan() within file
    https://git.kernel.org/netdev/net-next/c/81d874e7c84e
  - [net-next,v2,2/6] net: mdio: Rework scanning of bus ready for quirks
    https://git.kernel.org/netdev/net-next/c/d41e127757f3
  - [net-next,v2,3/6] net: mdio: Add workaround for Micrel PHYs which are not C45 compatible
    https://git.kernel.org/netdev/net-next/c/348659337485
  - [net-next,v2,4/6] net: mdio: scan bus based on bus capabilities for C22 and C45
    https://git.kernel.org/netdev/net-next/c/1a136ca2e089
  - [net-next,v2,5/6] net: phy: Decide on C45 capabilities based on presence of method
    https://git.kernel.org/netdev/net-next/c/fbfe97597c77
  - [net-next,v2,6/6] net: phy: Remove probe_capabilities
    https://git.kernel.org/netdev/net-next/c/da099a7fb13d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



