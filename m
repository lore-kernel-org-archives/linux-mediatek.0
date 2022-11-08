Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED186C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 02:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHwi7UuuEP7fbuXDfMIejC0wEJyxjjCVtwfBU8TnuVY=; b=Ty9+Z2oj12+EyVsztM8y2S1UmF
	QZJB1yNG5961rDOvkxps18cjsp1q2hq0b3i1jVcX4NQxp42ev/fcstUQ57c27yHjZ8LrLlRi2xdUA
	CbvJibFI56N8tXP3PpMJqJLttobiZUOaaPsvCxNFsqcFxNcDkuGilJDaEDSMp22kBmTc7+Pkjq5LI
	iJu2LN7/YJR+Tcx0O2B2jpfSQXMySq9DMMLIUFmQD03aBXEPKRoK8S2eSw5cdK22RapqGjRIr5I94
	gmCE0ca40Mbep2nIcY2bhqdcU9kHe5D4ED1VHfJK/KLFYbaJiFdWiMsCN0hoM646qUUyOVl9GQ156
	FxDHLEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osEOQ-0021xM-1J; Tue, 08 Nov 2022 02:31:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osENa-0021hQ-9n; Tue, 08 Nov 2022 02:30:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C97A61418;
	Tue,  8 Nov 2022 02:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35E6AC43147;
	Tue,  8 Nov 2022 02:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667874616;
	bh=1hYnMgfurIKVnqS2BSMFp3XJTtcvbl4vCIjx0mlf2hc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=corZkn9pLiTNJeebW0flJi865e5dD2UeDQ+8JGk7sNL3V2a4kHdhDOxRXG+71pGQh
	 tCXiG+7o3v6mOeeLKPu/57tG+LrMlFVD7nqaY2jNgLYhnSBCgmww0rJG7PwT0mxFnQ
	 DHxnQCH1iiCovuIwHQEB2ax8KYZE908axQ2TH0zhLT1QN+KgiKG+fXYAZln7wzSx1c
	 xLSmupP5T9DNXlQ5kAQMlI+UjIri6aFHbnH8+eTsabgCIM0uqdp5Hnjozuz1polESL
	 E6gbQ8xo0SfxSmjlEMum1OAGCuWMzRPfJ+fqvK6trB9aq3D6aY8DWf5B8RV3VZKAfR
	 1cuX6y9Fyloug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1BC44C73FFC;
	Tue,  8 Nov 2022 02:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: remove explicit phylink_generic_validate()
 references
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166787461610.16737.3952195755714134439.git-patchwork-notify@kernel.org>
Date: Tue, 08 Nov 2022 02:30:16 +0000
References: <E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: joyce.ooi@intel.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, chris.snook@gmail.com,
 nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 ioana.ciornei@nxp.com, claudiu.manoil@nxp.com, madalin.bucur@nxp.com,
 thomas.petazzoni@bootlin.com, mw@semihalf.com, tchornyi@marvell.com,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com,
 horatiu.vultur@microchip.com, lars.povlsen@microchip.com,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 vladimir.oltean@nxp.com, alexandre.belloni@bootlin.com, s.shtylyov@omp.ru,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, radhey.shyam.pandey@xilinx.com,
 michal.simek@xilinx.com, andrew@lunn.ch, hkallweit1@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 UNGLinuxDriver@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_183022_430661_3BD0DFEF 
X-CRM114-Status: GOOD (  11.91  )
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 04 Nov 2022 17:13:01 +0000 you wrote:
> Virtually all conventional network drivers are now converted to use
> phylink_generic_validate() - only DSA drivers and fman_memac remain,
> so lets remove the necessity for network drivers to explicitly set
> this member, and default to phylink_generic_validate() when unset.
> This is possible as .validate must currently be set.
> 
> Any remaining instances that have not been addressed by this patch can
> be fixed up later.
> 
> [...]

Here is the summary with links:
  - [net-next] net: remove explicit phylink_generic_validate() references
    https://git.kernel.org/netdev/net-next/c/e1f4ecab1933

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



