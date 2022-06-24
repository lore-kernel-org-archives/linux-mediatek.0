Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80A8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvC3hKcHudsmfI6Le1oSw1bM1RtYf3i6c9eRpdC/T78=; b=3pI8ufr5QBeV9G0IbAe2Pheqxg
	JnwzhivIwYevSusxW0NfTZzOi/ecAeurkgaHEOfPiawKxXqo39vlMwt2hm7vlnrb8gr/RpeoGKxnT
	qzz6jUHtqLEqayFjftqi2jgwrUBcbHHgOrp8s7LCnojd++9kxBZPX8wnHORRJrMpSxoIweEkldrpz
	xRo9qJgfQH0QTArSS689jHG/rBRqoUUtp/Fpxs50OIirDgVdw07luLaPUJ8fEhxceeooJ3tRXwIL6
	M1O6HmxahopPcrAZWdEqVNIpfRIvZhdzxHxG/8XLMGyHmVC9tdPRl8e5z0OSy3ahw8lbqBm1Zn/YY
	U9Z1s2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hhQ-001xpw-Mc; Fri, 24 Jun 2022 11:42:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hhF-001xnj-8E; Fri, 24 Jun 2022 11:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mvC3hKcHudsmfI6Le1oSw1bM1RtYf3i6c9eRpdC/T78=; b=DzfLFgNLjh9kd3wyq/XcApsocC
	Sh4C9bdpFDdBu45CccWYT1hRIxSvI8bqWRYD7CauHiV1oaJTRUdPbfc4AyIOvNWpzGis39eaYYmEV
	uv6FUyUwY9DUrrVn6wm3zr/BE6+/63epCrsCaDDCxgGejlFhzicsHPbIO+CUYT7Ng9BSUP+L1bBo/
	8MXSiMRlHe+UCvW7zf0YWqP0+C+M70Y8hb8sy46wXY8ZX8z2z0C350eb+P903lpO7/9AGwma5TRTe
	KupCoI+8oPZO4tL50KS+w3VZKBgWqUmjqXBLUxq6Acp6bhePiLrr6Nih/TOLuNNN4vTgJr14OW5Iq
	RnQMH0eQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33020)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o4hgr-0005rC-AU; Fri, 24 Jun 2022 12:41:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o4hgk-0000w9-Jg; Fri, 24 Jun 2022 12:41:26 +0100
Date: Fri, 24 Jun 2022 12:41:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
Subject: [PATCH RFC net-next 0/4] net: dsa: always use phylink
Message-ID: <YrWi5oBFn7vR15BH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_044157_334597_EE924325 
X-CRM114-Status: GOOD (  20.55  )
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

Currently, the core DSA code conditionally uses phylink for CPU and DSA
ports depending on whether the firmware specifies a fixed-link or a PHY.
If either of these are specified, then phylink is used for these ports,
otherwise phylink is not, and we rely on the DSA drivers to "do the
right thing". However, this detail is not mentioned in the DT binding,
but Andrew has said that this behaviour has always something that DSA
wants.

mv88e6xxx has had support for this for a long time with its "SPEED_MAX"
thing, which I recently reworked to make use of the mac_capabilities in
preparation to solving this more fully.

This series is an experiment to solve this properly, and it does this
in two steps.

The first step consists of the first two patches. Phylink needs to
know the PHY interface mode that is being used so it can (a) pass the
right mode into the MAC/PCS etc and (b) know the properties of the
link and therefore which speeds can be supported across it.

In order to achieve this, the DSA phylink_get_caps() method has an
extra argument added to it so that DSA drivers can report the
interface mode that they will be using for this port back to the core
DSA code, thereby allowing phylink to be initialised with the correct
interface mode.

Note that this can only be used for CPU and DSA ports as "user" ports
need a different behaviour - they rely on getting the interface mode
from phylib, which will only happen if phylink is initialised with
PHY_INTERFACE_MODE_NA. Unfortunately, changing this behaviour is likely
to cause widespread regressions.

Obvious questions:
1. Should phylink_get_caps() be augmented in this way, or should it be
   a separate method?

2. DSA has traditionally used "interface mode for the maximum supported
   speed on this port" where the interface mode is programmable (via
   its internal port_max_speed_mode() method) but this is only present
   for a few of the sub-drivers. Is reporting the current interface
   mode correct where this method is not implemented?

The second step is to introduce a function that allows phylink to be
reconfigured after creation time to operate at max-speed fixed-link
mode for the PHY interface mode, also using the MAC capabilities to
determine the speed and duplex mode we should be using.

Obvious questions:
1. Should we be allowing half-duplex for this?
2. If we do allow half-duplex, should we prefer fastest speed over
   duplex setting, or should we prefer fastest full-duplex speed
   over any half-duplex?
3. How do we sanely switch DSA from its current behaviour to always
   using phylink for these ports without breakage - this is the
   difficult one, because it's not obvious which drivers have been
   coded to either work around this quirk of the DSA implementation.
   For example, if we start forcing the link down before calling
   dsa_port_phylink_create(), and we then fail to set max-fixed-link,
   then the CPU/DSA port is going to fail, and we're going to have
   lots of regressions.

Please look at the patches and make suggestions on how we can proceed
to clean up this quirk of DSA.

 drivers/net/dsa/b53/b53_common.c       |  3 +-
 drivers/net/dsa/bcm_sf2.c              |  3 +-
 drivers/net/dsa/hirschmann/hellcreek.c |  3 +-
 drivers/net/dsa/lantiq_gswip.c         |  6 ++-
 drivers/net/dsa/microchip/ksz_common.c |  3 +-
 drivers/net/dsa/mt7530.c               |  3 +-
 drivers/net/dsa/mv88e6xxx/chip.c       | 53 +++++++---------------
 drivers/net/dsa/ocelot/felix.c         |  3 +-
 drivers/net/dsa/qca/ar9331.c           |  3 +-
 drivers/net/dsa/qca8k.c                |  3 +-
 drivers/net/dsa/realtek/rtl8365mb.c    |  3 +-
 drivers/net/dsa/sja1105/sja1105_main.c |  3 +-
 drivers/net/dsa/xrs700x/xrs700x.c      |  3 +-
 drivers/net/phy/phylink.c              | 83 ++++++++++++++++++++++++++++++++++
 include/linux/phylink.h                |  2 +
 include/net/dsa.h                      |  3 +-
 net/dsa/port.c                         | 42 ++++++++++-------
 17 files changed, 154 insertions(+), 68 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

