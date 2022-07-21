Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162FBC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 03:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HN50OAXw+Iq7FDsue2HMflEwtvjYV/6yTysQZEgY9w=; b=bXVZx2SE87zGhxQuJ3PeEvoAXG
	7YoV8cpBwiE6ZeL7Mv/ULoyXqDPpvfyczlYmDhmvgfM9dtzmIZIY13IM8ohYsfKcOWee2zVukneXN
	JMGBDHbhYl8QTJX7A/ZBvVzXJhTTheuO+FfSp0EnbqCw8Yqp+o+Vyvo2qphbvuXHAXA2SaSR+3pR4
	+FrQdvGKUbeTOmWzMvP13sOCiU82CBC0/sbxWaMyQ2Gpo/pqeyuk2Vo7b3U2NRrldHyh2zpvIfB8i
	v9hMlT/e5obs04/+NJkCJnrn0NaqPU/SzWiU5kplttu4j7gQgYoUHFqG2NBE7gFDGAw54v1jaP+Xc
	OjOXIiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMpx-00FcIC-FO; Thu, 21 Jul 2022 03:26:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMpl-00Fc3i-TC; Thu, 21 Jul 2022 03:26:43 +0000
X-UUID: b94996e5e4b0439f8c861d70f782ee73-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:b0031bdd-41f3-4f88-9d0e-b135c421b843,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:095b0dd8-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b94996e5e4b0439f8c861d70f782ee73-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1696682662; Wed, 20 Jul 2022 20:26:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 21 Jul 2022 11:05:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 21 Jul 2022 11:05:56 +0800
Message-ID: <00bc3a146f39feb1a83213fc8503ad1b52cda9f9.camel@mediatek.com>
Subject: Re: [PATCH v3 06/21] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee.jones@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 21 Jul 2022 11:05:56 +0800
In-Reply-To: <57b0cf62-0312-05cf-31ff-d38f83a35578@linaro.org>
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
	 <20220720123023.13500-7-tinghan.shen@mediatek.com>
	 <57b0cf62-0312-05cf-31ff-d38f83a35578@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_202641_961200_55058EBA 
X-CRM114-Status: GOOD (  26.20  )
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

On Wed, 2022-07-20 at 19:35 +0200, Krzysztof Kozlowski wrote:
> On 20/07/2022 14:30, Tinghan Shen wrote:
> > The System Control Processor System (SCPSYS) has several power
> > management related tasks in the system. Add the bindings for it.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  .../bindings/mfd/mediatek,mt8195-scpsys.yaml  | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> > b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> > new file mode 100644
> > index 000000000000..4117a6dbc19c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml*__;Iw!!CTRNKA9wMg0ARbw!y63E-9qbCW_vyn8RrsCCs7YvZ7NxKqFT7l8C0ZZirEW95Ec0ce3lwegsSq51wrjtz8GjVSpkK-omCBP5CKx1l0WESQ$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!y63E-9qbCW_vyn8RrsCCs7YvZ7NxKqFT7l8C0ZZirEW95Ec0ce3lwegsSq51wrjtz8GjVSpkK-omCBP5CKzzr9p82Q$
> >  
> > +
> > +title: MediaTek System Control Processor System
> > +
> > +maintainers:
> > +  - MandyJH Liu <mandyjh.liu@mediatek.com>
> > +
> > +description:
> > +  MediaTek System Control Processor System (SCPSYS) has several
> > +  power management tasks. The tasks include MTCMOS power
> > +  domain control, thermal measurement, DVFS, etc.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8167-scpsys
> > +          - mediatek,mt8173-scpsys
> > +          - mediatek,mt8183-scpsys
> > +          - mediatek,mt8192-scpsys
> > +          - mediatek,mt8195-scpsys
> > +      - const: syscon
> > +      - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^power-controller(@[0-9a-f]+)?$":
> > +    $ref: /schemas/power/mediatek,power-controller.yaml#
> 
> We talked that unit address might be useful but it was with an
> assumption that you will actually use it. I think you don't use it, so
> it is kind of meaningless now... unless you plan to use it?

I tried to add the offset in the node name, but the binding check reports this message.
 	
    power-controller@0: node has a unit name, but no reg or ranges property

After considering the fact of mt8195 power controller HW resides in scpsys and the current power
domain driver doesn't support parsing the register address seperated from scpsys, I decide to
keep the power controller node as in v2 to pass the binding check and compatible with driver.

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +
> > +    syscon@10006000 {
> > +        compatible = "mediatek,mt8195-scpsys", "syscon", "simple-mfd";
> > +        reg = <0x10006000 0x100>;
> > +
> > +        spm: power-controller {
> > +            compatible = "mediatek,mt8195-power-controller";
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            #power-domain-cells = <1>;
> > +
> > +            /* sample of power domain nodes */
> > +            power-domain@MT8195_POWER_DOMAIN_PCIE_PHY {
> > +                    reg = <MT8195_POWER_DOMAIN_PCIE_PHY>;
> 
> Wrong indentation.

I missed checking this. I'll udpate in the next version.

Thanks,
TingHan


