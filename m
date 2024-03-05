Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000E3C54798
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Mar 2024 12:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8e5FIg8w3E12OTvq56AdNesyQh6/A2ARyDUQytEKmEY=; b=OzhjJbgjkw65LRFk2R2niUzGLx
	MXDmT7yUyVTAW8gmbtSfx8kLBWZDVQM3bs6/3EnIkfWfFJOQXDiNWONk6GG0KAPqsRvHBWaz9MQhm
	pICvdoZuxR6Skb1uweky6YT1wqJMGGv15K7gn6Mi41qXKLAjTVVK06Ygxd/i5WGqBwYJ1UFmnSW9q
	ztZ8Fq3u8WcdprJnIYVF8TQ1o1i/0sw6tNgtUXBGT97HeZ36kxShTSFGD1tzymcag7O3ONrzjtWvj
	qJzSl4IsJCOHpO+Z0H1ESSX4H0TsdKJARl8S1ShtJ7JBan5WYT0QfOuJvaDOVN6WQp9ncmXLjpe9q
	FhjLA71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhTTM-0000000DTEL-0SNt;
	Tue, 05 Mar 2024 12:00:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhTTG-0000000DTBY-29lO;
	Tue, 05 Mar 2024 12:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D82CFCE19FD;
	Tue,  5 Mar 2024 12:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 195C8C43390;
	Tue,  5 Mar 2024 12:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709640032;
	bh=dksLaDVSy6nq7bP4e4YeQwSAmypjMREMKHNjaEVWxwQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iX+Nvu4f89MlkCTlP8LkvOL+xzTIElbLQkK1ES/qoNu9WG6d8FTflxfdESs2PSYcb
	 WGzbhP6RIvkRXlqX/D6Tj82ZCceKF/ZGDRqYI+fCoOV52NXAMQaeWB+TqBtbHaVWPz
	 R2DMiRBj5AreLzi9BOOhaRNqMP3owHpMvcEhp+TysDU39AWRBCsJ46aCIptK7IE87A
	 lchgT9n01mEeXfx32D7JBZxCn1TH5LY3Ujppkfnss0DAt/z9H7iftkExyoC21Tpmvt
	 nzPRVf8Bf+ApB0kou3XaqEH71w++ZrBPtAnEuJSdtrLoDGWF3ycurkILxu/iYkdrwr
	 Z770SFr6giXLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7A59D84BDF;
	Tue,  5 Mar 2024 12:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/9] MT7530 DSA Subdriver Improvements Act III
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170964003194.11081.15831016567274956859.git-patchwork-notify@kernel.org>
Date: Tue, 05 Mar 2024 12:00:31 +0000
References: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
In-Reply-To: <20240301-for-netnext-mt7530-improvements-3-v3-0-449f4f166454@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux@armlinux.org.uk, mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 bartel.eerdekens@constell8.be, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_040034_948240_30161E07 
X-CRM114-Status: GOOD (  11.12  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 01 Mar 2024 12:42:56 +0200 you wrote:
> Hello!
> 
> This is the third patch series with the goal of simplifying the MT7530 DSA
> subdriver and improving support for MT7530, MT7531, and the switch on the
> MT7988 SoC.
> 
> I have done a simple ping test to confirm basic communication on all switch
> ports on MCM and standalone MT7530, and MT7531 switch with this patch
> series applied.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/9] net: dsa: mt7530: remove .mac_port_config for MT7988 and make it optional
    https://git.kernel.org/netdev/net-next/c/6ebe414b48cf
  - [net-next,v3,2/9] net: dsa: mt7530: set interrupt register only for MT7530
    https://git.kernel.org/netdev/net-next/c/804cd5f7059e
  - [net-next,v3,3/9] net: dsa: mt7530: do not use SW_PHY_RST to reset MT7531 switch
    https://git.kernel.org/netdev/net-next/c/a565f98d7d25
  - [net-next,v3,4/9] net: dsa: mt7530: get rid of useless error returns on phylink code path
    https://git.kernel.org/netdev/net-next/c/adf4ae24ba42
  - [net-next,v3,5/9] net: dsa: mt7530: get rid of priv->info->cpu_port_config()
    https://git.kernel.org/netdev/net-next/c/22fa10170af5
  - [net-next,v3,6/9] net: dsa: mt7530: get rid of mt753x_mac_config()
    https://git.kernel.org/netdev/net-next/c/1192ed898c97
  - [net-next,v3,7/9] net: dsa: mt7530: put initialising PCS devices code back to original order
    https://git.kernel.org/netdev/net-next/c/3a87131e3d72
  - [net-next,v3,8/9] net: dsa: mt7530: sort link settings ops and force link down on all ports
    https://git.kernel.org/netdev/net-next/c/6324230b3b67
  - [net-next,v3,9/9] net: dsa: mt7530: simplify link operations
    https://git.kernel.org/netdev/net-next/c/b04097c7a745

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



