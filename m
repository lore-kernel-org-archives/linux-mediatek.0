Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5A9C54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 12:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lxQAI+eJXzhgXHp9NSAmYqgfqGx4r2e2HjyXkFGGF4=; b=NMZwzT8ocA9k4R1h5dAXCuSzIt
	A6hW0KrrzJzqqnRKOI/dt+5z71DZmDLsCLNJfPC4SPC6ddm9CdjZ3KWPXeLKy3eeJxRvpufoYiMeL
	OAnBsofK5WV9QYdejScyjMV/vOuh+90wRTLFrUcJozrLGLl+kX5bsS/0agUcyTsB3DxFbojMc7lnF
	sZ3RDubCRVtoVOvuIyk7P+iR5elMFwascN1kmCnwK4pHJjNse2wl5uhwggcAP+hhbl3PUIt2altSj
	KzucpvME/E0zktN7AsF7fM42txqjiTEgc3p2QOYRLdOj3bioQV0DFcIXOyHqo4f8ii2HpseNdUhVH
	OaDbMEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmC8W-00000008WLq-1B3L;
	Mon, 18 Mar 2024 12:30:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmC8Q-00000008WKc-2Vp2;
	Mon, 18 Mar 2024 12:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EBB27CE0201;
	Mon, 18 Mar 2024 12:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEDA4C433F1;
	Mon, 18 Mar 2024 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710765029;
	bh=Pf3JZGSV0vq0+Ep32XwBVnIFfn/v8WNnsG3rb8t8ghQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nGJycxgLs+3XFpLWAHW0vsUe3BzzPE5xJRp/m8qxdtLJo8qln3kUI6WU7PK+Ubfc9
	 UlefgKwutWEfXIyGaGscl1BC7/xIk7fdHv+KamIY3d8ETQWJadkRN45hCdsRnQwaex
	 mxH83Du4dl8hcu9Y0GGNBJxEbpymxSSZe/86/cEkV024L+ubVMlZile6HVZYu4YRnZ
	 TZ/KrUBiHwukN63HlT8GACqLib8vtqFNQTkD6wgDvkE1oz7AGrAClgFQOvLJSOwr9A
	 Tbcb2c7IHU/Ci4eTfR6NaURF0GsAllXGBZnwzqUQoR+54c7NDympnR6mpPJUm1Z9ye
	 pg+dscuOIwzFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A00E7D95053;
	Mon, 18 Mar 2024 12:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: dsa: mt7530: prevent possible incorrect XTAL
 frequency selection
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171076502965.32045.18266951934755323293.git-patchwork-notify@kernel.org>
Date: Mon, 18 Mar 2024 12:30:29 +0000
References: <20240314-for-netnext-mt7530-better-fix-xtal-frequency-v2-1-fe30795593df@arinc9.com>
In-Reply-To: <20240314-for-netnext-mt7530-better-fix-xtal-frequency-v2-1-fe30795593df@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 p.zabel@pengutronix.de, Landen.Chao@mediatek.com,
 bartel.eerdekens@constell8.be, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, justin.swartz@risingedge.co.za,
 arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_053034_945825_4E7A2704 
X-CRM114-Status: UNSURE (   8.27  )
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

On Thu, 14 Mar 2024 12:28:35 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> On MT7530, the HT_XTAL_FSEL field of the HWTRAP register stores a 2-bit
> value that represents the frequency of the crystal oscillator connected to
> the switch IC. The field is populated by the state of the ESW_P4_LED_0 and
> ESW_P4_LED_0 pins, which is done right after reset is deasserted.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: dsa: mt7530: prevent possible incorrect XTAL frequency selection
    https://git.kernel.org/netdev/net/c/f490c492e946

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



