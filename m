Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A8EC83F12
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcm8iFhg+0c6WYsWVIm3HUfcuIiftEfCHRbE95z0OwU=; b=PTRig2wT8475gogKQU5XiWal3O
	J852Q4WEXD8rU6jsJvRfdLqjOFYJrtffE7xkHpxBDf5gWqJn/Zyw+AAdxpfsXBbasLY3+RPDpYDxx
	f5rdCTA1ilvriTvROAIptQXbgSIaQnpOOUsVv83KSMKjC2z+BSz0xPJW9bN1+3pDnuhMp5A8k+vb1
	IZnqyk8VoThITuJUGPF51+awiMyXYs5ahXkYWGZ7jjVBHjQf1RndFBouZ9XGPaoHwONn5NtU+Joai
	2FpbVuYF7xQgS2NcePA15ipDxjD/jebirDM6UiVUPHnEEQhM1bgPfDK2BAfzUpD5/5G4fxtQsnG6r
	t6JXTVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qayUz-00BZIO-1i;
	Tue, 29 Aug 2023 13:11:13 +0000
Received: from [2001:4d48:ad52:32c8:5054:ff:fe00:142] (helo=pandora.armlinux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qayUv-00BZHS-1M;
	Tue, 29 Aug 2023 13:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rcm8iFhg+0c6WYsWVIm3HUfcuIiftEfCHRbE95z0OwU=; b=qFpDv/O3VPuF6e9/9goDGLLs3B
	2ThJt0YRs/oaGuIj4mtAZex2qlm7Q/Tsh3IgAIiasysaOxyldJGetCvTUlaCB+wuydP1kadMNVlUE
	g6EtuFIHAnJMAnmp9jQM/BVDcvZtgvCi1pd9j3R4tEaawLasYVE2d3oLr+JISjVENDlP36XoPVR4Q
	APlO24Ei/wwIoD5l5dzYCKSO6FNAJyhsnrYk7ooYIO0hydN+r9fH9tZyAtoWNH+q8ioHb24nwQpmt
	R3/pLtsKgG4oiVWawF6F6wWB+a9AaAEQs5DGpyCy1ggzXqtMzvVPadFjC7l5ZebgtLCgGGM/y9snU
	qAqCdsBA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51830)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qayUa-0000Tm-2N;
	Tue, 29 Aug 2023 14:10:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qayUS-0004g8-6F; Tue, 29 Aug 2023 14:10:40 +0100
Date: Tue, 29 Aug 2023 14:10:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: clarify difference between
 "interface" and "phy_interface"
Message-ID: <ZO3uUIFgtkIHHqjL@shell.armlinux.org.uk>
References: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk>
 <12274852.O9o76ZdvQC@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12274852.O9o76ZdvQC@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_061109_463750_EAC042C1 
X-CRM114-Status: GOOD (  16.73  )
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

On Tue, Aug 29, 2023 at 02:38:33PM +0200, Alexander Stein wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> > ff330423ee66..35f4b1484029 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -419,9 +419,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8
> > *mac) return ERR_PTR(phy_mode);
> > 
> >  	plat->phy_interface = phy_mode;
> > -	plat->interface = stmmac_of_get_mac_mode(np);
> > -	if (plat->interface < 0)
> > -		plat->interface = plat->phy_interface;
> > +	plat->mac_interface = stmmac_of_get_mac_mode(np);
> > +	if (plat->mac_interface < 0)
> 
> This check is never true as mac_interface is now an unsigned enum 
> (phy_interface_t). Thus mac_interface is not set to phy_interface resulting in 
> an invalid mac_interface. My platform (arch/arm64/boot/dts/freescale/imx8mp-
> tqma8mpql-mba8mpxl.dts) fails to probe now.

Thanks for catching that. Does this patch fix it for you?

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 231152ee5a32..0451d2c2aa43 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -420,9 +420,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		return ERR_PTR(phy_mode);
 
 	plat->phy_interface = phy_mode;
-	plat->interface = stmmac_of_get_mac_mode(np);
-	if (plat->interface < 0)
-		plat->interface = plat->phy_interface;
+
+	rc = stmmac_of_get_mac_mode(np);
+	plat->interface = rc < 0 ? plat->phy_interface : rc;
 
 	/* Some wrapper drivers still rely on phy_node. Let's save it while
 	 * they are not converted to phylink. */

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

