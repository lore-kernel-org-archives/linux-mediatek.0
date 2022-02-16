Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74940C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sybt7cydHYJGAFOfUQzwbHVMGyHI6uZTaMHfsF9r6Ys=; b=fxX96chs8kZZw7
	g9++odyCKQyXbJ+BtyzCejB6+gRI+whCP0Gy9FtPM1uuuoJN3s/CVFLbhoIM8polOn8iF+Q/8+wT+
	844tAYrbPRnJm7aj0qtc29QjeygwtHCgej9reP687ThOuEpKfOISmKKp7Zwxs2FcuwY41SHdS0a72
	ddop9H5skEQCSHGC3ws9N9ALSSvb92LUD1DMU3d0S0RhsCSLer1R9UwhhJlNU2nVCerY0IgQJWVmq
	kjmqz31571WNR1CGsnYh7WpsvH0oc5mRgUtPRGQehKoKjDVpi+lRsyTr1iiGgT3VHDzvxGB6XuEQL
	QKyXsYBhXvywDqOSbIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKGRm-006HfD-NP; Wed, 16 Feb 2022 09:18:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKGRh-006HbR-SU; Wed, 16 Feb 2022 09:18:00 +0000
X-UUID: 53e9dfc5c3934b4f94ba489fe3407956-20220216
X-UUID: 53e9dfc5c3934b4f94ba489fe3407956-20220216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 248523073; Wed, 16 Feb 2022 02:17:51 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 01:17:50 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Feb 2022 17:17:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 17:17:48 +0800
Message-ID: <4436154a38bfe7213299a578ff148d9f8223e101.camel@mediatek.com>
Subject: Re: [PATCH v3, 2/5] dt-bindings: display: mediatek: add MT8186 SoC
 binding
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <airlied@linux.ie>,
 <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <yongqiang.niu@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fparent@baylibre.com>,
 <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 16 Feb 2022 17:17:48 +0800
In-Reply-To: <20220216084831.14883-3-rex-bc.chen@mediatek.com>
References: <20220216084831.14883-1-rex-bc.chen@mediatek.com>
 <20220216084831.14883-3-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_011757_936209_2947B272 
X-CRM114-Status: GOOD (  16.15  )
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

On Wed, 2022-02-16 at 16:48 +0800, Rex-BC Chen wrote:
> Add MT8186 SoC binding to AAL, CCORR, COLOR, DITHER, DPI, DSI,
> GAMMA, MUTEX, OVL, POSTMASK and RDMA.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml   | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 5
> +++++
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
>  .../bindings/display/mediatek/mediatek,dither.yaml           | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt    | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml | 2 ++
>  .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5
> +++++
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5
> +++++
>  .../bindings/display/mediatek/mediatek,postmask.yaml         | 5
> +++++
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 1 +
>  12 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> index 225f9dd726d2..7c27f61f336b 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam
> l
> @@ -27,6 +27,7 @@ properties:
>            - enum:
>                - mediatek,mt2712-disp-aal
>                - mediatek,mt8183-disp-aal
> +              - mediatek,mt8186-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
>            - enum:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> index 6894b6999412..8ac87b5896ac 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y
> aml
> @@ -30,6 +30,11 @@ properties:
>                - mediatek,mt8195-disp-ccorr
>            - enum:
>                - mediatek,mt8192-disp-ccorr
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ccorr
> +          - enum:
> +              - mediatek,mt8183-disp-ccorr
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> index bc83155b3b4c..d0a4b9eb71fd 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y
> aml
> @@ -37,6 +37,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8183-disp-color
> +              - mediatek,mt8186-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
>            - enum:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> index 9d89297f5f1d..9a08514ed909 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.
> yaml
> @@ -26,6 +26,7 @@ properties:
>            - const: mediatek,mt8183-disp-dither
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
>            - enum:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> index dd2896a40ff0..a73044c50b5f 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> @@ -22,6 +22,7 @@ properties:
>        - mediatek,mt7623-dpi
>        - mediatek,mt8173-dpi
>        - mediatek,mt8183-dpi
> +      - mediatek,mt8186-dpi
>        - mediatek,mt8192-dpi
>  
>    reg:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index 36b01458f45c..c82b8b20de15 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -7,7 +7,7 @@ channel output.
>  
>  Required properties:
>  - compatible: "mediatek,<chip>-dsi"
> -- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
> +- the supported chips are mt2701, mt7623, mt8167, mt8173, mt8183 and

This is done in [1], and Xinlei has planed to transfer to yaml format,
so I think you could remove this from this patch.

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/1643283773-7081-2-git-send-email-xinlei.lee@mediatek.com/

Regards,
CK

> mt8186.
>  - reg: Physical base address and length of the controller's
> registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> index 247baad147b3..6d96f6736d91 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y
> aml
> @@ -27,6 +27,7 @@ properties:
>            - const: mediatek,mt8183-disp-gamma
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
>            - enum:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> index 6eca525eced0..55391b5c08c4 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> @@ -34,6 +34,8 @@ properties:
>            - const: mediatek,mt8173-disp-mutex
>        - items:
>            - const: mediatek,mt8183-disp-mutex
> +      - items:
> +          - const: mediatek,mt8186-disp-mutex
>        - items:
>            - const: mediatek,mt8192-disp-mutex
>        - items:
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> index 611a2dbdefa4..f7f89485a5ae 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-
> 2l.yaml
> @@ -25,6 +25,11 @@ properties:
>            - const: mediatek,mt8183-disp-ovl-2l
>        - items:
>            - const: mediatek,mt8192-disp-ovl-2l
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ovl-2l
> +          - enum:
> +              - mediatek,mt8192-disp-ovl-2l
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> index e71f79bc2dee..110e6b2747bc 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam
> l
> @@ -40,6 +40,11 @@ properties:
>                - mediatek,mt8195-disp-ovl
>            - enum:
>                - mediatek,mt8183-disp-ovl
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ovl
> +          - enum:
> +              - mediatek,mt8192-disp-ovl
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> index 6ac1da2e8871..22c333d09465 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas
> k.yaml
> @@ -23,6 +23,11 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8192-disp-postmask
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-postmask
> +          - enum:
> +              - mediatek,mt8192-disp-postmask
>  
>    reg:
>      maxItems: 1
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> index 8ef821641672..4f1c935cdf70 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya
> ml
> @@ -39,6 +39,7 @@ properties:
>                - mediatek,mt2701-disp-rdma
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-rdma
>                - mediatek,mt8192-disp-rdma
>            - enum:
>                - mediatek,mt8183-disp-rdma


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
