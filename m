Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E6EC77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=so8dW3+aaw+sQBohg2KQgWnaXw/ErWuzcPI2s13K1x4=; b=1psU8YWJNWCMW+tb2YnErJLCVW
	53qg/NRCCBzVicNV7TQ4jRSeHiAhjoHQQrCJZaubI2aywVsf3lvH9zbC/fGASlPwuBp6DCmqu7WxU
	dXVRqdm86eQrO7E5TFcGWDQzvG01ZV2ZvTYhdKQsAubm4NjqqNCAdyDGT3Ol2H0ngOBBaBk3OfGUK
	YmavkBA0ma4LiX5ouFlghDpQpwxx0mFgdcEr2Z1o/h7+Svc4acgWLfQBi7pRQBW7h+qYAJzVnVBW+
	hNgINor+TGLTzsuKJcxsEu1KKR3m4D4Aa8jY0NeIs1MfQB3KHuQ48qj4hl2oB5GOWFFj2N0rTt4OR
	iNVYuQPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puqpe-00A1ps-25;
	Fri, 05 May 2023 08:30:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puqpa-00A1pJ-1A;
	Fri, 05 May 2023 08:30:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 211FA63C4D;
	Fri,  5 May 2023 08:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FF73C433D2;
	Fri,  5 May 2023 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683275420;
	bh=Xh+MAs5cv5wNzyY4Qb3IokgWAMpQ9j0XmCCpo/doi/8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ns9suoPaM+L7RW4vZCeWKcmdi0BoMwFyWhyCMKS36YLyz2t87PSCa8uSUR3UfYyaq
	 70bgoSoT5zVGNWrZ6A+5s3Am+/XUQJsomNH7XCN26jHYMkaaPLhgVgekLMBLj0pAOo
	 4A61Q5pmmk0AQbXhfUPbp7tHfo8/nhHbzh9KrwMN/hnpLxG2cA29VRY+2wibUpOYYy
	 lSYiiu2qeed7NOopvTxlNfF2O1XANEiGJzL66P89NkU6hx98HGT4atGyP/4WrnUbQZ
	 qWI9XUv27UO4bOUVQnEs20uRbEITLxOqZkFX9Vd7CcNWPxrnTwZT9IRco7H/B3jqi+
	 0x/ZBoeY5emmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5EC97E5FFC4;
	Fri,  5 May 2023 08:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 net 1/2] net: dsa: mt7530: fix corrupt frames using trgmii
 on 40 MHz XTAL MT7621
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168327542038.4615.4214008191819438520.git-patchwork-notify@kernel.org>
Date: Fri, 05 May 2023 08:30:20 +0000
References: <20230502210947.6815-1-arinc.unal@arinc9.com>
In-Reply-To: <20230502210947.6815-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmM5LnVuYWxAZ21haWwuY29tPg==?=@ci.codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_013022_462139_D7D7892A 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, opensource@vdorst.com, edumazet@google.com, erkin.bozoglu@xeront.com, f.fainelli@gmail.com, mithat.guner@xeront.com, richard@routerhints.com, kuba@kernel.org, pabeni@redhat.com, Landen.Chao@mediatek.com, sean.wang@mediatek.com, vschagen@cs.com, dqfext@gmail.com, linux-mediatek@lists.infradead.org, bartel.eerdekens@constell8.be, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com, netdev@vger.kernel.org, daniel@makrotopia.org, olteanv@gmail.com, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed,  3 May 2023 00:09:46 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The multi-chip module MT7530 switch with a 40 MHz oscillator on the
> MT7621AT, MT7621DAT, and MT7621ST SoCs forwards corrupt frames using
> trgmii.
> 
> This is caused by the assumption that MT7621 SoCs have got 150 MHz PLL,
> hence using the ncpo1 value, 0x0780.
> 
> [...]

Here is the summary with links:
  - [v3,net,1/2] net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
    https://git.kernel.org/netdev/net/c/37c218d8021e
  - [v3,net,2/2] net: dsa: mt7530: fix network connectivity with multiple CPU ports
    https://git.kernel.org/netdev/net/c/120a56b01bee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



