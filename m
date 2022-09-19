Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA0BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQIM/EJij0VCL0/KLKnA4As/obLNORXFYtrVRXtkL68=; b=oN8GqL9hKpGiLxgw/NoD9Ys6qQ
	CKHY7Fy45fUHD4slpTjDPGifhANw7PFHe9MTgHqVoe2y/WZHRYuaPPc1xU5WcRddGLBEtbItt+ej7
	//2IH7Eqdwt8fknwVxtRtdjVmaQtqIxJuVCInlf7PWNqL2x5rpGuJ3aAt2lCJtmrSektEZN2cGEWI
	0kxjGnw1D98CDC++j5wTPewJ3BwoVP7VpKIIfLiveyxWspZxGr3PGn9Rta5iKmV55XPMQwo2WgQOq
	zgZpkkl9ZQmeWM8hpiAPPxl907jOf2SQlOXp5J0Qobu1tLnmGb7b7OBHGluNoc5C3eR4zFktQSmtT
	HSNmVNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEt1-00BUrk-TH; Mon, 19 Sep 2022 11:24:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaEsp-00BUoY-D9; Mon, 19 Sep 2022 11:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mQIM/EJij0VCL0/KLKnA4As/obLNORXFYtrVRXtkL68=; b=Uy73segPjVyktd8MoQvEluJ9Sh
	8UMlXvBQXgcmxdqKPCvnG0AJB5XTJrqI6TkyZbqzLgvj3De5Z8SaAM66xp2jYDyFPEyh5IoLJBoyV
	YnFSkxf+7niuxzR2BJeS+2IUuG63xeDlCLVR6SXgLpKW2GK3p64cjCvnfjEBFSlbhVt5LwUBoty/0
	17xzYlZme8iC9EEtdlDJLQ6nK5GSU+zmxYvhlmyPJiY/l4nLkPJKT6yULBWYHKzZ1YSxRkPJquYcW
	16AZAqjaiImN+9RUOneXZF5KblFKbB4dTrNfXa1amvIj0XOknpHPV8q1ZVxCVKiFwppyWVpbxHQNp
	C+IMmD4g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34400)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oaEsa-0000no-KQ; Mon, 19 Sep 2022 12:24:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oaEsX-0006Lj-R3; Mon, 19 Sep 2022 12:23:57 +0100
Date: Mon, 19 Sep 2022 12:23:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 5/5] net: mediatek: sgmii: refactor power
 cycling into mtk_pcs_config()
Message-ID: <YyhRTV7mh9emXl4v@shell.armlinux.org.uk>
References: <20220919083713.730512-1-lynxis@fe80.eu>
 <20220919083713.730512-6-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919083713.730512-6-lynxis@fe80.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_042415_468197_766FFD3D 
X-CRM114-Status: GOOD (  22.63  )
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

On Mon, Sep 19, 2022 at 10:37:12AM +0200, Alexander Couzens wrote:
> Both code paths (autonegotiated and force mode) are power cycling
> the phy. Move power cycling code to the caller to remove code
> duplicity.

I think we can do more consolidation here - and it probably makes sense
to do in another patch.

> diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> index 4c8e8c7b1d32..50f605208295 100644
> --- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> +++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> @@ -25,9 +25,6 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs, phy_interface_t interface
>  {
>  	unsigned int val;
>  
> -	/* PHYA power down */
> -	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
> -
>  	/* Set SGMII phy speed */
>  	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
>  	val &= ~RG_PHY_SPEED_MASK;
> @@ -72,9 +57,6 @@ static int mtk_pcs_setup_mode_force(struct mtk_pcs *mpcs,
>  {
>  	unsigned int val;
>  
> -	/* PHYA power down */
> -	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
> -
>  	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
>  	val &= ~RG_PHY_SPEED_MASK;
>  	if (interface == PHY_INTERFACE_MODE_2500BASEX)

After powering the PHY down, the next thing that is done is to configure
the speed. Even with my comments on patch 4, this can still be
consolidated.

> @@ -115,12 +85,27 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
>  	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);

	unsigned int val;

>  	int err = 0;
>  
> +	/* PHYA power down */
> +	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL, SGMII_PHYA_PWD);
> +

	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
	val &= ~RG_PHY_SPEED_MASK;
	if (interface == PHY_INTERFACE_MODE_2500BASEX)
		val |= RG_PHY_SPEED_3_125G;
	regmap_write(mpcs->regmap, mpcs->ana_rgc3, val);

which would make logical sense to do here, so we always configure the
speed for the PCS correctly.

That then leaves the configuration of SGMSYS_PCS_CONTROL_1 and
SGMSYS_SGMII_MODE, which I think could also be consolidated, but I'll
leave that to those with the hardware to make that decision.

Reading between the lines of the code in this driver, it looks to me
like this hardware supports only SGMII, but doesn't actually support
1000base-X and 2500base-X with negotiation. Is that correct? If so,
it would be good to add a mtk_pcs_validate() function that clears
ETHTOOL_LINK_MODE_Autoneg_BIT for these modes.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

