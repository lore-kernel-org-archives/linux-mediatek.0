Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E3BC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p31jk7oJoppAGvipyfcQkOKfkHgOguOdfo62urZGHvU=; b=Dv0TI8LrVKHNR9KNPRrd3+Re/0
	HrxQJb1BIr9+nbHqHqkwL1v31ZvwDWbmolDSeJvMW3qlww+sUi6vw3965aVFOJlju9tX8YezPxUad
	n0e710wpB2Si+SuLZXQbDTSnBLa/+7gZ+kQ+BFfuZIBFJMO1V4ZeC+CU6eyiULcG08TuXpWMWYm+O
	qV/nXnZVCzVOP/XFeMYp3vZ5qLljCKfRfYyXB3U/kfECTOr5DIiElazpxoa+ZksdOUuBDCEMpCMcr
	aNG75teGRWhHy0Dzb16KjtiE0748scGvcQG2EpUIU3qusBqhFg7lliM62QbtoTAaXDnbLvmQkYOTb
	5kk7a0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIY2R-0064la-4C; Thu, 19 Jan 2023 16:45:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIY2A-0064eT-2y; Thu, 19 Jan 2023 16:45:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id q8so2001709wmo.5;
        Thu, 19 Jan 2023 08:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p31jk7oJoppAGvipyfcQkOKfkHgOguOdfo62urZGHvU=;
        b=F2Zg/HFTLqmm+K1UCvTm13AYT09XXrhVLj5hyL4jJzM4ETw/oOfzGJ91QHVQkKygP+
         x5y4xrP/fP88kOijUZOpztyQO8KlV06CatSaAeNbLBwtnhJVIReIlVvOIpInkE8+kAyf
         9nAeUejSX/oHASky6LXt2uBUaNsmQeK8y4uGiTfWM+KDvfI+y9FZdsdect0DJx4BwBG9
         HwlK16lDRcL44GL03o+SSUbYtmcLlryq1YiO94/ea+TlXxvUM7TiIWf9Ct1pNMc6RhZe
         6VNJK6f1HZzLK6RHy848hcKXBzGUQYF5+vkhN19ULZCcflfkElRxloScVVjeyG7QMr/6
         MxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p31jk7oJoppAGvipyfcQkOKfkHgOguOdfo62urZGHvU=;
        b=eC0/QklwhTdgPObBYIUhkbnL6Dsb0WARnI97kFqCYJp9YJmuLpMK+zwWfVifMaYN2K
         2I9ZryXQy/wvew9mEXtNHrH9bUItkNEY5LWsAzCYiYtQXELk2Pr96K/b0sIXKPzJwVeb
         EK1PkLjSoVBnLC971K/dgYSLO3qBZqOqBw9Ndd6TpJ5+FEB1Ld4+UmjYhuVDZ7GBrmni
         n0WnzbHq1ApuFBT02cl/9xD/tU9qzyZKtWXgmgMI6HByrPGlVI5Eus87cNMwnueB+WH1
         56V7xwFy3q7z9IT7Qi+OoZooNoBc9o7/I4iRa450Hbm8wPCZF7R+xrmMFBkD7yIkJUTe
         XNlA==
X-Gm-Message-State: AFqh2kpLbOSflg9M8cQkKeIA/xaxdj0/uHVlMJL6OswqnN2dBNrUeAlY
	5SWeNwEQioM7nCT8q/7BfvA=
X-Google-Smtp-Source: AMrXdXtXLoOKeiDjNOplfKgIStlJLK1HdxG/83Z7TnVyHlxxEPOdE51VTk5wzMunD8ESCyTjAqw84Q==
X-Received: by 2002:a05:600c:920:b0:3da:22a6:7b6b with SMTP id m32-20020a05600c092000b003da22a67b6bmr10978954wmp.13.1674146698929;
        Thu, 19 Jan 2023 08:44:58 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j30-20020a05600c1c1e00b003daf89e01d3sm6287926wms.11.2023.01.19.08.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:44:58 -0800 (PST)
Message-ID: <36bb49f6-91ac-148d-2caf-c4f52da57aed@gmail.com>
Date: Thu, 19 Jan 2023 17:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/2] thermal/drivers/mtk: use function pointer for
 raw_to_mcelsius
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Steven Liu <steven.liu@mediatek.com>, Henry Yen <Henry.Yen@mediatek.com>,
 Chad Monroe <chad@monroe.io>, John Crispin <john@phrozen.org>
References: <cover.1674055882.git.daniel@makrotopia.org>
 <69c17529e8418da3eec703dde31e1b01e5b0f7e8.1674055882.git.daniel@makrotopia.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <69c17529e8418da3eec703dde31e1b01e5b0f7e8.1674055882.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_084502_215810_80AFDD27 
X-CRM114-Status: GOOD (  19.93  )
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



On 18/01/2023 16:40, Daniel Golle wrote:
> Instead of having if-else logic selecting either raw_to_mcelsius_v1 or
> raw_to_mcelsius_v2 in mtk_thermal_bank_temperature introduce a function
> pointer raw_to_mcelsius to struct mtk_thermal which is initialized in the
> probe function.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/thermal/mtk_thermal.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 0084b76493d9a..992750ee09e62 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -292,6 +292,8 @@ struct mtk_thermal {
>   
>   	const struct mtk_thermal_data *conf;
>   	struct mtk_thermal_bank banks[MAX_NUM_ZONES];
> +
> +	int (*raw_to_mcelsius)(struct mtk_thermal *mt, int sensno, s32 raw);
>   };
>   
>   /* MT8183 thermal sensor data */
> @@ -656,13 +658,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
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
> +		temp = mt->raw_to_mcelsius(
> +			mt, conf->bank_data[bank->id].sensors[i], raw);
> +
>   
>   		/*
>   		 * The first read of a sensor often contains very high bogus
> @@ -1075,6 +1073,11 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   		mtk_thermal_release_periodic_ts(mt, auxadc_base);
>   	}
>   
> +	if (mt->conf->version == MTK_THERMAL_V1)
> +		mt->raw_to_mcelsius = raw_to_mcelsius_v1;
> +	else
> +		mt->raw_to_mcelsius = raw_to_mcelsius_v2;
> +
>   	for (ctrl_id = 0; ctrl_id < mt->conf->num_controller ; ctrl_id++)
>   		for (i = 0; i < mt->conf->num_banks; i++)
>   			mtk_thermal_init_bank(mt, i, apmixed_phys_base,

