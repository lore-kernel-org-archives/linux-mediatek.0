Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62445C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5ah77INyaKh5P58D9AxRt+KkH3818+oFIrbjxKeZn4=; b=zXKKo8R03+j+LX0FRxBrpHCiLg
	Pgha6JoAneR8dr4wmj83PSl5Je43O+MoWKiP2cCYr1m5E2TRO1vXx+pLmGGisgLAcxNKZBO3ia2Fh
	QmVWWWHXONm6k3NkwhdRX1hBGcMzY90ZI1WkZitXDNGf2iW39Ggf5kMuVIC/A99Hm5QxXCfHrP54h
	xO5htAdV3YN7ZBlNZGs/P3Q1YX3LV3ZQhwgcn5cu1mvcYVn7kmJskkma8fkUNx8N9PM89DbKqKdDl
	yagVagPZF65lYcKgXl9aY95ZKO8+YYWgJ///hm3DslpmreypXf2zP9rPpGZRZXmB9WOppGD2l9j1/
	zZdt8CBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7wp-0000000GxFR-06J2;
	Mon, 03 Jun 2024 13:42:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7wk-0000000GxBr-0Vmm;
	Mon, 03 Jun 2024 13:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M5ah77INyaKh5P58D9AxRt+KkH3818+oFIrbjxKeZn4=; b=HQNIuOPpNyUPOdCjHpx4IOa0dA
	1d1T3e6XNFKcNIxNLB1yd+IcAdrHeeja7KY6gJQ8l7EnkmT8TkcE9fRwvoZiKrE4UuKeIbXS+p1Pz
	hIqFe9H/0nX7W2GCfUdm2Kj8nfTTCEL5bkiwai7t1IBmiyMRVfN4c/Gn+p+NAp6YMPrzOhP5Pm4/3
	yte5ny25yih4EIAs2voq8DE2Gft6jYXx5j1s90s5LHVA0s4t0yptm2gA2ZiR883rRPOuUzK6K6qE5
	iDr0MVNU3OSf0zG9M9/YIIIHxz6Y/jDLlcpKPwEgFuEAlfHJ8ylbsk5n9oMsIIBzwYU5aAvNZ/6Wn
	GlQqp5Wg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52728)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sE7wW-0002oi-0I;
	Mon, 03 Jun 2024 14:41:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sE7wW-0000UV-T1; Mon, 03 Jun 2024 14:41:44 +0100
Date: Mon, 3 Jun 2024 14:41:44 +0100
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
Message-ID: <Zl3IGN5ZHCQfQfmt@shell.armlinux.org.uk>
References: <20240603121834.27433-1-SkyLake.Huang@mediatek.com>
 <20240603121834.27433-6-SkyLake.Huang@mediatek.com>
 <Zl3ELbG8c8y0/4DN@shell.armlinux.org.uk>
 <Zl3Fwoiv1bJlGaQZ@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl3Fwoiv1bJlGaQZ@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_064158_187714_1C52062C 
X-CRM114-Status: GOOD (  21.60  )
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

On Mon, Jun 03, 2024 at 02:31:46PM +0100, Daniel Golle wrote:
> On Mon, Jun 03, 2024 at 02:25:01PM +0100, Russell King (Oracle) wrote:
> > On Mon, Jun 03, 2024 at 08:18:34PM +0800, Sky Huang wrote:
> > > Add support for internal 2.5Gphy on MT7988. This driver will load
> > > necessary firmware, add appropriate time delay and figure out LED.
> > > Also, certain control registers will be set to fix link-up issues.
> > 
> > Based on our previous discussion, it may be worth checking in the
> > .config_init() method whether phydev->interface is one of the
> > PHY interface modes that this PHY supports. As I understand from one
> > of your previous emails, the possibilities are XGMII, USXGMII or
> > INTERNAL. Thus:
> > 
> > > +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> > > +{
> > > +	struct pinctrl *pinctrl;
> > > +	int ret;
> > 
> > 	/* Check that the PHY interface type is compatible */
> > 	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL &&
> > 	    phydev->interface != PHY_INTERFACE_MODE_XGMII &&
> > 	    phydev->interface != PHY_INTERFACE_MODE_USXGMII)
> > 		return -ENODEV;
> 
> The PHY is built-into the SoC, and as such the connection type should
> always be "internal". The PHY does not exist as dedicated IC, only
> as built-in part of the MT7988 SoC.

That's not how it was described to me by Sky.

If what you say is correct, then the implementation of
mt798x_2p5ge_phy_get_rate_matching() which checks for interface modes
other than INTERNAL is not correct. Also it means that config_init()
should not permit anything but INTERNAL.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

