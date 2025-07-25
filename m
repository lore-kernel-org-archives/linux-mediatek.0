Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB9AC87FCC
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VV8AhuGkl1rJHudPDgzh58hRBQcriHGYSdn0N2V/ckA=; b=R6dHGH9Z/GJIC3AqRor3Cr8qWw
	0uRdaG8ICmc4vek9OH8l8810jd5jSw9LJfmC6qiUabrMfX+5rUJ8H6cH/HmtHhD0iF9dz2oqNf4+O
	fdpaulaPlZuA4S0g7KSimTckkVRBNrP4wYaFB5lKXhFDKLaE3XZweCZqreOXydEWVdWYZW2RnZVSm
	1zQ8es0ZYJgFdHW7vdunCFP7ac5D5m8wEspYXPlFf2fBLxkHjouDntCcFQBJ1Jkm5nSLaUH8lHo4x
	/WVYTYtDiHoCSEB92Aimx1BCmR/0AEJVI4q873KqRmXnOs1cU8V+KCs61akj2o8Fj5GEHlNhKO30H
	zlnbycwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf933-00000008y30-1fCx;
	Fri, 25 Jul 2025 03:24:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8y1-00000008xVD-2z2j;
	Fri, 25 Jul 2025 03:19:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0910A466DA;
	Fri, 25 Jul 2025 03:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA661C4CEF1;
	Fri, 25 Jul 2025 03:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753413568;
	bh=0KiFC8fwEUOu3JvvhwPCsV2fW+CJ2VM2NDno0CyQEeI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RDkK4YiLJ2iFFBHK5wf2cHj2RxA+t+fxQys+SaL/PTj9HvRgelM5CUJlPs2VzzTKR
	 6ukreCa7eKYG6jnzW4OA9FLqDyR0vQEqa4Fu5OoZGU3d+A1r05xE8xMUt0MQl8WaE/
	 LQmBPOtu4mJgQgbUXcAOcQ3usfuF4L7qC3my2zoHOip/7uzKFJbkir2pGpcmjlnZEF
	 tKgT2j1v+0OtPaYnbN/XBMjF5mEHuNTO95tzcPAHkJMESq0wnicADiPYitW6U+Jisu
	 qCm9CxBrqPNwuFuwrH6LlYeL2CbvQKt/jazszvNuYEOkt3Az3f9RIIGR5XmnufO6eL
	 8FGnKugOHyUIg==
Date: Thu, 24 Jul 2025 22:19:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
Message-Id: <175341328431.3754787.18018620819896424784.robh@kernel.org>
Subject: Re: [PATCH 00/38] MediaTek devicetree/bindings warnings
 sanitization
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_201929_830296_6E7B2264 
X-CRM114-Status: GOOD (  19.79  )
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
Cc: jassisinghbrar@gmail.com, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, simona@ffwll.ch, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, fparent@baylibre.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, kishon@kernel.org, herbert@gondor.apana.org.au, daniel.lezcano@linaro.org, linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, tzimmermann@suse.de, arnd@arndb.de, sam.shih@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, linux-sound@vger.kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, mathieu.poirier@linaro.org, shane.chien@mediatek.com, andersson@kernel.org, sean.wang@kernel.org, maarten.lankhorst@linux.intel.com, lgirdwood@gmail.com, houlong.wei@mediatek.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, p.zabel@pengutronix.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:36 +0200, AngeloGioacchino Del Regno wrote:
> As Rob pointed out, MediaTek devicetrees are *poor* in the dtbs_check
> tests, and got an infinite load of warnings.
> 
> This series starts attacking this situation.
> 
> I didn't really count how many warnings I have resolved - it's a lot
> of them anyway - and I think that this is a good start in any case.
> 
> More will come, but I'll be on a long holiday soon, so not from me
> (or anyway not before I come back anyway), but most probably from
> someone else (in August...!).
> 
> Cheers!
> Angelo
> 
> AngeloGioacchino Del Regno (38):
>   dt-bindings: display: mediatek: dpi: Allow specifying resets
>   dt-bindings: display: mediatek,dp: Allow DisplayPort AUX bus
>   dt-bindings: mailbox: mediatek,gce-mailbox: Make clock-names optional
>   ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
>   dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
>   dt-bindings: timer: mediatek: Add compatible for MT6795 GP Timer
>   dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing pwm_ch7_2
>   dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing base reg
>   dt-bindings: pinctrl: mt6779: Allow common MediaTek pinctrl node names
>   dt-bindings: regulator: mediatek,mt6332-regulator: Add missing
>     compatible
>   dt-bindings: regulator: mediatek,mt6331: Fix various regulator names
>   dt-bindings: regulator: mediatek,mt6331: Add missing compatible
>   dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO from MT8188 dual
>   dt-bindings: media: mediatek,mt8195-jpeg: Allow range number in node
>     address
>   dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195
>   arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node
>     names
>   arm64: dts: mediatek: mt6797: Fix pinctrl node names
>   arm64: dts: mediatek: mt6797: Remove bogus id property in i2c nodes
>   arm64: dts: mediatek: mt6795: Add mediatek,infracfg to iommu node
>   arm64: dts: mediatek: mt6795-xperia-m5: Fix mmc0 latch-ck value
>   arm64: dts: mediatek: mt6795-sony-xperia-m5: Add pinctrl for mmc1/mmc2
>   arm64: dts: mediatek: Fix node name for SYSIRQ controller on all SoCs
>   arm64: dts: mediatek: mt7986a: Fix PCI-Express T-PHY node address
>   arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C node names
>   arm64: dts: mediatek: mt7986a-bpi-r3: Set interrupt-parent to mdio
>     switch
>   arm64: dts: mediatek: acelink-ew-7886cax: Remove unnecessary cells in
>     spi-nand
>   arm64: dts: mediatek: mt7988a: Fix PCI-Express T-PHY node address
>   arm64: dts: mediatek: mt8173: Fix pinctrl node names and cleanup
>   arm64: dts: mediatek: mt8183: Fix pinctrl node names
>   arm64: dts: mediatek: pumpkin-common: Fix pinctrl node names
>   arm64: dts: mediatek: mt8183-pumpkin: Add power supply for CCI
>   arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
>   arm64: dts: mediatek: mt8183-kukui: Move DSI panel node to machine
>     dtsis
>   arm64: dts: mediatek: mt8195: Fix ranges for jpeg enc/decoder nodes
>   arm64: dts: mediatek: mt8195-cherry: Move VBAT-supply to Tomato R1/R2
>   arm64: dts: mediatek: mt8195-cherry: Add missing regulators to rt5682
>   arm64: dts: mediatek: mt8395-kontron-i1200: Fix MT6360 regulator nodes
>   arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible
> 
>  .../crypto/inside-secure,safexcel.yaml        |   2 +
>  .../display/mediatek/mediatek,dp.yaml         |   3 +
>  .../display/mediatek/mediatek,dpi.yaml        |   7 +
>  .../mailbox/mediatek,gce-mailbox.yaml         |  11 -
>  .../media/mediatek,mt8195-jpegdec.yaml        |   2 +-
>  .../media/mediatek,mt8195-jpegenc.yaml        |   2 +-
>  .../bindings/phy/mediatek,hdmi-phy.yaml       |  25 +-
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      |   4 +-
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      |   5 +-
>  .../regulator/mediatek,mt6331-regulator.yaml  |  19 +-
>  .../regulator/mediatek,mt6332-regulator.yaml  |   7 +
>  .../bindings/remoteproc/mtk,scp.yaml          |  23 +-
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 106 +++++++-
>  .../bindings/timer/mediatek,timer.yaml        |   1 +
>  arch/arm64/boot/dts/mediatek/mt6331.dtsi      |  10 +-
>  arch/arm64/boot/dts/mediatek/mt6755.dtsi      |   2 +-
>  arch/arm64/boot/dts/mediatek/mt6779.dtsi      |   2 +-
>  .../dts/mediatek/mt6795-sony-xperia-m5.dts    |  40 ++-
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi      |   3 +-
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi      |  52 ++--
>  .../mediatek/mt7986a-acelink-ew-7886cax.dts   |   2 -
>  .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  |  11 +-
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  12 +-
>  arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  28 +-
>  .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  34 ++-
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 138 +++++-----
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  60 +++--
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  28 +-
>  .../mediatek/mt8183-kukui-audio-da7219.dtsi   |   4 +-
>  .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi |   2 +-
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  27 +-
>  .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  43 +++-
>  .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  40 ++-
>  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  40 ++-
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 101 +++-----
>  .../boot/dts/mediatek/mt8183-pumpkin.dts      |  12 +-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 239 +++++++++++++++++-
>  .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |   1 +
>  .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |   1 +
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      |   3 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  30 ++-
>  .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts |  16 +-
>  .../boot/dts/mediatek/mt8516-pumpkin.dts      |   2 +-
>  .../boot/dts/mediatek/pumpkin-common.dtsi     |  18 +-
>  44 files changed, 843 insertions(+), 375 deletions(-)
> 
> --
> 2.50.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250724 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250724083914.61351-1-angelogioacchino.delregno@collabora.com:

arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'gpio-line-names' does not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'gpio-line-names' does not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'gpio-line-names' does not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: t-phy@11c50000 (mediatek,mt7986-tphy): usb-phy@700:reg: [[0, 1792], [0, 2304]] is too long
	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: t-phy@11c50000 (mediatek,mt7986-tphy): usb-phy@700:reg: [[0, 1792], [0, 2304]] is too long
	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): 'mt6332-led' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt6331-regulator'] is too short
	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6366-regulator']
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: regulators (mediatek,mt6331-regulator): 'ldo-vio28' does not match any of the regexes: '^buck-v(core2|io18|dvfs11|dvfs12|dvfs13|dvfs14)$', '^ldo-(avdd32aud|vauxa32)$', '^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$', '^ldo-vcam(a|af|d|io)$', '^ldo-vgp[1234]$', '^ldo-vtcxo[12]$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: regulators (mediatek,mt6331-regulator): ldo-vcamio:regulator-name:0: 'vcam_io' does not match '^vcam(a|_af|d|io)$'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): pinctrl-names: ['default'] is too short
	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): pinctrl-names: ['default'] is too short
	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11250000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'gpio-line-names' does not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc0-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-default-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-uhs-pins:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#






