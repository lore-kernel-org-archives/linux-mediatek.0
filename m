Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD25C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:09:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE20961864
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE20961864
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hrgUL+Uugci4wB4PbNUY25I5nlJikUiGgIjp8T/LsLc=; b=nt7FnizQlZpxTldSJltLc/coB
	N79t2MscIl9RIwEayfyiLZhJhy5Sim5dtKthZeHo+VljhBOJoTg/xmogRg3FjhntfpNJDWvr8XqPC
	ArvvN/dfxOOWqt1/HEkh+AD+Yu197Dg1X0O/IWPgMH2xIleBWDKaaOGDVckJQpa39fyakzyJlpSIR
	sQJSyfZfwg8Ie9fOOPddGx6CpTUEINq3wEy9EGcbUjDMs0MO8p+jIclAUkWrEBeXmKBoM/nYT5F5Q
	qWxFyA2U0sxeSql24SxkoaeMCBfAKfzKaFWK5pctAt6YFUg7nh/Yr2fIqAL4E7gU7nb/BqJ0xh0xQ
	PNwTU6xfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRANP-0039aG-Uh; Tue, 30 Mar 2021 09:09:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRANI-0039ZK-C3; Tue, 30 Mar 2021 09:09:29 +0000
X-UUID: fe1e2fb56bc14bf090fa5b4640729177-20210330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=i1/OIW3DFnVb6T2Bw+aIaM0dlMXr76tD+3aVyI2dypg=; 
 b=Iib4xRStjModyW0BE7h0ghxMTv17LNNds5mBpQ/3q2n7LkcnoUQr9ZVdmN2eX9lRZm/DLCApeB5zIjARSAJ16CgOt0NQek8iuRuHbDVm+H35wxw9Qlms0xUkHWaMDuRj5IgR+jV+kMJ1UP/aRfTEOUXt65nBn0oAdhV3TSlVl1w=;
X-UUID: fe1e2fb56bc14bf090fa5b4640729177-20210330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1245721731; Tue, 30 Mar 2021 01:09:20 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 02:09:19 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Mar 2021 17:09:16 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Mar 2021 17:09:15 +0800
Message-ID: <1617095355.10316.16.camel@mhfsdcap03>
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: mt8195: add binding document
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linus.walleij@linaro.org>, <mark.rutland@arm.com>,
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>,
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <erin.lo@mediatek.com>, <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Date: Tue, 30 Mar 2021 17:09:15 +0800
In-Reply-To: <20210329135838.GA2473026@robh.at.kernel.org>
References: <20210329065047.8388-1-zhiyong.tao@mediatek.com>
 <20210329065047.8388-3-zhiyong.tao@mediatek.com>
 <20210329135838.GA2473026@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3FD66D291D2BC45023DE2CBBCC4D14A9C361AF56CEC22E8C97DE9A5CC461BF122000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_100927_729104_A0FE0751 
X-CRM114-Status: GOOD (  25.25  )
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

On Mon, 2021-03-29 at 08:58 -0500, Rob Herring wrote:
> On Mon, Mar 29, 2021 at 02:50:43PM +0800, Zhiyong Tao wrote:
> > The commit adds mt8195 compatible node in binding document.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
> >  1 file changed, 152 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > new file mode 100644
> > index 000000000000..7915b9568c29
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8195.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT8195 Pin Controller
> > +
> > +maintainers:
> > +  - Sean Wang <sean.wang@mediatek.com>
> > +
> > +description: |
> > +  The Mediatek's Pin controller is used to control SoC pins.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8195-pinctrl
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    description: |
> > +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> > +      the amount of cells must be specified as 2. See the below
> > +      mentioned gpio binding representation for description of particular cells.
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    description: gpio valid number range.
> > +    maxItems: 1
> > +
> > +  reg:
> > +    description: |
> > +      Physical address base for gpio base registers. There are 8 GPIO
> > +      physical address base in mt8195.
> > +    maxItems: 8
> > +
> > +  reg-names:
> > +    description: |
> > +      Gpio base register names.
> > +    maxItems: 8
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +  interrupts:
> > +    description: The interrupt outputs to sysirq.
> > +    maxItems: 1
> > +
> > +#PIN CONFIGURATION NODES
> > +patternProperties:
> > +  '^pins':
> 
> Normally we're doing '-pins$'.

==> Thanks for your suggestion. we will change it in next version.
> 
> > +    type: object
> > +    description: |
> > +      A pinctrl node should contain at least one subnodes representing the
> > +      pinctrl groups available on the machine. Each subnode will list the
> > +      pins it needs, and how they should be configured, with regard to muxer
> > +      configuration, pullups, drive strength, input enable/disable and
> > +      input schmitt.
> > +      An example of using macro:
> > +      pincontroller {
> > +        /* GPIO0 set as multifunction GPIO0 */
> > +        state_0_node_a {
> 
> Use the node name pattern defined.

==> Thanks for your suggestion. we will change it in next version.
> 
> > +          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> > +        };
> > +        /* GPIO1 set as multifunction CLKM1 */
> > +        state_0_node_b {
> > +          pinmux = <PINMUX_GPIO1__FUNC_CLKM1>;
> > +        };
> > +      };
> > +    $ref: "pinmux-node.yaml"
> > +
> > +    properties:
> > +      pinmux:
> > +        description: |
> > +          Integer array, represents gpio pin number and mux setting.
> > +          Supported pin number and mux varies for different SoCs, and are defined
> > +          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> > +
> > +      drive-strength:
> > +        description: |
> > +          It can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See
> > +          dt-bindings/pinctrl/mt65xx.h. It can only support 2/4/6/8/10/12/14/16mA in mt8195.
> > +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> > +
> > +      bias-pull-down: true
> > +
> > +      bias-pull-up: true
> > +
> > +      bias-disable: true
> > +
> > +      output-high: true
> > +
> > +      output-low: true
> > +
> > +      input-enable: true
> > +
> > +      input-disable: true
> > +
> > +      input-schmitt-enable: true
> > +
> > +      input-schmitt-disable: true
> > +
> > +    required:
> > +      - pinmux
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +  - gpio-ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +            #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> > +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +            pio: pinctrl@10005000 {
> > +                    compatible = "mediatek,mt8195-pinctrl";
> > +                    reg = <0x10005000 0x1000>,
> > +                          <0x11d10000 0x1000>,
> > +                          <0x11d30000 0x1000>,
> > +                          <0x11d40000 0x1000>,
> > +                          <0x11e20000 0x1000>,
> > +                          <0x11e20000 0x1000>,
> > +                          <0x11eb0000 0x1000>,
> > +                          <0x11f40000 0x1000>,
> > +                          <0x1000b000 0x1000>;
> > +                    reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> > +                          "iocfg_br", "iocfg_lm", "iocfg_rb",
> > +                          "iocfg_tl", "eint";
> > +                    gpio-controller;
> > +                    #gpio-cells = <2>;
> > +                    gpio-ranges = <&pio 0 0 144>;
> > +                    interrupt-controller;
> > +                    interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                    #interrupt-cells = <2>;
> > +
> > +                    pins {
> > +                      pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> > +                      output-low;
> > +                    };
> > +            };
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
