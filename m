Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73017CA5508
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzZ6MgD3pf8m+rx1Xv6RC5XGWASwhi1UIBmWgNbxJHM=; b=bzc9wfX6NdCDr8qJwIYxPsY4kq
	zC/s0ZMxUApZ4CM2px6woQQGsE2vGoIx2ljGHfVD0aZ5T/R8tbGcbCc4di26mC+QACRcJqISif/7X
	ilu+1QIZzIughw6jWZ5TDun6kgY0nK9AilHk/h2fQfvyc/alH5TR6TMg/YVVi4I4g8tvVjvqmnNK5
	ZjQxGIFXXm8ERF66scF5BcOHLmJVfqXYzk/1d22NjH+TivN9Z/JE8B1rBzC0d4MF8WjZW6tiIqwru
	RioH0UkNo6WcpL6WtrByA4Mj+Hnbz4v62z48Rpq4S66NeTHI3+Av5IW1023vitc/AJ3maca9CU5hW
	6WZGRnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLLV-0057MV-1q;
	Wed, 13 Sep 2023 08:35:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLLR-0057KL-2F
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 08:35:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9aa0495f9cfso148127166b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 01:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694594132; x=1695198932; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vzZ6MgD3pf8m+rx1Xv6RC5XGWASwhi1UIBmWgNbxJHM=;
        b=tBDA8IS7xSehHID2i62GvbpQ6Q0pwj5Vase24FObQE568j3Y28yHnvowsOTJkUNUb0
         3ZVsCLTI7w93bTooW+ONRZhzOMf5UfakOJA48QVm3rBj/c1ifB3qm9BHskRTaX9tH3sI
         cY6VsesOyRcMOp1/Zd6mj+whI9/2uzZBtP75TbWSLCme6dcyV6rt4rDOI9tdxdaY6yd5
         NxvVO90rAH7eUSnaqUrc+QHtV2+mhljrMWgPo7j5ykCrunMnfOi+atAAJso8SVedbY/Z
         whMVbRo2WQQwRKK0iJIiUDkLsMeIHzbk6SOZrqFpshtB5DJO4T4GzFyfKRAYTUkyCIM7
         NvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694594132; x=1695198932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzZ6MgD3pf8m+rx1Xv6RC5XGWASwhi1UIBmWgNbxJHM=;
        b=L6DodnHaXGmswXFZlwEN56ybzbLLj4D7d/8aItonx+Ypo8OmCrZs++cSxI2X2cBNnM
         xPuG+84RRln0vwzAim6FWQ/dYCY47nh+cf6PGgveX09mpDPqtbHdqhAjRui/KdDx4Vu+
         vWisc2nUHyJQafti6VHZnGYKrbkE/RqwreuSFRXMfUt3L4X6ablXwf3Ps2reyJrSJa8i
         x4dfayAo9MMvPogE169IUssdyV3JsH1POh5bZbsjXaVjE+7S4IlwB3NEV3vZns8uB80A
         9vVi7B9y7/oaWpxKP52TprDF4xWdA6XJFhR3rK7H38eaFhrbT/Mw4bR3k33u203tQEPd
         Y1ow==
X-Gm-Message-State: AOJu0YyaFyrXcXzFY2e9u3rGzFvSgJhKHD3HdfJzTHNqCh+5XQaozeDk
	8Nx4ct3VCqftasKa9A5e2U25qg==
X-Google-Smtp-Source: AGHT+IGZ4W6oHcVWa6n5e3HT26skU4k3V7FAnm2BWzLS+1RwRT1pMvQIlK0HWxcVOFIXwB+8acOF1Q==
X-Received: by 2002:a17:906:c112:b0:9a4:11a3:c32b with SMTP id do18-20020a170906c11200b009a411a3c32bmr7346391ejc.29.1694594132177;
        Wed, 13 Sep 2023 01:35:32 -0700 (PDT)
Received: from blmsp ([2001:4091:a246:82a0:6611:d59a:8ba3:9a66])
        by smtp.gmail.com with ESMTPSA id lz5-20020a170906fb0500b0098e78ff1a87sm7990464ejb.120.2023.09.13.01.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:35:30 -0700 (PDT)
Date: Wed, 13 Sep 2023 10:35:29 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] thermal/drivers/mediatek: Fix control buffer enablement
 on MT7896
Message-ID: <20230913083529.3bgjl6rvfmixgjnd@blmsp>
References: <20230907112018.52811-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230907112018.52811-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_013533_955804_6D838868 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Daniel Golle <daniel@makrotopia.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 07, 2023 at 01:20:18PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Reading thermal sensor on mt7986 devices returns invalid temperature:
> 
> bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
>  -274000
> 
> Fix this by adding missing members in mtk_thermal_data struct which were
> used in mtk_thermal_turn_on_buffer after commit 33140e668b10.
> 
> Cc: stable@vger.kernel.org
> Fixes: 33140e668b10 ("thermal/drivers/mediatek: Control buffer enablement tweaks")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Thanks for fixing!

Best,
Markus

> ---
>  drivers/thermal/mediatek/auxadc_thermal.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index 843214d30bd8..967b9a1aead4 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -690,6 +690,9 @@ static const struct mtk_thermal_data mt7986_thermal_data = {
>  	.adcpnp = mt7986_adcpnp,
>  	.sensor_mux_values = mt7986_mux_values,
>  	.version = MTK_THERMAL_V3,
> +	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
> +	.apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
> +	.apmixed_buffer_ctl_set = BIT(0),
>  };
>  
>  static bool mtk_thermal_temp_is_valid(int temp)
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

