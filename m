Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7F1C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1iYFV/pk3VtxO2Vv/uRHQvi4wu62XG1HbiVw4tLmgA=; b=jXoeX+4x1K1uJC/OitOSw1KXRE
	oFfPAlr7St81hR3HEvRZ5l2LuCnlDqn3w6zobB+i3B/K1VWbW4ePsY/2Iq3ioZ/vtmEWkuJX0VsVS
	l6MYAlfmYCB/4mwhq7nsmtQU9E/zwLzPT260HoxeHkjmhFX4hmUfRdsjB9/7pMP6HxDFYEdPHGp87
	lWB3VOWzvMDoy2+1w1gaZtJh0/ecG8P6skR6XIt1hnLo/UoyKdrD6k/cNC6XG9vhvbmshMyeChRqt
	eK1ikmghXhWvEAb02prkoZVMn86JjF159Mzp6vyeY1hDp7haI+Th+hqYl5c+7Vqakd3CfQ0XQiCAE
	/kJYTdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhKY-00FeRl-Lc; Thu, 17 Nov 2022 16:01:34 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhJh-00Fe2O-38; Thu, 17 Nov 2022 16:00:45 +0000
Received: by mail-oi1-f169.google.com with SMTP id n205so2331339oib.1;
        Thu, 17 Nov 2022 08:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1iYFV/pk3VtxO2Vv/uRHQvi4wu62XG1HbiVw4tLmgA=;
        b=rSHRaCi2T+8VMYTGsFf/77WPkmbEG55wJVB7krSLyPAwA8Qwxf/PbWTLybrx7wQcUh
         gOjS9hg2+JIK/Ab1EhQQ546dQ0m+qOA/hQxnLVDuB++iTgTs8BKYmAyk5po2pYkinOFr
         ORB9Z0RUVjSMiZVM9VOPh4QZYQj1LAuQZmm+RC28zqUFr7AWtLI7cPQJGmsy++IAZFbh
         dZYm9n2QgcUp+crWB9ivxKtrGbZBjrSf4oDMPqhPjWL6hmUzltrJa2MR15D/TNAQ/H5J
         RPp/UzymhblKGgXKiu297YdNnM1Fwgm2ljPKp+L8H/0m+YqHYTD8WWebRBQjDuUkvOFY
         kKRg==
X-Gm-Message-State: ANoB5pli4s/reA+7bdtllL0jPY16SDovXwt4dY2UPsaUSJDccZmiVn1+
	+cXdQ+30NeyODBpOr+aioA==
X-Google-Smtp-Source: AA0mqf5qHLQTURJi2r+QuYwmtK6l/Uins36ngd8s4Y3T/DUk0YNW/CdISa+Z16Dhzxc3RQDy3uZlng==
X-Received: by 2002:aca:1308:0:b0:354:94c3:2b33 with SMTP id e8-20020aca1308000000b0035494c32b33mr4405489oii.247.1668700839047;
        Thu, 17 Nov 2022 08:00:39 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p15-20020a056870568f00b0014185b2b3d5sm579786oao.18.2022.11.17.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:00:38 -0800 (PST)
Received: (nullmailer pid 2943020 invoked by uid 1000);
	Thu, 17 Nov 2022 16:00:40 -0000
Date: Thu, 17 Nov 2022 10:00:40 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>, Fabien Parent <fabien.parent@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 06/10] dt-bindings: soc: mediatek: convert pwrap
 documentation
Message-ID: <20221117160040.GB2913522-robh@kernel.org>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-6-8210d955dd3d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005-mt6357-support-v5-6-8210d955dd3d@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_080041_240232_599C3BF0 
X-CRM114-Status: GOOD (  26.99  )
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

On Wed, Nov 16, 2022 at 01:33:00PM +0100, Alexandre Mergnat wrote:
> - Convert soc/mediatek/pwrap.txt to soc/mediatek/mediatek,pwrap.yaml
> - MT8365 SoC has 2 additional clock items and a yaml schema for its PMIC
> - Remove pwrap.txt file
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6323.txt       |   2 +-
>  Documentation/devicetree/bindings/mfd/mt6397.txt   |   2 +-
>  .../bindings/soc/mediatek/mediatek,pwrap.yaml      | 145 +++++++++++++++++++++
>  .../devicetree/bindings/soc/mediatek/pwrap.txt     |  75 -----------
>  4 files changed, 147 insertions(+), 77 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> index 45bf9f7d85f3..73353692efa1 100644
> --- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> @@ -9,7 +9,7 @@ MT6323 PMIC hardware.
>  For MT6323 MFD bindings see:
>  Documentation/devicetree/bindings/mfd/mt6397.txt
>  For MediaTek PMIC wrapper bindings see:
> -Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
>  
>  Required properties:
>  - compatible : Must be "mediatek,mt6323-led"
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 79aaf21af8e9..3bee4a42555d 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -13,7 +13,7 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
>  It is interfaced to host controller using SPI interface by a proprietary hardware
>  called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
>  See the following for pwarp node definitions:
> -../soc/mediatek/pwrap.txt
> +../soc/mediatek/mediatek,pwrap.yaml
>  
>  This document describes the binding for MFD device and its sub module.
>  
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> new file mode 100644
> index 000000000000..6d19f534e994
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek PMIC Wrapper
> +
> +maintainers:
> +  - Flora Fu <flora.fu@mediatek.com>
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description: |
> +  On MediaTek SoCs the PMIC is connected via SPI. The SPI master interface
> +  is not directly visible to the CPU, but only through the PMIC wrapper
> +  inside the SoC. The communication between the SoC and the PMIC can
> +  optionally be encrypted. Also a non standard Dual IO SPI mode can be
> +  used to increase speed.
> +
> +  IP Pairing
> +
> +  On MT8135 the pins of some SoC internal peripherals can be on the PMIC.
> +  The signals of these pins are routed over the SPI bus using the pwrap
> +  bridge. In the binding description below the properties needed for bridging
> +  are marked with "IP Pairing". These are optional on SoCs which do not support
> +  IP Pairing
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2701-pwrap
> +              - mediatek,mt6765-pwrap
> +              - mediatek,mt6779-pwrap
> +              - mediatek,mt6797-pwrap
> +              - mediatek,mt6873-pwrap
> +              - mediatek,mt7622-pwrap
> +              - mediatek,mt8135-pwrap
> +              - mediatek,mt8173-pwrap
> +              - mediatek,mt8183-pwrap
> +              - mediatek,mt8188-pwrap
> +              - mediatek,mt8365-pwrap
> +              - mediatek,mt8516-pwrap
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-pwrap
> +              - mediatek,mt8195-pwrap
> +          - const: syscon
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: PMIC wrapper registers
> +      - description: IP pairing registers
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: pwrap
> +      - const: pwrap-bridge
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: SPI bus clock
> +      - description: Main module clock
> +      - description: System module clock
> +      - description: Timer module clock
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: spi
> +      - const: wrap
> +      - const: sys
> +      - const: tmr
> +
> +  resets:
> +    minItems: 1
> +    items:
> +      - description: PMIC wrapper reset
> +      - description: IP pairing reset
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: pwrap
> +      - const: pwrap-bridge
> +
> +  pmic:
> +    type: object
> +    $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml

Drop the $ref. It will get validated by matching the pmic compatible.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +dependentRequired:
> +  resets: [reset-names]
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8365-pwrap
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +
> +        clock-names:
> +          minItems: 4
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        pwrap: pwrap@1000d000 {

Drop unused labels.

> +            compatible = "mediatek,mt8365-pwrap";
> +            reg = <0 0x1000d000 0 0x1000>;
> +            reg-names = "pwrap";
> +            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&infracfg CLK_IFR_PWRAP_SPI>,
> +                     <&infracfg CLK_IFR_PMIC_AP>,
> +                     <&infracfg CLK_IFR_PWRAP_SYS>,
> +                     <&infracfg CLK_IFR_PWRAP_TMR>;
> +            clock-names = "spi", "wrap", "sys", "tmr";
> +        };
> +    };

