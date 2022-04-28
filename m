Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B8AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d00BBEZWDvN0K0AD+ltjoggZiWI6hPbhtFLzbNWMPuQ=; b=lqeQLgT2tjSsvD
	Bf5KUXN4Y4Bcj7TUs4BZ+Oak3wODaTYDXEvYWzIsuvguKqug7UkJz/LMwUmvG2DgM/SHVR1F9zJzL
	E3kKymS5nzC4+iYsQfFIGYoFhT/isDTSJukBhbafdK8jtHzgcqz4rjBtaJpNwtw7sc4n7dNj2BlcB
	4iJHIlvyWpjtPTuD8je5Vsw7mbtUzpmtYqvQ7ncK8R9n1DYIZWIs5nSt0JilndVK3mo8vvX+M67OM
	2+VmyjstyhdcYVRkpDaJkqXXRt9Yc8DFXz/QCqNr06hyBryhgZI0r/3cz0qYfTKDMP97D1dO5qMa0
	Xu1+VHllFUBeAvyQr0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk3av-006tAO-Pt; Thu, 28 Apr 2022 12:50:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk3as-006t8U-2V; Thu, 28 Apr 2022 12:50:04 +0000
X-UUID: 433d0dcf3ff84610a55fff9c4e711f89-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:553a9010-196d-4d8c-91c9-675ba9b561f9, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:c265d5c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 433d0dcf3ff84610a55fff9c4e711f89-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1438633993; Thu, 28 Apr 2022 05:49:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 05:49:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 28 Apr 2022 20:49:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 20:49:56 +0800
Message-ID: <18b4bfa2980625f10f574f23e278abd0499f113c.camel@mediatek.com>
Subject: Re: [PATCH v4,1/3] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, <xinlei.lee@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <airlied@linux.ie>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 28 Apr 2022 20:49:54 +0800
In-Reply-To: <Ylc+ph5OFzQ/YR3k@robh.at.kernel.org>
References: <1649495514-25746-1-git-send-email-xinlei.lee@mediatek.com>
 <1649495514-25746-2-git-send-email-xinlei.lee@mediatek.com>
 <Ylc+ph5OFzQ/YR3k@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_055002_187549_22AE7204 
X-CRM114-Status: GOOD (  23.75  )
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

On Wed, 2022-04-13 at 16:20 -0500, Rob Herring wrote:
> On Sat, Apr 09, 2022 at 05:11:52PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
> >  .../display/mediatek/mediatek,dsi.yaml        | 118
> > ++++++++++++++++++
> >  2 files changed, 118 insertions(+), 62 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> > l
> 
> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > new file mode 100644
> > index 000000000000..431bb981394f
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek DSI Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - CK Hu <ck.hu@mediatek.com>
> > +  - Jitao Shi <jitao.shi@mediatek.com>
> > +  - Xinlei Lee <xinlei.lee@mediatek.com>
> > +
> > +description: |
> > +  The MediaTek DSI function block is a sink of the display
> > subsystem and can
> > +  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized
> > for dual-
> > +  channel output.
> 
> allOf:
>   - $ref: /schemas/display/dsi-controller.yaml#
> 

Hello Rob,

Thanks for your review.

I will help Xinlei to push next version.
I will add this in next version.

> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt2701-dsi
> > +      - mediatek,mt7623-dsi
> > +      - mediatek,mt8167-dsi
> > +      - mediatek,mt8173-dsi
> > +      - mediatek,mt8183-dsi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Engine Clock
> > +      - description: Digital Clock
> > +      - description: HS Clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: engine
> > +      - const: digital
> > +      - const: hs
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dphy
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description:
> > +      Output port node. This port should be connected to the input
> > +      port of an attached DSI panel or DSI-to-eDP encoder chip.
> > +
> > +
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - power-domains
> > +  - clocks
> > +  - clock-names
> > +  - phys
> > +  - phy-names
> > +  - port
> > +
> > +additionalProperties: false
> 
> with the above,
> 
> unevaluatedProperties: false
> 

OK, I will modify additionalProperties to unevaluatedProperties in next
version.

BRs,
Rex
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/mt8183-power.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    #include <dt-bindings/reset/mt8183-resets.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        dsi0: dsi@14014000 {
> > +            compatible = "mediatek,mt8183-dsi";
> > +            reg = <0 0x14014000 0 0x1000>;
> > +            interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_LOW>;
> > +            power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +            clocks = <&mmsys CLK_MM_DSI0_MM>,
> > +                <&mmsys CLK_MM_DSI0_IF>,
> > +                <&mipi_tx0>;
> > +            clock-names = "engine", "digital", "hs";
> > +            resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
> > +            phys = <&mipi_tx0>;
> > +            phy-names = "dphy";
> > +            port {
> > +                dsi0_out: endpoint {
> > +                    remote-endpoint = <&panel_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.18.0
> > 
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
