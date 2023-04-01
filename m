Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60265C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ht/IPTnIvVbwoF0SflWngC/A+ZVYLrrTz6rPwMBBJMs=; b=0GJ29oS557Zc+bihbpe+3igDri
	I/J6l9QDVyCIRdx3UKWwrDTfPRaRe7guhCWaEQenOoUrOWOkMwT68cAQvARZbor/JJQoikDpA6A3b
	Az2Mz4NQCa0RZx2kdltutmKFVhS9aKDhZHMd4AhBKlKsGo9lCdBdfXiaSrj01X1KxaLC8tx47y/x1
	JRBWDkCcYcwVNwEfRTAU1AzFpxbZdjmD31JSbHOrgMwgCxS1KvvZj5yLSnUFES9w+YDQq1/xZ6rgV
	fI7V+J/UlGE1UWa8axHVl1eRGaBFbM53yWwmTO4mxsvucysZr2qynuH4Is2CEywyu7zzPHGHD3IPH
	g1QjUaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pihvd-00BGdB-2T;
	Sat, 01 Apr 2023 20:34:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pihvW-00BGcM-2E
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Apr 2023 20:34:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id p34so14865549wms.3
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Apr 2023 13:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680381256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ht/IPTnIvVbwoF0SflWngC/A+ZVYLrrTz6rPwMBBJMs=;
        b=wmuBvcYn7vbZM9UbNc3qo1Qj4OkPm6/eywww4WJ9vOFXKffHsQ3HBtsKRqNU1q1tXe
         WuIvnc0S5z2rKCmKKmv10TgP3Usn8i9AilRE6E5Bf2kI4d2H1Gke9Zn4hB3p072c9w1Q
         lLafKtPAWmIhl5r4XQZqDO5scZINGLNrxexgcftO3vBW12ve2lzykCmaJFIC4Lu6jws3
         RV8w39LGfJsbQxVZ4a94qAu0VNEhEpm5MezvbtQ/yhcrDMIYRpjG+XkDEScyrfEn/b+A
         PvAOufQPFQeCUTf0DKd3BQzE+8iud4YNfViuE5No9yaoFX+gouyXRHIf+sPbj05uB245
         QKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680381256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ht/IPTnIvVbwoF0SflWngC/A+ZVYLrrTz6rPwMBBJMs=;
        b=yuOgS0UunythaE5CCzear85/d41pVkuTUg0n0TwdB2Ku0vSwZUoivBkgIcWFMqqRyu
         71MB2scapwJMUMjm5qjSfE9T/JfmTGjChWT1+Kyq+CDUcf95DFDdZXINUwp5hJIiEnW+
         wzSlmFHaW3kMFNAXnfUu52QZ3s0VJLxKf5hQKPaXriEsLtwTBUnr7uz72OLKJEVKlQ71
         hLr4TsYNqK+IVqlf1v7ZpEVKS9tiarxi+ab92t1zp2KVZKyl4k4R0UdtmFrxPearjpb2
         CsM87ixO07MEZ2KQY1oulHT+UXq7lZWLox1DlgutymkkT+WpduLHjo8obcZX8qe6iugY
         RJ5Q==
X-Gm-Message-State: AO0yUKVfH12oyDI3SpdzXh0nGOn0q2N5R2OaYSmZ7AWr8eaIfKe8y46g
	J9l6jLE6AJHizICk4GZUYvAqOw==
X-Google-Smtp-Source: AK7set/RtjxgZsEYybfAD8nZw/slu6ebXp3/0fOgugjdML7qyRvyO5towi0Ex1h4GLS0FuLyWG0wzQ==
X-Received: by 2002:a7b:c8d0:0:b0:3eb:39e7:35fe with SMTP id f16-20020a7bc8d0000000b003eb39e735femr22975275wml.30.1680381256232;
        Sat, 01 Apr 2023 13:34:16 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id 5-20020a05600c228500b003e91b9a92c9sm7032337wmf.24.2023.04.01.13.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 13:34:15 -0700 (PDT)
Message-ID: <9ab8d176-378c-9720-3794-c710e2bd6272@linaro.org>
Date: Sat, 1 Apr 2023 22:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: only update
 registered thermal zones
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230328031037.1361048-1-wenst@chromium.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230328031037.1361048-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_133418_778497_D72E6193 
X-CRM114-Status: GOOD (  18.92  )
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

On 28/03/2023 05:10, Chen-Yu Tsai wrote:
> It's possible for some sensors or thermal zones to not be registered,
> either because they are unused or not fully declared in the device tree.
> Nevertheless the driver enables interrupts for all sensors. If an
> interrupt happens for an not-registered sensor, the driver would end up
> updating a non-existent thermal zone, which leads to a NULL pointer
> dereference.
> 
> Change it so that only registered thermal zones get updated.

Why not change the interrupt initialization ?

> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index d87d3847c7d0..bf59174e18d3 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -415,9 +415,14 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
>   		if (!(value & masks[i]))
>   			continue;
>   
> +		iret = IRQ_HANDLED;
> +
> +		/* sensor might not exist (bogus interrupt) or not be registered */
> +		if (!lvts_ctrl->sensors[i].tz)
> +			continue;
> +
>   		thermal_zone_device_update(lvts_ctrl->sensors[i].tz,
>   					   THERMAL_TRIP_VIOLATED);
> -		iret = IRQ_HANDLED;
>   	}
>   
>   	/*

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


