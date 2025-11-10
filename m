Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F112CCF9E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFcBbXPwvkiMGC/UX+vL3kGptND9Aa39FQ9X5eJiJ0I=; b=UE1SbqYs+kcEPd
	klXcBAmgWbD8Hpg6i3WLx5wGNqXWDKEWXXkPdlI4bKCG1eL7PpPSzoPMxHLQfbCaZxkTzmpwHWqbI
	yoCmIIV/6MOOkIuvQ1UTZgQOQzx6D00O3XwBhp1SJdmAZ57AzuP3ViMZgn5MBvdYhVT0Sz7NlIJPY
	ERO9xdg2RYwSb0FSVaeyFasCECOnOFoe10L8hRUDG2Hr4DItOMzIyUzs2nwvYY0bhypkNlzFh4xeR
	a4vTx8vzcedRoe+cmkYyzrAPQCnxF9FZTV6kMWhpBTQXqQndS2c5nK7hpdDCInNc8iJh35o9f3C9b
	X4KwhS5ApublKsYnYfMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRb8-00000005STA-0AL1;
	Mon, 10 Nov 2025 13:06:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRb1-00000005SR6-1xYa
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 13:06:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso19716235e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 05:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762779969; x=1763384769; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFcBbXPwvkiMGC/UX+vL3kGptND9Aa39FQ9X5eJiJ0I=;
        b=YtGdcGNc+zK+LVeEimyfktnRP7zj/wZu5o2duz+9ykD7o9Kl3e27Ejsvhlsd6SO3QZ
         Igv+mbohT22zNq3q02/3967qjT4egIzazKnqPJU5GBdLbQQGVMxIpQcrVumL/O7n49oK
         MR0tVakIXr3rTGst7IYmH2LUh22kJSnlcqUY4QyN5ea2epvjk5LBDNzFEZHXDH6c0SbF
         LbW6uf/EeS2cRlNUD+l6+MjHcFBhUVah+9VtL50u3DOtg5/15jvv3BcPSZXG13e8OHLi
         Knfv46I37hylR0Y3MFIXd4OrDEk84HqH1ZH2xRcuhdpmJeBN365ky00VIVJ0SMb5kQ9w
         BWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762779969; x=1763384769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFcBbXPwvkiMGC/UX+vL3kGptND9Aa39FQ9X5eJiJ0I=;
        b=bWWGdcXTtpq1jrH+AFbkLgieOK2MXKa6onmiIH7DRXZBrhz/bcR4t8ErF/XKRK+Wd+
         DcPTiFO7l/Yk8LHEV5iCJzo/ejn+nY96S2EitaosNXAhsQOnFgDrqT8p2Cq3tFg/M2ZL
         4KAzvpfrz71hubru1NfGrpmDqDn1Ha/AKKiGupBkCdbJbZis1AWFisPBVgatlbOG0Wli
         0gbe/6MjqMuCFArsn17DwnPKB/0F09I/xIfy452k2GKA0orqGJGfE1XvK8ypJMzV2pTc
         KW8B3RLmsyII+RUU0pMcIUaxFKrU8oWEA+aCUVwY63CaSUlpwgjsrwJeJxeUIvifES9U
         psqw==
X-Forwarded-Encrypted: i=1; AJvYcCV0/pByjiZ6Hy8kh0cioEhbbbHqnFfUp+CK5JeQMxjF0oNBXq64AkrJ5tEPxoQbjVzWBFFXcF6UuibjvuFucA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEQ5leRDv5wyH8LbaFRUTizQR2TngMWRs8f4J7XLQ+mwqsXdBO
	5ilm7jyeSflDUp6QENJH5DLRBrCFnlwvFk7vI4NyYF3rZi2vUbSqjMP48C1b+wDp0Lk=
X-Gm-Gg: ASbGncsYHhtDwsQ3zmJUHq4X7SNtfcugLiTEA0oTJwrCPsA56TrTQVcSdbTm073lY3E
	iGEBs9aT6KhlJQ+Bim5HgxoTDec/trIRAcCGd3uK/zVrNNAP6bWzT/HB7zBRCUAvcx8rc20YMo0
	o+03NDu9N27hbMBsljSxGs62V/N9HNLstNFA+TBVoWca1ggafG2y7z1PVBK6EElgzQD2qZC8o/l
	T6Kpqcq1oJeiydSwJ9grISgLl6YNJTCNZbKhOmaTBa2T5QuJD7f1ZkhQScBLPA0KhkLthUJTQTC
	9KU/7DEsOUdq/oDFh/vJeh8PpahPavz3GRDLVoOsYRPKPQgXPNaRk55V/YuvPLlWe16R0QVCQkT
	xbTXtFVb09iHV4PdN1RkNdqZdLhVKNWCo9Ro8fM9L1v9UJN40pd9MbGJP/+/NMIFGw1iUrbwDdU
	ASelcPsExAZesQmCzT7o0ohaSVYwcx8T0wHmilX6wFSg5X5ZhB2nYc+tk=
X-Google-Smtp-Source: AGHT+IFtXNJpzD2gW9iSn0NztWrLxTZvcOLBaFBOCFqkmNRmqw71Iuc2gfKNjESDEOfAEahNU8T56w==
X-Received: by 2002:a05:600c:4f8b:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-47773271a62mr83156425e9.23.1762779969396;
        Mon, 10 Nov 2025 05:06:09 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4776bcfcfc7sm240169015e9.12.2025.11.10.05.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:06:08 -0800 (PST)
Message-ID: <1e0545da-5d24-4ca4-863d-0d5671902d0b@linaro.org>
Date: Mon, 10 Nov 2025 14:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 4/9] thermal: mediatek: lvts: Add platform ops
 to support alternative conversion logic
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
References: <20251016142158.740242-1-laura.nao@collabora.com>
 <20251016142158.740242-5-laura.nao@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251016142158.740242-5-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_050611_587370_A56E65C5 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/16/25 16:21, Laura Nao wrote:
> Introduce lvts_platform_ops struct to support SoC-specific versions of
> lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.
> 
> This is in preparation for supporting SoCs like MT8196/MT6991, which
> require a different lvts_temp_to_raw() implementation.
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 27 ++++++++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 4ef549386add..df1c0f059ad0 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -125,8 +125,14 @@ struct lvts_ctrl_data {
>   			continue; \
>   		else
>   
> +struct lvts_platform_ops {
> +	int (*lvts_raw_to_temp)(u32 raw_temp, int temp_factor);
> +	u32 (*lvts_temp_to_raw)(int temperature, int temp_factor);
> +};
> +
>   struct lvts_data {
>   	const struct lvts_ctrl_data *lvts_ctrl;
> +	const struct lvts_platform_ops *ops;
>   	const u32 *conn_cmd;
>   	const u32 *init_cmd;
>   	int num_cal_offsets;
> @@ -300,6 +306,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>   	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
>   						   sensors[lvts_sensor->id]);
>   	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
> +	const struct lvts_platform_ops *ops = lvts_data->ops;
>   	void __iomem *msr = lvts_sensor->msr;
>   	u32 value;
>   	int rc;
> @@ -332,7 +339,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>   	if (rc)
>   		return -EAGAIN;
>   
> -	*temp = lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);
> +	*temp = ops->lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);

Don't do this in each functions. It does not help for the readability.

May be something like:

int lvts_raw_to_temp(u32 raw_temp, const struct lvts_ctrl_data)
{
	return data->ops->lvts_temp_to_raw(raw_temp, data->temp_factor);
}

or

int lvts_raw_to_temp(u32 raw_temp, const struct lvts_ctrl_data)
{
	int temperature;

	if (data->ops->lvts_temp_to_raw)
		return data->ops->lvts_temp_to_raw(raw_temp, data->temp_factor);

	temperature = ((s64)(raw_temp & 0xFFFF) * temp_factor) >> 14;
         temperature += golden_temp_offset;

         return temperature;
}

... and get rid of all the lvts_platform_ops_v1

(btw _v1 is confusing, it suggests there multiple versions of the same SoC)

[ ... ]

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

