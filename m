Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B2CC00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krHNLGNd3zKRuztaHn6gErh3juOeihKMK3kRPaUOE8w=; b=TRh15oI+YcfyXZzeTLfcvOYYuS
	jUAirqrq76TM7ScjzynNrnqsI3Pt9XEQzQb98Ew6ZeIFRDNfAM2ezeWv3aEQpMS3W5v00SwCLy9RF
	Epre5F0j1/xeif50L1yP1a4BEzo1/U9Av72fAUeDZsQ2QnjA4hjdP9iNrCyaO+6NlyesA5vcb88ej
	qJXd5MHjLW0XJYOzOgfVbvci1pBBvZ3PD+W37qku6PRz0cS6gJBZhO0gmMqOvmJTy0KbhSnwbycY+
	kkfcvN35L9SY4LP7tH5DA5cq4eP/rOtYE8JQqKjDGv+Oul3iUTf6L+jToM/17KA45esTiMovI0wMb
	ikMUbY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIUyn-006Rq3-H9; Mon, 01 Aug 2022 12:57:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIUwL-006QNp-Ky; Mon, 01 Aug 2022 12:54:38 +0000
X-UUID: 5749ccd285cc4b048a1c8c5cdd641e97-20220801
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:08f893ee-f2ad-4558-ad86-ea0ed2ebee59,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:582ef224-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5749ccd285cc4b048a1c8c5cdd641e97-20220801
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1701894477; Mon, 01 Aug 2022 05:54:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 1 Aug 2022 20:04:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 1 Aug 2022 20:04:21 +0800
Message-ID: <0085fdd057687637ebd5a7688897a279e72e03f6.camel@mediatek.com>
Subject: Re: [PATCH v4 01/20] dt-bindings: iommu: mediatek: Increase max
 interrupt number
From: Yong Wu <yong.wu@mediatek.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chengci.xu@mediatek.com>
Date: Mon, 1 Aug 2022 20:04:21 +0800
In-Reply-To: <20220729063208.16799-2-tinghan.shen@mediatek.com>
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
	 <20220729063208.16799-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_055433_826465_02D6E394 
X-CRM114-Status: GOOD (  15.50  )
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

On Fri, 2022-07-29 at 14:31 +0800, Tinghan Shen wrote:
> mt8195 infra iommu uses 5 interrupts.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml         | 18
> +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index fee0241b50988..5afe2a0045330 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -91,7 +91,8 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5
>  
>    clocks:
>      items:
> @@ -191,9 +192,24 @@ allOf:
>                const: mediatek,mt8195-iommu-infra
>  
>      then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>        required:
>          - mediatek,larbs
>  
> +    else:
> +      properties:
> +        interrupts:
> +          description: The IOMMU has 5 banks. Each bank has its own
> interrupt.
> +          items:
> +            - description: The interrupt for IOMMU bank0
> +            - description: The interrupt for IOMMU bank1
> +            - description: The interrupt for IOMMU bank2
> +            - description: The interrupt for IOMMU bank3
> +            - description: The interrupt for IOMMU bank4
> +

Thanks for improving this.

Before the meaning for this segment is that it require "mediatek,larbs"
if it is NOT infra iommu. Here we add a new block for infra iommu.
then we'd better to remove the "not". this should be more readable.
Something like below:

if:
   /* Remove the not here. */
   properties:
     compatible:
       contains:
         const: mediatek,mt8195-iommu-infra
then:
  xxx
else:
  xx


>  additionalProperties: false
>  
>  examples:


