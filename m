Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD59C25B7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EB7Pfgo7d2NaDQG2bI7LdmS0RfvQbmEUJWLNeSOUPE=; b=qL4EqMrutZ/QIQyF4tf52AXiFL
	8tm0eibqreJDP5OKVf6Y3PrzTHn9YdDdfnx0gDoH66qFdTNkpGzfQbOIXh7EBQMGet9gXJi4tfJ17
	DPJabDBnzkc84WYIYr50ylPp9aNKPPcf8qicpl71ZBxdUtxhldBQPmNmz6wRH+D8HCu+8edBe1eV8
	yeqRRcDFMIHdtq1FQYmxYi5qzlV/C1f25sIQtJGvYg94gCbETd4GxqaAB80qq4xZcjZ7IIan8Tstq
	aDu+yJjQSdl8/FjKV6CyOv7wBvIwGdhFygzMVAUGOg9uY0o8qAFmIQKsfCez9MnkHKM1uvIjFKIr8
	NlVykQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCd8j-0000000706u-0dPT;
	Thu, 30 May 2024 10:36:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCd8d-0000000705f-36LJ;
	Thu, 30 May 2024 10:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7EB7Pfgo7d2NaDQG2bI7LdmS0RfvQbmEUJWLNeSOUPE=; b=Vfjo8HafVgU85X8wT31+ClDAnG
	yFLvmJ1mBuR7Te0gX5R5ClsSqBm66It75TUU7WdBF/MreijEep3h3W6LOGOcOiHuHcN8L9lCZaZtL
	cranp4f/nde77Us43ZL3lRXJteXoOjiMCxpQjt1+RKf+LfIEmW9S+6UPVQw7ndtOZ4XYbY0xPedzS
	h7FCRBF3rpiZ+LzHS8Ga7SBoce/eVohOg08iGSmaFdtncg2fUpbXvCzDOmrJzAUslutJDcA5GWuEO
	GyIMRn8b4UFTd4X8rkcVoT3Bqnpi/n1L0if6hDboA8jP0s6Re+YCakFmC9pqE0g5fJ/GawGTYlXeK
	fJMoRYEg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42664)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sCd8I-0007GP-0U;
	Thu, 30 May 2024 11:35:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sCd8J-00054V-0z; Thu, 30 May 2024 11:35:43 +0100
Date: Thu, 30 May 2024 11:35:42 +0100
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
Subject: Re: [PATCH net-next v5 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <ZlhWfua01SCOor80@shell.armlinux.org.uk>
References: <20240530034844.11176-1-SkyLake.Huang@mediatek.com>
 <20240530034844.11176-6-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530034844.11176-6-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_033604_890541_34AD3173 
X-CRM114-Status: GOOD (  22.35  )
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

On Thu, May 30, 2024 at 11:48:44AM +0800, Sky Huang wrote:
> +static int mt798x_2p5ge_phy_config_aneg(struct phy_device *phydev)
> +{
> +	bool changed = false;
> +	u32 adv;
> +	int ret;
> +
> +	/* In fact, if we disable autoneg, we can't link up correctly:
> +	 *  2.5G/1G: Need AN to exchange master/slave information.
> +	 *  100M: Without AN, link starts at half duplex(According to IEEE 802.3-2018),
> +	 *        which this phy doesn't support.
> +	 *   10M: Deprecated in this ethernet phy.
> +	 */
> +	if (phydev->autoneg == AUTONEG_DISABLE)
> +		return -EOPNOTSUPP;

We have another driver (stmmac) where a platform driver is wanting to
put a hack in the ksettings_set() ethtool path to error out on
disabling AN for 1G speeds. This sounds like something that is
applicable to more than one hardware (and I've been wondering whether
it is universally true that 1G copper links and faster all require
AN to function.)

Thus, I'm wondering whether this is something that the core code should
be doing.

> +	/* This phy can't handle collision, and neither can (XFI)MAC it's connected to.
> +	 * Although it can do HDX handshake, it doesn't support CSMA/CD that HDX requires.
> +	 */

What the MAC can and can't do really has little bearing on what link
modes the PHY driver should be providing. It is the responsibility of
the MAC driver to appropriately change what is supported when attaching
to the PHY. If using phylink, this is done by phylink via the MAC driver
telling phylink what it is capable of via mac_capabilities.

> +static int mt798x_2p5ge_phy_get_rate_matching(struct phy_device *phydev,
> +					      phy_interface_t iface)
> +{
> +	if (iface == PHY_INTERFACE_MODE_XGMII)
> +		return RATE_MATCH_PAUSE;

You mention above XFI...

XFI is 10GBASE-R protocol to XFP module electrical standards.
SFI is 10GBASE-R protocol to SFP+ module electrical standards.

phy_interface_t is interested in the protocol. So, given that you
mention XFI, why doesn't this test for PHY_INTERFACE_MODE_10GBASER?

> +static int mt798x_2p5ge_phy_probe(struct phy_device *phydev)
> +{
> +	struct mtk_i2p5ge_phy_priv *priv;
> +
> +	priv = devm_kzalloc(&phydev->mdio.dev,
> +			    sizeof(struct mtk_i2p5ge_phy_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	switch (phydev->drv->phy_id) {
> +	case MTK_2P5GPHY_ID_MT7988:
> +		/* The original hardware only sets MDIO_DEVS_PMAPMD */
> +		phydev->c45_ids.mmds_present |= (MDIO_DEVS_PCS | MDIO_DEVS_AN |
> +						 MDIO_DEVS_VEND1 | MDIO_DEVS_VEND2);

No need for parens on the RHS. The RHS is an expression in its own
right, and there's no point in putting parens around the expression
to turn it into another expression!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

