Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03625C46CA0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 01:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UJpZNZ8ZbTL/bjhXPu3ciobGpQGDmeQH4Mywv+BbzOo=; b=MtUqxyD9jhy6GcFpcUdvEOb2e4
	/C//ZtKlMZTPC5T3TzYboqeE+zRkpPZTlE73HGGIa+kUhsmHFgwRpii1Q7tNqmFLMDiXPyYKfjHVZ
	a1lsTBcVC6Ky6mlX3zx25y7OR1noK+hrpV1wsy70MMhS/2FI18iHbjQPrL1YPWoELf0joExxjj9Ul
	hMtpWYzdNZti/rSlUzxbp1iWKcnDnMNx/M0RoCyoO5KNM2j3zq5/oKen42JhjnIMc0TAl3pGmo5OI
	LYYmT4FcCmRt3mT2P8XafII6slrgpYeq/KdT8NlLjhzxRz9m6g4nzqXCC2vADRCT0UU5T7U7HswoB
	zjN9qQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAgxV-008p4A-3D;
	Wed, 06 Dec 2023 01:44:17 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAgxS-008p3H-2j;
	Wed, 06 Dec 2023 01:44:16 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rAgx1-0002eo-1a;
	Wed, 06 Dec 2023 01:43:48 +0000
Date: Wed, 6 Dec 2023 01:43:44 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 0/8] Add support for 10G Ethernet SerDes on MT7988
Message-ID: <cover.1701826319.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_174415_070281_9583B57A 
X-CRM114-Status: GOOD (  13.33  )
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

This series aims to add support for GMAC2 and GMAC3 of the MediaTek MT7988 SoC.
While the vendor SDK stuffs all this into their Ethernet driver, I've tried to
seperate things into a PHY driver, a PCS driver as well as changes to the
existing Ethernet and LynxI PCS driver.

 +--------------+   +----------------+   +------------------+
 |              +---|  USXGMII PCS   |---+                  |
 | Ethernet MAC |   +----------------+   | PEXTP SerDes PHY |
 |              +---|   SGMII PCS    |---+                  |
 +--------------+   +----------------+   +------------------+

Alltogether this allows using GMAC2 and GMAC3 with all possible interface modes,
including in-band-status if needed.

Note that this series depends on patch
"dt-bindings: clock: mediatek: add MT7988 clock IDs"
being merged before.

https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=807227

Changes since RFC v1:
 - drop patch inhibiting SGMII AN in 2500Base-X mode
 - make pcs-mtk-lynxi a proper platform driver
 - ... hence allowing to remove all the wrappers from the usxgmii driver
 - attach PEXTP to MAC instead of to USXGMII PCS

Daniel Golle (8):
  dt-bindings: phy: mediatek,xfi-pextp: add new bindings
  phy: add driver for MediaTek pextp 10GE SerDes PHY
  net: pcs: pcs-mtk-lynxi: add platform driver for MT7988
  dt-bindings: net: pcs: add bindings for MediaTek USXGMII PCS
  net: pcs: add driver for MediaTek USXGMII PCS
  dt-bindings: net: mediatek: remove wrongly added clocks and SerDes
  dt-bindings: net: mediatek,net: fix and complete mt7988-eth binding
  net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988

 .../devicetree/bindings/net/mediatek,net.yaml | 180 ++++++--
 .../bindings/net/pcs/mediatek,usxgmii.yaml    |  60 +++
 .../bindings/phy/mediatek,xfi-pextp.yaml      |  80 ++++
 MAINTAINERS                                   |   3 +
 drivers/net/ethernet/mediatek/mtk_eth_path.c  | 122 +++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 284 ++++++++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 107 ++++-
 drivers/net/pcs/Kconfig                       |  11 +
 drivers/net/pcs/Makefile                      |   1 +
 drivers/net/pcs/pcs-mtk-lynxi.c               | 170 ++++++-
 drivers/net/pcs/pcs-mtk-usxgmii.c             | 413 ++++++++++++++++++
 drivers/phy/mediatek/Kconfig                  |  11 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pextp.c          | 365 ++++++++++++++++
 include/linux/pcs/pcs-mtk-lynxi.h             |   1 +
 include/linux/pcs/pcs-mtk-usxgmii.h           |  26 ++
 16 files changed, 1746 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml
 create mode 100644 drivers/net/pcs/pcs-mtk-usxgmii.c
 create mode 100644 drivers/phy/mediatek/phy-mtk-pextp.c
 create mode 100644 include/linux/pcs/pcs-mtk-usxgmii.h

-- 
2.43.0

