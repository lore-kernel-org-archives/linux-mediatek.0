Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ABCC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 08:58:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16D021775
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 08:58:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PUNLPKf+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DofieDZT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16D021775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7CfSGkdfHv1FYoSkHb7QMDP9vDHo593rJWlFlvUpwE4=; b=PUNLPKf+RCutve/oAfNLav6sC
	3BCZhRjA8bbkjX7RtT4bbUzCSk3nuE0NiY2g5IHR1azOErn/yByo60KTC5LIpUPg49acXQhz6x5ay
	yaJEZMmj+L+e0pmApPTWxs2fYEHyxM/bJP/jiwEtrK0/Bd9OyLRbbE4PD05MLVaW94wPDQZJVHhUR
	ryTwXj4Qf1FmtwuG1z94aVvm8/S5vlB3ShMOriNoYH7my0ZluE9qMwM044shsyAJp6FZfvrMTk0wz
	wQ7LOHqGMgrPq27KZc3P2i5OBWHVjUTeKacE4P0vyVtnAHogLT7dZAfCUaUNYMtSjqtTL4RPVLl3Q
	CFni9c33A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxRcR-00088z-6P; Mon, 20 Jul 2020 08:57:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxRcL-00085E-E0; Mon, 20 Jul 2020 08:57:52 +0000
X-UUID: d3a104a1ff334eda8443ac1eb7a022f3-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MgNXdrzLeZE2YRJkMefGfmgrOOh55MjevNByUTR3tz8=; 
 b=DofieDZTFgFaGzmem3I0uQ6hOy4UDcPk21YRjPL/VoXnOW6BtMr0gWlwqOsnfBPnMvtgpnjMM1kql+Xj9IQYShBDGgev+1QZRZDJ+zmTJGlk6wzOrtvvQ5kN+3fJDEvU7hGgapl113PjvzO7HQwGNGW9CiWYd2kidvWhQP1PuQo=;
X-UUID: d3a104a1ff334eda8443ac1eb7a022f3-20200720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 785971077; Mon, 20 Jul 2020 00:58:16 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 01:47:40 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 20 Jul 2020 16:47:38 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 16:47:36 +0800
Message-ID: <1595234796.31296.24.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: mt8192: add binding document
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 20 Jul 2020 16:46:36 +0800
In-Reply-To: <20200710163905.GA2761779@bogus>
References: <20200710072717.3056-1-zhiyong.tao@mediatek.com>
 <20200710072717.3056-3-zhiyong.tao@mediatek.com>
 <20200710163905.GA2761779@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C74FCEDDFB4A3DAD584B2CF8ED17201D8E787AFD0D5D90C5D5FE2BDB1EE1530A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_045749_771440_D60F7A63 
X-CRM114-Status: GOOD (  33.58  )
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

On Fri, 2020-07-10 at 10:39 -0600, Rob Herring wrote:
> On Fri, Jul 10, 2020 at 03:27:16PM +0800, Zhiyong Tao wrote:
> > The commit adds mt8192 compatible node in binding document.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 170 ++++++++++++++++++
> >  1 file changed, 170 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> > new file mode 100644
> > index 000000000000..c698b7f65950
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> > @@ -0,0 +1,170 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8192.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT8192 Pin Controller
> > +
> > +maintainers:
> > +  - Linus Walleij <linus.walleij@linaro.org>
> 
> Should be someone who knows the h/w (Mediatek).
> 
==> 
Dear Rob,

Thanks for your suggestion.
we will change it in v2.
> > +
> > +description: |
> > +  The Mediatek's Pin controller is used to control SoC pins.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8192-pinctrl
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    description:
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
> > +    description:
> > +      Physical address base for gpio base registers. There are 11 GPIO
> > +      physical address base in mt8192.
> > +    maxItems: 11
> > +
> > +  reg-names:
> > +    description:
> > +      Gpio base register names. There are 11 gpio base register names in mt8192.
> > +      They are "iocfg0", "iocfg_rm", "iocfg_bm", "iocfg_bl", "iocfg_br",
> > +      "iocfg_lm", "iocfg_lb", "iocfg_rt", "iocfg_lt", "iocfg_tl", "eint".
> 
> Should be a schema.
==>ok, we will retain the description "Gpio base register names.", The
other description will be removed. Is it ok?
> 
> > +    maxItems: 11
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
> > +  subnode format:
> 
> The child node name is 'subnode format'?
> 
No, 'subnode format' is not child name. It is used to describe the
subnode format. so we should remove it?
> > +    description:
> > +      A pinctrl node should contain at least one subnodes representing the
> > +      pinctrl groups available on the machine. Each subnode will list the
> > +      pins it needs, and how they should be configured, with regard to muxer
> > +      configuration, pullups, drive strength, input enable/disable and
> > +      input schmitt.
> > +
> > +      node {
> > +        pinmux = <PIN_NUMBER_PINMUX>;
> > +        GENERIC_PINCONFIG;
> > +      };
> 
> If you want to preserve formatting, description needs a literal block 
> notation on the end ('|').
==>ok, we will change it in v2. we will add ('|') after "description:"
in v2.
> 
> > +  '-pinmux$':
> > +    description:
> > +      Integer array, represents gpio pin number and mux setting.
> > +      Supported pin number and mux varies for different SoCs, and are defined
> > +      as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> > +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> > +
> > +  GENERIC_PINCONFIG:
> 
> You just defined a property called 'GENERIC_PINCONFIG'..
==> yes, it is. But we add all property description in the
GENERIC_PINCONFIG.
> .
> 
> > +    description:
> > +      It is the generic pinconfig options to use, bias-disable,
> > +      bias-pull-down, bias-pull-up, input-enable, input-disable, output-low,
> > +      output-high, input-schmitt-enable, input-schmitt-disable
> > +      and drive-strength are valid.
> > +
> > +      Some special pins have extra pull up strength, there are R0 and R1 pull-up
> > +      resistors available, but for user, it's only need to set R1R0 as 00, 01,
> > +      10 or 11. So It needs config "mediatek,pull-up-adv" or
> > +      "mediatek,pull-down-adv" to support arguments for those special pins.
> > +      Valid arguments are from 0 to 3.
> > +
> > +      We can use "mediatek,tdsel" which is an integer describing the steps for
> > +      output level shifter duty cycle when asserted (high pulse width adjustment).
> > +      Valid arguments  are from 0 to 15.
> > +      We can use "mediatek,rdsel" which is an integer describing the steps for
> > +      input level shifter duty cycle when asserted (high pulse width adjustment).
> > +      Valid arguments are from 0 to 63.
> > +
> > +      When config drive-strength, it can support some arguments, such as
> > +      MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See dt-bindings/pinctrl/mt65xx.h.
> > +      It can only support 2/4/6/8/10/12/14/16mA in mt8192.
> > +      For I2C pins, there are existing generic driving setup and the specific
> > +      driving setup. I2C pins can only support 2/4/6/8/10/12/14/16mA driving
> > +      adjustment in generic driving setup. But in specific driving setup,
> > +      they can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
> > +      driving setup for I2C pins, the existing generic driving setup will be
> > +      disabled. For some special features, we need the I2C pins specific
> > +      driving setup. The specific driving setup is controlled by E1E0EN.
> > +      So we need add extra vendor driving preperty instead of
> > +      the generic driving property.
> > +      We can add "mediatek,drive-strength-adv = <XXX>;" to describe the specific
> > +      driving setup property. "XXX" means the value of E1E0EN. EN is 0 or 1.
> > +      It is used to enable or disable the specific driving setup.
> > +      E1E0 is used to describe the detail strength specification of the I2C pin.
> > +      When E1=0/E0=0, the strength is 0.125mA.
> > +      When E1=0/E0=1, the strength is 0.25mA.
> > +      When E1=1/E0=0, the strength is 0.5mA.
> > +      When E1=1/E0=1, the strength is 1mA.
> > +      So the valid arguments of "mediatek,drive-strength-adv" are from 0 to 7.
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
> > +examples:
> > +  - |
> > +            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> > +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +            pio: pinctrl@10005000 {
> 
> Drop unused labels.
==> we will change it in v2.
> 
> > +                    compatible = "mediatek,mt8192-pinctrl";
> > +                    reg = <0 0x10005000 0 0x1000>,
> > +                          <0 0x11c20000 0 0x1000>,
> > +                          <0 0x11d10000 0 0x1000>,
> > +                          <0 0x11d30000 0 0x1000>,
> > +                          <0 0x11d40000 0 0x1000>,
> > +                          <0 0x11e20000 0 0x1000>,
> > +                          <0 0x11e70000 0 0x1000>,
> > +                          <0 0x11ea0000 0 0x1000>,
> > +                          <0 0x11f20000 0 0x1000>,
> > +                          <0 0x11f30000 0 0x1000>,
> > +                          <0 0x1000b000 0 0x1000>;
> > +                    reg-names = "iocfg0", "iocfg_rm", "iocfg_bm",
> > +                          "iocfg_bl", "iocfg_br", "iocfg_lm",
> > +                          "iocfg_lb", "iocfg_rt", "iocfg_lt",
> > +                          "iocfg_tl", "eint";
> > +                    gpio-controller;
> > +                    #gpio-cells = <2>;
> > +                    gpio-ranges = <&pio 0 0 220>;
> > +                    interrupt-controller;
> > +                    interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                    #interrupt-cells = <2>;
> > +                    i2c0_pins_a: i2c0 {
> 
> Doesn't match the schema.
> 
> > +                        pins {
> 
> Doesn't match the schema. Why do you need 2 levels of nodes here?
==> Is  The 2 levels of nodes "i2c0" and "I2c1"? we just list them as
example. Because pinmux and gpio setting property are called when other
modules is registered. For example, when we add the
description"pinctrl-names = "default"; pinctrl-0 = <&i2c0_pins_a>;" in
i2c0 node. it will above property setting when i2c0 is register.
Do you mean that we don't need add them here? If it is. We will remove
"i2c0" and "I2c1"  property setting in v2.
> 
> > +                                pinmux = <PINMUX_GPIO118__FUNC_SCL1>,
> > +                                         <PINMUX_GPIO119__FUNC_SDA1>;
> > +                                mediatek,pull-up-adv = <3>;
> > +                                mediatek,drive-strength-adv = <7>;
> > +                        };
> > +                    };
> > +                    i2c1_pins_a: i2c1 {
> > +                        pins {
> > +                                pinmux = <PINMUX_GPIO141__FUNC_SCL2>,
> > +                                         <PINMUX_GPIO142__FUNC_SDA2>;
> > +                                mediatek,pull-down-adv = <2>;
> > +                                mediatek,drive-strength-adv = <4>;
> > +                       };
> > +                   };
> > +            };
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
