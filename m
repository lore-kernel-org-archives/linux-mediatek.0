Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98614C742A7
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 19:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FrWOB0uVxHx56X9xrWxuDWJ/kb3JEYgMVQs34PVT2U=; b=nK2ftSOilgyQggm5/c3qB/yWOv
	4PUXJbZYQCVjacGSiRCgBvBjBFZw5ZllWfjao8oFlekHEGHh9PESOwglFxq5dtf/sDbAJLxSaaaIn
	16ega//x56X3C5qsLSa95/8UslInwQ9/2KAdRDmKs9C1sMhzgJ85+9BzP4izkr//Z7fsQlsfFi85+
	EJKRhi17EmE4yfJReZ7tA7M5DsvdoiOm9nl803hGnWD+7qGi3W3acrxBBcSxOka3lRqFRpdBj+2uV
	fFCSIOm+VimH4UClT+y5r752abGzknfi+IFup1EeyPiv7dgxhahq+X2Qr1kSKD4smTtqHafJbKthY
	h++aSpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz4D-006TKM-Vl; Wed, 08 Mar 2023 19:03:13 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZz3y-006TDm-Vg; Wed, 08 Mar 2023 19:03:00 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-17711f56136so4878568fac.12;
        Wed, 08 Mar 2023 11:02:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FrWOB0uVxHx56X9xrWxuDWJ/kb3JEYgMVQs34PVT2U=;
        b=NtnJtrc4I2M1coaFu9kReo3X304+tChBR0EPl+K/4L+K/LNgliCLqFvBXON2CrN5fF
         +md/0jgTQSVjzZuBBoAkBSK+oiUM+Tzf/hzY4LlDn892P99p3ctwyWxLNH7X0w7Ns9do
         oFGn9G4CBGsa0P0mc45zpJskQAmcUYyrxEPSRHYliGGtvytceRieQVfj22SIpH50+DAb
         a3uMqUIwFZCs7SR6EV6B9H89yPWuHI9tB3r5kJE7FLgSYDreqK9DRl5/KJC2MHQ7Fg6O
         v5jKz3rAPWg3LvuwVs8ds0NjsstGnjO0FStTybGccNLkfajrWJgIGCtqaNdrKXbXMel+
         VcWg==
X-Gm-Message-State: AO0yUKVDpTMNJgs5ZiRrNG8R7plHfNkIVk7Ni+XQmqhOFaiAC6yfGXxA
	NM13WqNb33EECdPsvKhr/Q==
X-Google-Smtp-Source: AK7set+DvjoWc1KWq2h3sKBZx+8CoWicRMFGWsEt1KRrNByZmsCl9/pHwHZRNzh/c5BtXW6lqvK2cw==
X-Received: by 2002:a05:6870:b14d:b0:172:80f9:a545 with SMTP id a13-20020a056870b14d00b0017280f9a545mr13141161oal.25.1678302178217;
        Wed, 08 Mar 2023 11:02:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d199-20020a4a52d0000000b005264a1472adsm1543777oob.15.2023.03.08.11.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:02:57 -0800 (PST)
Received: (nullmailer pid 3604331 invoked by uid 1000);
	Wed, 08 Mar 2023 19:02:57 -0000
Date: Wed, 8 Mar 2023 13:02:57 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH v4 03/12] dt-bindings: gpu: mali-bifrost: Fix
 power-domain-names validation
Message-ID: <20230308190257.GA3601415-robh@kernel.org>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_110259_044589_FCF1730E 
X-CRM114-Status: GOOD (  15.02  )
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

On Tue, Feb 28, 2023 at 11:26:55AM +0100, AngeloGioacchino Del Regno wrote:
> Commit ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
> incorrectly introduced power domain names for MT8183, causing
> validation issues.
> 
> Add power-domain-names to the base schema, allowing a maximum of
> five elements; since platforms having a single power domain don't
> need any actual domain name, disallow that for each sub-schema.
> 
> Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 5b7f1c9d2b30..bf0f7f1f71e0 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -65,6 +65,10 @@ properties:
>      minItems: 1
>      maxItems: 5
>  
> +  power-domain-names:
> +    minItems: 1

If you are disallowing for a single domain, then this could be 2...

Reviewed-by: Rob Herring <robh@kernel.org>

> +    maxItems: 5
> +
>    resets:
>      minItems: 1
>      maxItems: 3
> @@ -112,6 +116,7 @@ allOf:
>        properties:
>          power-domains:
>            maxItems: 1
> +        power-domain-names: false
>        required:
>          - resets
>    - if:
> @@ -136,6 +141,7 @@ allOf:
>              - const: bus_ace
>          power-domains:
>            maxItems: 1
> +        power-domain-names: false
>          resets:
>            minItems: 3
>          reset-names:
> @@ -186,6 +192,7 @@ allOf:
>              - const: bus
>          power-domains:
>            maxItems: 1
> +        power-domain-names: false
>        required:
>          - clock-names
>  
> -- 
> 2.39.2
> 

