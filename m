Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6F5C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 21:47:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F05B20722
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 21:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1zJI2ESM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F05B20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XY0a/VUzLzQwrOsIgBdXipfd1bG3hmmFmPuBvqW9hzc=; b=1zJI2ESM3vx5l4gSnUgKEe9Ju
	NQ/CoORXdewTwMQj7yDSoD7jeRe6Pm/orwEDp7JV2n/7p8V677flSZlr/90XmNKZ0pVtZerfxLbAa
	DtbYeXfDmCwqyefvV3kcCkvqKc9V5EL3/Li2NWYuKOJzIVZl38ym/u59qZDpa9jCIHw6CJrmnujmL
	i3//l3oDFGKHGiK4jrOPUrZlZ8cnmkzBjIqEYCPgXqF5DEGjIxk9U7Glp0ojCxrshvQcTEK58tTco
	HE77A8/AyeiQEl7scI4HVavw60pvSoMihNoLO4Yd/lygvrwKrMczeBtTIsN8w/IUqQsSoguJG2ghi
	PEaUo2vQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2iIR-0003KN-V6; Mon, 03 Aug 2020 21:47:03 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2iIM-0003Ii-Lp; Mon, 03 Aug 2020 21:46:59 +0000
Received: by mail-il1-f194.google.com with SMTP id p16so21654857ile.0;
 Mon, 03 Aug 2020 14:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pqP+dO+lvU2cpGzu3ZlIh3GwibVErSRm3PLKdLit8xM=;
 b=CpEkh0FOtYC3s04nimQe+oR6Ugu/4MNWVP0n5M3cdi6TxctpFO90Yi1V4RKmrrEXg3
 CSmLYdCJbdF9kmgBg1nGIOgpTw3mn0vMH7muVmL2+qjb280klL0nsZoJyd0h1xS5NUYZ
 LuzResP9V0anRDBQw6q6LWMhn5pzLHcxFgNS3F/8T1qqs8Y/aKOvo7a7espNcLuJUzUV
 Er4fY3VFYG/LoA8d4S5PpNxsyjLMNsz+8t8jYHvnbi5oIxhdpEtI1ClHFwO9Ob2JZhwZ
 Bk6rRT/FCVb/Q7CEbTIC1aqNgfashtb5wCdGeMwGDE2R8NVnY02fqTUIF7AslGDK+ZT4
 5uYw==
X-Gm-Message-State: AOAM533TNqZd6pPKfy0k3ku9DPyrowKJf1cOMyR/3yRcHdiPmxLfjk3L
 bbf/0nTb1PkWN7zm0SECyQ==
X-Google-Smtp-Source: ABdhPJyIFlqliaMIlzgK+a5Y0a5XoSIdsh5mf4RHk11U0+xbSeeG1cJIq99uvPwTEu3X8pYVmltwfQ==
X-Received: by 2002:a92:6a07:: with SMTP id f7mr1525064ilc.271.1596491217938; 
 Mon, 03 Aug 2020 14:46:57 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id q1sm10823790ioh.0.2020.08.03.14.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:46:57 -0700 (PDT)
Received: (nullmailer pid 3193370 invoked by uid 1000);
 Mon, 03 Aug 2020 21:46:55 -0000
Date: Mon, 3 Aug 2020 15:46:55 -0600
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200803214655.GB3184946@bogus>
References: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
 <20200801043303.32149-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801043303.32149-3-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_174658_756822_1CC52FA3 
X-CRM114-Status: GOOD (  29.29  )
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
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 hongzhou.yang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sean.wang@mediatek.com, linux-gpio@vger.kernel.org, matthias.bgg@gmail.com,
 eddie.huang@mediatek.com, erin.lo@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Aug 01, 2020 at 12:33:02PM +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> new file mode 100755
> index 000000000000..88e18e2e23a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8192.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8192 Pin Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
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
> +    description: |
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
> +    description: |
> +      Physical address base for gpio base registers. There are 11 GPIO
> +      physical address base in mt8192.
> +    maxItems: 11
> +
> +  reg-names:
> +    description: |
> +      Gpio base register names.
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
> +  '^pins':
> +    type: object
> +    description: |
> +      A pinctrl node should contain at least one subnodes representing the
> +      pinctrl groups available on the machine. Each subnode will list the
> +      pins it needs, and how they should be configured, with regard to muxer
> +      configuration, pullups, drive strength, input enable/disable and
> +      input schmitt.
> +      An example of using macro:
> +      node {

'node' doesn't match '^pins' regex.

Better to put an example in the actual example so it is checked.

> +        pinmux = <PIN_NUMBER_PINMUX>;
> +        GENERIC_PINCONFIG;
> +      };
> +    properties:
> +      pinmux:
> +        $ref: "/schemas/types.yaml#/definitions/uint32-array"

Already a common definition in pinmux-node.yaml. Reference that file in 
'^pins'.

> +        description: |
> +          Integer array, represents gpio pin number and mux setting.
> +          Supported pin number and mux varies for different SoCs, and are defined
> +          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> +
> +      GENERIC_PINCONFIG:

That's not a property name.

> +        description: |
> +          It is the generic pinconfig options to use, bias-disable,
> +          bias-pull-down, bias-pull-up, input-enable, input-disable, output-low,
> +          output-high, input-schmitt-enable, input-schmitt-disable
> +          and drive-strength are valid.
> +
> +          Some special pins have extra pull up strength, there are R0 and R1 pull-up
> +          resistors available, but for user, it's only need to set R1R0 as 00, 01,
> +          10 or 11. So It needs config "mediatek,pull-up-adv" or
> +          "mediatek,pull-down-adv" to support arguments for those special pins.
> +          Valid arguments are from 0 to 3.
> +
> +          We can use "mediatek,tdsel" which is an integer describing the steps for
> +          output level shifter duty cycle when asserted (high pulse width adjustment).
> +          Valid arguments  are from 0 to 15.
> +          We can use "mediatek,rdsel" which is an integer describing the steps for
> +          input level shifter duty cycle when asserted (high pulse width adjustment).
> +          Valid arguments are from 0 to 63.
> +
> +          When config drive-strength, it can support some arguments, such as
> +          MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See dt-bindings/pinctrl/mt65xx.h.
> +          It can only support 2/4/6/8/10/12/14/16mA in mt8192.
> +          For I2C pins, there are existing generic driving setup and the specific
> +          driving setup. I2C pins can only support 2/4/6/8/10/12/14/16mA driving
> +          adjustment in generic driving setup. But in specific driving setup,
> +          they can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
> +          driving setup for I2C pins, the existing generic driving setup will be
> +          disabled. For some special features, we need the I2C pins specific
> +          driving setup. The specific driving setup is controlled by E1E0EN.
> +          So we need add extra vendor driving preperty instead of
> +          the generic driving property.
> +          We can add "mediatek,drive-strength-adv = <XXX>;" to describe the specific
> +          driving setup property. "XXX" means the value of E1E0EN. EN is 0 or 1.
> +          It is used to enable or disable the specific driving setup.
> +          E1E0 is used to describe the detail strength specification of the I2C pin.
> +          When E1=0/E0=0, the strength is 0.125mA.
> +          When E1=0/E0=1, the strength is 0.25mA.
> +          When E1=1/E0=0, the strength is 0.5mA.
> +          When E1=1/E0=1, the strength is 1mA.
> +          So the valid arguments of "mediatek,drive-strength-adv" are from 0 to 7.
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +      input-enable: true
> +
> +      input-disable: true
> +
> +      input-schmitt-enable: true
> +
> +      input-schmitt-disable: true
> +
> +    required:
> +      - pinmux
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

additionalProperties: false

> +
> +examples:
> +  - |
> +            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> +            pio: pinctrl@10005000 {
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
> +            };
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
