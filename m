Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB5ECCFA13
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+N76mxcxihAP3O+FLFRElIM/tYwXLZuPej3Jupgfxo=; b=X3KkQtFHxGIsdh
	dhTAtINjlDT3mjP4PXJ+7KQuOiEPdM4flC6FVFy/BkDmlB11USouNyqM+NWlAjW89vkBrghQGtXy1
	Tt2JJoHkeYfV1ce/67H6wi2BLqVzA6L7LO3ZvaIVDnc4+P3w80Yg3uH2JnYN8wemsuNYA93opyD66
	wa0tN+XsfAokmeEbImO9p3IxjGeRo/SlpAoYOfBiLsvKn6QRSSTYNjTB3CnRKx/PDu7w6AiJd1AKA
	uwnDTdAQCWo6EwaoDeB4z0IVVUh0aokN+ND24e0fHPiw39AZagyHq4+iN3PBvdJ+I6/cB1kLWaRfL
	vyUp5rYrhtzoJKsvyaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRDp-00000005Qcd-3aHr;
	Mon, 10 Nov 2025 12:42:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRDm-00000005Qbh-3bOt
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 12:42:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso1097094f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 04:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762778529; x=1763383329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+N76mxcxihAP3O+FLFRElIM/tYwXLZuPej3Jupgfxo=;
        b=F/Son1xS3nOevVwuzfg1/Xj2HblhHiSx5duV2f2aY47EQrnDYVZVfLhOxQWBD6Pl4X
         diwqTKj6WxM81gP5hT7DzHNUbyvL+X7350V0w7o60oHeQgi9/6MXClssh9+nwMtXVFTL
         /Sp82nG2QgbyaSPQ9w4byI5TtN3pjUxCLM0cubCUhMBd4F1LwfBwclMVzLyiadG68AeP
         JfQJgbj2KbbZ1wMuD0lRvHJYHRZYO3gbOjhzsZZzwX2bjWNotoi7vrQhtkJ9XPn8hZGl
         JLjn8yhFq8xLCEWnmkFFHknCkEXh1nt0NIWti9+ZmKWgoHRp/D2Pr2Qaq5NrsNXj7E8A
         RNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778529; x=1763383329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+N76mxcxihAP3O+FLFRElIM/tYwXLZuPej3Jupgfxo=;
        b=OtbWP3AqGkIf0iU9Xdl/htQx3V+cTIaWhGNm+Drag+hMx8wRHyaNpyMKS3R8RFNham
         CAQ9bfpBtU1X6xEdKWCOq7XzFuMUjHO4/G6UdC178ZGLJsI80HSJPyGS7Dl6QXl5LYCG
         o74V30ZkyQLZyp/mzZMHuJPeKn7U8XTsV1PjxCYVrHfB0lwlIK2ml+YCnBaiv4pLiKGS
         peS6AJemmbS1ahs2NDT6hVQ9wxpSPdtK+vUH10CXaixveaC3GTMPbXBwa5n2+we/gbYR
         5RQCcqQRkDsAFTnT31kOi3gqwNy8Wju/6lq1Flnn5H4yszcr/DVuOYS8JNcwJafbfWbd
         h+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUwpCp2pMXbd7rvXQtEfp3drm1rENNi9phtAUu2zGuho0VNUlNPISZN83DXMXWFWVmG1UZ6Uazq7q28Swy6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFnSzU9R27VGcop9kNsAG0kxwTVoFkTAmN9Du9co1q07NsmVby
	cHjYMybyQV3m770PV3ImoQeDolRoUhviaaR3Yg2116B33MHRRmELsa493jzB57YSfGc=
X-Gm-Gg: ASbGncuk99MjH7syPYytQf7mUiLoQZ6omHr7AbDOSf5PJbi92YxpOCXQfKYY8/4PgZ3
	Fv/OT1GJguGSl/YNsz4Zt2RooCSUShF5TIkj3jopwF15W7JeiQWEsvJQsR47ARioflCqwA5KjLx
	5uqYiEeuNYx2ehSgAXL6Y4ZJLQeb3A2zJZMcJbFP04jpjtejkPFyvL/d1QfWSCIKuP41nSw8tk9
	N0TGlQvWvQD+aVohpKcoYjUJF6eLazg1aBM7XX18A6+x6aQvrWA6KCzGTt6zLRG8RB4IRF0kT+U
	k4xWcQNpxHyxXKP8NXLw2YJtgjsC6uh1f4MOuWN53mWRybGBUIZ6kwtKxZlF9Zize1bEML7S70o
	zxi9IpdiO5QN/lD4qC7iuz/GUTs0XQJHtawE/8tR6xYZU2bdsZqK/jNrXdB+9yyGuxwkFSHH7Iv
	mRFiNo1KFs1MLyUJ/Kim/MwH2dxS4VnpYGy3FkxCYQ38GzDqaUBs7WgfHEAZ9o4S277A==
X-Google-Smtp-Source: AGHT+IGNKo1M31mUDoARlNl8zibaXqZMwervmekEB8cz3HVAafXXSH8iFrMG/LkjJqzdboVDP9+/mg==
X-Received: by 2002:a5d:5d81:0:b0:42b:2c54:d9ba with SMTP id ffacd0b85a97d-42b2dc1e51bmr6642107f8f.20.1762778528609;
        Mon, 10 Nov 2025 04:42:08 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b35ad7c16sm9213468f8f.15.2025.11.10.04.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:42:07 -0800 (PST)
Message-ID: <84b9fd00-ce75-43bf-a53b-48818628f7e2@linaro.org>
Date: Mon, 10 Nov 2025 13:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/9] thermal/drivers/mediatek/lvts: Guard
 against zero temp_factor in lvts_raw_to_temp
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
References: <20251016142158.740242-1-laura.nao@collabora.com>
 <20251016142158.740242-4-laura.nao@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251016142158.740242-4-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_044210_936487_18701C2A 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/16/25 16:21, Laura Nao wrote:
> Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
> division by zero and ensure safe conversion.

Is the temp_factor something else than a ro data statically initialized 
by the lvts_data structure ?

It is pointless to handle the case where the temp_factor is zero. If we 
read the temperature the kernel crashes immediately (which means it was 
not tested).

The temp_factor is an internal value of the driver. If the temp_factor 
is zero, the driver is buggy and should be fixed.


> Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff configurable")
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 1c54d0b75b1a..4ef549386add 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -284,11 +284,14 @@ static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
>   
>   static u32 lvts_temp_to_raw(int temperature, int temp_factor)
>   {
> -	u32 raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
> +	u32 raw_temp;
>   
> -	raw_temp = div_s64(raw_temp, -temp_factor);
> +	if (temp_factor == 0)
> +		return temperature;
>   
> -	return raw_temp;
> +	raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
> +
> +	return div_s64(raw_temp, -temp_factor);
>   }
>   
>   static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
> @@ -1346,6 +1349,9 @@ static int lvts_probe(struct platform_device *pdev)
>   	if (irq < 0)
>   		return irq;
>   
> +	if (!lvts_data->temp_factor)
> +		dev_warn(dev, "temp_factor should never be zero; check platform data.\n");
> +
>   	golden_temp_offset = lvts_data->temp_offset;
>   
>   	ret = lvts_domain_init(dev, lvts_td, lvts_data);
If





-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

