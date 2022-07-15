Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAA2CCA481
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gA3XVimnX7f3s6KgiLlFK+Po6cdJBSVv58Yny5mkLeQ=; b=z0IRbN+hmeLLFy7XgB4NY5Q08U
	gg28mtck1Yg7MSp1SrtkRSUTGJYQX1XIlMwlalZZO15oTfYkrpdbTRnWnU+JlO5FODKiriBa9wQRq
	0T/RsKzBnt0JlYQudeUqX8JHoOYBJVy4PlAKwsQ/ijxmOLrOnUtWgZq2TYNbi+k+KfSANrJbZ6nAq
	8cmfjEAzFduYJ5Ds/8ov2FHqHO2NZzlHQXnaH22TPHhoSQbNh9Oeiq9IndBXgLPc5VEv7lhDKBQ+w
	62tI8utZWF/jemxFmiUsQLcGmc3l3RwVZiByTexYmsDLHq4pAJZT5+fmrKgPPP5u8+A0+NIDIMsN6
	mdRx17/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNlG-008bXG-Jh; Fri, 15 Jul 2022 16:01:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNl4-008bU8-RD; Fri, 15 Jul 2022 16:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gA3XVimnX7f3s6KgiLlFK+Po6cdJBSVv58Yny5mkLeQ=; b=g65/fd96gMfMyEVlEnBM0l5zaS
	I8j5swFEkAOUfVQgZd+936F4JHD28LjuG+g3eI+6VjNyCUz7vfuRdCQfplCtK34FM+EK8L3UxskA+
	qHR7vSNgLT/CODJlCB/TcIz0wxA5FOd1jT2FK7+lX8CeQvK1jtAaqAt4jErTzog8BGjmrEcLdnKaV
	Epbs313LqhkOjOz8PsRNN0ImTpyowJf2L7igwOcBxAhZcjV39uVx1PanTolqfobZ5uyRTFAmn9Zr/
	aczV3p9qTdb58iQuv1WDVITmuEzrDdqu2fyrPL4GYJ6pNLsBlCIf2WNwa4YEHta3PFoDDOxYFIERQ
	XlN/Wl4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33358)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oCNkZ-0007C7-It; Fri, 15 Jul 2022 17:01:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oCNkR-0007g6-88; Fri, 15 Jul 2022 17:00:59 +0100
Date: Fri, 15 Jul 2022 17:00:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	Marek =?us-ascii?B?PT9pc28tODg1OS0xP1E/QmVoPUZBbj89?= <kabel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 0/6] net: dsa: always use phylink
Message-ID: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_090138_900257_DA1C6391 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

Hi,

This is a re-hash of the previous RFC series, this time using the
suggestion from Vladimir to create a swnode based fixed-link
specifier.

Most of the changes are to DSA and phylink code from the previous
series. I've tested on my Clearfog (which has just one Marvell DSA
switch) and it works there - also tested without the fixed-link
specified in DT.

 drivers/base/swnode.c                  |  14 ++-
 drivers/net/dsa/b53/b53_common.c       |   3 +-
 drivers/net/dsa/bcm_sf2.c              |   3 +-
 drivers/net/dsa/hirschmann/hellcreek.c |   3 +-
 drivers/net/dsa/lantiq_gswip.c         |   6 +-
 drivers/net/dsa/microchip/ksz_common.c |   3 +-
 drivers/net/dsa/mt7530.c               |   3 +-
 drivers/net/dsa/mv88e6xxx/chip.c       | 134 ++++++++++++-------------
 drivers/net/dsa/mv88e6xxx/chip.h       |   6 +-
 drivers/net/dsa/mv88e6xxx/port.c       |  32 ------
 drivers/net/dsa/mv88e6xxx/port.h       |   5 -
 drivers/net/dsa/ocelot/felix.c         |   3 +-
 drivers/net/dsa/qca/ar9331.c           |   3 +-
 drivers/net/dsa/qca8k.c                |   3 +-
 drivers/net/dsa/realtek/rtl8365mb.c    |   3 +-
 drivers/net/dsa/sja1105/sja1105_main.c |   3 +-
 drivers/net/dsa/xrs700x/xrs700x.c      |   3 +-
 drivers/net/phy/phylink.c              |  30 ++++--
 include/linux/phylink.h                |   1 +
 include/linux/property.h               |   4 +
 include/net/dsa.h                      |   3 +-
 net/dsa/port.c                         | 175 +++++++++++++++++++++++++++++----
 22 files changed, 290 insertions(+), 153 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

