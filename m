Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48993ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKCOZrldnYduNnL61xc3dc80JAPoqtyn7Zl7i0OXJcg=; b=bYJ4jSqsfctqpRRToR11WZj8iq
	DJGxb5IXEggcMmdN9XHu3Gy/ZBoIfIY4Xpr/FVyKMojTUqfYTK+5HP4chFzeEl/6yMVv8MtHOF+QJ
	EQJkmcdsPyJMi00msEzIRjkNdswV2QRX8wycexoUacXMXPqQbdIqu+lJl9RLY7ezJVfzCiXGgoqYT
	Ijt5MdSuL7icD+jM5VYyFAErWZBgCbhQkNM9NL2uA8MxQhvmDUNgdy0aTuKILVez9g0y3J7wOQaLo
	J19Ch1cHaDO0fT6xgtwRgs+XV65DlzjOd1T/40ml/RLfa6h7LeSP14En3NOksVocbIlJlNIKCTk2j
	WQHxPKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndmX-00000001tJp-393O;
	Mon, 09 Sep 2024 12:46:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncGb-00000001cYk-0IaX;
	Mon, 09 Sep 2024 11:09:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-428e1915e18so36011505e9.1;
        Mon, 09 Sep 2024 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725880147; x=1726484947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JKCOZrldnYduNnL61xc3dc80JAPoqtyn7Zl7i0OXJcg=;
        b=d0k/P+5F0wEQKlUGxL9Ph2Ofq3bY0jMhLbj15yM76vNyrkrLZQH86WNCcavo/+1di2
         XgCLDMKAxTATzqVZzlVrWOUzqlUp/oePikwACAeRcRFm+G+3t0Mj6vBj/TnnXdZn1ve0
         YwP/dRwiXnQ2Cn83RaG9XIrO2cD0WSZ0uCYwefrYFEijRXLVObf+KhZHKgsheuU8R1Wr
         Nhul+Mbpvgw+RH6hiFxkwOVJYfYYXQFKRKExYjWoOvDXziUXNRxxnc/uzyjc+JXhyUkF
         u43wOCpEG7nYe4p5WRVrX7S341UYy2NU7c6TL5Ftex6zio6KJf9SCI5/QFxMo+VBC6Ie
         +FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880147; x=1726484947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKCOZrldnYduNnL61xc3dc80JAPoqtyn7Zl7i0OXJcg=;
        b=NyXDHsmaUunWEckiq9xIQf4k7ERF59NylUcA5zlTpON0vKpjdkWm1DvYsPAsUYOKwf
         eBTRaP5ukvgMmyjpdwI2+VyEGsGVJj6ys6cxPD+pDRR0Be/szK1CxVyeb9XejikDD95J
         rA4HguvdcMriN0sZK9Oz0JCB44+jYFp8k6cneVc6EtO3ah4DoBN1Ih8lg5qdGV+KSr8Z
         77sjjoROqCbM6jiUSlSRXa+woajug8UTQtiYhdHA9cz/EVmD7rFMVPDlpxS5SEzR+TSl
         gppJqdmjN82psSwY/wD43bm6nQ5+tIr/6pgPghcC8EojWHsCgRLssxKzZl2vgvUWqYxW
         GWCA==
X-Forwarded-Encrypted: i=1; AJvYcCU+9IbJXXnCNCxDoLfw+XBJ6Mmf2zX9dhgb40SykzFsEAJOfdSo/iFEi3qnAXST2uBm352aKYl9ULDOvYY6FI0=@lists.infradead.org, AJvYcCXFbDzha9W2y1HGUPyo919FZy+a6X1Db9jL8CLn8UtPc5TrM+n6mEfoN6F1XI50JHV8il2Njf4qjuPQPe0NKjoI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/DB0lU82sdKEr5ffyE8Q835FDUmJMDXGZKd0FSIbQe+y9/bly
	MEEd6uaXCEJrIQJV/BQa1lXci6wHdC5CuLFio6sjF71NJjnwkbxW
X-Google-Smtp-Source: AGHT+IFQ8yFWuoufiSrwdwuCH7CB8tTaVfxMQgnOZD2dQGHhDOu3CcPRpeInWdYearb8IO9J7Szimg==
X-Received: by 2002:adf:f610:0:b0:371:82ec:206f with SMTP id ffacd0b85a97d-378895c71b8mr7345837f8f.16.1725880147087;
        Mon, 09 Sep 2024 04:09:07 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d3765sm5762004f8f.74.2024.09.09.04.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 04:09:06 -0700 (PDT)
Message-ID: <252cba39-b55c-4ea8-9a5e-271b77a6a064@gmail.com>
Date: Mon, 9 Sep 2024 13:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: kukui: Fix the address of eeprom
 at i2c4
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <eballetbo@kernel.org>, Ben Ho <Ben.Ho@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240909-eeprom-v1-0-1ed2bc5064f4@chromium.org>
 <20240909-eeprom-v1-2-1ed2bc5064f4@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240909-eeprom-v1-2-1ed2bc5064f4@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_040909_146760_D4D8EDEA 
X-CRM114-Status: GOOD (  13.44  )
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



On 09/09/2024 10:33, Hsin-Te Yuan wrote:
> The address of eeprom should be 50.
> 
> Fixes: ff33d889567e ("arm64: dts: mt8183: Add kukui kodama board")
> Fixes: d1eaf77f2c66 ("arm64: dts: mt8183: Add kukui kakadu board")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++--
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index bfb9e42c8acaa7c2e5515888a77fe97258a1b78a..ff02f63bac29b2c473bfdd90a15aba09c2915271 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -92,9 +92,9 @@ &i2c4 {
>   	clock-frequency = <400000>;
>   	vbus-supply = <&mt6358_vcn18_reg>;
>   
> -	eeprom@54 {
> +	eeprom@50 {
>   		compatible = "atmel,24c32";
> -		reg = <0x54>;
> +		reg = <0x50>;
>   		pagesize = <32>;
>   		vcc-supply = <&mt6358_vcn18_reg>;
>   	};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 5c1bf6a1e475865fc0f6187e9733d7d98908797e..da6e767b4ceede9f5258274fbd702c6e6929f515 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -79,9 +79,9 @@ &i2c4 {
>   	clock-frequency = <400000>;
>   	vbus-supply = <&mt6358_vcn18_reg>;
>   
> -	eeprom@54 {
> +	eeprom@50 {
>   		compatible = "atmel,24c64";
> -		reg = <0x54>;
> +		reg = <0x50>;
>   		pagesize = <32>;
>   		vcc-supply = <&mt6358_vcn18_reg>;
>   	};
> 

