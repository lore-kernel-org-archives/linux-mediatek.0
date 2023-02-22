Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66861C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WM201hCZCXWEJn+giss3tYnZ9e22p5G7EM0hFcR5fn8=; b=WDhXIsNla2f9FlRR/lBY1qPKsY
	ounpbhqttdyw7hUkrEPZp9Bf35jBG8YXaFp/4F60iIPQvW0RMVrZl1Vnf56PfojLCKFcrsOjKJ7xV
	xU6+Y3rLdgcnmRxoRq1lFDolfJSeR+I9tVOFKhglaIGcwVh7QJTaPb5vGHYKh/gGYCd4eB+HK2rHp
	CxNjhz4w5/VIk29nLXJGpd2LXjDs+FJY3Qewh7PUiNRZRccgm75X6F9gDl+Dbc0D56QNPweeFpX5P
	8VCqsZg+J4d2g3JUqQbxBjHL//6BPOtnxThSDLoOMUKngUf2GCnzmmgotBoYjNUZfZptrsf6Frph4
	aYT00auA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUv21-00Drtu-Os; Wed, 22 Feb 2023 19:44:01 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUv1q-00DrsY-Qe; Wed, 22 Feb 2023 19:43:52 +0000
Received: by mail-ed1-f43.google.com with SMTP id ee7so19892764edb.2;
        Wed, 22 Feb 2023 11:43:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WM201hCZCXWEJn+giss3tYnZ9e22p5G7EM0hFcR5fn8=;
        b=Nwjsz47oX6MLEaJfgY373jeLkopi+6DMwrIIuZsWEBptNh6nZr4ds6f6M4SuTjDS49
         z0Ufdx+MIiLuAHgcDM+QuHdclBjbFoHPVAH6IJaXunsj2ktbyN+7YFptuKzWW93OURFB
         v2qHIAh0dg1UCcov7hDyGFS0SO9g8pLWNJOIaXPXvl4C3GqTjnh8NNKeNxtIHCdMjqmC
         b0DO9yNW8wQ+asPWhCUhwPdWeJGOkGQYSCw0IIewKpUsasxAMfeGdNWe6blEA07FN0jZ
         0OBLVwaDUt0+7qFrfDIQBXo5G3idLPB9sBT9Sg8wqk/QlPz4x2CzCNxs55LfFt+KoKzI
         bL9g==
X-Gm-Message-State: AO0yUKXEn7hACiJBdFcUDtIFzEjzcuRjLR0sVXBjVhyH02V0sJxyU33d
	xbo8+HxekALb11TXnydqlpkijnbL1YvHiOdS8Bg=
X-Google-Smtp-Source: AK7set88SI6i3IHGb/K8rrdyWXga3jiWe2JG3TPOCkgBqQ36V2/dfgIUTNlb4bGCo/yyJNlhG+Z6a+0+HbWghCjoPQ8=
X-Received: by 2002:a17:907:7669:b0:8ab:b606:9728 with SMTP id
 kk9-20020a170907766900b008abb6069728mr8009293ejc.5.1677095027312; Wed, 22 Feb
 2023 11:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org> <20230221180710.2781027-7-daniel.lezcano@linaro.org>
In-Reply-To: <20230221180710.2781027-7-daniel.lezcano@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 22 Feb 2023 20:43:36 +0100
Message-ID: <CAJZ5v0gTmi7ZeDDdHWGWju4m3bv2366oVqSP1dGOT+3jLV-jaw@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] thermal: Don't use 'device' internal thermal
 zone structure field
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Balsam CHIHI <bchihi@baylibre.com>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ido Schimmel <idosch@nvidia.com>, 
	Mark Brown <broonie@kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_114350_887631_0CF9C950 
X-CRM114-Status: GOOD (  27.05  )
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

On Tue, Feb 21, 2023 at 7:07 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> Some drivers are directly using the thermal zone's 'device' structure
> field.
>
> Use the driver device pointer instead of the thermal zone device when
> it is available.
>
> Remove the traces when they are duplicate with the traces in the core
> code.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek LVTS
> ---
>  drivers/thermal/imx_thermal.c                 | 37 ++++---------------
>  drivers/thermal/mediatek/lvts_thermal.c       |  4 +-
>  drivers/thermal/thermal_hwmon.c               |  4 +-
>  .../ti-soc-thermal/ti-thermal-common.c        |  2 +-
>  4 files changed, 13 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index a0b8de269986..c3136978adee 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -285,13 +285,13 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
>                 if (data->alarm_temp == trips[IMX_TRIP_CRITICAL].temperature &&
>                         *temp < trips[IMX_TRIP_PASSIVE].temperature) {
>                         imx_set_alarm_temp(data, trips[IMX_TRIP_PASSIVE].temperature);
> -                       dev_dbg(&tz->device, "thermal alarm off: T < %d\n",
> +                       dev_dbg(data->dev, "thermal alarm off: T < %d\n",
>                                 data->alarm_temp / 1000);
>                 }
>         }
>
>         if (*temp != data->last_temp) {
> -               dev_dbg(&tz->device, "millicelsius: %d\n", *temp);
> +               dev_dbg(data->dev, "millicelsius: %d\n", *temp);
>                 data->last_temp = *temp;
>         }
>
> @@ -367,36 +367,16 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz, int trip,
>  static int imx_bind(struct thermal_zone_device *tz,
>                     struct thermal_cooling_device *cdev)
>  {
> -       int ret;
> -
> -       ret = thermal_zone_bind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev,
> -                                              THERMAL_NO_LIMIT,
> -                                              THERMAL_NO_LIMIT,
> -                                              THERMAL_WEIGHT_DEFAULT);
> -       if (ret) {
> -               dev_err(&tz->device,
> -                       "binding zone %s with cdev %s failed:%d\n",
> -                       tz->type, cdev->type, ret);
> -               return ret;
> -       }
> -
> -       return 0;
> +       return thermal_zone_bind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev,
> +                                               THERMAL_NO_LIMIT,
> +                                               THERMAL_NO_LIMIT,
> +                                               THERMAL_WEIGHT_DEFAULT);
>  }
>
>  static int imx_unbind(struct thermal_zone_device *tz,
>                       struct thermal_cooling_device *cdev)
>  {
> -       int ret;
> -
> -       ret = thermal_zone_unbind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev);
> -       if (ret) {
> -               dev_err(&tz->device,
> -                       "unbinding zone %s with cdev %s failed:%d\n",
> -                       tz->type, cdev->type, ret);
> -               return ret;
> -       }
> -
> -       return 0;
> +       return thermal_zone_unbind_cooling_device(tz, IMX_TRIP_PASSIVE, cdev);
>  }
>
>  static struct thermal_zone_device_ops imx_tz_ops = {
> @@ -558,8 +538,7 @@ static irqreturn_t imx_thermal_alarm_irq_thread(int irq, void *dev)
>  {
>         struct imx_thermal_data *data = dev;
>
> -       dev_dbg(&data->tz->device, "THERMAL ALARM: T > %d\n",
> -               data->alarm_temp / 1000);
> +       dev_dbg(data->dev, "THERMAL ALARM: T > %d\n", data->alarm_temp / 1000);
>
>         thermal_zone_device_update(data->tz, THERMAL_EVENT_UNSPECIFIED);
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index fb4b1b4db245..beb835d644e2 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -305,7 +305,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
>          * 14-0 : Raw temperature for threshold
>          */
>         if (low != -INT_MAX) {
> -               dev_dbg(&tz->device, "Setting low limit temperature interrupt: %d\n", low);
> +               pr_debug("%s: Setting low limit temperature interrupt: %d\n", tz->type, low);
>                 writel(raw_low, LVTS_H2NTHRE(base));
>         }
>
> @@ -318,7 +318,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
>          *
>          * 14-0 : Raw temperature for threshold
>          */
> -       dev_dbg(&tz->device, "Setting high limit temperature interrupt: %d\n", high);
> +       pr_debug("%s: Setting high limit temperature interrupt: %d\n", tz->type, high);
>         writel(raw_high, LVTS_HTHRE(base));
>
>         return 0;
> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
> index 964db7941e31..bc02095b314c 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c
> @@ -228,14 +228,14 @@ void thermal_remove_hwmon_sysfs(struct thermal_zone_device *tz)
>         hwmon = thermal_hwmon_lookup_by_type(tz);
>         if (unlikely(!hwmon)) {
>                 /* Should never happen... */
> -               dev_dbg(&tz->device, "hwmon device lookup failed!\n");
> +               dev_dbg(hwmon->device, "hwmon device lookup failed!\n");
>                 return;
>         }
>
>         temp = thermal_hwmon_lookup_temp(hwmon, tz);
>         if (unlikely(!temp)) {
>                 /* Should never happen... */
> -               dev_dbg(&tz->device, "temperature input lookup failed!\n");
> +               dev_dbg(hwmon->device, "temperature input lookup failed!\n");
>                 return;
>         }
>
> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> index 216b29068b08..060f46cea5ff 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> @@ -43,7 +43,7 @@ static void ti_thermal_work(struct work_struct *work)
>
>         thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
>
> -       dev_dbg(&data->ti_thermal->device, "updated thermal zone %s\n",
> +       dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
>                 data->ti_thermal->type);

The code before the change is more consistent, because it refers to
the same object in both instances.

It looks like a type field accessor is needed, eg. thermal_zone_device_type()?

Or move the debug message to thermal_zone_device_update()?

>  }
>
> --
> 2.34.1
>

