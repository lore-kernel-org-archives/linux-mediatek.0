Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25231C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3Thn7V5ThcMvQr/Hx4qAU6oDTLEMPwKlKe+KalNwJA=; b=H1HfBcmFO5syaxrLblGrXB3jTy
	IZoeLFLb+RpUkk1+bmWh8q8or/jyZehZpUA+3zzlI35oLQ04vYNATZkIWRHTV9K7BGIkihvRfQCME
	mjlHFiDWR1h7ikBqsdSHPoB7b6dcLTkJoQ0opZK5DfN4QBVtdthlG+QEuV3H1hkcvYMjWPP3dm9tU
	6QDPSsAp6XUCGGWwHal4qXjicCaYyEZmqo2oWXU5X/7fnVBcmjpGv4/h7YzTvg5fVKkhp5+4TNwZF
	d12dpmzFX3KGVZxLl2y5VSukZtMww3pnu9e5+08Md8O2Bs0giTnhDbjINr9+0CnfvBYV+xjs4JG2R
	WeArjr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzC12-0000000GZYF-25vZ;
	Tue, 23 Apr 2024 09:00:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzC0u-0000000GZS8-07CD;
	Tue, 23 Apr 2024 09:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D90F6CE0F20;
	Tue, 23 Apr 2024 09:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F410FC2BD11;
	Tue, 23 Apr 2024 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713862829;
	bh=nE8DnFAjlXYHaUIN1qirvqDi+c0X4LQGHB4IF21MuZU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ffDiCOhOXgB1vtYuHtskFOzrmJPR48sXJuIs0EAloKkXE4BGyvLJzrJ21OWoetBSk
	 IJOOFoN8WGP1Bo8Vaj0wW+vu4ckwjFOiJT+bheMARzCE42j2BaikPJirx3UtYtynFW
	 PlaV4m9l+bDjqfZ9LjL9jbGN43KmCxbKF4opiiQ9/4Wpm4GWPBs4s7Lg+BVVvJ0FsU
	 iWKdZSo2U/rvRday6FBau0M2kTLRN/qdOwX6AcwQDWNWfZOj3ECEB+WPMOmPlAktlP
	 YyJaJ2+pgggh78adxIzT5UtKcMujMr2G+AyHxzzA7QVbYH1zp3Owv9sjRmiENsGuOD
	 HH3cxEjbDHW2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D44B2C595D1;
	Tue, 23 Apr 2024 09:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] Read PHY address of switch from device
 tree on MT7530 DSA subdriver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171386282885.3533.16186593968313244252.git-patchwork-notify@kernel.org>
Date: Tue, 23 Apr 2024 09:00:28 +0000
References: <20240418-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v3-0-3b5fb249b004@arinc9.com>
In-Reply-To: <20240418-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v3-0-3b5fb249b004@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 bartel.eerdekens@constell8.be, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com,
 florian.fainelli@broadcom.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_020032_313502_E2374F63 
X-CRM114-Status: GOOD (  10.39  )
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

On Thu, 18 Apr 2024 08:35:29 +0300 you wrote:
> This patch series makes the driver read the PHY address the switch listens
> on from the device tree which, in result, brings support for MT7530
> switches listening on a different PHY address than 31. And the patch series
> simplifies the core operations.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: dsa: mt7530-mdio: read PHY address of switch from device tree
    https://git.kernel.org/netdev/net-next/c/868ff5f4944a
  - [net-next,v3,2/2] net: dsa: mt7530: simplify core operations
    https://git.kernel.org/netdev/net-next/c/7c5e37d7ee78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



