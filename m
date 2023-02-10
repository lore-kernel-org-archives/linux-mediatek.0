Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3DBC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 22:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Am8Jfrk4NrQ9zdADgG0QLqDn0KuPRfKv5w/mlQOgDE=; b=NRW8f8hKuVOFxOgn8omm9vOBBI
	3JK6JxQ3AsY1a3dH9FI2NO9guyG94MjbA6QJpU/I6/CslzDImci2wm+BIolwQY+EZHiHFvJFhbb5z
	ytYZtjPxH3ZbILcgVAhRBI252oxlRttG1IBowzkp5bR8xQJuRE2Jgg6ywLDUVtd7oQvtpmH/wAdDo
	pPKcvrfHRrb/QWBPGHdr/zUo779iT+IucGgRpkJ+8CwZIok+PilqGHGyhtKyziw+au/KDAZL8o/xk
	zHO1sz1BvpHSL2Txk3tHJlOnlbyQzsr1n5rA/ny8bLMY76GF6Sb8VYuXSkNYUYKngPEvatfIVh1Tf
	lCeLL03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQbi1-007lOn-Jg; Fri, 10 Feb 2023 22:17:33 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQbhz-007lN9-AM; Fri, 10 Feb 2023 22:17:32 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pQbho-0003cY-06;
	Fri, 10 Feb 2023 23:17:20 +0100
Date: Fri, 10 Feb 2023 22:17:15 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <Y+bCa7ekrREOpgid@makrotopia.org>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <dcda0a3a1bf89e27e600822df63009b2b10e136a.1675779094.git.daniel@makrotopia.org>
 <Y+Yi+ajKHaLo4Vvq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+Yi+ajKHaLo4Vvq@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_141731_378143_524A6866 
X-CRM114-Status: GOOD (  16.45  )
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

On Fri, Feb 10, 2023 at 10:56:57AM +0000, Russell King (Oracle) wrote:
> On Tue, Feb 07, 2023 at 02:24:17PM +0000, Daniel Golle wrote:
> > @@ -2728,11 +2612,11 @@ mt753x_phylink_mac_select_pcs(struct dsa_switch *ds, int port,
> >  
> >  	switch (interface) {
> >  	case PHY_INTERFACE_MODE_TRGMII:
> > +		return &priv->pcs[port].pcs;
> >  	case PHY_INTERFACE_MODE_SGMII:
> >  	case PHY_INTERFACE_MODE_1000BASEX:
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> > -		return &priv->pcs[port].pcs;
> > -
> > +		return priv->ports[port].sgmii_pcs;
> 
> My only concern here is that we also use the PCS when in TRGMII mode in
> this driver, but the mtk pcs code from mtk_eth_soc doesn't handle
> TRGMII (and getting the link timer will fail for this mode, causing
> the pcs_config() method to fail.)
> 
> Thus, this driver will stop working in TRGMII mode.

I've just built and tested this on MT7623 BPi-R2 board with MT7530
connnected to SoC via TRGMII and observed that it all works fine.

However, on this platform we could safe some bytes by still allowing
mt7530.c to be built without pcs-mtk-lynxi which isn't used on MT7623
by either the ethernet or the switch driver.

To me this is not a priority, and doing that would involve adding some
ifdef'ery which isn't really nice. However, if anyone has a strong
opinion in favor of allowing mt7530.c (or even mtk_eth_soc) to be built
without pcs-mtk-lynxi, let me know and I will make the necessary
changes.

