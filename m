Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FC7C48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6eKuM5hiNfpCJdIvw7bSfZ28KB0tLEv3DbshBhbNPg=; b=j/wpJu80l2IRqj9vDMQh2WhYlj
	QmZaJC+kimFa7sXoSYz3bYS1J+UQpgwPuHPvg5A5v/0X1eADwMx5Q7fn+nb5LoboxPk6W/kMjgrpf
	YZPGBJ+dODrvLifNpy9iLBYxLrDT0PJqKe7J59ilC/T9+UIOoeiAX6LYqmtbolryM5CBXOyHCfldZ
	5+trSYafcoD6QD98Z7+EJH8TmpGPhEpAP4pAzof7bYOyThbHUFxJHufVSyjaQ9Kr/zWT4pEXwx1Ff
	8oHEYdIFPp6DZAxXdkjgSQZeBzfjNitaQTblou8u5BA7+So24t3p7l/2nRoyG+T67rczSTn6YVixL
	8sTo3ZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBHK-0000000CEOq-05e0;
	Wed, 14 Feb 2024 09:10:06 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBHG-0000000CENz-3W29;
	Wed, 14 Feb 2024 09:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707901799;
	bh=qRIJNsuugD2BgpQqtNFfFv/hB/z44a84meYFsbMmD4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2x1dkUgNDyW5JLCrnDRj/UliNLk2CtBOzqkv1zgEF+04Ql/8NIwkeCGq2LY6BjSKy
	 ruwmXQJUq9uQFRBBmIvC+MQ7qY5AfnxltpS9jEy17lwLeOG+iE/jUuAikcfDiWeaqL
	 VikR0HzMzeFiaeTL6WHQCqThwpv5y9JXkTNBwzRb4hnxeE2VtybI+OMKoYGID0hJ7o
	 qZ3XWijWrmSn1n8fQ7aCatu0MWrbkhJwcl/65Z+QDGfg+F0fXQBw1fIi9lk7+GCAaV
	 6acvY/OepkcaWeO30N8qqCdA2dmFOSHsxWmqGaCG9csLgBaROD9xQlLLwUUhxwZKyn
	 gPT0K1j89dQRg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EF5783781FD9;
	Wed, 14 Feb 2024 09:09:58 +0000 (UTC)
Message-ID: <36baacb4-4aa9-421f-bde0-c4be7d7f4aa1@collabora.com>
Date: Wed, 14 Feb 2024 10:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7988: add PWM controller
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240213164633.25447-1-zajec5@gmail.com>
 <20240213164633.25447-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240213164633.25447-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_011003_032518_8A88D6D5 
X-CRM114-Status: GOOD (  14.01  )
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

Il 13/02/24 17:46, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Add binding for on-SoC controller that can control up to 8 PWMs.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index bba97de4fb44..67007626b5cd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only OR MIT
>   
> +#include <dt-bindings/clock/mediatek,mt7988-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   
>   / {
> @@ -78,7 +79,7 @@ gic: interrupt-controller@c000000 {
>   			#interrupt-cells = <3>;
>   		};
>   
> -		clock-controller@10001000 {
> +		infracfg: clock-controller@10001000 {
>   			compatible = "mediatek,mt7988-infracfg", "syscon";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> @@ -103,6 +104,24 @@ clock-controller@1001e000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		pwm@10048000 {
> +			compatible = "mediatek,mt7988-pwm";

I can't take this unless there's a driver that supports your device.

Regards,
Angelo

> +			reg = <0 0x10048000 0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
> +				 <&infracfg CLK_INFRA_66M_PWM_HCK>,
> +				 <&infracfg CLK_INFRA_66M_PWM_CK1>,
> +				 <&infracfg CLK_INFRA_66M_PWM_CK2>,
> +				 <&infracfg CLK_INFRA_66M_PWM_CK3>,
> +				 <&infracfg CLK_INFRA_66M_PWM_CK4>,
> +				 <&infracfg CLK_INFRA_66M_PWM_CK5>,
> +				 <&infracfg CLK_INFRA_66M_PWM_CK6>,
> +				 <&infracfg CLK_INFRA_66M_PWM_CK7>,
> +				 <&infracfg CLK_INFRA_66M_PWM_CK8>;
> +			clock-names = "top", "main", "pwm1", "pwm2", "pwm3", "pwm4", "pwm5", "pwm6",
> +				      "pwm7","pwm8";
> +			#pwm-cells = <2>;
> +		};
> +
>   		clock-controller@11f40000 {
>   			compatible = "mediatek,mt7988-xfi-pll";
>   			reg = <0 0x11f40000 0 0x1000>;



