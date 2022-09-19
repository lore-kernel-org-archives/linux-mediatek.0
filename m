Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEA9C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 13:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2eZFXkRGCADI8G4ZiLU6FZ1217+LNWKnbyMSfFCMqI=; b=y5TWbv5AjynUv+P+tpL9ceEc8a
	ZSnHugsxR2slOxsKfxnBqOHA48wMcRoiCR3JXq5Bm2oJxwCQhrmOTZSslIKYvdj/DtRwHqyjLD7a3
	5TgX5SzzaowTyH8iXcn/4h9C8aA0mK/0Qgh4sV0QVugKm/E1UHvL52MJvMCDiow1BE1eeDgi8w9GP
	luIY9qbatizRutGZ1cQ7J7kokQ9h8EvzA7hu84xyjw4xNKRdzeGYXGi7CMne11UQKfzK5qki4zz6F
	gW52vzySlHCWN/S+HmSk05uEkmcq642TS/d26enrDxt+hWwJuyeVdu7puhHxIIabk6wQTclTQ7Gsx
	pCEA5E3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaHIQ-00ByGg-Mi; Mon, 19 Sep 2022 13:58:50 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaHIF-00ByF8-LS; Mon, 19 Sep 2022 13:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=y2eZFXkRGCADI8G4ZiLU6FZ1217+LNWKnbyMSfFCMqI=; b=PUEX4Jv/i8vf9eVrlZywyq7r2w
	v8LyfhzVohWEZO/2zG+eaIOicaQP+CCg//8Fb94L+jEIEhJ12jwKfMUppiOycjx8yTp6I4xpwpMnH
	d1KxHVjLEk6UXxOXbQnYFTZEX50gkc0xs2YiPEhEWazgQ76NnQZys81tqUnwW8enHzr2eTRML7Fnd
	3c+Ypffp8Dl/RduZn5Iqc9rJ4KL8YcxnACcfVfUWS+5VaR8KVMAmDhB/MBoGDciXMa6JYYzgu3fp7
	dgnoXFE7PIhE4EdtipcheQM/wy9SLTMalG41KwAAwBzcF6pgze96CsVjCsIKyb3PyrGMbHIs9HG7+
	HELNZOeA==;
Received: from [92.206.252.27] (helo=javelin)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oaHFn-0018kh-Hc; Mon, 19 Sep 2022 13:56:07 +0000
Date: Mon, 19 Sep 2022 15:56:06 +0200
From: Alexander 'lynxis' Couzens <lynxis@fe80.eu>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Daniel Golle <daniel@makrotopia.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 5/5] net: mediatek: sgmii: refactor power
 cycling into mtk_pcs_config()
Message-ID: <20220919155606.3270478d@javelin>
In-Reply-To: <YyhRTV7mh9emXl4v@shell.armlinux.org.uk>
References: <20220919083713.730512-1-lynxis@fe80.eu>
	<20220919083713.730512-6-lynxis@fe80.eu>
	<YyhRTV7mh9emXl4v@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_065839_729392_F8E090F1 
X-CRM114-Status: GOOD (  23.20  )
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

> > -	/* PHYA power down */
> > -	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
> > SGMII_PHYA_PWD); -
> >  	/* Set SGMII phy speed */
> >  	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
> >  	val &= ~RG_PHY_SPEED_MASK;
> > @@ -72,9 +57,6 @@ static int mtk_pcs_setup_mode_force(struct
> > mtk_pcs *mpcs, {
> >  	unsigned int val;
> >  
> > -	/* PHYA power down */
> > -	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
> > SGMII_PHYA_PWD); -
> >  	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
> >  	val &= ~RG_PHY_SPEED_MASK;
> >  	if (interface == PHY_INTERFACE_MODE_2500BASEX)  
> 
> After powering the PHY down, the next thing that is done is to
> configure the speed. Even with my comments on patch 4, this can still
> be consolidated.

I'll move more code out of the functions.

> 
> > @@ -115,12 +85,27 @@ static int mtk_pcs_config(struct phylink_pcs
> > *pcs, unsigned int mode, struct mtk_pcs *mpcs =
> > pcs_to_mtk_pcs(pcs);  
> 
> 	unsigned int val;
> 
> >  	int err = 0;
> >  
> > +	/* PHYA power down */
> > +	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
> > SGMII_PHYA_PWD);
> > +  
> 
> 	regmap_read(mpcs->regmap, mpcs->ana_rgc3, &val);
> 	val &= ~RG_PHY_SPEED_MASK;
> 	if (interface == PHY_INTERFACE_MODE_2500BASEX)
> 		val |= RG_PHY_SPEED_3_125G;
> 	regmap_write(mpcs->regmap, mpcs->ana_rgc3, val);
> 
> which would make logical sense to do here, so we always configure the
> speed for the PCS correctly.
> 
> That then leaves the configuration of SGMSYS_PCS_CONTROL_1 and
> SGMSYS_SGMII_MODE, which I think could also be consolidated, but I'll
> leave that to those with the hardware to make that decision.
> 
> Reading between the lines of the code in this driver, it looks to me
> like this hardware supports only SGMII, but doesn't actually support
> 1000base-X and 2500base-X with negotiation. Is that correct? If so,
> it would be good to add a mtk_pcs_validate() function that clears
> ETHTOOL_LINK_MODE_Autoneg_BIT for these modes.

I don't know. I don't have hardware to debug
the serdes interface further. I only have a test board with mt7622 soc
connect via SGMII/2500basex to a realtek phy (rtl8221).

Maybe the maintainers from mediatek could share some knowledge if the
SGMII block supports 1000/2500basex autoneg?

At least with the public available datasheets (mt7531, mt7622) doesn't
explain it further.
I could also imagine we need to modify the page register
(PCS_SPEED_ABILITY) and link timer to get autoneg for
1000basex/2500basex working.

Best,
lynxis

