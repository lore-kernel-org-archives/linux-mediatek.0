Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD87C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ex4e1gAMfKgJufavu50b5FPTNtgN9MMTywAYUVv/rSo=; b=dPfLfYbFRaxt5K
	1RnrFTP/mu7unjsxHfjvO8+p4FQt98Fy0l6GzyArt3Kg2fmavtDZftsSRg8yOk0CzJJXfvm7B4qkZ
	/dOkNym7u8RvnSK9vxKErZtEkoAK6mzb6PdW/wYoLcWYa1Oc52vjpflqIYfQKLdqxSvoCRjERk28B
	X0eswrZpo88wd6m3vWA6RupeD4t9pQoIo8aOLnVdq+EHJ+OPA9jh/QQjuots77paWKjnfWay40Sbm
	1ccvcIUczoKSAXVLjf13k1fjLG+p0O2UG3kqLchlnblvEdngHPEMpndObZzaVu+yVMjzfjcwW/JnB
	O0HmgzAL3wsB3NpOaT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7z7-009phz-Hc; Mon, 06 Feb 2023 20:21:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7z4-009pgj-IT; Mon, 06 Feb 2023 20:21:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id o18so11595301wrj.3;
        Mon, 06 Feb 2023 12:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ex4e1gAMfKgJufavu50b5FPTNtgN9MMTywAYUVv/rSo=;
        b=XPTSpZZrnTnEBrJw4RPKyn08rM4GwX0nBLt0S5ELlaniKrqUEXMWI1czxM8lXshVYC
         CA8fh3a9gyig1DezP7p8WACDq29+5cWJ1FYsg+7cuS4msR4DzceIc86hNf98AsinqnhP
         kWjPRJadddk+JOvcJgcd0YYGQDeu8QIw8RtNJF4OUZ36WhcUHWZ/mf1jw/yLXiESFcFq
         K5kOwBwVgNLAMPwWbztGYqDrdYOGyQWq828mCP1m625n7MdqOnBwd5TPMf0BN1SwggH4
         4ZXvr4MHB+KCVmSAN3kl+bOJ62eLkecyq4X7NfG6A7sJVzRFciXyTpxoc9bp9NjNmT/z
         YVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ex4e1gAMfKgJufavu50b5FPTNtgN9MMTywAYUVv/rSo=;
        b=MljRcO2JB2Ay7bVYDg66KTK357L1Z9WYm7j53qPaL2jZCNZ/p5HGDTaeQzUemeZZDL
         3+N5gmjkQFLgtLRxz3b+x8pUV1VtJ6h13cXeB8q12vK+KaI9Rjm/rTIXuE6zizowgbUn
         Ddkugtr15S7xQh8pQJ2360svcQRcw86NikdbNnhwgE/eD64ST2zS2dDc5rBaM3Rj6pno
         VU5tmelOU2Zj5Ir6P15f2ma6wSIru8jeEBp/4ximYVhbGnJ9yo9ksUYzHIX7wjqUR3cT
         FqT7NDv4GOJtMqKmSevnh1Dd/L7U9Pp4/D1ChDwnL/YhS4MWSLs3UxqlAL4Fbr64FYBs
         XZNg==
X-Gm-Message-State: AO0yUKUUWvbjaF0nTWMNMxvslCbFFbIeGfoT2PtWn8F5kbdmMqb1HveD
	2856KOOeFZoX5e77VgPAbYU=
X-Google-Smtp-Source: AK7set8ldoPFjqGbTtujwy62UUH+LAzHrfMrth501Gur6mUru2ZVCWISA8okhMGgHRUBkyYWSasiXQ==
X-Received: by 2002:a5d:6a08:0:b0:2bf:de97:f3f8 with SMTP id m8-20020a5d6a08000000b002bfde97f3f8mr174292wru.28.1675714859909;
        Mon, 06 Feb 2023 12:20:59 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d4bcd000000b002c3e9cce04csm3180724wrt.111.2023.02.06.12.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 12:20:59 -0800 (PST)
Message-ID: <8f04f2b5-320e-50d4-9517-6dac989f63b3@gmail.com>
Date: Mon, 6 Feb 2023 21:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: mt7986: set Wifi Leds low-active for BPI-R3
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230205174833.107050-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230205174833.107050-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_122102_637737_AFA617F0 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 05/02/2023 18:48, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Leds for Wifi are low-active, so add property to devicetree.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index 33bd6febc160..2b028141f1f7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -446,5 +446,9 @@ &wifi {
>   	pinctrl-names = "default", "dbdc";
>   	pinctrl-0 = <&wf_2g_5g_pins>, <&wf_led_pins>;
>   	pinctrl-1 = <&wf_dbdc_pins>, <&wf_led_pins>;
> +
> +	led {
> +		led-active-low;
> +	};

The binding is missing this property also the driver implements it. Could you 
please update the bindind description properly?
Thanks
Matthias

