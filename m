Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDABC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uE5gtILZCS2I9zq8zeYw7ojYypyLBup3EikHh/KuKXo=; b=yP6V7p6HpWWi3Y
	7DiRDrRysilNBg+e4CoK4tCtJaNewUiNqJE4uDK0YhvyoD+vdQb8+3nkaiuVK58fxRLbIKUkjBFdp
	9b3RLDbPnHNQk1BVhBv2I0t6FLcPrNe2yOdIRg8e+5sN9MieGEfYMJWKShEV4ZtEbH1nnxJ6JRhFV
	6CaciMdOX2dwakU3IN2SF8oErfBdff7QVQrn0eg3koWwtgLbDKf2qo6boi7ioI8OThUGm75JGtZQX
	WdId7akcqnDd+r4WcGge/JEBiLDvHt2nyADdsUPDfO+pPaH1AP3xpb9mBLO2QhG9bgMnaCbzP4+LB
	MTQyFZkeM4d8fod6THGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNJec-0026wf-2m; Thu, 24 Feb 2022 19:19:54 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNJeP-0026sg-NB; Thu, 24 Feb 2022 19:19:43 +0000
Received: by mail-oi1-f179.google.com with SMTP id k2so4400054oia.2;
 Thu, 24 Feb 2022 11:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cc8HWmanEpdtB8YuJu7jgI5K1qIYmoacQ6BDCjLUl6I=;
 b=tGpAt7yIVnKcsaZKxBYkF6LwZb3CPsgTXijTdfFPzCh/HZFzb2J/X6j6eMo8Qp8v6S
 uK/wZpy/fyB6MvbByR9Ujb9rLd4/ETK7Cpm/KuWZ4QSsrrfUN0iUgUDuW1Ha3YPcyucm
 f8JGuZCLyT/L84lRBJg0GfK2gCyNc8l2HaPJ6KZ4g+PQPU6Yu+MZnYUdZe4QJgI62uXr
 IYkotR13aJdXjucqEojusXLLHyyH2cCHuE80bWfLZ+EEpLd+VnI/YTOCk30Gzh4zagpB
 QvRpM6WfqiYH9BuFflJG1D6i+vFoeo8HMmSP5nQIsPBwnWyInzyufuSA7GSy0prvLU8G
 84ZA==
X-Gm-Message-State: AOAM530W7/PTKWWPwRvPX92W6t+h35buIwSuyv1YF2GI9YKzZxXMqalP
 /epigX8wpCgCJFzofNiV9w==
X-Google-Smtp-Source: ABdhPJy5kI058I2cgTCZQamlbwhD2RSanlfZAq00SNdVwO46A8RHSvGD2gvd12E/u/QveaCqpxRjKA==
X-Received: by 2002:a05:6870:d785:b0:d2:823a:94df with SMTP id
 bd5-20020a056870d78500b000d2823a94dfmr1860561oab.93.1645730380505; 
 Thu, 24 Feb 2022 11:19:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 f21-20020a4ada55000000b0031c16df28f9sm60232oou.42.2022.02.24.11.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:19:39 -0800 (PST)
Received: (nullmailer pid 3433528 invoked by uid 1000);
 Thu, 24 Feb 2022 19:19:38 -0000
Date: Thu, 24 Feb 2022 13:19:38 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, jassisinghbrar@gmail.com,
 fparent@baylibre.com, yongqiang.niu@mediatek.com, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4,2/5] dt-bindings: display: mediatek: add MT8186 SoC
 binding
Message-ID: <YhfaSqWInwgsu30x@robh.at.kernel.org>
References: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
 <20220222052803.3570-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222052803.3570-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_111941_791077_26BDA0D5 
X-CRM114-Status: GOOD (  14.56  )
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

On Tue, Feb 22, 2022 at 01:28:00PM +0800, Rex-BC Chen wrote:
> Add MT8186 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MUTEX,
> OVL, POSTMASK and RDMA.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml | 7 +++++++
>  .../bindings/display/mediatek/mediatek,ccorr.yaml          | 5 +++++
>  .../bindings/display/mediatek/mediatek,color.yaml          | 1 +
>  .../bindings/display/mediatek/mediatek,dither.yaml         | 1 +
>  .../bindings/display/mediatek/mediatek,gamma.yaml          | 1 +
>  .../bindings/display/mediatek/mediatek,mutex.yaml          | 2 ++
>  .../bindings/display/mediatek/mediatek,ovl-2l.yaml         | 5 +++++
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 5 +++++
>  .../bindings/display/mediatek/mediatek,postmask.yaml       | 5 +++++
>  .../bindings/display/mediatek/mediatek,rdma.yaml           | 1 +
>  10 files changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 225f9dd726d2..3a5416937293 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -23,6 +23,8 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8173-disp-aal
> +      - items:
> +          - const: mediatek,mt8183-disp-aal

This patch is for 8186...

>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal
> @@ -31,6 +33,11 @@ properties:
>                - mediatek,mt8195-disp-aal
>            - enum:
>                - mediatek,mt8173-disp-aal
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-aal

> +          - enum:
> +              - mediatek,mt8183-disp-aal

There won't be more than 1 fallback, so use const rather than enum.

>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 6894b6999412..8ac87b5896ac 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -30,6 +30,11 @@ properties:
>                - mediatek,mt8195-disp-ccorr
>            - enum:
>                - mediatek,mt8192-disp-ccorr
> +      - items:
> +          - enum:
> +              - mediatek,mt8186-disp-ccorr
> +          - enum:
> +              - mediatek,mt8183-disp-ccorr

Same here.

>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index bc83155b3b4c..d0a4b9eb71fd 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -37,6 +37,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8183-disp-color
> +              - mediatek,mt8186-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 9d89297f5f1d..9a08514ed909 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -26,6 +26,7 @@ properties:
>            - const: mediatek,mt8183-disp-dither
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index 247baad147b3..6d96f6736d91 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -27,6 +27,7 @@ properties:
>            - const: mediatek,mt8183-disp-gamma
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-gamma
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> index 6eca525eced0..55391b5c08c4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> @@ -34,6 +34,8 @@ properties:
>            - const: mediatek,mt8173-disp-mutex
>        - items:
>            - const: mediatek,mt8183-disp-mutex
> +      - items:
> +          - const: mediatek,mt8186-disp-mutex
>        - items:
>            - const: mediatek,mt8192-disp-mutex

All these single entry cases can be a single enum.

>        - items:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> index 611a2dbdefa4..f7f89485a5ae 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
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
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index e71f79bc2dee..110e6b2747bc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
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
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> index 6ac1da2e8871..22c333d09465 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
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
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 8ef821641672..4f1c935cdf70 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -39,6 +39,7 @@ properties:
>                - mediatek,mt2701-disp-rdma
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-rdma
>                - mediatek,mt8192-disp-rdma
>            - enum:
>                - mediatek,mt8183-disp-rdma
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
