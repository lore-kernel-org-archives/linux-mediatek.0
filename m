Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67359C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 08:39:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E8A221EB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 08:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E8A221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gn+jlNH081rwSjcG+9i4m5RXYHu20xBJsvXPXPerlVs=; b=otG05RWt8HoQdSOMhtciaPTS4
	03sJPT1kE0S+I/1epA2atgnqSKtxV3i9Vw5zRL/3/DApNosJe5gamRzCWQhbB+LkxH1d/dulCXYNY
	SI9njJt0zcqumQYuoY+jDf4SKty4E3qdV/y/stdr7g5N+tFA8O12lLFj5nGrUdiMwxFI2X3Y+MTsB
	ZhuMCNufqyU02n3bS/hz7e/RQ4Mn2lABz/kzamNgndCP7glwY5D7hRs6SepawZp7qWgcMZGKhQ++E
	QkfqgHEIqp4QHqIho/2wJfdcNLQgTs5zoVAUVJL4xGXEakEtPa0HdIzyQt8nlPdHDhRQcSC8swVBy
	Q+S14drLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksM9s-0002lG-6j; Thu, 24 Dec 2020 08:39:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksM9n-0002kQ-36; Thu, 24 Dec 2020 08:39:36 +0000
X-UUID: 96f265c3ac6149d19aaf6f12f1ae5521-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HnNHSUya+E39U9AkaEhIWA7siDKFVrRDx52iOd3sKfA=; 
 b=LNIbmGQWBzdiOCfEH6qlWcAr0j/fnAAYrCIeKx/ycZqVrc377aypnQ3zhl3Sbbd4CHkNBB7bZwhQ1p7o0+J9TLdbrKgmq6pwS152VdVGMPlhN+H87rY3WcFoH3qUEtGF60mKdVyX+QtPMuchwBcHspZeBEXx2TEaSze38KLD1hY=;
X-UUID: 96f265c3ac6149d19aaf6f12f1ae5521-20201224
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 693727070; Thu, 24 Dec 2020 00:39:27 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 00:39:25 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Dec 2020 16:39:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 16:39:09 +0800
Message-ID: <1608799150.7499.15.camel@mhfsdcap03>
Subject: Re: [PATCH v4 09/11] dt-bindings: usb: convert
 mediatek,mtk-xhci.txt to YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 24 Dec 2020 16:39:10 +0800
In-Reply-To: <20201221192329.GA383663@robh.at.kernel.org>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201216093012.24406-9-chunfeng.yun@mediatek.com>
 <20201221192329.GA383663@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B0E7AFE2A7F32C33A0BEE84B97AD5D0B6081D92F6AF66A51A52DB0B396C9C0142000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_033935_354161_A9514C28 
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
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-21 at 12:23 -0700, Rob Herring wrote:
> On Wed, Dec 16, 2020 at 05:30:10PM +0800, Chunfeng Yun wrote:
> > Convert mediatek,mtk-xhci.txt to YAML schema mediatek,mtk-xhci.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v4: update it according to Rob's suggestion
> >   1. modify dictionary of phys
> >   2. fix endentation in "mediatek,syscon-wakeup" items
> >   3. remove reference to usb-hcd.yaml
> > 
> > v3:
> >   1. fix yamllint warning
> >   2. remove pinctrl* properties supported by default suggested by Rob
> >   3. drop unused labels
> >   4. modify description of mediatek,syscon-wakeup
> >   5. remove type of imod-interval-ns
> > 
> > v2: new patch
> > ---
> >  .../bindings/usb/mediatek,mtk-xhci.txt        | 121 -------------
> >  .../bindings/usb/mediatek,mtk-xhci.yaml       | 171 ++++++++++++++++++
> >  2 files changed, 171 insertions(+), 121 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> > deleted file mode 100644
> > index 42d8814f903a..000000000000
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> > +++ /dev/null
[...]
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
> 
> This will need to reference Serge's xhci.yaml instead.
Yes, I forgot it
> 
> > +
> > +description: |
> > +  There are two scenarios:
> > +  case 1: only supports xHCI driver;
> > +  case 2: supports dual-role mode, and the host is based on xHCI driver.
> > +
> > +properties:
> > +  # common properties for both case 1 and case 2
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
> 
> You can drop maxItems, as that is implied by length of 'items'.
Ok, will drop it for the following ones
> 
> > +    items:
> > +      - description: the registers of xHCI MAC
> > +      - description: the registers of IP Port Control
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - const: mac
> > +      - const: ippc  # optional, only needed for case 1.
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
> > +      - const: sys_ck  # required, the following ones are optional
> > +      - const: ref_ck
> > +      - const: mcu_ck
> > +      - const: dma_ck
> > +      - const: xhci_ck
> > +
> > +  phys:
> > +    description: List of at most 5 USB2 PHYs and 4 USB3 PHYs on this HCD
> 
> If it's less, how does one know what each phy is?
The SoC's spec will tell how many phys used, but each project may use
some phys of them, due to not all ports are used for some scenarios.

> 
> > +    minItems: 0
> 
> minItems: 0 is never correct. That's phys not being present.
Ok, will modify it.

But it's useful for the case that the phy is an external sub-board, and
can works without initialization. (FPGA env.)

> 
> > +    maxItems: 9
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
> > +    description:
> > +      Interrupt moderation interval value, it is 8 times as much as that
> > +      defined in the xHCI spec on MTK's controller.
> > +    default: 5000
> > +
> > +  # the following properties are only used for case 1
> > +  wakeup-source:
> > +    description: enable USB remote wakeup, see power/wakeup-source.txt
> > +    type: boolean
> > +
> > +  mediatek,syscon-wakeup:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> > +    description:
> > +      A phandle to syscon used to access the register of the USB wakeup glue
> > +      layer between xHCI and SPM, the field should always be 3 cells long.
> > +    items:
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
> 
> [a-f]+ doesn't cover all possible node names. Just '@[0-9a-f]+$', though 
> I assume you have some max number of ports less than 16?
Yes, in fact, less than 6, will limit the allowed length

> 
> > +    type: object
> > +    description: The hard wired USB devices.
> 
> This needs to reference usb-device.yaml. Or usb-hcd.yaml does and 
> then this isn't needed.
usb-hcd.yaml aready does

Thanks a lot
>  It depends if child nodes of USB host controller 
> are always USB devices or not. Serge?
> 
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
> > +    usb@11270000 {
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
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
