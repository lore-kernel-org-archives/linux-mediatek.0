Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65085C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIVmTu0ZIC46BiTKUkaYbE/EzhJzeKefzero316+rwo=; b=1NdyVPeMlXGJ1XSLg93pFUuaV4
	AHtWEulqu+Zew3uKhjM75eODk9YHzM/lM86M9X9UfYfeI8ZGVcsB/GQPMjRawOYvqjplMikVgU3xA
	5QPu+dnMMGKByUWY8sB+pjqZgHNIV2tLLWATLWObxfmYLolOVMDBYSFmgRPsdw0+Tde84S3QTWcLm
	nEcAQaPGgl2KyZYFpVlbMDXAW8fHsZONTJaJH2XaxV1mOS3ySOQcbiMNKhYMKY0mWKDwFhUw3DX3j
	FKKrj2Z7X2x+z4QQUSqNkVqogarBi4KcP825PxYQ2zMXO3BEjZMFmv/J65oWWf1PkV6qgG/F3z0dE
	Vt1POTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paAjV-008F5j-2c; Thu, 09 Mar 2023 07:30:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paAjK-008EzD-1f; Thu, 09 Mar 2023 07:30:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3D2DCB81E94;
	Thu,  9 Mar 2023 07:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76B23C433D2;
	Thu,  9 Mar 2023 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678347020;
	bh=JgUaHUieKlq5j09NA5/MYf0E8p1BKJC2tOJvSLQP9zc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a32uoB6llCfq/3LqJgnWyzcl64fzX26ZD9f1MyFDb4LFKG7/+R241ALklF3/3+iS5
	 Ch8FMs9wUcL0BWInmu93H/ohnZi/5lsqfmHRK5Ek5krOc+yVnYfhD+TQT1g1x+sNrE
	 3MuMisg4xxyYuYkURUtxEm4JIhHG6bMPcGLYurit3oN4i760ZyKWIDIG4FGpiLoxTL
	 /YQuFTBFAEiD31ZiDt4e4vcu9cSVSOZQM/sCjifI5MQoH3c4gcRsusfU4NhhE4Wm/a
	 vHUnPgulmoheQNLCzuEqS7h/xIrSHZQ8iTevj3f0ZbqybU6GS3+3ngJgiWWpikAUVf
	 ug5oFiQwdNYYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56542E5250A;
	Thu,  9 Mar 2023 07:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dsa: mt7530: permit port 5 to work without port 6 on
 MT7621 SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167834701934.22182.717765078192352405.git-patchwork-notify@kernel.org>
Date: Thu, 09 Mar 2023 07:30:19 +0000
References: <20230307155411.868573-1-vladimir.oltean@nxp.com>
In-Reply-To: <20230307155411.868573-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_233026_250008_32319225 
X-CRM114-Status: GOOD (  18.25  )
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
Cc: andrew@lunn.ch, ilya.lipnitskiy@gmail.com, opensource@vdorst.com, edumazet@google.com, erkin.bozoglu@xeront.com, f.fainelli@gmail.com, linux@armlinux.org.uk, richard@routerhints.com, gerg@kernel.org, arinc9.unal@gmail.com, kuba@kernel.org, pabeni@redhat.com, Landen.Chao@mediatek.com, sean.wang@mediatek.com, dqfext@gmail.com, lynxis@fe80.eu, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  7 Mar 2023 17:54:11 +0200 you wrote:
> The MT7530 switch from the MT7621 SoC has 2 ports which can be set up as
> internal: port 5 and 6. Arınç reports that the GMAC1 attached to port 5
> receives corrupted frames, unless port 6 (attached to GMAC0) has been
> brought up by the driver. This is true regardless of whether port 5 is
> used as a user port or as a CPU port (carrying DSA tags).
> 
> Offline debugging (blind for me) which began in the linked thread showed
> experimentally that the configuration done by the driver for port 6
> contains a step which is needed by port 5 as well - the write to
> CORE_GSWPLL_GRP2 (note that I've no idea as to what it does, apart from
> the comment "Set core clock into 500Mhz"). Prints put by Arınç show that
> the reset value of CORE_GSWPLL_GRP2 is RG_GSWPLL_POSDIV_500M(1) |
> RG_GSWPLL_FBKDIV_500M(40) (0x128), both on the MCM MT7530 from the
> MT7621 SoC, as well as on the standalone MT7530 from MT7623NI Bananapi
> BPI-R2. Apparently, port 5 on the standalone MT7530 can work under both
> values of the register, while on the MT7621 SoC it cannot.
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: permit port 5 to work without port 6 on MT7621 SoC
    https://git.kernel.org/netdev/net/c/c8b8a3c601f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



