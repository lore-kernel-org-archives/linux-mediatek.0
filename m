Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E07C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 05:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bq9Z35vReNtECq+GH0rNs2pNpxZV/tVO3W1NRLxjvfg=; b=aSUEuLkqfwVbGp
	6FBJIX4uKTljkicaw1l3dAt91/d3PyiNuuGlj2+/5OisuyCIoeA390hLNkX/ZNP2Ql7JYc+mTXrgx
	Zpih/IIBaMxkNIvnFF1YrgJ4jO4Ckk2x1KLfwAV2khIloe4H114YTxtotWyqMHwEmREh4KvzhXRH1
	u5IkRaWiOYBbUQAUsmvuaDWpt2bqK1J2gsTD+IbsoYh76vbJwzw0AdAgA6Q42O+0u3A1LJ2/Rw33a
	NOtTkbP5692jxfAuYSlbcZmJLN1SiYa3R9272SmE2SpvNWcp3J8Ugi2Q51x16Zi9/YhtesXpmywiA
	8f9ks/VcArcuQYNzQppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBsJo-002Ke6-51; Mon, 24 Jan 2022 05:55:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBsJc-002KbD-AR; Mon, 24 Jan 2022 05:54:57 +0000
X-UUID: 83c47a248689488aaf4b1377417e6af8-20220123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Q92NSRxELwrIQCewHx9oHDqMGUij+FDrUK4zL/C/zmg=; 
 b=NPUfe3Q3mmFKwMzpw2Mw/KPzE3qTvEAD5yv7qnWMLC3xKsq2+1jZPi7IdQXeD9YvN8u8Xvx20VZge2XILGYzaCaGWS6m3Gy2ZNX5W9K5aLnCGIgQtSz5xf09isM4jH3rMa4+FPntkCTO1TYPfFLMf8RcmIujXgVhRxOmTarNyBU=;
X-UUID: 83c47a248689488aaf4b1377417e6af8-20220123
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1253524739; Sun, 23 Jan 2022 22:54:53 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 Jan 2022 21:54:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 24 Jan 2022 13:54:50 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 Jan 2022 13:54:49 +0800
Message-ID: <5b8f822da1dbb7e0d204d6eeccd9cd80b3ef004c.camel@mediatek.com>
Subject: Re: [PATCH V2 2/3] dt-bindings: spi: Convert spi-mt65xx to json-schema
From: Leilk Liu <leilk.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 24 Jan 2022 13:54:49 +0800
In-Reply-To: <YetWXSzugRwKb+xA@robh.at.kernel.org>
References: <20220112103609.17421-1-leilk.liu@mediatek.com>
 <20220112103609.17421-3-leilk.liu@mediatek.com>
 <YetWXSzugRwKb+xA@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_215456_396029_D5EDCEAC 
X-CRM114-Status: GOOD (  20.25  )
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

On Fri, 2022-01-21 at 18:57 -0600, Rob Herring wrote:
> On Wed, Jan 12, 2022 at 06:36:08PM +0800, Leilk Liu wrote:
> > Convert Mediatek ARM SOC's SPI Master controller binding
> > to json-schema format.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >  .../bindings/spi/mediatek,spi-mt65xx.yaml     | 99
> > +++++++++++++++++++
> >  .../devicetree/bindings/spi/spi-mt65xx.txt    | 68 -------------
> >  2 files changed, 99 insertions(+), 68 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/spi/spi-
> > mt65xx.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > new file mode 100644
> > index 000000000000..71f0cf6e5d70
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-
> > mt65xx.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SPI Bus controller for MediaTek ARM SoCs
> > +
> > +maintainers:
> > +  - Leilk Liu <leilk.liu@mediatek.com>
> > +
> > +allOf:
> > +  - $ref: /spi/spi-controller.yaml#
> 
> /schemas/spi/spi-controller.yaml#
> 
OK, I'll fix it.

> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt7629-spi
> > +          - const: mediatek,mt7622-spi
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8516-spi
> > +          - const: mediatek,mt2712-spi
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt6779-spi
> > +              - mediatek,mt8192-spi
> > +              - mediatek,mt8195-spi
> > +          - const: mediatek,mt6765-spi
> > +      - const: mediatek,mt2701-spi
> > +      - const: mediatek,mt2712-spi
> > +      - const: mediatek,mt6589-spi
> > +      - const: mediatek,mt6765-spi
> > +      - const: mediatek,mt6893-spi
> > +      - const: mediatek,mt7622-spi
> > +      - const: mediatek,mt8135-spi
> > +      - const: mediatek,mt8173-spi
> > +      - const: mediatek,mt8183-spi
> 
> All these can be 1 enum.
> 
OK, I'll fix it.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: clock used for the parent clock
> > +      - description: clock used for the muxes clock
> > +      - description: clock used for the clock gate
> > +
> > +  clock-names:
> > +    items:
> > +      - const: parent-clk
> > +      - const: sel-clk
> > +      - const: spi-clk
> > +
> > +  mediatek,pad-select:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    maxItems: 4
> > +    items:
> > +      enum: [0, 1, 2, 3]
> > +    description:
> > +      specify which pins group(ck/mi/mo/cs) spi controller used.
> > +      This is an array.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    spi@1100a000 {
> > +      compatible = "mediatek,mt8173-spi";
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      reg = <0x1100a000 0x1000>;
> > +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
> > +      clocks = <&topckgen CLK_TOP_SYSPLL3_D2>,
> > +               <&topckgen CLK_TOP_SPI_SEL>,
> > +               <&pericfg CLK_PERI_SPI0>;
> > +      clock-names = "parent-clk", "sel-clk", "spi-clk";
> > +      cs-gpios = <&pio 105 GPIO_ACTIVE_LOW>, <&pio 72
> > GPIO_ACTIVE_LOW>;
> > +      mediatek,pad-select = <1>, <0>;
> > +    };
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
