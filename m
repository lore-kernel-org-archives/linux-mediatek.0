Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ABBC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 21:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b9KlMc3UMJlU3Qd6ynnT/HM7quka973rYmagEVGFXRE=; b=wl74X1+S6x9lA1XDUW8bLUkJMX
	qZfLyXKOlZiipItEp4Rehaaa7hg8pGOHCKeNdNt4wt1CP8s/+CFnHPUmDXWjpaGh0nnBp5kq3cABK
	a7oTsodHIgNWS14Qfr9gJmBI4ZguPMcPyA01tmz5auUoN3Pd+Ivd5XmKcqeQXVHwL1KmB06/Ay2xv
	QIbLYsNA3SuA3QLM8hx8q5emcTDSZkIHk9jyjryz1kWRlEd5q2WBesRVS2b8odYh8/hgk3AhEPA99
	IFIMKoDGRsCGiHCZRUJ7zBk7Wl7hwvd+gMgNNdBSH0CKGfZBhPc2PHWM/oOMfg/Axma+G6UprvgWs
	g6aC17wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pguUy-00CQFs-0V;
	Mon, 27 Mar 2023 21:35:28 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pguUv-00CQDn-1s;
	Mon, 27 Mar 2023 21:35:26 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pguUj-0008Kx-2f;
	Mon, 27 Mar 2023 23:35:13 +0200
Date: Mon, 27 Mar 2023 22:35:00 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Subject: [RFC PATCH net-next 0/2] net: dsa: add support for MT7988
Message-ID: <ZCIMBBzDmfZlu5T8@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_143525_618751_81F81C2B 
X-CRM114-Status: GOOD (  10.55  )
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

split-off the part of the driver registering an MDIO driver, then add
another module acting as MMIO/platform driver.

Daniel Golle (2):
  net: dsa: mt7530: split-off MDIO driver
  net: dsa: mt7530: introduce MMIO driver for MT7988 SoC

 drivers/net/dsa/Kconfig       |  16 +-
 drivers/net/dsa/Makefile      |   4 +-
 drivers/net/dsa/mt7530-mdio.c | 165 +++++++++++++++
 drivers/net/dsa/mt7530-mmio.c | 126 ++++++++++++
 drivers/net/dsa/mt7530.c      | 375 ++++++++++++++++++----------------
 drivers/net/dsa/mt7530.h      |  39 ++--
 6 files changed, 526 insertions(+), 199 deletions(-)
 create mode 100644 drivers/net/dsa/mt7530-mdio.c
 create mode 100644 drivers/net/dsa/mt7530-mmio.c

-- 
2.39.2


