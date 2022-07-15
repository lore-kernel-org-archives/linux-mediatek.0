Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2985C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 21:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQRhVAEYMEEm9RW02pF+UuHE6aUESSqzeKHULVuhjPM=; b=b6bROOivsIP+mYxbsVQy7kQW8a
	xAs6Ql8Qk7LXPK9MhVqXM3nvDAzSQkCnbBtqzjma8L5ITSEnX6fDWtFhDe1OXbExllep0JSE+DYiO
	yJcfNFkeVmQ7dB3nd417Ppy7MN5/23eW8jc6saSRg5DU/7m6LnEkkmpKjdjdYJOZvgc0sQukinuKB
	dHnOw0VMCWnC7oIyqcZ/2RYN7FbVSQq98vfqKSBXOk5vWG4cBxNB4XRbEB+ILRsn0P+mEv0CdhlY8
	L0Tjw5zl/D9SzzXg6KGWpSurrQcFfN8me4VsPYDt4eUOezyXwKeranuUypASLByHMMH23uakdtvs+
	WapcB1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCSze-00AU3q-8a; Fri, 15 Jul 2022 21:37:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCSzT-00AU1I-72; Fri, 15 Jul 2022 21:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lQRhVAEYMEEm9RW02pF+UuHE6aUESSqzeKHULVuhjPM=; b=BiF8ThJ16Z0gr8pYciLlOa6n9n
	Kmit6hxcJOIi6f5sxSGgG0UQ+m8wX9OUgCJ7fC++3bQ2O6Hf5fMBi1h1DSSf8NfozaA70f/wk2t3x
	Et1DrtMooxKlLnyCjIaze5xxuam7hQdA5pPhopyBkMbTT0vE/B1e9K0YwUEG5Z+wm61KCFXxbEc5a
	2aAg3jW5SSQx4YCHYgTvFp7+fn4pQLulfboT5fLknVA7t4SJJzvzdaqZjhZP0QF7SA2M+yeha9L/v
	H/qtXedCHs0ldn6jCeMotSe7urRF6zMkjNXzeR/tV+lyKwWfKsVk7rJLoIylCc7nv8ow+s6SHrSBJ
	qWJVfWzQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33368)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oCSz9-0007Yu-UV; Fri, 15 Jul 2022 22:36:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oCSz7-0007sn-6W; Fri, 15 Jul 2022 22:36:29 +0100
Date: Fri, 15 Jul 2022 22:36:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 5/6] net: dsa: use swnode fixed-link if using
 default params
Message-ID: <YtHd3f22AtrIzZ1K@shell.armlinux.org.uk>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNlE-006e3z-3T@rmk-PC.armlinux.org.uk>
 <YtHJ5rfxZ+icXrkC@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtHJ5rfxZ+icXrkC@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_143651_275341_EED1AD0B 
X-CRM114-Status: GOOD (  27.63  )
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

On Fri, Jul 15, 2022 at 11:11:18PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 15, 2022 at 05:01:48PM +0100, Russell King (Oracle) wrote:
> > Create and use a swnode fixed-link specification for phylink if no
> > parameters are given in DT for a fixed-link. This allows phylink to
> > be used for "default" cases for DSA and CPU ports. Enable the use
> > of phylink in all cases for DSA and CPU ports.
> 
> > Co-developed by Vladimir Oltean and myself.
> 
> Why not to use
> 
>   Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Ah, that's an official thing. Thanks.

> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > Reviewed-by: Marek Behún <kabel@kernel.org>
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> ...
> 
> > +static struct {
> > +	unsigned long mask;
> > +	int speed;
> > +	int duplex;
> > +} phylink_caps_params[] = {
> > +	{ MAC_400000FD, SPEED_400000, DUPLEX_FULL },
> > +	{ MAC_200000FD, SPEED_200000, DUPLEX_FULL },
> > +	{ MAC_100000FD, SPEED_100000, DUPLEX_FULL },
> > +	{ MAC_56000FD,  SPEED_56000,  DUPLEX_FULL },
> > +	{ MAC_50000FD,  SPEED_50000,  DUPLEX_FULL },
> > +	{ MAC_40000FD,  SPEED_40000,  DUPLEX_FULL },
> > +	{ MAC_25000FD,  SPEED_25000,  DUPLEX_FULL },
> > +	{ MAC_20000FD,  SPEED_20000,  DUPLEX_FULL },
> > +	{ MAC_10000FD,  SPEED_10000,  DUPLEX_FULL },
> > +	{ MAC_5000FD,   SPEED_5000,   DUPLEX_FULL },
> > +	{ MAC_2500FD,   SPEED_2500,   DUPLEX_FULL },
> > +	{ MAC_1000FD,   SPEED_1000,   DUPLEX_FULL },
> > +	{ MAC_100FD,    SPEED_100,    DUPLEX_FULL },
> > +	{ MAC_10FD,     SPEED_10,     DUPLEX_FULL },
> > +	{ MAC_1000HD,   SPEED_1000,   DUPLEX_HALF },
> > +	{ MAC_100HD,    SPEED_100,    DUPLEX_HALF },
> > +	{ MAC_10HD,     SPEED_10,     DUPLEX_HALF },
> > +};
> > +
> > +static int dsa_port_find_max_speed(unsigned long caps, int *speed, int *duplex)
> > +{
> > +	int i;
> > +
> > +	*speed = SPEED_UNKNOWN;
> > +	*duplex = DUPLEX_UNKNOWN;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(phylink_caps_params); i++) {
> > +		if (caps & phylink_caps_params[i].mask) {
> > +			*speed = phylink_caps_params[i].speed;
> > +			*duplex = phylink_caps_params[i].duplex;
> 
> > +			break;
> 
> With the below check it's way too protective programming.
> 
> 			return 0;
> 
> > +		}
> > +	}
> > +
> > +	return *speed == SPEED_UNKNOWN ? -EINVAL : 0;
> 
> 	return -EINVAL;

Ok.

> > +static struct fwnode_handle *dsa_port_get_fwnode(struct dsa_port *dp,
> > +						 phy_interface_t mode)
> > +{
> 
> > +	struct property_entry fixed_link_props[3] = { };
> > +	struct property_entry port_props[3] = {};
> 
> A bit of consistency in the assignments?
> 
> Also it seems you are using up to 2 for the first one and only 1 in the second
> one. IIUC it requires a terminator entry, so it means 3 and 2. Do we really
> need 3 in the second case?

Probably not - that came from Vladimir's patch, and I removed the "reg"
property without fixing this up. Thanks for spotting.

> > +	struct fwnode_handle *fixed_link_fwnode;
> > +	struct fwnode_handle *new_port_fwnode;
> > +	struct device_node *dn = dp->dn;
> > +	struct device_node *phy_node;
> > +	int err, speed, duplex;
> > +	unsigned long caps;
> > +
> > +	phy_node = of_parse_phandle(dn, "phy-handle", 0);
> 
> fwnode in the name, why not to use fwnode APIs?
> 
> 	fwnode_find_reference();

Marcin has a series converting DSA to use fwnode things - currently DSA
does not support ACPI, so converting it to fwnode doesn't make that much
sese until the proper ACPI patches get merged, which have now been
rebased on this series by Marcin in the expectation that these patches
would be merged... so I don't want to tred on Marcin's feet on that.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

