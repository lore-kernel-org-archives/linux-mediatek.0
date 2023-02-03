Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E66FC05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Hs+VSiLtw/0ycdRLnref8xrRHiTeKna2LFz/+6QKUM=; b=eB6kX4nij6OVvgnesGyJIPr0Ry
	K7l5SRwq2Zq9w0mc70gq/GkGSFiLH8b0hkNVRysxV+l3tC915mZhOUM7v76J5a8ZLFXXFlJSDQheN
	ZxJFB+aDIigo1DvmKn3D4h845aUBEATlt3KpaGpX69LcjXrrj47AQIR6u/GuirVJsY8pahHOJ4Xe4
	euiKe+uUjtMkdpggGj5gxNj5eRzXBSqw6LogoHfCC1DVGvEf032vu9C4uQg4oxdf2mDZujR0IMeYq
	LsqB7FYT36e18HuqGChNeYuVHQuU3Hf79C09o3X0Q04c7iYsybb/SoDtRy41YOBNErf/0FQJkcy7f
	jT/yVY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxY9-002ZLk-LI; Fri, 03 Feb 2023 15:00:25 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxY5-002ZL7-US; Fri, 03 Feb 2023 15:00:23 +0000
Received: by mail-ej1-x635.google.com with SMTP id bk15so16031147ejb.9;
        Fri, 03 Feb 2023 07:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Hs+VSiLtw/0ycdRLnref8xrRHiTeKna2LFz/+6QKUM=;
        b=SsFWjrzkDBkMP+/hywWuJ2cMsYTnLdbgvmIoBD+PNXOVxNALzCD443cghDI+XabBee
         qXmdXSgVUd6uubZXh1LdhkT0tHgc1HHS2icDerWEvhlOx3DPNfE+MFET3vntSeI4SpCP
         Wh6Nihwct+YW2YazN94lMwrX/GuLktOGcf6BuZ+US/n2avNwHpZmJG4leg2s+qI3y8I1
         crFQiI4cs8iA6c9wjEpaWqoOlx9f0LX/4XjXOJrNSPiXxakCm+KzIft9ilruKEdJwdpI
         UelLAS+un3wbNUvYF4W5CNXLi6trXiIXIR4H1cHV8jxPHAM5bGUR52wWTeIXtLvppR5B
         IQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Hs+VSiLtw/0ycdRLnref8xrRHiTeKna2LFz/+6QKUM=;
        b=2peBrF/huASiQwb8Jz9a3eIv6p+aJwq0swD/Y5uV8oilAz7Mc/9Sq0ch/ZrHEDj0RD
         O1fSciZ0wJVqJx33TcgMGKrZAk6qOZv6tLaffhLNojv0Poe59UETQW7lHa7dEROL3+Ob
         0zyF5IVUjSdeJrOLV0GpwA8ErAgl9B9ql3KZRHudR9hxf483gpuPL4kNq5eU0dM6w8hG
         Gkd3s9JuHo7WhrY2yU38aNFnpszK1KhCfCEwg7PMN1mKbXreMCiyVqbui6zmTkNp6Vw0
         ZyV50ulXf8YR5bH/MBXbNFYgqpVlTakOfR2jX/bz2Zva1E/O0DuKrQhz59HTvwAG/DiP
         rLZw==
X-Gm-Message-State: AO0yUKWbfbYSw0Cm6kK5wkg1uda2jEieRmiwsmDedO7eoIlPCnFbLPfC
	NeeWDchoGdufB6Jr1evR2eE=
X-Google-Smtp-Source: AK7set9j91UKcYEbur5rEMc26mRxeJGocDFMSWfjHwCaDkxjCaw5J1ct9ODqrAKzioMF3HcmNiA/Zg==
X-Received: by 2002:a17:906:e118:b0:878:7662:7c8e with SMTP id gj24-20020a170906e11800b0087876627c8emr10841306ejb.55.1675436417906;
        Fri, 03 Feb 2023 07:00:17 -0800 (PST)
Received: from skbuf ([188.26.57.116])
        by smtp.gmail.com with ESMTPSA id g6-20020a1709061c8600b007c14ae38a80sm1450453ejh.122.2023.02.03.07.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 07:00:17 -0800 (PST)
Date: Fri, 3 Feb 2023 17:00:14 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 7/9] net: pcs: add driver for MediaTek SGMII PCS
Message-ID: <20230203150014.ugkasp4rq5arqs6s@skbuf>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <30f3ff512a2082ba4cf58bf6098f2ed776051976.1675407169.git.daniel@makrotopia.org>
 <Y90Wxb8iuCRo06yr@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y90Wxb8iuCRo06yr@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_070022_020148_116D1763 
X-CRM114-Status: GOOD (  18.04  )
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

On Fri, Feb 03, 2023 at 03:14:29PM +0100, Andrew Lunn wrote:
> > index 6e7e6c346a3e..cf65646656e9 100644
> > --- a/drivers/net/pcs/Kconfig
> > +++ b/drivers/net/pcs/Kconfig
> > @@ -18,6 +18,12 @@ config PCS_LYNX
> >  	  This module provides helpers to phylink for managing the Lynx PCS
> >  	  which is part of the Layerscape and QorIQ Ethernet SERDES.
> >  
> > +config PCS_MTK
> > +	tristate
> > +	help
> > +	  This module provides helpers to phylink for managing the LynxI PCS
> > +	  which is part of MediaTek's SoC and Ethernet switch ICs.
> 
> You should probably have a more specific name, for when MTK produces a
> new PCS which is completely different.
> 
> Also, how similar is this LynxI PCS to the Lynx PCS?

Probably not very similar. Here's the Mediatek 32-bit memory map,
translated by me to a 16-bit MDIO memory map:

/* SGMII subsystem config registers */
/* BMCR (low 16) BMSR (high 16) */
#define SGMSYS_PCS_CONTROL_1		0x0		// BMCR at MDIO addr 0x0, BMSR at 0x1, aka standard

#define SGMSYS_PCS_DEVICE_ID		0x4		// PHYSID1 at 0x2, PHYSID2 at 0x3, aka standard

#define SGMSYS_PCS_ADVERTISE		0x8		// MII_ADV at 0x4, MII_LPA at 0x5

#define SGMSYS_PCS_SCRATCH		0x14		// MDIO address 0xa

/* Register to programmable link timer, the unit in 2 * 8ns */
#define SGMSYS_PCS_LINK_TIMER		0x18		// MDIO address 0xc

/* Register to control remote fault */
#define SGMSYS_SGMII_MODE		0x20		// MDIO address 0x10

/* Register to reset SGMII design */
#define SGMII_RESERVED_0		0x34		// MDIO address 0x1a

/* Register to set SGMII speed, ANA RG_ Control Signals III */
#define SGMSYS_ANA_RG_CS3		0x2028		// not sure how to access this through C22, OTOH not used?

/* Register to power up QPHY */
#define SGMSYS_QPHY_PWR_STATE_CTRL	0xe8		// again, not sure how to access through C22


Compared to these definitions for Lynx, the rest being standard regs:

#define LINK_TIMER_LO			0x12
#define LINK_TIMER_HI			0x13
#define IF_MODE				0x14

So the standard bits appear to be common, the vendor extensions different.
When I say common, I only take into consideration the memory map, not
the differences in handling. For example, what Lynx handles as a single
call to phylink_mii_c22_pcs_get_state(), the Mediatek PCS handles as a
call to mtk_pcs_get_state().

