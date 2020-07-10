Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BEEC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 16:39:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27DF120725
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 16:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DPVTzZfE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27DF120725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQexdPfrCHyWEB/o0EznPc9ErYPt9aAIUMFOPB9UKBU=; b=DPVTzZfEMBKxPlcQaazukzrWV
	fpqT1YhjPMcq7mO6dY6DI5pAfMXJYGgIseqFXIxuvV2PcsYzVkCnUEP0z7DZ1vRWbrnNwQbp1oaUh
	eA+4rZovF+kqcjr/fAD+5fjPe9EYqjeqc+iKWLnGmAd+pHS9e/BtazVQ1fCMkGqBanvR3cTHYgh6e
	ht/fAmJOdmCMyNvw/b2yv+++8ZK2yGJN36h8Xw/OmhQDdFX23XQOTTYq+ArG5vOwl1woocLwFbzk4
	0kArLR3N0mz2ektfs2KzVaGSxWPjY1Qk0i4S4Etcb20rQSX1JesCEZRR1uu325Cc1ztxHEa5WpWoN
	Kj+lwn+9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtw3N-00043t-GZ; Fri, 10 Jul 2020 16:39:13 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtw3K-00042w-43; Fri, 10 Jul 2020 16:39:11 +0000
Received: by mail-il1-f193.google.com with SMTP id q3so5582727ilt.8;
 Fri, 10 Jul 2020 09:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RDEiKXkfuo1LcvNVgxR5JlTZIhsrn+C+Okx9e1+bqZ4=;
 b=VlHet92PxAiG6F5IgxSi0h5Ot9tIINgzz6Tcm6bahVCHbmqD8AyVeuLCifuOBWqdB2
 aG61Wzl2JD3y6b4kqLAztq8LYxZuaoqqgLS+1iqFbfGP48St3ugK042BGSp0nyBmWoPe
 vO8gU1ZahovVyxQob4NlG30IKjyuMTDBrTZ7xIM7aO8gG6HLCCpEaNcHG6gJYYi1xlAm
 sJyQW7I0lYRQOM54g1J9rSmFVq7J/ZUF2knl6Iil78A9mWEh0tOli6pk7Y+q0L0kfrnu
 zEgWCVYSkPqnRat1l2nrbB62oZBBfNCThD1Sy6fWvlPZYQ6mTy7D2ASDEX7XLuKdP8MN
 8PuA==
X-Gm-Message-State: AOAM532W1O09o7PNAFUrjxmXIsD3nsse1eeuxzCHINAa/AZyk+TChenB
 mI99eF/vIyybcN0/oCKJkg==
X-Google-Smtp-Source: ABdhPJzLFaHStBCrMtyNEUyaEU9MNoIRNK7UH30HjnsBYGguV8MEdpVyBF9INgKlpdURHNTbgPM9bw==
X-Received: by 2002:a92:5bdd:: with SMTP id c90mr47581679ilg.154.1594399147560; 
 Fri, 10 Jul 2020 09:39:07 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id y12sm3670759ilm.38.2020.07.10.09.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 09:39:07 -0700 (PDT)
Received: (nullmailer pid 2774475 invoked by uid 1000);
 Fri, 10 Jul 2020 16:39:05 -0000
Date: Fri, 10 Jul 2020 10:39:05 -0600
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200710163905.GA2761779@bogus>
References: <20200710072717.3056-1-zhiyong.tao@mediatek.com>
 <20200710072717.3056-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710072717.3056-3-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_123910_185806_027871CE 
X-CRM114-Status: GOOD (  28.09  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, hui.liu@mediatek.com,
 srv_heupstream@mediatek.com, chuanjia.liu@mediatek.com,
 biao.huang@mediatek.com, linus.walleij@linaro.org, sean.wang@kernel.org,
 linux-kernel@vger.kernel.org, hongzhou.yang@mediatek.com,
 linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 linux-gpio@vger.kernel.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com,
 erin.lo@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 03:27:16PM +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> new file mode 100644
> index 000000000000..c698b7f65950
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8192.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8192 Pin Controller
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>

Should be someone who knows the h/w (Mediatek).

> +
> +description: |
> +  The Mediatek's Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8192-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> +      the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.
> +    const: 2
> +
> +  gpio-ranges:
> +    description: gpio valid number range.
> +    maxItems: 1
> +
> +  reg:
> +    description:
> +      Physical address base for gpio base registers. There are 11 GPIO
> +      physical address base in mt8192.
> +    maxItems: 11
> +
> +  reg-names:
> +    description:
> +      Gpio base register names. There are 11 gpio base register names in mt8192.
> +      They are "iocfg0", "iocfg_rm", "iocfg_bm", "iocfg_bl", "iocfg_br",
> +      "iocfg_lm", "iocfg_lb", "iocfg_rt", "iocfg_lt", "iocfg_tl", "eint".

Should be a schema.

> +    maxItems: 11
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq.
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  subnode format:

The child node name is 'subnode format'?

> +    description:
> +      A pinctrl node should contain at least one subnodes representing the
> +      pinctrl groups available on the machine. Each subnode will list the
> +      pins it needs, and how they should be configured, with regard to muxer
> +      configuration, pullups, drive strength, input enable/disable and
> +      input schmitt.
> +
> +      node {
> +        pinmux = <PIN_NUMBER_PINMUX>;
> +        GENERIC_PINCONFIG;
> +      };

If you want to preserve formatting, description needs a literal block 
notation on the end ('|').

> +  '-pinmux$':
> +    description:
> +      Integer array, represents gpio pin number and mux setting.
> +      Supported pin number and mux varies for different SoCs, and are defined
> +      as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +  GENERIC_PINCONFIG:

You just defined a property called 'GENERIC_PINCONFIG'...

> +    description:
> +      It is the generic pinconfig options to use, bias-disable,
> +      bias-pull-down, bias-pull-up, input-enable, input-disable, output-low,
> +      output-high, input-schmitt-enable, input-schmitt-disable
> +      and drive-strength are valid.
> +
> +      Some special pins have extra pull up strength, there are R0 and R1 pull-up
> +      resistors available, but for user, it's only need to set R1R0 as 00, 01,
> +      10 or 11. So It needs config "mediatek,pull-up-adv" or
> +      "mediatek,pull-down-adv" to support arguments for those special pins.
> +      Valid arguments are from 0 to 3.
> +
> +      We can use "mediatek,tdsel" which is an integer describing the steps for
> +      output level shifter duty cycle when asserted (high pulse width adjustment).
> +      Valid arguments  are from 0 to 15.
> +      We can use "mediatek,rdsel" which is an integer describing the steps for
> +      input level shifter duty cycle when asserted (high pulse width adjustment).
> +      Valid arguments are from 0 to 63.
> +
> +      When config drive-strength, it can support some arguments, such as
> +      MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See dt-bindings/pinctrl/mt65xx.h.
> +      It can only support 2/4/6/8/10/12/14/16mA in mt8192.
> +      For I2C pins, there are existing generic driving setup and the specific
> +      driving setup. I2C pins can only support 2/4/6/8/10/12/14/16mA driving
> +      adjustment in generic driving setup. But in specific driving setup,
> +      they can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
> +      driving setup for I2C pins, the existing generic driving setup will be
> +      disabled. For some special features, we need the I2C pins specific
> +      driving setup. The specific driving setup is controlled by E1E0EN.
> +      So we need add extra vendor driving preperty instead of
> +      the generic driving property.
> +      We can add "mediatek,drive-strength-adv = <XXX>;" to describe the specific
> +      driving setup property. "XXX" means the value of E1E0EN. EN is 0 or 1.
> +      It is used to enable or disable the specific driving setup.
> +      E1E0 is used to describe the detail strength specification of the I2C pin.
> +      When E1=0/E0=0, the strength is 0.125mA.
> +      When E1=0/E0=1, the strength is 0.25mA.
> +      When E1=1/E0=0, the strength is 0.5mA.
> +      When E1=1/E0=1, the strength is 1mA.
> +      So the valid arguments of "mediatek,drive-strength-adv" are from 0 to 7.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +examples:
> +  - |
> +            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> +            pio: pinctrl@10005000 {

Drop unused labels.

> +                    compatible = "mediatek,mt8192-pinctrl";
> +                    reg = <0 0x10005000 0 0x1000>,
> +                          <0 0x11c20000 0 0x1000>,
> +                          <0 0x11d10000 0 0x1000>,
> +                          <0 0x11d30000 0 0x1000>,
> +                          <0 0x11d40000 0 0x1000>,
> +                          <0 0x11e20000 0 0x1000>,
> +                          <0 0x11e70000 0 0x1000>,
> +                          <0 0x11ea0000 0 0x1000>,
> +                          <0 0x11f20000 0 0x1000>,
> +                          <0 0x11f30000 0 0x1000>,
> +                          <0 0x1000b000 0 0x1000>;
> +                    reg-names = "iocfg0", "iocfg_rm", "iocfg_bm",
> +                          "iocfg_bl", "iocfg_br", "iocfg_lm",
> +                          "iocfg_lb", "iocfg_rt", "iocfg_lt",
> +                          "iocfg_tl", "eint";
> +                    gpio-controller;
> +                    #gpio-cells = <2>;
> +                    gpio-ranges = <&pio 0 0 220>;
> +                    interrupt-controller;
> +                    interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
> +                    #interrupt-cells = <2>;
> +                    i2c0_pins_a: i2c0 {

Doesn't match the schema.

> +                        pins {

Doesn't match the schema. Why do you need 2 levels of nodes here?

> +                                pinmux = <PINMUX_GPIO118__FUNC_SCL1>,
> +                                         <PINMUX_GPIO119__FUNC_SDA1>;
> +                                mediatek,pull-up-adv = <3>;
> +                                mediatek,drive-strength-adv = <7>;
> +                        };
> +                    };
> +                    i2c1_pins_a: i2c1 {
> +                        pins {
> +                                pinmux = <PINMUX_GPIO141__FUNC_SCL2>,
> +                                         <PINMUX_GPIO142__FUNC_SDA2>;
> +                                mediatek,pull-down-adv = <2>;
> +                                mediatek,drive-strength-adv = <4>;
> +                       };
> +                   };
> +            };
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
