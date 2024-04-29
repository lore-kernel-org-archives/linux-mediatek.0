Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63BCC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 14:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ocFabipTBG4oXHbfxXvrfJfVuUJ+Grr9xgYqutnvFxw=; b=gOzeEzIlHuU971EK+xZi4ovwzz
	zfZccJl76aP/hh6v5Oi8RehsE3sq62+c+rDjDRAcbj2a0akGZFlpZMdQ21PfClpgtXAeZF+wymJnW
	fN/KP41JTCqfBWNTW/K6fdXh2qvLV8pWvI9hRhsWS0Iy+CpgHyN9OB1x/7h8Y6HzVwZuGs8kvtVaB
	0JHNNMJFNhRxqC9a0tGJIHIUgtYg7ksjHcX5DW0R7CO5ANBMoUB/11U8sBqgE0RqO3/7Ptg3jbvCU
	UyMZmrCi6ZHTBfpYtm7+UxnLEWXUOtcvpuJPchHkKNrvpAcYoMzYJthXWFhBdJd1lhM4r9ngfhiO8
	2XoMSV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RbC-000000032sM-27ML;
	Mon, 29 Apr 2024 14:03:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Rak-000000032df-3Dw5;
	Mon, 29 Apr 2024 14:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714399367;
	bh=HgtKVM/TierHAv//0s/r7QfRlk07MtY0ehnomTV6vxU=;
	h=From:To:Cc:Subject:Date:From;
	b=kEw1H8oWk3+bJvmYPLqoKHvHjsRrJbB350iGiuQw9UcZBwB8u26yAVxLKc+Rkyv8/
	 qBKV/UirKWZrv6vOoPyVFk+eDezfL8T5OEhM5DeyFlE4H0HY2I+1wJl5O8uUV+XWZM
	 4G54KeqygPR+hStuqyYlcG169EcR7Y4982BYGl+XThpkCMXlFN8EN7rZLnMDvklKC3
	 0MqcVSfoHoDoZXR9PRO8gWMiPGCZB8Xbb5/vxVwOQ5GI1nrCtGEf35zTuC4/S1KbZj
	 f90jPswUbEva8t6JAHcViXT+Sgxa86qHZQMpvRTlFWviodV5YTpCTlyK9AiWjX2yXw
	 0+vJR7vn7JXAQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 863B33780BFE;
	Mon, 29 Apr 2024 14:02:47 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.10
Date: Mon, 29 Apr 2024 16:02:42 +0200
Message-ID: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_070251_083881_94846CB8 
X-CRM114-Status: GOOD (  17.58  )
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

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-for-v6.10

for you to fetch changes up to d3dbc472ac662a1ebba5064b44bc3a24e91b412a:

  arm64: dts: mediatek: mt8188: add lvts definitions (2024-04-23 11:16:44 +0200)

----------------------------------------------------------------
MediaTek ARM64 DTS updates for v6.10

This introduces the new Airoha (MediaTek) EN7581 home networking
platform (routers) in early stages, but with support for its
Evaluation Board, a few more MediaTek based machines, and
improvements for existing ones.

For the MT7981 router SoC we get pinctrl support, along with the
enablement of its watchdog and integrated WiFi controller, other
than the introduction of a new machine based on this chip: the
Cudy WR3000 V1 router.

Some advancements have been done also on the MT7988 SoC, which
gains support for its USB XHCI controllers.

MediaTek Genio SoCs also get attention, with the introduction of a
basic device tree for the MT8390 Genio 700-EVK board, and for the
MT8395 Genio 1200 powered Kontron 3.5"-SBC-i1200.

Additionally, the Genio 1200 Radxa NIO12L board gets support for
USB Role Switching and proper PCI-Express controller PM suspend
and resume, other than finally enabling CPU and GPU frequency
and voltage scaling for improved efficiency.

Speaking of MediaTek Kompanio SoCs (Chromebooks) instead, thanks
to community interest and help in testing, there comes support for
the MT8195-powered HP Chromebook X360 13b-ca0002sa;

Besides that, this also adds a few other cleanups and improvements
for all machines using the MT8183, MT8192, MT8195/MT8395 SoCs.

In particular:
 - The MediaTek Smart Voltage Scaling (SVS) is now fully working
   those SoCs, bringing further power efficiency improvements;
 - Thermal zones were refactored on MT8183 for consistency with
   the other MediaTek SoCs and for readability
 - MT8186 and MT8188 get an initial node for the LVTS Thermal
   Controller (SoC-internal temperatures)
 - Sound DAI links are now consistently specified in device tree
   on MT8195 and MT8186 machines
 - Some cleanups for unused/legacy devicetree properties

----------------------------------------------------------------
AngeloGioacchino Del Regno (14):
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

Chen-Yu Tsai (3):
      arm64: dts: mediatek: mt8183-kukui: Drop bogus output-enable property
      arm64: dts: mediatek: Drop mediatek,drive-strength-adv usage
      arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node

Daniel Danzberger (3):
      arm64: dts: Add Airoha EN7581 SoC and EN7581 Evaluation Board
      arm64: add Airoha EN7581 platform
      arm64: defconfig: enable Airoha platform

Lorenzo Bianconi (2):
      dt-bindings: arm64: dts: airoha: Add en7581 entry
      arm64: dts: airoha: Add EN7581 clock node

Macpaul Lin (3):
      dt-bindings: arm64: mediatek: add mt8390-evk board
      arm64: dts: mediatek: add device-tree for Genio 700 EVK board
      arm64: dts: mediatek: mt8395-genio-1200-evk: add u3port1 for xhci1

Michael Walle (2):
      dt-bindings: arm64: mediatek: add Kontron 3.5"-SBC-i1200
      arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200

Nicolas Pitre (2):
      arm64: dts: mediatek: mt8186: add lvts definitions
      arm64: dts: mediatek: mt8188: add lvts definitions

Rafał Miłecki (6):
      dt-bindings: vendor-prefixes: add Cudy
      dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
      arm64: dts: mediatek: mt7981: add pinctrl
      arm64: dts: mediatek: Add Cudy WR3000 V1
      arm64: dts: mediatek: mt7988: add XHCI controllers
      arm64: dts: mediatek: mt7981: add watchdog & WiFi controllers

 Documentation/devicetree/bindings/arm/airoha.yaml                   |    4 +
 Documentation/devicetree/bindings/arm/mediatek.yaml                 |   15 +
 Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml  |    1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml              |    2 +
 arch/arm64/Kconfig.platforms                                        |    7 +
 arch/arm64/boot/dts/Makefile                                        |    1 +
 arch/arm64/boot/dts/airoha/Makefile                                 |    2 +
 arch/arm64/boot/dts/airoha/en7581-evb.dts                           |   26 ++
 arch/arm64/boot/dts/airoha/en7581.dtsi                              |  163 ++++++++
 arch/arm64/boot/dts/mediatek/Makefile                               |    4 +
 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts             |   74 ++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi                           |   48 ++-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                           |   32 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts                         |    6 -
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts      |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts         |    3 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts   |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts          |    1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                      |    8 -
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts                     |    6 -
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                            |  136 +++++--
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                    |   42 ++-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi                            |   19 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                            |   35 ++
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts           |    1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts      |    1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts         |    1 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi                            |    2 +-
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts              |  114 ++++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                     |   50 +++
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts                         |    4 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                            |    2 +-
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts               |  880 +++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts              |    6 +
 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts       | 1127 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts               |   88 ++++-
 arch/arm64/configs/defconfig                                        |    1 +
 46 files changed, 2853 insertions(+), 70 deletions(-)
 create mode 100644 arch/arm64/boot/dts/airoha/Makefile
 create mode 100644 arch/arm64/boot/dts/airoha/en7581-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/en7581.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts


