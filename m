Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AABC54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 21:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqerTmqCpFsIa1KRiULFzNXiXHPUW2LZKvRlLneTfEQ=; b=IxVYf+NmZT2SBUW74DKJu1X/5L
	x0/4Qo1WyvhfWChjbVk0z+JBASwYMkAajOpSqf0UawUQAhbRBX+pyN5OzYGpz+E5ijN01ctCA1WZ2
	sqIxlU0krD8JUXsVveF+8pIEscsW9H7bNtytFuAftzavQjo4ZUNYWcDfKbVmmzgnvHS7xKvedZ1hG
	OBdpFtnzy/uPfd1lxrAicxS87STPMAISel/N5vywetxFtutM1l8AVZbJNL4jqd1txq64OkeFLLL9b
	HBJfmXVp7CWPCS+PYLiOBtEtTwPIfgTPHd5rQRz2we4uxAvGpPhxTszP8IiT/eLdj9DNAdQ01tN+9
	TXnGYGww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWhn-00GbeN-Hm; Fri, 27 Jan 2023 21:56:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWhc-00Gbc8-AB
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 21:56:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso1609409wms.4
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 13:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqerTmqCpFsIa1KRiULFzNXiXHPUW2LZKvRlLneTfEQ=;
        b=H1Rk8VryoASg11PvNTDuM3J56d0mozernw4AtwgbYoJ7ZwsIPeyuMitK8grqsr67EX
         DfmazJbfDGjXUIjHoKI3avvpMUSqMdh1yi3dxMCDmbD19dCUMuv4bcrIVgRJjLI/8H9t
         XkVtziVt0NNICp6viBAM8mihP36nl5z4I7kW2l2Omf/SJ+LOQKMnGIEjQsbn9Bhb9V0E
         g9RoPw4fP29OPkGQ6NmP3hsBggLipBn3+ek2f7LEOrJn0swNTcHjwiuOpLMKOOXZK+Hc
         BTRhUfQVfCu+Dfjv0KjKrcMVoaygciwf63+E9Xr0YaGJsLxq/9JiLp4h7agpZV6bvui0
         W7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqerTmqCpFsIa1KRiULFzNXiXHPUW2LZKvRlLneTfEQ=;
        b=017qRNbHPRmhIhApLrX5lBp6TUh7lSdRryCc3oRcvIOi5UHxBH4zgzRl6MrDhuALKD
         /F+svOCp0XTZIeMBt3yljTbN5rPofqOJSyHswNa6WNjylh7x1aWqKJbCb40ovSl0ShmS
         O+f6uSpWDzni7poCatDoyj0Zz4entylVrsmGrTwK7Y7HWtcSgylFOyxi0Cq34cxEdZH2
         UwHmaQb2yX70SxFY5/y9rAxQzx/0N0il+vjj5qxXw4GN6p0a4txZ9ZV0UIggG9gr+qCk
         v5URG7Sg5kxiIXbKZDrVuWpiwya+xe3tGxN+csa/g7ZwyVV491PxuD85JOXIoTh4wymA
         2wRw==
X-Gm-Message-State: AO0yUKVxpw5jeZ43fQ7gU2rJ5xR/kHPKO3/hFeTBuMGJqIQkRXP/Dw7n
	q2TohsjPNtET+eZ9s1nOLlpElQ==
X-Google-Smtp-Source: AK7set8lhMsGxWKiTW9iwcGiaAKYO/4Li3ypSywT8chYJiXQdCLq5KfVH9nlyUMEAsyGxHXV+f9MaA==
X-Received: by 2002:a05:600c:3b02:b0:3dc:4296:6d56 with SMTP id m2-20020a05600c3b0200b003dc42966d56mr2330462wms.30.1674856566752;
        Fri, 27 Jan 2023 13:56:06 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id h18-20020a05600c30d200b003c21ba7d7d6sm5298133wmn.44.2023.01.27.13.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 13:56:06 -0800 (PST)
Message-ID: <0cf41810-744c-9bbc-9a4d-abd686e14b9c@linaro.org>
Date: Fri, 27 Jan 2023 22:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 4/5] thermal: mediatek: add callback for raw to
 mcelsius conversion
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
 <20221018-up-i350-thermal-bringup-v9-4-55a1ae14af74@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221018-up-i350-thermal-bringup-v9-4-55a1ae14af74@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_135608_402667_608C854E 
X-CRM114-Status: GOOD (  19.47  )
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
> Set a callback at probe time instead of checking the version at
> each get_sensor_temp().
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

This patch has been dropped because it is duplicate of patch:

https://lore.kernel.org/r/69c17529e8418da3eec703dde31e1b01e5b0f7e8.1674055882.git.daniel@makrotopia.org



>   drivers/thermal/mtk_thermal.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 3a5df1440822..b8e06f6c7c42 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -307,6 +307,8 @@ struct mtk_thermal {
>   
>   	const struct mtk_thermal_data *conf;
>   	struct mtk_thermal_bank banks[MAX_NUM_ZONES];
> +
> +	int (*raw_to_mcelsius)(struct mtk_thermal *mt, int sensno, s32 raw);
>   };
>   
>   /* MT8183 thermal sensor data */
> @@ -726,13 +728,7 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>   	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
>   		raw = readl(mt->thermal_base + conf->msr[i]);
>   
> -		if (mt->conf->version == MTK_THERMAL_V1) {
> -			temp = raw_to_mcelsius_v1(
> -				mt, conf->bank_data[bank->id].sensors[i], raw);
> -		} else {
> -			temp = raw_to_mcelsius_v2(
> -				mt, conf->bank_data[bank->id].sensors[i], raw);
> -		}
> +		temp = mt->raw_to_mcelsius(mt, i, raw);
>   
>   		/*
>   		 * The first read of a sensor often contains very high bogus
> @@ -1150,6 +1146,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   
>   	mtk_thermal_turn_on_buffer(mt, apmixed_base);
>   
> +	mt->raw_to_mcelsius = (mt->conf->version == MTK_THERMAL_V1) ?
> +				raw_to_mcelsius_v1 : raw_to_mcelsius_v2;
> +
>   	if (mt->conf->version == MTK_THERMAL_V2) {
>   		mtk_thermal_release_periodic_ts(mt, auxadc_base);
>   	}
> 

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


