Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F34CC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7j0UAYPIEyb2tedNA0XGfDwr790N1opj1Plxr5EQ2oo=; b=q3qyLKzYKPEMQDfh6oOGwY+qif
	XnvFWVJfDEkvBW+IB1QSPwf8nAhZ/SSh3aNhf5S67X2z7KGetH6+TTPkweN4d/POBwfyr86x5sm/p
	b8Md7yPW0LbctXNu+KY3n8gqCwIozv1onzIqXM5ozRW0dipL/vUkbKrLTJR4WR+GFkO1dCqEwJ7Rv
	2KlszoB+nkcCBPuJs58MNG2v9PS4b99njDBjsOxGv34kuMXL20lT+b3VoCrzbfSH0JO96IkPz4fqd
	pfFjndxGKAoh3bf8RPxx7vzDMKzjV7Uj8amEPpAWbcdxpLM9JtsuBGyiMyVUEaNLPnbm12S97FsZ1
	z2ZDhrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3O9d-001q0W-12;
	Wed, 15 Nov 2023 22:14:37 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3O9Y-001pzZ-2O
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 22:14:35 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53f9af41444so252527a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 14:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700086468; x=1700691268; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7j0UAYPIEyb2tedNA0XGfDwr790N1opj1Plxr5EQ2oo=;
        b=czCx4kPwjuUEavlN97QBH5G4mkiZQIp2KjBHTDgPic0iJVwm+kVypIgnP5CPiRzBYY
         CHRXGcj9Vn60kjtKFEby+dHndC7I9qbNl7kzr8wfzcI+vGxK94s2SD65R0aFJtVCo2kq
         A+Z+Y5VuiB4KJ8wl/ibhb7JyISH1WC2nEX9ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700086468; x=1700691268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7j0UAYPIEyb2tedNA0XGfDwr790N1opj1Plxr5EQ2oo=;
        b=KGJ60cT0HYwFsdwP/pZQUgDSUTyQr7hb3qYDf/tCR0qo5sEMMVKQhGtwR5I89uY4hf
         5wLsHfXv8lulPYyJTpoSr5acr+Bzria2nYIl0bCxnCK2Myk0de3OCDaBgjEdB2/6H1sk
         SfTH4+ZbhtJXFSroEVwF303Po+qGCyqwxqcU68TBzCO2waBHijEy0zew/Gn/J1I1UtCs
         CsoAvQ4WEWppJuOSJwfd96iwoAtSQnlT2H/09QsOBy1tLu6QOQxl8BPV2MKmjzTHpPmA
         SGCIw23GNAmLDTh5z5nEYXoJn0hm0FdKdv4oXBPMTFNzUfjFgY1ah5ThSVrc2GrwuGiA
         y7OQ==
X-Gm-Message-State: AOJu0Yy+4gBV7V6Kzu1z0peqhFCCZLUZqWeN1UBx4ChUaObW5fBH+0kI
	kxuxSkqjhZPd76X7Ay4RsOJ3yRhDSuZzcONCEuRqZLik
X-Google-Smtp-Source: AGHT+IEdyvjn2UgEZToh5ESHWKAiclDjyp64UPeMbLTzLy09j5WGpKZpxqs+K+O7H4geNJ2z3J2UXw==
X-Received: by 2002:a17:906:4b1a:b0:9c7:5a01:ffe5 with SMTP id y26-20020a1709064b1a00b009c75a01ffe5mr10737496eju.5.1700086468640;
        Wed, 15 Nov 2023 14:14:28 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id g24-20020a17090613d800b009e5eaf7a9b6sm7637825ejc.139.2023.11.15.14.14.28
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 14:14:28 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so4962a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 14:14:28 -0800 (PST)
X-Received: by 2002:a05:600c:260c:b0:404:7462:1f87 with SMTP id
 h12-20020a05600c260c00b0040474621f87mr21266wma.6.1700086447481; Wed, 15 Nov
 2023 14:14:07 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
 <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
 <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
 <CAD=FV=X-17COQ2-tycV1bSuCrGy7MJ88Un8nA-a-ODexvgi9TQ@mail.gmail.com> <CAL_JsqKR_YD6hm4Lv+OuCKms8Ha61BZRKUuiLYPgSkz3_3NCFA@mail.gmail.com>
In-Reply-To: <CAL_JsqKR_YD6hm4Lv+OuCKms8Ha61BZRKUuiLYPgSkz3_3NCFA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Nov 2023 17:13:50 -0500
X-Gmail-Original-Message-ID: <CAD=FV=XO5VNuaVKwBHLQC1ukdpHQO0-XTaKnRM=rigbcdOytgQ@mail.gmail.com>
Message-ID: <CAD=FV=XO5VNuaVKwBHLQC1ukdpHQO0-XTaKnRM=rigbcdOytgQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Rob Herring <robh+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, 
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, 
	james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_141432_827662_0C337A32 
X-CRM114-Status: GOOD (  38.95  )
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

On Wed, Nov 15, 2023 at 4:35=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wr=
ote:
>
> On Wed, Nov 15, 2023 at 2:45=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Nov 15, 2023 at 2:28=E2=80=AFPM Rob Herring <robh+dt@kernel.org=
> wrote:
> > >
> > > > So if we're searching the whole device tree for "failed-needs-probe=
"
> > > > then we need to figure out which devices are related to each other.=
 If
> > > > a given board has second sources for MIPI panels, touchscreens, and
> > > > trackpads then we need to know which of the "failed-needs-probe"
> > > > devices are trackpads, which are touchscreens, and which are MIPI
> > > > panels. Do you have any suggestions for how we should do that? Mayb=
e
> > > > it was in some other thread that I missed? I guess we could have a
> > > > board-specific table mapping (compatible + node name + reg) to a
> > > > class, but that feels awkward.
> > >
> > > Node name is supposed to correspond to device class, so why not use
> > > that (no path or unit-address.) and nothing else (well, besides
> > > "status")?
> >
> > One problem is that I could imagine having two second source trackpads
> > that both have the same i2c address. That would give them the same
> > name, right? I guess you could maybe come up with some sort of suffix
> > rule? Like
> >
> > trackpad-1@10 {
> >   compatible =3D "elan,blah";
> >   ret =3D <0x10>;
> >   status =3D "failed-needs-probe";
> >   ...
> > }
> > trackpad-2@10 {
> >   compatible =3D "goodix,gt7375p";
> >   ret =3D <0x10>;
> >   status =3D "failed-needs-probe";
> >   ...
> > }
> >
> > Then I guess the class would be "trackpad"?
>
> That issue is somewhat orthogonal because it is not following the spec.

I'm not sure why you say it's orthogonal. The whole reason why we get
into the situation above is that we could have two devices, only one
of which is present (hence the status of "failed-needs-probe"), that
are the same type and have the same "reg" address.

Essentially the whole "failed-needs-probe" is extending the spec,
right? While extending the spec, we also need to talk about what to do
if some of the devices that we need to probe have the same class and
the same "reg".


> I'm not sure mixing the 2 styles of node names is a good idea. While
> not used too much, matching by node name does ignore the unit-address,
> but I'm not sure we could ignore a '-N'.
>
> I think our options are either add something to the unit-address or
> use i2c-mux binding. Adding to the unit-address is not unprecedented.
> I did that for some of the register bit level bindings where you have
> a node for different bits at the same address. The downside is
> unit-address is bus specific, so we'd have to add that for multiple
> buses. For the i2c-mux, it's perhaps a bit complex and I'm not sure
> what if anything you'd have to do to manage the mux that's not really
> there.

Somehow it feels weird to use an i2c-mux because there's no real mux
present, right? ...so this would be a virtual (bogus) device that
doesn't really exist in hardware.

...though I guess if the "mux" type binding is OK then maybe we just
use that as the HW prober, at least for i2c devices...

-Doug

