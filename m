Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389FAEB64D9
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 07:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQgfVl/i/AVcUS5ggc70MxFgfsFBmBSGVm2GhzJXRGM=; b=uYgW9wE14ITFuFyni0EKM3Nvec
	bETxZYGS/lcw/SvzHnrIH/QH/isMvD3zu86vmWae8QjTcrZOj/9e3FQSjbclEar6I3I/VUL14GwDV
	/JezcVag6XhTwheHQTcxPt5lmeChgzvWXUhTnaMHDJXDQ98LrFM7/lSKkSWU3CH0khBqEepRDpbdw
	jB8yOQxUvDW039nY5cmQSJrq9UC6684i1M2nClXoEtf1au1y6JD/BWoedaKxN91ss6LjcMRBsAOX8
	9bxizQ1lqKLg2qf3tIx9v6TDAoF4XplyE4bVmHOaFaCcGjj74utUAAJxnBtMHahOuqKcM0Fuuv+bU
	AaCHLh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgI2-003vA8-2T;
	Fri, 07 Jul 2023 07:54:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgHz-003v7f-2y
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 07:54:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b8b318c5cfso10642295ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 00:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688716438; x=1691308438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HQgfVl/i/AVcUS5ggc70MxFgfsFBmBSGVm2GhzJXRGM=;
        b=EY+mwitihR1BY0wiVH06ZwvPZB0vcDEEn4HC1LNgbbGW0oKYFmY/xs24morMGXUsr3
         jV/bx4/CxOmJaCIiln1tlZ+gG4y3QixOpNEEnx+9RihDs7Dkeh2hu9R+WjcULUPemcIj
         PBni27YtiE7DOpbwTUoRCcqMt1BLkGrrrVyTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688716438; x=1691308438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQgfVl/i/AVcUS5ggc70MxFgfsFBmBSGVm2GhzJXRGM=;
        b=WSN8uW+N1hGdEghSCb5mOp1ezk1xBqmp7v1yNFcaJGAxuPmb0kFXelbvZRVbkW39ds
         8pXtiijk7e36C9Dgccpwx+5+4jIN4ASJY91IGx196bU/lmZf155zI2UmBELSPXnjsdw2
         1rs5fWmX+Hk7/voh1Egiqrw8t6ixU+2kEsSS5OICn7u421aehBe//gYdhsI6sv77pLR+
         6D/eR0eIKF2f7tt4WNsUmeytSEJhRmWvhI8bAOWqthxkMbUGo/liIkMAzLvb5yILpQXA
         1TqQP+iZTO8ybhN3oDTlm2nalMqZp4uLigBD77pb2LaBlw9uVFhY5V461UPU/TeMO6aE
         V6FQ==
X-Gm-Message-State: ABy/qLZEO950tnU5c4RlviJa8s+HanPUchizXlSTVDfCfe7iW11yjybT
	PkmOGhUtQkQLeiKf55/6/agL5Q==
X-Google-Smtp-Source: APBJJlF6RcNC5y+ljau2+G5q7B3VhzXd0PfFiNLMgLRX96g3mUA+FT12+Re08qem3DIVvI9ZeTddlw==
X-Received: by 2002:a17:903:120f:b0:1b3:cac7:19cd with SMTP id l15-20020a170903120f00b001b3cac719cdmr4804993plh.18.1688716438426;
        Fri, 07 Jul 2023 00:53:58 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:7493:8870:1e91:754])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e5cf00b001b1c3542f57sm2611449plf.103.2023.07.07.00.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 00:53:58 -0700 (PDT)
Date: Fri, 7 Jul 2023 15:53:54 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Make readings
 valid in filtered mode
Message-ID: <20230707075354.GA1333497@google.com>
References: <20230706161509.204546-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230706161509.204546-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_005403_958720_25633B73 
X-CRM114-Status: GOOD (  24.34  )
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

On Thu, Jul 06, 2023 at 12:14:33PM -0400, Nícolas F. R. A. Prado wrote:
> Currently, when a controller is configured to use filtered mode, thermal
> readings are valid only about 30% of the time.
> 
> Upon testing, it was noticed that lowering any of the interval settings
> resulted in an improved rate of valid data. The same was observed when
> decreasing the number of samples for each sensor (which also results in
> quicker measurements).
> 
> Retrying the read with a timeout longer than the time it takes to
> resample (about 344us with these settings and 4 sensors) also improves
> the rate.
> 
> Lower all timing settings to the minimum, configure the filtering to
> single sample, and poll the measurement register for at least one period
> to improve the data validity on filtered mode.  With these changes in
> place, out of 100000 reads, a single one failed, ie 99.999% of the data
> was valid.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on Hayato. Reading out the temperature is now quite reliable.

> 
> ---
> 
>  drivers/thermal/mediatek/lvts_thermal.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 1e11defe4f35..b5fb1d8bc3d8 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -58,11 +58,11 @@
>  #define LVTS_PROTTC(__base)		(__base + 0x00CC)
>  #define LVTS_CLKEN(__base)		(__base + 0x00E4)
>  
> -#define LVTS_PERIOD_UNIT			((118 * 1000) / (256 * 38))
> -#define LVTS_GROUP_INTERVAL			1
> -#define LVTS_FILTER_INTERVAL		1
> -#define LVTS_SENSOR_INTERVAL		1
> -#define LVTS_HW_FILTER				0x2
> +#define LVTS_PERIOD_UNIT			0
> +#define LVTS_GROUP_INTERVAL			0
> +#define LVTS_FILTER_INTERVAL		0
> +#define LVTS_SENSOR_INTERVAL		0
> +#define LVTS_HW_FILTER				0x0

This hunk conflicts with

    thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts

from your other series

>  #define LVTS_TSSEL_CONF				0x13121110
>  #define LVTS_CALSCALE_CONF			0x300
>  #define LVTS_MONINT_CONF			0x9FBF7BDE

on this line.

> @@ -257,6 +257,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>  	struct lvts_sensor *lvts_sensor = thermal_zone_device_priv(tz);
>  	void __iomem *msr = lvts_sensor->msr;
>  	u32 value;
> +	int rc;
>  
>  	/*
>  	 * Measurement registers:
> @@ -269,7 +270,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>  	 * 16	: Valid temperature
>  	 * 15-0	: Raw temperature
>  	 */
> -	value = readl(msr);
> +	rc = readl_poll_timeout(msr, value, value & BIT(16), 240, 400);
>  
>  	/*
>  	 * As the thermal zone temperature will read before the
> @@ -282,7 +283,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>  	 * functionning temperature and directly jump to a system
>  	 * shutdown.
>  	 */
> -	if (!(value & BIT(16)))
> +	if (rc)
>  		return -EAGAIN;
>  
>  	*temp = lvts_raw_to_temp(value & 0xFFFF);
> -- 
> 2.41.0
> 

