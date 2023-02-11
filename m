Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A014DC636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHf5K/3CxkfPe8qKwrnhaJIdaQB3d06R8C9LSCDVA9Q=; b=JUjv2Fppnoa7ZNkNZug10tbgzU
	C+nZksUB4EU1cN+GhvyOcd+lkRBZJkKytfaAcfq4p+HQ7lWR3+O4KsD64w1d2kC3aL0MTDSa3JEZH
	M1VnbFZkM6ZYwD51HL5y5YTdG0p2zAf0cx9OMMa9ksZOiG1ODUd8oBFcTyAWFaKDC8vOL3iHgnVHr
	9hchUbHMVt3VFE4BN2oyADwB6tAP5cz9ZYDoGexrwSM+cpiqq5+MSmFc4mPNX1CMXr2DUCNhROoQG
	6seQRRTqCJ5usztWRlulBrKFsG5dIwUPNzScdz9bl+7h/MAM9zsi/K2737O/j7FxyEs+mCDS/7pcC
	ppGjuzTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQpNQ-009UCT-Pp; Sat, 11 Feb 2023 12:53:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQpNN-009UAZ-Qn; Sat, 11 Feb 2023 12:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nHf5K/3CxkfPe8qKwrnhaJIdaQB3d06R8C9LSCDVA9Q=; b=urQL6xNx2HjJhmtsqQyY908gKl
	comEalff9Uut+3IQksKlW0ut1njxVu6fkf61ncyQgk6KUkxzae4ldRdHD9QG14DMGi8Rr+8jQH6Vl
	Zi/A4Anp3XgqWROgf6cPthHpJH3HeqNFVO60AswahpR38ELW/mRLNtE4WpiVbeveMNi7h0dMPLgl7
	khNwe+hQfguR06pD2fXNjZfkQZPUet/a2ithDrWvS3CeCurfSKpFDqfGg88ePagiAMgyiOmGm6FNa
	y5oEDruz8vlQJXRxBpZbX2f/nv+mUscYzNhrybocVD3Pn2aBdr6YvhpPfrfatRc78NrgIJmZGlqZd
	xvTtojog==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48374)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQpNJ-0001bb-EX; Sat, 11 Feb 2023 12:53:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQpNG-00017o-Lo; Sat, 11 Feb 2023 12:53:02 +0000
Date: Sat, 11 Feb 2023 12:53:02 +0000
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
Subject: Re: [PATCH v4 10/12] net: pcs: add driver for MediaTek SGMII PCS
Message-ID: <Y+ePrq4pTLOuTNIc@shell.armlinux.org.uk>
References: <cover.1676071507.git.daniel@makrotopia.org>
 <1df6229f353a093279d707f8841d71b65aec4d90.1676071508.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1df6229f353a093279d707f8841d71b65aec4d90.1676071508.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_045309_903968_E3915426 
X-CRM114-Status: GOOD (  13.09  )
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

Hi Daniel,

On Fri, Feb 10, 2023 at 11:39:59PM +0000, Daniel Golle wrote:
> +	if (mpcs->interface != interface) {
> +		/* PHYA power down */
> +		regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
> +				   SGMII_PHYA_PWD, SGMII_PHYA_PWD);
> +
> +		/* Reset SGMII PCS state */
> +		regmap_update_bits(mpcs->regmap, SGMII_RESERVED_0,
> +				   SGMII_SW_RESET, SGMII_SW_RESET);
> +
> +		if (mpcs->flags & MTK_SGMII_FLAG_PN_SWAP)
> +			regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_WRAP_CTRL,
> +					   SGMII_PN_SWAP_MASK,
> +					   SGMII_PN_SWAP_TX_RX);
> +
> +		if (interface == PHY_INTERFACE_MODE_2500BASEX)
> +			rgc3 = RG_PHY_SPEED_3_125G;
> +		else
> +			rgc3 = 0;
> +
> +		/* Configure the underlying interface speed */
> +		regmap_update_bits(mpcs->regmap, mpcs->ana_rgc3,
> +				   RG_PHY_SPEED_MASK, rgc3);
> +
> +		/* Setup the link timer and QPHY power up inside SGMIISYS */
> +		link_timer = phylink_get_link_timer_ns(interface);
> +		if (link_timer < 0)
> +			return link_timer;

The change in patch 7 needs to be propagated to this patch (moving this
to the beginning of this block of code.)

Otherwise, LGTM. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

