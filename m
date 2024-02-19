Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50A3C48BF8
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+eSPpfGlwXyWalRDsSpTEwa9MX6+7C6fVWH8uuDIaes=; b=gi9pXHPhEskaEvg0UJdsq4yDGs
	XnkxpO8h5Np0cT/6IuJxnXSpzGyOb/z+KWyq811jncI+8qEaPf2Fwkr2VQqdyPb7E7n6M50X0T+kS
	7O8QYlQBfAveQhBiWlUjGcQSrnOLy1dY5HxQdNTA7H6ydcgJXBLlAwcQPYvYIzqgoEYMB5Yf90KMC
	arbAUp5QByqAjQzQPLHtJSJBQKOzbR50uvP7f4JsvLk5qhhspdMFPIQkteYS3tDVskhE2bqmedO7q
	Eco5Gf6Qf0TK7FDRCHbo53EbNwtCG3Y+DUh4i6IJqMfSJlcfGn3gLUCSqZguJyZA41oSQmr+DBpHO
	xvnS+Vag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3Rp-0000000AZvf-1wik;
	Mon, 19 Feb 2024 13:12:41 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3Rk-0000000AZtu-3J8c;
	Mon, 19 Feb 2024 13:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708348355;
	bh=Z3j3MYfDfaYZ+6bnOqQf9P1k31aixEwrgoJ74rNBZes=;
	h=From:To:Cc:Subject:Date:From;
	b=VLYkKuJRt8iLG8IMjha1zTnIqJt7nLGSxDnwaXE6xJZ2WhBY8jsdO33O7xmtszgyJ
	 jApIk/q4PsUD3J54B9E2OSCI7BWNaKi6AsDsjSNWBB8Ao3HjyvHEn4xetJ7+yVQWjH
	 RVUzQ4jKkbxThhcwE/XK50bEmyIeiyW4tRenU8BheDwLYA0aLUST92/QBKtKDF9hFi
	 G4p9r7MAyigMTEc16mCNgPwze+jx2Lova0iBGvykJ2wOs00vi4IRoVgE1G0sSRb083
	 dLhkbEN589dnl00BvQbPCKmx5MQftzpdsBaJuEgmZQhdY1f+dJFKHWp0B5axO6aZvO
	 Zqv40AMDyeQuA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CD3F837820C1;
	Mon, 19 Feb 2024 13:12:34 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v6.9
Date: Mon, 19 Feb 2024 14:12:25 +0100
Message-ID: <20240219131230.157792-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_051237_144057_B6E99E12 
X-CRM114-Status: GOOD (  12.81  )
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

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.9

for you to fetch changes up to ef569d5db50e7edd709e482157769a5b3c367e22:

  arm64: dts: mt8195-cherry-tomato: change watchdog reset boot flow (2024-02-19 13:35:24 +0100)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates for v6.9

This adds support for the following new machines:
 - MT7981B: Xiaomi AX3000T
 - MT7986A: Acelink EW-7886CAX
 - MT7988A: BananaPi BPI-R4
 - MT8186 Chromebooks: Tentacruel, Tentacool, Steelix, Rusty, Magneton
 - MT8395/MT8195: Radxa NIO 12L

Also adds more support for the MediaTek MT8186 SoC's Video and JPEG
encoders and for MT7988 clocks, enables wakeup support for the CrOS
EC on SPI in all MediaTek Chromebooks, performs some cleanups and
includes some spare fixes.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: mediatek: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties

Allen-KH Cheng (1):
      arm64: dts: mediatek: mt8186: Add jpgenc node

AngeloGioacchino Del Regno (3):
      arm64: dts: mediatek: mt8195: Add MTU3 nodes and correctly describe USB
      dt-bindings: arm64: mediatek: Add MT8395 Radxa NIO 12L board compatible
      arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board

Arınç ÜNAL (2):
      arm64: dts: mt7622: add port@5 as CPU port
      arm64: dts: mt7986: add port@5 as CPU port

Chen-Yu Tsai (9):
      dt-bindings: arm: mediatek: Sort entries by SoC then board compatibles
      dt-bindings: arm: mediatek: Add MT8186 Tentacruel / Tentacool Chromebooks
      dt-bindings: arm: mediatek: Add MT8186 Steelix Chromebook
      dt-bindings: arm: mediatek: Add MT8186 Rusty Chromebook
      dt-bindings: arm: mediatek: Add MT8186 Magneton Chromebooks
      arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool
      arm64: dts: mediatek: Introduce MT8186 Steelix
      arm64: dts: mediatek: Add MT8186 Steelix platform based Rusty
      arm64: dts: mediatek: Add MT8186 Magneton Chromebooks

Eugen Hristev (5):
      dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
      arm64: dts: mediatek: mt8192: fix vencoder clock name
      dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
      arm64: dts: mediatek: mt8186: fix VENC power domain clocks
      dt-bindings: media: mediatek-jpeg-encoder: change max iommus count

Hsin-Te Yuan (1):
      arm64: dts: mt8195-cherry-tomato: change watchdog reset boot flow

Krzysztof Kozlowski (1):
      arm64: dts: mediatek: replace underscores in node names

Kyrie Wu (1):
      arm64: dts: mediatek: mt8186: Add venc node

Mark Hasemeyer (4):
      arm64: dts: mediatek: mt8173: Enable cros-ec-spi as wake source
      arm64: dts: mediatek: mt8183: Enable cros-ec-spi as wake source
      arm64: dts: mediatek: mt8192: Enable cros-ec-spi as wake source
      arm64: dts: mediatek: mt8195: Enable cros-ec-spi as wake source

Nícolas F. R. A. Prado (4):
      arm64: dts: mt8183: Move CrosEC base detection node to kukui-based DTs
      arm64: dts: mediatek: mt8192-asurada: Remove CrosEC base detection node
      arm64: dts: mediatek: mt8186: Add missing clocks to ssusb power domains
      arm64: dts: mediatek: mt8186: Add missing xhci clock to usb controllers

Rafał Miłecki (17):
      arm64: dts: mediatek: mt7986: fix reference to PWM in fan node
      arm64: dts: mediatek: mt7986: drop crypto's unneeded/invalid clock name
      arm64: dts: mediatek: mt7986: fix SPI bus width properties
      arm64: dts: mediatek: mt7986: fix SPI nodename
      arm64: dts: mediatek: mt7986: drop "#clock-cells" from PWM
      arm64: dts: mediatek: mt7986: add "#reset-cells" to infracfg
      dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi AX3000T
      arm64: dts: mediatek: Add initial MT7981B and Xiaomi AX3000T
      dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4
      arm64: dts: mediatek: Add initial MT7988A and BPI-R4
      arm64: dts: mediatek: mt7988: add clock controllers
      dt-bindings: vendor-prefixes: add acelink
      dt-bindings: arm64: dts: mediatek: Add Acelink EW-7886CAX access point
      arm64: dts: mediatek: Add Acelink EW-7886CAX
      arm64: dts: mediatek: mt7986: reorder properties
      arm64: dts: mediatek: mt7986: reorder nodes
      arm64: dts: mediatek: mt7622: add missing "device_type" to memory nodes

William-tw Lin (1):
      arm64: dts: mediatek: Add socinfo efuses to MT8173/83/96/92/95 SoCs

Yunfei Dong (1):
      arm64: dts: mediatek: mt8186: Add video decoder device nodes

 Documentation/devicetree/bindings/arm/mediatek.yaml                  |  198 ++++--
 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml |   31 +-
 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml   |    3 +-
 Documentation/devicetree/bindings/vendor-prefixes.yaml               |    2 +
 arch/arm64/boot/dts/mediatek/Makefile                                |   14 +
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts                          |    4 +-
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi                            |    2 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi                             |    8 +-
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts             |   13 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts                         |   25 +
 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts              |   15 +
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi                            |  105 ++++
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts          |  173 ++++++
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso       |    2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts             |    2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts                         |   31 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi                            |  180 +++---
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts                         |   31 +-
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts             |   11 +
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                            |  136 ++++
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts                |    2 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi                         |    3 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts                          |    2 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                             |   19 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi                |    4 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi                |    4 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi                 |    4 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                       |    5 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts                      |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                             |   11 +-
 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi              |  129 ++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts   |   39 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts   |   39 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts   |   26 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts      |   26 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dts    |   18 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dts    |   18 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi             |  199 ++++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dts  |   57 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts  |   24 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts |   44 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts |   26 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                     | 1681 ++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi                             |   93 ++-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                     |    5 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi                             |   10 +-
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts             |    4 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts             |    4 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts             |    4 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                      |   27 +-
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts                         |   18 +-
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts                          |   12 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                             |  128 ++--
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts               |   17 +-
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts                |  825 +++++++++++++++++++++++++
 55 files changed, 4247 insertions(+), 268 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts

