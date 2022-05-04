Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF0DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIp0rvp31OZBzRXqwqaQvNHs4AmNdIDvCUpRBpXqG2I=; b=znsq+a7ezyABH3
	ALkqEHWl1Nz5zeCX+lgqqZH9qw+taidZt9N2EYosS2t3H6w96d70MfeNLGITd7kLXf56Y00Q8Zs/R
	6Bo3CuIQRwaJMo6k+bfK2vxWZJUIZ7H1YSarHHry3D4bT/qctGl3aCZoN43Z5ZckfcV8MhxmzL6Il
	1fUZSc+9Z+SuZVmqmojgzwjX9pMVJsGO8JMgOdDI/BsLDKpTtKhmIutFXbW/Y8nHUcmkiS5RO/JTJ
	UaZyuAnOPbt1iUy0/JzfXGmBkDxYjt01MReN1kC2+SPNDhRCtDBu2l5+xmkQ+8Lt8WzTDaLB0Is0E
	xZ9vZNBIDKdRfKxbvGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmAB9-009RbS-2A; Wed, 04 May 2022 08:16:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmAB5-009Ra6-92; Wed, 04 May 2022 08:16:09 +0000
X-UUID: f6d367478ba54d9eb3160ad140123d5d-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:80ceee6a-d40b-46b1-9d76-feea6b1cbdb0, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:92b471c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f6d367478ba54d9eb3160ad140123d5d-20220504
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 940170773; Wed, 04 May 2022 01:16:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 01:15:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 16:15:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 May 2022 16:15:53 +0800
Message-ID: <003b87fabbedc776d74c0a542dc3ae5bcb0bbdf2.camel@mediatek.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <krzysztof.kozlowski+dt@linaro.org>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 4 May 2022 16:15:53 +0800
In-Reply-To: <YnFt5vL+6uVioqsf@robh.at.kernel.org>
References: <20220428133753.8348-1-rex-bc.chen@mediatek.com>
 <20220428133753.8348-2-rex-bc.chen@mediatek.com>
 <YnFt5vL+6uVioqsf@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_011607_350684_D13E0461 
X-CRM114-Status: GOOD (  28.58  )
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

On Tue, 2022-05-03 at 13:01 -0500, Rob Herring wrote:
> On Thu, Apr 28, 2022 at 09:37:50PM +0800, Rex-BC Chen wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dsi.txt         |  62 ---------
> >  .../display/mediatek/mediatek,dsi.yaml        | 122
> > ++++++++++++++++++
> >  2 files changed, 122 insertions(+), 62 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> > l
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > deleted file mode 100644
> > index 36b01458f45c..000000000000
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.t
> > xt
> > +++ /dev/null
> > @@ -1,62 +0,0 @@
> > -Mediatek DSI Device
> > -===================
> > -
> > -The Mediatek DSI function block is a sink of the display subsystem
> > and can
> > -drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized
> > for dual-
> > -channel output.
> > -
> > -Required properties:
> > -- compatible: "mediatek,<chip>-dsi"
> > -- the supported chips are mt2701, mt7623, mt8167, mt8173 and
> > mt8183.
> > -- reg: Physical base address and length of the controller's
> > registers
> > -- interrupts: The interrupt signal from the function block.
> > -- clocks: device clocks
> > -  See Documentation/devicetree/bindings/clock/clock-bindings.txt
> > for details.
> > -- clock-names: must contain "engine", "digital", and "hs"
> > -- phys: phandle link to the MIPI D-PHY controller.
> > -- phy-names: must contain "dphy"
> > -- port: Output port node with endpoint definitions as described in
> > -  Documentation/devicetree/bindings/graph.txt. This port should be
> > connected
> > -  to the input port of an attached DSI panel or DSI-to-eDP encoder
> > chip.
> > -
> > -Optional properties:
> > -- resets: list of phandle + reset specifier pair, as described in
> > [1].
> > -
> > -[1] Documentation/devicetree/bindings/reset/reset.txt
> > -
> > -MIPI TX Configuration Module
> > -============================
> > -
> > -See phy/mediatek,dsi-phy.yaml
> > -
> > -Example:
> > -
> > -mipi_tx0: mipi-dphy@10215000 {
> > -	compatible = "mediatek,mt8173-mipi-tx";
> > -	reg = <0 0x10215000 0 0x1000>;
> > -	clocks = <&clk26m>;
> > -	clock-output-names = "mipi_tx0_pll";
> > -	#clock-cells = <0>;
> > -	#phy-cells = <0>;
> > -	drive-strength-microamp = <4600>;
> > -	nvmem-cells= <&mipi_tx_calibration>;
> > -	nvmem-cell-names = "calibration-data";
> > -};
> > -
> > -dsi0: dsi@1401b000 {
> > -	compatible = "mediatek,mt8173-dsi";
> > -	reg = <0 0x1401b000 0 0x1000>;
> > -	interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
> > -	clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
> > -		 <&mipi_tx0>;
> > -	clock-names = "engine", "digital", "hs";
> > -	resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
> > -	phys = <&mipi_tx0>;
> > -	phy-names = "dphy";
> > -
> > -	port {
> > -		dsi0_out: endpoint {
> > -			remote-endpoint = <&panel_in>;
> > -		};
> > -	};
> > -};
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > new file mode 100644
> > index 000000000000..2ca9229ef69e
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.y
> > aml
> > @@ -0,0 +1,122 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml*__;Iw!!CTRNKA9wMg0ARbw!w60__6oza0dggkQt6zWF-ZnYUKobclO7i3x9kiS1CETGQlCVcifs6UfqytY8vunKIJlM$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!w60__6oza0dggkQt6zWF-ZnYUKobclO7i3x9kiS1CETGQlCVcifs6UfqytY8vns85I56$
> >  
> > +
> > +title: MediaTek DSI Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +  - Jitao Shi <jitao.shi@mediatek.com>
> > +  - Xinlei Lee <xinlei.lee@mediatek.com>
> > +
> > +description: |
> > +  The MediaTek DSI function block is a sink of the display
> > subsystem and can
> > +  drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized
> > for dual-
> > +  channel output.
> > +
> > +allOf:
> > +  - $ref: /schemas/display/dsi-controller.yaml#
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
> 
> 1 blank line
> 
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 2
> 
> Did you try adding these? Because they are wrong and will contradict 
> dsi-controller.yaml.
> 

Hello Rob,

Sorry, I response something wrong in previous letter.
We could have sub nodes in mediatek dsi.
But we do not need to define this:
  "#address-cells":
    const: 2

  "#size-cells":
    const: 2

I will drop them. Thanks!

BRs,
Rex

> Rob


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
