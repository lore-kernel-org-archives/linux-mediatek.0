Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1258BC5472D
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGemp3/J4+ZRAtrBZReELh9mp4/tveOz4AeZNo7+1xw=; b=H49IXvGzg3NphaEQMLqeZWomiE
	PQgh7EH4xnSbQarMf3hMsKuVcD1x1jokhQuSCP9RSLa63sqSMH4pSo1ctBgYDFhGpzE2n6fiVSHUC
	KrG3OM22xu/f3mPfCTCBaHX+wZ3j3inh20qLYUaVaUEE0ZN11wE8qBIuP66oBZpVTUP06HWXz9hN6
	F4pQVRezdTr0G9LsPxeI9SQyjPbDzoARO2SWtKPhmnzD5RB71XUNtKA0I2vFsnM1opZbpsuEpPeEZ
	VIi5KmoPBxp3xD2JectneBdiGOvb5Qq1ZQCS07enTl0CnxQ3y5MIEcHVD5m1+cndIPwYU0dgxYtPF
	0+UZvqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMW0-00000004uln-0SNW;
	Tue, 20 Aug 2024 10:55:04 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMOs-00000004sjg-1bKq
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Aug 2024 10:47:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a7aac70e30dso573519066b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Aug 2024 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724150860; x=1724755660; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGemp3/J4+ZRAtrBZReELh9mp4/tveOz4AeZNo7+1xw=;
        b=J3N61fDjZSfzxfeJivhZMta/yREiGItHcDvslCp1auIcDSOXM8R5hgWBsrfYohErNI
         A7SYk1M8d6x+NgUN8xi1MBTgDxiyq5+ikym1aXSh8+XPbG5mCOPVIDgIIDfH510gLDvA
         klxZsZvbeKdwtiPu1rwcKtM+DOt1+kqVfyAOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724150860; x=1724755660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGemp3/J4+ZRAtrBZReELh9mp4/tveOz4AeZNo7+1xw=;
        b=eA3OMN86FB5hwkhpOP+5K6SOVKOF12ZzHXWZ/6bfpb86Su2CfXmAaLMbEKA0jTjIaU
         eoUIY739Gy1iMNC4pbxMHcfIuOrsaleLfhW0eMQivdAWR40E/huv/ByMEv7JbqreiQb5
         UjepV5T6XHBa9b8M/j8/GvwrI89dgT+1020aoqqcrc2mEyxf+BGLAyNZNsP+k0MzoNYy
         lPXoNL+FuRGZUpq3skdpRWZRGAA51sLYHx10b/IbFtVpguIlAIh7nvTJ/sPxypPmlYqt
         KjlyujWZDDrywFMgcsmOjWe03zyXE0Uf/w9CRH210ffA1xAljcA8EPiHpq/oRWgxaFK8
         SjUg==
X-Forwarded-Encrypted: i=1; AJvYcCXZFfYphHKYreB/hACv/dZkqRCyCvydLRecLgxGVeliUQGkgrNCIjE4u4+jQB7/7kCpnaZ8ozoBDcxXT2oAt1h5BGfB2GZr3Is9QgAnMA3ESKGw
X-Gm-Message-State: AOJu0YwW04urIbRzi/NlkUuamsth9ws+Rdae3sHhrrCXy1A/CM41276H
	0FAa3vcs4l5fSyNlpQtPbLXHyAlracM24ob8B4owTPNct9doHP14zi7tXyEXn1He2lwNhAZd86q
	dFA==
X-Google-Smtp-Source: AGHT+IHTlHb7aEFQux9vGcun+WmaeLkPQejMOq5KzH/WVmv5qhoufPKzVU85O9fhFxe3ZbWH6i1J8w==
X-Received: by 2002:a17:906:cae0:b0:a7d:c9c6:a692 with SMTP id a640c23a62f3a-a83929f1282mr1056049466b.51.1724150859877;
        Tue, 20 Aug 2024 03:47:39 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396d375sm743970766b.221.2024.08.20.03.47.39
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 03:47:39 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42808071810so42877895e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Aug 2024 03:47:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnP4AXrs/BmCToYGJ7hY1TA5vUeRT9HaTloecRWYxDqP6l6+rbt0ihDKfzjJOOKRi67DtNI3YXOzGQ2nyjaezCheRWntJB8ugylfFWLB7amhCD
X-Received: by 2002:a17:907:e249:b0:a7a:ab8a:38a with SMTP id
 a640c23a62f3a-a839292ffbdmr1077908166b.27.1724150480979; Tue, 20 Aug 2024
 03:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240809-auxadc_thermal-v11-1-af36cc74f3a3@chromium.org> <66f3361b-00f8-4527-aaa8-d1c302c8ea26@linaro.org>
In-Reply-To: <66f3361b-00f8-4527-aaa8-d1c302c8ea26@linaro.org>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 20 Aug 2024 18:40:44 +0800
X-Gmail-Original-Message-ID: <CAHc4DNLsNUE+dk3+Xz97MO9gnyK5ZwUdXxEQiKz0vEzgWe4mQQ@mail.gmail.com>
Message-ID: <CAHc4DNLsNUE+dk3+Xz97MO9gnyK5ZwUdXxEQiKz0vEzgWe4mQQ@mail.gmail.com>
Subject: Re: [PATCH v11] thermal/drivers/mediatek: add another get_temp ops
 for thermal sensors
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, James Lo <james.lo@mediatek.com>, 
	Michael Kao <michael.kao@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Ben Tseng <ben.tseng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_034742_460495_51711BA8 
X-CRM114-Status: GOOD (  51.34  )
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

On Mon, Aug 19, 2024 at 6:33=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 09/08/2024 10:44, Hsin-Te Yuan wrote:
> > From: James Lo <james.lo@mediatek.com>
> >
> > Provide thermal zone to read thermal sensor
> > in the SoC. We can read all the thermal sensors
> > value in the SoC by the node /sys/class/thermal/
>
> Please elaborate a bit more the description to stick to the changes.
>
> What is the difference between MT8183 Kukui devices and older ones, for
> instance ?
>
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> > Signed-off-by: James Lo <james.lo@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> > ---
> > Resurrecting this patch specifically for MediaTek MT8183 Kukui devices.
> >
> > Changes in V11:
> >      - Rebase on kernel v6.11-rc2
> >      - Use mtk_thermal_temp_is_valid in mtk_read_sensor_temp just like
> >        mtk_thermal_bank_temperature
> >      - Change the error handling of devm_thermal_of_zone_register retur=
n
> >        value
> >      - link to V10: https://lore.kernel.org/lkml/20220519101044.16765-1=
-james.lo@mediatek.com/
> >
> > Changes in V10:
> >      - Rebase to kernel-v5.18-rc7
> >      - Resend
> >
> > Changes in V9:
> >      - Rebase to kernel-v5.14-rc1
> >      - Bind raw_to_mcelsius_v1 or raw_to_mcelsius_v2 to compatible
> >        data of struct mtk_thermal_data
> >      - Remove duplicate struct 'mtk_thermal_bank'
> >      - Remove unnecessary if condition check
> >      - Return error if any thermal zone fail to register
> >
> > Changes in V8:
> >      - Rebase to kernel-v5.13-rc1
> >      - Resend
> >
> > Changes in v7:
> >      - Fix build error in v6.
> >
> > Changes in v6:
> >      - Rebase to kernel-5.11-rc1.
> >      - [1/3]
> >          - add interrupts property.
> >      - [2/3]
> >          - add the Tested-by in the commit message.
> >      - [3/3]
> >          - use the mt->conf->msr[id] instead of conf->msr[id] in the
> >            _get_sensor_temp and mtk_thermal_bank_temperature.
> >          - remove the redundant space in _get_sensor_temp and
> >            mtk_read_sensor_temp.
> >          - change kmalloc to dev_kmalloc in mtk_thermal_probe.
> >
> > Changes in v5:
> >      - Rebase to kernel-5.9-rc1.
> >      - Revise the title of cover letter.
> >      - Drop "[v4,7/7] thermal: mediatek: use spinlock to protect PTPCOR=
ESEL"
> >      - [2/2]
> >          -  Add the judgement to the version of raw_to_mcelsius.
> >
> > Changes in v4:
> >      - Rebase to kernel-5.6-rc1.
> >      - [1/7]
> >          - Squash thermal zone settings in the dtsi from [v3,5/8]
> >            arm64: dts: mt8183: Increase polling frequency for CPU therm=
al zone.
> >          - Remove the property of interrupts and mediatek,hw-reset-temp=
.
> >      - [2/7]
> >          - Correct commit message.
> >      - [4/7]
> >          - Change the target temperature to the 80C and change the comm=
it message.
> >      - [6/7]
> >          - Adjust newline alignment.
> >          - Fix the judgement on the return value of registering thermal=
 zone.
> >
> > Changes in v3:
> >      - Rebase to kernel-5.5-rc1.
> >      - [1/8]
> >          - Update sustainable power of cpu, tzts1~5 and tztsABB.
> >      - [7/8]
> >          - Bypass the failure that non cpu_thermal sensor is not find i=
n thermal-zones
> >            in dts, which is normal for mt8173, so prompt a warning here=
 instead of
> >            failing.
> >
> >      Return -EAGAIN instead of -EACCESS on the first read of sensor tha=
t
> >          often are bogus values. This can avoid following warning on bo=
ot:
> >
> >            thermal thermal_zone6: failed to read out thermal zone (-13)
> >
> > Changes in v2:
> >      - [1/8]
> >          - Add the sustainable-power,trips,cooling-maps to the tzts1~tz=
tsABB.
> >      - [4/8]
> >          - Add the min opp of cpu throttle.
> > ---
> >
> > ---
> >   drivers/thermal/mediatek/auxadc_thermal.c | 71 ++++++++++++++++++++++=
+++++----
> >   1 file changed, 63 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/therma=
l/mediatek/auxadc_thermal.c
> > index 9ee2e7283435..8b50d560bbf9 100644
> > --- a/drivers/thermal/mediatek/auxadc_thermal.c
> > +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> > @@ -847,7 +847,8 @@ static int mtk_thermal_bank_temperature(struct mtk_=
thermal_bank *bank)
> >
> >   static int mtk_read_temp(struct thermal_zone_device *tz, int *tempera=
ture)
> >   {
> > -     struct mtk_thermal *mt =3D thermal_zone_device_priv(tz);
> > +     struct mtk_thermal_bank *bank =3D thermal_zone_device_priv(tz);
> > +     struct mtk_thermal *mt =3D bank->mt;
>
> Where is used this variable ?
>
This is used by the for loop in this function.
> >       int i;
> >       int tempmax =3D INT_MIN;
> >
> > @@ -866,10 +867,46 @@ static int mtk_read_temp(struct thermal_zone_devi=
ce *tz, int *temperature)
> >       return 0;
> >   }
> >
> > +static int mtk_read_sensor_temp(struct thermal_zone_device *tz, int *t=
emperature)
> > +{
> > +     struct mtk_thermal_bank *bank =3D thermal_zone_device_priv(tz);
> > +     struct mtk_thermal *mt =3D bank->mt;
> > +     const struct mtk_thermal_data *conf =3D mt->conf;
> > +     int id =3D bank->id - 1;
> > +     int temp =3D INT_MIN;
> > +     u32 raw;
> > +
> > +     if (id < 0)
> > +             return  -EACCES;
>
> This test should not be done here:
>
> 1. EACCES is permission denied
>
> 2. The bank id should be checked at init time
>
> > +
> > +     raw =3D readl(mt->thermal_base + conf->msr[id]);
> > +
> > +     temp =3D mt->raw_to_mcelsius(mt, id, raw);
> > +
> > +     /*
> > +      * The first read of a sensor often contains very high bogus
> > +      * temperature value. Filter these out so that the system does
> > +      * not immediately shut down.
> > +      */
> > +
> > +     if (!mtk_thermal_temp_is_valid(temp)) {
>
> unlikely(!mtk_thermal_temp_is_valid(temp)) ?
>
> > +             temp =3D THERMAL_TEMP_INVALID;
>
> What is the point of assigning this value and return just after ?
>
I'll remove this line.
> > +             return -EAGAIN;
> > +     }
> > +
> > +     *temperature =3D temp;
> > +
> > +     return 0;
> > +}
> > +
> >   static const struct thermal_zone_device_ops mtk_thermal_ops =3D {
> >       .get_temp =3D mtk_read_temp,
> >   };
> >
> > +static const struct thermal_zone_device_ops mtk_thermal_sensor_ops =3D=
 {
> > +     .get_temp =3D mtk_read_sensor_temp,
> > +};
> > +
> >   static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
> >                                 u32 apmixed_phys_base, u32 auxadc_phys_=
base,
> >                                 int ctrl_id)
> > @@ -1199,6 +1236,7 @@ static int mtk_thermal_probe(struct platform_devi=
ce *pdev)
> >       u64 auxadc_phys_base, apmixed_phys_base;
> >       struct thermal_zone_device *tzdev;
> >       void __iomem *apmixed_base, *auxadc_base;
> > +     struct mtk_thermal_bank *tz;
> >
> >       mt =3D devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
> >       if (!mt)
> > @@ -1285,14 +1323,31 @@ static int mtk_thermal_probe(struct platform_de=
vice *pdev)
> >                       mtk_thermal_init_bank(mt, i, apmixed_phys_base,
> >                                             auxadc_phys_base, ctrl_id);
> >
> > -     tzdev =3D devm_thermal_of_zone_register(&pdev->dev, 0, mt,
> > -                                           &mtk_thermal_ops);
> > -     if (IS_ERR(tzdev))
> > -             return PTR_ERR(tzdev);
> > +     for (i =3D 0; i < mt->conf->num_sensors + 1; i++) {
>
> Why "num_sensors + 1" ?
>
Because we have the one with id 0 which represents the max of all the
temperature and num_sensors real sensors.
> > +             tz =3D devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
> > +             if (!tz)
> > +                     return -ENOMEM;
> > +
> > +             tz->mt =3D mt;
> > +             tz->id =3D i;
> > +
> > +             tzdev =3D devm_thermal_of_zone_register(&pdev->dev, i,
> > +                             tz, (i =3D=3D 0) ?
> > +                             &mtk_thermal_ops : &mtk_thermal_sensor_op=
s);
>
> Don't you want to keep the init routine and depending on the platform
> add the loop with the extra sensors ? That may help to make the code
> cleaner instead of doing tests like (i =3D=3D 0) ? &mtk_thermal_ops :
> &mtk_thermal_sensor_ops
>
How about moving the registration with i =3D 0 out of this loop.
Although some platforms don't use those extra sensors, they can read
the temperature from these extra sensors by simply adding thermal
zones in devicetree.
> > +             if (IS_ERR(tzdev)) {
> > +                     if (PTR_ERR(tzdev) =3D=3D -ENODEV) {
> > +                             dev_warn(&pdev->dev, "can't find thermal =
sensor %d\n", i);
> > +                             continue;
> > +                     }
> > +                     if (PTR_ERR(tzdev) !=3D -EACCES)
>
> The id correctness should be checked in this loop, not rely on a EACCES
> returned by a implicit call to thermal_zone_get_temp()
>
Since we use the for loop here, checking the id correctness looks
meaningless. I'll change to return error directly and remove the id
correctness checking from mtk_read_sensor_temp.
> > +                             return PTR_ERR(tzdev);
> > +             }
> >
> > -     ret =3D devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
> > -     if (ret)
> > -             dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
> > +             ret =3D devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
> > +             if (ret)
> > +                     dev_warn(&pdev->dev, "error in thermal_add_hwmon_=
sysfs: %d\n", ret);
> > +     }
> >
> >       return 0;
> >   }
> >
> > ---
> > base-commit: ee9a43b7cfe2d8a3520335fea7d8ce71b8cabd9d
> > change-id: 20240809-auxadc_thermal-9be338ec8b1c
> >
> > Best regards,
>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

