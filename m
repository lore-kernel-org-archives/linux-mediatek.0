Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B8FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 18:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+q4HE3q0kFuX6zJD/AoKSEPYMT4srCjxYQrlBBjohU=; b=O0fedG+hA+YfxY
	64VM3oJ+ihW0ifw6A46Fk4Z8XTALuxXxCmzXVBqJaMF1Jtrh1NTJI8I0A582YuTh0WaQ59Npi3bmr
	WQ4WPhMStCWS9wTh4disYj0XUA2nmm7w/u8BkkBlUZks6e9K60QKn0z9kShkF3uqgtI2ZZ5NtOchc
	DqdPlygL2OortTHEOJEa1H4G6GeTv5MNwd7wvOolZg/za4pf5feGOHZ28bQaav/rgZZVaDO8o2Lme
	CmWB4kavWoEzJvYonmDFekhVFiyxbUZFd1bzh6jJe+L0RQVjMtSAkdyRgt0XPq5jlAcwgUQBDRlgC
	GshilhHgDlG4HKV2IRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPTj9-003qds-KQ; Wed, 02 Mar 2022 18:29:31 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPTix-003qau-EF; Wed, 02 Mar 2022 18:29:21 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so2877108oos.9; 
 Wed, 02 Mar 2022 10:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DDLkQjtsVkQCsb7mEStcIkC/qhgtCuwY/MfpFPALJyM=;
 b=tIPJJ3wIDcSOHmgGZLCJ5o/IkJKTmWEZpwrdYFhsN5QN+ZpbrgrxFfWdrT/BmpqWzr
 5WopYkyLQLeAI7BLpNCLL5LS2s2Cz4LyAwRxyeaU8EpLxffrinQyLoy1fl2m4nzo1QGU
 gBYslB9sLcD+4Cvk+EwtjgxR6EimROAeDEwYnvih1vtVxlXQ5CCD/wPUaDFxjSRAKrAJ
 BAoT7c4rIcPW4ptfUbg5jhp0YLYhDkdotyOMrTPf+k45ItQN7S3BNPI+vCs1f2Z7ck9D
 0KMdINL4NfFRqcSzKdPXNiIVXXSaGow7qKIEsGjwlqREl77LE/Tl07EJRikmXdFrD9l0
 P05g==
X-Gm-Message-State: AOAM533VXJA5CfALCjRS+yIWOipPurrvO6EjtOxcfEmyxp5ht/S6IkS/
 3sFqCX6TtQ5Sy3uJP4Uxog==
X-Google-Smtp-Source: ABdhPJwqJ83BEMj8ICVihFWXKcXZLet9FKLbMpQjJ9xjN7RYb6lJkezH8+mFjc0TP3O8aXVud+J10w==
X-Received: by 2002:a05:6870:4392:b0:d7:844:3d99 with SMTP id
 r18-20020a056870439200b000d708443d99mr912928oah.56.1646245758091; 
 Wed, 02 Mar 2022 10:29:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 s12-20020a0568302a8c00b005b010d92dadsm4690104otu.69.2022.03.02.10.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:29:17 -0800 (PST)
Received: (nullmailer pid 4010908 invoked by uid 1000);
 Wed, 02 Mar 2022 18:29:16 -0000
Date: Wed, 2 Mar 2022 12:29:16 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, jassisinghbrar@gmail.com,
 fparent@baylibre.com, yongqiang.niu@mediatek.com, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V5 3/6] dt-bindings: display: mediatek: revise enum to
 const
Message-ID: <Yh+3fPzns86LSIdi@robh.at.kernel.org>
References: <20220301080105.31323-1-rex-bc.chen@mediatek.com>
 <20220301080105.31323-4-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220301080105.31323-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_102919_506117_A45F8F61 
X-CRM114-Status: GOOD (  16.69  )
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

On Tue, Mar 01, 2022 at 04:01:02PM +0800, Rex-BC Chen wrote:
> There won't be more than 1 fallback for these bindings, so we modify
> them to use const instead of enum.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 4 ++--
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++--
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++--
>  7 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 191b56e16bee..bc1c70d089ba 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -31,7 +31,7 @@ properties:
>                - mediatek,mt8183-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> -          - enum:
> +          - const:
>                - mediatek,mt8173-disp-aal

Run 'make dt_binding_check'. This will fail.

>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index 6894b6999412..fc40e2981eaa 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -28,7 +28,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8195-disp-ccorr
> -          - enum:
> +          - const:
>                - mediatek,mt8192-disp-ccorr
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index bc83155b3b4c..22ed5d368cbe 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -32,14 +32,14 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-color
>                - mediatek,mt2712-disp-color
> -          - enum:
> +          - const:
>                - mediatek,mt2701-disp-color
>        - items:
>            - enum:
>                - mediatek,mt8183-disp-color
>                - mediatek,mt8192-disp-color
>                - mediatek,mt8195-disp-color
> -          - enum:
> +          - const:
>                - mediatek,mt8173-disp-color
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 9d89297f5f1d..2a82792b2625 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -28,7 +28,7 @@ properties:
>            - enum:
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
> -          - enum:
> +          - const:
>                - mediatek,mt8183-disp-dither
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index 247baad147b3..45f88bdf07bb 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -29,7 +29,7 @@ properties:
>            - enum:
>                - mediatek,mt8192-disp-gamma
>                - mediatek,mt8195-disp-gamma
> -          - enum:
> +          - const:
>                - mediatek,mt8183-disp-gamma
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index e71f79bc2dee..88ba3f27b0e4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -33,12 +33,12 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-ovl
>                - mediatek,mt2712-disp-ovl
> -          - enum:
> +          - const:
>                - mediatek,mt2701-disp-ovl
>        - items:
>            - enum:
>                - mediatek,mt8195-disp-ovl
> -          - enum:
> +          - const:
>                - mediatek,mt8183-disp-ovl
>  
>    reg:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 8ef821641672..56368c10d904 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -35,12 +35,12 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-rdma
>                - mediatek,mt2712-disp-rdma
> -          - enum:
> +          - const:
>                - mediatek,mt2701-disp-rdma
>        - items:
>            - enum:
>                - mediatek,mt8192-disp-rdma
> -          - enum:
> +          - const:
>                - mediatek,mt8183-disp-rdma
>  
>    reg:
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
