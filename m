Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D52EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 05:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaGGoKpj3wp/eD7iShLEmjhPUuvnqYSLamtIyKfjq8U=; b=iEudM3FELrNvtX
	zdUamLVlxMY6maPl9wNbSO10FKFpt3YfT17jXlomWA0KmapvdIvjfUKsFSnCcnGT7gZVJGyIE3c3j
	4BKCr4YCKZJkUfd8VFiabj8ij6AiJ3GRn18Y82bW59ecjKRMboWBj/1JuqIgZHyp+1Ak6jCEa9B0g
	oTywAS6m5R8xtZJaGE6cZqAxNVA4J7XIdf2XL4cLDuqei0mmlPPOIf9N3m48UyBdZ/fA5VjKqLg+X
	kr3stwoAHzekfRM4XFa23OvoUK5LbM8TD4vT9HN8528Av5jW0IX+1cq+kQqyyizjlKKzPSAfBtQNv
	57xesxEoh7KrJG2CYvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmUF7-00E4MW-1X; Thu, 05 May 2022 05:41:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmUEu-00E4Dr-PK; Thu, 05 May 2022 05:41:26 +0000
X-UUID: 408fb0ef140c4026ad09fecc435093e4-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:cd934da4-601f-43e6-a891-7e47f0d89fe6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:9d79a2b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 408fb0ef140c4026ad09fecc435093e4-20220504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1843672284; Wed, 04 May 2022 22:41:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 22:31:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 5 May 2022 13:31:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 May 2022 13:31:11 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <robh@kernel.org>
CC: <allen-kh.cheng@mediatek.com>, <angelogioacchino.delregno@collabora.com>, 
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <ikjn@chromium.org>, <krzk+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <matthias.bgg@kernel.org>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding of
 mt8192 clock
Date: Thu, 5 May 2022 13:31:11 +0800
Message-ID: <20220505053111.13924-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YnGjScfQA9axBYBO@robh.at.kernel.org>
References: <YnGjScfQA9axBYBO@robh.at.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_224125_119449_33C97F95 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Rob,

>> From: Matthias Brugger <matthias.bgg@gmail.com>
>> 
>> The msdc gate is part of the MMC driver. Delete the binding description
>> of this node.
> 
>An ABI break is okay because ...?

Sorry for that, 

If the mediatek,mt8192-msdc part is removed from the driver, 
Is it ok to keep "mediatek,mt8192-msdc" in the binding document? or 
we should add '# deprecated' to "mediatek,mt8192-msdc" and keep the example.

e.g.,
          - mediatek,mt8192-msdc # deprecated


thanks,
Miles

> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> ---
> 
> Changes in v2:
> - Delete compatible in binding descprition as well
> 
>  .../bindings/arm/mediatek/mediatek,mt8192-clock.yaml      | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> index c8c67c033f8c..b57cc2e69efb 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> @@ -24,7 +24,6 @@ properties:
>            - mediatek,mt8192-imp_iic_wrap_w
>            - mediatek,mt8192-imp_iic_wrap_n
>            - mediatek,mt8192-msdc_top
> -          - mediatek,mt8192-msdc
>            - mediatek,mt8192-mfgcfg
>            - mediatek,mt8192-imgsys
>            - mediatek,mt8192-imgsys2
> @@ -107,13 +106,6 @@ examples:
>          #clock-cells = <1>;
>      };
>  
> -  - |
> -    msdc: clock-controller@11f60000 {
> -        compatible = "mediatek,mt8192-msdc";
> -        reg = <0x11f60000 0x1000>;
> -        #clock-cells = <1>;
> -    };
> -
>    - |
>      mfgcfg: clock-controller@13fbf000 {
>          compatible = "mediatek,mt8192-mfgcfg";
> -- 
> 2.34.1
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
