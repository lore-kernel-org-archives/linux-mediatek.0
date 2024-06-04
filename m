Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1EEC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 17:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FXev4Iglq7vn8M9/xJrlzCWzECxyOY6UHQcKBzcM8E=; b=qR4bgCxIDF16F/y3od8RsoX8eM
	KvBeNRwz/K3G9SRpOFcR9mSrDItLRzYt3TRX8M8EGTQEsPTVK5GUHRNahySgM+a+5Uiq2tqiPZVo7
	xdJWFwe0ktXk+/GkmIKFdvZivdJIootDF9HriO6TJ8gK2/Yg9/hojOs4YQ+48WP2wsGOOcpdV0sDp
	MuxCbcEfWaFwfNnwfL7+iVlVUqyCwNXc+CvvDc7UFOHI9EXh3+Y43PnbHhuGXZyfcIKxwF2qB+vVb
	5AonhPyOFrm0mQyxVFMRXeonnZ7Dic+2TpB9z78RZ30BMqPyLRg7CtPKyjE+Pd0Rx/fLI06tMd1j3
	jLVg7/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXWC-00000003DmO-2jZ2;
	Tue, 04 Jun 2024 17:00:16 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXW8-00000003DlF-3smq
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 17:00:15 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-44026036ea8so3490261cf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 10:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717520411; x=1718125211; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0FXev4Iglq7vn8M9/xJrlzCWzECxyOY6UHQcKBzcM8E=;
        b=qMtXtbku13Uk1zcrec0JNriSknza+5MkmrmdDXNYo4/YYkHzvnOHCeAXL7kJmr3qWe
         P5VKAyjIN00jwnN4l0elPZGMNGXZe3J4oJmLzJpdB3zHcYaY83tvCDBIOppbZFbmlFd8
         UYfqLw6OTEd42Bi7Xp64oJQ1JCiFf69796rl0aWktb7K27pDVNkK0K2VdUIx7yVVNC5R
         Go4KLUOzar3cd5N9Ordpa7IMLcWenc6AQCyi1ccNxtFgI13aQmpM5DyUDCjiwQ1Etf1M
         NTaCUR/FCQJqoOuWy+J7zqRZLrKiAM3Bu2tKafCZmCAsgn361jO8D1b4GMg6uim2+7Ev
         56iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520411; x=1718125211;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FXev4Iglq7vn8M9/xJrlzCWzECxyOY6UHQcKBzcM8E=;
        b=fjGlaA/5yPa1ZRbHpnyJn47skVf8xyMA6Kqt8k++56fT1K5rQ9WdrWtQtRn81JfFEA
         UC20CjfYwGrA1aUslkAPu5u5EOewShGG6OoOuI7LUv3LidFslZO8sMYCSvImkkcVfD/h
         E0UfCd5kgE6DMA+y1ASKlLJmUTC3PvOxSdiPxhTjOyvvZCPj3M9GUzA9n0hT2bli//GJ
         WAjsJBxHM1gFrL+JoIrGH0d5esaM2XRO3XisXsAmSPQ/zQxsKK23xN6doDbrfsXGlGMq
         XCiQFQlPANptnNrwscLCtygeBcsH0lPPkK0uxOH+HwZkFxKxT8ReZu2BIMDa5aY5q86P
         OO9g==
X-Forwarded-Encrypted: i=1; AJvYcCVmPF7rTxAKKaaRULmkQQxADXGyWpUk2laXkGp6kBvF2+jhDzKhPtAvPFvCrWcvpOCZ+exZPUUrvuxEJcyWwEqOZEi9RHcKp52kLjj0NKBrtlIz
X-Gm-Message-State: AOJu0YyHqtm99jSGauxuUWJVihM1JpStsy8LINTtPXJAF2RoPmBDHVPc
	q7l5fvcn939UVq1qZV57zUiGwkN9AWSBneo4tTN39KpCsO7HGNVQ+Ij/6Mkksek=
X-Google-Smtp-Source: AGHT+IEQ+mgjmHq05bdk7xACEVNcsSDNdul6POVLs6t8LHbGadcCJYvlJlevhDqW8d5ZOSNb/8F20Q==
X-Received: by 2002:a05:622a:20b:b0:43a:f89a:6631 with SMTP id d75a77b69052e-43ff5250db8mr133406231cf.8.1717520410432;
        Tue, 04 Jun 2024 10:00:10 -0700 (PDT)
Received: from xanadu (modemcable018.15-162-184.mc.videotron.ca. [184.162.15.18])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-440204b5420sm7471591cf.17.2024.06.04.10.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:00:10 -0700 (PDT)
Date: Tue, 4 Jun 2024 13:00:08 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Julien Panis <jpanis@baylibre.com>
cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Return error
 in case of invalid efuse data
In-Reply-To: <20240604-mtk-thermal-calib-check-v2-1-8f258254051d@baylibre.com>
Message-ID: <25528q8o-73p2-25s2-5o2q-on72no5s91qr@onlyvoer.pbz>
References: <20240604-mtk-thermal-calib-check-v2-1-8f258254051d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_100012_999331_C9FB13F6 
X-CRM114-Status: GOOD (  20.91  )
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

On Tue, 4 Jun 2024, Julien Panis wrote:

> This patch prevents from registering thermal entries and letting the
> driver misbehave if efuse data is invalid. A device is not properly
> calibrated if the golden temperature is zero.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
> Guard against invalid calibration data, following this discussion:
> https://lore.kernel.org/all/ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com/
> ---
> Changes in v2:
> - Add Fixes tag.
> - Link to v1: https://lore.kernel.org/r/20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 0bb3a495b56e..185d5a32711f 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -769,7 +769,11 @@ static int lvts_golden_temp_init(struct device *dev, u8 *calib,
>  	 */
>  	gt = (((u32 *)calib)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
>  
> -	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
> +	/* A zero value for gt means that device has invalid efuse data */
> +	if (!gt)
> +		return -ENODATA;
> +
> +	if (gt < LVTS_GOLDEN_TEMP_MAX)
>  		golden_temp = gt;
>  
>  	golden_temp_offset = golden_temp * 500 + lvts_data->temp_offset;
> 
> ---
> base-commit: 632483ea8004edfadd035de36e1ab2c7c4f53158
> change-id: 20240603-mtk-thermal-calib-check-ba2ec24a1c32
> 
> Best regards,
> -- 
> Julien Panis <jpanis@baylibre.com>
> 
> 

