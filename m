Return-Path: <SRS0=4N1K=OJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A610C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Sep 2021 11:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1815561251
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Sep 2021 11:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1815561251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCkHPCZVVFZqFk55y633xK8zC6ps6wFyYrDtgmjJOXs=; b=Fb2pCGFjoMs7ZY
	2N+w5iKrtAkQ4bhxzb5+OLgVlUbRA6F8dA6kFM1kpKo78jFxdU+EJFRHJW0xxf00QU+hVV8q5A3PW
	fUMEVQ0OcqX2QDH1hJhj0Y65rE/3bEdP3/5x56RAlvFBFdmkl5TV4q4A7qpc3vS1x9LPXQXheUTP4
	ftjBbrDswtKi7nMNAMdiU2HgHnPdHbml7WtFncQRprZDmhRU6Ro4xVMDvQPZuQo+shzqjBUOC7u+S
	49zy/kf7qdhSWz0tZGVxYgNpgVCqAXQbjidNQqq62i2IuVGTa7Jswuyit8m2UVGyo5ka7oAslQk+P
	/KtSY0+lwGFdtHyYkW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRurx-00HAnk-CG; Sun, 19 Sep 2021 11:20:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRuri-00HAlo-7l; Sun, 19 Sep 2021 11:20:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 18F7B61268;
 Sun, 19 Sep 2021 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632050409;
 bh=YR2ospmGzJIdN6tfHN8jrcW1D+cYzlSbU2st2GqCN9A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IvXHEU2lNJdNoLWcslPMthZBWBQ3ieUisX41if15k0+nnYREgiysKs1e9WoIdrSdw
 9WErVgZ4+TimbNUrp7oiW2fWdFu5eX3msovbfIFIVtPye4zHNozZ85EzEu1Xccjl6Y
 +7iYPI23SwlDWa6m+fD5bx9gSfwDCvdZUbaB8qMarYDFMQrSw7+OKwtNDvysorigMj
 Nc0xr64TGd4LF7DIwNZ/jD5PtSQEqiygpYDWLQCInTm+5hNHST2b8cA30PEipGwy4S
 PaLJ7SU+vhECvQN9mMt8S228HBhJUoHtvHg1Har3BPFCqStOL89JvfDkpWvWI9zajn
 n2B4VR91lzqpQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2 net 0/5] Make DSA switch drivers compatible with masters
 which unregister on shutdown
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163205040900.14261.5733686295786706203.git-patchwork-notify@kernel.org>
Date: Sun, 19 Sep 2021 11:20:09 +0000
References: <20210917133436.553995-1-vladimir.oltean@nxp.com>
In-Reply-To: <20210917133436.553995-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 kuba@kernel.org, kurt@linutronix.de, hauke@hauke-m.de,
 woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
 sean.wang@mediatek.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 matthias.bgg@gmail.com, claudiu.manoil@nxp.com,
 alexandre.belloni@bootlin.com, linus.walleij@linaro.org,
 george.mccollister@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 linux@rempel-privat.de, m.grzeschik@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, LinoSanfilippo@gmx.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_042010_341319_17E8B4BA 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net.git (refs/heads/master):

On Fri, 17 Sep 2021 16:34:31 +0300 you wrote:
> Changes in v2:
> - fix build for b53_mmap
> - use unregister_netdevice_many
> 
> It was reported by Lino here:
> 
> https://lore.kernel.org/netdev/20210909095324.12978-1-LinoSanfilippo@gmx.de/
> 
> [...]

Here is the summary with links:
  - [v2,net,1/5] net: mdio: introduce a shutdown method to mdio device drivers
    https://git.kernel.org/netdev/net/c/cf9579976f72
  - [v2,net,2/5] net: dsa: be compatible with masters which unregister on shutdown
    https://git.kernel.org/netdev/net/c/0650bf52b31f
  - [v2,net,3/5] net: dsa: hellcreek: be compatible with masters which unregister on shutdown
    https://git.kernel.org/netdev/net/c/46baae56e100
  - [v2,net,4/5] net: dsa: microchip: ksz8863: be compatible with masters which unregister on shutdown
    https://git.kernel.org/netdev/net/c/fe4053078cd0
  - [v2,net,5/5] net: dsa: xrs700x: be compatible with masters which unregister on shutdown
    https://git.kernel.org/netdev/net/c/a68e9da48568

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
