Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEB6C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 02:41:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCD922D37
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 02:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X0bqqGma";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cOliDlZa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADCD922D37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a3QfmbXDokbQH97KvklsWm4Vpf/IyT1gfMx1YscKsMU=; b=X0bqqGmarIoz6O+9hEk+YiLQX
	1EONHFJWaoH/HB43WzLnOp+TwQ/pG+CxTNl4yeq5pR8p426DN3CsTKK9ilwDhh45foVAMvp+aBUa/
	k0WCD2/j7yQQ6H+6TTH9oxhlpT4XCFHKa+RaKK0ui9T/KxcqPng+6ie4UFxRg0DApL93Z6NCw+gyN
	4/Cyd28+qAwXR9KczqtUyBUjKVzwzkzWq6I4yVMxhR/edp1qkXohTrinP5DS4DALw1jOw7Z7ng5Z7
	313xionf+ln6NZtPr21MDxmMlV220a75p6yVZULnEunaDq+PpXBYlPeGa3MShkYy8sasyW/3IaL1z
	QH7bKj9dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6m8W-0001AB-5T; Sat, 15 Aug 2020 02:41:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6m8S-00019j-Jp; Sat, 15 Aug 2020 02:41:34 +0000
X-UUID: be1c2a8859a442019e424fc0076d7df5-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nttGr41YCKBYUrysH48V36mWDFJrpg2eIEaLBXTnkCk=; 
 b=cOliDlZareW1kYDyTG5PfyZMDkKI/GD9LNGJTMUpzaoyss2w0AYGYxKKXtXnjFzWvSG+H4Y4Flacz8qabHzRsNzpA5xJIW/dQqZZHQDAo5Ia8FBdVyAyOmoztF8ElHiO+0GkzGEf3VAxzX8WXY58cSc5G6AEfJmKAcCXsfHM5c0=;
X-UUID: be1c2a8859a442019e424fc0076d7df5-20200814
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 260252904; Fri, 14 Aug 2020 18:41:25 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 19:31:21 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 15 Aug 2020 10:31:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 15 Aug 2020 10:31:18 +0800
Message-ID: <1597458618.25591.4.camel@mhfsdcap03>
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: mt8192: add binding document
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Sat, 15 Aug 2020 10:30:18 +0800
In-Reply-To: <20200812194754.GA2587643@bogus>
References: <20200807074905.23468-1-zhiyong.tao@mediatek.com>
 <20200807074905.23468-3-zhiyong.tao@mediatek.com>
 <20200812194754.GA2587643@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BF560CB03BDBC8D7BE9BBF3B24F554186E71B74FF91E47135E2A884A9A4CDBA92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_224132_910263_4A0F7DC7 
X-CRM114-Status: GOOD (  26.66  )
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

On Wed, 2020-08-12 at 13:47 -0600, Rob Herring wrote:
> On Fri, Aug 07, 2020 at 03:49:04PM +0800, Zhiyong Tao wrote:
> > The commit adds mt8192 compatible node in binding document.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 149 ++++++++++++++++++
> >  1 file changed, 149 insertions(+)
> >  create mode 100755 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> 
> Don't set execute permission.
> 
Dear Rob,
Thanks for your suggestion.
I will change it in v4.

> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> > new file mode 100755
> > index 000000000000..3b46bbfa38ec
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> > @@ -0,0 +1,149 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8192.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT8192 Pin Controller
> > +
> > +maintainers:
> > +  - Sean Wang <sean.wang@mediatek.com>
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
> > +      Physical address base for gpio base registers. There are 11 GPIO
> > +      physical address base in mt8192.
> > +    maxItems: 11
> > +
> > +  reg-names:
> > +    description: |
> > +      Gpio base register names.
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
> > +  '^pins':
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
> > +          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> > +        };
> > +        /* GPIO1 set as multifunction PWM */
> > +        state_0_node_a {
> > +          pinmux = <PINMUX_GPIO1__FUNC_PWM_1>;
> > +        };
> > +      };
> > +    properties:
> > +      pinmux:
> > +        $ref: "pinmux-node.yaml"
> 
> This is at the wrong level. Should be under '^pins'.

==> I will change it in v4.
> 
> > +        description: |
> > +          Integer array, represents gpio pin number and mux setting.
> > +          Supported pin number and mux varies for different SoCs, and are defined
> > +          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> > +
> > +      drive-strength:
> > +        description: |
> > +          It can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See
> > +          dt-bindings/pinctrl/mt65xx.h. It can only support 2/4/6/8/10/12/14/16mA in mt8192.
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
> > +    additionalProperties:  false
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
> > +            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> > +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +            pio: pinctrl@10005000 {
> > +                    compatible = "mediatek,mt8192-pinctrl";
> > +                    reg = <0x10005000 0x1000>,
> > +                          <0x11c20000 0x1000>,
> > +                          <0x11d10000 0x1000>,
> > +                          <0x11d30000 0x1000>,
> > +                          <0x11d40000 0x1000>,
> > +                          <0x11e20000 0x1000>,
> > +                          <0x11e70000 0x1000>,
> > +                          <0x11ea0000 0x1000>,
> > +                          <0x11f20000 0x1000>,
> > +                          <0x11f30000 0x1000>,
> > +                          <0x1000b000 0x1000>;
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
> 
> Would be good to have a pin node here so you can test you've got the 
> schema correct.

==> I will add a pin node here in v4.
> 
> > +            };
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
