Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19124C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 09:22:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEBB323A7F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 09:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEBB323A7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F7Sqg+wxv+pRKG/0H8LQjIvMnpLWdNhT2cTrZg7uS1E=; b=nVTilFErXPixxUSlqe6p332q3
	VQ1L0C+STSrQtzdpdZWWaNtmvmu0I4FpuWzQTqiJDHw3azdt1Dk1LOuLYLqAgYWjgEWVV8AUJITGA
	2k+9diatCMRj+nWFG3CEQ2dlclboNHUTuiAruZqYaF5nuaFL6OOMEs5O6Av3DWTlDJVBIJnVSbxYi
	91OCaLx3rOdkIDGICmGibjupjqpeh4P5gvQN3V7RjloZpoE90jwAxI7VH7wDP1gIenz3Zva6e8u+6
	jXxTSaR+ZEPURMDpttBLBIdHcWKxni+3YLrMUGl7YOwQA6E6LJ1DUkrXUbaWP7tjcmGU+b/WrEExu
	YuBUazMFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmZBw-0008VO-Nb; Tue, 08 Dec 2020 09:21:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmZBv-0008UH-CA; Tue, 08 Dec 2020 09:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=cULiqlWoL37xRZzHcBhAg0U9sWJYWEdozEvDASKEWxQ=; b=RPj8Z8V8uox6EA/D4NlCURG9Al
 7pXdPynwhsQ/1RgUJT5auk6CDxoIGAVWZhw0Rl0lVGyKGO54ijJHE3TaYeGEu04Fzt0nOE87nO/Et
 GyLSlaKrGLSooPDR8U6d6cs2SkKCogX+HY/BxAxPL+OXo14mD083mvThQUOa9Q2LSimWaEVkfGDU1
 pQr4jVWaoX2c6JfQs4EG52t0gTWkdPlI9GNIPQJklHEG9GUlwjzbk9R0oxeG8b80pZaxNRHMK1WJ9
 iBvsqXaCqY0JE5nLfZNeaR8EImv2Dww245xR5lRL8M1g9wBxt/PB78sAYdk3ZWuDcsERAE2OpKO+5
 rwU+xBfw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmZ2W-0008DG-44; Tue, 08 Dec 2020 09:12:14 +0000
X-UUID: aafe24b1aee24493825625a8a61fec6f-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cULiqlWoL37xRZzHcBhAg0U9sWJYWEdozEvDASKEWxQ=; 
 b=Sr5RcYgXKMnQ/tBY5BfY8Fx93D3oXG4gM7piSonUw1MATqulFal5c6gdpciCzvKk7bw+wwOGg3iC5+E1vqkktO3HxvsptPYf1JAoktgSCWqtcsXwgx3B5WQ52vezbj0i/DRugQd81Ga2x0wmMeQ5mtEQmxi3gvH1syYMZytmCYI=;
X-UUID: aafe24b1aee24493825625a8a61fec6f-20201208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1705686180; Tue, 08 Dec 2020 01:11:55 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 01:11:53 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Dec 2020 17:11:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Dec 2020 17:11:46 +0800
Message-ID: <1607418707.23328.13.camel@mhfsdcap03>
Subject: Re: [PATCH v3 09/11] dt-bindings: usb: convert
 mediatek,mtk-xhci.txt to YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 8 Dec 2020 17:11:47 +0800
In-Reply-To: <20201207212436.GA844756@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-9-chunfeng.yun@mediatek.com>
 <20201207212436.GA844756@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 165E650B2B563F9B27267EB1C08846DD6F14A21BD51068867FB00394F43FA29A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_091209_461848_EE0BA21F 
X-CRM114-Status: GOOD (  34.65  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min
 Guo <min.guo@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, David
 Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-07 at 15:24 -0600, Rob Herring wrote:
> On Wed, Nov 18, 2020 at 04:21:24PM +0800, Chunfeng Yun wrote:
> > Convert mediatek,mtk-xhci.txt to YAML schema mediatek,mtk-xhci.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
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
[...]
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > new file mode 100644
> > index 000000000000..4a36ad5c4d25
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > @@ -0,0 +1,171 @@
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
> > +    $ref: /usb/usb-hcd.yaml#
> 
> That's not right.
> 
> You need 'items' and list each entry.
Will add minItems/maxItems instead due to it's variable and phy-names is
not used

> 
> > +    description: List of all the USB PHYs on this HCD
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
> > +    description: |
> > +      A phandle to syscon used to access the register of the USB wakeup glue
> > +      layer between xHCI and SPM, the field should always be 3 cells long.
> > +
> > +      items:
> 
> Indentation is wrong here. Should be 2 fewer spaces.
Will fix it
> 
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
> 
> This $ref isn't right. You already referenced it at the top.
Will drop it

Thank you

> 
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
