Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EE9C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgTEvOUqu+byIlNns2PeM/+eklWaDNG6sL3F+Izsnuo=; b=ECOPVHLmmhX66DR2jhh+NhdH3N
	Umv3PNydWwM92V74ZD/aR4jbbwJIPpBQt2qhqvpGfG0kq1N+3dho1ottKOw27t0YSO42rxW7DpnbN
	jUJpmhq5FGmAwtrXJpSkKwAYA4/oYDTYvn10XbMV6s6xjEVhLvXK3AzDiHm+QOK0EW9lRmfXxbufw
	JadSMJ99EX1H03qbytg3kL7r7tu70gKpoCFraMVhytSvhHB0hrMJXUABk9scCYavNyxOlA0RfxQnv
	13bUcpooPJaoV1W1jz1NVpvTfgUBgoPUHd3ZM5BfziNnRgKc1+Y/40mda0r29Gv9VIB07NRUB4W2g
	E2pQInNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQp6-00H1Rr-0q;
	Wed, 29 Mar 2023 08:06:24 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQp2-00H1QI-0k
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:06:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id eg48so59731530edb.13
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680077178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgTEvOUqu+byIlNns2PeM/+eklWaDNG6sL3F+Izsnuo=;
        b=78B+nejVnS9usHWPg0iqljIaK4pxCQzU1+8yHfJq6bvLatsVHbSasFqcUXDAi1w5ty
         ru6zbvClprRaH6/+61fnfwiWn6Lnt4yCrkUjxEfT9d2AanAzELr4mM8xWdV5scUE0ucB
         ELWD4r4l6HdyvxOsGNVTOK1rE2t8JO/6sZJR7NvuODLSotPDvmafMutvEUGT7OSU9L3S
         nayxjkorDtR+YqpRJ9A31V4yJvw82utxCeqHx5lFS+EMO8sDLIlo9DinRejrMiNbXD9S
         i4Vaheq/9S0knMn8t8VT3MRxm+2Vp1+ViLuycFVSBFcHnBJa6IJNLol+bZGWy4KJ+5Ym
         rx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680077178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgTEvOUqu+byIlNns2PeM/+eklWaDNG6sL3F+Izsnuo=;
        b=E5zCO4yhuMixRlKmn6BcnAe1Uo9J5/8Db/iyZifQtcxA/vpL5JyusHyWl8vsy44R87
         okCWuutdXHWi0YKOAYVuzFkd1pz5yji4+cacoRO1/S3xdYTFoxID042MrVH4zKnMDtSB
         iG0SwmtrM2EMboKDyQIc8CgLI2oj1VWZM7rcEXxBCioK+0veDjDr1fcqXL4Gr7eLPQyW
         TMidwuaGbpEf/YVVh8rxEGd+RtHxtaEX6/RNKJXpPRH4nbqaKGCOlNcSofn4M0qBkXca
         jre8EFVBAL/xlR+GFVMp9w0b+TdHQBshGCIpSHoew3jlxsYgOUckvX8LaDJzT4PDlms/
         xhMw==
X-Gm-Message-State: AAQBX9eTUw4z+1rlfvVGwmwm8H8CYrGWoLQnGjrX9xVdg75cwyEmSlt/
	VY8s7BCx6B4Xij0D2wGB3+Z23K57gWh6DYosibPMRw==
X-Google-Smtp-Source: AKy350YCm9Z8/PIeUFOKRay3tHd8uEY3gEm45xBRMugyFV6UFUnNJW6cauEggJeb48L7uR904b/TwctWGwwl+7M3Ehs=
X-Received: by 2002:a17:907:d687:b0:93d:a14f:c9b4 with SMTP id
 wf7-20020a170907d68700b0093da14fc9b4mr9282057ejc.2.1680077178000; Wed, 29 Mar
 2023 01:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230307163413.143334-1-bchihi@baylibre.com> <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
 <CAGuA+ooi7Kx05gagLzXAN3upDiSqDUNOM_djYdGftw6ogVx5gw@mail.gmail.com>
 <CAGuA+oqDPPYFJef_8=YrOpHQNVJ3xgm_zXS6fq_HG2Jy_6t-Zg@mail.gmail.com>
 <CAGXv+5EZPWohGN5CaEiqVrM4MyAar3cPEUhHtGY_9wTJSJNVFQ@mail.gmail.com>
 <CAGuA+oqF4jFMyEo09VDmCf-_7g0ua3XDKDAJ+t3Gat14pDM9NA@mail.gmail.com> <CAGXv+5GGO76H9Z-X=3nhtmSyp7uhuUF4DE0T527M5z+SBX482Q@mail.gmail.com>
In-Reply-To: <CAGXv+5GGO76H9Z-X=3nhtmSyp7uhuUF4DE0T527M5z+SBX482Q@mail.gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 29 Mar 2023 10:05:41 +0200
Message-ID: <CAGuA+or4CvyZVNuMu9tOvpoZ5nJimbp7=KX-85FiF4ghaownAg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS support for mt8192
To: Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20230329_010620_459901_D7A11BB9 
X-CRM114-Status: GOOD (  33.45  )
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

Hi Chen-Yu,

On Tue, Mar 28, 2023 at 5:12=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Tue, Mar 28, 2023 at 8:21=E2=80=AFAM Balsam CHIHI <bchihi@baylibre.com=
> wrote:
> >
> > On Sat, Mar 25, 2023 at 5:33=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > On Wed, Mar 22, 2023 at 8:48=E2=80=AFPM Balsam CHIHI <bchihi@baylibre=
.com> wrote:
> > > >
> > > > Hi Chen-Yu,
> > > >
> > > > I suspect the bug comes from incorrect calibration data offsets for=
 AP
> > > > Domain because you confirm that MCU Domain probe runs without issue=
s.
> > > > Is it possible to test something for us to confirm this theory (i
> > > > don't have an mt8192 board on hand now), when you have the time of
> > > > course?
> > > > We would like to test AP Domain's calibration data offsets with a
> > > > working one, for example :
> > > >
> > > >  static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] =3D =
{
> > > >                 {
> > > > -               .cal_offset =3D { 0x25, 0x28 },
> > > > +               .cal_offset =3D { 0x04, 0x04 },
> > > >                 .lvts_sensor =3D {
> > > >                         { .dt_id =3D MT8192_AP_VPU0 },
> > > >                         { .dt_id =3D MT8192_AP_VPU1 }
> > > > @@ -1336,7 +1336,7 @@ static const struct lvts_ctrl_data
> > > > mt8192_lvts_ap_data_ctrl[] =3D {
> > > >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> > > >         },
> > > >         {
> > > > -               .cal_offset =3D { 0x2e, 0x31 },
> > > > +               .cal_offset =3D { 0x04, 0x04 },
> > > >                 .lvts_sensor =3D {
> > > >                         { .dt_id =3D MT8192_AP_GPU0 },
> > > >                         { .dt_id =3D MT8192_AP_GPU1 }
> > > > @@ -1346,7 +1346,7 @@ static const struct lvts_ctrl_data
> > > > mt8192_lvts_ap_data_ctrl[] =3D {
> > > >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> > > >         },
> > > >         {
> > > > -               .cal_offset =3D { 0x37, 0x3a },
> > > > +               .cal_offset =3D { 0x04, 0x04 },
> > > >                 .lvts_sensor =3D {
> > > >                         { .dt_id =3D MT8192_AP_INFRA },
> > > >                         { .dt_id =3D MT8192_AP_CAM },
> > > > @@ -1356,7 +1356,7 @@ static const struct lvts_ctrl_data
> > > > mt8192_lvts_ap_data_ctrl[] =3D {
> > > >                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> > > >         },
> > > >         {
> > > > -               .cal_offset =3D { 0x40, 0x43, 0x46 },
> > > > +               .cal_offset =3D { 0x04, 0x04, 0x04 },
> > > >                 .lvts_sensor =3D {
> > > >                         { .dt_id =3D MT8192_AP_MD0 },
> > > >                         { .dt_id =3D MT8192_AP_MD1 },
> > > >
> > > > This example is tested and works for mt8195,
> > > > (all sensors use the same calibration data offset for testing purpo=
ses).
> > > >
> > > > Thank you in advance for your help.
> > >
> > > The MCU ones are still tripping though. If I change all of them to 0x=
04,
> > > then nothing trips. There's also a bug in the interrupt handling code
> > > that needs to be dealt with.
> > >
> > > AFAICT the calibration data is stored differently. If you look at Chr=
omeOS's
> > > downstream v5.10 driver, you'll see mt6873_efuse_to_cal_data() for MT=
8192,
> > > and mt8195_efuse_to_cal_data() for MT8195. The difference sums up to:
> > > MT8195 has all data sequentially stored, while MT8192 has most data s=
tored
> > > in lower 24 bits of each 32-bit word, and the highest 8 bits are then=
 used
> > > to pack data for the remaining sensors.
> > >
> > > Regards
> > > ChenYu
> >
> > Hi Chen-Yu Tsai,
> >
> > Thank you very much for helping me testing this suggestion.
> >
> > Indeed, calibration data is stored differently in the mt8192 compared t=
o mt8195.
> > So, the mt8192's support will be delayed for now, to allow further debu=
gging.
> >
> > In the mean time, we will only continue to upstream the remaining
> > mt8195's source code, so it will get full LVTS support.
> > A new series will be submitted soon.
> >
> > Would you please point me out to the bug in interrupt handling code?
>
> I just sent out two patches and CC-ed you on them. They are here just in =
case:
>
> https://lore.kernel.org/linux-pm/20230328031037.1361048-1-wenst@chromium.=
org/
> https://lore.kernel.org/linux-pm/20230328031017.1360976-1-wenst@chromium.=
org/

Well received. I'm testing it.
Thanks!

Best regards,
Balsam

>
> ChenYu

