Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB81BC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 04:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUY2S2KBuuaWvOeDhMKGFcXO48diLfRpRqypP4/cfgc=; b=NEuBJU85neoan8NO8v/5twIhQe
	juKyeNJ3WUJi8UEBY2P8G41/mmWgnQQj9HgUTyoTE39z48DLyY+hH9Ca1wUFQuwoFnv4C7xM+FvQT
	ngAbwzayOwFNtm2bgcIdJQzdF1psPCRN6yeMkd9bMSmn5pBsQVjFreST3lG203rSPPURqrp1RiXCz
	fl1qFlwl+QCAXkM0LOwDxRW7BxTY5mW+TI+sEoo8WbheduUgliLiJRMBcmlvn+WmockKDE8ZNoKtp
	lh6pU33djNNHT50R9lH9fWWOqKMJyd9zdug5UQvdRWNQnmi7lc3V3fXN2IIJ25jlHR5hcVoFyONGC
	/WTQTAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wR1-005jnU-QB; Wed, 06 Jul 2022 04:14:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wQb-005jcL-9C; Wed, 06 Jul 2022 04:14:18 +0000
X-UUID: c1a4bd15df7f4cd0abd2831ce5d99290-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:eef02660-b071-44fb-bf36-5f57aee3a1fc,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:a9788663-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c1a4bd15df7f4cd0abd2831ce5d99290-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1348952548; Tue, 05 Jul 2022 21:13:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 6 Jul 2022 12:03:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 6 Jul 2022 12:03:18 +0800
Message-ID: <4138b6eff8b83eb5954e84452bb84f77d42bd558.camel@mediatek.com>
Subject: Re: [PATCH v1 01/16] dt-bindings: iommu: mediatek: Increase max
 interrupt number
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Weiyi Lu
	<weiyi.lu@mediatek.com>, <iommu@lists.linux-foundation.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 6 Jul 2022 12:03:18 +0800
In-Reply-To: <20220705204902.GA2596733-robh@kernel.org>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
	 <20220704100028.19932-2-tinghan.shen@mediatek.com>
	 <20220705204902.GA2596733-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_211417_389330_1A406187 
X-CRM114-Status: GOOD (  15.65  )
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

On Tue, 2022-07-05 at 14:49 -0600, Rob Herring wrote:
> On Mon, Jul 04, 2022 at 06:00:13PM +0800, Tinghan Shen wrote:
> > mt8195 infra iommu has max 5 interrupts.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  .../devicetree/bindings/iommu/mediatek,iommu.yaml    | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > index 2ae3bbad7f1a..27eb9f6aa3ce 100644
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
> > @@ -175,9 +176,18 @@ allOf:
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
> > +          maxItems: 5
> 
> 5 is already the max.
> 
> minItems: 5
> 

Ok, I'll update in the next version.

Thanks,
TingHan


