Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFFEC7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj7WRPReo3X43Tifzj8RaGCINknzpjb7t0vp2Cx5wEA=; b=uDCT3VIF5wBB6ahj7ZenZP9ujF
	rGEjZ0VJgPB4wl+gpsl1HX+w7SwTzPomXH4bV9ivrnhWC6U9HV2n7hS/NrgLT4DhBz2Suur4zvj2E
	3B+NHv7XKgMlUbYoG3rVma3V8LVYLdDAc7g648h9WwUxmKA1rKYafbYuNmAVegbm2Q92yWTSEDr6b
	9Q3lVbF1Uwu2l4lA0aVqbTy2motImXzKZ/tifedQ5XIXTaSMqH7M3WD23p6M/SJraj01HMLUMqco8
	ONYz4MTwmXNrCkdzn7obR41lb+zIBgXjdFGlDumc/xjjhpONsk+krbANk07GkYnsk+5wu0VrETA7j
	9EWMemhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prfls-0049QW-2B;
	Wed, 26 Apr 2023 14:05:24 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prflo-0049QA-1Q
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 14:05:21 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-760bba6404cso174022239f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682517918; x=1685109918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj7WRPReo3X43Tifzj8RaGCINknzpjb7t0vp2Cx5wEA=;
        b=XazxS2hTtpp/nio3fc4FsWpm81VaM7r3E0SoE9H54mMRtRmEejXhHvkOH7cd/fYB+c
         UCcEiL8QQNlUgNxN1qu/npy1ZQi6o9y7tIi+fbMiD/1q0dcJ7SXIqMQvC1CAKS0OuNeq
         cAZ9gCqQ8mOXs7aTzIyrP9soIwswpEuEFIEaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682517918; x=1685109918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wj7WRPReo3X43Tifzj8RaGCINknzpjb7t0vp2Cx5wEA=;
        b=irnkN4ZoherIXa+c6FVZzlh541fp9UsD8UapctISROSdLJ//A5BTbvRKKYxOH9U5Cr
         yLi5wEx9PfhBWDYpkxmG49W5kfM6+c+O//NLSzF5IUv0kITE1UD46H5bIbybS2ctp2dI
         WDIWDv3Tn12iEjW0mJVCGT9zqepxzlCzRKCPEj4s3I7jhAdenOXKNl1aL+TJ2AstEUox
         4NigRf7HKX6lV0jQiTcHYY3oDNFPPTXjvAjiKIUvNry+OWmffxlW1NySE0kMVliDTQf6
         cVG9bG1lGz7bNYEg3mKsEE4FQGsEOHgIKv1cQMTDzUUFXYJ+6jKS75J+XmF3CFpu+9Lb
         k1uQ==
X-Gm-Message-State: AAQBX9edIqZ+7ZD7WAWi0f64OaJNqJ6ENq79/XjvQ4+WTLfb/gXz7s0X
	A5vWFgCUH430YD0+ptsIRH88j/CF0f0V10kREME=
X-Google-Smtp-Source: AKy350ZLRn70boVBYpuq4FDpwYis+WIVivjBxFjJLtnaz7e08G4jG02dSSoOtdMzjqByR83604+esA==
X-Received: by 2002:a5d:96c8:0:b0:760:e308:107e with SMTP id r8-20020a5d96c8000000b00760e308107emr9816880iol.0.1682517918082;
        Wed, 26 Apr 2023 07:05:18 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id t62-20020a025441000000b004117b634217sm4196276jaa.151.2023.04.26.07.05.17
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 07:05:17 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-329577952c5so260275ab.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 07:05:17 -0700 (PDT)
X-Received: by 2002:a05:6e02:2199:b0:326:55d0:efad with SMTP id
 j25-20020a056e02219900b0032655d0efadmr306665ila.12.1682517916542; Wed, 26 Apr
 2023 07:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230426093231.1466984-1-fshao@chromium.org> <20230426093231.1466984-3-fshao@chromium.org>
In-Reply-To: <20230426093231.1466984-3-fshao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Apr 2023 07:05:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VY+01V7hBfUeZKR3OnnTcNuuYb-vhLWGgdS5jb4QTLBQ@mail.gmail.com>
Message-ID: <CAD=FV=VY+01V7hBfUeZKR3OnnTcNuuYb-vhLWGgdS5jb4QTLBQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: i2c-hid: goodix: Add support for
 "goodix,no-reset-during-suspend" property
To: Fei Shao <fshao@chromium.org>
Cc: Jeff LaBundy <jeff@labundy.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_070520_509383_54A30454 
X-CRM114-Status: GOOD (  36.17  )
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

Hi,

On Wed, Apr 26, 2023 at 2:33=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> In the beginning, commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the
> reset line to true state of the regulator") introduced a change to tie
> the reset line of the Goodix touchscreen to the state of the regulator
> to fix a power leakage issue in suspend.
>
> After some time, the change was deemed unnecessary and was reverted in
> commit 557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the reset line to
> the regulator") due to difficulties in managing regulator notifiers for
> designs like Evoker, which provides a second power rail to touchscreen.
>
> However, the revert caused a power regression on another Chromebook
> device Steelix in the field, which has a dedicated always-on regulator
> for touchscreen and was covered by the workaround in the first commit.
>
> To address both cases, this patch adds the support for the new
> "goodix,no-reset-during-suspend" property in the driver:
> - When set to true, the driver does not assert the reset GPIO during
>   power-down.
>   Instead, the GPIO will be asserted during power-up to ensure the
>   touchscreen always has a clean start and consistent behavior after
>   resuming.
>   This is for designs with a dedicated always-on regulator.
> - When set to false or unset, the driver uses the original control flow
>   and asserts GPIO and disable regulators normally.
>   This is for the two-regulator and shared-regulator designs.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v2:
> - Do not change the regulator_enable logic during power-up.
>
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 26 +++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hi=
d/i2c-hid-of-goodix.c
> index 0060e3dcd775..fc4532fcadcc 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> @@ -28,6 +28,7 @@ struct i2c_hid_of_goodix {
>         struct regulator *vdd;
>         struct regulator *vddio;
>         struct gpio_desc *reset_gpio;
> +       bool no_reset_during_suspend;
>         const struct goodix_i2c_hid_timing_data *timings;
>  };
>
> @@ -37,6 +38,20 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops *=
ops)
>                 container_of(ops, struct i2c_hid_of_goodix, ops);
>         int ret;
>
> +       if (ihid_goodix->no_reset_during_suspend) {
> +               /*
> +                * This is not mandatory, but we assert reset here (inste=
ad of
> +                * during power-down) to ensure the device will have a cl=
ean
> +                * state after powering up, just like the normal scenario=
s will
> +                * have.
> +                *
> +                * Note that in this case we assume the regulators should=
 be
> +                * (marked as) always-on, so the regulator core knows wha=
t to
> +                * do with them in the following regulator_enable() calls
> +                * despite regulator_disable() was not called previously.
> +                */
> +               gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> +       }
>         ret =3D regulator_enable(ihid_goodix->vdd);
>         if (ret)
>                 return ret;
> @@ -60,6 +75,14 @@ static void goodix_i2c_hid_power_down(struct i2chid_op=
s *ops)
>         struct i2c_hid_of_goodix *ihid_goodix =3D
>                 container_of(ops, struct i2c_hid_of_goodix, ops);
>
> +       /*
> +        * Don't assert reset GPIO if it's set.
> +        * Also, it's okay to skip the following regulator_disable() call=
s
> +        * because the regulators should be always-on in this case.
> +        */
> +       if (ihid_goodix->no_reset_during_suspend)
> +               return;
> +
>         gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
>         regulator_disable(ihid_goodix->vddio);
>         regulator_disable(ihid_goodix->vdd);

I think the above is wrong. You should just skip the GPIO call when
"no_reset_during_suspend", not the regulator calls. As your code is
written, you'll enable the regulators over and over again in
"power_up" and never in "power_down".

-Doug

