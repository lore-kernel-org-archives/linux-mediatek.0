Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B35C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 18:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCvWTMBZzFyQI14e28Nz1Gd7RpB4B15zOofvtVYziac=; b=H0SBa57OrrOUvfyZmAjZik1UnG
	uingn4i9DvWTw/KFzEpGc8IvaoBRafBRMYq4mvOo8VuaKWbJ94L/4+ORz9mlivXq3qy0WjVW0sGfw
	2wxRZEgCunWojnJ94BEwjztSgxwq/Vg3pfJmL1wpgrFM9eiiTe6xwWxx0uVUgWdHIdQgEywIF4mVa
	AJH7JwOF7HYHPca6zNzG1q2V67ZgjvFxsgdTTUFjck4So1l6p+Vhik1+dVWKCJT/VcoCpqBckQ89t
	JgtTbh02Jt1SUOWDcbzMtlogBH4aGbHSe4eKJ6RkzfkpqpCDXYKeO/cLRkZBtUflV+f/MbN5iQJpC
	nx0FTn2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sECSG-000000001eX-13qV;
	Mon, 03 Jun 2024 18:30:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sECSB-000000001di-3TJ1;
	Mon, 03 Jun 2024 18:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oCvWTMBZzFyQI14e28Nz1Gd7RpB4B15zOofvtVYziac=; b=QfcmgenTxMFEewMSOKyAloZXNF
	K2qEiU+N51KbMp0eCj/A8qCg+g59IRTKIYInxtDu03ueIA5QIYfPZdoUWoHFSgmEJLFHdk69jfSkV
	GZuu3G981AM4lxNY/pAc5MIgiGavYg1boBE1eQRjHVChzLcPrJOZuc7JtF4OdKu4DPWijvHbhpjYX
	Zf92F7Z64mgG/k37NAFo6VG/kKzNpKbVPt0mQSpoIauHsKf/llM8CmUzT0OQomqIJm/ivVDXLgD9u
	M1gSWH9Dslp/5E/2NCzjOAu0BzwztH8e07Bi3b5r6co4a+kslXyzH5dLSS/Lnv2s/mipYCrnwZuwb
	BmyO1vrA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56784)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sECRq-00034t-0s;
	Mon, 03 Jun 2024 19:30:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sECRo-0000eL-Ly; Mon, 03 Jun 2024 19:30:20 +0100
Date: Mon, 3 Jun 2024 19:30:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <Zl4LvKlhty/9o38y@shell.armlinux.org.uk>
References: <20240603121834.27433-1-SkyLake.Huang@mediatek.com>
 <20240603121834.27433-6-SkyLake.Huang@mediatek.com>
 <Zl3ELbG8c8y0/4DN@shell.armlinux.org.uk>
 <Zl3Fwoiv1bJlGaQZ@makrotopia.org>
 <Zl3IGN5ZHCQfQfmt@shell.armlinux.org.uk>
 <Zl3Yo3dwQlXEfP3i@makrotopia.org>
 <Zl3lkIDqnt4JD//u@shell.armlinux.org.uk>
 <Zl32waW34yTiuF9u@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl32waW34yTiuF9u@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_113043_889854_DCAB11D4 
X-CRM114-Status: GOOD (  39.89  )
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

On Mon, Jun 03, 2024 at 06:00:49PM +0100, Daniel Golle wrote:
> On Mon, Jun 03, 2024 at 04:47:28PM +0100, Russell King (Oracle) wrote:
> > On Mon, Jun 03, 2024 at 03:52:19PM +0100, Daniel Golle wrote:
> > > On Mon, Jun 03, 2024 at 02:41:44PM +0100, Russell King (Oracle) wrote:
> > > > On Mon, Jun 03, 2024 at 02:31:46PM +0100, Daniel Golle wrote:
> > > > > On Mon, Jun 03, 2024 at 02:25:01PM +0100, Russell King (Oracle) wrote:
> > > > > > On Mon, Jun 03, 2024 at 08:18:34PM +0800, Sky Huang wrote:
> > > > > > > Add support for internal 2.5Gphy on MT7988. This driver will load
> > > > > > > necessary firmware, add appropriate time delay and figure out LED.
> > > > > > > Also, certain control registers will be set to fix link-up issues.
> > > > > > 
> > > > > > Based on our previous discussion, it may be worth checking in the
> > > > > > .config_init() method whether phydev->interface is one of the
> > > > > > PHY interface modes that this PHY supports. As I understand from one
> > > > > > of your previous emails, the possibilities are XGMII, USXGMII or
> > > > > > INTERNAL. Thus:
> > > > > > 
> > > > > > > +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> > > > > > > +{
> > > > > > > +	struct pinctrl *pinctrl;
> > > > > > > +	int ret;
> > > > > > 
> > > > > > 	/* Check that the PHY interface type is compatible */
> > > > > > 	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL &&
> > > > > > 	    phydev->interface != PHY_INTERFACE_MODE_XGMII &&
> > > > > > 	    phydev->interface != PHY_INTERFACE_MODE_USXGMII)
> > > > > > 		return -ENODEV;
> > > > > 
> > > > > The PHY is built-into the SoC, and as such the connection type should
> > > > > always be "internal". The PHY does not exist as dedicated IC, only
> > > > > as built-in part of the MT7988 SoC.
> > > > 
> > > > That's not how it was described to me by Sky.
> > > > 
> > > > If what you say is correct, then the implementation of
> > > > mt798x_2p5ge_phy_get_rate_matching() which checks for interface modes
> > > > other than INTERNAL is not correct. Also it means that config_init()
> > > > should not permit anything but INTERNAL.
> > > 
> > > The way the PHY is connected to the MAC *inside the chip* is XGMII
> > > according the MediaTek. So call it "internal" or "xgmii", however, up to
> > > my knowledge it's a fact that there is **only one way** this PHY is
> > > connected and used, and that is being an internal part of the MT7988 SoC.
> > > 
> > > Imho, as there are no actual XGMII signals exposed anywhere I'd use
> > > "internal" to describe the link between MAC and PHY (which are both
> > > inside the same chip package).
> > 
> > I don't care what gets decided about what's acceptable for the PHY to
> > accept, just that it checks for the acceptable modes in .config_init()
> > and the .get_rate_matching() method is not checking for interface
> > modes that are not permitted.
> 
> What I meant to express is that there is no need for such a check, also
> not in config_init. There is only one way and one MAC-side interface mode
> to operate that PHY, so the value will anyway not be considered anywhere
> in the driver.

No, it matters. With drivers using phylink, the PHY interface mode is
used in certain circumstances to constrain what the net device can do.
So, it makes sense for new PHY drivers to ensure that the PHY interface
mode is one that they can support, rather than just accepting whatever
is passed to them (which then can lead to maintainability issues for
subsystems.)

So, excuse me for disagreeing with you, but I do want to see such a
check in new PHY drivers.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

