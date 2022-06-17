Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42364C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 05:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzCL0T+96JHr5PzOHMd+SLWu5POhrQkSS+JMZQhBLPo=; b=IHdMArg1WFpuiQqXQtEFaPrQqX
	tdYlxsrakcElysHzs7TMW7sigtW+ySmzXZhKdXQXej5aKGRRg2l2QAR0VgQ3nVkBkzGpZB7509MkV
	CwNsPymigGSxYFsAdTD1CsC/uONxyB1RmskO11GEwgPr8GDt1zO6NOAYPNc6uBWCcrKjJ2kV6SrZw
	jzDITDQFVzh6k+g6S0zLEiwz3Q6RQtXKDQr0wMzZVjeKDj2MXfweHaEAwJvICnjFb73uVYM8n3KxX
	PZ/bZOBWifb5Nxx4S0F20rcXlfSg97v+2sQQa6TatAUFR8NcR9fR5VVQaSgklZczmaVciNSMcmCpB
	yliKq+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24mm-005cBs-Cd; Fri, 17 Jun 2022 05:44:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24mi-005cAl-6t; Fri, 17 Jun 2022 05:44:46 +0000
X-UUID: 4c8c3336daa7428bb74cfe9044867849-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:ec9a6e63-d58a-41d3-b250-d4d0d2c68813,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:9f4198f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4c8c3336daa7428bb74cfe9044867849-20220616
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 750942971; Thu, 16 Jun 2022 22:44:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 22:44:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:44:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 17 Jun 2022 13:44:36 +0800
Message-ID: <cfd1b024a388cc2506a8f836795b50c75844c9d2.camel@mediatek.com>
Subject: Re: [PATCH 3/7] dt-bindings: display: mediatek: add bindings for
 MT8365 SoC
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, <matthias.bgg@gmail.com>,
	<jitao.shi@mediatek.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 17 Jun 2022 13:44:35 +0800
In-Reply-To: <20220530201436.902505-3-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
	 <20220530201436.902505-3-fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_224444_309946_F2812E3D 
X-CRM114-Status: GOOD (  13.62  )
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

Hi, Fabien:

On Mon, 2022-05-30 at 22:14 +0200, Fabien Parent wrote:
> Add MT8365 binding documentation for all the display components that
> are
> compatible with the compatible string from other SoCs.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,aal.yaml |  1 +
>  .../display/mediatek/mediatek,ccorr.yaml        |  1 +
>  .../display/mediatek/mediatek,color.yaml        |  1 +
>  .../display/mediatek/mediatek,dither.yaml       |  1 +
>  .../bindings/display/mediatek/mediatek,dsi.yaml | 17 +++++++++++--
> ----
>  .../display/mediatek/mediatek,gamma.yaml        |  1 +
>  .../display/mediatek/mediatek,mutex.yaml        |  1 +
>  .../bindings/display/mediatek/mediatek,ovl.yaml |  1 +
>  .../display/mediatek/mediatek,rdma.yaml         |  1 +
>  9 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> index d4d585485e7b..d47bc72f09c0 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> @@ -33,6 +33,7 @@ properties:
>                - mediatek,mt8186-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> +              - mediatek,mt8365-disp-aal
>            - const: mediatek,mt8183-disp-aal
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> index 63fb02014a56..fc999e614718 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ccorr
> +              - mediatek,mt8365-disp-ccorr
>            - const: mediatek,mt8183-disp-ccorr
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> index d2f89ee7996f..9d081da433e8 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> @@ -39,6 +39,7 @@ properties:
>                - mediatek,mt8186-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> +              - mediatek,mt8365-disp-color
>            - const: mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> index 8ad8187c02d1..a7706cd65675 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> @@ -29,6 +29,7 @@ properties:
>                - mediatek,mt8186-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
> +              - mediatek,mt8365-disp-dither
>            - const: mediatek,mt8183-disp-dither
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> index fa5bdf28668a..d17ea215960c 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam
> l
> @@ -22,12 +22,17 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt2701-dsi
> -      - mediatek,mt7623-dsi
> -      - mediatek,mt8167-dsi
> -      - mediatek,mt8173-dsi
> -      - mediatek,mt8183-dsi
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dsi
> +          - mediatek,mt7623-dsi
> +          - mediatek,mt8167-dsi
> +          - mediatek,mt8173-dsi
> +          - mediatek,mt8183-dsi
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-dsi
> +          - const: mediatek,mt8183-dsi
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> index a89ea0ea7542..f54859cfc97b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> @@ -30,6 +30,7 @@ properties:
>                - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
> +              - mediatek,mt8365-disp-gamma
>            - const: mediatek,mt8183-disp-gamma
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> index 3fdad71210b4..f4a12dfae77b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> @@ -32,6 +32,7 @@ properties:
>        - mediatek,mt8186-disp-mutex
>        - mediatek,mt8192-disp-mutex
>        - mediatek,mt8195-disp-mutex
> +      - mediatek,mt8365-disp-mutex
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> index a2a27d0ca038..20e4ca4fc915 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> @@ -41,6 +41,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ovl
> +              - mediatek,mt8365-disp-ovl
>            - const: mediatek,mt8192-disp-ovl
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> index 0882ae86e6c4..3bc914785976 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> @@ -40,6 +40,7 @@ properties:
>            - enum:
>                - mediatek,mt8186-disp-rdma
>                - mediatek,mt8192-disp-rdma
> +              - mediatek,mt8365-disp-rdma
>            - const: mediatek,mt8183-disp-rdma
>  
>    reg:


