Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C07CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/GUF4i0vFgTkWf2Mt9fp99ozQam8AhnbOj0pG+H04s=; b=zhqGqEaR9Gsn+Ts5M/ZgjBgYke
	tZ7RWTCcJT1QlxQCXY0/fkgZWdzwu6KljBzTpbhVQs3CVmv8o8flrQf/zj+jG8wXL/v+Bd5dMhRAl
	G4fEOklWhIPEQl9B3L+2ESOmwkTcfmEQJjt9BIuHC1XYwH5DhhuQH/GEVPLeL01SjkCP8Tj0BnKwu
	8eDvCH7/DkMgDWjeKekSAIeBTXFN2y+3FKxV47WTVk+GzHkkZ+OXoMEQOKCa6GelFHjBluplz020A
	cg5y52laDeJsTwCLCN8PglWq0ASTqhWqsjLPGioAHGjbut5D1ueV0qqqgWU+pBA9zXjou74V/I6ww
	NgHij3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhNS-00FgDM-Ri; Thu, 17 Nov 2022 16:04:34 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhLu-00FfET-Hu; Thu, 17 Nov 2022 16:03:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d9so4565114wrm.13;
        Thu, 17 Nov 2022 08:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/GUF4i0vFgTkWf2Mt9fp99ozQam8AhnbOj0pG+H04s=;
        b=JEJQRUtTU6aO1gfL4hnGyIAu28Nz+3sErCohP/a27SF2qNRKheEocfENENDqbYDYeW
         BadHM0NjaGngJIEtZQtiM8tn1LUUy82Ys137jAlcv01zuHwWCbLwHQ5z/oEcxFvhFV3C
         kZ5b1dE1QKEc/0TgQCjFxt0TCZSlcfGMDsyYSuT4Id+Cz9Gx9/tapIOPAtdX0YONgcR2
         /+6tH4fBHEmHvC9QvW0RHXYW6VZa65b/lZH1JO/74k+OL/InyD4qkEsj6VImJ3bn6KqB
         2I6vLlA/8Evu6VzpNb0fa5/Z2IVnE3RjaVPzPysTgHMcYbfc2FI4Rzuu1T3x+ObTTMTd
         TRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/GUF4i0vFgTkWf2Mt9fp99ozQam8AhnbOj0pG+H04s=;
        b=k/iyuUqc6yVhQNIZyiKIyKOKgE+R0u2VdVGCzFDyaor8NZMF7bUTQUetsDvG+i5/UM
         823+dTWzx1IFNOJu2+cBMp0b41QNkOF6OQvg/MbgdHLrkGcl5VxXwV987N5+blWcH1MU
         MDOMXfcnSJ3CzQMy/lO1iMyG+HJ+ZG17Htczk3XPvK+ABoTzDkIflyvq2A62cQSF7m5M
         wrQ3C2xSmk49rys9QbxxSOn0Y6AHbCqDDwL5MY9AU7tAc7+ViD062oX287g6KaXjygco
         4pfeQ0+nIGufKBX4flOWoayzlQXWtcXG5ep2daCU1pLmvmaOS6VIuAcQHxdG/JP0NMl9
         jxQw==
X-Gm-Message-State: ANoB5pmSEO91os1GalsUuN1E3W3CYTNqyROUO5loVpJOIEkg4sFIuqwU
	jJiKo+dyMMRCLApN3XPwig8=
X-Google-Smtp-Source: AA0mqf4ij58cUxvN+eDGc6Ok87DeWvysOzClnmI6KelXix/YI/GztmA81kXcaEnZiZ5xhp4tK91HZQ==
X-Received: by 2002:a05:6000:78d:b0:22e:3d63:80bc with SMTP id bu13-20020a056000078d00b0022e3d6380bcmr2013908wrb.30.1668700974648;
        Thu, 17 Nov 2022 08:02:54 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c510200b003cf5ec79bf9sm1985849wms.40.2022.11.17.08.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 08:02:53 -0800 (PST)
Message-ID: <3ab0a069-355c-b3a7-450b-22e58d5f1ea8@gmail.com>
Date: Thu, 17 Nov 2022 17:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Flora Fu <flora.fu@mediatek.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
 <20221005-mt6357-support-v5-7-8210d955dd3d@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 07/10] arm64: dts: mt6358: change node names
In-Reply-To: <20221005-mt6357-support-v5-7-8210d955dd3d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_080258_636147_39CAEBE8 
X-CRM114-Status: GOOD (  17.04  )
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



On 16/11/2022 13:33, Alexandre Mergnat wrote:
> - Change the node name from "mt6358" to "pmic" to be consistent
> with mediatek,pwrap.yaml documentation.
> 
> - Change the node name from "mt6358rtc" to "rtc" to be consistent
> with mediatek,mt6397-rtc.yaml documentation.
> 
> - Change the node name from "mt6358keys" to "keys" to be consistent
> with mediatek,pmic-keys.yaml documentation.
> 

I think the node names should be changed anyway. So I'd advise to update the 
commit message and I can take some right away.

Regards,
Matthias

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6358.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> index 98f3b0e0c9f6..b605313bed99 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> @@ -5,7 +5,7 @@
>   #include <dt-bindings/input/input.h>
>   
>   &pwrap {
> -	pmic: mt6358 {
> +	pmic: pmic {
>   		compatible = "mediatek,mt6358";
>   		interrupt-controller;
>   		interrupt-parent = <&pio>;
> @@ -355,11 +355,11 @@ mt6358_vsim2_reg: ldo_vsim2 {
>   			};
>   		};
>   
> -		mt6358rtc: mt6358rtc {
> +		mt6358rtc: rtc {
>   			compatible = "mediatek,mt6358-rtc";
>   		};
>   
> -		mt6358keys: mt6358keys {
> +		mt6358keys: keys {
>   			compatible = "mediatek,mt6358-keys";
>   			power {
>   				linux,keycodes = <KEY_POWER>;
> 

