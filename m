Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5800AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+ZKDxRDOYRVIm0uqfslCNDeGvV+cNiW695qk8o0D1w=; b=Rdu8iPvNVJZ/WMVSRTE0FmWnlE
	DvW1O0N1alR6dE/Jt8z2v0KDDXlXNGLTW09Rj9khJmRRQtRtwLwe3cvR2Y94OLVZXcf+oQJ1bOt/2
	lVlyDKT0T4m07xrplox1pKcXrWOgsxvUENO1/Y4zfRH3RAkkK7jlp9bPc/Wk3tV3a1V2ml0P6WTk/
	N8HCzIUBXcW2NvDLIO4NxoBXb2E8lkq0ybhstP53sbGj5aa/emJukYgh5hyTrfLNbbM4e0N2DGm2d
	AcRIYzcmzeJGLy36bj9Es+/yTpDTF5WCjTvUxjQrvYu1RIIMow2GSR/ilXXajzrvBCU9x5nZg6OOI
	ExoWrr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGNY-00AgBj-6z; Tue, 26 Jul 2022 08:57:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGNV-00Ag4v-22; Tue, 26 Jul 2022 08:57:22 +0000
X-UUID: c36e24292c714fb5924c1d3a53a2767d-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:c8a4b932-5917-44af-be95-849be73ee7d5,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:0f94e32,CLOUDID:09990dee-db04-4499-9fdf-04ef44b9468c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c36e24292c714fb5924c1d3a53a2767d-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 521181011; Tue, 26 Jul 2022 01:57:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 16:46:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 26 Jul 2022 16:46:40 +0800
Message-ID: <38f785af2815e45d175f02d9970e3401e700a645.camel@mediatek.com>
Subject: Re: [PATCH v14 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<liangxu.xu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 26 Jul 2022 16:46:40 +0800
In-Reply-To: <ef407d8767d12d240280f1c9d9fdd8ba9d3e5632.camel@mediatek.com>
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
	 <20220712111223.13080-2-rex-bc.chen@mediatek.com>
	 <0e1d4cef6b7e72813300eb9be5650066166ac763.camel@mediatek.com>
	 <ef407d8767d12d240280f1c9d9fdd8ba9d3e5632.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_015721_120384_2C2EB237 
X-CRM114-Status: GOOD (  31.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-07-26 at 14:18 +0800, Rex-BC Chen wrote:
> On Wed, 2022-07-13 at 15:56 +0800, CK Hu wrote:
> > Hi, Bo-Chen:
> > 
> > On Tue, 2022-07-12 at 19:12 +0800, Bo-Chen Chen wrote:
> > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > 
> > > This controller is present on several mediatek hardware.
> > > Currently
> > > mt8195 and mt8395 have this controller without a functional
> > > difference,
> > > so only one compatible field is added.
> > > 
> > > The controller can have two forms, as a normal display port and
> > > as
> > > an
> > > embedded display port.
> > > 
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >  .../display/mediatek/mediatek,dp.yaml         | 115
> > > ++++++++++++++++++
> > >  1 file changed, 115 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > > ml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.
> > > ya
> > > ml
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.
> > > ya
> > > ml
> > > new file mode 100644
> > > index 000000000000..e2d6cb314297
> > > --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.
> > > ya
> > > ml
> > > @@ -0,0 +1,115 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MediaTek Display Port Controller
> > > +
> > > +maintainers:
> > > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > +  - Jitao shi <jitao.shi@mediatek.com>
> > > +
> > > +description: |
> > > +  Device tree bindings for the MediaTek display port TX (DP) and
> > > +  embedded display port TX (eDP) controller present on some
> > > MediaTek
> > > SoCs.
> > > +  MediaTek DP and eDP are different hardwares and they have
> > > different
> > > +  base address for registers, so we need two different
> > > compatibles
> > > to
> > > +  separate them.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8195-dp-tx
> > > +      - mediatek,mt8195-edp-tx
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  nvmem-cells:
> > > +    maxItems: 1
> > > +    description: efuse data for display port calibration
> > > +
> > > +  nvmem-cell-names:
> > > +    const: dp_calibration_data
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Input endpoint of the controller, usually
> > > dp_intf
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description: Output endpoint of the controller
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +            properties:
> > > +              data-lanes:
> > > +                description: |
> > > +                  number of lanes supported by the hardware.
> > > +                  The possible values:
> > > +                  0       - For 1 lane enabled in IP.
> > > +                  0 1     - For 2 lanes enabled in IP.
> > > +                  0 1 2 3 - For 4 lanes enabled in IP.
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +            required:
> > > +              - data-lanes
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +  max-linkrate-mhz:
> > > +    enum: [ 1620, 2700, 5400, 8100 ]
> > > +    description: maximum link rate supported by the hardware.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - ports
> > > +  - max-linkrate-mhz
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/power/mt8195-power.h>
> > > +    dp_tx@1c600000 {
> > > +        compatible = "mediatek,mt8195-dp-tx";
> > > +        reg = <0x1c600000 0x8000>;
> > > +        power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
> > > +        interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +        max-linkrate-mhz = <8100>;
> > 
> > Why dp-tx has no clock property? I think this device should work
> > with
> > a
> > clock.
> > 
> > Regards,
> > CK
> > 
> 
> Hello CK,
> 
> We just need to enable the power domain of dp.
> The clock of dp is generated by itself and we are not using the
> global
> pll to generate clocks.

Add this to description because this is not trivial.

Regards,
CK

> 
> BRs,
> Bo-Chen
> 
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +                dptx_in: endpoint {
> > > +                    remote-endpoint = <&dp_intf0_out>;
> > > +                };
> > > +            };
> > > +            port@1 {
> > > +                reg = <1>;
> > > +                dptx_out: endpoint {
> > > +                    data-lanes = <0 1 2 3>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > 
> > 
> 
> 


