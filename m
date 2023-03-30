Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E114CC761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RMUDoZuVbNdMCto62844rMiAMonPsQuJO3n9Tz7XFqQ=; b=hge0EeAyFoitIyjV8Y4Lo43H+z
	KzIFMtrONkUv6KaLYe2RzpRl1xY90olucAVJmbUgkop4NqiHboLRonFa52XO98euVl6NQPfpSNBKX
	ETbbD7gQDJ5d3tfhhD7DqpHWSGuXmff2ElAKJ9YiqxvGG7hhP97DMfbaJbTWnHovStOXlLFYIFP0x
	mh8Vnuvzoqi0mg2kLxl/Y2n7CrFD8uwClkfg1Miqw5YQB8OElagRHemtWzbJCe15mO5VGp36UWRqT
	BMOS2vzC2azkUrKsgKfyVR7JTNafxrIZPFr6i235Aga3pSCI4KHTq0HZHyv19MW94zTKXLd+T1803
	tJBtD8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phu3f-004D08-34;
	Thu, 30 Mar 2023 15:19:23 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phu3Y-004Cyk-2j;
	Thu, 30 Mar 2023 15:19:22 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phu3Q-0006ZI-2u;
	Thu, 30 Mar 2023 17:19:09 +0200
Date: Thu, 30 Mar 2023 16:19:04 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Shih <Sam.Shih@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH net-next 00/15] net: dsa: add support for MT7988
Message-ID: <cover.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_081916_880651_49097EF9 
X-CRM114-Status: GOOD (  12.61  )
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

The MediaTek MT7988 SoC comes with a built-in switch very similar to
previous MT7530 and MT7531. However, the switch address space is mapped
into the SoCs memory space rather than being connected via MDIO.
Using MMIO simplifies register access and also removes the need for a bus
lock, and for that reason also makes interrupt handling more light-weight.

Note that this is different from previous SoCs like MT7621 and MT7623N
which also came with an integrated MT7530-like switch which yet had to be
accessed via MDIO.

Split-off the part of the driver registering an MDIO driver, then add
another module acting as MMIO/platform driver.

The whole series has been tested on various MediaTek boards:
 * MT7623A + MT7530 (BPi-R2)
 * MT7986A + MT7531 (BPi-R3)
 * MT7988A reference board

Changes since RFC v3:
 * WARN_ON_ONCE if register read fails
 * move probing of the reset GPIO and reset controller link out of
   common  probe function, as they are not actually common

Changes since RFC v2:
 * split into many small commits to ease review
 * introduce helper functions to reduce code duplication
 * use helpers for locking to make lock-skipping easier and less ugly
   to implement.
 * add dt-bindings for mediatek,mt7988-switch

Changes since initial RFC:
 * use regmap for register access and move register access to bus-
   specific driver
 * move initialization of MT7531 SGMII PCS to MDIO driver

Daniel Golle (15):
  net: dsa: mt7530: make some noise if register read fails
  net: dsa: mt7530: refactor SGMII PCS creation
  net: dsa: mt7530: use unlocked regmap accessors
  net: dsa: mt7530: use regmap to access switch register space
  net: dsa: mt7530: move SGMII PCS creation to mt7530_probe function
  net: dsa: mt7530: introduce mutex helpers
  net: dsa: mt7530: move p5_intf_modes() function to mt7530.c
  net: dsa: mt7530: introduce mt7530_probe_common helper function
  net: dsa: mt7530: introduce mt7530_remove_common helper function
  net: dsa: mt7530: split-off common parts from mt7531_setup
  net: dsa: mt7530: introduce separate MDIO driver
  net: dsa: mt7530: skip locking if MDIO bus isn't present
  net: dsa: mt7530: add support for 10G link modes for CPU port
  net: dsa: mt7530: introduce driver for MT7988 built-in switch
  dt-bindings: net: dsa: mediatek,mt7530: add mediatek,mt7988-switch

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  26 +-
 MAINTAINERS                                   |   3 +
 drivers/net/dsa/Kconfig                       |  28 +-
 drivers/net/dsa/Makefile                      |   4 +-
 drivers/net/dsa/mt7530-mdio.c                 | 271 ++++++++++
 drivers/net/dsa/mt7530-mmio.c                 | 101 ++++
 drivers/net/dsa/mt7530.c                      | 511 ++++++++----------
 drivers/net/dsa/mt7530.h                      |  38 +-
 8 files changed, 668 insertions(+), 314 deletions(-)
 create mode 100644 drivers/net/dsa/mt7530-mdio.c
 create mode 100644 drivers/net/dsa/mt7530-mmio.c


base-commit: 4ddd6375c3ef6756d492ea5466408cace097121b
-- 
2.39.2


