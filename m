Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45448C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 21:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkMgIg4fQzJfYGBpNPz1PQWebK98PEAd/0J55gUrVm0=; b=r0wmvBX13+JVq+67aPpPFlPZMF
	OuRHfBqVnAfhImtlU3DtAUgjg62AVyOILAQ2oiWSY0Eey3abUfgw6F2TUZvqzuDE65lKPqfjxvxYu
	+M3gdIV5KppAOEJzFRGrveBOtQIpc9bV7SLHH3bBJFMMIrOyzQe6xXVgD4K9ubqsTQTNqXUWpb6Qv
	LL9RrbKunq44EX9vslUTUNu67LGLYbnPLo7KrDICb0u3d+XvEOQMNl2qlc9MGWsxLL+O64M27JeRL
	tSVizPckTxj8s8Hf6Ersl0wCTuDq5561EVje45XHmt60XHoUzN7VHkNwSLZMICLkOvIz+asVZEsTS
	zZNs/8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLVtA-00GTns-Nq; Fri, 27 Jan 2023 21:04:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLVt7-00GTm6-7U
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 21:03:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id m15so4285969wms.4
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 13:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkMgIg4fQzJfYGBpNPz1PQWebK98PEAd/0J55gUrVm0=;
        b=pIeiRMg6iet/r1JbKwx+ppFEX7mnWDj3z/GmW+2pjB7E/EPYLGB29PrD+iixK8ht10
         7+/4l7qeZbTNIsFkNx0//SaoK4Jzz0NlNTUWSc/kgdMPrmxA0f70DLOtHtn4OOKr63dB
         wW8ATi21Iw94Q35XHHSBWGOlMjPKy7dHbtSO7ELAzdQrsfbBIcePZc6bbd11ET0eBR10
         ruipHy9HN9JSul9GQv28PDQAMHaqpr6rYvAa//IqivLeKP3sRJZAwIyY5TeMmPcaWNoW
         e4ZBYUkZNyU6+yAPNlJCv+yOXHSqWJn1jccigMdVoiMtORSen/RiUs1PDGRKTjsbne1h
         tXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkMgIg4fQzJfYGBpNPz1PQWebK98PEAd/0J55gUrVm0=;
        b=0+t8YbKjQ5k81aadOL+UxCf1C3VEeZZcRxYMpGPH9xEFQLwH0rWH8q/0VT7rFSNiY5
         WszrGPHyrNZENMCUCgAJNlNlhce7wGh7S/CiaQPsK2te+94+B5iCLijJMcD6DULU7sbG
         tsmfGYRyIwoOqlM+hrE0+Ao1PkRkk6DhyMp/eGjAj8vBDcCScgPE4hpiMRwUTHVseUmm
         tafmXRA7QF4pn4/L8C9kOVglfQxFR6IEBORLejonVi3AMeFJreDlsdwKHpkwdoxN8VdO
         jsH4IMB+Tx1xlyuHqfKFpq+fuAT/Ung8prx1oGT4VV7X31Nr4XujyRgvkGPI5zFgne72
         ODew==
X-Gm-Message-State: AFqh2kr7qTrcbMGHTeeIn5T7GjURLS2DwJ5678pV0P3rm1XoskpzWve0
	7qFiR9y7RRDLxHQ1utt+doRmgg==
X-Google-Smtp-Source: AMrXdXsl90rZ6ZM9bYIrrvDZZ3ypzuTE9VNVL3N0wOe3smxl6WFD5ugsqSaWPbOjg6ZDMt5BvOe9tA==
X-Received: by 2002:a05:600c:5d1:b0:3d0:761b:f86 with SMTP id p17-20020a05600c05d100b003d0761b0f86mr41605947wmd.28.1674853433500;
        Fri, 27 Jan 2023 13:03:53 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id x10-20020a05600c420a00b003c6b70a4d69sm5078137wmh.42.2023.01.27.13.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 13:03:53 -0800 (PST)
Message-ID: <7a01c3f6-3800-472e-e18f-82af1b3f8d9e@linaro.org>
Date: Fri, 27 Jan 2023 22:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 5/5] thermal: mediatek: add delay after thermal banks
 initialization
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Michael Kao <michael.kao@mediatek.com>
References: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
 <20221018-up-i350-thermal-bringup-v9-5-55a1ae14af74@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221018-up-i350-thermal-bringup-v9-5-55a1ae14af74@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_130357_330161_D5F4BD7B 
X-CRM114-Status: GOOD (  19.57  )
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

On 27/01/2023 16:44, Amjad Ouled-Ameur wrote:
> Thermal sensor reads performed immediately after thermal bank
> initialization returns bogus values. This is currently tackled by returning
> 0 if the temperature is bogus (exceeding 200000).
> 
> Instead, add a delay between the bank init and the thermal zone device
> register to properly fix this.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/thermal/mtk_thermal.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index b8e06f6c7c42..ab7db385afb3 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -730,14 +730,6 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>   
>   		temp = mt->raw_to_mcelsius(mt, i, raw);
>   
> -		/*
> -		 * The first read of a sensor often contains very high bogus
> -		 * temperature value. Filter these out so that the system does
> -		 * not immediately shut down.
> -		 */
> -		if (temp > 200000)
> -			temp = 0;
> -
>   		if (temp > max)
>   			max = temp;
>   	}
> @@ -1160,6 +1152,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, mt);
>   
> +	// Delay for thermal banks to be ready

Coding style for comments is : /* */

No need to resend, I'll take care of changing the comment format.

> +	msleep(30);
> +
>   	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
>   					      &mtk_thermal_ops);
>   	if (IS_ERR(tzdev)) {
> 

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


