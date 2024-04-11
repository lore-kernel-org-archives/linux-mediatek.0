Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BE4CD11C2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 02:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woQ/UU7qZlqJd0qxAKJ2Xffc2l9EGHdPF8rl8syHC+o=; b=cN4Kn0YgbCBIYuO7hvpidmNhE0
	jWN3CbVgE8PZbsGsS2bMHRtXk59Iskx0hi/kWY3kGAEs2+itfsN/m+NoNsuBJIpPv29KoylNNPjKY
	v3dBcgIlINyvqTKodc1XGNCrUE6+Vu+Phd17tDQ9Q3znluIF68kR629Q+hA3W6KptHwahF/JTw44/
	DqM9b0k6bBLOAfOoQVGMoHULkgYPseiNDrOQgS241ueZ3oAdAs11laNRlOu79L0p0LGGwUxS9q9de
	1NxQ4D1wVw1Kd/hq3ipuvjxZ69ksTqo+jv0eEemsVFZI0VtUpLsGNZlHGNB8QRrcQWB3uFSo5oVWY
	fdQnVu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rujk5-00000009vMo-1yRD;
	Thu, 11 Apr 2024 02:00:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rujk0-00000009vLJ-49HA;
	Thu, 11 Apr 2024 02:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90FA261F79;
	Thu, 11 Apr 2024 02:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83B07C43394;
	Thu, 11 Apr 2024 02:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712800835;
	bh=6Cij9gk2+tshYEQ8bidf1LIXaouxOi54fCmkbe6echc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DGqllrxs7/KWcrtpvjksskac53m2Lh2RJ/0d8Vl+Pb7sx5QA1m4zFtZTz/ToiUZgd
	 gTmKE7Ts7UcsStFbw9hdgyjFQnLq0JlBen6IPkzKWTpmm2IOkMjIsvTEyBDv7TEdPx
	 HedYd0AhaAPPUg3Bb/bKz4C9Htct4kDspcxvccxhU7bxAqisUvjQdcmUGabKg5ETws
	 u/d52OwiG+jYNZCBY+rQQj0OQ8I8G/SHn8+MYjjhaDd8NlgD/1fJwHr67+vNNgQiv9
	 pt0AH6j5HOq8KNGhrviFYhto5PRpzi0BG6mesPeQYhDipEKQFy1KnaOquDJ7V3aEA6
	 zEfYhJwf5ecew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61167CF21C5;
	Thu, 11 Apr 2024 02:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix enabling EEE on MT7531 switch
 on all boards
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171280083539.2701.12891198240380123867.git-patchwork-notify@kernel.org>
Date: Thu, 11 Apr 2024 02:00:35 +0000
References: <20240408-for-net-mt7530-fix-eee-for-mt7531-mt7988-v3-1-84fdef1f008b@arinc9.com>
In-Reply-To: <20240408-for-net-mt7530-fix-eee-for-mt7531-mt7988-v3-1-84fdef1f008b@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 opensource@vdorst.com, linux@armlinux.org.uk, SkyLake.Huang@mediatek.com,
 hkallweit1@gmail.com, bartel.eerdekens@constell8.be, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, florian.fainelli@broadcom.com,
 arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_190041_198402_B54864A6 
X-CRM114-Status: UNSURE (   8.74  )
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

On Mon, 08 Apr 2024 10:08:53 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The commit 40b5d2f15c09 ("net: dsa: mt7530: Add support for EEE features")
> brought EEE support but did not enable EEE on MT7531 switch MACs. EEE is
> enabled on MT7531 switch MACs by pulling the LAN2LED0 pin low on the board
> (bootstrapping), unsetting the EEE_DIS bit on the trap register, or setting
> the internal EEE switch bit on the CORE_PLL_GROUP4 register. Thanks to
> SkyLake Huang (黃啟澤) from MediaTek for providing information on the
> internal EEE switch bit.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: dsa: mt7530: fix enabling EEE on MT7531 switch on all boards
    https://git.kernel.org/netdev/net/c/06dfcd4098cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



