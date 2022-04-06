Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462E0C4167D
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 03:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGj0ipnRkw3UbeU2w5n4BRN35ZXWsI7PYS1T/F5QXQA=; b=HCd2ovn3jZM8tU
	xFy39UvH9GyppBv+10ye7iLFVOclEcGpCXdGRRKNjMBvMI/vN8zgh4DsK+W9tAe6KNteNVvdNJZWR
	RRC/dDLdRZl8rTxO+0avqOgkmVnZheBksI1vtY7bPfCyRp/6Vji9tYS7vc94FKWu9UJMQNyi7ten9
	3YDFc0JjOO5vvsxYG/IbUhExWr/cNlW/JejKXniqWRwiHVrsJXli6e4yL9dnKs4iHUYF54nl0SFz1
	Y7elwpaQOxWOAz42YXtn2kjxL9PhEXdWvitEzgmv7nIDQadkbN68Kfrk+mquSJnbAGCMukEDKUj2S
	VqB81yF6A5KrkCPKJLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbwNo-003bK3-21; Wed, 06 Apr 2022 03:31:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbwNb-003bGe-E2; Wed, 06 Apr 2022 03:30:49 +0000
X-UUID: f0c15e488ff8426ab7e2cbad14981608-20220405
X-UUID: f0c15e488ff8426ab7e2cbad14981608-20220405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1092312707; Tue, 05 Apr 2022 20:30:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Apr 2022 20:26:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 6 Apr 2022 11:26:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 11:26:16 +0800
Message-ID: <0656f45f2933518708b82195bd9c49351e394c16.camel@mediatek.com>
Subject: Re: [PATCH v10 1/4] dt-bindings: display: mediatek: revise enum to
 const
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <p.zabel@pengutronix.de>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <jassisinghbrar@gmail.com>,
 <fparent@baylibre.com>, <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 6 Apr 2022 11:26:16 +0800
In-Reply-To: <20220406030009.2357-2-rex-bc.chen@mediatek.com>
References: <20220406030009.2357-1-rex-bc.chen@mediatek.com>
 <20220406030009.2357-2-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_203047_516899_BBD57375 
X-CRM114-Status: GOOD (  12.01  )
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

Hi, Rex:

On Wed, 2022-04-06 at 11:00 +0800, Rex-BC Chen wrote:
> There won't be more than 1 fallback for these bindings, so we modify
> them to use const instead of enum.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 3 +--
>  .../bindings/display/mediatek/mediatek,ccorr.yaml           | 3 +--
>  .../bindings/display/mediatek/mediatek,color.yaml           | 6 ++
> ----
>  .../bindings/display/mediatek/mediatek,dither.yaml          | 3 +--
>  .../bindings/display/mediatek/mediatek,gamma.yaml           | 3 +--
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml  | 6 ++
> ----
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 6 ++
> ----
>  7 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> index 61f0ed1e388f..cdb6d0819cca 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> @@ -29,8 +29,7 @@ properties:
>                - mediatek,mt8183-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> -          - enum:
> -              - mediatek,mt8173-disp-aal
> +          - const: mediatek,mt8173-disp-aal
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> index 0ed53b6238f0..7766c806c102 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> @@ -28,8 +28,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8195-disp-ccorr
> -          - enum:
> -              - mediatek,mt8192-disp-ccorr
> +          - const: mediatek,mt8192-disp-ccorr
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> index 3ad842eb5668..0c9095b0411e 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> @@ -32,15 +32,13 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-color
>                - mediatek,mt2712-disp-color
> -          - enum:
> -              - mediatek,mt2701-disp-color
> +          - const: mediatek,mt2701-disp-color
>        - items:
>            - enum:
>                - mediatek,mt8183-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> -          - enum:
> -              - mediatek,mt8173-disp-color
> +          - const: mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
>  
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> index 6657549af165..8180ed0a89ff 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> @@ -28,8 +28,7 @@ properties:
>            - enum:
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
> -          - enum:
> -              - mediatek,mt8183-disp-dither
> +          - const: mediatek,mt8183-disp-dither
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> index 78442339314f..5f1825b4512b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> @@ -29,8 +29,7 @@ properties:
>            - enum:
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
> -          - enum:
> -              - mediatek,mt8183-disp-gamma
> +          - const: mediatek,mt8183-disp-gamma
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> index f77094e61443..51f8235f1b1b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> @@ -33,13 +33,11 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-ovl
>                - mediatek,mt2712-disp-ovl
> -          - enum:
> -              - mediatek,mt2701-disp-ovl
> +          - const: mediatek,mt2701-disp-ovl
>        - items:
>            - enum:
>                - mediatek,mt8195-disp-ovl
> -          - enum:
> -              - mediatek,mt8183-disp-ovl
> +          - const: mediatek,mt8183-disp-ovl
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> index e8c72afa0630..9a6756f185ee 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> @@ -35,13 +35,11 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-rdma
>                - mediatek,mt2712-disp-rdma
> -          - enum:
> -              - mediatek,mt2701-disp-rdma
> +          - const: mediatek,mt2701-disp-rdma
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-rdma
> -          - enum:
> -              - mediatek,mt8183-disp-rdma
> +          - const: mediatek,mt8183-disp-rdma
>  
>    reg:
>      maxItems: 1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
