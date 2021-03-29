Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEFCC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:43:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B309961989
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B309961989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LUUdvXN/ILao2nnE/whfZc31BDswF7tOf97FT/Van1E=; b=j9MDd2ULHm8zmEN+2NqmK8gBP
	1Z4MehkBG57IEzKiMtmCLEOCrDIV+Db4VOQEWtIB3/0O6H+ppM7BSTqiUcD1qyqMdDdfoBQp9umyv
	s4DKJzIPbiVBC8Za4y/m9yC48T/rbbs10seyxqqBWI3OVhCnZNoQkWEG0Zc1nYDg5LsgTNnZtU0qD
	ad5mGokH3+WM0oXkjKeqttIDBykZuHH9SmeRf1U2YIjszNMjm/WnK5DqFTcL66bSUmkEe1y5kaQU6
	OZ0f3vB9Q+q74rv8KVjE8QSFfFBBb58mW+8i/Sm7oosGVcJkD9hkB78myi9sZherof+/Tm3i3B59W
	yX3D2zL+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0bG-001jsf-Jj; Mon, 29 Mar 2021 22:43:10 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsPx-000hMU-Nd; Mon, 29 Mar 2021 13:59:00 +0000
Received: by mail-oi1-f174.google.com with SMTP id i81so13145047oif.6;
 Mon, 29 Mar 2021 06:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9rC/X74azzjRs0pes0OL8Iit7ird9BMRnDmRA641q6s=;
 b=XBXaZyzLiWOFvEoR3/NXJUZjEN7Kf9iOgkX+tZyvF8k/oO+db23rgNPxFdv2zPrtTx
 pkFCUH0Ky0xx8rdfPjQJXquzM60tPgo/ddJ7FKN6X3Ec/Jl32ndYVtV6c2crBArDAN/Y
 brRqBcVwFHhUIDRjSPMSHLPNUbNfJjmVkXeZf0vVhqdbdaMvM+v8jKn8xNbSiFPxpo59
 N2cAtkFc1J3ztUdh2uG4pxtKg0K74GoHRy05SHBmnWw/amAtZIe7YkOHRA+IWxdt/DLs
 quaIUXu8ER4kG0z10+BgYIpqCo9ml5YNugINYBkbI/8trccZwKs/lUUenENZxbjVvR4y
 OWfw==
X-Gm-Message-State: AOAM530ICRi849l4pC1o68is7FWStVBYKvCaZvtMEnu2iCvyLkQZHdS8
 rzf3CXzk1LpuWNr6X87VNQ==
X-Google-Smtp-Source: ABdhPJxVlDLal90W5oTPDVrZQ7LEnLJ7XkMlsj/bLxyytDHqlctz2hufGT6GQfZKiOBW7lPE6EfWQQ==
X-Received: by 2002:aca:4d8f:: with SMTP id
 a137mr18442952oib.132.1617026322769; 
 Mon, 29 Mar 2021 06:58:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v30sm4430627otb.23.2021.03.29.06.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 06:58:40 -0700 (PDT)
Received: (nullmailer pid 2477089 invoked by uid 1000);
 Mon, 29 Mar 2021 13:58:38 -0000
Date: Mon, 29 Mar 2021 08:58:38 -0500
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
 sean.wang@kernel.org, srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 eddie.huang@mediatek.com, jg_poxu@mediatek.com, biao.huang@mediatek.com,
 hongzhou.yang@mediatek.com, erin.lo@mediatek.com, sean.wang@mediatek.com,
 seiya.wang@mediatek.com, sj.huang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: mt8195: add binding document
Message-ID: <20210329135838.GA2473026@robh.at.kernel.org>
References: <20210329065047.8388-1-zhiyong.tao@mediatek.com>
 <20210329065047.8388-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329065047.8388-3-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_145858_054808_A1710ADD 
X-CRM114-Status: GOOD (  22.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 29, 2021 at 02:50:43PM +0800, Zhiyong Tao wrote:
> The commit adds mt8195 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> new file mode 100644
> index 000000000000..7915b9568c29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8195.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8195 Pin Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +description: |
> +  The Mediatek's Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-pinctrl
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
> +      Physical address base for gpio base registers. There are 8 GPIO
> +      physical address base in mt8195.
> +    maxItems: 8
> +
> +  reg-names:
> +    description: |
> +      Gpio base register names.
> +    maxItems: 8
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

Normally we're doing '-pins$'.

> +    type: object
> +    description: |
> +      A pinctrl node should contain at least one subnodes representing the
> +      pinctrl groups available on the machine. Each subnode will list the
> +      pins it needs, and how they should be configured, with regard to muxer
> +      configuration, pullups, drive strength, input enable/disable and
> +      input schmitt.
> +      An example of using macro:
> +      pincontroller {
> +        /* GPIO0 set as multifunction GPIO0 */
> +        state_0_node_a {

Use the node name pattern defined.

> +          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +        };
> +        /* GPIO1 set as multifunction CLKM1 */
> +        state_0_node_b {
> +          pinmux = <PINMUX_GPIO1__FUNC_CLKM1>;
> +        };
> +      };
> +    $ref: "pinmux-node.yaml"
> +
> +    properties:
> +      pinmux:
> +        description: |
> +          Integer array, represents gpio pin number and mux setting.
> +          Supported pin number and mux varies for different SoCs, and are defined
> +          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> +
> +      drive-strength:
> +        description: |
> +          It can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See
> +          dt-bindings/pinctrl/mt65xx.h. It can only support 2/4/6/8/10/12/14/16mA in mt8195.
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
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
> +    additionalProperties: false
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +            #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> +            pio: pinctrl@10005000 {
> +                    compatible = "mediatek,mt8195-pinctrl";
> +                    reg = <0x10005000 0x1000>,
> +                          <0x11d10000 0x1000>,
> +                          <0x11d30000 0x1000>,
> +                          <0x11d40000 0x1000>,
> +                          <0x11e20000 0x1000>,
> +                          <0x11e20000 0x1000>,
> +                          <0x11eb0000 0x1000>,
> +                          <0x11f40000 0x1000>,
> +                          <0x1000b000 0x1000>;
> +                    reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> +                          "iocfg_br", "iocfg_lm", "iocfg_rb",
> +                          "iocfg_tl", "eint";
> +                    gpio-controller;
> +                    #gpio-cells = <2>;
> +                    gpio-ranges = <&pio 0 0 144>;
> +                    interrupt-controller;
> +                    interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
> +                    #interrupt-cells = <2>;
> +
> +                    pins {
> +                      pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +                      output-low;
> +                    };
> +            };
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
