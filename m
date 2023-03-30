Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B45CC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKcsS9RzCGec1E//KXDqFuO125uv1xUjBzG3GmeKye8=; b=BkjHgu4VYIQfSG0NbgWqRNYucG
	aww4MyLxMIKeh3FGFdcB5VVS7j5eX43QDFwWVe3NsY+0ESx7tsGA7QpfctrTXbQVs2rL3NcDflLSF
	ayNEsqiHkWr65xPeQyv6PGLwa+cqYZxYjf+Zw7qe4hdwqQofPTNiEZFnNqlrfmsTNeErVbzxLFRgl
	PeTrHkzi+jmTylP7vokl9wZmiUF/8+QIkMtlTchqVu+U+6qhEM8bXgr4kFWE6vvroavQTcGTcoD/C
	a027bzH8w3dsJ87u7Uce64C7oz7P1e8jLzK9O5VN3kmD1VOdWn0G1Ujy6K5R1MORtj0qDN6YnM0r0
	5SU9KBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phwAq-004ezy-14;
	Thu, 30 Mar 2023 17:34:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phwAj-004evT-1x;
	Thu, 30 Mar 2023 17:34:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e18so19888981wra.9;
        Thu, 30 Mar 2023 10:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680197684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKcsS9RzCGec1E//KXDqFuO125uv1xUjBzG3GmeKye8=;
        b=dNK04s5t55ImmI318ms5Q5vMBO6oGsmgyndXUx2HwP0KcT03d4xUijqy9mx9MidUla
         oqnhQbfNk27Gv4tSdtc9YCZqR9JnL83ry2Ph5XWSSkjhQXQzOFZkN48wR8eRDOMVqh65
         /zGwapoRE4auJbHsNTt+aaVjCyO+2Y6MvnMKQaTJ1ueAUS8b98TgPaTj3h6ntiSP9O9E
         wp8IWnm1g7WKdojuXFP1+q7hApx+SmDNfWbnF7oeTOG3QljXLNb7fa35PK6kbTpwxdfT
         JP53oDnNjI+IOjOMCylwS/S+SqPzybQh93EOpgRw1RW+NaIf/eupOZWphDnVZijch8Tt
         3Bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680197684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKcsS9RzCGec1E//KXDqFuO125uv1xUjBzG3GmeKye8=;
        b=R5ZLdvTJ47VLBFBjz2+FC1xt4iFE64pxMgSqbBj2DIbdt4pKuKmPzNwsKLIQxQYhyL
         FYVl/3LfLlfyH7ehPaLp7bmGofBbNOnX+HTvkjoxnhiRSVR2X/eCAKSBlfDI6OcblCPD
         6l73c5wZz+q+oT+7JcUdXMrljBtz/Um4FxM5yW5/ApZJ59DlZId9rWC6mKb80pP49WbW
         amqT39Pdx57/qrs82HYwzf+2QjEUONH4AxpmIvP0AuGvm2WtepKr/5yQo3f0TVGd/cOl
         eWsTppbmZb7FPgKwNFNl3WOS2idfqSjN0JOmaJF1S98u+qFr3GwECtvk//QAR1WgwQDf
         hexA==
X-Gm-Message-State: AAQBX9cDJEdJY37Plje1uXhnITurVqjVkOBV5MmmaPx6HKuAL8DyeWWF
	ofA3FRzdOjNyAVdwNiFlc/I=
X-Google-Smtp-Source: AKy350aqPaeaRaIzLq93xnKLSwV1qqKksBHcvZw5qKcC1QEWi7p3c+y9jOvEB5VB6d4m4y575WhvRQ==
X-Received: by 2002:a05:6000:ca:b0:2d6:5afe:7b91 with SMTP id q10-20020a05600000ca00b002d65afe7b91mr4918787wrx.30.1680197684064;
        Thu, 30 Mar 2023 10:34:44 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d67cd000000b002e40d124460sm4189268wrw.97.2023.03.30.10.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:34:43 -0700 (PDT)
Message-ID: <8c917be2-e15a-921f-aaa9-b8753d2463de@gmail.com>
Date: Thu, 30 Mar 2023 19:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 16/17] arm64: dts: mediatek: fix systimer properties
Content-Language: en-US
To: amergnat@baylibre.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-16-0003e80e0095@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230203-evk-board-support-v3-16-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_103449_655305_8B24F7CC 
X-CRM114-Status: GOOD (  18.82  )
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



On 29/03/2023 10:54, amergnat@baylibre.com wrote:
> From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> 
> MT8365 has a SYST timer (System Timer), therefore the compatible node
> should be "mediatek,mt6765-timer" instead of "mediatek,mt6795-systimer"
> (which corresponds to ARM/ARM64 System Timer).
> 
> Plus, register range should be 0x100 instead of 0x10.
> 
> Finally, interrupt polarity of systimer is LEVEL_HIGH.
> 
> Fix the above properties accordingly.
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Patch looks good but does not apply cleanly because of previous patches that I 
didn't take and need rework. Please resend the patches I didn't queue with the 
comments addressed.

Regards,
Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index c3ea3cc97a47..959d8533c24c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -575,9 +575,9 @@ system_clk: dummy13m {
>   	};
>   
>   	systimer: timer@10017000 {
> -		compatible = "mediatek,mt8365-systimer", "mediatek,mt6795-systimer";
> -		reg = <0 0x10017000 0 0x10>;
> -		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_LOW>;
> +		compatible = "mediatek,mt8365-systimer", "mediatek,mt6765-timer";
> +		reg = <0 0x10017000 0 0x100>;
> +		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>   		clocks = <&system_clk>;
>   		clock-names = "clk13m";
>   	};
> 

