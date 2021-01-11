Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02979C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 00:39:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B790D2225E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 00:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B790D2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D64isVjj9ER7v531I3WzCiipppIg21QU4HOv7yGNIek=; b=tuVih4LPch9Dx63K9izqeY1AC
	cztkPmzEQUL600UKFQML3daKm8sBTIzZI0JMBfRQopy9m+KsKVjorjhueNeEI3UkPDEQDLVVvcrNo
	reNxOky8KTdlVhMhPtafYEnzvMSC/MOkI/8CeWkJFvo3G7IeHeXwqQHlts4FxyeGRfNwoZx6RoFAP
	B0Z6a/EG0XKF/IlMidnLlnDD6xXQAlODVH11UIGBM3IkfbPbWPhWQ5vpa0oSi1TtaII+5WniYTpUK
	9YQX8raKPuBzMEDwZ8cLf5TPvbJHkdqSjhnXmB1/iBWikp4+JlE6rwzrb8oWnmHcpc+y8+dCFSySH
	HY/kfsjjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kylEu-0000Af-Ny; Mon, 11 Jan 2021 00:39:20 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kylEs-00008z-0F
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 00:39:19 +0000
Received: by mail-vk1-xa31.google.com with SMTP id s13so3860901vkb.11
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Jan 2021 16:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tfW1bXDcu/lByxe5Lzd9326trCLUNqKWrb1d3xD70zE=;
 b=Vcss8DRQLz+AJgqcoiMcwtcRHNY+1FT4m5PO1GpPO7uSSe/h3lptsFESwXv6y/jDPn
 uZeESDldBzFW4P11UXupd8R0iDzHZdVW2iUmfDvnV2JfbnEIKbc1827Nlg2rjywQnJk9
 03bSP87LEsYrhPVKci/2g8cz3XGXrRryTp/58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tfW1bXDcu/lByxe5Lzd9326trCLUNqKWrb1d3xD70zE=;
 b=gUzqp/E2gqsNdRfVvOORbVHEYtwbPc+PmPn4QKKniEwZvCsa663FOd86N2nT7J4IYx
 1TU71C2Y4tjq+9s45uqtxDnV5McppdWCfCXOYLd+0jiFAAUtjMgk6XaECjuS9uD2XCET
 z9d63zdn2pp+o5gQxgJn3Q0f15TxgFfAG5sGM68N7BmNRDofcsRbZXy3XWJZpHFegvfb
 NVmE6NeMt4Vyr5QKJIYuHzzliyn+JU4drE7zvuQ+iQ8dWLAfzBoLQ5KHmI5n9T5gIWUH
 UbhGYjOLGfjfCuw2MgnmJTll0uDOk3j4yEgbTFXZn5tDl5EJ+1ZqH3lWjBDoASiyAJjz
 5Bwg==
X-Gm-Message-State: AOAM530NLHAMYJZAtX4dWArw3iAbi6KBrJxJuaT6i9zk96H9ofwLidKg
 iTOdAfULNXaRbr1Y8FBWbOO0g4Yh0bmDTmluwmYivQ==
X-Google-Smtp-Source: ABdhPJwjiecZEFrsXBirizL7rHJlesi3agn3gpEePPWBsWov8yc+6W5r6tJ9rLrqQ3BMouyiAxKTgevMOKDBth7uO2M=
X-Received: by 2002:ac5:c5b5:: with SMTP id f21mr10963955vkl.13.1610325555144; 
 Sun, 10 Jan 2021 16:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20201013102358.22588-1-michael.kao@mediatek.com>
 <20201013102358.22588-4-michael.kao@mediatek.com>
In-Reply-To: <20201013102358.22588-4-michael.kao@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 11 Jan 2021 08:39:04 +0800
Message-ID: <CANMq1KDAuXtPc_J4Kxt+e=BfJP+cLt70wPStQShO84LQLaOe8A@mail.gmail.com>
Subject: Re: [v5 3/3] thermal: mediatek: add another get_temp ops for thermal
 sensors
To: Michael Kao <michael.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_193918_175794_5BD32DF7 
X-CRM114-Status: GOOD (  30.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 6:24 PM Michael Kao <michael.kao@mediatek.com> wrote:
>
> Provide thermal zone to read thermal sensor
> in the SoC. We can read all the thermal sensors
> value in the SoC by the node /sys/class/thermal/
>
> In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
> on the first read of sensor that often are bogus values.
>
> This can avoid following warning on boot:
>
>   thermal thermal_zone6: failed to read out thermal zone (-13)
>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/thermal/mtk_thermal.c | 99 +++++++++++++++++++++++++++--------
>  1 file changed, 76 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 0bd7aa564bc2..43c7bdbc147f 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -245,6 +245,11 @@ enum mtk_thermal_version {
>
>  struct mtk_thermal;
>
> +struct mtk_thermal_zone {
> +       struct mtk_thermal *mt;
> +       int id;
> +};
> +
>  struct thermal_bank_cfg {
>         unsigned int num_sensors;
>         const int *sensors;
> @@ -637,6 +642,32 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
>                 mutex_unlock(&mt->lock);
>  }
>
> +static u32 _get_sensor_temp(struct mtk_thermal *mt, int id)
> +{
> +       u32 raw;
> +       int temp;
> +
> +       const struct mtk_thermal_data *conf = mt->conf;

nit: You only use conf once, so I'd just use mt->conf->msr[id] below.

(or at least use conf->version instead of mt->conf->version just below)

> +
> +       raw = readl(mt->thermal_base + conf->msr[id]);
> +
> +       if (mt->conf->version == MTK_THERMAL_V1)
> +               temp = raw_to_mcelsius_v1(mt, id, raw);
> +       else
> +               temp = raw_to_mcelsius_v2(mt, id, raw);
> +
> +       /*
> +        * The first read of a sensor often contains very high bogus
> +        * temperature value. Filter these out so that the system does
> +        * not immediately shut down.
> +        */
> +
> +       if (temp > 200000)
> +               return  -EAGAIN;

nit: one space between return and -EAGAIN.

> +       else
> +               return  temp;

ditto.

> +}
> +
>  /**
>   * mtk_thermal_bank_temperature - get the temperature of a bank
>   * @bank:      The bank
> @@ -649,26 +680,10 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>         struct mtk_thermal *mt = bank->mt;
>         const struct mtk_thermal_data *conf = mt->conf;

nit: Since this is now only used once, drop this variable?

>         int i, temp = INT_MIN, max = INT_MIN;
> -       u32 raw;
>
>         for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
> -               raw = readl(mt->thermal_base + conf->msr[i]);
> -
> -               if (mt->conf->version == MTK_THERMAL_V1) {
> -                       temp = raw_to_mcelsius_v1(
> -                               mt, conf->bank_data[bank->id].sensors[i], raw);

The new version of the code does this instead:
                       temp = raw_to_mcelsius_v1(mt, i, raw);

What's the difference between conf->bank_data[bank->id].sensors[i] and i?


> -               } else {
> -                       temp = raw_to_mcelsius_v2(
> -                               mt, conf->bank_data[bank->id].sensors[i], raw);
> -               }
>
> -               /*
> -                * The first read of a sensor often contains very high bogus
> -                * temperature value. Filter these out so that the system does
> -                * not immediately shut down.
> -                */
> -               if (temp > 200000)
> -                       temp = 0;
> +               temp = _get_sensor_temp(mt, i);
>
>                 if (temp > max)
>                         max = temp;
> @@ -679,7 +694,8 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>
>  static int mtk_read_temp(void *data, int *temperature)
>  {
> -       struct mtk_thermal *mt = data;
> +       struct mtk_thermal_zone *tz = data;
> +       struct mtk_thermal *mt = tz->mt;
>         int i;
>         int tempmax = INT_MIN;
>
> @@ -698,10 +714,28 @@ static int mtk_read_temp(void *data, int *temperature)
>         return 0;
>  }
>
> +static int mtk_read_sensor_temp(void *data, int *temperature)
> +{
> +       struct mtk_thermal_zone *tz = data;
> +       struct mtk_thermal *mt = tz->mt;
> +       int id = tz->id - 1;
> +
> +       if (id < 0)
> +               return  -EACCES;

nit: one space after return.

> +
> +       *temperature = _get_sensor_temp(mt, id);
> +
> +       return 0;
> +}
> +
>  static const struct thermal_zone_of_device_ops mtk_thermal_ops = {
>         .get_temp = mtk_read_temp,
>  };
>
> +static const struct thermal_zone_of_device_ops mtk_thermal_sensor_ops = {
> +       .get_temp = mtk_read_sensor_temp,
> +};
> +
>  static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
>                                   u32 apmixed_phys_base, u32 auxadc_phys_base,
>                                   int ctrl_id)
> @@ -992,6 +1026,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>         u64 auxadc_phys_base, apmixed_phys_base;
>         struct thermal_zone_device *tzdev;
>         void __iomem *apmixed_base, *auxadc_base;
> +       struct mtk_thermal_zone *tz;
>
>         mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
>         if (!mt)
> @@ -1080,11 +1115,29 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, mt);
>
> -       tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, 0, mt,
> -                                                    &mtk_thermal_ops);
> -       if (IS_ERR(tzdev)) {
> -               ret = PTR_ERR(tzdev);
> -               goto err_disable_clk_peri_therm;
> +       for (i = 0; i < mt->conf->num_sensors + 1; i++) {
> +               tz = kmalloc(sizeof(*tz), GFP_KERNEL);

I don't see those structures being freed on error, or on driver unbind.

Maybe use dev_kmalloc instead?

> +               if (!tz)
> +                       return -ENOMEM;
> +
> +               tz->mt = mt;
> +               tz->id = i;
> +
> +               tzdev = devm_thermal_zone_of_sensor_register(&pdev->dev, i, tz, (i == 0) ?
> +                                                            &mtk_thermal_ops :
> +                                                            &mtk_thermal_sensor_ops);
> +
> +               if (IS_ERR(tzdev)) {
> +                       if (PTR_ERR(tzdev) == -ENODEV) {
> +                               dev_warn(&pdev->dev,
> +                                        "sensor %d not registered in thermal zone in dt\n", i);
> +                               continue;
> +                       }
> +                       if (PTR_ERR(tzdev) == -EACCES) {
> +                               ret = PTR_ERR(tzdev);
> +                               goto err_disable_clk_peri_therm;
> +                       }
> +               }
>         }
>
>         return 0;
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
