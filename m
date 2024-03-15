Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAB4C54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbP6BWnBeuMKWyfXwsy+zUASWhOOgzkbHidzdSH85Ds=; b=ncKeEJTe8kFcYLsnivCyfvwvRn
	PhYF4QC8bLObFK1I2hwIlIFpQE5ZYj7HPQoMn80fbI6ey+7F/LuBq6VUCAjREuwQVBIMgiK9eCN8P
	9jDD3lRywRkY0xEfSLjWP7lcVLEs4LAYzmYMbh65w3U4+zLr6W5Q8Zj5ZDystr82Ffk1cuwPZWvDk
	PgLL05YMp97frvd30eTeSGE0TRc21dtsQMwslciWxBURRleJEK4mrXn9/volbmtSpKfgigPxvnYpT
	7TDxcgAfxBz3qrkzsqORG6cnLJqqNg1WQnkOYiY+uhpsJLPCvjCk6J1WzEI99D8fvNA8NKcWUbfp8
	25+Oa/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl9pr-00000000iq4-2NUR;
	Fri, 15 Mar 2024 15:51:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl9pc-00000000igD-115g;
	Fri, 15 Mar 2024 15:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA4736171E;
	Fri, 15 Mar 2024 15:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694C2C433C7;
	Fri, 15 Mar 2024 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710517851;
	bh=7a2Hm3pXFDdr5XBE0kbmXjURCAgqL5QaBK1DuRiWk9U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pvuPrbXTfOndaQEzFFp666MD+A1WudAqkzua//+PVFT8JbWkmfgXD3e0ekIusUTfQ
	 xYz/WXmpd2AKN95kwGT89SomtK4TNbzF2xKC3F7N7ni5fNFbzgRSkOcjuLEz2ovl7h
	 s+UwmwPq0Ol12u2CXGRAosLNGFZtJDD0XTBKL1JZlxfvgoLalAqKVlIeEYREbqKph3
	 teLHiLDznyB1ndJTnbNrQCMKiBThklX6MbtC/Dsn2cfYte/JixzTKW3wk+jxx+diMY
	 boW0gAxTsPNWvuSb1DnIOJB/2SNqT3TTfTuRotegToupeAZ1vHN6IIbkl355ol70Ii
	 pXoMXMQOljVEA==
Date: Fri, 15 Mar 2024 09:50:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, wenst@chromium.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 jenneron@protonmail.com, devicetree@vger.kernel.org, matthias.bgg@gmail.com
In-Reply-To: <20240314103500.93158-1-angelogioacchino.delregno@collabora.com>
References: <20240314103500.93158-1-angelogioacchino.delregno@collabora.com>
Message-Id: <171051663323.1379909.15085873286971472306.robh@kernel.org>
Subject: Re: [PATCH 0/2] MediaTek: Add HP Chromebook x360 13b-ca0002sa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_085052_407361_DB4BA70F 
X-CRM114-Status: GOOD (  15.97  )
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


On Thu, 14 Mar 2024 11:34:58 +0100, AngeloGioacchino Del Regno wrote:
> This series adds support for the HP Chromebook x360 13b-ca0002sa,
> Cherry platform, codename Dojo.
> 
> There are very few differences with Tomato, and specifically:
>  - Different touchscreen controller (still HID over I2C, different addr)
>  - Different (dual MAX98390) speaker amplifier
>  - Slightly different keyboard top row keymap
>  - NVMe storage over PCIe0
> 
> This series depends on [1] the ASoC MTK cleanup, and was tested working
> by PostmarketOS community members.
> 
> As for the changes in mt8195-cherry.dtsi: personally tested on MT8195
> Cherry Tomato, no issues.
> 
> [1]: https://lore.kernel.org/r/20240313110147.1267793-1-angelogioacchino.delregno@collabora.com
> 
> AngeloGioacchino Del Regno (2):
>   dt-bindings: arm: mediatek: Add MT8195 HP Chromebook x360 13b-ca0002sa
>   arm64: mediatek: mt8195-cherry: Introduce the MT8195 Dojo Chromebook
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   8 ++
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  .../dts/mediatek/mt8195-cherry-dojo-r1.dts    | 114 ++++++++++++++++++
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      |   5 +
>  4 files changed, 128 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
> 
> --
> 2.44.0
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8195-cherry-dojo-r1.dtb' for 20240314103500.93158-1-angelogioacchino.delregno@collabora.com:

arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: mt8195-sound: 'audio-routing', 'spk-playback-dai-link' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/mt8195-mt6359.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: soc: jpgdec-master: {'compatible': ['mediatek,mt8195-jpgdec'], 'power-domains': [[51, 24]], 'iommus': [[142, 621], [142, 622], [142, 626], [142, 627], [142, 628], [142, 629]], '#address-cells': 2, '#size-cells': 2, 'ranges': True, 'jpgdec@1a040000': {'compatible': ['mediatek,mt8195-jpgdec-hw'], 'reg': [[0, 436469760, 0, 65536]], 'iommus': [[142, 621], [142, 622], [142, 626], [142, 627], [142, 628], [142, 629]], 'interrupts': [[0, 343, 4, 0]], 'clocks': [[41, 3]], 'clock-names': ['jpgdec'], 'power-domains': [[51, 23]]}, 'jpgdec@1a050000': {'compatible': ['mediatek,mt8195-jpgdec-hw'], 'reg': [[0, 436535296, 0, 65536]], 'iommus': [[142, 621], [142, 622], [142, 626], [142, 627], [142, 628], [142, 629]], 'interrupts': [[0, 344, 4, 0]], 'clocks': [[41, 4]], 'clock-names': ['jpgdec'], 'power-domains': [[51, 24]]}, 'jpgdec@1b040000': {'compatible': ['mediatek,mt8195-jpgdec-hw'], 'reg': [[0, 453246976, 0, 65536]], 'iommus': [[124, 653], 
 [124, 654], [124, 658], [124, 659], [124, 660], [124, 661]], 'interrupts': [[0, 348, 4, 0]], 'clocks': [[35, 3]], 'clock-names': ['jpgdec'], 'power-domains': [[51, 25]]}} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: soc: jpgenc-master: {'compatible': ['mediatek,mt8195-jpgenc'], 'power-domains': [[51, 27]], 'iommus': [[124, 647], [124, 648], [124, 649], [124, 652]], '#address-cells': 2, '#size-cells': 2, 'ranges': True, 'jpgenc@1a030000': {'compatible': ['mediatek,mt8195-jpgenc-hw'], 'reg': [[0, 436404224, 0, 65536]], 'iommus': [[142, 615], [142, 616], [142, 617], [142, 620]], 'interrupts': [[0, 342, 4, 0]], 'clocks': [[41, 2]], 'clock-names': ['jpgenc'], 'power-domains': [[51, 26]]}, 'jpgenc@1b030000': {'compatible': ['mediatek,mt8195-jpgenc-hw'], 'reg': [[0, 453181440, 0, 65536]], 'iommus': [[124, 647], [124, 648], [124, 649], [124, 652]], 'interrupts': [[0, 347, 4, 0]], 'clocks': [[35, 2]], 'clock-names': ['jpgenc'], 'power-domains': [[51, 27]]}} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon', 'simple-mfd'] is too long
	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: ec@0: 'keyboard-backlight' does not match any of the regexes: '^extcon[0-9]*$', '^i2c-tunnel[0-9]*$', '^regulator@[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34: #interrupt-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'DBVDD-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a: 'LDO1-IN-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: amplifier@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: amplifier@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: t-phy@11e30000: 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: display@14f06000: clocks: [[37, 14], [37, 43], [37, 44]] is too long
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c015000: clock-names:0: 'pixel' was expected
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c015000: clock-names:1: 'engine' was expected
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: mutex@1c101000: 'clock-names', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: clock-names:0: 'pixel' was expected
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: clock-names:1: 'engine' was expected
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000: Additional properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: edp-tx@1c500000: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p: 'label' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#



