Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2123C636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNySMdHju9Q8B3Qh74cP3XPbvSbjgMBrpNYBTpYnG1o=; b=VN9K4e2/atT2hknVzBN64TUX3N
	S8OMPYFFFFQU1Ld4z+XkJI5PKQQQH6EDWtxCNizVFwiM66/WX46s2Sev4+auD4gWsJ5Ne49YGerxB
	DEgmejE+YC6ZbrZjCZvhz1ShqUfKxG8YRoQsRprDZUuhlo03gvHDhbglqlvM8zFsP8zJh0HjPIVdf
	mTTj4rHdJk2+ZwcL5EwV5YVUzJ/Vqc5oV/JsBj85zEEWjRJ5bEmf99fmSHEAey0RvivjM0pmPgvjh
	w8pnlBlFM7REr4wty2ZBmMl0GjgCSm3qRT8RiAwQjcBz7uv2ySvimkRLyODbZ0rN8fAF80qD0Lie2
	TUqrrGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSuX-005kDz-Ma; Fri, 10 Feb 2023 12:53:53 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSuU-005kCE-OP; Fri, 10 Feb 2023 12:53:52 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pQStm-0007XU-0V;
	Fri, 10 Feb 2023 13:53:06 +0100
Date: Fri, 10 Feb 2023 12:52:56 +0000
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
Message-ID: <Y+Y+KHXnGUgroYQ/@makrotopia.org>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <dcda0a3a1bf89e27e600822df63009b2b10e136a.1675779094.git.daniel@makrotopia.org>
 <Y+Yi+ajKHaLo4Vvq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+Yi+ajKHaLo4Vvq@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_045350_834768_FEEAD590 
X-CRM114-Status: GOOD (  14.74  )
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
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> >  	case PHY_INTERFACE_MODE_SGMII:
> >  	case PHY_INTERFACE_MODE_1000BASEX:
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> > -		return &priv->pcs[port].pcs;
> > -
> > +		return priv->ports[port].sgmii_pcs;
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> My only concern here is that we also use the PCS when in TRGMII mode in
> this driver, but the mtk pcs code from mtk_eth_soc doesn't handle
> TRGMII (and getting the link timer will fail for this mode, causing
> the pcs_config() method to fail.)
> 
> Thus, this driver will stop working in TRGMII mode.

But in TRGMII mode we return &priv->pcs[port].pcs which is not the PCS
code from mtk_eth_soc now moved to the new pcs-mtk-lynxi driver, but
rather the old existing codepath from mt7530.c.

The new PCS driver only replaces mt7531_sgmii_pcs_* functions, which
were all nearly identical with what is now in pcs-mtk-lynxi.c.

Or do I miss something here?

