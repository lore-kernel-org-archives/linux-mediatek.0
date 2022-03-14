Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD683C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8C1nmsVFTaM6OMFupCrqkVxC3f43a+tbAbtAjIC74LU=; b=oB/bR9qFW8vGum
	2C+yoZckOFl92r6zSyD64gcoNXuFIBkPaORs7qBMPzzb+C9k2UnmpRG3jgXZyQO3GzHmsnKAgcBf1
	nANEwLR/f4xjO2z4civquzQs4mv6uaC7uWGYXTtnMUu6w5NPVtG91jXmm553wo/sg/caAanTT4WRm
	7rgmSJrkMd182pGCVBjC0a4EPVmet/c9AgMXcbTOfigS7pyn8uzoEByIYmODeHWwocq8vixDBrkn+
	5IgZ9WBrpp3jf5sdw6FLNxmeNNQGKMX2mvry9rWjl1CKuQgBXim4gpkrEBaF0b9oaqOF+i/Nj1U4M
	JtNqKez1rD6bQl9i12vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nThfi-004roQ-Q9; Mon, 14 Mar 2022 10:11:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nThfH-004rb5-C9; Mon, 14 Mar 2022 10:11:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CB5731F43E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647252657;
 bh=l2qnNe5aHUhWfu86E5/2cq68eWfeDDGpLfM9uDUPrGU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K9iHtFO3YwWip0ZOT4aKOEyG2RVTdYwUWSwIItK6WMSyI5hgYceO52cM/KbJLhPE1
 EVDll5oMpCznI01fQFRcsHcqX6xmcHLWAez7iMTmcria2/KMEUoRxG1/ClsxOUjE5O
 pA5BGfXJYV654DOoS+GNf88F8WKb/x1cnCm7+O02VAowVJD3cktOzfBPk6k2KyUTDg
 83bDBhEd+5KF32IW4s/h6IMlsoL7wWovQa+lhUHaNag2YTKhxK7qsMvHP7aRJcFKec
 39mlUmfpfAJYD/o9Ot2LSFmKoYzseM80gpvv/HgTUZlrwLTAqTksh9p+W5IwX67Kim
 a8KCiZdHh06ZA==
Message-ID: <242e2897-03bb-78f5-9616-58790cce740e@collabora.com>
Date: Mon, 14 Mar 2022 11:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V7 4/5] dt-bindings: display: mediatek: add MT8186 SoC
 binding
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 jassisinghbrar@gmail.com, fparent@baylibre.com, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-5-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220314090033.25773-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_031059_710667_26CBEE99 
X-CRM114-Status: GOOD (  11.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/03/22 10:00, Rex-BC Chen ha scritto:
> Add MT8186 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MUTEX,
> OVL, POSTMASK and RDMA.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4 ++++
>   .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 4 ++++
>   .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml  | 1 +
>   .../devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml | 4 ++++
>   .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++++
>   .../bindings/display/mediatek/mediatek,postmask.yaml          | 4 ++++
>   .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 1 +
>   10 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index eaf23428b30d..c5562482e787 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -32,6 +32,10 @@ properties:
>                 - mediatek,mt8192-disp-aal
>                 - mediatek,mt8195-disp-aal
>             - const: mediatek,mt8173-disp-aal
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-aal
> +          - const: mediatek,mt8183-disp-aal
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 7766c806c102..63fb02014a56 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -29,6 +29,10 @@ properties:
>             - enum:
>                 - mediatek,mt8195-disp-ccorr
>             - const: mediatek,mt8192-disp-ccorr
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ccorr
> +          - const: mediatek,mt8183-disp-ccorr
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index 0c9095b0411e..d2f89ee7996f 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -36,6 +36,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8183-disp-color
> +              - mediatek,mt8186-disp-color
>                 - mediatek,mt8192-disp-color
>                 - mediatek,mt8195-disp-color
>             - const: mediatek,mt8173-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 8180ed0a89ff..8ad8187c02d1 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -26,6 +26,7 @@ properties:
>             - const: mediatek,mt8183-disp-dither
>         - items:
>             - enum:
> +              - mediatek,mt8186-disp-dither
>                 - mediatek,mt8192-disp-dither
>                 - mediatek,mt8195-disp-dither
>             - const: mediatek,mt8183-disp-dither
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index 5f1825b4512b..a89ea0ea7542 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -27,6 +27,7 @@ properties:
>             - const: mediatek,mt8183-disp-gamma
>         - items:
>             - enum:
> +              - mediatek,mt8186-disp-gamma
>                 - mediatek,mt8192-disp-gamma
>                 - mediatek,mt8195-disp-gamma
>             - const: mediatek,mt8183-disp-gamma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> index b470fbb1b40a..3fdad71210b4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> @@ -29,6 +29,7 @@ properties:
>         - mediatek,mt8167-disp-mutex
>         - mediatek,mt8173-disp-mutex
>         - mediatek,mt8183-disp-mutex
> +      - mediatek,mt8186-disp-mutex
>         - mediatek,mt8192-disp-mutex
>         - mediatek,mt8195-disp-mutex
>   
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> index da999ba53b7c..4e94f4e947ad 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> @@ -25,6 +25,10 @@ properties:
>             - const: mediatek,mt8183-disp-ovl-2l
>         - items:
>             - const: mediatek,mt8192-disp-ovl-2l
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ovl-2l
> +          - const: mediatek,mt8192-disp-ovl-2l
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index 51f8235f1b1b..a2a27d0ca038 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -38,6 +38,10 @@ properties:
>             - enum:
>                 - mediatek,mt8195-disp-ovl
>             - const: mediatek,mt8183-disp-ovl
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ovl
> +          - const: mediatek,mt8192-disp-ovl
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> index 2d769422e29f..654080bfbdfb 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> @@ -23,6 +23,10 @@ properties:
>       oneOf:
>         - items:
>             - const: mediatek,mt8192-disp-postmask
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-postmask
> +          - const: mediatek,mt8192-disp-postmask
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 9a6756f185ee..0882ae86e6c4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -38,6 +38,7 @@ properties:
>             - const: mediatek,mt2701-disp-rdma
>         - items:
>             - enum:
> +              - mediatek,mt8186-disp-rdma
>                 - mediatek,mt8192-disp-rdma
>             - const: mediatek,mt8183-disp-rdma
>   




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
