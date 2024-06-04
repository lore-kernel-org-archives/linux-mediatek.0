Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD41C27C50
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Po0t4on09wwdBMS00q8Bk3SGWM842RcXls5BfPeAIMQ=; b=sHwG3Zpc2DiHwFppJuzmYy3H2h
	hvlf/Bow3vj5eTOrhohVJxL0yI2oFYIrl6qoqKC1v33pJAX7amAGYDvQE+asEa6Sh4hXabAx/dTc8
	YrdnN64yjyxUFGJ41p8zi5amUYaunsfzltO66nALYgWgneVCpGxk5JRZ/ft0eTFbsXCBaXvBc5xog
	W+X7dfSgZ17HidS+i6fcZ6fIlFBGmy6hf8fexhaY1Xlduw3pfFRzxDj6knhPvrtCr+NpOt03ixGXh
	HS6vO+m6rsHgMVFzKvuhtg5rCrce0AnjUhSftY1vKEQex81VfiywCm63c28/FjSJ8OC9xs+vNWXwy
	3hW1aPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEUYU-00000002ZAv-0qnV;
	Tue, 04 Jun 2024 13:50:26 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEUYQ-00000002ZAA-0J1r;
	Tue, 04 Jun 2024 13:50:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sEUYF-000000007pM-3kyt;
	Tue, 04 Jun 2024 13:50:12 +0000
Date: Tue, 4 Jun 2024 14:50:04 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"andrew@lunn.ch" <andrew@lunn.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v6 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <Zl8bjNzdB7g1fRyn@makrotopia.org>
References: <20240603121834.27433-1-SkyLake.Huang@mediatek.com>
 <20240603121834.27433-6-SkyLake.Huang@mediatek.com>
 <Zl3ELbG8c8y0/4DN@shell.armlinux.org.uk>
 <Zl3Fwoiv1bJlGaQZ@makrotopia.org>
 <Zl3IGN5ZHCQfQfmt@shell.armlinux.org.uk>
 <Zl3Yo3dwQlXEfP3i@makrotopia.org>
 <Zl3lkIDqnt4JD//u@shell.armlinux.org.uk>
 <Zl32waW34yTiuF9u@makrotopia.org>
 <Zl4LvKlhty/9o38y@shell.armlinux.org.uk>
 <864a09b213169bc20f33af2f35239c6154ca81e3.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <864a09b213169bc20f33af2f35239c6154ca81e3.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_065022_397106_84BDDC31 
X-CRM114-Status: GOOD (  48.97  )
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

On Tue, Jun 04, 2024 at 08:42:57AM +0000, SkyLake Huang (黃啟澤) wrote:
> On Mon, 2024-06-03 at 19:30 +0100, Russell King (Oracle) wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Mon, Jun 03, 2024 at 06:00:49PM +0100, Daniel Golle wrote:
> > > On Mon, Jun 03, 2024 at 04:47:28PM +0100, Russell King (Oracle)
> > wrote:
> > > > On Mon, Jun 03, 2024 at 03:52:19PM +0100, Daniel Golle wrote:
> > > > > On Mon, Jun 03, 2024 at 02:41:44PM +0100, Russell King (Oracle)
> > wrote:
> > > > > > On Mon, Jun 03, 2024 at 02:31:46PM +0100, Daniel Golle wrote:
> > > > > > > On Mon, Jun 03, 2024 at 02:25:01PM +0100, Russell King
> > (Oracle) wrote:
> > > > > > > > On Mon, Jun 03, 2024 at 08:18:34PM +0800, Sky Huang
> > wrote:
> > > > > > > > > Add support for internal 2.5Gphy on MT7988. This driver
> > will load
> > > > > > > > > necessary firmware, add appropriate time delay and
> > figure out LED.
> > > > > > > > > Also, certain control registers will be set to fix
> > link-up issues.
> > > > > > > > 
> > > > > > > > Based on our previous discussion, it may be worth
> > checking in the
> > > > > > > > .config_init() method whether phydev->interface is one of
> > the
> > > > > > > > PHY interface modes that this PHY supports. As I
> > understand from one
> > > > > > > > of your previous emails, the possibilities are XGMII,
> > USXGMII or
> > > > > > > > INTERNAL. Thus:
> > > > > > > > 
> > > > > > > > > +static int mt798x_2p5ge_phy_config_init(struct
> > phy_device *phydev)
> > > > > > > > > +{
> > > > > > > > > +struct pinctrl *pinctrl;
> > > > > > > > > +int ret;
> > > > > > > > 
> > > > > > > > /* Check that the PHY interface type is compatible */
> > > > > > > > if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL &&
> > > > > > > >     phydev->interface != PHY_INTERFACE_MODE_XGMII &&
> > > > > > > >     phydev->interface != PHY_INTERFACE_MODE_USXGMII)
> > > > > > > > return -ENODEV;
> > > > > > > 
> > > > > > > The PHY is built-into the SoC, and as such the connection
> > type should
> > > > > > > always be "internal". The PHY does not exist as dedicated
> > IC, only
> > > > > > > as built-in part of the MT7988 SoC.
> > > > > > 
> > > > > > That's not how it was described to me by Sky.
> > > > > > 
> > > > > > If what you say is correct, then the implementation of
> > > > > > mt798x_2p5ge_phy_get_rate_matching() which checks for
> > interface modes
> > > > > > other than INTERNAL is not correct. Also it means that
> > config_init()
> > > > > > should not permit anything but INTERNAL.
> > > > > 
> > > > > The way the PHY is connected to the MAC *inside the chip* is
> > XGMII
> > > > > according the MediaTek. So call it "internal" or "xgmii",
> > however, up to
> > > > > my knowledge it's a fact that there is **only one way** this
> > PHY is
> > > > > connected and used, and that is being an internal part of the
> > MT7988 SoC.
> > > > > 
> > > > > Imho, as there are no actual XGMII signals exposed anywhere I'd
> > use
> > > > > "internal" to describe the link between MAC and PHY (which are
> > both
> > > > > inside the same chip package).
> > > > 
> > > > I don't care what gets decided about what's acceptable for the
> > PHY to
> > > > accept, just that it checks for the acceptable modes in
> > .config_init()
> > > > and the .get_rate_matching() method is not checking for interface
> > > > modes that are not permitted.
> > > 
> > > What I meant to express is that there is no need for such a check,
> > also
> > > not in config_init. There is only one way and one MAC-side
> > interface mode
> > > to operate that PHY, so the value will anyway not be considered
> > anywhere
> > > in the driver.
> > 
> > No, it matters. With drivers using phylink, the PHY interface mode is
> > used in certain circumstances to constrain what the net device can
> > do.
> > So, it makes sense for new PHY drivers to ensure that the PHY
> > interface
> > mode is one that they can support, rather than just accepting
> > whatever
> > is passed to them (which then can lead to maintainability issues for
> > subsystems.)
> > 
> > So, excuse me for disagreeing with you, but I do want to see such a
> > check in new PHY drivers.
> > 
> > -- 
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 
> Hi Russell/Daniel,
>   IMO, we can check PHY_INTERFACE_MODE_INTERNAL &
> PHY_INTERFACE_MODE_XGMII in config_init() or probe(). However,
> PHY_INTERFACE_MODE_USXGMII isn't supported by this phy, and
> drivers/net/ethernet/mediatek/mtk_eth_path.c uses
> PHY_INTERFACE_MODE_USXGMII to switch netsys pcs mux (set
> MUX_G2_USXGMII_SEL bit in TOP_MISC_NETSYS_PCS_MUX) so that XFI-MAC can
> be connected to external 10Gphy.
>   So, basically, for 1st XFI-MAC on mt7988:
> - PHY_INTERFACE_MODE_XGMII/PHY_INTERFACE_MODE_INTERNAL: built-in
> 2.5Gphy

Why both? Wouldn't just PHY_INTERFACE_MODE_INTERNAL be more clear?
There is no XGMII interface exposed anywhere and both "internal" and
"xgmii" would be used to express the exact same thing.

> - PHY_INTERFACE_MODE_USXGMII: external 10Gphy
> 
>   I add check in config_init():
> /* Check if PHY interface type is compatible */
> if (phydev->interface != PHY_INTERFACE_MODE_XGMII &&
>     phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
> 	return -ENODEV;
> 
>   Also, test with different phy mode in dts:
> [PHY_INTERFACE_MODE_USXGMII]
> [   18.702102] mtk_soc_eth 15100000.ethernet eth1: mtk_open: could not
> attach PHY: -19
> root@OpenWrt:/# cat /proc/device-tree/soc/ethernet@15100000/mac@1/phy-c
> onnection-type
> usxgmii
> 
> [PHY_INTERFACE_MODE_INTERNAL]
> [   18.329513] mtk_soc_eth 15100000.ethernet eth1: PHY [mdio-bus:0f]
> driver [MediaTek MT7988 2.5GbE PHY] (irq=POLL)
> [   18.339708] mtk_soc_eth 15100000.ethernet eth1: configuring for
> phy/internal link mode
> root@OpenWrt:/# cat /proc/device-tree/soc/ethernet@15100000
> /mac@1/phy-connection-type
> internal
> 
> Sky

