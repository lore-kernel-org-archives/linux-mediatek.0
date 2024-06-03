Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F28C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 17:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+A4idQcki+8DQq24n70JeycG+uvt3GYwhDMfeVoIFew=; b=OUbMbxPqgnwtYyDpE1nXsg/sWy
	kHpDLl2yYyh9mPyyu3zira2lKRMogDBqmsXMd/uOBTYcov1Mns5Z2Z8s6LvTd/acQ/Fi6s2LYv0yo
	KayJMffX1oQi14j+7QmBpoEdJUdCWeq3DyM6XEFCrN0wc4NtuLXvM9SrMvrolZRoe/yps07rGq9BZ
	pOMwIkMV3W1S/UAy0PdQCgxMClDPwEumUdX2g6B7XndrcIV10KyFrQoO3u9LW446aJxNMu4Ix6L3y
	jveLUbtwGM8ejX9iniCeO7xVxv7BTJ9EAew61Fec7Qg21uKD5XuUG9GPvXpumnub0uX2vtVYMQljM
	gohmhFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEB3h-0000000HROd-3Wal;
	Mon, 03 Jun 2024 17:01:21 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEB3f-0000000HRL8-08ru;
	Mon, 03 Jun 2024 17:01:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sEB3I-000000002Nq-1Sjk;
	Mon, 03 Jun 2024 17:00:56 +0000
Date: Mon, 3 Jun 2024 18:00:49 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v6 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <Zl32waW34yTiuF9u@makrotopia.org>
References: <20240603121834.27433-1-SkyLake.Huang@mediatek.com>
 <20240603121834.27433-6-SkyLake.Huang@mediatek.com>
 <Zl3ELbG8c8y0/4DN@shell.armlinux.org.uk>
 <Zl3Fwoiv1bJlGaQZ@makrotopia.org>
 <Zl3IGN5ZHCQfQfmt@shell.armlinux.org.uk>
 <Zl3Yo3dwQlXEfP3i@makrotopia.org>
 <Zl3lkIDqnt4JD//u@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl3lkIDqnt4JD//u@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_100119_122846_5CDDAEF6 
X-CRM114-Status: GOOD (  34.92  )
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

On Mon, Jun 03, 2024 at 04:47:28PM +0100, Russell King (Oracle) wrote:
> On Mon, Jun 03, 2024 at 03:52:19PM +0100, Daniel Golle wrote:
> > On Mon, Jun 03, 2024 at 02:41:44PM +0100, Russell King (Oracle) wrote:
> > > On Mon, Jun 03, 2024 at 02:31:46PM +0100, Daniel Golle wrote:
> > > > On Mon, Jun 03, 2024 at 02:25:01PM +0100, Russell King (Oracle) wrote:
> > > > > On Mon, Jun 03, 2024 at 08:18:34PM +0800, Sky Huang wrote:
> > > > > > Add support for internal 2.5Gphy on MT7988. This driver will load
> > > > > > necessary firmware, add appropriate time delay and figure out LED.
> > > > > > Also, certain control registers will be set to fix link-up issues.
> > > > > 
> > > > > Based on our previous discussion, it may be worth checking in the
> > > > > .config_init() method whether phydev->interface is one of the
> > > > > PHY interface modes that this PHY supports. As I understand from one
> > > > > of your previous emails, the possibilities are XGMII, USXGMII or
> > > > > INTERNAL. Thus:
> > > > > 
> > > > > > +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> > > > > > +{
> > > > > > +	struct pinctrl *pinctrl;
> > > > > > +	int ret;
> > > > > 
> > > > > 	/* Check that the PHY interface type is compatible */
> > > > > 	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL &&
> > > > > 	    phydev->interface != PHY_INTERFACE_MODE_XGMII &&
> > > > > 	    phydev->interface != PHY_INTERFACE_MODE_USXGMII)
> > > > > 		return -ENODEV;
> > > > 
> > > > The PHY is built-into the SoC, and as such the connection type should
> > > > always be "internal". The PHY does not exist as dedicated IC, only
> > > > as built-in part of the MT7988 SoC.
> > > 
> > > That's not how it was described to me by Sky.
> > > 
> > > If what you say is correct, then the implementation of
> > > mt798x_2p5ge_phy_get_rate_matching() which checks for interface modes
> > > other than INTERNAL is not correct. Also it means that config_init()
> > > should not permit anything but INTERNAL.
> > 
> > The way the PHY is connected to the MAC *inside the chip* is XGMII
> > according the MediaTek. So call it "internal" or "xgmii", however, up to
> > my knowledge it's a fact that there is **only one way** this PHY is
> > connected and used, and that is being an internal part of the MT7988 SoC.
> > 
> > Imho, as there are no actual XGMII signals exposed anywhere I'd use
> > "internal" to describe the link between MAC and PHY (which are both
> > inside the same chip package).
> 
> I don't care what gets decided about what's acceptable for the PHY to
> accept, just that it checks for the acceptable modes in .config_init()
> and the .get_rate_matching() method is not checking for interface
> modes that are not permitted.

What I meant to express is that there is no need for such a check, also
not in config_init. There is only one way and one MAC-side interface mode
to operate that PHY, so the value will anyway not be considered anywhere
in the driver.

