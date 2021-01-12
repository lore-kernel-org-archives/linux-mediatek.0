Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C48C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 15:08:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A9D23134
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 15:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A9D23134
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Sf1yX55tM1Yvv9p8ziYBvLroR4pNugPlyZbx0TiFz4=; b=c6pKJRNOkkeGiLCTKMPjIfY8I
	AWxcWDdcF8tlyuD6KNyEJIECFppqvmJPicREKlgCtvSbssRBg+cWsYtA3jIsQY8iICR2mj1BHsbHR
	3GvF/WqqzcbbJV986Bl4chEWRXh8pXof4VASjWxnSWsLNkSi44c0lZLWJx7KhEk52i406whkwV6Ew
	+S2UhCt7L1OUiR/ueXU3ldQztEWABE+TSfJGC73XZm9/lFmkAAV3WdiezKOk9ggGDXw6HClIreWRF
	WQW1vZfxk6LCMRYM7xkD75i+wA1I0F1xiiC2Aeq4C9Vih+bcDdYJvTdHFvDhqVV8j5FzsIWu4kQQs
	Y1ZacG49g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzLGo-0005R4-Ro; Tue, 12 Jan 2021 15:07:42 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzLGb-0005M6-96; Tue, 12 Jan 2021 15:07:30 +0000
Received: by mail-oi1-f169.google.com with SMTP id q25so2607193oij.10;
 Tue, 12 Jan 2021 07:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YURvgP9BUjHljOosNLiDIA3f2KWxkQAmrOPayfecXYk=;
 b=Gld5U1CUmef215eb6hxpVtqOlEImihyS+Ok9YRMFgTBK3/aFolW/D/8vwZXNGYwcm0
 kl+YGMKMhn5krssazpW3rtCimn2LoTIQSf/oFZJP7sqInV/LzChQDaOZrEQcs5IgfHjx
 CfO2wSmEiBLjhGZzKWKiHzeGCKnYp/hH6aplf0TS2fSMWuhe7xFwQAkxED/8qTOvTqKr
 7/Fr9Yc80v0Cs/P6vOgoMkw/uY6fQotXsn0VCdMyN3H2/NX/OiGvvR0o9l17PDMJH9o9
 7nWYcePPkDbt2Q3TQpBXBIGoal7AaFWDKQwhKFDlMFx7WNjkOQRWKSXy8clGBdHXuOKA
 ZoMg==
X-Gm-Message-State: AOAM532jcqoYx7qQk7QV3QJecGY0XngItdLwEmlQk9odsvmLdPWY6wZA
 +tX9c0L+1amdop2nHSvkNw==
X-Google-Smtp-Source: ABdhPJxRuf1QKqeifgfkDYrkLo0q/suBbG48tctoUk5301xqgCa7AnfdCV5cTj3rX+62Im9zvPvjRg==
X-Received: by 2002:aca:cf03:: with SMTP id f3mr2312654oig.39.1610464048303;
 Tue, 12 Jan 2021 07:07:28 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p4sm693676oib.24.2021.01.12.07.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 07:07:27 -0800 (PST)
Received: (nullmailer pid 353855 invoked by uid 1000);
 Tue, 12 Jan 2021 15:07:26 -0000
Date: Tue, 12 Jan 2021 09:07:26 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v9 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Message-ID: <20210112150726.GA330364@robh.at.kernel.org>
References: <20210108011011.4061575-1-drinkcat@chromium.org>
 <20210108091005.v9.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108091005.v9.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_100729_416066_E616387F 
X-CRM114-Status: GOOD (  19.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 08, 2021 at 09:10:08AM +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
> 
> (no changes since v6)
> 
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
>  - No change
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> 
> Changes in v3:
>  - No change
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 184492162e7e..71b613ee5bd7 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -17,6 +17,7 @@ properties:
>      items:
>        - enum:
>            - amlogic,meson-g12a-mali
> +          - mediatek,mt8183-mali
>            - realtek,rtd1619-mali
>            - rockchip,px30-mali
>        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> @@ -87,6 +88,30 @@ allOf:
>      then:
>        required:
>          - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-mali
> +    then:
> +      properties:
> +        sram-supply: true

This has to be defined at the top-level or there will be an error when 
it is present (due to additionalProperties).

In this if/then you can do:

else:
  sram-supply: false

to disallow it if not 'mediatek,mt8183-mali'

> +        power-domains:
> +          description:
> +            List of phandle and PM domain specifier as documented in
> +            Documentation/devicetree/bindings/power/power_domain.txt
> +          minItems: 3
> +          maxItems: 3
> +        power-domain-names:
> +          items:
> +            - const: core0
> +            - const: core1
> +            - const: core2
> +
> +      required:
> +        - sram-supply
> +        - power-domains
> +        - power-domains-names
>  
>  examples:
>    - |
> -- 
> 2.29.2.729.g45daf8777d-goog
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
