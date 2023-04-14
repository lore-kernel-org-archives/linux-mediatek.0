Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C397C77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJKYiVcyPTMIO212Xaa81Dv2egDEM+1isH5+sbiFNtw=; b=ygWX7SwiXpVoS3rzLnyJB4dKZT
	50FLbXbLP1+22yor++bwzlOKGZ3ENShbPdDbzRztqXCi7VRPrvJ8EtUO6f96y3e3vS6ZgZ3TIcYa7
	tR/NUPZnzxHJLAU5KSAJ5io5r8S0J36sp1ZBhBzOS5Ekrt+yvVPwYeXNjfBiUTyIF+KkM9O8CveTF
	55qQIldGv1wf9G4nsJYHZxVawiohJ0fHiBgzNJenBaGi+7XjN8as4CGQ8Pqk0kp/m9VtmI3Cr2EX5
	eVyrDJ8wPyY62mytc+JWhXsbshiqEqrLWFt0tDzTqBToze/RFF4XyOckhJLvQsjHUpMnkOkGr9O1I
	ab23cH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMaF-00A9Lv-1Q;
	Fri, 14 Apr 2023 16:47:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMaC-00A9Jp-2u;
	Fri, 14 Apr 2023 16:47:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id j15so4435156wrb.11;
        Fri, 14 Apr 2023 09:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681490844; x=1684082844;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJKYiVcyPTMIO212Xaa81Dv2egDEM+1isH5+sbiFNtw=;
        b=WVEOqQQgBVSmwOoYClrlw78Y2D0CKqfwYC58Vx03s6zqrMtjJ8vOnoRAkyShPd42vV
         J/RcSXBJ/JesbpFdG/nGaoGSQxJhWwkk5LrPXfuQvL3cK7jivHUNDv6/FLuQNVqObfrQ
         rdEuxZfROGJbRZ1u1COPBsPdxm00rC3odL8n1wJ4XkuVP0PbY5i+Yz3OHGL1BIbcUbPA
         lvxIZLBA+/HLuxvqJjn0t8Tp2HE3fXnuzPbsdXJIxYBMR7vSLFWTeYwd5OuKO5TXS2mX
         KmX/sovsOckWxQYlz0ue4PbiWpBGJaDZ3IHJF7Fp7Fg3akfsSq2WbDekVWW558hEYN+t
         I2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681490844; x=1684082844;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJKYiVcyPTMIO212Xaa81Dv2egDEM+1isH5+sbiFNtw=;
        b=Mpdczd7f2iipolNhocfq2xrIaeVgs12PvSfk6Z+1k8Uv9fqH8dq00dH0uL4gTRsqeH
         MIrPhKkmgUFpAhT79Ook+Wyosglh+GfT+dVMZ7EB+SIMvhf09VQ/5A7sZ0kP7PjcZcSE
         k5g7X41WQZaAW1iXGaUxGxMiJhkDSCREjHehC98J9XnjY8FYb8L7TJ5jgqQf2hkY9FPy
         oZnXMiC7ajBDZTtVUyd/nxY86sPydtlD7StqZayTQA4ALNhRtybcq7DVtfVNsBEtCa+r
         JXdZnqURrv6Jv26VQDz+RtEX7I+e7moTp0i5o30D/gJXrHx5IQhU9GdfK2p5cg4DnVwi
         jkFQ==
X-Gm-Message-State: AAQBX9dUu/N9Wvs4jk1M7nVgbUS3cLMK53n+dGu1zRVo6b9PnLvxFdSS
	V8l3XZZhzHUzk9ZwAulqLrg=
X-Google-Smtp-Source: AKy350ayARE0wsSfVwRFheCOXyRFXtIHmD5clP7slQBUE/kO+LVmaQ3YmrA9ke7sVqJ0Pn9mmIAfew==
X-Received: by 2002:a5d:4592:0:b0:2ce:aa73:4960 with SMTP id p18-20020a5d4592000000b002ceaa734960mr4596931wrq.5.1681490843935;
        Fri, 14 Apr 2023 09:47:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e1-20020adfe381000000b002efbb93c461sm3902302wrm.25.2023.04.14.09.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 09:47:22 -0700 (PDT)
Message-ID: <f8ab9e20-2590-9095-4f18-c332a43a33f2@gmail.com>
Date: Fri, 14 Apr 2023 18:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: display: mediatek: simplify compatibles
 syntax
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_094732_941499_146A4AAB 
X-CRM114-Status: GOOD (  14.06  )
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



On 14/04/2023 10:33, Krzysztof Kozlowski wrote:
> Lists (items) with one item should be just enum because it is shorter,
> simpler and does not confuse, if one wants to add new entry with a
> fallback.  Convert all of them to enums.  OTOH, leave unused "oneOf"
> entries in anticipation of further growth of the entire binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> 
> ---
> 
> Cc: angelogioacchino.delregno@collabora.com
> ---
>   .../bindings/display/mediatek/mediatek,ccorr.yaml   |  7 +++----
>   .../bindings/display/mediatek/mediatek,color.yaml   | 10 ++++------
>   .../bindings/display/mediatek/mediatek,dither.yaml  |  4 ++--
>   .../bindings/display/mediatek/mediatek,dsc.yaml     |  4 ++--
>   .../bindings/display/mediatek/mediatek,gamma.yaml   |  7 +++----
>   .../bindings/display/mediatek/mediatek,merge.yaml   |  7 +++----
>   .../bindings/display/mediatek/mediatek,od.yaml      |  7 +++----
>   .../bindings/display/mediatek/mediatek,ovl-2l.yaml  |  7 +++----
>   .../bindings/display/mediatek/mediatek,ovl.yaml     | 13 +++++--------
>   .../display/mediatek/mediatek,postmask.yaml         |  4 ++--
>   .../bindings/display/mediatek/mediatek,rdma.yaml    | 13 +++++--------
>   .../bindings/display/mediatek/mediatek,split.yaml   |  4 ++--
>   .../bindings/display/mediatek/mediatek,ufoe.yaml    |  4 ++--
>   .../bindings/display/mediatek/mediatek,wdma.yaml    |  4 ++--
>   14 files changed, 41 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index b04820c95b22..dc22bd522523 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-ccorr
> -      - items:
> -          - const: mediatek,mt8192-disp-ccorr
> +      - enum:
> +          - mediatek,mt8183-disp-ccorr
> +          - mediatek,mt8192-disp-ccorr
>         - items:
>             - enum:
>                 - mediatek,mt8188-disp-ccorr
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index 62306c88f485..d0ea77fc4b06 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -22,12 +22,10 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-color
> -      - items:
> -          - const: mediatek,mt8167-disp-color
> -      - items:
> -          - const: mediatek,mt8173-disp-color
> +      - enum:
> +          - mediatek,mt2701-disp-color
> +          - mediatek,mt8167-disp-color
> +          - mediatek,mt8173-disp-color
>         - items:
>             - enum:
>                 - mediatek,mt7623-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> index 5c7445c174e5..1588b3f7cec7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> @@ -22,8 +22,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-dither
> +      - enum:
> +          - mediatek,mt8183-disp-dither
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-dither
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
> index 49248864514b..2cbdd9ee449d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
> @@ -20,8 +20,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8195-disp-dsc
> +      - enum:
> +          - mediatek,mt8195-disp-dsc
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index a5c6a91fac71..6c2be9d6840b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-gamma
> -      - items:
> -          - const: mediatek,mt8183-disp-gamma
> +      - enum:
> +          - mediatek,mt8173-disp-gamma
> +          - mediatek,mt8183-disp-gamma
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-gamma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> index 69ba75777dac..2f8e2f4dc3b8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-merge
> -      - items:
> -          - const: mediatek,mt8195-disp-merge
> +      - enum:
> +          - mediatek,mt8173-disp-merge
> +          - mediatek,mt8195-disp-merge
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> index 853fcb9db2be..29f9fa8f8219 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2712-disp-od
> -      - items:
> -          - const: mediatek,mt8173-disp-od
> +      - enum:
> +          - mediatek,mt2712-disp-od
> +          - mediatek,mt8173-disp-od
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> index 4e94f4e947ad..c7dd0ef02dcf 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> @@ -21,10 +21,9 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-ovl-2l
> -      - items:
> -          - const: mediatek,mt8192-disp-ovl-2l
> +      - enum:
> +          - mediatek,mt8183-disp-ovl-2l
> +          - mediatek,mt8192-disp-ovl-2l
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-ovl-2l
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index 065e526f950e..92e320d54ba2 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -21,14 +21,11 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-ovl
> -      - items:
> -          - const: mediatek,mt8173-disp-ovl
> -      - items:
> -          - const: mediatek,mt8183-disp-ovl
> -      - items:
> -          - const: mediatek,mt8192-disp-ovl
> +      - enum:
> +          - mediatek,mt2701-disp-ovl
> +          - mediatek,mt8173-disp-ovl
> +          - mediatek,mt8183-disp-ovl
> +          - mediatek,mt8192-disp-ovl
>         - items:
>             - enum:
>                 - mediatek,mt7623-disp-ovl
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> index 27de64495401..11fe32e50a59 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
> @@ -21,8 +21,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8192-disp-postmask
> +      - enum:
> +          - mediatek,mt8192-disp-postmask
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-postmask
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 3ade2ece3fed..42059efad45d 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -23,14 +23,11 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-rdma
> -      - items:
> -          - const: mediatek,mt8173-disp-rdma
> -      - items:
> -          - const: mediatek,mt8183-disp-rdma
> -      - items:
> -          - const: mediatek,mt8195-disp-rdma
> +      - enum:
> +          - mediatek,mt2701-disp-rdma
> +          - mediatek,mt8173-disp-rdma
> +          - mediatek,mt8183-disp-rdma
> +          - mediatek,mt8195-disp-rdma
>         - items:
>             - enum:
>                 - mediatek,mt8188-disp-rdma
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index 35ace1f322e8..21a4e96ecd93 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -21,8 +21,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-split
> +      - enum:
> +          - mediatek,mt8173-disp-split
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> index b8bb135fe96b..62fad23a26f5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> @@ -22,8 +22,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-ufoe
> +      - enum:
> +          - mediatek,mt8173-disp-ufoe
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> index 7d7cc1ab526b..991183165d29 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
> @@ -21,8 +21,8 @@ description: |
>   properties:
>     compatible:
>       oneOf:
> -      - items:
> -          - const: mediatek,mt8173-disp-wdma
> +      - enum:
> +          - mediatek,mt8173-disp-wdma
>   
>     reg:
>       maxItems: 1

