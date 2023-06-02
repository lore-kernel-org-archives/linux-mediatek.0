Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4702BC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy7ZWgwvbQw0vF/j44DrE+pxcxlkHmF/+G3M51v+f2Y=; b=dlGGHvgRAsy5eRG2/7T38leWEv
	6jj7YPhUFSddW2/t1+Ty+AQIlQH4de4XidJR7BYmbCE9fZRUmu6VbXBjuZ999dlVFEVIsb9ucz0Ke
	Nqp2H9a5HB6sOTiAbhtsyO/MXwOlw+h+8jnfSVCX9PNLiuNbxQ118WpciBQUCmSdjS53Mrg92tKOq
	D6RvKTqKnfUdnVLwdT3rm5fXBY53U7DKvrGBEEyxg6eWlGaG4uf03fHc5BwwP0RQR9+VMFZ3H1qMr
	f2jcD9sLdFZMSLxvsEuJUY1a7lxYqR3BzpgCJGOF+ZhQa8xbVdJKYMloZcm7BkfS1fPEpL3ktnPDj
	ujet3How==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50Se-006DRg-1i;
	Fri, 02 Jun 2023 08:48:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50Sa-006DPI-1z
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 08:48:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f603ff9c02so17311495e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jun 2023 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685695713; x=1688287713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hy7ZWgwvbQw0vF/j44DrE+pxcxlkHmF/+G3M51v+f2Y=;
        b=UvECccFHPDOZZjOqEWbW35gXhOHqQaqYC8jpmi8noSSduan5Ls0a9rI2ViSkjq5IdO
         F7qf/DcGydpfz1XSvpU3XFjDS8QyPRahRVrLV4jgk/jKPZWbo25hETwcJhe/AidT9fFq
         fYvMIvLP8PlKnd5KEmYoiKXJv464N1oayK0otffMCh2hSapCl0leD9ISOAOHggzwDMdJ
         mqOytqN8lC7fhpvRZelksmgCaftQHwhCSzVk/rTENPiYseUjOppiER9l4rFNKA1DEuDq
         nXZ7CXU+JwZSI3ol9LNDxuIO3lJf93V/AvIwDzSh0Kt9c4f//1K1wrqQ5j2yJGttZJeR
         s/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685695713; x=1688287713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hy7ZWgwvbQw0vF/j44DrE+pxcxlkHmF/+G3M51v+f2Y=;
        b=F9B1Kw2mrG2GQ5kklThyPbKVAO5ALlqX15S77QSIHTHw6xxAOY7OWdC/5zGUKs61N5
         LEm/hhXv5SaRMKXsqRQPWjCy0hmEUqKpgREf8b0p+P1GMgg8I/q224KpaR5NJxKC0U6+
         Vl+NYcWKG49azBfHeFu/Neeoh8i0OL2fwzVd17H1RLtiwgCgPodn/t4VhTyYlh74YTBM
         YquRX8VmMu5ErIh04FDueFPNT/liFn2iaBjPXSf1JpvlDfgOZz52O6Sgdk+HmDpsPdiB
         ccGrtUktRTM5IiOiNdTwIcEe/Fc9ZMW2AhtX56usKMPQJdLkmvrJhGwSu1oWJQss+hfl
         dsxg==
X-Gm-Message-State: AC+VfDxmB9IdodwtI6quxB8GUTZ0RidLlfNSsOupT7xTYDDDlK+uPklD
	peOmWyGUsgzIAcNPIJ9HY9UBiA==
X-Google-Smtp-Source: ACHHUZ4D84wQyp47giQRpl65CGko8rey1F9ShVN6NGtUak9BS4hDjYgHB3xL2Np6FnsSeXDKWbtBGQ==
X-Received: by 2002:a05:600c:2045:b0:3f6:c7b:d3b7 with SMTP id p5-20020a05600c204500b003f60c7bd3b7mr1377479wmg.37.1685695712781;
        Fri, 02 Jun 2023 01:48:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:548f:8f7e:a3c2:888a? ([2a05:6e02:1041:c10:548f:8f7e:a3c2:888a])
        by smtp.googlemail.com with ESMTPSA id l4-20020a1c7904000000b003f5ffba9ae1sm1234932wme.24.2023.06.02.01.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 01:48:32 -0700 (PDT)
Message-ID: <b0576c2c-9249-1759-642f-b0accabfc773@linaro.org>
Date: Fri, 2 Jun 2023 10:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/6] thermal/drivers/mediatek/lvts_thermal: Honor
 sensors in immediate mode
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Alexandre Bailon <abailon@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230504004852.627049-1-nfraprado@collabora.com>
 <20230504004852.627049-3-nfraprado@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230504004852.627049-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_014836_652988_72C4EA8F 
X-CRM114-Status: GOOD (  26.41  )
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

On 04/05/2023 02:48, Nícolas F. R. A. Prado wrote:
> Each controller can be configured to operate on immediate or filtered
> mode. On filtered mode, the sensors are enabled by setting the
> corresponding bits in MONCTL0, while on immediate mode, by setting
> MSRCTL1.
> 
> Previously, the code would set MSRCTL1 for all four sensors when
> configured to immediate mode, but given that the controller might not
> have all four sensors connected, this would cause interrupts to trigger
> for non-existent sensors. Fix this by handling the MSRCTL1 register
> analogously to the MONCTL0: only enable the sensors that were declared.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> 
> (no changes since v1)
> 
>   drivers/thermal/mediatek/lvts_thermal.c | 50 +++++++++++++------------
>   1 file changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 2988f201633a..f7d998a45ea0 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -922,24 +922,6 @@ static int lvts_ctrl_configure(struct device *dev, struct lvts_ctrl *lvts_ctrl)
>   			LVTS_HW_FILTER << 3 | LVTS_HW_FILTER;
>   	writel(value, LVTS_MSRCTL0(lvts_ctrl->base));
>   
> -	/*
> -	 * LVTS_MSRCTL1 : Measurement control
> -	 *
> -	 * Bits:
> -	 *
> -	 * 9: Ignore MSRCTL0 config and do immediate measurement on sensor3
> -	 * 6: Ignore MSRCTL0 config and do immediate measurement on sensor2
> -	 * 5: Ignore MSRCTL0 config and do immediate measurement on sensor1
> -	 * 4: Ignore MSRCTL0 config and do immediate measurement on sensor0
> -	 *
> -	 * That configuration will ignore the filtering and the delays
> -	 * introduced below in MONCTL1 and MONCTL2
> -	 */
> -	if (lvts_ctrl->mode == LVTS_MSR_IMMEDIATE_MODE) {
> -		value = BIT(9) | BIT(6) | BIT(5) | BIT(4);
> -		writel(value, LVTS_MSRCTL1(lvts_ctrl->base));
> -	}
> -
>   	/*
>   	 * LVTS_MONCTL1 : Period unit and group interval configuration
>   	 *
> @@ -1004,6 +986,8 @@ static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
>   	struct lvts_sensor *lvts_sensors = lvts_ctrl->sensors;
>   	struct thermal_zone_device *tz;
>   	u32 sensor_map = 0;
> +	u32 sensor_map_bits[][4] = {{BIT(4), BIT(5), BIT(6), BIT(9)},
> +				    {BIT(0), BIT(1), BIT(2), BIT(3)}};

Even correct, this initialization sounds prone to error and a bit 
obfuscating (eg. it assumes LVTS_MSR_IMMEDIATE_MODE is 1).

What about?

	/*
	 * A description
	 */
	u32 sensor_imm_bitmap[] = { BIT(0), BIT(1), BIT(2), BIT(3) };
	u32 sensor_filt_bitmap[] = { BIT(4), BIT(5), BIT(6), BIT(9) };

	u32 *sensor_bitmap = lvts_ctrl->mode ? LVTS_MSR_IMMEDIATE_MODE : 
sensor_imm_bitmap : sensor_filt_bitmap;

>   	int i;
>   
>   	for (i = 0; i < lvts_ctrl->num_lvts_sensor; i++) {
> @@ -1040,20 +1024,38 @@ static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
>   		 * map, so we can enable the temperature monitoring in
>   		 * the hardware thermal controller.
>   		 */
> -		sensor_map |= BIT(i);
> +		sensor_map |= sensor_map_bits[lvts_ctrl->mode][i];

		sensor_map |= sensor_bitmap[i];
>   	}
>   
>   	/*
> -	 * Bits:
> -	 *      9: Single point access flow
> -	 *    0-3: Enable sensing point 0-3
> -	 *
>   	 * The initialization of the thermal zones give us
>   	 * which sensor point to enable. If any thermal zone
>   	 * was not described in the device tree, it won't be
>   	 * enabled here in the sensor map.
>   	 */
> -	writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));
> +	if (lvts_ctrl->mode == LVTS_MSR_IMMEDIATE_MODE) {
> +		/*
> +		 * LVTS_MSRCTL1 : Measurement control
> +		 *
> +		 * Bits:
> +		 *
> +		 * 9: Ignore MSRCTL0 config and do immediate measurement on sensor3
> +		 * 6: Ignore MSRCTL0 config and do immediate measurement on sensor2
> +		 * 5: Ignore MSRCTL0 config and do immediate measurement on sensor1
> +		 * 4: Ignore MSRCTL0 config and do immediate measurement on sensor0
> +		 *
> +		 * That configuration will ignore the filtering and the delays
> +		 * introduced in MONCTL1 and MONCTL2
> +		 */
> +		writel(sensor_map, LVTS_MSRCTL1(lvts_ctrl->base));
> +	} else {
> +		/*
> +		 * Bits:
> +		 *      9: Single point access flow
> +		 *    0-3: Enable sensing point 0-3
> +		 */
> +		writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));
> +	}
>   
>   	return 0;
>   }

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


