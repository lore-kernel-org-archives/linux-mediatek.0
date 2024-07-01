Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229D8C30653
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/Y9l+Rd3HK7Gl4L0Xlh42rc+2jPvnfIsa/UkkU5c+c=; b=UpF3JUwgmZJ08SCOPfi1SBYJ4u
	Y0GOqFPXaxycOXCiCf4+H84zWlx1X2MNVcIJig4IT97pulR53WMfke2YrVWeKyM2mF8LlkSBi22Xe
	ZCSDVvEF6db/MdMegLxguYcCt1eHg/fkuu6ckxCpbRzbcwfkISl5Zi57V3mzf2SkQJk7khWzmsF2L
	gtan0RH9Gl8Z4mG8vpYm30/DseX+xMKAG2AjgM9bieqa5YOWtwF3G/xV1NkgmoSWvMdnXq2OzUOG4
	AL4W1ohlmNl+Wdm4dNlSLcs/z9oBrlF13TM5W/gKqszSKPRS/oomDuJdWxyAGAOrBDD790D6LDxO4
	XUrni+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOF69-00000002sUq-2UeR;
	Mon, 01 Jul 2024 11:21:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOF5y-00000002sRs-3MCQ;
	Mon, 01 Jul 2024 11:21:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sOF5m-000000006YZ-0Ekn;
	Mon, 01 Jul 2024 11:21:06 +0000
Date: Mon, 1 Jul 2024 12:20:59 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v10 13/13] net: phy: mediatek: Remove
 unnecessary outer parens of "supported_triggers" var
Message-ID: <ZoKRDSVYD_JMhMqW@makrotopia.org>
References: <20240701105417.19941-1-SkyLake.Huang@mediatek.com>
 <20240701105417.19941-14-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701105417.19941-14-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_042118_865982_2FA53715 
X-CRM114-Status: GOOD (  15.87  )
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

On Mon, Jul 01, 2024 at 06:54:17PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch removes unnecessary outer parens of "supported_triggers" vars
> in mtk-ge.c & mtk-ge-soc.c to improve readability.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
> ---
> diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
> index 90f3990..050a4f7 100644
> --- a/drivers/net/phy/mediatek/mtk-ge.c
> +++ b/drivers/net/phy/mediatek/mtk-ge.c
> @@ -152,14 +152,14 @@ static int mt753x_phy_led_brightness_set(struct phy_device *phydev,
>  }
>  
>  static const unsigned long supported_triggers =
> -	(BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
> -	 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
> -	 BIT(TRIGGER_NETDEV_LINK)        |
> -	 BIT(TRIGGER_NETDEV_LINK_10)     |
> -	 BIT(TRIGGER_NETDEV_LINK_100)    |
> -	 BIT(TRIGGER_NETDEV_LINK_1000)   |
> -	 BIT(TRIGGER_NETDEV_RX)          |
> -	 BIT(TRIGGER_NETDEV_TX));
> +	BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
> +	BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
> +	BIT(TRIGGER_NETDEV_LINK)        |
> +	BIT(TRIGGER_NETDEV_LINK_10)     |
> +	BIT(TRIGGER_NETDEV_LINK_100)    |
> +	BIT(TRIGGER_NETDEV_LINK_1000)   |
> +	BIT(TRIGGER_NETDEV_RX)          |
> +	BIT(TRIGGER_NETDEV_TX);

Those lines are added within the same series by patch 06/13
("net: phy: mediatek: Hook LED helper functions in mtk-ge.c").
I get and like the idea of doing things one by one, but in this case
instead of editing what you have just added, better move the commit
removing the unnecessary parentheses somewhere before copying them to
the mtk-ge.c driver in patch 6/13.

All the rest looks good to me now.

