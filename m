Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD71C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:05:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E941206B6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:05:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FQnhpUcD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RCJyDoqG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E941206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Eqe2bbbreCMfBSlnmIE6aObG8yttRkH+2S4N4CK8VA8=; b=FQnhpUcDBHquxaEDfCI7wRUqS
	l2WvpQRdaqnvJrFk+jOzWUD1szfnx6XN7sdUOZueXPaghXeCO2MsQsxFYEDF6inXa85Uk0b+yAobu
	XiMvtWPq/x5m3wmbOCr81kF+qcRKPFa0DVP5TitvT+OFsC/MZ3i/KyrXdsWB/4r/jabZW6yK2ySiq
	vixL4WlbBGLh98XWoIliJ6YQLHthfuTmIeLTU2iHa+LNnRjbOCw0OV4M/gZLqzTe90uAjcX/pGaLY
	9VLqjzKsVSdwlzhl2oCPuOntMkOdB/g++dGeF3dvUMO8BcUUQ5ZPxaRXXPatzYbMR5KuYf632UzGL
	PNuPm2eig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jslPw-0002Tv-3x; Tue, 07 Jul 2020 11:05:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jslPs-0002Sa-MJ; Tue, 07 Jul 2020 11:05:38 +0000
X-UUID: a5644fb74971437b83d78ec8040aa0ba-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LWaWjCAmYSDm6EVyk8ZEeu1IXl/ypYzoAr5V3QmAW+A=; 
 b=RCJyDoqGEdg2gu72xrE2JbIzhUvm0qSJplvyOk72cN+krW9K0+L8GaIJbCuyY0hDHlVhC1fuQh/AwMOyRkT3qDzjkZUFXjJhPSAoGZVW6mFFmpctLy0wxiLBouB7bbn4q8GVjUeZf7d2kJY/D56+05MYTTk/YHIidkJRGgUlkLM=;
X-UUID: a5644fb74971437b83d78ec8040aa0ba-20200707
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1563931511; Tue, 07 Jul 2020 03:05:16 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 04:05:21 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 19:05:14 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 19:05:15 +0800
Message-ID: <1594119917.20610.2.camel@mtkswgap22>
Subject: Re: [PATCH v7 2/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
From: Hanks Chen <hanks.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 7 Jul 2020 19:05:17 +0800
In-Reply-To: <20200702205852.GA1675491@bogus>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
 <1593694630-26604-4-git-send-email-hanks.chen@mediatek.com>
 <20200702205852.GA1675491@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_070536_937716_BEC767EE 
X-CRM114-Status: GOOD (  27.81  )
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
 mtk01761 <wendell.lin@mediatek.com>, Michael
 Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-02 at 14:58 -0600, Rob Herring wrote:
> On Thu, Jul 02, 2020 at 08:57:05PM +0800, Hanks Chen wrote:
> > From: Andy Teng <andy.teng@mediatek.com>
> > 
> > Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> > 
> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> > ---
> >  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  210 ++++++++++++++++++++
> >  1 file changed, 210 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> > new file mode 100644
> > index 0000000..3a9fc4d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> > @@ -0,0 +1,210 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml*__;Iw!!CTRNKA9wMg0ARbw!0474C4nwnSzS27r76why4qthf5712hrWflC57fdhSU7LzHZYpD7W0t5ZhJBgmnpF-A$ 
> > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!0474C4nwnSzS27r76why4qthf5712hrWflC57fdhSU7LzHZYpD7W0t5ZhJAzv-fiRw$ 
> > +
> > +title: Mediatek MT6779 Pin Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Andy Teng <andy.teng@mediatek.com>
> > +
> > +description: |+
> > +  The pin controller node should be the child of a syscon node with the
> > +  required property:
> > +  - compatible: "syscon"
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6779-pinctrl
> > +
> > +  reg:
> > +    minItems: 9
> > +    maxItems: 9
> > +    description: |
> > +      physical address base for gpio-related control registers.
> 
> Need to describe what each entry is.
> 
> items:
>   - description: ...
>   - description: ...
>   - description: ...
> 

Got it, I'll add description in next version.
Thanks!

> > +
> > +  reg-names:
> > +    description: |
> > +      GPIO base register names. The names are "gpio", "iocfg_rm",
> > +      "iocfg_br", "iocfg_lm", "iocfg_lb", "iocfg_rt", "iocfg_lt",
> > +      "iocfg_tl", "eint";
> 
> The names should be a schema.
> 
Got it, I'll fix it.
> 
> > +
> > +  gpio-controller: true
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +    description: |
> > +      Number of cells in GPIO specifier. Since the generic GPIO
> > +      binding is used, the amount of cells must be specified as 2. See the below
> > +      mentioned gpio binding representation for description of particular cells.
> > +
> > +  gpio-ranges:
> > +    minItems: 1
> > +    maxItems: 5
> > +    description: |
> > +      GPIO valid number range.
> > +
> > +  interrupt-controller: true
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: |
> > +      Specifies the summary IRQ.
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - gpio-ranges
> > +  - interrupt-controller
> > +  - interrupts
> > +  - "#interrupt-cells"
> > +
> > +patternProperties:
> > +  '-[0-9]*$':
> > +    type: object
> > +    patternProperties:
> > +      '-pins*$':
> > +        type: object
> > +        description: |
> > +          A pinctrl node should contain at least one subnodes representing the
> > +          pinctrl groups available on the machine. Each subnode will list the
> > +          pins it needs, and how they should be configured, with regard to muxer
> > +          configuration, pullups, drive strength, input enable/disable and input schmitt.
> 
> Need to include the pinconf schema here.

Got it, I'll add it in next version.
> 
> > +
> > +        properties:
> > +          pinmux:
> > +            description:
> > +              integer array, represents gpio pin number and mux setting.
> > +              Supported pin number and mux varies for different SoCs, and are defined
> > +              as macros in boot/dts/<soc>-pinfunc.h directly.
> > +
> > +          bias-disable:
> > +            type: boolean
> 
> Don't redefine the type. Just indicate what common properties are used:
> 
> bias-disable: true

Got it, I'll fix it in next version.
> 
> > +
> > +          bias-pull-up:
> > +            type: boolean
> > +
> > +          bias-pull-down:
> > +            type: boolean
> > +
> > +          input-enable:
> > +            type: boolean
> > +
> > +          input-disable:
> > +            type: boolean
> > +
> > +          output-low:
> > +            type: boolean
> > +
> > +          output-high:
> > +            type: boolean
> > +
> > +          input-schmitt-enable:
> > +            type: boolean
> > +
> > +          input-schmitt-disable:
> > +            type: boolean
> > +
> > +          mediatek,pull-up-adv:
> > +            description: |
> > +              Pull up setings for 2 pull resistors, R0 and R1. User can
> > +              configure those special pins. Valid arguments are described as below:
> > +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> > +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> > +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> > +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> > +            allOf:
> 
> You can drop the allOf now.

Got it, I'll drop it in next version.
Thanks

> 
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > +              - enum: [0, 1, 2, 3]
> > +
> > +          mediatek,pull-down-adv:
> > +            description: |
> > +              Pull down settings for 2 pull resistors, R0 and R1. User can
> > +              configure those special pins. Valid arguments are described as below:
> > +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> > +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> > +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> > +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > +              - enum: [0, 1, 2, 3]
> > +
> > +          drive-strength:
> > +            description: |
> > +              Selects the drive strength for the specified pins in mA.
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > +              - enum: [2, 4, 6, 8, 10, 12, 14, 16]
> > +
> > +        required:
> > +          - pinmux
> > +
> > +        additionalProperties: false
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/pinctrl/mt6779-pinfunc.h>
> > +
> > +    pio: pinctrl@10005000 {
> > +        compatible = "mediatek,mt6779-pinctrl";
> > +        reg = <0 0x10005000 0 0x1000>,
> > +            <0 0x11c20000 0 0x1000>,
> > +            <0 0x11d10000 0 0x1000>,
> > +            <0 0x11e20000 0 0x1000>,
> > +            <0 0x11e70000 0 0x1000>,
> > +            <0 0x11ea0000 0 0x1000>,
> > +            <0 0x11f20000 0 0x1000>,
> > +            <0 0x11f30000 0 0x1000>,
> > +            <0 0x1000b000 0 0x1000>;
> > +        reg-names = "gpio", "iocfg_rm",
> > +          "iocfg_br", "iocfg_lm",
> > +          "iocfg_lb", "iocfg_rt",
> > +          "iocfg_lt", "iocfg_tl",
> > +          "eint";
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +        gpio-ranges = <&pio 0 0 210>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +        interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        mmc0_pins_default: mmc0-0 {
> > +            cmd-dat-pins {
> > +                pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
> > +                    <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
> > +                    <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
> > +                    <PINMUX_GPIO177__FUNC_MSDC0_DAT3>,
> > +                    <PINMUX_GPIO170__FUNC_MSDC0_DAT4>,
> > +                    <PINMUX_GPIO173__FUNC_MSDC0_DAT5>,
> > +                    <PINMUX_GPIO171__FUNC_MSDC0_DAT6>,
> > +                    <PINMUX_GPIO174__FUNC_MSDC0_DAT7>,
> > +                    <PINMUX_GPIO167__FUNC_MSDC0_CMD>;
> > +                input-enable;
> > +                mediatek,pull-up-adv = <1>;
> > +            };
> > +            clk-pins {
> > +                pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
> > +                mediatek,pull-down-adv = <2>;
> > +            };
> > +            rst-pins {
> > +                pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
> > +                mediatek,pull-up-adv = <0>;
> > +            };
> > +        };
> > +    };
> > +
> > +    mmc0 {
> > +       pinctrl-0 = <&mmc0_pins_default>;
> > +       pinctrl-names = "default";
> > +    };
> > -- 
> > 1.7.9.5
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!0474C4nwnSzS27r76why4qthf5712hrWflC57fdhSU7LzHZYpD7W0t5ZhJDOADfrzw$ 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
