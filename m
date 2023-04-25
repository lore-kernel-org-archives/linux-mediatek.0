Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8767DC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 11:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1nwF4kKWtunxpN6x1cZvs+8NAr3cIrq1nqIj78OXC0=; b=AhSF1m4RFsE41ny6fwT2uv3tfb
	pqefCf50UxK/BVokndW5tllFkXUnts2f2GiVxv5EN7EOxKO43FQ3q4mydZMMrLDFCrz6D8C+Gg1i4
	YJYuHTbt44fShvjZfbr+SZ0ulHKTQjjpGpEjTsFtGdDUdOAsp6JoHWCZ5Ph+rAIYq0rsDMHWfoDDs
	lpqf1Ctvl+i3lYVqjDdO0SXE7tUuYsnimR4eLVuKO/hdhZisoVRzc+33HNdYOz2gwb0SR940tlgqm
	2cerUv5EwigoVGHKS7ov5RKWRAIyQI3ynIenjm0z69nyCqKTWwGNJk+Td5ns3rglbyJFAVFr57nOK
	2GmlJT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prGrM-000xOd-3B;
	Tue, 25 Apr 2023 11:29:24 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prGrJ-000xMI-0e
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 11:29:23 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50506111a6eso10371331a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682422155; x=1685014155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1nwF4kKWtunxpN6x1cZvs+8NAr3cIrq1nqIj78OXC0=;
        b=yps9efPE56h8YypYTfVXepsLT5PtBXWsHXI0YhVzeF2MkvHPBvi7NyD+QNASitywE1
         MaSBTlfunCSskCcTj0eCHpTHUuECPyGENqvYpaH+8ZA571U60fHoN2KvRua4sVG4ymGX
         4JsCsGf+3WkX5BW2Cw1lF0mIYE/Um8EEyKmHRcQt/DISj90XagxTSU5uer12QtJk1FxC
         FuAr0EdccL3o25jR8jpqa3o+m06ON1kvzvrGJ28N1fsYqwvrFi870nFw7ty87bu2Lhv1
         I+yjAnitXDUd3hwKlPGm4KQQnyhomSmnrNzxPm2ia0qf46SB5Ly+l+2L/Jr/lVBvN+DG
         jjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682422155; x=1685014155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1nwF4kKWtunxpN6x1cZvs+8NAr3cIrq1nqIj78OXC0=;
        b=a5Sr9YQMwMAd5PuKtJOzSWGwtpQljtZa2p1zzkH1fmuxWc6vM9uL8ZcbtJi7oIk2pF
         uNnTXmpU5lpFDAlWGubRcpThC3iFSylqYrwM9mqkWecKt/C9PxWz+WL2jIGX5y+n1Exn
         Z1oop8Vdvl2FEXefkd74YDi5Eds8sieGgufuSDzqI6m8DuByFUOaiFOpvV7URwNFcsf4
         /HieaWTcckzvPI+HJW4Zz1c6B4FFblYnKBr0YOG7oGcSx5nX3UPNiTOg3N8Zx05lVT1P
         j4ZKVNBfiwzvPva0Li6nEu4+kUFZDG9yF4UkpQEuYqKZSBLTVycQRAVohuxCl4tGthaQ
         0Hvg==
X-Gm-Message-State: AAQBX9eS+/RySDkfsl8QoMm4cl6ahEKERYK5dfPMVFYhCiZQgLvymuoG
	mo4FIIq5+JpMIv3Psil6g8Bnj7g4QDqka7vZEKsLuA==
X-Google-Smtp-Source: AKy350YQSqh9s/SmBnFSrcBrZBRbDOugQ/O+hRGsZSA3JCuB/nNzhr1I9QOBFc8GeJdRI6uxOxpvQT1eYhskMHB2GYc=
X-Received: by 2002:aa7:d491:0:b0:506:a663:5c1b with SMTP id
 b17-20020aa7d491000000b00506a6635c1bmr12120401edr.18.1682422155536; Tue, 25
 Apr 2023 04:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230307163413.143334-1-bchihi@baylibre.com> <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
 <CAGuA+ooi7Kx05gagLzXAN3upDiSqDUNOM_djYdGftw6ogVx5gw@mail.gmail.com>
 <CAGuA+oqDPPYFJef_8=YrOpHQNVJ3xgm_zXS6fq_HG2Jy_6t-Zg@mail.gmail.com>
 <CAGXv+5EZPWohGN5CaEiqVrM4MyAar3cPEUhHtGY_9wTJSJNVFQ@mail.gmail.com>
 <CAGuA+oqF4jFMyEo09VDmCf-_7g0ua3XDKDAJ+t3Gat14pDM9NA@mail.gmail.com>
 <fab67eef-4dc9-420d-b127-aedc6f54cad0@notapiano> <CAGXv+5E0rzByZBn91d60MQ7P0=GbAQUH=PK9EYDu3Upr33td6A@mail.gmail.com>
In-Reply-To: <CAGXv+5E0rzByZBn91d60MQ7P0=GbAQUH=PK9EYDu3Upr33td6A@mail.gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Tue, 25 Apr 2023 13:28:39 +0200
Message-ID: <CAGuA+oo0w8n9zEKdd1UfYx+F08wK4CcUGqRbBi4C-xNYp+vtDA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS support for mt8192
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
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
X-CRM114-CacheID: sfid-20230425_042921_237243_9BC5F360 
X-CRM114-Status: GOOD (  48.33  )
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

On Tue, Apr 25, 2023 at 12:00=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, Apr 25, 2023 at 6:21=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > On Tue, Mar 28, 2023 at 02:20:24AM +0200, Balsam CHIHI wrote:
> > > On Sat, Mar 25, 2023 at 5:33=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> > > >
> > > > On Wed, Mar 22, 2023 at 8:48=E2=80=AFPM Balsam CHIHI <bchihi@baylib=
re.com> wrote:
> > > > >
> > > > > Hi Chen-Yu,
> > > > >
> > > > > I suspect the bug comes from incorrect calibration data offsets f=
or AP
> > > > > Domain because you confirm that MCU Domain probe runs without iss=
ues.
> > > > > Is it possible to test something for us to confirm this theory (i
> > > > > don't have an mt8192 board on hand now), when you have the time o=
f
> > > > > course?
> > > > > We would like to test AP Domain's calibration data offsets with a
> > > > > working one, for example :
> > > > >
> > > > >  static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] =
=3D {
> > > > >                 {
> > > > > -               .cal_offset =3D { 0x25, 0x28 },
> > > > > +               .cal_offset =3D { 0x04, 0x04 },
> > > > >                 .lvts_sensor =3D {
> > > > >                         { .dt_id =3D MT8192_AP_VPU0 },
> > > > >                         { .dt_id =3D MT8192_AP_VPU1 }
> > > > > @@ -1336,7 +1336,7 @@ static const struct lvts_ctrl_data
> > [..]
> > > > >
> > > > > This example is tested and works for mt8195,
> > > > > (all sensors use the same calibration data offset for testing pur=
poses).
> > > > >
> > > > > Thank you in advance for your help.
> > > >
> > > > The MCU ones are still tripping though. If I change all of them to =
0x04,
> > > > then nothing trips. There's also a bug in the interrupt handling co=
de
> > > > that needs to be dealt with.
> > > >
> > > > AFAICT the calibration data is stored differently. If you look at C=
hromeOS's
> > > > downstream v5.10 driver, you'll see mt6873_efuse_to_cal_data() for =
MT8192,
> > > > and mt8195_efuse_to_cal_data() for MT8195. The difference sums up t=
o:
> > > > MT8195 has all data sequentially stored, while MT8192 has most data=
 stored
> > > > in lower 24 bits of each 32-bit word, and the highest 8 bits are th=
en used
> > > > to pack data for the remaining sensors.
> > > >
> > > > Regards
> > > > ChenYu
> > >
> > > Hi Chen-Yu Tsai,
> > >
> > > Thank you very much for helping me testing this suggestion.
> > >
> > > Indeed, calibration data is stored differently in the mt8192 compared=
 to mt8195.
> > > So, the mt8192's support will be delayed for now, to allow further de=
bugging.
> > >
> > > In the mean time, we will only continue to upstream the remaining
> > > mt8195's source code, so it will get full LVTS support.
> > > A new series will be submitted soon.
> >
> > Hi Balsam,
> >
> > like Chen-Yu mentioned, the calibration data is stored with 4 byte alig=
nment for
> > MT8192, but the data that is split between non-contiguous bytes is for =
the
> > thermal controllers (called Resistor-Capacitor Calibration downstream) =
not the
> > sensors. The controller calibration isn't currently handled in this dri=
ver (and
> > downstream it also isn't used, since a current value is read from the c=
ontroller
> > instead), so we can just ignore those.
> >
> > The patch below adjusts the addresseses for the sensors and gives me re=
asonable
> > reads, so the machine no longer reboots. Can you integrate it into your=
 series?
>
> Not sure what I got wrong, but on my machine the VPU0 and VPU1 zone inter=
rupts
> are still tripping excessively. The readings seem normal though. Specific=
ally,
> it's bits 16 and 17 that are tripping.
>

Hi Chen-Yu,

Thank you for testing!

As the readings are normal that proves that calibration data offsets
are correct.
would you like that I send the v2 of series to add mt8192 support?
Then we could deal with the interrupts later in a separate fix,
because the interrupt code in common for both SoC (mt8192 and mt8195)?

Does N=C3=ADcolas also have tripping interrupts?
On my side, I've got no interrupts tripping on mt8195.

Any other suggestions (a question for everyone)?

Best regards,
Balsam

> > Thanks,
> > N=C3=ADcolas
> >
> > From 4506f03b806f3eeb89887bac2c1c86d61da97281 Mon Sep 17 00:00:00 2001
> > From: =3D?UTF-8?q?N=3DC3=3DADcolas=3D20F=3D2E=3D20R=3D2E=3D20A=3D2E=3D2=
0Prado?=3D
> >  <nfraprado@collabora.com>
> > Date: Mon, 24 Apr 2023 17:42:42 -0400
> > Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Fix calibration
> >  offsets for MT8192
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
> >
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >  drivers/thermal/mediatek/lvts_thermal.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/=
mediatek/lvts_thermal.c
> > index b6956c89d557..f8afbc2ac190 100644
> > --- a/drivers/thermal/mediatek/lvts_thermal.c
> > +++ b/drivers/thermal/mediatek/lvts_thermal.c
> > @@ -1261,7 +1261,7 @@ static const struct lvts_ctrl_data mt8195_lvts_ap=
_data_ctrl[] =3D {
> >
> >  static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] =3D {
> >         {
> > -               .cal_offset =3D { 0x04, 0x07 },
> > +               .cal_offset =3D { 0x04, 0x08 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_MCU_BIG_CPU0 },
> >                         { .dt_id =3D MT8192_MCU_BIG_CPU1 }
> > @@ -1271,7 +1271,7 @@ static const struct lvts_ctrl_data mt8192_lvts_mc=
u_data_ctrl[] =3D {
> >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> >         },
> >         {
> > -               .cal_offset =3D { 0x0d, 0x10 },
> > +               .cal_offset =3D { 0x0c, 0x10 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_MCU_BIG_CPU2 },
> >                         { .dt_id =3D MT8192_MCU_BIG_CPU3 }
> > @@ -1281,7 +1281,7 @@ static const struct lvts_ctrl_data mt8192_lvts_mc=
u_data_ctrl[] =3D {
> >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> >         },
> >         {
> > -               .cal_offset =3D { 0x16, 0x19, 0x1c, 0x1f },
> > +               .cal_offset =3D { 0x14, 0x18, 0x1c, 0x20 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_MCU_LITTLE_CPU0 },
> >                         { .dt_id =3D MT8192_MCU_LITTLE_CPU1 },
> > @@ -1296,7 +1296,7 @@ static const struct lvts_ctrl_data mt8192_lvts_mc=
u_data_ctrl[] =3D {
> >
> >  static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] =3D {
> >                 {
> > -               .cal_offset =3D { 0x25, 0x28 },
> > +               .cal_offset =3D { 0x24, 0x28 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_AP_VPU0 },
> >                         { .dt_id =3D MT8192_AP_VPU1 }
> > @@ -1306,7 +1306,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap=
_data_ctrl[] =3D {
> >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> >         },
> >         {
> > -               .cal_offset =3D { 0x2e, 0x31 },
> > +               .cal_offset =3D { 0x2c, 0x30 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_AP_GPU0 },
> >                         { .dt_id =3D MT8192_AP_GPU1 }
> > @@ -1316,7 +1316,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap=
_data_ctrl[] =3D {
> >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> >         },
> >         {
> > -               .cal_offset =3D { 0x37, 0x3a },
> > +               .cal_offset =3D { 0x34, 0x38 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_AP_INFRA },
> >                         { .dt_id =3D MT8192_AP_CAM },
> > @@ -1326,7 +1326,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap=
_data_ctrl[] =3D {
> >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> >         },
> >         {
> > -               .cal_offset =3D { 0x40, 0x43, 0x46 },
> > +               .cal_offset =3D { 0x3c, 0x40, 0x44 },
> >                 .lvts_sensor =3D {
> >                         { .dt_id =3D MT8192_AP_MD0 },
> >                         { .dt_id =3D MT8192_AP_MD1 },
> > --
> > 2.40.0

