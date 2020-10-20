Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17443C43467
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 02:40:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FB52244C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 02:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QK+wM/Dd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k73eDhOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FB52244C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yW1t8j5nZhGlh3oLmnI4TfpD6eyAnZrKc9CSF+yefbo=; b=QK+wM/Dd9CM3JW/qL6civEwcq
	7vCmQOTQwMnFHknyQVuPbl7ErTG79Fd5CEqnr8hnNuL0AYFqHU8IBZKnhXk5HPJUhrCBAOEPg/7hY
	A99zKos+PFYaB79y4w+VJntgc24cAil1yuxBmRlDLHU0Xqk4G/JTlEfENKHRYFWI9xv//gTu/eR8a
	dwYIujCWn/wB+nKoahsANbVnAlF40Oq/BEbzr3KncDMXTcilV2quDyHp1SVVuD/d0LoImtM/EzCks
	cHUbvHpCQN+sVIN7VZUxmiJZ44mxp+AZHesHfjzpvyPnK3LB+Xyebovv02IM1r2FHno1ELBVaxlnf
	YZbDWfkxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUhZW-0003ld-8F; Tue, 20 Oct 2020 02:40:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUhZS-0003kp-AM; Tue, 20 Oct 2020 02:40:19 +0000
X-UUID: a97a923d8e9b4c98b77634bcc7959da0-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9qdaSxV26zZu3QrywMo2JZVF3/nZ2dvuX52dR6NpWeI=; 
 b=k73eDhOuIws2pqVkxx6EvpKCO3pm7LBEg/1L9rUBQeL83/SXby8aC6vIxf+kV4RWMYGIQLNw+0MUUF+FyCc7s+U4UQZXuTGACpLw+upemREOYfsxeAIyabMgKfxtKVFzWeOq7i3cGDLQEHISu/o3DE+GYRy4Ic7AjdI3vxuBfTo=;
X-UUID: a97a923d8e9b4c98b77634bcc7959da0-20201019
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1664119035; Mon, 19 Oct 2020 18:40:15 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 19:40:12 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Oct 2020 10:40:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Oct 2020 10:40:09 +0800
Message-ID: <1603161609.29336.146.camel@mhfsdcap03>
Subject: Re: [PATCH v2 6/8] dt-bindings: usb: convert mediatek,mtk-xhci.txt
 to YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 20 Oct 2020 10:40:09 +0800
In-Reply-To: <20201016171433.GA1585924@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-6-chunfeng.yun@mediatek.com>
 <20201016171433.GA1585924@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 34B521366DE8A616231CE0BCC44138238C9955C08BE4B4D6C2C353042FDD209B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_224018_624152_0EA22A86 
X-CRM114-Status: GOOD (  33.41  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, CK
 Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-16 at 12:14 -0500, Rob Herring wrote:
> On Tue, Oct 13, 2020 at 04:52:05PM +0800, Chunfeng Yun wrote:
> > Convert mediatek,mtk-xhci.txt to YAML schema mediatek,mtk-xhci.yaml
> > 
> 
> There's some refactoring of usb-hcd.yaml and XHCI schema under review 
> and this may need some refactoring on top of it.
Ok, will do it 
> 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: new patch
> > ---
> >  .../bindings/usb/mediatek,mtk-xhci.txt        | 121 ------------
> >  .../bindings/usb/mediatek,mtk-xhci.yaml       | 180 ++++++++++++++++++
> >  2 files changed, 180 insertions(+), 121 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> 
> 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > new file mode 100644
> > index 000000000000..ea696c8f1269
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > @@ -0,0 +1,180 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek USB3 xHCI Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> > +
> > +allOf:
> > +  - $ref: "usb-hcd.yaml"
> > +
> > +description: |
> > +  There are two scenarios:
> > +  case 1: only supports xHCI driver;
> > +  case 2: supports dual-role mode, and the host is based on xHCI driver.
> > +
> > +properties:
> > +  #common properties for both case 1 and case 2
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt2712-xhci
> > +          - mediatek,mt7622-xhci
> > +          - mediatek,mt7629-xhci
> > +          - mediatek,mt8173-xhci
> > +          - mediatek,mt8183-xhci
> > +      - const: mediatek,mtk-xhci
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - description: the registers of xHCI MAC
> > +      - description: the registers of IP Port Control
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - const: mac
> > +      - const: ippc  #optional, only needed for case 1.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    description: A phandle to USB power domain node to control USB's MTCMOS
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 5
> > +    items:
> > +      - description: Controller clock used by normal mode
> > +      - description: Reference clock used by low power mode etc
> > +      - description: Mcu bus clock for register access
> > +      - description: DMA bus clock for data transfer
> > +      - description: controller clock
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 5
> > +    items:
> > +      - const: sys_ck  #required, the following ones are optional
> > +      - const: ref_ck
> > +      - const: mcu_ck
> > +      - const: dma_ck
> > +      - const: xhci_ck
> > +
> > +  phys:
> > +    $ref: /usb/usb-hcd.yaml#
> 
> That doesn't look right...
No need refer to it again?

usb-hcd.yaml describes how to use phys/phy-names

> 
> > +
> > +  vusb33-supply:
> > +    description: Regulator of USB AVDD3.3v
> > +
> > +  vbus-supply:
> > +    description: Regulator of USB VBUS5v
> > +
> > +  usb3-lpm-capable:
> > +    description: supports USB3.0 LPM
> > +    type: boolean
> > +
> > +  imod-interval-ns:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Interrupt moderation interval value, it is 8 times as much as that
> > +      defined in the xHCI spec on MTK's controller.
> > +    default: 5000
> > +
> > +  #the following properties are only used for case 1
> > +  pinctrl-0:
> > +    description: A phandle to the default pinctrl state.
> > +
> > +  pinctrl-names:
> > +    description: A pinctrl state named "default" must be defined.
> > +      See pinctrl/pinctrl-bindings.txt
> > +    const: default
> 
> Don't need pinctrl-* properties. They are always allowed.
Ok
> 
> > +
> > +  wakeup-source:
> > +    description: enable USB remote wakeup, see power/wakeup-source.txt
> > +    type: boolean
> > +
> > +  mediatek,syscon-wakeup:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> > +    description: |
> > +      A phandle to syscon used to access the register of the USB wakeup glue
> > +      layer between xHCI and SPM, the field should always be a multiple of
> > +      3 cells long.
> 
> A multiple of 3?
Seems wrong, only support one, will modify it
>  How would there be more than 3 cells?
others will be ignored

> 
> > +
> > +      items:
> > +        - description:
> > +            The first cell represents a phandle to syscon
> > +        - description:
> > +            The second cell represents the register base address of the glue
> > +            layer in syscon
> > +        - description:
> > +            The third cell represents the hardware version of the glue layer,
> > +            1 is used by mt8173 etc, 2 is used by mt2712 etc
> > +          enum: [1, 2]
> > +
> > +  mediatek,u3p-dis-msk:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The mask to disable u3ports, bit0 for u3port0,
> > +      bit1 for u3port1, ... etc
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^[a-f]+@[0-9a-f]+$":
> > +    $ref: /usb/usb-hcd.yaml#
> > +    type: object
> > +    description: The hard wired USB devices.
> > +
> > +dependencies:
> > +  wakeup-source: [ 'mediatek,syscon-wakeup' ]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    #include <dt-bindings/power/mt8173-power.h>
> > +
> > +    usb3: usb@11270000 {
> > +        compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
> > +        reg = <0x11270000 0x1000>, <0x11280700 0x0100>;
> > +        reg-names = "mac", "ippc";
> > +        interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> > +        power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> > +        clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
> > +        clock-names = "sys_ck", "ref_ck";
> > +        phys = <&u3port0 PHY_TYPE_USB3>, <&u2port1 PHY_TYPE_USB2>;
> > +        vusb33-supply = <&mt6397_vusb_reg>;
> > +        vbus-supply = <&usb_p1_vbus>;
> > +        imod-interval-ns = <10000>;
> > +        mediatek,syscon-wakeup = <&pericfg 0x400 1>;
> > +        wakeup-source;
> > +        usb3-lpm-capable;
> > +    };
> > +...
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
