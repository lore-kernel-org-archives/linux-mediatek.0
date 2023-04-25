Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2CEC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35rY/v6zf6GtIET4fBOnZv9nYjXqazObgmroXAHCvWo=; b=QYqSgV3P8w5N3tWTvR00arHYnc
	xJW3NEgFEsdM/tPSmMo8N71Ez5sRkFip/FbBB6ODrzWlgDJhcNFmRUXKbBeAHgZBE6M/FsQHvx9Z9
	ReMqmoxz9JK1dd/kiR7psQOtak0B0OaR5QNjfes31uGkhpdJXrGQ0qugIS1u1IjEbU6u1d7XcNjp9
	979eSnrYhtsqVR6U7DHjCS+MUecl2ZPhx9pwSsQa1JIfvMUX+ZU1mulWeh3zXDKNKrOxufhfGuFCs
	FtGt0ImJzSmODkESKIGSyOdM3BaIN/+I8olRdpjGl3STAZ2OUYGWZQIy2N7o7QiKtmCgnRfOYIoxC
	PMTCkLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prEB4-000ZCK-0F;
	Tue, 25 Apr 2023 08:37:34 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prEB1-000ZAv-1l
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 08:37:32 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94f6c285d92so1017923666b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682411850; x=1685003850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35rY/v6zf6GtIET4fBOnZv9nYjXqazObgmroXAHCvWo=;
        b=KlsiZQAn3XjAJcr+sP0Ej9PIt/XfsmoZsvMN5z9IIj06GRXth2x11D+sufsjJdt0GQ
         nSZdIimrKfAjVWdM0Mvx5jQ9FLqTe4DSb6/CDGSHTs6nBZ3agFz756SrfkTkChSx1EYw
         9FUiloGp0CW0Z+OGugSiMNUS4l1X33k0qV2Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411850; x=1685003850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35rY/v6zf6GtIET4fBOnZv9nYjXqazObgmroXAHCvWo=;
        b=GkdUrQpdZLDRP6OUKlk/yvAIznJobaSOHJvl57s3oMXrZV6tBN/eJ9NNB+e7rykTj/
         hD034y6kdo/QLhG6tN2GqukfwT7XAOnZODPSNC0LdVymjKC52coECr7+SZ3TldqRin1A
         lN6T36Cmh1KZe9qus3lo70Mpixx+OZpogq7BoL/XdhEpIiEQT5eW8QP8N3wQDykqtiTr
         MPaX5zh6T0N7R6m1X7glEwARXOXfkpct6yr+YKYS1/1vbCf0xD6cVX4ak3GonFIc7M5N
         q4wbt7hk6tXZgNOchguH2ostL6Nuv9lkd20lIcVHzFPFyFSyoNpnpILvjlIJRUBrbvQG
         jmvQ==
X-Gm-Message-State: AAQBX9fVOgTOTVQIbFXl2q7HtfX9vfFRkCPetJp1hkOGATPHpmvPj7aF
	nsT20KQ6rwab/6VFZ8W1E3w1Qh5Oi8l28BKU2yLRpg==
X-Google-Smtp-Source: AKy350ZVf7XQJywhtY6HhQDBwLex+xJ76YUgVxOx0lMy3FwT1xuw2zFTnF2fw5fFVb71uxOgckFiEA==
X-Received: by 2002:a17:907:9845:b0:94f:adb2:171f with SMTP id jj5-20020a170907984500b0094fadb2171fmr10938531ejc.28.1682411849847;
        Tue, 25 Apr 2023 01:37:29 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id cw5-20020a170906478500b0095728d6f3b6sm4947498ejc.125.2023.04.25.01.37.28
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 01:37:28 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-2f4214b430aso3294043f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 01:37:28 -0700 (PDT)
X-Received: by 2002:adf:d091:0:b0:2f9:338:743d with SMTP id
 y17-20020adfd091000000b002f90338743dmr9864217wrh.23.1682411847907; Tue, 25
 Apr 2023 01:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-3-fshao@chromium.org>
 <ZEX5tc2LSZoVswc2@nixie71> <CAD=FV=XnrSskS=0UKRGGPBxSnPYQtUkJeoBm44bDnwKVBHJLyA@mail.gmail.com>
In-Reply-To: <CAD=FV=XnrSskS=0UKRGGPBxSnPYQtUkJeoBm44bDnwKVBHJLyA@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 25 Apr 2023 16:36:50 +0800
X-Gmail-Original-Message-ID: <CAC=S1njkYWfvqs5x4nYk0YxoFEcivunKP1T0pG3pO_tapfHivA@mail.gmail.com>
Message-ID: <CAC=S1njkYWfvqs5x4nYk0YxoFEcivunKP1T0pG3pO_tapfHivA@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: i2c-hid: goodix: Add support for
 powered-in-suspend property
To: Doug Anderson <dianders@chromium.org>
Cc: Jeff LaBundy <jeff@labundy.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013731_583339_A3BAA4FD 
X-CRM114-Status: GOOD (  29.83  )
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

On Tue, Apr 25, 2023 at 2:16=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Apr 23, 2023 at 8:38=E2=80=AFPM Jeff LaBundy <jeff@labundy.com> w=
rote:
> >
> > > @@ -37,13 +38,34 @@ static int goodix_i2c_hid_power_up(struct i2chid_=
ops *ops)
> > >               container_of(ops, struct i2c_hid_of_goodix, ops);
> > >       int ret;
> > >
> > > -     ret =3D regulator_enable(ihid_goodix->vdd);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > -     ret =3D regulator_enable(ihid_goodix->vddio);
> > > -     if (ret)
> > > -             return ret;
> > > +     /*
> > > +      * This is to ensure that the reset GPIO will be asserted and t=
he
> > > +      * regulators will be enabled for all cases.
> > > +      */
> > > +     if (ihid_goodix->powered_in_suspend) {
> > > +             /*
> > > +              * This is not mandatory, but we assert reset here (ins=
tead of
> > > +              * in power-down) to ensure that the device will have a=
 clean
> > > +              * state later on just like the normal scenarios would =
have.
> > > +              *
> > > +              * Also, since the regulators were not disabled in powe=
r-down,
> > > +              * we don't need to enable them here.
> > > +              */
> > > +             gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > > +     } else {
> > > +             /*
> > > +              * In this case, the reset is already asserted (either =
in
> > > +              * probe or power-down).
> > > +              * All we need is to enable the regulators.
> > > +              */
> > > +             ret =3D regulator_enable(ihid_goodix->vdd);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             ret =3D regulator_enable(ihid_goodix->vddio);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> >
> > Please let me know in case I have misunderstood, but I don't see a need
> > to change the regulator_enable/disable() logic if this property is set.
> > If the regulators are truly always-on, the regulator core already knows
> > what to do and we should not duplicate that logic here.

Your understanding is totally right, let me restore that in the next
revision. Thanks!

Regards,
Fei

> >
> > Based on the alleged silicon erratum discussed in patch [1/2], it seems
> > we only want to control the behavior of the reset GPIO. Therefore, only
> > the calls to gpiod_set_value_cansleep() should be affected and the name
> > of the property updated to reflect what it's actually doing.
>
> This would be OK w/ me.

