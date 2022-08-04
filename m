Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD29C19F29
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 02:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zmsrh9X/3g/WCH83lm05EdCSEeqf+efWw7k7n+0nfG0=; b=3dQM4tq4toyJXQpNAm13uD3Bf4
	z3bobDK3znd+ONtaJDvFWY0ktmlm+5OY8RNqOUX1jGFRwUNYU+WbFGmsm8ybLyuwW1KarAZDxKj4E
	BQGDPnSlwZ41/IrfpdOREix03Cqbhdm5TO2oKP/Uuyr5uLAT2ghKCrWjCQjb2W/VRm1jJ3x256NxZ
	TzHNQ/MY4d8abHOccwPvUXMgVgwn1ToxllTXQdP8nxsbg9aK/Oj2KNON4FT2Sc/A/JL1DPf9LgNEr
	h3sfUgJqXtYWuE9eUlJj+YhkHwwkDC1J4FHzZbZxC/HQlSrsH87ZTFW/tfWYqfCU0vR+wrJVpTZNp
	6kSvvqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQkC-00EQov-S0; Thu, 04 Aug 2022 02:37:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQjt-00EQPy-C0; Thu, 04 Aug 2022 02:37:34 +0000
X-UUID: 05125789ee904e2190d87846df6b036c-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:d4496ed2-1d2f-468e-b876-7a0653db5481,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:60723cd0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 05125789ee904e2190d87846df6b036c-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1028039004; Wed, 03 Aug 2022 19:37:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 10:06:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 10:06:53 +0800
Message-ID: <a745e0bb0ccc6a3686549386cd2aad404ee60faa.camel@mediatek.com>
Subject: Re: [PATCH v4 01/20] dt-bindings: iommu: mediatek: Increase max
 interrupt number
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chengci.xu@mediatek.com>
Date: Thu, 4 Aug 2022 10:06:53 +0800
In-Reply-To: <0085fdd057687637ebd5a7688897a279e72e03f6.camel@mediatek.com>
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
	 <20220729063208.16799-2-tinghan.shen@mediatek.com>
	 <0085fdd057687637ebd5a7688897a279e72e03f6.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_193733_437897_F666CBB6 
X-CRM114-Status: GOOD (  19.02  )
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

On Mon, 2022-08-01 at 20:04 +0800, Yong Wu wrote:
> On Fri, 2022-07-29 at 14:31 +0800, Tinghan Shen wrote:
> > mt8195 infra iommu uses 5 interrupts.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/iommu/mediatek,iommu.yaml         | 18
> > +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > index fee0241b50988..5afe2a0045330 100644
> > --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > @@ -91,7 +91,8 @@ properties:
> >      maxItems: 1
> >  
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 5
> >  
> >    clocks:
> >      items:
> > @@ -191,9 +192,24 @@ allOf:
> >                const: mediatek,mt8195-iommu-infra
> >  
> >      then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 1
> > +
> >        required:
> >          - mediatek,larbs
> >  
> > +    else:
> > +      properties:
> > +        interrupts:
> > +          description: The IOMMU has 5 banks. Each bank has its own
> > interrupt.
> > +          items:
> > +            - description: The interrupt for IOMMU bank0
> > +            - description: The interrupt for IOMMU bank1
> > +            - description: The interrupt for IOMMU bank2
> > +            - description: The interrupt for IOMMU bank3
> > +            - description: The interrupt for IOMMU bank4
> > +
> 
> Thanks for improving this.
> 
> Before the meaning for this segment is that it require "mediatek,larbs"
> if it is NOT infra iommu. Here we add a new block for infra iommu.
> then we'd better to remove the "not". this should be more readable.
> Something like below:
> 
> if:
>    /* Remove the not here. */
>    properties:
>      compatible:
>        contains:
>          const: mediatek,mt8195-iommu-infra
> then:
>   xxx
> else:
>   xx
> 

Ok, I'll update in the next version.


Thanks,
TingHan



