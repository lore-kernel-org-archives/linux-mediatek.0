Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CCEC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 03:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ICHy0x9L7FZYxDWuW2YY3FBCoGcD6xZ1gGBQdZu8k3s=; b=dHNjkVp5Z92XmFOdsmXlEYCqwg
	5DoaiLkSk+IJsbO7Sya/YZTDN0jqVHd1K+omVOiqvnIg2CAY0A2SFMevsrl7Tw2pU1TlcYvhIXYSn
	WihqpQSlFHE7HyCpehhLjL2PxewxmvN50zW4f6vEXxQRTccwnmuIhNzMxOB0I+IrAI0Hj4umKYPhh
	UjRwOmN6svf6nVVXWIaYgSUGduBqrz4Kyj3UIE66ZSr01fV53QfmepEY/2oQmSTbHQdu2TO7rl/Xx
	8C58XdQg9pep8pabpNNkH0pxfxBXGz7K20OXv6nJxD+su9d/ocz8v6evNs4x00VRBiLMHxCg5NKsx
	C0gXMxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p772R-007Vnq-Mu; Mon, 19 Dec 2022 03:42:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p771q-007VLF-7I; Mon, 19 Dec 2022 03:41:27 +0000
X-UUID: 27c2b2106f294a0fa702b2306de45650-20221218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ICHy0x9L7FZYxDWuW2YY3FBCoGcD6xZ1gGBQdZu8k3s=;
	b=sIK/qWGQ1KoHQxT0TCESP4Lx7J26TvmKMmWq5L7Z1IeFO/KI8vNVepvmspEokBWLTZyrv+r25Xx6IsFwOA3r6V/YmGTPi4/vdShtaQM5mOntlGILOCAJXYigsFvWKgF1a+JZD8px260vIhEhV6eNLWNV9kcLCBnyORl2gdy5CE0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:8e4c21f7-7afd-4489-9da6-caa4b1e643df,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:44fbb689-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 27c2b2106f294a0fa702b2306de45650-20221218
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 724295864; Sun, 18 Dec 2022 20:41:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Dec 2022 10:40:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Dec 2022 10:40:30 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo
	<gch981213@gmail.com>
CC: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>
Subject: [PATCH v5 00/10] Add MediaTek MT7986 SPI NAND and ECC support
Date: Mon, 19 Dec 2022 10:40:09 +0800
Message-ID: <20221219024019.31974-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_194126_319553_3279964E 
X-CRM114-Status: GOOD (  12.70  )
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

This patch series add MediaTek MT7986 SPI NAND and ECC controller
support, split ECC engine with rawnand controller in bindings and
change to YAML schema.

Changes since V4:
 - Split arm and arm64 dts patch for fix existing NAND controller node name.

Changes since V3:
 - Correct mediatek,mtk-nfc.yaml dt-bindings.

Changes since V2:
 - Change ECC err_mask value with GENMASK macro.
 - Change snfi mediatek,rx-latch-latency to mediatek,rx-latch-latency-ns.
 - Add a separate patch for DTS change.
 - Move common description to top-level pattern properties.
 - Drop redundant parts in dt-bindings.

Changes since V1:
 - Use existing sample delay property.
 - Add restricting for optional nfi_hclk.
 - Improve and perfect dt-bindings documentation.
 - Change existing node name to match NAND controller DT bingings.
 - Fix issues reported by dt_binding_check.
 - Fix issues reported by dtbs_check.

Xiangsheng Hou (10):
  spi: mtk-snfi: Change default page format to setup default setting
  spi: mtk-snfi: Add optional nfi_hclk which is needed for MT7986
  mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
  dt-bindings: spi: mtk-snfi: Add compatible for MT7986
  spi: mtk-snfi: Add snfi sample delay and read latency adjustment
  dt-bindings: spi: mtk-snfi: Add read latch latency property
  dt-bindings: mtd: Split ECC engine with rawnand controller
  arm64: dts: mediatek: Fix existing NAND controller node name
  arm: dts: mediatek: Fix existing NAND controller node name
  dt-bindings: mtd: mediatek,nand-ecc-engine: Add compatible for MT7986

 .../bindings/mtd/mediatek,mtk-nfc.yaml        | 155 +++++++++++++++
 .../mtd/mediatek,nand-ecc-engine.yaml         |  63 +++++++
 .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   |  54 +++++-
 arch/arm/boot/dts/mt2701.dtsi                 |   2 +-
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   2 +-
 drivers/mtd/nand/ecc-mtk.c                    |  28 ++-
 drivers/spi/spi-mtk-snfi.c                    |  41 +++-
 9 files changed, 330 insertions(+), 193 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt

-- 
2.25.1


