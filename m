Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1F8C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 20:59:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B2E21531
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 20:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ppUNWuTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39B2E21531
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9G/KwRxI4GkZ4IaGSK98gRvZ1qPhRg+gKP5fHrAX5hE=; b=ppUNWuTLtZwkSoCvgBILtFmly
	1iDJKi6B55ot19JC9B/2fVm8KNH5HRY6GWcXnMGpRbC0fkj5jvnIq7hGlRGhZNqFN6Xa1cYg90GNM
	hK4OO09/d4UrDm5BEwMeNKZsVeLplNxbCCIF30kGF8tvnToO7+7ICF+Qc0NXHDcMmEjuTAC4zw+Yn
	7i7lafFBKVrxcON+TGBgD/Ok+CuxnBqHQ7oXj5H2ao0gS699XR0TIId0d+uF3jgLW9b/+XgLWkKxW
	Bz7XyxMwx7QpWSgdOkiI9+qcuz2C53q0P6Sw/pLifS1WdoP4xCx0Mp93WfK2/QEmWno3eIRHnLsuS
	NxacvYhcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr6IN-0001fU-1c; Thu, 02 Jul 2020 20:58:59 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr6IJ-0001ea-FF; Thu, 02 Jul 2020 20:58:56 +0000
Received: by mail-io1-f65.google.com with SMTP id a12so30391447ion.13;
 Thu, 02 Jul 2020 13:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T5vpSNDrCv3It924w2h+o8DX1bZC5q09S/8KHjjhWME=;
 b=B5s5uUwpR0D2iWH4KsFd5gXYCj1C0knLuddY1YkbyaAElaKD9gORsNGAqTrfNtQeqo
 hHxYFsKyyGk9RPfTrWLKt1MiHaLnIfbOAdZgXtjpV5z3TshXZGGOFlI2jWWh1/S+pYK7
 xArdlyaBgqwx/iWHXZQQU6e9GkXXA/LDGIlKbFpDQX9yGcqbAG15qdazT1gKAqV4xHUT
 4OUC7uQlkpt1d37gD3YhbOGnLgahF6kfmLNXHd23gTO5zgAKuSsM2w7qyWtUsZp+Ubc8
 onWEwpfJys3vMqNGZy43f34xgYD9arFlp0bv3Q1BRyIue+l94a6XMNOeAR+G+MOD2+Zb
 Yg/A==
X-Gm-Message-State: AOAM533uBVPUXkW7K02IWz6cWPTMSEE3UZk+7tW5nSAgygq3P/EX8NHY
 MQEYvksHt49WjXyECn+Svg8F6gUwlQ==
X-Google-Smtp-Source: ABdhPJyiRs+D0ZbkVQ6QXHWVV+mY/pqN3JhtNbcv30Bos1HkFvPIyVYAjVT3vJ56lenQUfqJsl7mhA==
X-Received: by 2002:a05:6602:2295:: with SMTP id
 d21mr9253006iod.0.1593723534890; 
 Thu, 02 Jul 2020 13:58:54 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h1sm2071572iob.8.2020.07.02.13.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 13:58:54 -0700 (PDT)
Received: (nullmailer pid 1683187 invoked by uid 1000);
 Thu, 02 Jul 2020 20:58:52 -0000
Date: Thu, 2 Jul 2020 14:58:52 -0600
From: Rob Herring <robh@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200702205852.GA1675491@bogus>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
 <1593694630-26604-4-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593694630-26604-4-git-send-email-hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_165855_544006_EA734CBD 
X-CRM114-Status: GOOD (  21.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 02, 2020 at 08:57:05PM +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  210 ++++++++++++++++++++
>  1 file changed, 210 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> new file mode 100644
> index 0000000..3a9fc4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -0,0 +1,210 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6779 Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Andy Teng <andy.teng@mediatek.com>
> +
> +description: |+
> +  The pin controller node should be the child of a syscon node with the
> +  required property:
> +  - compatible: "syscon"
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6779-pinctrl
> +
> +  reg:
> +    minItems: 9
> +    maxItems: 9
> +    description: |
> +      physical address base for gpio-related control registers.

Need to describe what each entry is.

items:
  - description: ...
  - description: ...
  - description: ...

> +
> +  reg-names:
> +    description: |
> +      GPIO base register names. The names are "gpio", "iocfg_rm",
> +      "iocfg_br", "iocfg_lm", "iocfg_lb", "iocfg_rt", "iocfg_lt",
> +      "iocfg_tl", "eint";

The names should be a schema.

> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO
> +      binding is used, the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.
> +
> +  gpio-ranges:
> +    minItems: 1
> +    maxItems: 5
> +    description: |
> +      GPIO valid number range.
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +    description: |
> +      Specifies the summary IRQ.
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - gpio-ranges
> +  - interrupt-controller
> +  - interrupts
> +  - "#interrupt-cells"
> +
> +patternProperties:
> +  '-[0-9]*$':
> +    type: object
> +    patternProperties:
> +      '-pins*$':
> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input schmitt.

Need to include the pinconf schema here.

> +
> +        properties:
> +          pinmux:
> +            description:
> +              integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are defined
> +              as macros in boot/dts/<soc>-pinfunc.h directly.
> +
> +          bias-disable:
> +            type: boolean

Don't redefine the type. Just indicate what common properties are used:

bias-disable: true

> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          input-enable:
> +            type: boolean
> +
> +          input-disable:
> +            type: boolean
> +
> +          output-low:
> +            type: boolean
> +
> +          output-high:
> +            type: boolean
> +
> +          input-schmitt-enable:
> +            type: boolean
> +
> +          input-schmitt-disable:
> +            type: boolean
> +
> +          mediatek,pull-up-adv:
> +            description: |
> +              Pull up setings for 2 pull resistors, R0 and R1. User can
> +              configure those special pins. Valid arguments are described as below:
> +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> +            allOf:

You can drop the allOf now.

> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - enum: [0, 1, 2, 3]
> +
> +          mediatek,pull-down-adv:
> +            description: |
> +              Pull down settings for 2 pull resistors, R0 and R1. User can
> +              configure those special pins. Valid arguments are described as below:
> +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - enum: [0, 1, 2, 3]
> +
> +          drive-strength:
> +            description: |
> +              Selects the drive strength for the specified pins in mA.
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +        required:
> +          - pinmux
> +
> +        additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/mt6779-pinfunc.h>
> +
> +    pio: pinctrl@10005000 {
> +        compatible = "mediatek,mt6779-pinctrl";
> +        reg = <0 0x10005000 0 0x1000>,
> +            <0 0x11c20000 0 0x1000>,
> +            <0 0x11d10000 0 0x1000>,
> +            <0 0x11e20000 0 0x1000>,
> +            <0 0x11e70000 0 0x1000>,
> +            <0 0x11ea0000 0 0x1000>,
> +            <0 0x11f20000 0 0x1000>,
> +            <0 0x11f30000 0 0x1000>,
> +            <0 0x1000b000 0 0x1000>;
> +        reg-names = "gpio", "iocfg_rm",
> +          "iocfg_br", "iocfg_lm",
> +          "iocfg_lb", "iocfg_rt",
> +          "iocfg_lt", "iocfg_tl",
> +          "eint";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 0 210>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        mmc0_pins_default: mmc0-0 {
> +            cmd-dat-pins {
> +                pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
> +                    <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
> +                    <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
> +                    <PINMUX_GPIO177__FUNC_MSDC0_DAT3>,
> +                    <PINMUX_GPIO170__FUNC_MSDC0_DAT4>,
> +                    <PINMUX_GPIO173__FUNC_MSDC0_DAT5>,
> +                    <PINMUX_GPIO171__FUNC_MSDC0_DAT6>,
> +                    <PINMUX_GPIO174__FUNC_MSDC0_DAT7>,
> +                    <PINMUX_GPIO167__FUNC_MSDC0_CMD>;
> +                input-enable;
> +                mediatek,pull-up-adv = <1>;
> +            };
> +            clk-pins {
> +                pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
> +                mediatek,pull-down-adv = <2>;
> +            };
> +            rst-pins {
> +                pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
> +                mediatek,pull-up-adv = <0>;
> +            };
> +        };
> +    };
> +
> +    mmc0 {
> +       pinctrl-0 = <&mmc0_pins_default>;
> +       pinctrl-names = "default";
> +    };
> -- 
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
