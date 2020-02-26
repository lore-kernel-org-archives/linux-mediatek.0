Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FDFC4BA11
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:23:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB132467E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:23:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pBstNEel";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="pBc940/x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EB132467E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7lvWbXZYOwnFM1XZ4F/xURF90vF/LT8BeO8Eav/RKJE=; b=pBstNEelHOdA4s
	73zjx+vXX1X01opDSDKvaxVsHKUINWN6//TNkWhznsPnoB7s9+IXPUHDNw07gIHVXm6dfqU18hFjc
	/QM2keIe9hoCXvL7BnNa7/R217JUfwp+uWgfeKtinvOm7l8lW7KLdxWtWqY1Kdf4dkue+G6SYjLny
	rkA83sA9Y6LRxhPWWz93FGrkexZ/EX50MsRr9bxLv8rUmiZo7z75C8mS+qCeowdpdaR9Lvb6lCKML
	sBZkXsi5CYdWrAP20CbtNHHp2EoaC3yXWnYDyebyRzAYfFxbyX+ctp1W+zyEtcmxSqWxZjYYwwk4e
	cO7MBPaydxJkGHxzjQhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6tr3-0004xJ-KZ; Wed, 26 Feb 2020 10:23:49 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6tr0-0004w9-72; Wed, 26 Feb 2020 10:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cFVpx4YRUVFzc+9DHqfdkORwO59OSsrN3NUBEs25DtI=; b=pBc940/xSMyVKmzc+jKnvBnrl
 U0PrcS7rlhplkv3ua7fp+bCV0vStLayt37T/PKMxJPPoZ9CC2FtbD1nf25Ahb6ijldlL1CD0vDT8+
 TaHPlirnfkOxk2echaMoL9laxtU9PiSQrlMYJa6LiZ3HT7AkLFTviTFBU3ICkLO3jvBnvkoWv+x7a
 ZM6SAiQs/qso4XpcxhUwbduE4BPXzf2w37J4xqZ5nqE5ip0mEEQvEsfH/gJamCAse4G6wuKz5S8Bu
 4uVHTZiKhnnSUjWRWV2MizhLooSt7wq/Fy46vqpBNI1EnfjEEGb3EoPs4T/QHtT8T4Y9v9Y5Hq8Sh
 Savpz9BDw==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:45464)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j6tqY-0006rK-CP; Wed, 26 Feb 2020 10:23:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j6tqS-0008KS-I1; Wed, 26 Feb 2020 10:23:12 +0000
Date: Wed, 26 Feb 2020 10:23:12 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 0/8] rework phylink interface for split MAC/PCS
 support
Message-ID: <20200226102312.GX25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_022346_279963_929DF1DB 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-doc@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

The following series changes the phylink interface to allow us to
better support split MAC / MAC PCS setups.  The fundamental change
required for this turns out to be quite simple.

Today, mac_config() is used for everything to do with setting the
parameters for the MAC, and mac_link_up() is used to inform the
MAC driver that the link is now up (and so to allow packet flow.)
mac_config() also has had a few implementation issues, with folk
who believe that members such as "speed" and "duplex" are always
valid, where "link" gets used inappropriately, etc.

With the proposed patches, all this changes subtly - but in a
backwards compatible way at this stage.

We pass the the full resolved link state (speed, duplex, pause) to
mac_link_up(), and it is now guaranteed that these parameters to
this function will always be valid (no more SPEED_UNKNOWN or
DUPLEX_UNKNOWN here - unless phylink is fed with such things.)

Drivers should convert over to using the state in mac_link_up()
rather than configuring the speed, duplex and pause in the
mac_config() method. The patch series includes a number of MAC
drivers which I've thought have been easy targets - I've left the
remainder as I think they need maintainer input. However, *all*
drivers will need conversion for future phylink development.

v2: add ocelot/felix and qca/ar9331 DSA drivers to patch 2, add
  received tested-by so far.

 Documentation/networking/sfp-phylink.rst          |  17 +++-
 drivers/net/dsa/b53/b53_common.c                  |   4 +-
 drivers/net/dsa/b53/b53_priv.h                    |   4 +-
 drivers/net/dsa/bcm_sf2.c                         |   4 +-
 drivers/net/dsa/lantiq_gswip.c                    |   4 +-
 drivers/net/dsa/mt7530.c                          |   4 +-
 drivers/net/dsa/mv88e6xxx/chip.c                  |  79 +++++++++++++----
 drivers/net/dsa/ocelot/felix.c                    |   4 +-
 drivers/net/dsa/qca/ar9331.c                      |   4 +-
 drivers/net/dsa/sja1105/sja1105_main.c            |   4 +-
 drivers/net/ethernet/cadence/macb.h               |   1 -
 drivers/net/ethernet/cadence/macb_main.c          |  57 +++++++-----
 drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  61 ++++++++-----
 drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h  |   1 +
 drivers/net/ethernet/marvell/mvneta.c             |  63 ++++++++-----
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c   | 102 +++++++++++++---------
 drivers/net/ethernet/mediatek/mtk_eth_soc.c       |   7 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |   4 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  37 ++++----
 drivers/net/phy/phylink.c                         |   9 +-
 include/linux/phylink.h                           |  57 ++++++++----
 include/net/dsa.h                                 |   4 +-
 net/dsa/port.c                                    |   7 +-
 23 files changed, 358 insertions(+), 180 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
