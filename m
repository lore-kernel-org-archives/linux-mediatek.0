Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA005C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXtZ8jTLGIvEBWYCRTpBhewkMkogoQ9bFzj7hAi4Wtg=; b=21K93GSPrD7iioeZpL/atGShnJ
	v04/NyilqsFVSKrdIlfkOiFfrPpjWz/sGz7Xkxb++38blOu4M0A4NM6GKN/iML7z6129nrJbbWHJs
	MPtb048ouQ6YCSGVz8cg6f1BEatJysNhQGqpx4kNqCWKm68NwmngfWHYJ3XXXljrR8Fi+F0n5OnOh
	Ca8NwSz9tl+r3Z1BXm56DK4vs7hMZZg+vPzcVQ2rBER0fF1DxS86vcasrf66VFZEc7l2Hy1BdaWA1
	GO262f9tknnWimtFHRCW6SzDu0tE2yPvZWr/rap+qkVFYMfDn5yQA1FrTG/6bu9b/oSWaYwgQxePs
	0wJeSMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3doy-00AlUL-18;
	Mon, 29 May 2023 14:26:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dou-00AlTM-3A;
	Mon, 29 May 2023 14:26:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30ae901a9ffso1225460f8f.2;
        Mon, 29 May 2023 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685370359; x=1687962359;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXtZ8jTLGIvEBWYCRTpBhewkMkogoQ9bFzj7hAi4Wtg=;
        b=CtQyVaqVUpQtQQJZ9jec28L6SLkbwl9snhpTaa3zgPPN6JigSwMqEGpZ2L9te1RxEm
         dbddbM1aasXrU1DpFm5I8jDwYs+WuPO4bhDSaHdctK6Edar1OmIwprHqda5sIqtQmA6a
         XPRXAugKnnxK4kOrlLSvQCeTjYtPKjdPls1WCVCiDeqwHmQ9CxXR5gzoXpwWUAwp1MDC
         jXvIrKvjLMdtUkgIlqR01vnB250SUePsItLH6zjLVq4LqNNQGqLwN/jd4M1f63Gixcfu
         nHDKlQBDsjfZ3Sxft8vmsG3H+LOY5VObwvJ98NBO8Yt8FZBGqvFtjSXWTDER4X+YT0yS
         +EnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685370359; x=1687962359;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXtZ8jTLGIvEBWYCRTpBhewkMkogoQ9bFzj7hAi4Wtg=;
        b=jyIx92Izzca1UE///0rv69mhqTXhN+zU6Clqzw+J9LQ/MONSFoFbm5Of/zu6eHxK6c
         /56ageFJA/Tyg7dH+00gJbahbiKVlg+lYw0r6Ihuf/chr6RYDJ5e8qNUZIu6ws+j4AbF
         p65nj1+VE4fmwA2O6SHsFWP5qXaLGrXv19YYoiQ9RrnXnwJORruNwr0h/tz20kf09BBa
         0mVa8X55Sk1hGkGuBC8hEpiZP1z8LHcp9fTlUW5RVKXRHuNIlXr09bWfn9V5G00ZLU8j
         9YeO9fhdVKrfJfz0k45aS5A9Cwqz3myDLS7TwKgH3lCcPrQlp2g7w+ShMnBElGZ4Qq9F
         fLRw==
X-Gm-Message-State: AC+VfDybQbMBXfoBP74yANhHIaDQBiYEneewYGknLeai7ecW3nkeowPy
	fIbBwDZLs4/sgRi4Vm42tKfGUjpaL0e3QQ==
X-Google-Smtp-Source: ACHHUZ75e2K3NjqMzIg1RWmj1krj3NbJ1QjixBfZ2gImSczXxJoYNdhM2rHgT47jRzLvjBUC7KveHA==
X-Received: by 2002:a5d:6291:0:b0:309:e24:57b3 with SMTP id k17-20020a5d6291000000b003090e2457b3mr9982997wru.4.1685370358984;
        Mon, 29 May 2023 07:25:58 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d4583000000b0030649242b72sm78475wrq.113.2023.05.29.07.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:25:57 -0700 (PDT)
Message-ID: <3aeb528f-4425-4be9-091d-068e8419334e@gmail.com>
Date: Mon, 29 May 2023 16:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] arm64: dts: mt7622: handle interrupts from MT7531
 switch on BPI-R64
Content-Language: en-US, ca-ES, es-ES
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <ZEA-DV_OsmFg5egL@makrotopia.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ZEA-DV_OsmFg5egL@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_072601_020468_40E68457 
X-CRM114-Status: GOOD (  16.14  )
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



On 19/04/2023 21:16, Daniel Golle wrote:
> Since commit ba751e28d442 ("net: dsa: mt7530: add interrupt support")
> the mt7530 driver can act as an interrupt controller. Wire up irq line
> of the MT7531 switch on the BananaPi BPi-R64 board, so the status of
> the PHYs of the five 1000Base-T ports doesn't need to be polled any
> more.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index d583e816684cf..aabd104b12acf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -150,6 +150,10 @@ mdio: mdio-bus {
>   		switch@0 {
>   			compatible = "mediatek,mt7531";
>   			reg = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			interrupt-parent = <&pio>;
> +			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
>   			reset-gpios = <&pio 54 0>;
>   
>   			ports {

