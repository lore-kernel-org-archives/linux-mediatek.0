Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46D2C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWKzVegiwa5Stk0wIV2Qox87RUsnW7KUMQyCCHGUjVY=; b=GjYTLZPnhqZO3G5Xa9SlxW4HRR
	/A5JDLCDE6y8yDDbVbHjbKGobnvDFuNbbExCrCi26IJlZQlUMWnw3saZzr83yyHyeGkjfXA7klUnH
	JnBZxYwQ5U/OMeUOSiFEsj2u3CGBY2MOM9QGVmPLDs3BLNqn6hFaSrztCBJdTlRDoiuEvxK6LieAM
	d8XcFRIDgjOCiBDJrOtwCbPQD9qWRGoN6zEax2OUdZ4lNPLvWkN/LiPH5dbCZpoSkPTnSYVLIWT1g
	nyq3PD8ss5xNa3pQAaWqi4rqU+LSTIeJz0715YO8VLwZsDVlAavS+Ge3VTDdRjmMxch675vRyLPxR
	T0dl/QXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIau-002LgG-SP; Fri, 13 Jan 2023 11:51:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIZI-002KnB-M9; Fri, 13 Jan 2023 11:49:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id ay12-20020a05600c1e0c00b003d9ea12bafcso13191748wmb.3;
        Fri, 13 Jan 2023 03:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWKzVegiwa5Stk0wIV2Qox87RUsnW7KUMQyCCHGUjVY=;
        b=b9fmNtI/tk6TKyJHc4xoLPUwo1opwIrOQKmPPAFlzOTurbE31JKpEAE3F0o2WYXW17
         ojcVxoGg8MGLM+1Nds5k+KvjWzddVBq8sdvsLeAn3MOhSUllRWONR/sjKjcgq01VC2Wr
         ozVYrHBTUM081VyR5KFTkGSvvzTEcmhWaE7Z7r9LX9IQYrytDcL/duYthYIK2/Wxn9U6
         0jRE2l/GGk5ToTAwnUZXsO6jsxj2CGR7nYhvywFyoFbTzRK1/wHN4UXG4l8Xc/g1pcLA
         NaDVTAwp7UoD/3y3W56jEmtnqPo2zwvNxmDXRYg4ID2BdM6O79Wr+5EcNjRLLjRUnELr
         pWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWKzVegiwa5Stk0wIV2Qox87RUsnW7KUMQyCCHGUjVY=;
        b=o6SYwDmCtihUTuZQ0jTDWTp4i12cbMUCC+Z/NpToGRYDPWThuyn+hL8Lch+Tp/rifB
         u69U7XHEN2IFc7xzV4thbMRgxwdgpz6JbEJ+rK3fxdDWeVgQRY3Gj+9ruRrqyjB9LG3p
         NzOfoIizvWBtFfkPD9TLeT7kmGT8jE8AfHWcMW/XaFNsPKP1Ckj5oHXhkQf/szx6i+Cb
         0Enf4ESVPlGvbfDi8O0j+tZwEwRNQyl6/r/VNdQNLG7atDrrXf3/LB57d0Nen1cMwTkn
         poID7RqfmpuY7wPdqk9xBGa5i7tO2gGF+ErAc2mUIl4cn0AjssPoduPGlavuBd6oE/h6
         yCHA==
X-Gm-Message-State: AFqh2konR2o34mp0OJ/+Kzpg7byrzCgUsBnTVN95NgY6I9SfEr2zGmLK
	3J8ciL9kYl0KxXccI6MPf5Q=
X-Google-Smtp-Source: AMrXdXt/Srf7GhPk4XgIqbIIDQBdXs0//l9o+N1sHwWkEw1BEj3pon5jHwUtTE/D9v/Bo5fllTCL+A==
X-Received: by 2002:a05:600c:34ca:b0:3d6:80b5:f948 with SMTP id d10-20020a05600c34ca00b003d680b5f948mr58668937wmq.39.1673610591416;
        Fri, 13 Jan 2023 03:49:51 -0800 (PST)
Received: from [192.168.0.30] ([37.222.254.155])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c3b0500b003c6b7f5567csm2597704wms.0.2023.01.13.03.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:49:50 -0800 (PST)
Message-ID: <daed4793-3aae-f927-5634-cfb876709f93@gmail.com>
Date: Fri, 13 Jan 2023 12:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 6/6] arm64/dts/mt8195: Add temperature mitigation
 threshold
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230112152855.216072-1-bchihi@baylibre.com>
 <20230112152855.216072-7-bchihi@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230112152855.216072-7-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_034956_786742_A864580E 
X-CRM114-Status: GOOD (  13.43  )
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



On 12/01/2023 16:28, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> The mt8195 board has several hotspots around the CPUs. Specify the
> targeted temperature threshold when to apply the mitigation and define
> the associated cooling devices.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 153 ++++++++++++++++++++---
>   1 file changed, 137 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 683e5057d68d..0d6642603095 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -14,6 +14,7 @@
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>   #include <dt-bindings/power/mt8195-power.h>
>   #include <dt-bindings/reset/mt8195-resets.h>
> +#include <dt-bindings/thermal/thermal.h>
>   #include <dt-bindings/thermal/mediatek-lvts.h>
>   
>   / {
> @@ -2413,107 +2414,227 @@ dp_tx: dp-tx@1c600000 {
>   
>   	thermal_zones: thermal-zones {
>   		cpu0-thermal {
> -			polling-delay = <0>;
> -			polling-delay-passive = <0>;
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
>   			thermal-sensors = <&lvts_mcu MT819x_MCU_LITTLE_CPU0>;

New line here please.

>   			trips {
> +				cpu0_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};

New line here please and on other trip point definitions.

Regards,
Matthias

