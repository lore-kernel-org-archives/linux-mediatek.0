Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA66BC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZof/087BHj/A7Di0Gk0ZvGDmMzbyQKiyv3HZhGN3xw=; b=WisTDE9cipVWiCsmWSwE1+clzo
	Kt3kQFSkEZl1Sqawc303GVxv+2EMTktftCf1QtR1XZnz5Njfs3T2AS790Let7n9mi1n3bs7j7AItg
	h/F9ZTUmm/xnNe7v5ZqEDHSzbSlYf9MfacT+vflFpfQheBDO53nMTE7uFO71HbChq5DpsrDgSWVGj
	sDHn2domRKjfZTdSkYEql+QRjBSGph9jTjSupLZ+kzJDCOsIW/xr8Wp9xj4Hf8j+sn7Xudlrdqcro
	8BRLJspW8jeK1OdmpEVCuBscOK+uASB7kA7hX/VxTmYtLQCBZ2zBMLNGGVi2wqAn1zff+XelXWTzC
	oub6JyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXjNc-002O3b-R3; Thu, 02 Mar 2023 13:53:56 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXjNT-002NzF-Nu
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 13:53:49 +0000
Received: by mail-ed1-x536.google.com with SMTP id u9so18401955edd.2
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677765225;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZof/087BHj/A7Di0Gk0ZvGDmMzbyQKiyv3HZhGN3xw=;
        b=eIrtPDV/cG8h0VLLmJcXXTWUO8Jg3Qo6HxP4dQkg9P3u0Fn6CodkeQxrfuFSWYlIoj
         tfIZfDFPjIHCEBAJzzbDOFKm9caoaq/ph9xh8bmKh8AyGlpjlFEvOV4rXrtiIVXTIrBR
         23vID2oLuqovDF5EzpYqFN2O8vmNHGs8LJ7+7O0SiDuLFKL1Z13H4GCKPiglMKmMxeT2
         l2qcAWfjunTGjvlsMDG+mzt5qlHNipEcD9etIEHdgO3jpbgPMjeOtDMzFsCabgzjWJXa
         ABCSsGkpWfAjylMv7OyQ3r2TBByagPRD7uKsOEQQ+FMjkDfpcTP/qXCroIW86e/r98Cq
         E4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677765225;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZof/087BHj/A7Di0Gk0ZvGDmMzbyQKiyv3HZhGN3xw=;
        b=5VGVPx+wwVp42LW6cdCyOZlbu+WFDnCGqVWaD5f5KNQAEcc8Vvf2rT5zU29m9+7Aov
         bxPC1PLgjD0OX4V+M7sefY0ZYKZ5zyEfMvF/BhFzJ+YXmLdHq7Dc6OkFXIY8fX/dOFQI
         m1GX29bkdeyiInlVm72he3/1ThcSYl8v3Vm/SeSrlYgNmcR2LqmU3sTii/8Yab8XOe5L
         lvwvClIMs9v4M9/Ws14VQ1vrQH6i4zSvDydPnvSFRkOx0/e+4+vU6+ay74ZATw7Lg3sC
         4zA8ZxnyZp0L1i17vxUqs9aXavHyZGIl11b2ohz5ojFZ6EeK+Ed1jsdgNNxAUOCeulZc
         xEtg==
X-Gm-Message-State: AO0yUKXry2otLZyTldV4DDYgwJQxo8xfxJnKVuwnU1y5QH/J30U4HLlf
	wnwWlLymU+FLd4OlhqhZEKMvaQ==
X-Google-Smtp-Source: AK7set8qp/TQ+HJrn0Ii4dY4rTO5h8nKaJSn7kxrv2Kr+qtuoSVN+2tgswoIzGGoQ+TvT/Nh/UeqMA==
X-Received: by 2002:a17:906:dc90:b0:888:5d34:dc79 with SMTP id cs16-20020a170906dc9000b008885d34dc79mr14548417ejc.40.1677765225322;
        Thu, 02 Mar 2023 05:53:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z2-20020a5096c2000000b004bfc59042e5sm962328eda.61.2023.03.02.05.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 05:53:41 -0800 (PST)
Message-ID: <33edb557-f5c6-6ce1-2914-bcab2eca23c3@linaro.org>
Date: Thu, 2 Mar 2023 14:53:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: display: mediatek: Compatible list cleanup
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20230302133528.124113-1-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302133528.124113-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_055347_804740_834A8057 
X-CRM114-Status: GOOD (  15.55  )
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

On 02/03/2023 14:35, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Several DT bindings of MediaTek display blocks make unnecessary use of
> "oneOf" and "items", and have some enums with only 1 element. Remove
> unnecessary "oneOf" and "items", and replace enums that have 1 element
> with "const".	
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../bindings/display/mediatek/mediatek,aal.yaml  |  3 +--
>  .../display/mediatek/mediatek,ccorr.yaml         | 10 ++++------
>  .../display/mediatek/mediatek,color.yaml         | 10 ++++------
>  .../display/mediatek/mediatek,dither.yaml        |  3 +--
>  .../bindings/display/mediatek/mediatek,dsc.yaml  |  4 +---
>  .../display/mediatek/mediatek,gamma.yaml         |  7 +++----
>  .../display/mediatek/mediatek,merge.yaml         |  8 +++-----
>  .../bindings/display/mediatek/mediatek,od.yaml   |  8 +++-----
>  .../display/mediatek/mediatek,ovl-2l.yaml        | 10 ++++------
>  .../bindings/display/mediatek/mediatek,ovl.yaml  | 16 ++++++----------
>  .../display/mediatek/mediatek,postmask.yaml      |  3 +--
>  .../bindings/display/mediatek/mediatek,rdma.yaml | 13 +++++--------
>  .../display/mediatek/mediatek,split.yaml         |  4 +---
>  .../bindings/display/mediatek/mediatek,ufoe.yaml |  4 +---
>  .../bindings/display/mediatek/mediatek,wdma.yaml |  4 +---
>  15 files changed, 39 insertions(+), 68 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 92741486c24d..d8d78abd6c6c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -25,8 +25,7 @@ properties:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
>        - items:
> -          - enum:
> -              - mediatek,mt2712-disp-aal
> +          - const: mediatek,mt2712-disp-aal

This was I think intentional - it will grow. The same in all other
one-enum cases, it might be unnecessary change which soon will be
reverted converting back to enum.

>            - const: mediatek,mt8173-disp-aal
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index b04820c95b22..e72d2884bb49 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -21,18 +21,16 @@ description: |
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - const: mediatek,mt8183-disp-ccorr
> -      - items:
> -          - const: mediatek,mt8192-disp-ccorr
> +      - enum:
> +          - mediatek,mt8183-disp-ccorr
> +          - mediatek,mt8192-disp-ccorr

Such changes are fine.



Best regards,
Krzysztof


