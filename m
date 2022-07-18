Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DE8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 19:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzGG9ZYZ55lKs6v2KVZ6O+kfdHURFCGB0YnSpUgcYZ8=; b=icT6yb4UWGvtr5PkuMq4e0HOEd
	ebUtB4asz0Wj2SeC1wzbxAql7WFvZ1dtcGcaARLj+zcbvEUenunyLor/qb4XcM830rRVMvj+9r4lY
	QnOZe8Ygprmlk2cL3wzI7A6dxzBvIgkysVGUbgUVv79TLXYJl7EJ8wZyHDpouJj729QMbhLENw/qw
	j8jG+A+XcnXu1YSA5uTzwRCu/9J7+B4eTnmIxUhY7VFG9vO2TwY15bnxV5sPl95R37JqX5FBxVxa9
	uAko9kIJgLjg8Cn5L1WUT6pQTSzZONvlgpYmQUB0rmK7uVwgcjjfSGLkiB3ykSH9mDjN4lGekm7Kz
	Egwm5bBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDWBf-000I11-6e; Mon, 18 Jul 2022 19:13:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDWBT-000Hux-1n; Mon, 18 Jul 2022 19:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hzGG9ZYZ55lKs6v2KVZ6O+kfdHURFCGB0YnSpUgcYZ8=; b=D2iVCJeyJxa+EiXw+UZLdtVWwW
	CNBQeh7P4yswurTkhGjLWskLvcCCFr16C6HwZhuWVbHzUShXL6TxoOuu9b+sCJUhqPAnJUoOD3FnX
	CYva/z5J+KHyPgYdh5J2GvbLhS/AHkpZbFgICeW/pxxup0+gGL0s0kR6FLEBoEAAEPcYPS9zvkt3P
	oh7LuL7/up9HHYoeVwZEpGDjgQvMMiy36PjMQvbXHbP7gCxuJxa1d+h+BhbaUTu9h/id5u6nfVNnY
	2SsbVHEx7ZT5XL1cdfH8f0G9pCMqIBoBoEvGyUuIiK+h8/AhlE1Le3GUzJ3r1y+EzidNMjFifvwHx
	rjGx0RHw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33432)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oDWBF-00022G-A5; Mon, 18 Jul 2022 20:13:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oDWBD-0002D2-TZ; Mon, 18 Jul 2022 20:13:19 +0100
Date: Mon, 18 Jul 2022 20:13:19 +0100
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
Message-ID: <YtWwzwO9gZoR+9T/@shell.armlinux.org.uk>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNlE-006e3z-3T@rmk-PC.armlinux.org.uk>
 <YtHJ5rfxZ+icXrkC@smile.fi.intel.com>
 <YtHd3f22AtrIzZ1K@shell.armlinux.org.uk>
 <YtWtjYuQ8aLL64Tg@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtWtjYuQ8aLL64Tg@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_121335_115711_A7275349 
X-CRM114-Status: GOOD (  22.57  )
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

On Mon, Jul 18, 2022 at 09:59:25PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 15, 2022 at 10:36:29PM +0100, Russell King (Oracle) wrote:
> > On Fri, Jul 15, 2022 at 11:11:18PM +0300, Andy Shevchenko wrote:
> > > On Fri, Jul 15, 2022 at 05:01:48PM +0100, Russell King (Oracle) wrote:
> 
> ...
> 
> > > > Co-developed by Vladimir Oltean and myself.
> > > 
> > > Why not to use
> > > 
> > >   Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > 
> > Ah, that's an official thing. Thanks.
> 
> Yep, it's even documented in Submitting Patches.
> 
> ...
> 
> > > > +	phy_node = of_parse_phandle(dn, "phy-handle", 0);
> > > 
> > > fwnode in the name, why not to use fwnode APIs?
> > > 
> > > 	fwnode_find_reference();
> > 
> > Marcin has a series converting DSA to use fwnode things - currently DSA
> > does not support ACPI, so converting it to fwnode doesn't make that much
> > sese until the proper ACPI patches get merged, which have now been
> > rebased on this series by Marcin in the expectation that these patches
> > would be merged... so I don't want to tred on Marcin's feet on that.
> 
> But it's normal development process...
> 
> Anyway, it seems to me that you are using fwnode out of that (with the
> exception of one call). To me it looks that you add a work to him, rather
> than making his life easier, since you know ahead that this is going to be
> converted.

No, I didn't know ahead of time until Marcin piped up about it, and
then we discussed how to resolve the conflict between the two patch
sets.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

