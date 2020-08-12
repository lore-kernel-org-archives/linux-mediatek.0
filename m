Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEC6C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 19:48:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ED0120781
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 19:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hsE16mn4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ED0120781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RUGfo1Feg5F8RitvFMY4nmtfFcBBXWL35VWfjIX/eR4=; b=hsE16mn4WgoGLgmwWU+77VgxI
	uNni3bfovR6S2p+2FhH0g7h4FvQitDsX2tsyCrBZuIB9YKwQotGbdUe2J1Kv1qChmKPwBsDYwN4NH
	3hRIWENKVv8S55GncCdZ7c9UXlc7FwLmhzj3ZoLGB20G9XULS5+MaHxNrgpJTB1bDILp2IAexQO3e
	3abufUzSfxMmTmp2HwenOZsbckBm3EXsHsk8qT9dttfvjVbHyd5xlgFrgu9hn2XI1Py+luxOSrs9+
	kX31e154po2uOpA/GPuCu+2VPGonRSdM7B7NnMtZo2eHKrFO9LBZgL2vnDA4Vgck+ZHp6I2+TP6X7
	v8knrc7tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5wjE-0006CF-16; Wed, 12 Aug 2020 19:48:04 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5wj8-0006Ao-Mb; Wed, 12 Aug 2020 19:47:59 +0000
Received: by mail-il1-f196.google.com with SMTP id y18so3049685ilp.10;
 Wed, 12 Aug 2020 12:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xl+iy8zYM0BPv+UpGDpwADGR9SiXZB2fIxAe24Tgxt8=;
 b=bAg2T5KIhPROd5NCL+UEp+whd+DzCTrCMcw/CpW/syVQJdVNtV//QsOSThaEZGcO7l
 31zRY7MLkWoqTHQykrDwIcVG34mmOdL+pgM6PkbiAfSzTJWBmOaCixBJ/cwhdsNYqGdh
 rh7EXczNNtmw3BcAmZMPWlugtlPnxUGt4hiPlm4DPMVCRuQKqgWnzaugbS9P1tEPcIuB
 lOUtGkicghK27bR8wSaQ47s3vziBs3C+XADV3iNoLpjL7R08Nxw0V/AgumhnmU4Pj4oH
 EzvubLVdWXojP26LGguj3a1EYdwP7peC/wBWuRVAwkGxTXm/KsdPhp3gknnrqe1x/8a9
 1kww==
X-Gm-Message-State: AOAM532iay7dveC4Nl1aX8yOnUYaBeFE8RtgjXyMRphG3BgAYmKD4Ssi
 Xte2rqw1DfAPhCAZtVmcbw==
X-Google-Smtp-Source: ABdhPJw9tOye4ZcCS+R8VoihyiXoUuSKU/XScBRnVpWr94EG1RJNk/UEmloEmf2stQ4SVU9lKuJZ9w==
X-Received: by 2002:a92:4989:: with SMTP id k9mr1292913ilg.177.1597261677688; 
 Wed, 12 Aug 2020 12:47:57 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id e23sm1465234iot.28.2020.08.12.12.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 12:47:57 -0700 (PDT)
Received: (nullmailer pid 2592074 invoked by uid 1000);
 Wed, 12 Aug 2020 19:47:54 -0000
Date: Wed, 12 Aug 2020 13:47:54 -0600
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200812194754.GA2587643@bogus>
References: <20200807074905.23468-1-zhiyong.tao@mediatek.com>
 <20200807074905.23468-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807074905.23468-3-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_154758_842600_367E2F32 
X-CRM114-Status: GOOD (  22.32  )
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
 sin_jieyang@mediatek.com, hongzhou.yang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sean.wang@mediatek.com, linux-gpio@vger.kernel.org, matthias.bgg@gmail.com,
 eddie.huang@mediatek.com, erin.lo@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 07, 2020 at 03:49:04PM +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml

Don't set execute permission.

> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> new file mode 100755
> index 000000000000..3b46bbfa38ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -0,0 +1,149 @@
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
> +      pincontroller {
> +        /* GPIO0 set as multifunction GPIO0 */
> +        state_0_node_a {
> +          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +        };
> +        /* GPIO1 set as multifunction PWM */
> +        state_0_node_a {
> +          pinmux = <PINMUX_GPIO1__FUNC_PWM_1>;
> +        };
> +      };
> +    properties:
> +      pinmux:
> +        $ref: "pinmux-node.yaml"

This is at the wrong level. Should be under '^pins'.

> +        description: |
> +          Integer array, represents gpio pin number and mux setting.
> +          Supported pin number and mux varies for different SoCs, and are defined
> +          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> +
> +      drive-strength:
> +        description: |
> +          It can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See
> +          dt-bindings/pinctrl/mt65xx.h. It can only support 2/4/6/8/10/12/14/16mA in mt8192.
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
> +    additionalProperties:  false
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
> +            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> +            pio: pinctrl@10005000 {
> +                    compatible = "mediatek,mt8192-pinctrl";
> +                    reg = <0x10005000 0x1000>,
> +                          <0x11c20000 0x1000>,
> +                          <0x11d10000 0x1000>,
> +                          <0x11d30000 0x1000>,
> +                          <0x11d40000 0x1000>,
> +                          <0x11e20000 0x1000>,
> +                          <0x11e70000 0x1000>,
> +                          <0x11ea0000 0x1000>,
> +                          <0x11f20000 0x1000>,
> +                          <0x11f30000 0x1000>,
> +                          <0x1000b000 0x1000>;
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

Would be good to have a pin node here so you can test you've got the 
schema correct.

> +            };
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
