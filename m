Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA89C7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 09:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wjb4y9f/OAblmhtUQxR2kzYBl3YoolTkNzcf3IrEYtY=; b=BC3zOQ7eBu2pdFT796P+2/0B5a
	6uuhmXccM2NjoSxFE9xm6/EVg0yBUT/BbRQi32IlRCioecR+62Jvjn9b3Rn1VOFbWTzQZWwgeWDm6
	ItGF6Gnu5jRX2IS/pmbFjnAAdbQUZbn8Re8VcgnF8yaqynilGDjxv/vonrsyWfyaxHLsboGxYuYj2
	4ndqNeyAzEZMYluP2w2M71FqKYNNliNvDPzZkIsWujUNgrMIgQlXWH8YUBDoKBfBQJoGgN7jwo6XQ
	sUDXopSBEncbdkUROAuEJG9MXPeuUepcHU9b22lTFWPmbGw97D6+8mBbqtfr1QnOjrS4E3ISdN52I
	TDoOkBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50uc-006Lz9-24;
	Fri, 02 Jun 2023 09:17:34 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50uZ-006Lxk-2Q
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 09:17:33 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f122ff663eso2361214e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jun 2023 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685697449; x=1688289449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wjb4y9f/OAblmhtUQxR2kzYBl3YoolTkNzcf3IrEYtY=;
        b=PekzTB4NEY2nA9GPUJVIBcKeoQpV+aIEe2nmErsgiefDoj5ypbOd5+i40Prt5AoBe+
         XfaBDNPpYu+LNX2YcHUnR0hv+g/YROhYw/V6jjmQuNYOF7ytCz5ke45oumzljt3p0phL
         0Xm5ZoUjq5cbmeLsQ4ePpoEsAcziXxnkng8Un6QMi3fuThIXraxZtUWyRpOBnHPILUpr
         3GjRlgfrT9/aklNsN1Lyrgv9rHsUDxUrqpZmZlnUrHhnHEQV9A2d6YoFWmtVrnqpA0LS
         lAaeeKBbSVeKCCkB0NFBK1saaOAZJ50dp124wG3nM/KTjd4MPZ110pBsWuCEfXeCR9Xa
         NdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685697449; x=1688289449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wjb4y9f/OAblmhtUQxR2kzYBl3YoolTkNzcf3IrEYtY=;
        b=LTW9WpQIIBncO+L9Luccj/ocDxsLyjUncU2IeMycQpxyWyQoQEL93J5DXUiacIifhA
         P8z+4aDy4ng1VLuBdmwS9qhXPsYX8zB4qKPYNjbMdt0Q5T/mXxpcxOW4C/pq3MP8xKDJ
         0dQ+xV8c66KGztDBa5vpe75Jq8cJPamqAP0C456uNFLb26ml7jIDfmwdK6/mXwZ5d2vo
         q5IHOLJOIKpR0/fFBsLi1YbRN7qULC/igdH5vGqN0xSZQ5aRPOgXza5uDO53qp6uuQD/
         2R/ExsJriNkNYrli/khN5yM/2i2l6sw8HGm99tzYbJxz93kdEr7IYmoKN5+zK5f0Tb89
         Dsyg==
X-Gm-Message-State: AC+VfDyZXireXRF+5Tm1Y/868yPPW9jsQnJhBabHCRMEJuLJkcMWmLhK
	q8sglSoDSVpysDEyxsrqQxAM0w==
X-Google-Smtp-Source: ACHHUZ4d9PtFuny6rQdn1Vgtvd/NuLyoJXiaApszdFajTfmb8wElIAA9bAtFoXQfDWguF0DecsIfmA==
X-Received: by 2002:ac2:4a74:0:b0:4f4:26d8:3668 with SMTP id q20-20020ac24a74000000b004f426d83668mr1457320lfp.25.1685697448598;
        Fri, 02 Jun 2023 02:17:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:548f:8f7e:a3c2:888a? ([2a05:6e02:1041:c10:548f:8f7e:a3c2:888a])
        by smtp.googlemail.com with ESMTPSA id l18-20020a05600c1d1200b003f61177faffsm12498463wms.0.2023.06.02.02.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 02:17:28 -0700 (PDT)
Message-ID: <5d810151-3a3b-51af-bbc1-0ee45668bcc4@linaro.org>
Date: Fri, 2 Jun 2023 11:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 5/6] thermal/drivers/mediatek/lvts_thermal: Don't leave
 threshold zeroed
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
 <20230504004852.627049-6-nfraprado@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230504004852.627049-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_021731_797597_B2193B86 
X-CRM114-Status: GOOD (  22.81  )
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
> The thermal framework might leave the low threshold unset if there
> aren't any lower trip points. This leaves the register zeroed, which
> translates to a very high temperature for the low threshold. The
> interrupt for this threshold is then immediately triggered, and the
> state machine gets stuck, preventing any other temperature monitoring
> interrupts to ever trigger.
> 
> (The same happens by not setting the Cold or Hot to Normal thresholds
> when using those)
> 
> Set the unused threshold to a valid low value. This value was chosen so
> that for any valid golden temperature read from the efuse, when the
> value is converted to raw and back again to milliCelsius, the result
> doesn't underflow.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Added this commit
> 
>   drivers/thermal/mediatek/lvts_thermal.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index efd1e938e1c2..951a4cb75ef6 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -82,6 +82,8 @@
>   #define LVTS_HW_SHUTDOWN_MT8195		105000
>   #define LVTS_HW_SHUTDOWN_MT8192		105000
>   
> +#define LVTS_MINIUM_THRESHOLD		20000

MINIMUM

So if the thermal zone reaches 20°C, the interrupt fires, the set_trips 
sets again 20°C but the interrupt won't fire until the temperature goes 
above 20°C and then crosses the temperature low threshold the way down 
again?

>   static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
>   static int coeff_b = LVTS_COEFF_B;
>   
> @@ -309,6 +311,11 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
>   		pr_debug("%s: Setting low limit temperature interrupt: %d\n",
>   			 thermal_zone_device_type(tz), low);
>   		writel(raw_low, LVTS_OFFSETL(base));
> +	} else {
> +		pr_debug("%s: Setting low limit temperature to minimum\n",
> +			 thermal_zone_device_type(tz));
> +		raw_low = lvts_temp_to_raw(LVTS_MINIUM_THRESHOLD);
> +		writel(raw_low, LVTS_OFFSETL(base));

That's duplicate code:

u32 raw_low = lvts_temp_to_raw(low != -INT_MAX ? low : 
LVTS_MINIMUM_THRESHOLD);

And then the condition in the code goes away:
         if (low != -INT_MAX) {
	}

>   	}
>   
>   	/*

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


