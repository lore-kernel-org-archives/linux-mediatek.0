Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969D6CCFA1A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 19:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g2Ea0DWfLKHagtb+f2EQs/oSvtV0KXKnH9D3lP+qtqk=; b=Z46e71ttvxfWlB
	KyZ4nQHDI5wz4gBJQf9ad2ldhaP1Qa4PSKyfbima7y2OThoI2VUWzpfXw/dgHrFtnk940q83QFUUL
	sdCnCP8csF4B1HZ3v3FY0gTnwQyHXjnVgLL+rITs4TpKx1tMAwQJvC5SiQtq6dzt3qCqhpI5zskhI
	10oS/9YHwxNCbPjCCEICCk0Wu7Z0rwOzIynSyRot1h1SgEwx+94kdf/OAzFNK+bHnumHXlc4/IPt/
	OywcDx7J62KdbToJue+751i9cE7vyahjNb3y3zuSJIAo3HvGoX45D9+27bXVcgpT/qD8MKwjFawEB
	bkxIYjDSZiYdzbUzTCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjWz-0000000EKIw-1vTM;
	Wed, 05 Nov 2025 19:50:57 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjWr-0000000EKBZ-1fNQ;
	Wed, 05 Nov 2025 19:50:52 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id C59E1100877;
	Wed,  5 Nov 2025 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762372246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g2Ea0DWfLKHagtb+f2EQs/oSvtV0KXKnH9D3lP+qtqk=;
	b=xTYs1Z8jGMhlYKjYZQ2WnHMLz+Tmqzj0EF8hZELlrO8PIzmRT04cW9lps9/jyWKMEPrJDY
	phLmJmthaXRFro8YH9nDbUxRqpxcAwDW5zfOVJYzmy9Zo8tL+iY3EeerVw5hO3sBP2/u2k
	9tazsIXtvHaDyv3S1vaFEyxvbP1+928=
Received: from frank-u24.. (fttx-pool-194.15.81.38.bambit.de [194.15.81.38])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 8E2581226DD;
	Wed,  5 Nov 2025 19:50:45 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/5] Add Bananapi R4 Pro support
Date: Wed,  5 Nov 2025 20:50:00 +0100
Message-ID: <20251105195007.199229-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_115049_800058_C1F7C02F 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

BananaPi R4 Pro is a MT7988A based board which exists in 2 different
hardware versions:

- 4E: 4 GB RAM and using internal 2.5G Phy for WAN-Combo
- 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys

common parts:

- MediaTek MT7988A Quad-core Arm Corex-A73,1.8GHz processor
- 8GB eMMC flash
- 256MB SPI-NAND Flash
- Micro SD card slot
- 1x 10G SFP+ WAN
- 1x 10G SFP+ LAN
- 4x 2.5G RJ45 LAN (MxL86252C)
- 1x 1G RJ45 LAN (MT7988 internal switch)
- 2x miniPCIe slots with PCIe3.0 2lane interface for Wi-Fi NIC
- 2x M.2 M-KEY slots with PCIe3.0 1lane interface for NVME SSD
- 3x M.2 B-KEY slots with USB3.2 for 5G Module (PCIe shared with key-m)
- 1x USB3.2 slot
- 1x USB2.0 slot
- 1x USB TypeC Debug Console
- 2x13 PIN Header for expanding application

official product information:
https://docs.banana-pi.org/en/BPI-R4_Pro/BananaPi_BPI-R4_Pro

The PCIe is per default in key-m state and can be changed to key-b with
the pcie-overlays.

changes:
v2:
- dropped "dt-bindings: arm: mediatek: add BPI-R4 Pro board" which was
  applied from v1
- added new patch "disable 2.5G phy and enable at board layer"
- squashed "mt7988a: Add label for ssusb0" to r4pro dts commit
- some updates after angelos review to the r4pro dts commit
  - fixed buck4 and ldo displayed voltage (cannot be controlled by software)
    to match schematic
  - reorder fan after eth node (alphanumeric)
  - reorder spi-tx after spi-rx (alphanumeric)
  - follow reg first, then others also for spi-nand partitions
  - drop 2pg5 phy disabling node (due to new patch disabling by default)
  - change order of pinctrl (first number than names)
  - fix commit prefix (mediatek was missing)

Frank Wunderlich (5):
  dt-bindings: pinctrl: mt7988: allow gpio-hogs
  arm64: dts: mediatek: mt7988: disable 2.5G phy and enable at board
    layer
  arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro
  arm64: dts: mediatek: mt7988a-bpi-r4-pro: add PCIe overlays
  arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |   5 +
 arch/arm64/boot/dts/mediatek/Makefile         |   8 +
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |   1 +
 .../mt7988a-bananapi-bpi-r4-pro-4e.dts        |  16 +
 .../mt7988a-bananapi-bpi-r4-pro-8x.dts        |  16 +
 .../mt7988a-bananapi-bpi-r4-pro-cn15.dtso     |  20 +
 .../mt7988a-bananapi-bpi-r4-pro-cn18.dtso     |  20 +
 .../mt7988a-bananapi-bpi-r4-pro-emmc.dtso     |  33 ++
 .../mt7988a-bananapi-bpi-r4-pro-sd.dtso       |  31 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 534 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |   3 +-
 11 files changed, 686 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi

-- 
2.43.0


