Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD67DC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhI9yrOs8CfZH6O0uthOl9q2oyvn0I4hgTlooPx6s7Q=; b=pY6wZrD0OdwwfImWPUV9ERSM5Y
	ERPwGIjFPUiUKDw768PFR4oCiX6Oof/MhvcG2MtdrlB4T/iG/0McwE3eDi1Libr97D2lMASPUEGUR
	TjoIgYZkBM76l8nlI7gqz6a463erkB6Eqx++LYpdxeILYPy0Rbn7tF6c1NfBTtpGcW5KRcw0nRzp6
	Lo+4RqxnClfIW0v3oIryYphrRtV227FrkKKUObrdoV8Ups2/nToVJdlp5xVC/UhJevSndR0kOMIAS
	diKjv3HHAChbTWFJas22yjRiql5YPzf/Z0P9qC/mkJHUSihYwwvmOueV9V0sbG9uRfYt2kF1XiRcJ
	9s1sMaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2v6h-0000000H6Kj-1dYx;
	Fri, 03 May 2024 15:45:55 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2v6e-0000000H6Jk-22mC
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 15:45:54 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6ee32bb9c8eso2886549a34.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714751150; x=1715355950; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lhI9yrOs8CfZH6O0uthOl9q2oyvn0I4hgTlooPx6s7Q=;
        b=BytuQQjDc0KI2ruYvASi80iJB4WJ+64OH2VfLN7LXd4K52Nw1PQIhaW28zyTcNT1bA
         PzcLaoKNpxdts84Et5jqLXIzRQFUsj/bHodeW2GjmkmpTmojz7k7RQr6eC/hx1nKwn5S
         8iLXDRsiGwAtP1SQobwwPDE0mp1A4ErCuQqu6JnkGm1V9+G8OfPAixiCvoZYqu1XufZW
         qqKRTxpOtm3x2KhtUSkDKVabyWj4Gh7ElobWv3u3JrhUlCHP+bw10Qc3+B1WeDSBwfzS
         +HXHerLnTgQA95oRSXOr3VzEynwjgtFpmyLSKC9l39x4B3adoy7edvrT2FGoi6TCC0qu
         fJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714751150; x=1715355950;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhI9yrOs8CfZH6O0uthOl9q2oyvn0I4hgTlooPx6s7Q=;
        b=ck0lN9M2jP4/82aOewnQqSm1+/QnQbQ9rmRWy1E8HYZU8j2wkepKBB9t1Flg7dZkRp
         SD10sG+hWxhS2z+AtrXfAW0jH7x00uzlLY4xJdM9SXOViyioNboA9nrMJymEMfsoUbIU
         xMkhU9WCeP9F1Ru4n7UIVlFGs+j/YKJPMM73gEKQ2ty+1NSgefb2JaWLr8gOks2cD6bq
         tW8o/boay0nzIP26tZk3d0pZAzwz3nX5+ON568/b3LXQ+VGIzs09o38lIyt7ZDvFpUE/
         xj0sH+xnX1RFuCcjZ0Hk+ovOR4htJ10PzW+xIxNPHrRfMnHQzjgEc4pxbPheoXIrUSIE
         5l1g==
X-Forwarded-Encrypted: i=1; AJvYcCWsN3lKcmKAeYP2CtyVwaZOnbYQGXBi5Z+XNS+7JiP5vNmHm2Ntxk8Kp+MF23Fwyxt8DaD9O/18FSccCQTJ/1gvRxl2FEsKuk66t59O7FOp+pui
X-Gm-Message-State: AOJu0Yxsfk5boTmp/SuBYAh8C+Unsadi3LqYKMrDNHV1zJcQufQpPhhg
	Hap5oWqlGysch4FQCARvuV1OvBcD0nXdgSMD0gA7MVyfD7Pt0Ltr0FYr/k8Sf+g=
X-Google-Smtp-Source: AGHT+IG+DHh8GvHSrOBGw3RTRskRbLb5djVyMax1LElsUz89VQIsBT1Casz2tEAHJdHp4BCTsvIuZw==
X-Received: by 2002:a05:6830:1212:b0:6eb:c365:e68e with SMTP id r18-20020a056830121200b006ebc365e68emr3519049otp.25.1714751149969;
        Fri, 03 May 2024 08:45:49 -0700 (PDT)
Received: from xanadu (modemcable018.15-162-184.mc.videotron.ca. [184.162.15.18])
        by smtp.gmail.com with ESMTPSA id h12-20020a05620a10ac00b0079285113b99sm23092qkk.50.2024.05.03.08.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:45:49 -0700 (PDT)
Date: Fri, 3 May 2024 11:45:48 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Julien Panis <jpanis@baylibre.com>
cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] thermal/drivers/mediatek/lvts_thermal: Fix wrong
 lvts_ctrl index
In-Reply-To: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-2-f605c50ca117@baylibre.com>
Message-ID: <qppo2o23-40r4-956p-9n35-p0556sp32spq@onlyvoer.pbz>
References: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com> <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-2-f605c50ca117@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_084552_568879_558BB21E 
X-CRM114-Status: GOOD (  24.54  )
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

On Fri, 3 May 2024, Julien Panis wrote:

> In 'lvts_should_update_thresh()' and 'lvts_ctrl_start()' functions,
> the parameter passed to 'lvts_for_each_valid_sensor()' macro is always
> 'lvts_ctrl->lvts_data->lvts_ctrl'. In other words, the array index 0
> is systematically passed as 'struct lvts_ctrl_data' type item, even
> when another item should be consumed instead.
> 
> Hence, the 'valid_sensor_mask' value which is selected can be wrong
> because unrelated to the 'struct lvts_ctrl_data' type item that should
> be used. Hence, some thermal zone can be registered for a sensor 'i'
> that does not actually exist. Because of the invalid address used
> as 'lvts_sensor[i].msr', this situation ends up with a crash in
> 'lvts_get_temp()' function, where this 'msr' pointer is passed to
> 'readl_poll_timeout()' function. The following message is output:
> "Unable to handle kernel NULL pointer dereference at virtual
> address <msr>", with <msr> = 0.
> 
> This patch fixes the issue.
> 
> Fixes: 11e6f4c31447 ("thermal/drivers/mediatek/lvts_thermal: Allow early empty sensor slots")
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 18a796386cd0..d7df6f09938b 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -116,9 +116,9 @@ struct lvts_ctrl_data {
>  			      ((s2) ? BIT(2) : 0) | \
>  			      ((s3) ? BIT(3) : 0))
>  
> -#define lvts_for_each_valid_sensor(i, lvts_ctrl_data) \
> +#define lvts_for_each_valid_sensor(i, lvts_ctrl) \
>  	for ((i) = 0; (i) < LVTS_SENSOR_MAX; (i)++) \
> -		if (!((lvts_ctrl_data)->valid_sensor_mask & BIT(i))) \
> +		if (!((lvts_ctrl)->valid_sensor_mask & BIT(i))) \
>  			continue; \
>  		else
>  
> @@ -145,6 +145,7 @@ struct lvts_ctrl {
>  	const struct lvts_data *lvts_data;
>  	u32 calibration[LVTS_SENSOR_MAX];
>  	u32 hw_tshut_raw_temp;
> +	u8 valid_sensor_mask;
>  	int mode;
>  	void __iomem *base;
>  	int low_thresh;
> @@ -356,7 +357,7 @@ static bool lvts_should_update_thresh(struct lvts_ctrl *lvts_ctrl, int high)
>  	if (high > lvts_ctrl->high_thresh)
>  		return true;
>  
> -	lvts_for_each_valid_sensor(i, lvts_ctrl->lvts_data->lvts_ctrl)
> +	lvts_for_each_valid_sensor(i, lvts_ctrl)
>  		if (lvts_ctrl->sensors[i].high_thresh == lvts_ctrl->high_thresh
>  		    && lvts_ctrl->sensors[i].low_thresh == lvts_ctrl->low_thresh)
>  			return false;
> @@ -617,6 +618,8 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
>  		lvts_sensor[i].high_thresh = INT_MIN;
>  	};
>  
> +	lvts_ctrl->valid_sensor_mask = lvts_ctrl_data->valid_sensor_mask;
> +
>  	return 0;
>  }
>  
> @@ -1112,7 +1115,7 @@ static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
>  	u32 *sensor_bitmap = lvts_ctrl->mode == LVTS_MSR_IMMEDIATE_MODE ?
>  			     sensor_imm_bitmap : sensor_filt_bitmap;
>  
> -	lvts_for_each_valid_sensor(i, lvts_ctrl->lvts_data->lvts_ctrl) {
> +	lvts_for_each_valid_sensor(i, lvts_ctrl) {
>  
>  		int dt_id = lvts_sensors[i].dt_id;
>  
> 
> -- 
> 2.37.3
> 
> 

