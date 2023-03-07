Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A68C6FD1E
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=tlL60PCJb7uEqU6OBEccB5pIRHgbqqtkPsRNc9zpnhY=; b=5GW
	KHYyVZqB9gi7ueyxc1fjCdSP4tWSfvdbxLpNWMDqI7zQN75y0aVR6MWGaQy49vZ4zGuP9ZGMn9h2/
	Jo/f0iAxJPM97kj/SIxNyEQWqtRJ4lqYeE8JYzxvJV74Tlg1BaLK3psvR2GPPSRcFQerxW0NzKtH4
	Yf9Xg/wdp8BtJP/SazFqTtK6yIAoPVl47Pe37dsTlBxmDvC2MfN9YNVAUHhrRt6zTN/zFJLZDcFvk
	Wx0Qj8sGEdTC0pQARdhMl1fYU7EEb2yVRfBG1/SZRkcwKfTOuaKeqUhtdw7mlGWaOqfPrJSqsdvfg
	AsXAN5uL0zSVkgylUNHAZpDFaDQEVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZds-001JZy-1s; Tue, 07 Mar 2023 15:54:20 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZdo-001JXo-IJ; Tue, 07 Mar 2023 15:54:18 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pZZdU-0001m1-0M;
	Tue, 07 Mar 2023 16:53:56 +0100
Date: Tue, 7 Mar 2023 15:52:19 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH net-next v12 00/18] net: ethernet: mtk_eth_soc: various
 enhancements
Message-ID: <cover.1678201958.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_075416_784152_925EC917 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: Alexander Couzens <lynxis@fe80.eu>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series brings a variety of fixes and enhancements for mtk_eth_soc,
adds support for the MT7981 SoC and facilitates sharing the SGMII PCS
code between mtk_eth_soc and mt7530.
Also prepare support for MT7988 which has been done while net-next was
closed.

Note that this series depends on commit 697c3892d825
("regmap: apply reg_base and reg_downshift for single register ops") to
not break mt7530 pcs register access.

For SGMII and 1000Base-X mode to work well it also depends on commit
193250ace270 ("net: ethernet: mtk_eth_soc: fix RX data corruption issue")
which has already been merged via the net tree.

The whole series has been tested on MT7622+MT7531 (BPi-R64),
MT7623+MT7530 (BPi-R2), MT7981+GPY211 (GL.iNet GL-MT3000) and
MT7986+MT7531 (BPi-R3). On the BananaPi R3 a variete of SFP modules
have been tested, all of them (some SGMII with PHY, others 2500Base-X
or 1000Base-X without PHY) are working well now.

Changes since v11:
 * remove patch "net: ethernet: mtk_eth_soc: fix RX data corruption issue"
   as it has already been merged via net tree
 * add commits fixing 1000Base-X and 2500Base-X modes after phylink_pcs
   conversion
 * completely remove mtk_sgmii.c as only about 20 lines were left in that
   file
 * Add commits from Lorenzo for MT7988 as requested by him

Changes since v10:
 * improve mediatek,mt7981-eth dt-bindings
 * use regmap_set_bits instead of regmap_update_bits where possible
 * completely remove mtk_sgmii.c
 * no need to keep struct mtk_sgmii either as it had only a single
   element

Changes since v9:
 * fix path in mediatek,sgmiisys dt-binding

Changes since v8:
 * move mediatek,sgmiisys dt-bindings to correct net/pcs folder
 * rebase on top of net-next/main so series applies cleanly again

Changes since v7:
 * move mediatek,sgmiisys.yaml to more appropriate folder
 * don't include <linux/phylink.h> twice in PCS driver, sort includes

Changes since v6:
 * label MAC MCR bit 12 in 08/12, MediaTek replied explaining its function

Changes since v5:
 * drop dev pointer also from struct mtk_sgmii, pass it as function
   parameter instead
 * address comments left for dt-bindings
 * minor improvements to commit messages

Changes since v4:
 * remove unused dev pointer in struct pcs_mtk_lynxi
 * squash link timer check into correct follow-up patch

Changes since v3:
 * remove unused #define's
 * use BMCR_* instead of #define'ing our own constants
 * return before changing registers in case of invalid link timer

Changes since v2:
 * improve dt-bindings, convert sgmisys bindings to dt-schema yaml
 * fix typo

Changes since v1:
 * apply reverse xmas tree everywhere
 * improve commit descriptions
 * add dt binding documentation
 * various small changes addressing all comments received for v1

Daniel Golle (13):
  net: ethernet: mtk_eth_soc: add support for MT7981 SoC
  dt-bindings: net: mediatek,net: add mt7981-eth binding
  dt-bindings: arm: mediatek: sgmiisys: Convert to DT schema
  dt-bindings: arm: mediatek: sgmiisys: add MT7981 SoC
  net: ethernet: mtk_eth_soc: set MDIO bus clock frequency
  net: ethernet: mtk_eth_soc: reset PCS state
  net: ethernet: mtk_eth_soc: only write values if needed
  net: ethernet: mtk_eth_soc: fix 1000Base-X and 2500Base-X modes
  net: ethernet: mediatek: Fix SerDes link status if not in SGMII mode
  net: ethernet: mtk_eth_soc: ppe: add support for flow accounting
  net: pcs: add driver for MediaTek SGMII PCS
  net: ethernet: mtk_eth_soc: switch to external PCS driver
  net: dsa: mt7530: use external PCS driver

Lorenzo Bianconi (6):
  net: ethernet: mtk_eth_soc: add MTK_NETSYS_V1 capability bit
  net: ethernet: mtk_eth_soc: move MAX_DEVS in mtk_soc_data
  net: ethernet: mtk_eth_soc: rely on num_devs and remove MTK_MAC_COUNT
  net: ethernet: mtk_eth_soc: add MTK_NETSYS_V3 capability bit
  net: ethernet: mtk_eth_soc: convert caps in mtk_soc_data struct to u64
  net: ethernet: mtk_eth_soc: add support for MT7988 SoC

 .../arm/mediatek/mediatek,sgmiisys.txt        |  27 --
 .../devicetree/bindings/net/mediatek,net.yaml |  53 ++-
 .../bindings/net/pcs/mediatek,sgmiisys.yaml   |  55 +++
 MAINTAINERS                                   |   7 +
 drivers/net/dsa/Kconfig                       |   1 +
 drivers/net/dsa/mt7530.c                      | 277 +++--------
 drivers/net/dsa/mt7530.h                      |  47 +-
 drivers/net/ethernet/mediatek/Kconfig         |   2 +
 drivers/net/ethernet/mediatek/Makefile        |   2 +-
 drivers/net/ethernet/mediatek/mtk_eth_path.c  |  36 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 448 +++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 301 ++++++++----
 drivers/net/ethernet/mediatek/mtk_ppe.c       | 114 ++++-
 drivers/net/ethernet/mediatek/mtk_ppe.h       |  25 +-
 .../net/ethernet/mediatek/mtk_ppe_debugfs.c   |   9 +-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |   8 +
 drivers/net/ethernet/mediatek/mtk_ppe_regs.h  |  14 +
 drivers/net/ethernet/mediatek/mtk_sgmii.c     | 203 --------
 drivers/net/pcs/Kconfig                       |   7 +
 drivers/net/pcs/Makefile                      |   1 +
 drivers/net/pcs/pcs-mtk-lynxi.c               | 308 ++++++++++++
 include/linux/pcs/pcs-mtk-lynxi.h             |  13 +
 22 files changed, 1266 insertions(+), 692 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
 create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
 delete mode 100644 drivers/net/ethernet/mediatek/mtk_sgmii.c
 create mode 100644 drivers/net/pcs/pcs-mtk-lynxi.c
 create mode 100644 include/linux/pcs/pcs-mtk-lynxi.h


base-commit: 36e5e391a25af28dc1f4586f95d577b38ff4ed72
-- 
2.39.2


Daniel Golle (13):
  net: ethernet: mtk_eth_soc: add support for MT7981 SoC
  dt-bindings: net: mediatek,net: add mt7981-eth binding
  dt-bindings: arm: mediatek: sgmiisys: Convert to DT schema
  dt-bindings: arm: mediatek: sgmiisys: add MT7981 SoC
  net: ethernet: mtk_eth_soc: set MDIO bus clock frequency
  net: ethernet: mtk_eth_soc: reset PCS state
  net: ethernet: mtk_eth_soc: only write values if needed
  net: ethernet: mtk_eth_soc: fix 1000Base-X and 2500Base-X modes
  net: ethernet: mtk_eth_soc: Fix link status for none-SGMII modes
  net: ethernet: mtk_eth_soc: ppe: add support for flow accounting
  net: pcs: add driver for MediaTek SGMII PCS
  net: ethernet: mtk_eth_soc: switch to external PCS driver
  net: dsa: mt7530: use external PCS driver

Lorenzo Bianconi (5):
  net: ethernet: mtk_eth_soc: add MTK_NETSYS_V1 capability bit
  net: ethernet: mtk_eth_soc: move MAX_DEVS in mtk_soc_data
  net: ethernet: mtk_eth_soc: rely on num_devs and remove MTK_MAC_COUNT
  net: ethernet: mtk_eth_soc: add MTK_NETSYS_V3 capability bit
  net: ethernet: mtk_eth_soc: convert caps in mtk_soc_data struct to u64

 .../arm/mediatek/mediatek,sgmiisys.txt        |  27 --
 .../devicetree/bindings/net/mediatek,net.yaml |  53 ++-
 .../bindings/net/pcs/mediatek,sgmiisys.yaml   |  55 +++
 MAINTAINERS                                   |   7 +
 drivers/net/dsa/Kconfig                       |   1 +
 drivers/net/dsa/mt7530.c                      | 277 ++++-----------
 drivers/net/dsa/mt7530.h                      |  47 +--
 drivers/net/ethernet/mediatek/Kconfig         |   2 +
 drivers/net/ethernet/mediatek/Makefile        |   2 +-
 drivers/net/ethernet/mediatek/mtk_eth_path.c  |  36 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 314 ++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 207 ++++++------
 drivers/net/ethernet/mediatek/mtk_ppe.c       | 114 ++++++-
 drivers/net/ethernet/mediatek/mtk_ppe.h       |  25 +-
 .../net/ethernet/mediatek/mtk_ppe_debugfs.c   |   9 +-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |   8 +
 drivers/net/ethernet/mediatek/mtk_ppe_regs.h  |  14 +
 drivers/net/ethernet/mediatek/mtk_sgmii.c     | 203 -----------
 drivers/net/pcs/Kconfig                       |   7 +
 drivers/net/pcs/Makefile                      |   1 +
 drivers/net/pcs/pcs-mtk-lynxi.c               | 308 +++++++++++++++++
 include/linux/pcs/pcs-mtk-lynxi.h             |  13 +
 22 files changed, 1051 insertions(+), 679 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
 create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,sgmiisys.yaml
 delete mode 100644 drivers/net/ethernet/mediatek/mtk_sgmii.c
 create mode 100644 drivers/net/pcs/pcs-mtk-lynxi.c
 create mode 100644 include/linux/pcs/pcs-mtk-lynxi.h


base-commit: 36e5e391a25af28dc1f4586f95d577b38ff4ed72
-- 
2.39.2

