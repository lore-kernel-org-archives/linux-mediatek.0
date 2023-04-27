Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C31C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 03:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kjr1uyrMYaui+GtohqyXliIMiHeH1QRQFMBxyH6C+9c=; b=YXb+37RD+GtsNu9Nx18IE4Oz2W
	5zTHawxJuyLVI0EtlfYw4w0WGiOywD55gucECvN6oQZWWa1APjUsHdGeRJcNQ9MCzuz6yqgDkNG2f
	OderYBDPv9WZH4p8Vx0cotQrl/VVJpbN+xtgKzCjYtY0wuZswoW6IWrFMGEznWDd348ZGrAeeldMB
	6zItPNSr5bPoizgNGJSAXULgcmpZjDrbvDYdSTwVw0Yrks6+epCwzOV6AyedMc/NpOeN0bDBOcLnk
	47IhkrHgTLq0WD6guiAR8j6nJM14YKwA+9NDF41r/f0T5bA/s/RRvZAzg6KJ29ExQpMLYio5CIZFe
	uXqSDyqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prsaD-005NMO-0R;
	Thu, 27 Apr 2023 03:46:13 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prsaA-005NLv-0J
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Apr 2023 03:46:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-956eacbe651so1460406166b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 20:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682567166; x=1685159166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kjr1uyrMYaui+GtohqyXliIMiHeH1QRQFMBxyH6C+9c=;
        b=LAMl+13ugul4+qFJZf6rZpNmm1WOA5LkpENYAWPYjVf/fS1QGJKOpp0/fB64p8ILAi
         4gsu9UlKw8wn4TcxdLMU+1aCn5xJtAYdtiI40+nfoM2t6mbondtfmgu/s36yHmX9i6fO
         58fusE7yKiOirChN4q6uYCG173tR7oS5XlwvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682567166; x=1685159166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kjr1uyrMYaui+GtohqyXliIMiHeH1QRQFMBxyH6C+9c=;
        b=bf8N7lEA5iAGkMcKKHCWKgsj9GAqTrdWxGoFyMojGvRhNPSCkJvm5EiKV2POpdsxky
         iDNVsgiT0jC817HAiEUZebPtp77JB7zt1o/gtx0UlpGIOjwU+lJuiuvJWSW7k1ChriYt
         LnIgzSqWDgA7IGbW0vpsu0MfcDLJN2KRTFJJVUqSpbndjdYCpJq6rcmrslB8l4hV1cEa
         Vq/TR7QzvsfVVScyLWXdISNsz3RMirr36d9VhTPlFJLn9nYOKOVjJJ2ti2trEusJaBDV
         z7r0iuNs2wxBrW7W8NG2AKE94biMANhg78ubwbLtWapnViCntUKUSMzCt0V2aiyp01zm
         sq/A==
X-Gm-Message-State: AC+VfDwyM0j044oDOnm5KkdGr4tnA57HsOcg+3BOnkunyOwhyazmvIJ0
	tUS/o8Visc1W2b6E9WRaxhemT1E0Pd2mloQQ4HE/Gg==
X-Google-Smtp-Source: ACHHUZ4yewdfMkW6Ztk8Z+8d6KuLeSO9AX3Q0LhOhYBUbC1Lis1weCmRrRyMeL04BSu/vs6NRzpw0A==
X-Received: by 2002:a17:907:2685:b0:94f:64c7:d7e2 with SMTP id bn5-20020a170907268500b0094f64c7d7e2mr221219ejc.9.1682567166364;
        Wed, 26 Apr 2023 20:46:06 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id e5-20020a170906844500b0095fd0462695sm479263ejy.5.2023.04.26.20.46.04
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 20:46:04 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f09b4a1584so54519125e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 20:46:04 -0700 (PDT)
X-Received: by 2002:a1c:f706:0:b0:3f1:923e:e6bc with SMTP id
 v6-20020a1cf706000000b003f1923ee6bcmr266327wmh.0.1682567164086; Wed, 26 Apr
 2023 20:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230426144423.2820826-1-fshao@chromium.org> <20230426144423.2820826-3-fshao@chromium.org>
 <ZEnK7bQkl+fkcHkb@nixie71>
In-Reply-To: <ZEnK7bQkl+fkcHkb@nixie71>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 27 Apr 2023 11:45:26 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni9ii=xNG-t7jPVGhP1kXMMthmGfvoPzCyEWytazFvRdg@mail.gmail.com>
Message-ID: <CAC=S1ni9ii=xNG-t7jPVGhP1kXMMthmGfvoPzCyEWytazFvRdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: i2c-hid: goodix: Add support for
 "goodix,no-reset-during-suspend" property
To: Jeff LaBundy <jeff@labundy.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_204610_165982_8E4FD16E 
X-CRM114-Status: GOOD (  42.73  )
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

On Thu, Apr 27, 2023 at 9:08=E2=80=AFAM Jeff LaBundy <jeff@labundy.com> wro=
te:
>
> Hi Fei,
>
> On Wed, Apr 26, 2023 at 10:44:22PM +0800, Fei Shao wrote:
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
> >   and asserts GPIO and disables regulators normally.
> >   This is for the two-regulator and shared-regulator designs.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Great work; one tiny nit below. If you do not agree with it or have found
> precedent that suggests it is OK, feel free to ignore it. Either way:
>
> Reviewed-by: Jeff LaBundy <jeff@labundy.com>
>
> >
> > ---
> >
> > Changes in v3:
> > - In power-down, only skip the GPIO but not the regulator calls if the
> >   flag is set
> >
> > Changes in v2:
> > - Do not change the regulator_enable logic during power-up.
> >
> >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-=
hid/i2c-hid-of-goodix.c
> > index 0060e3dcd775..3ed365b50432 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > @@ -28,6 +28,7 @@ struct i2c_hid_of_goodix {
> >       struct regulator *vdd;
> >       struct regulator *vddio;
> >       struct gpio_desc *reset_gpio;
> > +     bool no_reset_during_suspend;
> >       const struct goodix_i2c_hid_timing_data *timings;
> >  };
> >
> > @@ -37,6 +38,14 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops=
 *ops)
> >               container_of(ops, struct i2c_hid_of_goodix, ops);
> >       int ret;
> >
> > +     if (ihid_goodix->no_reset_during_suspend) {
> > +             /*
> > +              * We assert reset GPIO here (instead of during power-dow=
n) to
> > +              * ensure the device will have a clean state after poweri=
ng up,
> > +              * just like the normal scenarios will have.
> > +              */
> > +             gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +     }
>
> I don't think curly braces are technically required here, as there is onl=
y
> one statement within the conditional despite the comments making it appea=
r
> otherwise. Maybe this would work too:
>
>         /* ... */
>         if (...)
>                 gpiod_set_value_cansleep(...);
>
> Again however, I do not feel strongly about this.

Oops, I just carried it over from v1 and didn't think that much at the
moment, but indeed I should have cleaned that up.
V4 is on the way, thanks for pointing that out.  :)

Regards,
Fei

>
> >       ret =3D regulator_enable(ihid_goodix->vdd);
> >       if (ret)
> >               return ret;
> > @@ -60,7 +69,9 @@ static void goodix_i2c_hid_power_down(struct i2chid_o=
ps *ops)
> >       struct i2c_hid_of_goodix *ihid_goodix =3D
> >               container_of(ops, struct i2c_hid_of_goodix, ops);
> >
> > -     gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +     if (!ihid_goodix->no_reset_during_suspend)
> > +             gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +
> >       regulator_disable(ihid_goodix->vddio);
> >       regulator_disable(ihid_goodix->vdd);
> >  }
> > @@ -91,6 +102,9 @@ static int i2c_hid_of_goodix_probe(struct i2c_client=
 *client)
> >       if (IS_ERR(ihid_goodix->vddio))
> >               return PTR_ERR(ihid_goodix->vddio);
> >
> > +     ihid_goodix->no_reset_during_suspend =3D
> > +             of_property_read_bool(client->dev.of_node, "goodix,no-res=
et-during-suspend");
> > +
> >       ihid_goodix->timings =3D device_get_match_data(&client->dev);
> >
> >       return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001, 0);
> > --
> > 2.40.1.495.gc816e09b53d-goog
> >
>
> Kind regards,
> Jeff LaBundy

