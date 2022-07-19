Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECED4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgZiYjz4XRD5be8NCldoRqXapy7cPDo/4kISDm/Nku4=; b=eZEU9zIteW2XaUgDHCiDXzkh1b
	KVVPgfNuTm5YzmKdK8sO41FGk4zlZ3DG4UWdQBBC54wftUyexcMb4TEQE6QszQm2oI1MK17dYtuzB
	x9T+wfcTz1Wwrhm35hrUz9u654Qdcoj9SKvcHAJ6qCUH+EHfgW/1w2nhuzwid4TmQIHwoF42AD5JQ
	ZJ0L/vqtBB7I/KUCYRx9ZQkXmIFL0MDptXUfRhrfUl7fUThTi4WyappleCRosd0Ipnl8l4o4YSDQv
	lAIw64nirhLEI0x/GRELoauZRETJnmjBmTgX/Aords0t915ls82W6OFWCPvDCjhGhWV24DRfRx9td
	mhY8TnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDiaM-006IHG-W5; Tue, 19 Jul 2022 08:28:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDiaC-006IC7-EX; Tue, 19 Jul 2022 08:27:58 +0000
X-UUID: 915e14f6851c4473b6f6c38c9bcd9781-20220719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:d700071b-0def-4253-90b7-16f09a55d5e9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:074ce1d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 915e14f6851c4473b6f6c38c9bcd9781-20220719
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1645873517; Tue, 19 Jul 2022 01:27:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 19 Jul 2022 16:17:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 19 Jul 2022 16:17:16 +0800
Message-ID: <c4480c9ea0822ae693ff6a501c073c365e983b83.camel@mediatek.com>
Subject: Re: [PATCH v2 03/19] dt-bindings: power: mediatek: Add bindings for
 MediaTek SCPSYS
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee.jones@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 19 Jul 2022 16:17:16 +0800
In-Reply-To: <46df4ad5-5102-b5fe-95b7-5b157fb28f01@linaro.org>
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
	 <20220714122837.20094-4-tinghan.shen@mediatek.com>
	 <46df4ad5-5102-b5fe-95b7-5b157fb28f01@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_012756_507076_A92D7857 
X-CRM114-Status: GOOD (  27.82  )
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

Hi Krzysztof,

On Fri, 2022-07-15 at 09:57 +0200, Krzysztof Kozlowski wrote:
> On 14/07/2022 14:28, Tinghan Shen wrote:
> > The System Control Processor System (SCPSYS) has several power
> > management related tasks in the system. Add the bindings for it.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  .../bindings/mfd/mediatek,scpsys.yaml         | 62 +++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> > b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> > new file mode 100644
> > index 000000000000..a8b9220f2f27
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
> > @@ -0,0 +1,62 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/mfd/mediatek,scpsys.yaml*__;Iw!!CTRNKA9wMg0ARbw!1TUl-dhD0p8qh3rYVk8RtfoKEP88jg8OADMd19qP6siBCQHhFnHWCgsyUqiETyBzxw8$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1TUl-dhD0p8qh3rYVk8RtfoKEP88jg8OADMd19qP6siBCQHhFnHWCgsyUqiEJQmakAI$
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
> > +      - const: mediatek,scpsys
> > +      - const: syscon
> > +      - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  power-controller:
> > +    $ref: /schemas/power/mediatek,power-controller.yaml#
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
> > +        compatible = "mediatek,scpsys", "syscon", "simple-mfd";
> 
> This should be a SoC-specific compatible (and filename).

Ok. I think that you mean "mediatek,mt8195-scpsys".
I'll update it in next version.

> 
> > +        reg = <0x10006000 0x100>;
> > +
> > +        spm: power-controller {
> 
> I think you created before less-portable, quite constrained bindings for
> power controller. You now require that mt8195-power-controller is always
> a child of some parent device which will share its regmap/MMIO with it.
> 
> And what if in your next block there is no scpsys block and power
> controller is the scpsys alone? It's not possible with your bindings.

Do you mean a power controller node that looks like this?

scpsys: power-controller@10006000 {
	compatible = "mediatek,mt6797-scpsys";
	#power-domain-cells = <1>;

	// ...
};

> 
> Wouldn't it be better to assign some address space to the
> power-controller (now as an offset from scpsys)?

Is this mean adding an offset after the node name?

spm: power-controller@0 {
                     ^^

> 
> This is just wondering (Rockchip did the same...) and not a blocker as
> power-controller bindings are done.
> 
> Best regards,
> Krzysztof


Thanks,
TingHan



