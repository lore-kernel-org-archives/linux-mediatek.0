Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6817AE77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 09:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ujceh96Zfu+ZZBCUYvGUXM3Y+jEAHufrqSQjtD+xc6o=; b=T/0G2D0ewYB8NfHXjKqZpzlJM1
	XO8DbeDgrjbfOuwg+mLaTB+w4sgwRpK8FJy1f1WLk81F2LVCBTrnvNDye9QApANDeakqhFPaB/+cO
	7dsBj43zvs2GGxwURtDQN3rFztUx3QFNoc0Pg+XTqPg15myGrnHVu4dv41cYSdAcv6gTLL9QJAdHO
	OEDi38HXLktePfuqtD0Yj5xX9PnQezNHQx2DDheFpFWm229JZkLMdwxw1D6DGBTQYigKgxg5hSEYR
	lhkQ3N9fJbEhl5t0KZ0O63aBbebcN9s6hxH+7JLSlbTLry5RzUc15fYYzP9lf9n2nqMj8iox439+B
	HkK5Xf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdAV-00000007wdt-1wqa;
	Tue, 14 Jan 2025 09:25:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXd9G-00000007wY1-09Uy
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 09:23:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso4388362f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2025 01:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736846624; x=1737451424; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ujceh96Zfu+ZZBCUYvGUXM3Y+jEAHufrqSQjtD+xc6o=;
        b=QedzmcVs7bEvNtweaaVQeu/uNFv4VY07oMnn2hzOcqLd7wKwKfEymSZG/j7EAVpq2q
         2N7hT8FG0evy2TMYVNx9Qcf/12VFfBYiTsu191/hIqqCYvlLhWf2boyJ6+dyQ2ZXUYPz
         0Yk+h8NVOZO0fz/LcS7kJAZMGdKoBniImeP9yv2NxyN4re0t1WMRJNCUACsdQUf+oPUU
         JZiP7E1XukckpLlVlALeTIJouiSwblGw7e8uG6LwavCZY75Rte3YlImEV9NueehbJUaW
         jcZGIMcLa4BDPuuwfy2BP+9HwVWKC9eZ3wplZlSf5yHIhooz/jKK0vjGPjUn6LNMi5Pi
         dfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736846624; x=1737451424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ujceh96Zfu+ZZBCUYvGUXM3Y+jEAHufrqSQjtD+xc6o=;
        b=r5GEN+Tf//mNagPg3xnk56n1sIPMkL1OjUwHtyHZ/8748TtToZBw4xDihd+sxafGbv
         89Ejbrn8E08tOvmbt+EWuiIOdZMOSNljfynVYupF2WPFCR1dXvMzmxrMMpmwRjUOyqxN
         9GtfZ1DkTUzm3bXNB6xjbsWlzJflxhjW7Y8GxRI3b/sUNVno2Hh+RV0hSNIegXiqbupW
         2ZfEmmersQkrn6CZ9Cg6xBdupnPtB7VMsNlquiMv1G0RlOvUEQFvD20kzk3e37MI9ldA
         CTXL0uvAGHMof9WdOxeBivfF5pdEivO0DmQjIHj93ErPde7YxcAA50vn05VDIUWp0GTd
         6xKw==
X-Forwarded-Encrypted: i=1; AJvYcCXUwOSOR90ySsfGar/8jrbmAp69lUQVnx/y0Q7w30dlrXwNwWbJPy9GW2s5mQAN2hb5RXd9TlvPCc0s3BU95g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpoGsF2FoFBqZc3Ab03hE8z1CZh7KEFkfn5EsV3jitrdjFVfVV
	nLblgGNSrmKavDBBJ3y4q7g6wopWqkxECIhwTh615N6gsnaivhAoAZQRF66iA8g=
X-Gm-Gg: ASbGncs33sNW2B5/a86UcQDzprVN6Fsh8ruZRYzncRalKODIwFibq8oHbs1bbYSTjSv
	MwMU4iANl2XLsW2FOw6DYdFIpR4hj41L7gA7RT3s7kOK835wESn8ge/cYjRhMNkvRIqW91q54fw
	5v/kMR9LjgErstr2DJIuf7MIy/cNb/6Qf4l1e+7wu/gwoMmrqgPiU61a4Pfjj3kscZtfXiKNR0M
	YX/9/D6el6XHRnqQG2wvfk4XXHuy9TGJ2pNMHh4VkovKOC5HmPP81/9akHHZbt7wJEkqgztUeWa
	e47423EDkxXf7uDDGl3i
X-Google-Smtp-Source: AGHT+IGUa5x9kNh4WH7UnCyzX3Q2GslgbUWvRhsg8TCGNensTbTol30VhBNVgwctwPWzJvCkmK/QEA==
X-Received: by 2002:a5d:5e8a:0:b0:386:3918:16b1 with SMTP id ffacd0b85a97d-38a8730fc4bmr23941231f8f.39.1736846623863;
        Tue, 14 Jan 2025 01:23:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e4b7ff0sm14396260f8f.77.2025.01.14.01.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 01:23:43 -0800 (PST)
Message-ID: <20828ba5-ecb5-46a4-8be3-9119d93c383a@linaro.org>
Date: Tue, 14 Jan 2025 10:23:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/5] thermal/drivers/mediatek/lvts: Disable
 monitor mode during suspend
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 stable@vger.kernel.org
References: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
 <20250113-mt8192-lvts-filtered-suspend-fix-v2-1-07a25200c7c6@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250113-mt8192-lvts-filtered-suspend-fix-v2-1-07a25200c7c6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_012346_131883_19AC793A 
X-CRM114-Status: GOOD (  25.17  )
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


Hi Nicolas,

On 13/01/2025 14:27, Nícolas F. R. A. Prado wrote:
> When configured in filtered mode, the LVTS thermal controller will
> monitor the temperature from the sensors and trigger an interrupt once a
> thermal threshold is crossed.
> 
> Currently this is true even during suspend and resume. The problem with
> that is that when enabling the internal clock of the LVTS controller in
> lvts_ctrl_set_enable() during resume, the temperature reading can glitch
> and appear much higher than the real one, resulting in a spurious
> interrupt getting generated.
> 
> Disable the temperature monitoring and give some time for the signals to
> stabilize during suspend in order to prevent such spurious interrupts.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> Closes: https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chromium.org/
> Fixes: 8137bb90600d ("thermal/drivers/mediatek/lvts_thermal: Add suspend and resume")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 36 +++++++++++++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 07f7f3b7a2fb569cfc300dc2126ea426e161adff..a1a438ebad33c1fff8ca9781e12ef9e278eef785 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -860,6 +860,32 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
>   	return 0;
>   }
>   
> +static void lvts_ctrl_monitor_enable(struct device *dev, struct lvts_ctrl *lvts_ctrl, bool enable)
> +{
> +	/*
> +	 * Bitmaps to enable each sensor on filtered mode in the MONCTL0
> +	 * register.
> +	 */
> +	static const u8 sensor_filt_bitmap[] = { BIT(0), BIT(1), BIT(2), BIT(3) };
> +	u32 sensor_map = 0;
> +	int i;
> +
> +	if (lvts_ctrl->mode != LVTS_MSR_FILTERED_MODE)
> +		return;
> +
> +	if (enable) {
> +		lvts_for_each_valid_sensor(i, lvts_ctrl)
> +			sensor_map |= sensor_filt_bitmap[i];
> +	}
> +
> +	/*
> +	 * Bits:
> +	 *      9: Single point access flow
> +	 *    0-3: Enable sensing point 0-3
> +	 */
> +	writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));
> +}
> +
>   /*
>    * At this point the configuration register is the only place in the
>    * driver where we write multiple values. Per hardware constraint,
> @@ -1381,8 +1407,11 @@ static int lvts_suspend(struct device *dev)
>   
>   	lvts_td = dev_get_drvdata(dev);
>   
> -	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
> +	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
> +		lvts_ctrl_monitor_enable(dev, &lvts_td->lvts_ctrl[i], false);
> +		usleep_range(100, 200);

 From where this delay is coming from ?

>   		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
> +	}
>   
>   	clk_disable_unprepare(lvts_td->clk);
>   
> @@ -1400,8 +1429,11 @@ static int lvts_resume(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
> +	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
>   		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], true);
> +		usleep_range(100, 200);
> +		lvts_ctrl_monitor_enable(dev, &lvts_td->lvts_ctrl[i], true);
> +	}
>   
>   	return 0;
>   }
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

