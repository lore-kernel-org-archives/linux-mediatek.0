Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259B1C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=880TfxWcdGoznLDflakV5pugqMX1aKRd5S5uQ2Z+X30=; b=BACx30Q5MEKEb6dMA0XH8XJFX+
	MNRTK5UI84qSxuwm/ckoPgKhcaUkGFe1pAG/ggFGq6gf5GV+F/5UYvTCg5w10/blN6nNQZeu5sN2V
	+VC7YTeJNpBr1/GV1kQcGDpbj4IB9KslPw5sL20DXK8EyjhKmV8JvBRfpmtWdc+XdeVRlDOnvF9o6
	w+FpUUEOAM3j3QzVMRHohy2JRxmbhGrHwKyoeT+zjKnqW2DkUBgsxkKblKToI4PbOFuwhChwdK05O
	KKsCWMx5Xtw3mMLC01ZgDEBNFc1qhRhJ2DL4p0p/YEOuVv6FjULpTE6WJHH89mWGiIrWPh6ly4V2g
	xV6b+ijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6X1g-00BuY2-VN; Wed, 29 Jun 2022 12:42:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6X1B-00BuLX-VM; Wed, 29 Jun 2022 12:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=880TfxWcdGoznLDflakV5pugqMX1aKRd5S5uQ2Z+X30=; b=U3ODSiKBCiCsW6R6iTTTRSxJtG
	P/DLvfWnqrmnlz+qlJn5r0kfdXLSZOQQVdRKZFXa4HtvO4es4Dp97KX4sjw8ap9HRWbck8vpWiJ5C
	imAHHbZxVZblDMLDxLdSADMsyoi28zj3CZl5RSOnEd7p8KLsme3ETlBsWWdUH8Lm1ZrnkgZzaZ1Sw
	2vEFzJ5RqjdetjlTEzK03ql5PVfH5oaHaI46z9dtIR+Fh2ouThCGSbuFGhDhGsxiPuVd2gHx+0LkY
	UNmFA2jnDZvMBcLVEOp4hVoOglZfJKaNxZdybmNVvRRN7qHGStzxC8SgR2HCANvvjHLg+IOGhIla7
	RxXllq9Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33092)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o6X0o-00034R-00; Wed, 29 Jun 2022 13:41:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o6X0h-0005rL-NK; Wed, 29 Jun 2022 13:41:35 +0100
Date: Wed, 29 Jun 2022 13:41:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next 0/4] net: dsa: always use phylink
Message-ID: <YrxIf1tfWQZCD1w8@shell.armlinux.org.uk>
References: <YrWi5oBFn7vR15BH@shell.armlinux.org.uk>
 <YrtvoRhUK+4BneYC@shell.armlinux.org.uk>
 <Yrv8snvIChmoNPwh@lunn.ch>
 <YrweuzL2LYNbfvAY@shell.armlinux.org.uk>
 <20220629121020.583144a5@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629121020.583144a5@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_054206_080414_4197A846 
X-CRM114-Status: GOOD (  37.05  )
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

On Wed, Jun 29, 2022 at 12:10:20PM +0200, Marek Behún wrote:
> On Wed, 29 Jun 2022 10:43:23 +0100
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> > On Wed, Jun 29, 2022 at 09:18:10AM +0200, Andrew Lunn wrote:
> > > > I should point out that if a DSA port can be programmed in software to
> > > > support both SGMII and 1000baseX, this will end up selecting SGMII
> > > > irrespective of what the hardware was wire-strapped to and how it was
> > > > initially configured. Do we believe that would be acceptable?  
> > > 
> > > I'm pretty sure the devel b board has 1000BaseX DSA links between its
> > > two switches. Since both should end up SGMII that should be O.K.  
> > 
> > Would such a port have a programmable C_Mode, and would it specify that
> > it supports both SGMII and 1000BaseX ? Without going through a lot of
> > boards and documentation for every switch, I can't say.
> > 
> > I don't think we can come to any conclusion on what the right way to
> > deal with this actually is - we don't have enough information about how
> > this is used across all the platforms we have. I think we can only try
> > something, get it merged into net-next, and wait to see whether anyone
> > complains.
> > 
> > When we have a CPU or DSA port without a fixed-link, phy or sfp specified,
> > I think we should:
> > (a) use the phy-mode property if present, otherwise,
> > (b,i) have the DSA driver return the interface mode that it wants to use
> > for max speed for CPU and DSA ports.
> > (b,ii) in the absence of the DSA driver returning a valid interface mode,
> > we use the supported_interfaces to find an interface which gives the
> > maximum speed (irrespective of duplex?) that falls within the
> > mac capabilities.
> > 
> > If all those fail, then things will break, and we will have to wait for
> > people to report that breakage. Does this sound a sane approach, or
> > does anyone have any other suggestions how to solve this?
> 
> It is a sane approach. But in the future I think we should get rid of
> (b,i): I always considered the max_speed_interface() method a temporary
> solution, until the drivers report what a specific port support and the
> subsystem can then choose whichever mode it wants that is wired and
> supported by hardware. Then we could also make it possible to change
> the CPU interface mode via ethtool, which would be cool...

I can remotely test clearfog, which seems to do the right thing:

[    5.707839] mv88e6085 f1072004.mdio-mii:04: sif=21 if=21(1000base-x) cap=bd
[    5.715114] mv88e6085 f1072004.mdio-mii:04: configuring for fixed/1000base-x link mode

meaning that the supported interfaces (sif) mask only contains
1000base-x, phylink_create() was called with (if) 1000base-x, and the
capabilities (cap) indicates 1000-fd, 100-(h,f)d, and 10-(h,f)d.

I don't think port 5 on the 88e6176 can support any other modes, so
this isn't a particularly good test. My ZII boards aren't powered up
so can't test those with the extra debugging print.

I'll cut a new RFC which includes the debug print so folk can try it
out.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

