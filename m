Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E019BC636D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOxzUNdxDyu4EvIpxaCXo+zY4fgrjFKuSLiD4nmJaak=; b=uMgpxM5aZR5RAr1fxN0OGPKk1r
	pgF7srLWhcoVBik0uURxDyRKLi7PH8xWcbjjKvvdeuQsmE7bKARffz0bh7caUsx5+sMmebsp0MVAR
	yhUCuDLgjF1jdlY4cwkGvIb+OCkA2G72q/a1UmzBWbS3EdPgx3iO5Mc+bGbW7aBi9Ln16fgPUJOZu
	D0bFdau4/33rLT0lLNZRNR1OI+lDcDI9MQ4LVsrIGk56SdL0SyCQuhXaQDNk8jeRh2CVYdVW3gr/C
	JRanG+r7wXI7X93rG02ixvpZGXUsU4ukWU5+xh/VL4ylVuxTQLpBGCoSl9oHgqgn3JzNrd3vOw0fn
	VUDci/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQR5W-005Npv-Ke; Fri, 10 Feb 2023 10:57:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQR5T-005Noj-N3; Fri, 10 Feb 2023 10:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mOxzUNdxDyu4EvIpxaCXo+zY4fgrjFKuSLiD4nmJaak=; b=O6QeR6Hkb3aVPLJ+4SGJ/kpzu/
	Z2llFq3PjIg/6n7I3i/wi3ItbsXTzbeWTIxMtTDqB+wdugrF4MWgusqw6Gxeb9Ggu/bitzcTrZQae
	s+yHhS4kviyVQf6NahJO1s2EPWsK+CK1i7FrY7Nv5yJt75+E0Y9QL+yp+aITrR15o3JKE5hsE/+Rx
	o3L3/V6w0olRgW99SzFwHHycn3jf05SMNnnKcUc9H9rbR8QeYHI16ZY8hHL9X3xAKDL4SUaZUwBC1
	GIEGzoQcExvml7rmeZS47lHWItqvop+PrDffitw3n4NUen5qKEfSyu70cTe11jPS2N/9S4tThrODz
	ik/YdM+A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36510)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQR5P-0001LQ-Pc; Fri, 10 Feb 2023 10:56:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQR5N-0005W1-2a; Fri, 10 Feb 2023 10:56:57 +0000
Date: Fri, 10 Feb 2023 10:56:57 +0000
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
Subject: Re: [PATCH v2 11/11] net: dsa: mt7530: use external PCS driver
Message-ID: <Y+Yi+ajKHaLo4Vvq@shell.armlinux.org.uk>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <dcda0a3a1bf89e27e600822df63009b2b10e136a.1675779094.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcda0a3a1bf89e27e600822df63009b2b10e136a.1675779094.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_025703_773283_22567C75 
X-CRM114-Status: GOOD (  11.73  )
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

On Tue, Feb 07, 2023 at 02:24:17PM +0000, Daniel Golle wrote:
> @@ -2728,11 +2612,11 @@ mt753x_phylink_mac_select_pcs(struct dsa_switch *ds, int port,
>  
>  	switch (interface) {
>  	case PHY_INTERFACE_MODE_TRGMII:
> +		return &priv->pcs[port].pcs;
>  	case PHY_INTERFACE_MODE_SGMII:
>  	case PHY_INTERFACE_MODE_1000BASEX:
>  	case PHY_INTERFACE_MODE_2500BASEX:
> -		return &priv->pcs[port].pcs;
> -
> +		return priv->ports[port].sgmii_pcs;

My only concern here is that we also use the PCS when in TRGMII mode in
this driver, but the mtk pcs code from mtk_eth_soc doesn't handle
TRGMII (and getting the link timer will fail for this mode, causing
the pcs_config() method to fail.)

Thus, this driver will stop working in TRGMII mode.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

