Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 02:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVrVMlBSuTzq7hSVbiAiMH6lnCilkomPM2WiXd+85U0=; b=VIE7Z8eJJbqyAV
	mu/eCFVOYs5H4eUuvReJWIrBaHQDCxHEnqkrXyMtlYiAABBqg9Te0Df1Cvjv1ZL5XVXx8vFNNJWmD
	LnFiPmojuteKRUcp1o8IyNoWWA4qPDMbe7IWYKD/Txe9V6rShIiFFm5ii5Sq69TGMrmxtCA852UUA
	vHvcIOc+tLvymPPCng7A13n0SfRWoV7JgNU/1caOew72SlwWNIjJJ0xvrq1pxc2ZLm6CsQiQXYXcs
	9tbdDn08BHeYpmQvjJAmMD5A6QMgw+1ZBOqCepChH8lKh/Cx/Yvc8gLE7HRVMaWuB6j5hHT0oU4Fp
	y2ZL61+MLkCm/XUh5HAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzUXB-005FYj-8Y; Fri, 10 Jun 2022 02:38:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzUX0-005FWq-CI; Fri, 10 Jun 2022 02:37:52 +0000
X-UUID: 5d6d2e6fc51c4519a7d241a875a131c4-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:eabce628-3db0-4602-ba5d-7231a7411d6d,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:2a19b09,CLOUDID:3792de7e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 5d6d2e6fc51c4519a7d241a875a131c4-20220609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1523947273; Thu, 09 Jun 2022 19:37:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 19:27:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 10 Jun 2022 10:27:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 10 Jun 2022 10:27:41 +0800
Message-ID: <602b51beaa91390ea3f4a0a6e47623708283d255.camel@mediatek.com>
Subject: Re: [PATCH v10 02/21] dt-bindings: mediatek,dp: Add Display Port
 binding
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Guillaume Ranquet
	<granquet@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Vinod
 Koul" <vkoul@kernel.org>, Helge Deller <deller@gmx.de>, CK Hu
	<ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>
Date: Fri, 10 Jun 2022 10:27:41 +0800
In-Reply-To: <1998a59df3b27fbeb0ca7945925e47336977bcd5.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-3-granquet@baylibre.com>
	 <1998a59df3b27fbeb0ca7945925e47336977bcd5.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_193750_457692_BEA010D6 
X-CRM114-Status: GOOD (  24.83  )
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

On Tue, 2022-05-24 at 11:35 +0800, Chunfeng Yun wrote:
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This controller is present on several mediatek hardware. Currently
> > mt8195 and mt8395 have this controller without a functional
> > difference,
> > so only one compatible field is added.
> > 
> > The controller can have two forms, as a normal display port and as
> > an
> > embedded display port.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  .../display/mediatek/mediatek,dp.yaml         | 99
> > +++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > new file mode 100644
> > index 000000000000..36ae0a6df299
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > ml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek Display Port Controller
> > +
> > +maintainers:
> > +  - CK Hu <ck.hu@mediatek.com>
> > +  - Jitao shi <jitao.shi@mediatek.com>
> > +
> > +description: |
> > +  Device tree bindings for the MediaTek (embedded) Display Port
> > controller
> > +  present on some MediaTek SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8195-dp-tx
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: faxi clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: faxi
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input endpoint of the controller, usually
> > dp_intf
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output endpoint of the controller
> > +
> > +  max-lanes:
> > +    maxItems: 1
> > +    description: maximum number of lanes supported by the hardware
> > +
> > +  max-linkrate:
> > +    maxItems: 1
> > +    description: maximum link rate supported by the hardware
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - ports
> > +  - max-lanes
> > +  - max-linkrate
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +    edp_tx: edp_tx@1c500000 {
> 
> 'edp_tx: ' can be removed
> 

Hello Chunfeng,

ok, I will drop it.

> > +        compatible = "mediatek,mt8195-dp-tx";
> > +        reg = <0 0x1c500000 0 0x8000>;
> 
> reg = <0x1c500000 0x8000>;
> #address-cells, #size-cells are both 1 by default
> 

I will use "eg = <0x1c500000 0x8000>;" in binding example.

BRs,
Bo-Chen

> > +        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&edp_pin>;
> > +        max-lanes = /bits/ 8 <4>;
> > +        max-linkrate = /bits/ 8 <0x1e>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                edp_in: endpoint {
> > +                    remote-endpoint = <&dp_intf0_out>;
> > +                };
> > +            };
> > +            port@1 {
> > +                reg = <1>;
> > +                edp_out: endpoint {
> > +                	remote-endpoint = <&panel_in>;
> > +                };
> > +            };
> > +        };
> > +    };


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
