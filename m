Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C921FC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0O+aeM9Kjz78WdCmadO6mlqFos6+3NDtyw6ECkVkrbU=; b=itp9FgR3WZmgN2Ze68/3trZa6+
	TJn6Uc1gmSy/BiQR2BQ0ekunwRwAa9BgmVuSAcL1zVZa/Bh4XmA8gGDzdnzQPF8MeXbN1bVCEW4Yu
	n/Ie7OtQR9nks9uprvcOUx8zQE7sLgYHzzcP888QqQ3Zd+AKbuclU0LRXJDuua9t0AvyrTZ6W312M
	akWm92jP3IH7BrrccLCsZVCnygE3MYOvut0+Sj6bzyhu4NuQ/ZENu0lEOf9UAqnEeIFJGNqyrcBHv
	faGGE4QEGbNTTNN8NM2fLFEDD1fqGn8tuNr888XiESIYHgPQF5tQLfIt9ETxeqNtyInzeqbp9EFYA
	4oSLy4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83y-0000000DHnp-1JKl;
	Fri, 28 Jun 2024 09:38:38 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83S-0000000DHQp-0lkx;
	Fri, 28 Jun 2024 09:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719567483;
	bh=u6OD6gmC5krqBgy7jiEofSLT/LbnesYe1OOVOF7H4MQ=;
	h=From:To:Cc:Subject:Date:From;
	b=j99N1G1bVuqvg+B2821CpKkzo6gxTqvyqfKqg990Sez7/mC5d7GSDizbVlJ30UJVh
	 aYSSEPPXmdHh3xP3x6GFIm46p/Keqt7AUboa9hB9J99assaUVIqzAZAcry0LLAo4xC
	 taWKdphL6LlztQC7V6LWWbTDwDlqRLu8fC9+kT6A7+IFso8VkRsKORpeO90Hu65pYY
	 nfvlswyPeFYMoyJiXTCuYN4b0/yOLUW76hpzKVEW9wIKTpmJY8lx7P35LIRBKoggUy
	 Hu2WAquOGL3ywLy+8RlwH2lyXBIUx2KlEYNtzz7AtOII0QFSdnp9Jxbq3rCvyU61w+
	 AsshGHK1EyVvg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AAF6F37821A8;
	Fri, 28 Jun 2024 09:38:02 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.11
Date: Fri, 28 Jun 2024 11:37:57 +0200
Message-ID: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023806_518800_B996B4E0 
X-CRM114-Status: GOOD (  20.07  )
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

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.11

for you to fetch changes up to d79603c2be61ca9d4fafa89ac7f5d8cc78568af4:

  arm64: dts: mediatek: Declare drive-strength numerically (2024-06-27 11:12:02 +0200)

----------------------------------------------------------------
MediaTek ARM64 DTS updates for v6.11

This introduces the new Airoha (MediaTek) EN7581 home networking
platform (routers) in early stages, but with support for its
Evaluation Board, a few more MediaTek based machines, and
improvements for existing ones.

For the MT7981 router SoC we get pinctrl support, along with the
enablement of its watchdog, eFuse/nvmem, I2C and integrated WiFi
controller, other than the introduction of new machines based on
this chip: the Cudy WR3000 V1 router and the OpenWRT One.

MT7986 gets a new machine: the BananaPi R3 Mini.

Some advancements have been done also on the MT7988 SoC, which
gains support for its I2C, PWM and USB XHCI controllers.

MediaTek Genio SoCs also get attention, with the introduction of a
basic device tree for the MT8390 Genio 700-EVK board, and for the
MT8395 Genio 1200 powered Kontron 3.5"-SBC-i1200.

Additionally, the Genio 1200 Radxa NIO12L board gets support for
USB Role Switching and proper PCI-Express controller PM suspend
and resume, other than finally enabling CPU and GPU frequency
and voltage scaling for improved efficiency.

Speaking of MediaTek Kompanio SoCs (Chromebooks) instead, thanks
to community interest and help in testing, there comes support for
the MT8195-powered HP Chromebook X360 13b-ca0002sa, while Google
contributed support for the MT8186-powered Acer Chromebook 311.

Moreover, MT8188 gets support for its integrated power domains,
other than its Global Command Engine (GCE) mailboxes, initial
basic support for the VDO0/1 blocks for multimedia, and its GPU
(ARM Mali G57-MC3, Valhall-JM) with Panfrost.

Besides that, this also adds a few other cleanups and improvements
for all machines using the MT8183, MT8192, MT8195/MT8395 SoCs and
adds generation of symbols on base devicetrees of machines using
Device Tree Overlay(s) (DTBO).

In particular:
 - The MediaTek Smart Voltage Scaling (SVS) is now fully working
   those SoCs, bringing further power efficiency improvements;
 - Thermal zones were refactored on MT8183 for consistency with
   the other MediaTek SoCs and for readability
 - Sound DAI links are now consistently specified in device tree
   on MT8195 and MT8186 machines
 - Newly supported machines/boards
   - EN7581: EVK
   - MT7981: Cudy WR3000 V1, OpenWRT One
   - MT7986: BananaPi R3 Mini
   - MT8186: Acer Chromebook 311 (Corsola Voltorb)
   - MT8195: HP Chromebook X360 13b-ca0002sa (Cherry Dojo)
   - MT8390/8188: Genio 700 EVK
 - Some cleanups for unused/legacy devicetree properties

----------------------------------------------------------------
AngeloGioacchino Del Regno (20):
      arm64: dts: mediatek: Complete chassis-type for MT8183 Chromebooks
      arm64: dts: mediatek: Add missing chassis-type to MT8192 Chromebooks
      dt-bindings: soc: mediatek: Add support for MT8188 VPPSYS
      arm64: dts: mediatek: mt8195: Fix GPU thermal zone name for SVS
      arm64: dts: mediatek: mt8192: Fix GPU thermal zone name for SVS
      arm64: dts: mediatek: mt8183: Refactor thermal zones
      arm64: dts: medaitek: mt8395-nio-12l: Set i2c6 pins to bias-disable
      arm64: dts: mediatek: mt8395-nio-12l: Define RSEL in microamperes
      arm64: dts: mediatek: mt8395-nio-12l: Enable PHYs and USB role switch
      arm64: dts: mediatek: mt8395-nio-12l: Add power supplies for CPU/GPU scaling
      arm64: dts: mediatek: mt8195-cherry: Specify sound DAI links and routing
      arm64: dts: mediatek: mt8186-corsola: Specify sound DAI links and routing
      dt-bindings: arm: mediatek: Add MT8195 HP Chromebook x360 13b-ca0002sa
      arm64: mediatek: mt8195-cherry: Introduce the MT8195 Dojo Chromebook
      arm64: dts: mediatek: mt8188: Add Global Command Engine mailboxes
      arm64: dts: mediatek: mt8188: Add VDOSYS0/1 support for multimedia
      arm64: dts: mediatek: mt8188: Add support for SoC power domains
      arm64: dts: mediatek: mt8188: Add support for Mali GPU on Panfrost
      arm64: dts: mediatek: Makefile: Generate symbols for DTBO support
      arm64: dts: mediatek: Declare drive-strength numerically

Chen-Yu Tsai (6):
      arm64: dts: mediatek: mt8183-kukui: Drop bogus output-enable property
      arm64: dts: mediatek: Drop mediatek,drive-strength-adv usage
      arm64: dts: mediatek: mt8183-pico6: Fix wake-on-X event node names
      arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add ports node for anx7625
      dt-bindings: arm: mediatek: Add MT8186 Voltorb Chromebooks
      arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks

Daniel Danzberger (1):
      arm64: dts: Add Airoha EN7581 SoC and EN7581 Evaluation Board

Frank Wunderlich (3):
      dt-bindings: arm64: mediatek: add BananaPi R3 Mini
      arm64: dts: mediatek: Add mt7986 based Bananapi R3 Mini
      arm64: dts: mt7622: fix switch probe on bananapi-r64

Geert Uytterhoeven (1):
      arm64: dts: mediatek: mt7986a: bpi-r3: Convert to sugar syntax

Hsin-Te Yuan (1):
      arm64: dts: mediatek: mt8183-kukui: Fix the value of `dlg,jack-det-rate` mismatch

Krzysztof Kozlowski (3):
      arm64: dts: mediatek: mt8365: drop incorrect power-domain-cells
      arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
      arm64: dts: mediatek: mt8173-elm: drop PMIC's syscon node

Lorenzo Bianconi (1):
      dt-bindings: arm64: dts: airoha: Add en7581 entry

Macpaul Lin (3):
      dt-bindings: arm64: mediatek: add mt8390-evk board
      arm64: dts: mediatek: add device-tree for Genio 700 EVK board
      arm64: dts: mediatek: mt8395-genio-1200-evk: add u3port1 for xhci1

Michael Walle (2):
      dt-bindings: arm64: mediatek: add Kontron 3.5"-SBC-i1200
      arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200

Pin-yen Lin (2):
      arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us for pp3300_mipibrdg
      arm64: dts: mt8173: Add G2Touch touchscreen node

Rafał Miłecki (15):
      dt-bindings: vendor-prefixes: add Cudy
      dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
      arm64: dts: mediatek: mt7981: add pinctrl
      arm64: dts: mediatek: Add Cudy WR3000 V1
      arm64: dts: mediatek: mt7988: add XHCI controllers
      arm64: dts: mediatek: mt7981: add watchdog & WiFi controllers
      arm64: dts: mediatek: mt7981: fix code alignment for PWM clocks
      arm64: dts: mediatek: mt7981: add efuse block
      dt-bindings: vendor-prefixes: add OpenWrt
      dt-bindings: arm64: dts: mediatek: Add OpenWrt One
      arm64: dts: mediatek: Add OpenWrt One
      arm64: dts: mediatek: mt7988: add PWM controller
      arm64: dts: mediatek: mt7988: add I2C controllers
      arm64: dts: mediatek: mt7622: fix "emmc" pinctrl mux
      arm64: dts: mediatek: mt7981: add I2C controller

 Documentation/devicetree/bindings/arm/airoha.yaml                   |    4 +
 Documentation/devicetree/bindings/arm/mediatek.yaml                 |   24 ++
 Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml  |    1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml              |    4 +
 arch/arm64/boot/dts/Makefile                                        |    1 +
 arch/arm64/boot/dts/airoha/Makefile                                 |    2 +
 arch/arm64/boot/dts/airoha/en7581-evb.dts                           |   26 ++
 arch/arm64/boot/dts/airoha/en7581.dtsi                              |  154 +++++++++
 arch/arm64/boot/dts/mediatek/Makefile                               |   12 +
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts                         |    4 +-
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts              |    8 +-
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts            |    8 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts                        |    4 +-
 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts             |   74 +++++
 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts                |   15 +
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi                           |   78 ++++-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso      |   28 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts       |  493 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso      |   74 +++--
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso       |   90 +++---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso        |   16 +-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                           |   90 +++++-
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi                   |    9 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi                        |    6 -
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts                         |   12 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts                         |    6 -
 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi         |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts      |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts   |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts   |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts         |   14 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi              |   25 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts          |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                      |   18 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts                     |   10 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                            |  136 ++++++--
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts   |   13 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts   |   25 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi            |  103 ++++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                    |   42 ++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                            |  480 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts           |    1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts      |    1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                    |    1 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi                            |    2 +-
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts              |  114 +++++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                     |   50 +++
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts                        |   26 +-
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts                         |    4 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                            |    2 +-
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts                         |    4 +-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi                            |    3 +-
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts               |  880 +++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts              |   34 +-
 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts       | 1127 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts               |   88 +++++-
 67 files changed, 4198 insertions(+), 267 deletions(-)
 create mode 100644 arch/arm64/boot/dts/airoha/Makefile
 create mode 100644 arch/arm64/boot/dts/airoha/en7581-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/en7581.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts


