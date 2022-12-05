Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C05FC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+puc7EehSj2l1wYCIAHi1SQ7iD7xNS5o4aYLSrDYx5I=; b=M806DtiLzr41LmOgBKEc1+kpQd
	GgPHC0f4Mag3b4dj7ikX51z2OGg+ICCBHLBxd70lg6eg/RfODJJXSG454kLagy5EWkOUytCCXOvZ9
	G9tD4VMXTu1d+vfnjCz31yt5KibcR9LeaxWO5FB/JxYpM0xjgTG1YKt4seO9Hc7iywdyXvKeix3pn
	m9fAaQ6LPa1fmuQLefEKk8jE3rEWojjkX7+FHrQYD1y5EBgTxuI+0o0pyu6lQuwUY3L5L0uXxSDkE
	xRFSmdaqnm4+r+0pcZI7sOK4nkmiW4TLh5ZAX56Npfmls824YboCw0qcazMVfQp4wZrtkzskrvawe
	tbI2HP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28ua-000zOo-LK; Mon, 05 Dec 2022 10:41:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28uO-000yoN-8I
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 10:41:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so9655423wms.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+puc7EehSj2l1wYCIAHi1SQ7iD7xNS5o4aYLSrDYx5I=;
        b=D4TMfQ78LyNXcaS0GDygRNPWw/l1RoccJb4kWCusR/c12TF3CHwn5+8B041WRmsv8a
         7sdTh+uteBGDYQxMUs65T/uTh9VbNFmOUGQR4Kxw7m4EfeYcioB8N8pskB41o36d04mn
         JxYxB1ZTlMjal1kf3GPFP2E7lOxg1ukh1OnJAzpeKZ25ic0sEUGPJodcB04CAWMFzWZs
         iM+BEQDblxWF+1xtsfFlx2qHotlugHXOTtazuXk/LOsMnf9GdyHx8Y1/fXGXIv68auh8
         +ovAK5Htg4UpbTaPBLK3bF+UNHTNL4FoE7cqO395sG4WdWfCQhULoYcju80J8xgcehos
         svDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+puc7EehSj2l1wYCIAHi1SQ7iD7xNS5o4aYLSrDYx5I=;
        b=OdrDYkyV/Sd4j/JLlZ8xv/A/B9P7JipQrWPWsh0UQb10T+TMxC1oUl7iumA05sq1TY
         mXRL0N4Rz/pWTyvbtZBhXiTQEm9Vl0yCz2rUeUTMXgT6G7o5jkN2CrCL8MAV+adnzo1A
         iz2E6lpEnDuEgrrM5TJ578xSVf4Kr8pVlQc0X6o6Jc4v83hMFTMK0zDVsn5Mt2Qq0Ye3
         4tmN82Ynh1hjFe3VJtJlFiUQqMd54iU6nzJJ6y3+w65tLY73M8KO/6DkY7Ongqz0pbwu
         qV9vQM7il4OYWop22fKcTde/cMEPc49TOl9HmBM2bwzw4EPkJY807LmytFRkM9XfuOST
         WuxA==
X-Gm-Message-State: ANoB5plwU8EobImxG5JtFTmiv0oZjNxK0t+Y+hiGWLHPwGjhlZR94HLN
	Gho9j1LLlgxR7Jv+AnMxn0zLSQ==
X-Google-Smtp-Source: AA0mqf4ZIrxBqTKxt2otvM8/XX6LTqqSsZuT5BLpT79uglDkq7o8t/uIRo+/18fAEpJ0EfAWBR7TQw==
X-Received: by 2002:a1c:f015:0:b0:3cf:7818:b123 with SMTP id a21-20020a1cf015000000b003cf7818b123mr63209276wmb.8.1670236863061;
        Mon, 05 Dec 2022 02:41:03 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j9-20020a5d5649000000b0022cdeba3f83sm13685769wrw.84.2022.12.05.02.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 02:41:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Dec 2022 11:41:00 +0100
Message-Id: <COTTJX635TNF.1WL2TEZN7VW9O@amjad-ThinkPad-T490>
To: "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Amit Kucheria" <amitk@kernel.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Zhang Rui" <rui.zhang@intel.com>
Cc: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Fabien Parent" <fparent@baylibre.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Markus Schneider-Pargmann" <msp@baylibre.com>,
 <linux-pm@vger.kernel.org>, "Rob Herring" <robh@kernel.org>, "Michael Kao"
 <michael.kao@mediatek.com>, <linux-kernel@vger.kernel.org>, "Hsin-Yi Wang"
 <hsinyi@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
From: "Amjad Ouled-Ameur" <aouledameur@baylibre.com>
X-Mailer: aerc 0.13.0-78-g9db3710dd73b
References: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com> <20221018-up-i350-thermal-bringup-v7-4-ebf08ff2eddb@baylibre.com> <4121bb6b-30db-7a23-f4c8-40afdda7a0b5@linaro.org>
In-Reply-To: <4121bb6b-30db-7a23-f4c8-40afdda7a0b5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_024112_317126_0EA61C28 
X-CRM114-Status: GOOD (  28.51  )
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

Hi Daniel,
On Sun Dec 4, 2022 at 6:26 PM CET, Daniel Lezcano wrote:
> On 18/11/2022 12:04, Amjad Ouled-Ameur wrote:
> > Provide thermal zone to read thermal sensor in the SoC. We can read all=
 the
> > thermal sensors value in the SoC by the node /sys/class/thermal/
> >=20
> > In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
> > on the first read of sensor that often are bogus values.
> > This can avoid following warning on boot:
> >=20
> >    thermal thermal_zone6: failed to read out thermal zone (-13)
> >=20
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > ---
> >   drivers/thermal/mtk_thermal.c | 99 ++++++++++++++++++++++++++++++++--=
---------
> >   1 file changed, 74 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_therma=
l.c
> > index 3a5df1440822..b1f4d19edd4f 100644
> > --- a/drivers/thermal/mtk_thermal.c
> > +++ b/drivers/thermal/mtk_thermal.c
> > @@ -259,6 +259,11 @@ enum mtk_thermal_version {
> >  =20
> >   struct mtk_thermal;
> >  =20
> > +struct mtk_thermal_zone {
> > +	struct mtk_thermal *mt;
> > +	int id;
> > +};
> > +
> >   struct thermal_bank_cfg {
> >   	unsigned int num_sensors;
> >   	const int *sensors;
> > @@ -307,6 +312,8 @@ struct mtk_thermal {
> >  =20
> >   	const struct mtk_thermal_data *conf;
> >   	struct mtk_thermal_bank banks[MAX_NUM_ZONES];
> > +
> > +	int (*raw_to_mcelsius)(struct mtk_thermal *mt, int sensno, s32 raw);
> >   };
> >  =20
> >   /* MT8183 thermal sensor data */
> > @@ -709,6 +716,29 @@ static void mtk_thermal_put_bank(struct mtk_therma=
l_bank *bank)
> >   		mutex_unlock(&mt->lock);
> >   }
> >  =20
> > +static int _get_sensor_temp(struct mtk_thermal *mt, int id)
> > +{
> > +	u32 raw;
> > +	int temp;
> > +
> > +	const struct mtk_thermal_data *conf =3D mt->conf;
> > +
> > +	raw =3D readl(mt->thermal_base + conf->msr[id]);
> > +
> > +	temp =3D mt->raw_to_mcelsius(mt, id, raw);
> > +
> > +	/*
> > +	 * The first read of a sensor often contains very high bogus
> > +	 * temperature value. Filter these out so that the system does
> > +	 * not immediately shut down.
> > +	 */
> > +
> > +	if (temp > 200000)
> > +		return -EAGAIN;
> > +	else
> > +		return temp;
> > +}
> > +
> >   /**
> >    * mtk_thermal_bank_temperature - get the temperature of a bank
> >    * @bank:	The bank
> > @@ -721,26 +751,9 @@ static int mtk_thermal_bank_temperature(struct mtk=
_thermal_bank *bank)
> >   	struct mtk_thermal *mt =3D bank->mt;
> >   	const struct mtk_thermal_data *conf =3D mt->conf;
> >   	int i, temp =3D INT_MIN, max =3D INT_MIN;
> > -	u32 raw;
> >  =20
> >   	for (i =3D 0; i < conf->bank_data[bank->id].num_sensors; i++) {
> > -		raw =3D readl(mt->thermal_base + conf->msr[i]);
> > -
> > -		if (mt->conf->version =3D=3D MTK_THERMAL_V1) {
> > -			temp =3D raw_to_mcelsius_v1(
> > -				mt, conf->bank_data[bank->id].sensors[i], raw);
> > -		} else {
> > -			temp =3D raw_to_mcelsius_v2(
> > -				mt, conf->bank_data[bank->id].sensors[i], raw);
> > -		}
> > -
> > -		/*
> > -		 * The first read of a sensor often contains very high bogus
> > -		 * temperature value. Filter these out so that the system does
> > -		 * not immediately shut down.
> > -		 */
> > -		if (temp > 200000)
> > -			temp =3D 0;
> > +		temp =3D _get_sensor_temp(mt, i);
> >  =20
> >   		if (temp > max)
> >   			max =3D temp;
> > @@ -749,9 +762,10 @@ static int mtk_thermal_bank_temperature(struct mtk=
_thermal_bank *bank)
> >   	return max;
> >   }
> >  =20
> > -static int mtk_read_temp(struct thermal_zone_device *tz, int *temperat=
ure)
> > +static int mtk_read_temp(struct thermal_zone_device *tzdev, int *tempe=
rature)
> >   {
> > -	struct mtk_thermal *mt =3D tz->devdata;
> > +	struct mtk_thermal_zone *tz =3D tzdev->devdata;
> > +	struct mtk_thermal *mt =3D tz->mt;
> >   	int i;
> >   	int tempmax =3D INT_MIN;
> >  =20
> > @@ -770,10 +784,28 @@ static int mtk_read_temp(struct thermal_zone_devi=
ce *tz, int *temperature)
> >   	return 0;
> >   }
> >  =20
> > +static int mtk_read_sensor_temp(struct thermal_zone_device *tzdev, int=
 *temperature)
> > +{
> > +	struct mtk_thermal_zone *tz =3D tzdev->devdata;
> > +	struct mtk_thermal *mt =3D tz->mt;
> > +	int id =3D tz->id - 1;
> > +
> > +	if (id < 0)
> > +		return -EACCES;
> > +
> > +	*temperature =3D _get_sensor_temp(mt, id);
> > +
> > +	return 0;
> > +}
> > +
> >   static const struct thermal_zone_device_ops mtk_thermal_ops =3D {
> >   	.get_temp =3D mtk_read_temp,
> >   };
> >  =20
> > +static const struct thermal_zone_device_ops mtk_thermal_sensor_ops =3D=
 {
> > +	.get_temp =3D mtk_read_sensor_temp,
> > +};
> > +
> >   static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
> >   				  u32 apmixed_phys_base, u32 auxadc_phys_base,
> >   				  int ctrl_id)
> > @@ -1072,6 +1104,7 @@ static int mtk_thermal_probe(struct platform_devi=
ce *pdev)
> >   	u64 auxadc_phys_base, apmixed_phys_base;
> >   	struct thermal_zone_device *tzdev;
> >   	void __iomem *apmixed_base, *auxadc_base;
> > +	struct mtk_thermal_zone *tz;
> >  =20
> >   	mt =3D devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
> >   	if (!mt)
> > @@ -1150,6 +1183,9 @@ static int mtk_thermal_probe(struct platform_devi=
ce *pdev)
> >  =20
> >   	mtk_thermal_turn_on_buffer(mt, apmixed_base);
> >  =20
> > +	mt->raw_to_mcelsius =3D (mt->conf->version =3D=3D MTK_THERMAL_V1) ?
> > +				raw_to_mcelsius_v1 : raw_to_mcelsius_v2;
> > +
> >   	if (mt->conf->version =3D=3D MTK_THERMAL_V2) {
> >   		mtk_thermal_release_periodic_ts(mt, auxadc_base);
> >   	}
> > @@ -1161,11 +1197,24 @@ static int mtk_thermal_probe(struct platform_de=
vice *pdev)
> >  =20
> >   	platform_set_drvdata(pdev, mt);
> >  =20
> > -	tzdev =3D devm_thermal_of_zone_register(&pdev->dev, 0, mt,
> > -					      &mtk_thermal_ops);
> > -	if (IS_ERR(tzdev)) {
> > -		ret =3D PTR_ERR(tzdev);
> > -		goto err_disable_clk_peri_therm;
> > +	for (i =3D 0; i < mt->conf->num_sensors + 1; i++) {
> > +		tz =3D devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
> > +		if (!tz)
> > +			return -ENOMEM;
> > +
> > +		tz->mt =3D mt;
> > +		tz->id =3D i;
> > +
> > +		tzdev =3D devm_thermal_of_zone_register(&pdev->dev, i, tz, (i =3D=3D=
 0) ?
> > +							     &mtk_thermal_ops :
> > +							     &mtk_thermal_sensor_ops);
>
> Here you use again the aggregation
I addressed this concern in V6, could you please take a look and let me
know what you think [0].

[0]: https://lore.kernel.org/all/5eb0cdc2-e9f9-dd42-bf80-b7dcd8bcc196@bayli=
bre.com/

Regards,
Amjad
>
> > +
> > +		if (IS_ERR(tzdev)) {
> > +			ret =3D PTR_ERR(tzdev);
> > +			if (ret =3D=3D -ENODEV)
> > +				continue;
> > +			goto err_disable_clk_peri_therm;
> > +		}
> >   	}
> >  =20
> >   	ret =3D devm_thermal_add_hwmon_sysfs(tzdev);
> >=20
>
> --=20
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog


