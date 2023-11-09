Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D343C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 21:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1uolZe8cKTsNCbxzystCWtpbdkBcjS+VBbRWLg1T8NM=; b=SSxIKW4YvGZqsCu41SqCcD8Xs/
	cQvvn/jxSGAJThCXt6IQMi9pUT04vUbgBR+lOVJHnAaD0DsGb5/Y8nky66ydIw4rV43hQFUzf/i4K
	Z70Gj4nCc6njMogYHboDi24k4XoJ2dh+lGxYCaHhy91VzpWEV3Oup9lkSdLFt2Q/SOl9JgCXQs6yK
	PmgTyftc4jjOwm5JseUbmWfi1kMBO+29x02jYX+lpTRSx9LUAVKgtzU6YzMpnMCE0YsS9KyZWx7Ol
	gXu1LcVkgf0EBypQ8tgmuwIeY2OEhFS7A23FDe+XjCjp8eu9GlSzYRFl0PZwNP7yjnBLSTl77BwJD
	kzC/dp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Cvr-007ILe-0L;
	Thu, 09 Nov 2023 21:51:23 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Cvo-007IJb-0j;
	Thu, 09 Nov 2023 21:51:21 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r1CvH-0003Tv-1d;
	Thu, 09 Nov 2023 21:50:47 +0000
Date: Thu, 9 Nov 2023 21:50:43 +0000
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
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH 0/8] Add support for 10G Ethernet SerDes on MT7988
Message-ID: <cover.1699565880.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_135120_262076_1FE1D602 
X-CRM114-Status: GOOD (  12.74  )
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

                  +----------------+
+--------------+  |  USXGMII PCS   |   +------------------+
| Ethernet MAC +--+-------------+  +---+ PEXTP SerDes PHY |
+--------------+  |  SGMII PCS  |  |   +------------------+
                  +-------------+--+

Alltogether this allows using GMAC2 and GMAC3 with all possible interface modes,
including in-band-status if needed.

Daniel Golle (8):
  dt-bindings: phy: mediatek,xfi-pextp: add new bindings
  phy: add driver for MediaTek pextp 10GE SerDes PHY
  net: pcs: pcs-mtk-lynxi: use 2500Base-X without AN
  net: pcs: pcs-mtk-lynxi: allow calling with NULL advertising
  dt-bindings: net: pcs: add bindings for MediaTek USXGMII PCS
  net: pcs: add driver for MediaTek USXGMII PCS
  dt-bindings: net: mediatek,net: fix and complete mt7988-eth binding
  net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988

 .../devicetree/bindings/net/mediatek,net.yaml | 171 ++++-
 .../bindings/net/pcs/mediatek,usxgmii.yaml    | 105 +++
 .../bindings/phy/mediatek,xfi-pextp.yaml      |  71 ++
 MAINTAINERS                                   |   3 +
 drivers/net/ethernet/mediatek/Kconfig         |  17 +
 drivers/net/ethernet/mediatek/mtk_eth_path.c  | 122 +++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 178 ++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 105 ++-
 drivers/net/pcs/Kconfig                       |  10 +
 drivers/net/pcs/Makefile                      |   1 +
 drivers/net/pcs/pcs-mtk-lynxi.c               |  38 +-
 drivers/net/pcs/pcs-mtk-usxgmii.c             | 688 ++++++++++++++++++
 drivers/phy/mediatek/Kconfig                  |  11 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pextp.c          | 355 +++++++++
 include/linux/pcs/pcs-mtk-usxgmii.h           |  18 +
 16 files changed, 1813 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xfi-pextp.yaml
 create mode 100644 drivers/net/pcs/pcs-mtk-usxgmii.c
 create mode 100644 drivers/phy/mediatek/phy-mtk-pextp.c
 create mode 100644 include/linux/pcs/pcs-mtk-usxgmii.h

-- 
2.42.1

