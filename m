Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C318C47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 17:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95OPS1tFdX5PrQFwKZmThyuzQsT0o/V/Eoez/6QXBhc=; b=Nv13kxUENOdcD/
	Ojw/NsmqPTrMzPoIGdPuhLEDYDU0c6Qsim4sR8/gVCT4SwSubspXq8n3KKcYjiHPzIcUsLiKR80hF
	Mi74XrMRJFSJDryenddSjROJF5MLXSLk6FEp755M9xe6LxSym9lIEVZ6cCE9byQrJ3tOVHEfEj78Q
	XVbLe7tm/Vfn3lQUbuDEfl3/rxEmmQApgFtzK4ANIffUpYdoHNiW7sADTFJPFTIAwkbKeXA9OWWPP
	6bW8KwFTGANZ+IoLWYwl4gM4JYyhCGN7n44d/a7KGShE1I3FSaGKmIiMZ08ULQzUc5c7FX0bHTw/c
	4cNNA+MoDRgvIeU4QH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxxD-00DBKH-05;
	Mon, 22 Jan 2024 17:19:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxxA-00DBI0-0L;
	Mon, 22 Jan 2024 17:19:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-339231c062bso2281539f8f.0;
        Mon, 22 Jan 2024 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705943956; x=1706548756; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=95OPS1tFdX5PrQFwKZmThyuzQsT0o/V/Eoez/6QXBhc=;
        b=ICsIwfkz4EfEnlV4zNiilkaWixRGD7hAaHUvauJ1npoh6IyhWsF1hqtvEraK/dZohN
         ducdD8TSiXRkKnxh5s4Hs7ywsunO5/aln3mz6KCJSov5vXTA3PXJmMOjtga8IygaKowZ
         lS4d7IyQphXx+jlXpVDnGKjkHhsUrsw8Xy6vZFxeZcff2qoc9fPumnBHJTM0LVAjG+66
         QcG9KKc8joGvFaMEeyRh5vuLTOs6TpiJRX5v2G+BCTotNMuHBKT4zrkCfwn9/s3YE5lk
         JnCH01KCmxoJwiONycz/vYPHWXIAWjmkZZDEkEo6nSZtEGGWvA9/pUREpyTSUbLEJ0HC
         WJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705943956; x=1706548756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95OPS1tFdX5PrQFwKZmThyuzQsT0o/V/Eoez/6QXBhc=;
        b=U48HV2D3pWa2z2/Q5ICSaYQSx63R0SF6vHKXbHt95alj0WxjwHTlfkt4iSAMmNsr8U
         /t2nGKnWwbc6nbjnnKwS40Cyo40vIj0yjTJ9yT1A2BX7+BD/nIiTJDGcnFL4IHiJO6mB
         ICHgLN1isibzR7mSXktd1cuERLUaeTb9TsjsT3jtBy1zj5DTP89aYbEqFizSFrhD40ut
         Win91OJ1I6HorC8ujC7Anjwn1TwAdsl/9nIXvJ1ggCxxAs4ubh8dqcVSVRnhcw1YmKbx
         TCP9saZXVaMvIk6D1nHPDvnZBWZ6l52fjar62FseWPXbBkmOOatrbf5eA/yRfUyDrxwe
         Oqag==
X-Gm-Message-State: AOJu0YztDKX4zENslk9kMdKjF3LRwcEOK7iWB4qwJ4mYLIUt3THMsP9+
	F8zvTw0weBIAXSPCLu1eW8EN8klqHO1/210YY8Ft1hRFxfC0plli
X-Google-Smtp-Source: AGHT+IExjA8MkPBu64l79mu+HBGB9TfyR0tFUEp30P7s9AyKhXJaFmRoeFf4OrYUTiUeomQov7AyUQ==
X-Received: by 2002:a5d:6383:0:b0:337:c2a0:d03f with SMTP id p3-20020a5d6383000000b00337c2a0d03fmr2544057wru.138.1705943956151;
        Mon, 22 Jan 2024 09:19:16 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id v29-20020adfa1dd000000b0033929310ae4sm6762287wrv.73.2024.01.22.09.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 09:19:15 -0800 (PST)
Message-ID: <878716a8-87c4-4642-b6be-6ff832027bf9@gmail.com>
Date: Mon, 22 Jan 2024 18:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7986: drop "#clock-cells"
 from PWM
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240101182040.28538-1-zajec5@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240101182040.28538-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_091920_147810_4EAB5A30 
X-CRM114-Status: GOOD (  14.08  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/01/2024 19:20, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> PWM is not a clock provider and its binding doesn't specify
> "#clock-cells" property.
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pwm@10048000: '#clock-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
>          from schema $id: http://devicetree.org/schemas/pwm/mediatek,mt2712-pwm.yaml#
> 
> Fixes: eabb04df46c6 ("arm64: dts: mt7986: add PWM")
> Cc: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Both patches applied, thanks!


> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 6caac6ebede4..8a64d1027c46 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -196,7 +196,6 @@ pio: pinctrl@1001f000 {
>   		pwm: pwm@10048000 {
>   			compatible = "mediatek,mt7986-pwm";
>   			reg = <0 0x10048000 0 0x1000>;
> -			#clock-cells = <1>;
>   			#pwm-cells = <2>;
>   			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&topckgen CLK_TOP_PWM_SEL>,

