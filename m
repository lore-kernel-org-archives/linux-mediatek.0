Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D165C53200
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 00:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdY0BKHWph5EOwbrDaQoxQuPkpzGFFgegddJCFpDceU=; b=Ma1jOVuYAfont3bzp60YX29c4I
	KcV+us5NGs9J2aYHlC0z0rrm2T5/9AnFFt0OJmqcrNF5Y5wrhY3FwU8ngRRy3Gy6FDt2yT7765hIY
	yyGMTfjamBiXL8mDKNL4iC/L2KReuZgGlf3J9dOxjTe/BgU4qrXCjnPh9rhmceWk93NZmJI57giSs
	+1fkiZk8RB6CYgLtqZ4L1DKj4GGOXkIzqRjvCHmIyCczQJO5mNLB2us5UjIprTKjLuvh1/1TaJDgn
	I2ahBEnUFaSYnAWHqXgPXG66Lbl2z2CEiws+Ll4pSUrrTP3TfJvN/V0+3EXkAlK25BhgPL1HrC5c1
	Pjo/LEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEpN-00000009BnH-2pi1;
	Thu, 30 Jul 2026 00:40:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEpL-00000009Bn0-3YVR;
	Thu, 30 Jul 2026 00:40:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EFE11600AE;
	Thu, 30 Jul 2026 00:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D811F000E9;
	Thu, 30 Jul 2026 00:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785372046;
	bh=NdY0BKHWph5EOwbrDaQoxQuPkpzGFFgegddJCFpDceU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RqCczNNiZuvDEbli0Zx/NGjRSjKFFlmkFDUBAnDJ/xtP6zPyRPum56X07xjomVw1C
	 X8gdkFQ/SOH++6iS3EWJ1Pi6WOiNk1VbbIGOIy/dc9aRTxrPJXyQQL80BH72RU9VY6
	 7WjlnlwnVA0MFDkQdHVTyBQTh040/VHToXzM7QD0vf+TvS+mIHO8nGE/pUH0pydViW
	 ju3E981raAN6xkb9Cl+5vV9MlVaazgG13SXc3EHGwBVJL4ISBqmRdxaRwFL9D5RS6Z
	 QGeQBT8rqaw+LNwrMfJkLdsx1ZC2xKlOcGMPb9g39DZHO2GHV3e5PvcliQilGs2iyq
	 f22UXX8XEPB7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BED3926251;
	Thu, 30 Jul 2026 00:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/3] net: dsa: mt7530: fix swallowed MDIO read errors
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178537201040.3298470.15022630671470651266.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jul 2026 00:40:10 +0000
References: <cover.1785213071.git.daniel@makrotopia.org>
In-Reply-To: <cover.1785213071.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: chester.a.unal@arinc9.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Landen.Chao@mediatek.com, f.fainelli@gmail.com, sean.wang@mediatek.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 28 Jul 2026 05:52:05 +0100 you wrote:
> While working on a register access cleanup for the mt7530 driver, the
> Sashiko AI reviewers flagged long-standing error handling gaps in the
> driver's read paths [1].
> 
> The MDIO regmap backend truncates negative bus->read() errnos into u16
> register halves and returns success, handing garbage data to callers
> and to read-modify-write cycles which then write it back to the switch.
> 
> [...]

Here is the summary with links:
  - [net,1/3] net: dsa: mt7530: check bus->read() errors in the MDIO regmap backend
    https://git.kernel.org/netdev/net/c/b4ce102b2cd8
  - [net,2/3] net: dsa: mt7530: error out on failed reads in ATC/VTCR command polling
    https://git.kernel.org/netdev/net/c/ed9adac35b8f
  - [net,3/3] net: dsa: mt7530: error out on failed reads in MT7531 PHY polling
    https://git.kernel.org/netdev/net/c/77a9ebe8818c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



