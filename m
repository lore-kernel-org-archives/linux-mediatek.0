Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB57CFA771
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gjkpj7klBDx4CtJ5kaQxWvklTYn7Jg83Vuq32kjyQEA=; b=s6nnLrHUuHQ7P2kzQEQk4WuQtl
	SoWS6YsEYJ1gcxQwgkIhlv9fDBsdIB5i9Ccqp2UUNBan45arBIeD7LhURE2gGMF2d5b+u3mbwkgep
	C/6rXl/x4Ga+zpL1pjNA42qc4UA1KcBetZeucFDYpMqqqgEvF2/P3bJW06BDY+HgN4PiuMyLV1P5d
	NzB8A+PKqxGOP4CsquKHVkDTILgPGKl5IkQZCi2tS77bCrAoNvomGUimcp+yMMLU4KcFe5y5a0Njd
	aJLQXuCCoeIHKvQR+PaoTgddXaVPL8nNtEMSJa3yxL50OUP5hSxb5k2PSYan6lAiwNWn6kCTn2BYJ
	F88Huayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swh7x-0000000CFVs-48We;
	Fri, 04 Oct 2024 12:09:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swh6R-0000000CF6g-22Mi;
	Fri, 04 Oct 2024 12:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gjkpj7klBDx4CtJ5kaQxWvklTYn7Jg83Vuq32kjyQEA=; b=qqOsVPUC7pi+5Idm9LgCg/j6Ts
	0CfnRuuIZesmuPfkSBRC8LGDUQw55gLfwTnw022eB4RdQPSXHCydnY+s0QBAsB7PkmviwNEOzQO6y
	+NWPYhl+ravyBhbNfpAdK8NwumIR1ozgD9qjibiDHZpMSPs7kUtYatX9c+4hMHzoogWQsw+WMRPLy
	dwjs/5YBseAuAzC+5+H8bdKvYp0VrEJNIwk1g9qRLXFDEZAqksf2bj96gHk5213tiWATwp/qqwnRb
	jpvRu0WgaDaN1ae1OqwrzQp6zoI9ctt+M+G2X1r49vWlUG77JnlXc50t4KUQsKa3rbRIMJR0PN/gy
	AnfadSbw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56390)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1swh6A-0001ui-1q;
	Fri, 04 Oct 2024 13:07:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1swh64-0001AB-2a;
	Fri, 04 Oct 2024 13:07:48 +0100
Date: Fri, 4 Oct 2024 13:07:48 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next 8/9] net: phy: mediatek: Change mtk-ge-soc.c
 line wrapping
Message-ID: <Zv_alBqCPvrSzRPL@shell.armlinux.org.uk>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
 <20241004102413.5838-9-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004102413.5838-9-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_050811_589271_34141D65 
X-CRM114-Status: GOOD (  15.33  )
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

Hi,

On Fri, Oct 04, 2024 at 06:24:12PM +0800, Sky Huang wrote:
> diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
> index 26c2183..cb6838b 100644
> --- a/drivers/net/phy/mediatek/mtk-ge-soc.c
> +++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
> @@ -295,7 +295,8 @@ static int cal_cycle(struct phy_device *phydev, int devad,
>  	ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_VEND1,
>  					MTK_PHY_RG_AD_CAL_CLK, reg_val,
>  					reg_val & MTK_PHY_DA_CAL_CLK, 500,
> -					ANALOG_INTERNAL_OPERATION_MAX_US, false);
> +					ANALOG_INTERNAL_OPERATION_MAX_US,
> +					false);

This is fine.

>  	if (ret) {
>  		phydev_err(phydev, "Calibration cycle timeout\n");
>  		return ret;
> @@ -304,7 +305,7 @@ static int cal_cycle(struct phy_device *phydev, int devad,
>  	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
>  			   MTK_PHY_DA_CALIN_FLAG);
>  	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP) >>
> -			   MTK_PHY_AD_CAL_COMP_OUT_SHIFT;
> +	      MTK_PHY_AD_CAL_COMP_OUT_SHIFT;

Before cleaning this up, please first make it propagate any error code
correctly (a bug fix):

	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP);
	if (ret < 0)
		return ret;

	ret >>= MTK_PHY_AD_CAL_COMP_OUT_SHIFT;

and then you won't need to change it in this patch. A better solution to
the shift would be to look at FIELD_GET().

>  	phydev_dbg(phydev, "cal_val: 0x%x, ret: %d\n", cal_val, ret);
>  
>  	return ret;
> @@ -394,38 +395,46 @@ static int tx_amp_fill_result(struct phy_device *phydev, u16 *buf)
>  	}
>  
>  	phy_modify_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_TXVLD_DA_RG,
> -		       MTK_PHY_DA_TX_I2MPB_A_GBE_MASK, (buf[0] + bias[0]) << 10);
> +		       MTK_PHY_DA_TX_I2MPB_A_GBE_MASK,
> +		       (buf[0] + bias[0]) << 10);

Another cleanup would be to use FIELD_PREP() for these.

> -static const unsigned long supported_triggers = (BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
> -						 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
> -						 BIT(TRIGGER_NETDEV_LINK)        |
> -						 BIT(TRIGGER_NETDEV_LINK_10)     |
> -						 BIT(TRIGGER_NETDEV_LINK_100)    |
> -						 BIT(TRIGGER_NETDEV_LINK_1000)   |
> -						 BIT(TRIGGER_NETDEV_RX)          |
> -						 BIT(TRIGGER_NETDEV_TX));
> +static const unsigned long supported_triggers =
> +	(BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
> +	 BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
> +	 BIT(TRIGGER_NETDEV_LINK)        |
> +	 BIT(TRIGGER_NETDEV_LINK_10)     |
> +	 BIT(TRIGGER_NETDEV_LINK_100)    |
> +	 BIT(TRIGGER_NETDEV_LINK_1000)   |
> +	 BIT(TRIGGER_NETDEV_RX)          |
> +	 BIT(TRIGGER_NETDEV_TX));

The outer parens are unnecessary, and thus could be removed.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

