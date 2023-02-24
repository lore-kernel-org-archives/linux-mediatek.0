Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B0AC64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxT9FvHaPhscbfESj3x0Ux9E1/gu3fQSaddPYs/H2Hw=; b=J73pYtn2A4rrt3JWcznmrIoDK9
	2XRgSpOaJ8QMysS8d4DG7TKkZ6f5ug47wzfEFkMxTrJj9jPdTB200EOBYLCfD/ElB5T1YOtgUROZl
	rC0UsSMOIUCXoPAF6kYkQXH272iJ61OGuCfs51rU6Al0q+IDGZKtwJ6OZ+EWzJtaJdUdGAu/13crB
	jApqehaocyAgXNkFdKR4s/5/VZE1fir3mNJPNoIhf3VHtMFdwxTn+uPjEUQP6ZXQAmECd1eP/+nWD
	DNHhFmWsiqklSGNnKCO5BgHWtsjCGbeZLxjXYeMWFJE5nYg++hDrSfoRB7C9U4lVG3l/4Bek38xY7
	FqX5/QCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVma-0028na-0c; Fri, 24 Feb 2023 10:58:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVmL-0028fs-Oo
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:58:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id h14so4819294wru.4
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxT9FvHaPhscbfESj3x0Ux9E1/gu3fQSaddPYs/H2Hw=;
        b=pkSDpRPNfOn9j5B7JLq6oB+YolUwofphUahCjYotC5/zcNg+W6lKUwh5QWY3BYN1oR
         Gj1jdTuiZftrUBREWDqpORisvEZBVn9C2k5v9pWY85/XXkWnXUm0uSYfw3wLCFwjujMs
         Zl16tD7QX6gfR1oPj9qS3V2HAmUyZ+3PQmqwyagTmYUtjr96Ly8aoS7/6JpbdoiB2Dyy
         hQJK5+w4ANFxENTCR3wIoHqFs1EAghWnunjb9IPuLuyhaIF48ZJVoob+7f9ODMOetTAx
         VWGcYJgfkzFkH4QdZs9sc2XepmVEZ/LZpxR9qgjae3Zht2Js/OqwmXVN0Mq+PqYCzyNq
         o7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxT9FvHaPhscbfESj3x0Ux9E1/gu3fQSaddPYs/H2Hw=;
        b=LoPGCkLaGYR1H74cdJUP/EMLRtv8e1vAdFnIU+WKb3zfoKkNvOZZeydgh2yh++UhSF
         40QSNKLI9s9yhxzU42gEA66QG+JzBsbW3+RjTpvq8IYiu3/Fy4cJjhv5PkUaOYozw808
         9YM32q+LuURLENaYZLr49xMV7yqNwLxR9wdzCPnMT0snJlK1HPHXb6dVSXsuE7nSYQ68
         ET2WHblrQJq42aZAsPGufuNpKZx+L93MNZQvtGbX/NRZiDYCOZw7tCmVk2H6/RpL0jET
         hRN+06s0WH+nnMAPf8cKN3p+O9AOGLo2Bf4XV4gKHxxlry3HcWa/Qt0o4o7Q+9WSqy58
         dVFw==
X-Gm-Message-State: AO0yUKXQ8M8IFDB2tnAxT18t8uEH2Zhs8kZjFkKk1hKw8+wgI6glb0Vp
	wGaWKw+8v7kLhs+RUokKRJaXNg==
X-Google-Smtp-Source: AK7set+7RhqsPgSckFc9YeBO3C0XfgcgNt80h0N7RD356kt/ThYv7bc6ee/ItorJfO2nByqDumA7Bg==
X-Received: by 2002:adf:ea07:0:b0:2c7:420:5d52 with SMTP id q7-20020adfea07000000b002c704205d52mr10876348wrm.62.1677236295491;
        Fri, 24 Feb 2023 02:58:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y6-20020a056000108600b002c53f6c7599sm11157554wrw.29.2023.02.24.02.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:58:15 -0800 (PST)
Message-ID: <d0ca7b78-1fa6-d999-e010-e633ee3dbf19@linaro.org>
Date: Fri, 24 Feb 2023 11:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 06/11] dt-bindings: gpu: mali-bifrost: Add support for
 MediaTek MT8186
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
 <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_025817_817710_F67CAB40 
X-CRM114-Status: GOOD (  12.50  )
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
> MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
> two power domains (one per core) for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index be18b161959b..b9424f3ebd5f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -20,6 +20,7 @@ properties:
>                - amlogic,meson-g12a-mali
>                - mediatek,mt8183-mali
>                - mediatek,mt8183b-mali
> +              - mediatek,mt8186-mali
>                - realtek,rtd1619-mali
>                - renesas,r9a07g044-mali
>                - renesas,r9a07g054-mali
> @@ -159,6 +160,7 @@ allOf:
>                enum:
>                  - mediatek,mt8183-mali
>                  - mediatek,mt8183b-mali
> +                - mediatek,mt8186-mali
>                  - mediatek,mt8192-mali
>      then:
>        properties:
> @@ -204,6 +206,22 @@ allOf:
>        required:
>          - power-domains
>          - power-domain-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8186-mali
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2

as well:
maxItems: 2



Best regards,
Krzysztof


