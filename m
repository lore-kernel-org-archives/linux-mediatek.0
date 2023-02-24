Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E08EC678DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUzlOGkuT0rri1NZcy3oPLiyFwjaeCiqRMJCuHFb5ts=; b=2pUAgjfyEsRuBUbcmMreeqgV97
	/8YLvga/GrNtVcguSo6dWMwa5xCpMWJ5KVnGtVfyIX5mYa/ctUw7rYjk6zzUjeqNSgKH9iHHjQrN9
	MMzV9NUVE9356tHes7Qicqn+bEkhlXgBtpzFk3T6HY0pJ2Ew47rPkolA926EFaeWcCrNcfA9l4CtG
	n48308l/eOUBN2v2KHKcbynJWVZbVglMLz3ZBCSMrmz8jxVxUJcwDWpJ0NFOFGLj68ya1CUqVhUYW
	EoCzWurzqdXmGGfwYwazeh0MZsy1yFsfnAl+U+7YNRpboStkHFm1+P5OrNHB2TyBsYHnzjvZfGAXh
	iln0iTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVlr-0028Vv-RA; Fri, 24 Feb 2023 10:57:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVlo-0028UW-Rb
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:57:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l2-20020a05600c1d0200b003e1f6dff952so1870706wms.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUzlOGkuT0rri1NZcy3oPLiyFwjaeCiqRMJCuHFb5ts=;
        b=dLreh8Yxx9kckvOfZdklyGyT2utdxcqAYoLD3p9a4v83wuopSnCDDCTGaXv54KIEQg
         HYn16dO3Oc5y2cTr2+l1u+X3s3DwdDED9B9auqLhQKERxmugO+WcUKG/x1Fc61aFEor7
         8qYRGkXuBeElYZuzxQHLCLA9wwgSrU5BXVDyPA4bX4ouiLj0HL1nOHCXo5G79sT2CF9r
         Ok5ISa0ZCDtHrCR1e4D2U12jI16IZrCqvn15mIxIMSBixhPWjr06VZenN7d8NEJ7pc3e
         OYr4csPS6itxsoPWEepLxbHpDqCnQjhYziAm/UyoHuwfZxFGfRzRU/DfUIh+zaj03QiU
         VarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUzlOGkuT0rri1NZcy3oPLiyFwjaeCiqRMJCuHFb5ts=;
        b=ZUvaZggz2p6toY6QS+HQ9xl4rwZaC5Bp49AZLWF0MnGIhCSOX0Oqs4A94DKnOhaIv0
         MNdGDL7nFrAio2L9RhaNPlLAFPwPbJFUcBHVqpVEknbShHJOl3K9P9/JB66pWtsKMkZL
         XVRnLGa5HLlsiBpnU8TvgGYv67mrkHE+6klLMV0WJ+cka5aCIQQOYqoPJTbLDPC7e631
         CM9l3a+AJ83TV9WSGBik1t7igJ1HKYhbjhYCbujV3vuoEyQMMQEa6Xp3rx2+g2Br5Sg1
         51DGzDlIy9tFjfRYblxHNEE5W2klFvgnLUBYBV0z2yTSYQsxYSs1w2L1BKE5N1vF8DP7
         +LIA==
X-Gm-Message-State: AO0yUKXA4WnPVqHAlPa0nz8XI95b/idHw/gjhLt/rAucQzMdxIbCQnFD
	JIHtKXAbPyFLP1a45kyQVnyOZg==
X-Google-Smtp-Source: AK7set8ofc+BvKAusfSUZGB0OaFA138AUMJg1kOmeEms6DUeu1XH/pOv+hyOfB0pioS72PKGct/gZA==
X-Received: by 2002:a7b:c7d4:0:b0:3df:de28:f819 with SMTP id z20-20020a7bc7d4000000b003dfde28f819mr11541352wmk.15.1677236263072;
        Fri, 24 Feb 2023 02:57:43 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c42c700b003db012d49b7sm8464475wme.2.2023.02.24.02.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:57:42 -0800 (PST)
Message-ID: <f38158f6-5493-5b85-1353-9b75f66ad0d3@linaro.org>
Date: Fri, 24 Feb 2023 11:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/11] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
Cc: daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 matthias.bgg@gmail.com, robh@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_025744_927828_3211BDCB 
X-CRM114-Status: GOOD (  17.51  )
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

On 23/02/2023 14:34, AngeloGioacchino Del Regno wrote:
> In preparation for adding new bindings for new MediaTek SoCs, split out
> the power-domain-names and power-domainsvariation from the `else` in
> the current mediatek,mt8183-mali conditional.
> 
> The sram-supply part is left in place to be disallowed for anything
> that is not compatible with "mediatek,mt8183-mali" as this regulator
> is MediaTek-specific and it is, and will ever be, used only for this
> specific string due to the addition of the mediatek-regulator-coupler
> driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 02699d389be1..ac174c17e25f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -145,6 +145,18 @@ allOf:
>          - power-domains
>          - resets
>          - reset-names
> +  - if:
> +      not:

I think this makes the binding difficult to maintain. You have:
1. if - amlogic - then - some properties
2. if - renesas - then - some properties
3. if - not mediatek - then - something else
4. if - mediatek - then - some properties

Instead just disallow power domains in each of other variants.

Best regards,
Krzysztof


