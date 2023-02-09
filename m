Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01308C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWuuUdo7aS+R+xwyMPT4inxSLLiy9YRKAIGpnfs3mMw=; b=E87RALn/b6ANNmVzYs59FjzmDw
	WS39rIVfTHDPnrP1N0vblpJv8ef31vWt4MuuS1C2zeL7TpGFv6oQ2HhTE+8CM8CXjOakHxTLqTXO6
	Of9eaK3Bte2gblNoe+jBVv/R8cVryR5huArR1868SGSc/z3X/aMsKSyFMtN2wfn9IUjplVhTKRZp9
	UEK7W+9HNAjkVhz6EMhKHYnx/BLNv0QW95NpHyVJMc5gHxfmvFzaV1RHJkJPo5gOkcOO+b6PVW3te
	KzwgF05rqvFQI2NGlYy6p+8wFgYcpJPnmrUjCaC49vatI6LvIoGf5L46kOMBvHAziT6Fv2Iy1RpOD
	HDStm0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2Nr-000ZNm-7H; Thu, 09 Feb 2023 08:34:23 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2Nh-000ZJ6-9g
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 08:34:14 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 6so567969vko.7
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 00:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gWuuUdo7aS+R+xwyMPT4inxSLLiy9YRKAIGpnfs3mMw=;
        b=mnc8Ifx6QnAPmYWW1FKA6DpGkfoRhUGOlwZyawmaWZUYXBRs3P3lMZ6UuiJN+OVnrP
         JYO03+hkMmh17dEbozQueyLF/rseofZe1Ytt3Bf02eSA13fv7UUEzVDkYLMk6yry8LOM
         c7xhnpHflipzPwMHeJMaqdWdhYrJCxv4p+PSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWuuUdo7aS+R+xwyMPT4inxSLLiy9YRKAIGpnfs3mMw=;
        b=1I+6aB7dOuKUKHpjYbRWuCBWoXFkHlrIpfj2lxM9RoQy7R7jlmYqvHGxvqW4r21omH
         4Fuy1acSZKD5J+84KDYdIVR567wTLkAMKcTMfGBShqUDu9o/t/5DFXfeSZ7DWoa9Mqod
         HiNOccDfbpdKU1E+/gqr5ZOhDEDxoWzM9i70KM8oYuFGWfd2dpq/SK4vHBWAOQDe9mj1
         5yGVRvf52Ck4dUZP1pPzkmCkpgRHMnXv4p4i1zljbfZOOBnyiVa1L3iws+vxbrxEt2Jw
         2NRrsmutqEmGKz+9+gZCPYnZpvKtZzZlX0zJ1/7kpbvctv07QFDe47x6Mnbv0bBQjg9Z
         qqFQ==
X-Gm-Message-State: AO0yUKWxvrGJExPfpSOMQ4jhwfoH7MTPg/5xufBEbxpT/PKakxWFtmAt
	dimmlsCKAm8bpYlBmOdBoH+e7ly1acYQKdgoYZoFOg==
X-Google-Smtp-Source: AK7set8pBou1qM81NL3KNWeDM08Kg7jVEwCB11009P47SaV8veeMsx+j8GewJrleWgySAp8Llo1VSXqxEKvDZ4DLKFA=
X-Received: by 2002:a1f:9493:0:b0:3ea:7394:e9ef with SMTP id
 w141-20020a1f9493000000b003ea7394e9efmr2102117vkd.11.1675931648111; Thu, 09
 Feb 2023 00:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com> <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 16:33:57 +0800
Message-ID: <CAGXv+5FXqEJaADrhgu-tPfEPPkP1B=bo_KytBH55xCRea4CmTQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: gpu: mali-bifrost: Allow up to 5 power
 domains for MT8192
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, tomeu.vizoso@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, 
	alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_003413_346354_48623433 
X-CRM114-Status: GOOD (  13.56  )
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

On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so.
>

mt8192 compatible was already added, so this should have:

Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 34 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 69212f3b1328..e7aba66ddb8f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -61,7 +61,7 @@ properties:
>
>    power-domains:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 5
>
>    resets:
>      minItems: 1
> @@ -141,6 +141,18 @@ allOf:
>          - power-domains
>          - resets
>          - reset-names
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - mediatek,mt8183-mali
> +                - mediatek,mt8192-mali
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
>    - if:
>        properties:
>          compatible:
> @@ -161,10 +173,26 @@ allOf:
>          - sram-supply
>          - power-domains
>          - power-domain-names
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8192-mali
> +    then:
>        properties:
>          power-domains:
> -          maxItems: 1
> +          minItems: 5
> +        power-domain-names:
> +          items:
> +            - const: core0
> +            - const: core1
> +            - const: core2
> +            - const: core3
> +            - const: core4
> +
> +      required:
> +        - power-domains
> +        - power-domain-names
>    - if:
>        properties:
>          compatible:
> --
> 2.39.1
>

