Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB8DC77B60
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 03:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwOES1uov/pxVLowAE7Sgh3FPfyIsRDoqEMp2uagMQI=; b=xYmLF8U1r5EmjZEE36/u5s/1jk
	79R04yrmQe3mMYrriukDL0HEn0EhUiOvHLphYRpgRCxPjtEtg0r894Ba7qbSIpWSTP45faPbl9hwe
	LzxzOm5d+jL7NsWbi0UEsnsS0kTyfJvzxhk0bT12BVOXYsmagB2jTfrUeqb6n2nwvP1qK43Ytewtw
	h1qtsCbZDIqGLEfyAImuHWN1avOqNnSqekwiyOPgOF8RI+4fw4L09QrzWhDF4HYwOwQPPaMewchp2
	FBdPwaoXZ3XdfHkw+XXXyp/a+BVnYSgLILMoiPTlgCtsU/xvqW4vX+MwGOn7n+n7DDycVVGY8WSzU
	iLCEQMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgzle-00CzI1-2W;
	Tue, 28 Mar 2023 03:13:02 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgzlZ-00CzF6-2T
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 03:12:59 +0000
Received: by mail-ua1-x92c.google.com with SMTP id q8so200717uas.7
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 20:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679973174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwOES1uov/pxVLowAE7Sgh3FPfyIsRDoqEMp2uagMQI=;
        b=NgLG8Q5l9naxBa4Jf7nYrLS8DevbrfmEMMiDB6xIjXmdvmxfcmHG1fu7YA6jdXBu5a
         I/PLOK860EliMqfH52D0rDFLicN/3jKe4r31PEmIx2OdxRR+0T9OZ962PmLqA7e0KKje
         CDwaaqQm9fEDg1oG6tSD/I8GzJu/l5G/I1sNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679973174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwOES1uov/pxVLowAE7Sgh3FPfyIsRDoqEMp2uagMQI=;
        b=K1BgD8Xc17ae+3gohRR4IvgJN/HdIOZdrjksvXu8Bky4YXt8+Bf4QWhv6KSXAasPyE
         Yjaj9DTog8sel0qrS6xdOcqH6P4Js99rGffOoqJRYlUGZuXh2bZvEm0X5HzKA/+flnCo
         CJV4PyxSTVmcVHXpQbLpVVB2KwBAZa4+m8cupEeZM459AmsTPYBYIvEVaeoqDidvjEpC
         JMl6cPQB5y62w6QYvwsRqAc3XO/jkcJW+uYgsNxLmJ47mXGLOr7K9eCBBzxu8IWdvv0+
         to57BKZP6f6GiiH6BTQ+xZKmZCgHwR8kT7N7b+ZVNMaWPc4oO90/cuga19kEsFU+Flpg
         FB3Q==
X-Gm-Message-State: AAQBX9fgI2Tb8Zv6DWkptS2mUl+XHJxWPLvxdrLpLWNPFE7pM/S5soen
	W9qcTFwk4vW0w9ZWsdyqlEigGyYPclzN5l1dj1NQCw==
X-Google-Smtp-Source: AKy350bTe0q20Y1kFa3RqGcrtmmaMcfvywJnI4v6r/ZKEb+aF8/ujyJQ/dovvRsfrWL510XzD2Ai4MZ3KVikA5Tw/BY=
X-Received: by 2002:a05:6130:3a9:b0:68d:6360:77b with SMTP id
 az41-20020a05613003a900b0068d6360077bmr10737949uab.1.1679973174489; Mon, 27
 Mar 2023 20:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230307163413.143334-1-bchihi@baylibre.com> <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
 <CAGuA+ooi7Kx05gagLzXAN3upDiSqDUNOM_djYdGftw6ogVx5gw@mail.gmail.com>
 <CAGuA+oqDPPYFJef_8=YrOpHQNVJ3xgm_zXS6fq_HG2Jy_6t-Zg@mail.gmail.com>
 <CAGXv+5EZPWohGN5CaEiqVrM4MyAar3cPEUhHtGY_9wTJSJNVFQ@mail.gmail.com> <CAGuA+oqF4jFMyEo09VDmCf-_7g0ua3XDKDAJ+t3Gat14pDM9NA@mail.gmail.com>
In-Reply-To: <CAGuA+oqF4jFMyEo09VDmCf-_7g0ua3XDKDAJ+t3Gat14pDM9NA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 28 Mar 2023 11:12:43 +0800
Message-ID: <CAGXv+5GGO76H9Z-X=3nhtmSyp7uhuUF4DE0T527M5z+SBX482Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS support for mt8192
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_201257_801824_23FF654B 
X-CRM114-Status: GOOD (  31.57  )
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

On Tue, Mar 28, 2023 at 8:21=E2=80=AFAM Balsam CHIHI <bchihi@baylibre.com> =
wrote:
>
> On Sat, Mar 25, 2023 at 5:33=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Wed, Mar 22, 2023 at 8:48=E2=80=AFPM Balsam CHIHI <bchihi@baylibre.c=
om> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > I suspect the bug comes from incorrect calibration data offsets for A=
P
> > > Domain because you confirm that MCU Domain probe runs without issues.
> > > Is it possible to test something for us to confirm this theory (i
> > > don't have an mt8192 board on hand now), when you have the time of
> > > course?
> > > We would like to test AP Domain's calibration data offsets with a
> > > working one, for example :
> > >
> > >  static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] =3D {
> > >                 {
> > > -               .cal_offset =3D { 0x25, 0x28 },
> > > +               .cal_offset =3D { 0x04, 0x04 },
> > >                 .lvts_sensor =3D {
> > >                         { .dt_id =3D MT8192_AP_VPU0 },
> > >                         { .dt_id =3D MT8192_AP_VPU1 }
> > > @@ -1336,7 +1336,7 @@ static const struct lvts_ctrl_data
> > > mt8192_lvts_ap_data_ctrl[] =3D {
> > >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> > >         },
> > >         {
> > > -               .cal_offset =3D { 0x2e, 0x31 },
> > > +               .cal_offset =3D { 0x04, 0x04 },
> > >                 .lvts_sensor =3D {
> > >                         { .dt_id =3D MT8192_AP_GPU0 },
> > >                         { .dt_id =3D MT8192_AP_GPU1 }
> > > @@ -1346,7 +1346,7 @@ static const struct lvts_ctrl_data
> > > mt8192_lvts_ap_data_ctrl[] =3D {
> > >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> > >         },
> > >         {
> > > -               .cal_offset =3D { 0x37, 0x3a },
> > > +               .cal_offset =3D { 0x04, 0x04 },
> > >                 .lvts_sensor =3D {
> > >                         { .dt_id =3D MT8192_AP_INFRA },
> > >                         { .dt_id =3D MT8192_AP_CAM },
> > > @@ -1356,7 +1356,7 @@ static const struct lvts_ctrl_data
> > > mt8192_lvts_ap_data_ctrl[] =3D {
> > >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> > >         },
> > >         {
> > > -               .cal_offset =3D { 0x40, 0x43, 0x46 },
> > > +               .cal_offset =3D { 0x04, 0x04, 0x04 },
> > >                 .lvts_sensor =3D {
> > >                         { .dt_id =3D MT8192_AP_MD0 },
> > >                         { .dt_id =3D MT8192_AP_MD1 },
> > >
> > > This example is tested and works for mt8195,
> > > (all sensors use the same calibration data offset for testing purpose=
s).
> > >
> > > Thank you in advance for your help.
> >
> > The MCU ones are still tripping though. If I change all of them to 0x04=
,
> > then nothing trips. There's also a bug in the interrupt handling code
> > that needs to be dealt with.
> >
> > AFAICT the calibration data is stored differently. If you look at Chrom=
eOS's
> > downstream v5.10 driver, you'll see mt6873_efuse_to_cal_data() for MT81=
92,
> > and mt8195_efuse_to_cal_data() for MT8195. The difference sums up to:
> > MT8195 has all data sequentially stored, while MT8192 has most data sto=
red
> > in lower 24 bits of each 32-bit word, and the highest 8 bits are then u=
sed
> > to pack data for the remaining sensors.
> >
> > Regards
> > ChenYu
>
> Hi Chen-Yu Tsai,
>
> Thank you very much for helping me testing this suggestion.
>
> Indeed, calibration data is stored differently in the mt8192 compared to =
mt8195.
> So, the mt8192's support will be delayed for now, to allow further debugg=
ing.
>
> In the mean time, we will only continue to upstream the remaining
> mt8195's source code, so it will get full LVTS support.
> A new series will be submitted soon.
>
> Would you please point me out to the bug in interrupt handling code?

I just sent out two patches and CC-ed you on them. They are here just in ca=
se:

https://lore.kernel.org/linux-pm/20230328031037.1361048-1-wenst@chromium.or=
g/
https://lore.kernel.org/linux-pm/20230328031017.1360976-1-wenst@chromium.or=
g/

ChenYu

