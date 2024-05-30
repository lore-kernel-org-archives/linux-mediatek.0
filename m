Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D82CC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4Et8IsTqKEjB0VKgfn0i10/CIt14tSmicrHni37u2I=; b=d3jm5cu7Aok9MeVCtSXxwsEsYZ
	QlRsSmCgTVjaa+pj06QELx/DItAbkza7kHJ09ePeXH9+Kk/dlCSK4L5u9H32odd8lu9SgrCE2DzC+
	1XlwJIfGoHXz988nxe33+j3OuhrLwyf+p/A67Mofxyo1xSVo5BrJUcKjSH2IeZNX3v4gDRdM3oUt+
	92cJdl09X08xI+6gpCD0GKw+8+P0C7H7RQfdClXJcSYCymFkwQhHO6Tjk774bbWhegishDKCpAteR
	WgLAH2UW7jh2xDz4KT13HSo6zDr7Ayv6sOa5AVMYQFnyoX+mIkfllUsXx1GV0GAfhLwcRtlwFR9rZ
	tOwYheXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCj4B-00000007uWF-0osI;
	Thu, 30 May 2024 16:55:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCj48-00000007uQz-2HtW;
	Thu, 30 May 2024 16:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E4Et8IsTqKEjB0VKgfn0i10/CIt14tSmicrHni37u2I=; b=vt1b5BwQEsBhb0MJSh/BT73Kob
	pGD5KZ7UtoJRwdt9gjlUj8jztY4K4pGKr5EvDoixdrgvaw7CbpFKyCZ+rdiQ9PTOz7HfZuOrmtQCN
	zIV1i5dNDY1ulh+YoaqNoKW8divQ2hc1oIA7joKQA1OsldI3mGB+02GgHb06FPdEbsloO4k9VzjyJ
	KFF9QGtLFp5kevCXlqIjr9lyr/3Opds0tBqYB+wfUvTnCwvwHSFE9rT19y2zyG+gTWlXJSP13BHkz
	VPO/55MX0M3JWR+4qGRtA0jF3xfay8wCJ9BlhRw4jXablECkDkVe21W6l9XiwkB09apvqUL+LfIFi
	JkDS50ew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34142)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sCj3p-0007dO-0b;
	Thu, 30 May 2024 17:55:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sCj3p-0005IQ-7e; Thu, 30 May 2024 17:55:29 +0100
Date: Thu, 30 May 2024 17:55:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v5 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <ZlivgVpycflhLUcl@shell.armlinux.org.uk>
References: <20240530034844.11176-1-SkyLake.Huang@mediatek.com>
 <20240530034844.11176-6-SkyLake.Huang@mediatek.com>
 <ZlhWfua01SCOor80@shell.armlinux.org.uk>
 <0707897b44cfbc479cd08a092829a8bfc480281b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0707897b44cfbc479cd08a092829a8bfc480281b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_095548_682099_1BABD93E 
X-CRM114-Status: GOOD (  40.78  )
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

On Thu, May 30, 2024 at 04:25:56PM +0000, SkyLake Huang (黃啟澤) wrote:
> On Thu, 2024-05-30 at 11:35 +0100, Russell King (Oracle) wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Thu, May 30, 2024 at 11:48:44AM +0800, Sky Huang wrote:
> > > +static int mt798x_2p5ge_phy_config_aneg(struct phy_device *phydev)
> > > +{
> > > +bool changed = false;
> > > +u32 adv;
> > > +int ret;
> > > +
> > > +/* In fact, if we disable autoneg, we can't link up correctly:
> > > + *  2.5G/1G: Need AN to exchange master/slave information.
> > > + *  100M: Without AN, link starts at half duplex(According to IEEE
> > 802.3-2018),
> > > + *        which this phy doesn't support.
> > > + *   10M: Deprecated in this ethernet phy.
> > > + */
> > > +if (phydev->autoneg == AUTONEG_DISABLE)
> > > +return -EOPNOTSUPP;
> > 
> > We have another driver (stmmac) where a platform driver is wanting to
> > put a hack in the ksettings_set() ethtool path to error out on
> > disabling AN for 1G speeds. This sounds like something that is
> > applicable to more than one hardware (and I've been wondering whether
> > it is universally true that 1G copper links and faster all require
> > AN to function.)
> > 
> > Thus, I'm wondering whether this is something that the core code
> > should
> > be doing.
> > 
> Yeah..As far as I know, 1G/2.5G/5G/10G speed require AN to decide
> master/slave role. Actually I can use force mode by calling
> genphy_c45_pma_set_forced, which will set correspoding C45 registers.
> However, after that, this 2.5G PHY can't still link up with partners.
> 
> I'll leave EOPNOTSUPP here temporarily. Hope phylib can be patched
> someday.

Please no. "someday" tends to never happen, and you're basically
throwing the problem over the wall to other people to solve who
then have to spot your hack and eventually remove it.

We need this solved properly, not by people hacking drivers. This
is open source, you can propose a patch to phylib to fix this for
everyone.

> > > +/* This phy can't handle collision, and neither can (XFI)MAC it's
> > connected to.
> > > + * Although it can do HDX handshake, it doesn't support CSMA/CD
> > that HDX requires.
> > > + */
> > 
> > What the MAC can and can't do really has little bearing on what link
> > modes the PHY driver should be providing. It is the responsibility of
> > the MAC driver to appropriately change what is supported when
> > attaching
> > to the PHY. If using phylink, this is done by phylink via the MAC
> > driver
> > telling phylink what it is capable of via mac_capabilities.
> > 
> > > +static int mt798x_2p5ge_phy_get_rate_matching(struct phy_device
> > *phydev,
> > > +      phy_interface_t iface)
> > > +{
> > > +if (iface == PHY_INTERFACE_MODE_XGMII)
> > > +return RATE_MATCH_PAUSE;
> > 
> > You mention above XFI...
> > 
> > XFI is 10GBASE-R protocol to XFP module electrical standards.
> > SFI is 10GBASE-R protocol to SFP+ module electrical standards.
> > 
> > phy_interface_t is interested in the protocol. So, given that you
> > mention XFI, why doesn't this test for PHY_INTERFACE_MODE_10GBASER?
> > 
> We have 2 XFI-MAC on mt7988 platform. One is connected to internal
> 2.5Gphy(SoC built-in), as we discussed here (We don't test this phy for
> 10G speed.) Another one is connected to external 10G phy.

I can't parse your response in a meaningful way, to me it doesn't
address my point.

> 
> > > +static int mt798x_2p5ge_phy_probe(struct phy_device *phydev)
> > > +{
> > > +struct mtk_i2p5ge_phy_priv *priv;
> > > +
> > > +priv = devm_kzalloc(&phydev->mdio.dev,
> > > +    sizeof(struct mtk_i2p5ge_phy_priv), GFP_KERNEL);
> > > +if (!priv)
> > > +return -ENOMEM;
> > > +
> > > +switch (phydev->drv->phy_id) {
> > > +case MTK_2P5GPHY_ID_MT7988:
> > > +/* The original hardware only sets MDIO_DEVS_PMAPMD */
> > > +phydev->c45_ids.mmds_present |= (MDIO_DEVS_PCS | MDIO_DEVS_AN |
> > > + MDIO_DEVS_VEND1 | MDIO_DEVS_VEND2);
> > 
> > No need for parens on the RHS. The RHS is an expression in its own
> > right, and there's no point in putting parens around the expression
> > to turn it into another expression!
> > 
> > -- 
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 
> Do you mean these two line?
> +phydev->c45_ids.mmds_present |= (MDIO_DEVS_PCS | MDIO_DEVS_AN |
> + MDIO_DEVS_VEND1 | MDIO_DEVS_VEND2);
> 
> What do you mean by "RHS is an expression in its own right"?
> I put parens here to enhance readability so we don't need check
> operator precedence again.

|= one of the assignment operators, all of which have one of the
lowest precedence. Only the , operator has a lower precedence.
Therefore, everything except , has higher precedence. Therefore,
the parens on the right hand side of |= make no difference.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

