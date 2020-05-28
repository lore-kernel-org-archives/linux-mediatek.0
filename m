Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E1DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 11:51:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7FD82075F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 11:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KoxhIiEq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OEagUgwR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7FD82075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hen1eZIINDHPftCJav4AFLVlCIAhlzJkSN7MCdzhIaE=; b=KoxhIiEq9G3HK+
	cohUIlWd7w6auSdWwD0nAu33exG+8Er1dejVVzyF8bRscsT2HQxNAkJ7c3UvgYJUkFoDUmaTZqjZg
	oRSXyt4U52ZhUBSJwpLJGVK0G5xWlqJNc6eFFloppZugR9JAlZrMmu7MsAFh6GKKEnrTFEyjIKVKz
	5Y6jps3AGIHNNCFyUNseXtpuvGkALKNM3ESpmLYyTKpfjUcE+hOsUY0I1eiOjZk7oGV87cG+hYliP
	PsDSxkImbB0sSAhAOMB22/06wkTvzoiS++tINjVPCbQfA6ezKyG6MjJXvm0eBHqIB67Zl/3IyagPH
	6BbB48pVzvqjUtnjghWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeH4g-0007fO-3b; Thu, 28 May 2020 11:51:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeH4d-0007en-7R
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 11:51:49 +0000
X-UUID: 20ee22a341a1452da6218b3338439684-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YVrqE+b0jJL6qq2mzSiCunvxXu5L2fN/bU2r03efkZU=; 
 b=OEagUgwR9LYPAf2kJYXJgskfgLQF1He6YXgSlgGuwNN+iLvnuKDRlSymrpKIQOEElmcN/dBu4lEvoBl4HLxddkQoEp0kKGdNqh9f6iY5nxNj+mX4MhBdsXkWTVilimlCJ/T+m4SvWogQEbS+nO4uJjhEWxyyUaAvebMDbLxu4s0=;
X-UUID: 20ee22a341a1452da6218b3338439684-20200528
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1491124790; Thu, 28 May 2020 03:51:36 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 04:51:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 19:51:34 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 19:51:34 +0800
Message-ID: <1590666697.4266.3.camel@mtkswgap22>
Subject: Re: [PATCH v5 1/6] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
From: Hanks Chen <hanks.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Thu, 28 May 2020 19:51:37 +0800
In-Reply-To: <CAL_Jsq+Znnk=L=ztTyVrs4i0tiN0TrWwcaujAm_Lp1wd9pWiZQ@mail.gmail.com>
References: <1585128694-13881-1-git-send-email-hanks.chen@mediatek.com>
 <1585128694-13881-2-git-send-email-hanks.chen@mediatek.com>
 <CAL_Jsq+Znnk=L=ztTyVrs4i0tiN0TrWwcaujAm_Lp1wd9pWiZQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 76EFB800843570EE696089F86D3EED9F62273D2F798FACA43FE04CE2DBF5199F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_045147_284687_D93EEDD9 
X-CRM114-Status: GOOD (  22.56  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream <wsd_upstream@mediatek.com>, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-03-26 at 11:43 -0600, Rob Herring wrote:
> On Wed, Mar 25, 2020 at 3:31 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
> >
> > From: Andy Teng <andy.teng@mediatek.com>
> >
> > Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> >
> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> > ---
> >  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  208 ++++++++++++++++++++
> >  1 file changed, 208 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 
> The header belongs in this patch so that 'make dt_binding_check' works.
> 
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> > new file mode 100644
> > index 0000000..5f9bbf1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> > @@ -0,0 +1,208 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
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
> > +
> > +  reg-names:
> > +    description: |
> > +      GPIO base register names.
> 
> Need to define what the names are and the order.

Got it, I'll add it in next version.
Thanks

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
> > +    minItems: 1
> > +    maxItems: 4
> 
> Need to define what the interrupts are.
> 
Got it, I'll add it in the next version.
Thanks.

> > +    description: |
> > +      The interrupt outputs to sysirq.
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
> > +  '^pins*$':
> 
> '-pins$' would be preferred.
> 

Got it, I'll fix it in next version.
Thanks.

> > +    type: object
> > +    description: |
> > +      A pinctrl node should contain at least one subnodes representing the
> > +      pinctrl groups available on the machine. Each subnode will list the
> > +      pins it needs, and how they should be configured, with regard to muxer
> > +      configuration, pullups, drive strength, input enable/disable and input schmitt.
> > +
> > +    properties:
> > +      pinmux:
> 
> There's a common schema for all these properties. You need to
> reference it (with $ref) and only define which properties you are
> using and any additional constraints.
> 
Got it, thx!

> > +        description:
> > +          integer array, represents gpio pin number and mux setting.
> > +          Supported pin number and mux varies for different SoCs, and are defined
> > +          as macros in boot/dts/<soc>-pinfunc.h directly.
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +      bias-disable:
> > +        type: boolean
> > +
> > +      bias-pull-up:
> > +        oneOf:
> > +          - type: boolean
> > +          - $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +      bias-pull-down:
> > +        oneOf:
> > +          - type: boolean
> > +          - $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +      input-enable:
> > +        type: boolean
> > +
> > +      input-disable:
> > +        type: boolean
> > +
> > +      output-low:
> > +        type: boolean
> > +
> > +      output-high:
> > +        type: boolean
> > +
> > +      input-schmitt-enable:
> > +        type: boolean
> > +
> > +      input-schmitt-disable:
> > +        type: boolean
> > +
> > +      mediatek,pull-up-adv:
> > +        description: |
> > +          Pull up setings for 2 pull resistors, R0 and R1. User can
> > +          configure those special pins. Valid arguments are described as below:
> > +          0: (R1, R0) = (0, 0) which means R1 disabled and R0 disable.
> > +          1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> > +          2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> > +          3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32
> > +          - enum: [0, 1, 2, 3]
> > +
> > +      mediatek,pull-down-adv:
> > +        description: |
> > +          Pull down settings for 2 pull resistors, R0 and R1. User can
> > +          configure those special pins. Valid arguments are described as below:
> > +          0: (R1, R0) = (0, 0) which means R1 disabled and R0 disable.
> > +          1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> > +          2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> > +          3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32
> > +          - enum: [0, 1, 2, 3]
> > +
> > +      drive-strength:
> > +        description: |
> > +          Selects the drive strength for the specified pins in mA.
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32
> > +          - enum: [2, 4, 6, 8, 10, 12, 14, 16]
> > +
> > +    required:
> > +      - pinmux
> 
> Add:
> 
>     additionalProperties: false
> 
> additionalProperties: false
> 

Got it, I'll add it, thx!

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
> > +        mmc0_pins_default: mmc0default {
> > +            pins_cmd_dat {
> 
> The 2 levels of nodes here doesn't match your schema.
> 
> Also, don't use '_' in node names.
> 

I'll fix it in next version, thx!

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
> > +            pins_clk {
> > +                pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
> > +                mediatek,pull-down-adv = <2>;
> > +            };
> > +            pins_rst {
> > +                pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
> > +                mediatek,pull-up-adv = <0>;
> > +            };
> > +        };
> > +
> > +        mmc0 {
> > +          pinctrl-0 = <&mmc0_pins_default>;
> > +          pinctrl-names = "default";
> > +        };
> > +    };
> > +
> > --
> > 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
