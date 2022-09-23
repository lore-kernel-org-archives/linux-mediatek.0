Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F96C6FA90
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcNQeAfVtr3NwsQG9+XVMonYdWvmA9p2EmH8WeNjSe0=; b=URmtVKGKEuPpjEhccXVBiyb+Qu
	8ipRB5h6ByBGlTuor984Q/iBFNmgbIeJ+TCxpwt6fDzFsun7/aU2qLZDTrEPz3qcD1TAYvYzHtfWB
	P3ikz/s5bHMFOj12+Wa4qOGqI1gZIpzeEpYZtHNnIxNs8JePe+3k9CHwKIovkC93ff3a65GogIIGO
	dkH6jAWcNoNSFwm0MyAjIchJ5WhAOg6XrTzv7F5H5K7vYSUepNwMaErYGl71Xw6vhCgba5MRfFOXr
	52BKIKHvMnIcipJAGkv+ULtlyLG7vyYWlaE2GPuv2zS2+Z3Q0jUSOMVXZnCRSFVVFpz0Vtpu3BZyY
	SSL0PCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgZb-003rPf-6M; Fri, 23 Sep 2022 11:10:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgZY-003rOW-DJ
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 11:10:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF0ED622DC;
	Fri, 23 Sep 2022 11:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5350AC433D6;
	Fri, 23 Sep 2022 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663931418;
	bh=ghn8tzhGtrvoRXE0BRumYZPx9Zc/TUeIGa+4s08s+7o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VdXYNDo3/7r5d8qh/TmZlPLQM3R3A946cX6ZTyWVqXbjys1rUU7Y6nk9jOKEVAcMs
	 4MPW3p5dFnkcP006ewFky17tecdf3o2FPrdkYWYa6BPib4QVM3LAaCO47hhxSrGIlt
	 SV6iwMlWzSUtot5DddtEHMi/gCivGadQZbFR8dE33Vq8r3UyueWrGldS8lR2f/iP7h
	 0SBQaOqOOK4Jz9aszp4lqudSWNX7hznigWNP65FT2LyTvCujENkxI5oOzd32t0GClJ
	 k7QfsNkPNPA/bkfm1GENHcaLGxVKkTUvPSdbQKaR2MSbCPipk34w9KMaV7DVZ/0knW
	 wjU5saSovJxBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B90EE50D69;
	Fri, 23 Sep 2022 11:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] net: dsa: mt7530: add support for in-band link status
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166393141823.14679.13460162221057201141.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 11:10:18 +0000
References: <YypZcnkmkS4bWQYs@makrotopia.org>
In-Reply-To: <YypZcnkmkS4bWQYs@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux@armlinux.org.uk, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, sean.wang@mediatek.com, Landen.Chao@mediatek.com,
 dqfext@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com,
 f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, lynxis@fe80.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_041020_510220_EF0A4C40 
X-CRM114-Status: GOOD (  12.54  )
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
by David S. Miller <davem@davemloft.net>:

On Wed, 21 Sep 2022 01:23:14 +0100 you wrote:
> Read link status from SGMII PCS for in-band managed 2500Base-X and
> 1000Base-X connection on a MAC port of the MT7531. This is needed to
> get the SFP cage working which is connected to SGMII interface of
> port 5 of the MT7531 switch IC on the Bananapi BPi-R3 board.
> While at it also handle an_complete for both the autoneg and the
> non-autoneg codepath.
> 
> [...]

Here is the summary with links:
  - [v4] net: dsa: mt7530: add support for in-band link status
    https://git.kernel.org/netdev/net-next/c/e19de30d2080

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



