Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C51C636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsUTsmdI8FTtESXmakJcIlKRIPwSoiJ/RU2vJ1NPEmE=; b=qBDd3XGf/2oyPO8otD1Uek2QjI
	tNsanbdJy5c/Uc0TeDuo6JCA2qr9hvjQa52cwhW1yw6r7mLQJP9RiSBDWGqjwT4qo6le8brYtOEZh
	L4t1UNUl1eLUj9JNFjrgZxEv7nPBaSOJMWhnDNyO3OH3n7hkTTbJ3/zXsLEg7uxg2WTj37+mBCp7y
	B5D4Gt39FHviJ8BGYjD/qaXN0INwHeQ3nA5vZmTXwLqhZY3NMaoicxdN7pXXv1jSxWvO3maoAqaKD
	TUUmheBumbXdXbmur77SpmPexRY1WutDFWhJAczLpYK0Xpj2l7Sa5nyt39TBt3DODScYTpWUot08A
	NNl5soiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQpQz-009VAP-Rx; Sat, 11 Feb 2023 12:56:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQpQw-009V9Q-Tt; Sat, 11 Feb 2023 12:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UsUTsmdI8FTtESXmakJcIlKRIPwSoiJ/RU2vJ1NPEmE=; b=P5HIKzzEsbVCrGzHd2D0+hA7GJ
	jKEl5/gZ1P4KQR2DccL40wWeiClhC8wJWMgRcOsilLhnPcqdVXY7tEtvsTJkEvNPO3SEH6vQbc2mA
	AI1wsAhcjxwg4p5r4CP0OogDEAZY59+F/yilJFpCTmef4GY2trplq7Tt5d0dA3Ttt92FV1nzHAMB4
	NwHTioxn1sHnorllbjneZ2+Owob7WE2gEPsDgDyipvGnAMZz5n5TfvCwAoDIhSiACrCy0Itwxze5t
	Zp6xsVgYX+CXbLOA6gsi//fYfMn5E8cILX5gHaE8eBhr5Clg0lFddCcLxmRlK4QK01bs520y2Y3V6
	zaR3Wg8A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56424)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQpQu-0001c9-If; Sat, 11 Feb 2023 12:56:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQpQt-00017w-5s; Sat, 11 Feb 2023 12:56:47 +0000
Date: Sat, 11 Feb 2023 12:56:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v4 11/12] net: ethernet: mtk_eth_soc: switch to external
 PCS driver
Message-ID: <Y+eQj5LUTt4C5qgP@shell.armlinux.org.uk>
References: <cover.1676071507.git.daniel@makrotopia.org>
 <7886ca664ba6ca712aac127b20380d3d2a1a4d1f.1676071508.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7886ca664ba6ca712aac127b20380d3d2a1a4d1f.1676071508.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_045651_006051_AD6F7995 
X-CRM114-Status: GOOD (  17.94  )
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

On Fri, Feb 10, 2023 at 11:40:22PM +0000, Daniel Golle wrote:
> +		eth->sgmii->dev = eth->dev;
>  		err = mtk_sgmii_init(eth->sgmii, pdev->dev.of_node,
>  				     eth->soc->ana_rgc3);

From what I can tell, it looks like sgmii->dev is only used within
mtk_sgmii_init() and nowhere else, so does it make sense to store
this in the structure rather than passing it as another argument to
this function? Seems a little wasteful for something that is only
used there.

> diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> index 67965a6b57a4..f10621fc5baa 100644
> --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> @@ -146,6 +146,10 @@ static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned int mode,
>  		bmcr = 0;
>  
>  	if (mpcs->interface != interface) {
> +		link_timer = phylink_get_link_timer_ns(interface);
> +		if (link_timer < 0)
> +			return link_timer;
> +
>  		/* PHYA power down */
>  		regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
>  				   SGMII_PHYA_PWD, SGMII_PHYA_PWD);
> @@ -168,11 +172,7 @@ static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned int mode,
>  		regmap_update_bits(mpcs->regmap, mpcs->ana_rgc3,
>  				   RG_PHY_SPEED_MASK, rgc3);
>  
> -		/* Setup the link timer and QPHY power up inside SGMIISYS */
> -		link_timer = phylink_get_link_timer_ns(interface);
> -		if (link_timer < 0)
> -			return link_timer;
> -
> +		/* Setup the link timer */
>  		regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER, link_timer / 2 / 8);
>  
>  		mpcs->interface = interface;

I'm guessing you meant to squash that into patch 10 rather than this
patch?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

