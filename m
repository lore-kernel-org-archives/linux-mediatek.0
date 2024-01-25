Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2FEC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCQ9Yw4nlULNLX5Qw0mR8/RqZHNvQSSpxlZbvgmqlzg=; b=DHiiwnnLa5dkzW29pLAL/utSO+
	CoahV0DuV9GqUSsJhlfIapxVLomLGbToABTZQMFC4G+ypsTEjlFZZ1RBjSwKd7ccyorgXYAilTGRE
	EbkEeCKJQ9nnEtlNpdy1YSWaeCYOFNKZflYFAqXk+xrva9i2USXseiFfaULaiRJNvxm05ZwslHsQS
	nG9zweUs1OOdCuGHAQSjrdh/makqDpwuSDh2r8mjqtiV1UmX6Tgtb+mrCiNhu0bCWG50U5HZ3R5lm
	/Th+13rAhjAxNfe/xgNNM9SsXdLd/Pd8+hSjwV9OU4otdmtlA3oW8txqLltzwBMeotzRqcJ4prBYh
	gDK7/t2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1DZ-00000000W5U-1d65;
	Thu, 25 Jan 2024 15:00:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1DW-00000000W3k-0Okc;
	Thu, 25 Jan 2024 15:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 88584CE33FE;
	Thu, 25 Jan 2024 15:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A49EBC43390;
	Thu, 25 Jan 2024 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706194826;
	bh=eJ0fPZy5H3HPFj4qbHHzlx5qHvg0wqNVEjDL2Z6lfPA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MSpXFasW/lWHRJZ/rNGQYjVPz2RcWSJE1wv0XkdNwcjHHyt7zD48+qzoaCT2ry07L
	 jujebahj6eccGcPEGAN2vPBuj/TXJLe3Y4srogK0w5tq3q4AqNSI2GkiF7gx5TCE9h
	 jnh+PpPOc7U/yTlymPLdNmeXPnhixcT/xAKv14M3Q+WuRDiIlMeANS5woqHUMiK05Y
	 HC/7jTwGIM7wIqSh6fQUJlhFE128uRfxy8nuj0wHXYoP23WHRLZAQdAp7o16xnnuKV
	 NoKb88xMwchfej1nh7WGg9RBpp9xoKs9z7B88ky/cAjuXYy1D0HRjAaDuXdgJIrteQ
	 yrV6+ltSsphUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 867FBD8C962;
	Thu, 25 Jan 2024 15:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: dsa: mt7530: support OF-based registration of
 switch MDIO bus
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170619482654.13332.18301642158515027225.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 15:00:26 +0000
References: <20240122053431.7751-1-arinc.unal@arinc9.com>
In-Reply-To: <20240122053431.7751-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPg==?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, mail@david-bauer.net,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, luizluca@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_070034_374778_38FBF762 
X-CRM114-Status: UNSURE (   8.26  )
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

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 22 Jan 2024 08:34:31 +0300 you wrote:
> Currently the MDIO bus of the switches the MT7530 DSA subdriver controls
> can only be registered as non-OF-based. Bring support for registering the
> bus OF-based.
> 
> The subdrivers that control switches [with MDIO bus] probed on OF must
> follow this logic to support all cases properly:
> 
> [...]

Here is the summary with links:
  - [net-next] net: dsa: mt7530: support OF-based registration of switch MDIO bus
    https://git.kernel.org/netdev/net-next/c/91374ba537bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



