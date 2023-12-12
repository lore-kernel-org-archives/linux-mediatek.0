Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8743EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 11:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/EPOtYMukpIQ5yOhGhkbmHBOXS7weIlR1o1FivYyejE=; b=Do9BFF1oWyexy608uIwFft2osH
	JmQYXv8imspa9voYuRm83LmT0thy1qW4U9T7yVVQz8YUvr18gplTTF/MQG3CnqHd710FW9dN4OTze
	JIhQXOaC3NdkP26/Y1RrqvvvXCGxTVruLm3K1GU14F6xsaln5km8R3poCUVMXyd42g74Ok+qDd3nC
	h/FWGrcRTwXA8QNP1PNOQoDYCpbZFjT0sgmlyFPyW1ow8SISSjRYurprjJwQyPyWZpDI5nMB6oDcZ
	z3KlIiw/IB1ZryjznTpPJImWoCX87D64HCqyu5TlKaPimwgE1XG3uDE7hlBU44XN/EnNa5sIG3dJQ
	inPHDgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1DO-00BZb4-0O;
	Tue, 12 Dec 2023 11:46:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1DA-00BZWI-2q;
	Tue, 12 Dec 2023 11:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702381560;
	bh=jgxq3nR7J9ZDTvGII2mJPA1sl4hRjCbR5YlqjGTyrks=;
	h=From:To:Cc:Subject:Date:From;
	b=JU2xN4BAbwpfFKlVK5a7D4DdncLWw0+ebycwhkTrIGiz2M+HuzpawHq9Qnh5Cewx3
	 ajyzmlKnS/xRBmhBMSnZ5ixKWW7G116qQUjshCe6WpIUhdWXAKtcWNpwWa8M28ugdF
	 2MOUFe87e8147wtUH3DZs2lMw9tLX91EzoT120L7oFu4rsALieBIxk1FJSkviXCAmQ
	 Gg3MKhNLtmG58nNhJoYi7hPMTgLkwoJkpZfl8Z8HOgdURHjib+2C4VVkwn//1AKLPf
	 SSjNAG9I6bE3uhvehW3ZzRmGZk1ZLLrzRF0Uyeg/i925dnvROs4lQ8BkvyshUKRs5S
	 ZmrZP90APHzOw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 057B83781448;
	Tue, 12 Dec 2023 11:45:59 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v6.8
Date: Tue, 12 Dec 2023 12:44:27 +0100
Message-ID: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_034605_174301_280735BE 
X-CRM114-Status: GOOD (  13.96  )
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

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.8

for you to fetch changes up to 5dc289e08a4d0704583d8df70181cbeb47c817d9:

  arm64: dts: mediatek: mt8192: Add Smart Voltage Scaling node (2023-12-11 11:31:54 +0100)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates for v6.8

This adds devicetree bindings and nodes for:
 - Media Data Path 3 (MDP3) bindings and enablement on MT8195
 - Smart Voltage Scaling (SVS) on MT8195
 - LVTS SoC thermal on MT8192
 - MT8188 SoC along with its resets, display bindings, and more
 - MT8183 hardware video decoder (mtk-vcodec-dec)

Adds the following new machines:
 - MT8188 Evaluation Board (EVB)
 - MT8183 Chromebooks: Kukui-Katsu, Jacuzzi-Makomo, Pico, Pico6

Performs cleanups for various MediaTek SoCs and PMICs, and also
includes some spare fixes.

----------------------------------------------------------------
AngeloGioacchino Del Regno (11):
      arm64: dts: mediatek: cherry: Add platform thermal configuration
      arm64: dts: mediatek: mt8183: Use interrupts-extended where possible
      arm64: dts: mediatek: mt8173: Use interrupts-extended where possible
      arm64: dts: mediatek: Use interrupts-extended where possible
      arm64: dts: mediatek: Move MT6358 PMIC interrupts to MT8183 boards
      arm64: dts: mediatek: mt8195-cherry: Add MFG0 domain supply
      arm64: dts: mediatek: mt8195-cherry: Assign sram supply to MFG1 pd
      media: dt-bindings: mediatek: Add phandle to mediatek,scp on MDP3 RDMA
      arm64: dts: mediatek: mt8183: Change iospaces for thermal and svs
      arm64: dts: mediatek: mt8195: Add SVS node and reduce LVTS_AP iospace
      arm64: dts: mediatek: mt8192: Add Smart Voltage Scaling node

Balsam CHIHI (1):
      arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones

Chen-Yu Tsai (4):
      arm64: dts: mediatek: mt6358: Merge ldo_vcn33_* regulators
      arm64: dts: mt8183: kukui-jacuzzi: Drop bogus anx7625 panel_flag property
      arm64: dts: mt6358: Drop bogus "regulator-fixed" compatible properties
      arm64: dts: mediatek: mt8186: Fix alias prefix for ovl_2l0

Eugen Hristev (2):
      dt-bindings: arm: mediatek: convert audsys and mt2701-afe-pcm to yaml
      arm64: dts: mediatek: mt8186: fix address warning for ADSP mailboxes

Hsiao Chien Sung (6):
      dt-bindings: display: mediatek: ethdr: Add compatible for MT8188
      dt-bindings: display: mediatek: mdp-rdma: Add compatible for MT8188
      dt-bindings: display: mediatek: merge: Add compatible for MT8188
      dt-bindings: display: mediatek: padding: Add MT8188
      dt-bindings: arm: mediatek: Add compatible for MT8188
      dt-bindings: reset: mt8188: Add VDOSYS reset control bits

Hsin-Yi Wang (6):
      dt-bindings: arm64: mediatek: Add mt8183-kukui-katsu
      arm64: dts: mt8183: Add kukui katsu board
      dt-bindings: arm64: mediatek: Add mt8183-kukui-jacuzzi-makomo
      arm64: dts: mt8183: Add jacuzzi makomo board
      dt-bindings: arm64: mediatek: Add mt8183-kukui-jacuzzi-pico
      arm64: dts: mt8183: Add jacuzzi pico/pico6 board

Mark Tseng (1):
      dt-bindings: soc: mediatek: add mt8186 and mt8195 svs dt-bindings

Michael Walle (2):
      dt-bindings: display: mediatek: dsi: add compatible for MediaTek MT8195
      arm64: dts: mediatek: mt8195: add DSI and MIPI DPHY nodes

Moudy Ho (19):
      dt-bindings: media: mediatek: mdp3: correct RDMA and WROT node with generic names
      dt-bindings: media: mediatek: mdp3: merge the indentical RDMA under display
      dt-bindings: media: mediatek: mdp3: add config for MT8195 RDMA
      dt-bindings: media: mediatek: mdp3: add compatible for MT8195 RSZ
      dt-bindings: media: mediatek: mdp3: add compatible for MT8195 WROT
      dt-bindings: media: mediatek: mdp3: add component FG for MT8195
      dt-bindings: media: mediatek: mdp3: add component HDR for MT8195
      dt-bindings: media: mediatek: mdp3: add component STITCH for MT8195
      dt-bindings: media: mediatek: mdp3: add component TCC for MT8195
      dt-bindings: media: mediatek: mdp3: add component TDSHP for MT8195
      dt-bindings: display: mediatek: aal: add compatible for MT8195
      dt-bindings: display: mediatek: color: add compatible for MT8195
      dt-bindings: display: mediatek: merge: add compatible for MT8195
      dt-bindings: display: mediatek: ovl: add compatible for MT8195
      dt-bindings: display: mediatek: split: add compatible for MT8195
      dt-bindings: display: mediatek: padding: add compatible for MT8195
      arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
      arm64: dts: mediatek: mt8195: revise VDOSYS RDMA node name
      arm64: dts: mediatek: mt8195: add MDP3 nodes

Nícolas F. R. A. Prado (1):
      arm64: dts: mediatek: mt8173: Drop VDEC_SYS reg from decoder

Rafał Miłecki (1):
      dt-bindings: thermal: convert Mediatek Thermal to the json-schema

Yunfei Dong (1):
      arm64: dts: mediatek: mt8183: Add decoder

jason-ch chen (4):
      dt-bindings: arm: Add compatible for MediaTek MT8188
      dt-bindings: arm: mediatek: Add mt8188 pericfg compatible
      dt-bindings: soc: mediatek: pwrap: Modify compatible for MT8188
      arm64: dts: Add MediaTek MT8188 dts and evaluation board and Makefile

yu-chang.lee (1):
      dt-bindings: arm: mediatek: mmsys: Add VPPSYS compatible for MT8188

 Documentation/devicetree/bindings/arm/mediatek.yaml                       |  25 ++
 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt        |  39 ---
 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml       | 153 +++++++++
 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |   3 +
 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml      |   1 +
 Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml        |   2 -
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml      |   1 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml    |   1 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml      |   4 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml    |   6 +-
 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml |  88 -----
 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml    |   4 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml      |   1 +
 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml  |  83 +++++
 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml    |  27 ++
 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml             |  61 ++++
 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml            |  61 ++++
 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml           | 104 +++++-
 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml            |   6 +-
 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml         |  61 ++++
 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml            |  62 ++++
 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml          |  61 ++++
 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml           |  29 +-
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml        |   6 +-
 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml               |   2 +
 Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml        | 116 +++++++
 Documentation/devicetree/bindings/sound/mt2701-afe-pcm.txt                | 146 ---------
 Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml           |  99 ++++++
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt            |  52 ---
 arch/arm64/boot/dts/mediatek/Makefile                                     |   7 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi                                  |  26 +-
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts                  |   3 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts                  |   3 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi                         |   9 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi                              |  24 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts                               |   3 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                                  |   8 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts                               |   4 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi               |   3 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi             |   3 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts                |   3 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts         |   3 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts         |   3 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts         |   3 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts         |  24 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts         |  24 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts                |  35 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts               | 110 +++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi                    |   1 -
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts                |  18 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dts                      |  18 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi                     |  15 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts                 |  36 +++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts                 |  40 +++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi                     |   3 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi                      |   3 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                            |  10 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts                           |   4 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                                  |  62 +++-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi                                  |   6 +-
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts                               | 387 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                                  | 956 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi                                  | 466 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                           | 115 ++++++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                                  | 483 +++++++++++++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts                    |   6 +-
 include/dt-bindings/reset/mt8188-resets.h                                 |  75 +++++
 67 files changed, 3826 insertions(+), 480 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt2701-afe-pcm.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
 delete mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.dtsi


