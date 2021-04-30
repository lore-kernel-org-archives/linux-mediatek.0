Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3FEC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 13:14:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67996610FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 13:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67996610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UhkDJw17rmATu19P7G5hLXk26aeiDzopfviC+OW19vM=; b=SEIJbJhpJUuKbXgqanbQyjTIJ
	Da4GbXwKcGpUyDw5u8LXXBZGR6aSX4/Etosno6A2lEVQ6XVdfvU64q5ej1Cy0dvWJGJikRTtn0Jzz
	3b0UDV5cjRRPT7PP5QPmsIVo7krSdtNHeocpP8l1hTzAshEUFqosAw/ID3MWmxHyAq/PFP9awulw+
	tBIuO/5g2cJePQpVm0ObNrn945ynHzs27A+M1f/4RFqYs4x7P7k2OZftRyX3lHCGbEDgNPVssRPRM
	eapbiWMhAa4GQKnIMbjTBUoqXEU8VQxwkVNDHFUOfR+m7oz9RoLeKEQj5r2n2kGl0T9OJR97Xns7m
	ulBvq5+gg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcSyB-007tSg-HR; Fri, 30 Apr 2021 13:14:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSy9-007tS9-D5
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 13:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Wsc6AoRCqpEGoiIuYsEX5aAkEhX0DF8eJbhKbx/D4/o=; b=jVC4TcPP+FqHW6Ad1zRY9E+NFr
 L5p6YK9RrcYESisc6YjZdVJynQLLBrqvVMVRl5o3su1MwxEE2EyTT1ssOESc8WLohFqM6eH4Fo9Hf
 oSJiUKqEQDhL2OGz3bVnTqRMCDYVEvdFxuVc8oTwSwaL6T+AjKEWoBcR8O0dkOvAYcc3kzcRjV5QW
 gjRX8ndumBaASrmeQtUaGUKY9/YE9A3qhKyZ8/DBm9VxxiUtfy69PsHnkbl3BxQ4C1eSwfLK825aN
 XiUfgaKW2ePUO8NFlQckveiOtfIGNtFx7Nn1HwM9+Pl6kfWH149+VzfO6ScQNxVUynPNGn33IcVP3
 GVL1S9Zg==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSy6-001Ogy-PQ
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 13:14:07 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lcSxy-001obc-OV; Fri, 30 Apr 2021 15:13:58 +0200
Date: Fri, 30 Apr 2021 15:13:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: DENG Qingfang <dqfext@gmail.com>, David Miller <davem@davemloft.net>,
 f.fainelli@gmail.com, hkallweit1@gmail.com, kuba@kernel.org,
 Landen.Chao@mediatek.com, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, sean.wang@mediatek.com,
 vivien.didelot@gmail.com, olteanv@gmail.com, robh+dt@kernel.org,
 linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 weijie.gao@mediatek.com, gch981213@gmail.com, opensource@vdorst.com,
 tglx@linutronix.de, maz@kernel.org
Subject: Re: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
Message-ID: <YIwCliT5NZT713WD@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com>
 <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
 <YIv7w8Wy81fmU5A+@lunn.ch>
 <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_061406_842720_8B7BAF0D 
X-CRM114-Status: GOOD (  10.34  )
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

On Fri, Apr 30, 2021 at 02:56:22PM +0200, Frank Wunderlich wrote:
> Hi
> 
> which ethernet-phy drivers do you mean?

drivers/net/phy.

> i found only combined phy-drivers with ethernet-handling (marvell,xilinx,mscc,ti) having the "phy-" prefix too
> 
> as i see something like this in drivers/phy/intel/
> 
> phy-intel-keembay-emmc.c
> phy-intel-keembay-usb.c
> 
> maybe this in drivers/phy/mediatek/
> 
> phy-mediatek-mt753x.c
> 
> ? maybe with additional -eth, but this seems redundant, as mt753x is an ethernet-switch
> 
> or like the other mtk-phys
> 
> phy-mtk-eth-mt7531.c (like phy-mtk-mipi-dsi.c,phy-mtk-hdmi.c,phy-mtk-hdmi-mt8173.c)

These are all examples of generic PHY drivers, not PHY drivers.

There is a lot of confusion between PHY drivers and generic PHY
drivers :-(

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
