Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A658C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=od90tXEQYsjLrQqPYAWlVmlPm4cbiuRT6WyvN1iDenk=; b=3uBvYUlgoclbroBvVBOCkUX/4K
	ESk43qQnBlmGNlpsioEWAiXDndlrBbZR+RRhyz92YSrVosLUw8GC0SzhkNBZlQqw4atp5xD/Xe811
	Y7CZVJTTzWuYjkL1QZ/WHBlQcrxpBb/KwAlLyLAUoENi1ZM49yhsxDojmCxKMejY0zVTSjior/8bn
	oGYpPOXJDa76tUrJs1yUapnHKYyE0OdKV/vZT0PGA00L2MDvFm9bnmwkTHEB6W+fcQYXSgsshrtin
	Kf+/PvaV+BqeQQYAUGOxcd37noeQm7QY8zGj4/uWbHer+P+Lx5dF+9ZLghfqPWVNwZja7WMfUMqMZ
	16pJlOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Acz-00FFhD-8r; Fri, 16 Dec 2022 13:19:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Acm-00FFab-Dd; Fri, 16 Dec 2022 13:19:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h12so2441580wrv.10;
        Fri, 16 Dec 2022 05:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=od90tXEQYsjLrQqPYAWlVmlPm4cbiuRT6WyvN1iDenk=;
        b=AmhgfXlT7Zr6IxKscdrarNyqKPDbNmj2k9dpNeesPsji5wD+Db0h3vPAztXh9wFVer
         Tod6TKuBut7PCtzq1GKMYRFU+aHKZoNxEgsg621Ad2qwPF20sn3kVCtvM+rgt0E+DsdW
         mtuTx4/b36nfmKXVMFPkkSVe25uoesKImVf6UKKhAAOMqteor1jZdYyQcUK3eHYjwq4j
         sEvdrcjed3J4KtM+EUtiU++VdZgMngClY5kyW5w2aCVTeQMkiC2sPjjx5H9NaFgvXj3G
         AF6FnxDZE5IrYMb0oVkpjOGuTc4/TnlglNgsmWFxsQlCb9amLtpkJ2kAkf+cTIyUFB/F
         qOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=od90tXEQYsjLrQqPYAWlVmlPm4cbiuRT6WyvN1iDenk=;
        b=sKz/mEZuyAGzt6O+ocAZFhZPf0pbJSKtyQlfghge3cRAxROzGUlKmdp6WY2qBXipuK
         8Xd86GGWo+p2gtHsRcUvO4U7UedGAUWZUsQxqCpbHVa3Fu5U5zS2YHI/TRfshXpzO7QW
         aaBMff8a3oeHIEqdU9AM1syrAvDHY3gdg5mElDGjjJ+shbHBFm78g2rt5ULj1xSv2NHE
         +W+2UuTitgVc5oLRwpfxq33KWSIwo5bJDwMiU08H7pwFdGnQFI+BqT4yUrl4TOB0GOLn
         NGqQpgiGEoklw6N7oOhxp4PpLFImpHL1bq6WKijyHohINjD37Joa0i52qee9aE2yI8t7
         96+A==
X-Gm-Message-State: ANoB5pmTDYN9wvla2297d4wODkAbi+7jaLhtTnt+xmeNA8crvUBLwxin
	VeS77QYCLVe75Uk3QeRUjlE=
X-Google-Smtp-Source: AA0mqf4ydAM5HaZnbwmxIzH1A8yNfHgcWat0P0NjHYg57pGecMzD5e4Ju3k/zehUXw+pUJCL5UM2Xw==
X-Received: by 2002:adf:e44a:0:b0:242:763:34a5 with SMTP id t10-20020adfe44a000000b00242076334a5mr20371199wrm.2.1671196771125;
        Fri, 16 Dec 2022 05:19:31 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id x18-20020adfec12000000b00236488f62d6sm2250832wrn.79.2022.12.16.05.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 05:19:30 -0800 (PST)
Message-ID: <f1e85a62-0f48-c4d8-f674-9a51b348e615@gmail.com>
Date: Fri, 16 Dec 2022 14:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: mediatek: align LED node names with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221125144138.477198-1-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221125144138.477198-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_051940_494634_B3474B22 
X-CRM114-Status: GOOD (  14.53  )
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



On 25/11/2022 15:41, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern:
> 
>    mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pwmleds: 'keyboard-backlight' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

> ---
>   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> index dec11a4eb59e..77b96ddf648e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> @@ -13,7 +13,7 @@ / {
>   
>   	pwmleds {
>   		compatible = "pwm-leds";
> -		keyboard_backlight: keyboard-backlight {
> +		keyboard_backlight: led-0 {
>   			label = "cros_ec::kbd_backlight";
>   			pwms = <&cros_ec_pwm 0>;
>   			max-brightness = <1023>;

