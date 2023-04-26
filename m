Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392B2C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddvLBBpo8gBKXAD/L9Fptch2H58M4jlB4+ALINISU88=; b=VuJVPHMRzbAJ5BUSi+BwSSpqeS
	BVrBWmBr6qRqH6PPqhMtTIeliJgoYU8B9jeqWwdMwvDE9FOxvgyzJrk73SLrjN+HCAL9dHU6+hWnN
	oUeh6iWntd1pg0i5DN9wCs4uXoF5ZcSRIjtWurSTnj6GKR964b3fRvEzYoGSDW+pNv0XxLUcwCeBc
	VFjo+YWuHipD4NnDPtTUDzi46HpxU56729IwPA3CZaI1DBrT6WDpbvNwONPgdm6wwl/GYc02ZsrgQ
	OrvExpd2eNy9+OKsvFczNnLZufN682dCnxSK5xJBXqBcsfitLsoo+5Yic32wObJn0Lwd/Qg4dSnwg
	2s5kzdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prg4e-004CAo-1r;
	Wed, 26 Apr 2023 14:24:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prg4b-004CA6-0l
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 14:24:46 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50506111a6eso13209960a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682519083; x=1685111083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddvLBBpo8gBKXAD/L9Fptch2H58M4jlB4+ALINISU88=;
        b=HGKCq3RFAxc3VW3/U0wMKxQZnWJdo3cmgfy4IwawJzKvcte/EV46/bx7E+lBNh7EHu
         OtKzvq+1AQRjCZ6j+7ua1ppfWCjuDQm974hl26xUWLyYAFhOMPcnSeujo+aG2CLxFSud
         e4XvqcZGKaykVg2MTl18tT/KUZVb6Gr9SZhuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682519083; x=1685111083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddvLBBpo8gBKXAD/L9Fptch2H58M4jlB4+ALINISU88=;
        b=Gfjax/NDGTvhqlj0m6e3yl/h5QwhoWiHWlNFaaic8Y/q65Mt+u9nIGln3AoUXoUhoM
         f3OTeLOsHyNa4ruuIdCcanLoAdjb1qIdhwmrt/9OQDe4k/lzZWTPwbByEVLRMwvOYPCu
         8P0mj8SfFM4NJUEarawmbFF3C3AES8L/mcXy4GQSWbMwTBMSA1H0r6GflnDioJCDSWRZ
         d59GwyLiZ5EVUwDWbM8MCK5TU52NwIZ0HoPLSOQUn+yuQQOcpvFQ5jyc0La7g8ItzUG8
         LbCtDHSlXnSra371pQunIX5NyjCrahi5141RmOBuAJpbFqtfvgqzk8TXHzBKl86WwVVN
         ui7g==
X-Gm-Message-State: AAQBX9en4Yby+Rlj2FdHQqFDN0YCl9cHiPNwaWorR0Np5CMN/E0vr6EF
	IqCtdN3NKboIjgyIssWGhm8Q62W2djKtSx38Bqo=
X-Google-Smtp-Source: AKy350bk/s9doaPsuklU1A/P9gZMw+EQTdcr/AtjHnuEHnCarv6Sc6BL1tDLnIgzZE0aHXfkt4UuMQ==
X-Received: by 2002:a17:906:4785:b0:94a:58a5:2300 with SMTP id cw5-20020a170906478500b0094a58a52300mr21658806ejc.27.1682519083198;
        Wed, 26 Apr 2023 07:24:43 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id sa16-20020a1709076d1000b00958f6d75a2asm4875948ejc.223.2023.04.26.07.24.42
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 07:24:42 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f1e2555b5aso29083665e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 07:24:42 -0700 (PDT)
X-Received: by 2002:a1c:ed01:0:b0:3f1:70cf:a2d9 with SMTP id
 l1-20020a1ced01000000b003f170cfa2d9mr12964153wmh.9.1682519081849; Wed, 26 Apr
 2023 07:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230426093231.1466984-1-fshao@chromium.org> <20230426093231.1466984-3-fshao@chromium.org>
 <CAD=FV=VY+01V7hBfUeZKR3OnnTcNuuYb-vhLWGgdS5jb4QTLBQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VY+01V7hBfUeZKR3OnnTcNuuYb-vhLWGgdS5jb4QTLBQ@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 26 Apr 2023 22:24:06 +0800
X-Gmail-Original-Message-ID: <CAC=S1niMR5JBunfmMbV+FSqSOcR7rY3R4KH4Y7QQmz=LgciT2g@mail.gmail.com>
Message-ID: <CAC=S1niMR5JBunfmMbV+FSqSOcR7rY3R4KH4Y7QQmz=LgciT2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: i2c-hid: goodix: Add support for
 "goodix,no-reset-during-suspend" property
To: Doug Anderson <dianders@chromium.org>
Cc: Jeff LaBundy <jeff@labundy.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_072445_295768_F9E5561E 
X-CRM114-Status: GOOD (  40.22  )
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

On Wed, Apr 26, 2023 at 10:05=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Wed, Apr 26, 2023 at 2:33=E2=80=AFAM Fei Shao <fshao@chromium.org> wro=
te:
> >
> > In the beginning, commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the
> > reset line to true state of the regulator") introduced a change to tie
> > the reset line of the Goodix touchscreen to the state of the regulator
> > to fix a power leakage issue in suspend.
> >
> > After some time, the change was deemed unnecessary and was reverted in
> > commit 557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the reset line t=
o
> > the regulator") due to difficulties in managing regulator notifiers for
> > designs like Evoker, which provides a second power rail to touchscreen.
> >
> > However, the revert caused a power regression on another Chromebook
> > device Steelix in the field, which has a dedicated always-on regulator
> > for touchscreen and was covered by the workaround in the first commit.
> >
> > To address both cases, this patch adds the support for the new
> > "goodix,no-reset-during-suspend" property in the driver:
> > - When set to true, the driver does not assert the reset GPIO during
> >   power-down.
> >   Instead, the GPIO will be asserted during power-up to ensure the
> >   touchscreen always has a clean start and consistent behavior after
> >   resuming.
> >   This is for designs with a dedicated always-on regulator.
> > - When set to false or unset, the driver uses the original control flow
> >   and asserts GPIO and disable regulators normally.
> >   This is for the two-regulator and shared-regulator designs.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ---
> >
> > Changes in v2:
> > - Do not change the regulator_enable logic during power-up.
> >
> >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 26 +++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-=
hid/i2c-hid-of-goodix.c
> > index 0060e3dcd775..fc4532fcadcc 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > @@ -28,6 +28,7 @@ struct i2c_hid_of_goodix {
> >         struct regulator *vdd;
> >         struct regulator *vddio;
> >         struct gpio_desc *reset_gpio;
> > +       bool no_reset_during_suspend;
> >         const struct goodix_i2c_hid_timing_data *timings;
> >  };
> >
> > @@ -37,6 +38,20 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops=
 *ops)
> >                 container_of(ops, struct i2c_hid_of_goodix, ops);
> >         int ret;
> >
> > +       if (ihid_goodix->no_reset_during_suspend) {
> > +               /*
> > +                * This is not mandatory, but we assert reset here (ins=
tead of
> > +                * during power-down) to ensure the device will have a =
clean
> > +                * state after powering up, just like the normal scenar=
ios will
> > +                * have.
> > +                *
> > +                * Note that in this case we assume the regulators shou=
ld be
> > +                * (marked as) always-on, so the regulator core knows w=
hat to
> > +                * do with them in the following regulator_enable() cal=
ls
> > +                * despite regulator_disable() was not called previousl=
y.
> > +                */
> > +               gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +       }
> >         ret =3D regulator_enable(ihid_goodix->vdd);
> >         if (ret)
> >                 return ret;
> > @@ -60,6 +75,14 @@ static void goodix_i2c_hid_power_down(struct i2chid_=
ops *ops)
> >         struct i2c_hid_of_goodix *ihid_goodix =3D
> >                 container_of(ops, struct i2c_hid_of_goodix, ops);
> >
> > +       /*
> > +        * Don't assert reset GPIO if it's set.
> > +        * Also, it's okay to skip the following regulator_disable() ca=
lls
> > +        * because the regulators should be always-on in this case.
> > +        */
> > +       if (ihid_goodix->no_reset_during_suspend)
> > +               return;
> > +
> >         gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> >         regulator_disable(ihid_goodix->vddio);
> >         regulator_disable(ihid_goodix->vdd);
>
> I think the above is wrong. You should just skip the GPIO call when
> "no_reset_during_suspend", not the regulator calls. As your code is
> written, you'll enable the regulators over and over again in
> "power_up" and never in "power_down".

Agree, I'll resend v3. Thanks for the feedback!

Regards,
Fei

>
> -Doug

