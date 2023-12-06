Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88402C10DC3
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 02:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAjB+OSC2G0sATXrxYuI8k53/GEiZUhN5YxDKMU/l7c=; b=1Ni6ElDqMCV7LHbP1OwpsYyBa6
	AhxmlrIucJys3gNUMSxE8uFRWdHgjrg77AtX+QwoLA/mU0xiX15Kw0ei5XoksXxoI4HqB/nxZgbJ8
	8RieuhdXXcDaOocNB6ICSirw1oP41hIhenSyRrjFfsLVOejZqDCgCXTMFjAQH0Kh1nM/yCHdCNRRh
	sYvjrhuPcmc1emzzCQkNn6GCYpIMEPjPb7+GYi0pmvU0nZ9DqkXD/C1LplsSvQ+uS++5IQmiKv8ph
	PN837/R3nNtqxNeqmHDKkQorkAMp+p/XdtMh+jgLZ7hLax8bZsmfcde647ObICyY4jddrTd9ejSu6
	fh5cvt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAi4y-008v6B-0F;
	Wed, 06 Dec 2023 02:56:04 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAi4u-008v4o-0h
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Dec 2023 02:56:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bf26b677dso3280166e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Dec 2023 18:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701831356; x=1702436156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAjB+OSC2G0sATXrxYuI8k53/GEiZUhN5YxDKMU/l7c=;
        b=WVTAhq+Odik9U/KA87QhenNXjt7vUPiThXgIM6PSOluYjBp3WknAuwHzGnZ6HrMhZd
         xxuOfHA6Qr2jrbeiYifzZ/hc0ndc69mOpMxbbMjCatjCdqENRVSh+tZPDtFK05s2PT6h
         +LTbtHn4YADDladht5cOwoD4KWMoBjSLhSglI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701831356; x=1702436156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAjB+OSC2G0sATXrxYuI8k53/GEiZUhN5YxDKMU/l7c=;
        b=F5Gd1grROklkSrbJW8hJ1GMdwVB9k/y2J95ohwYLW59yts5IEHp4eCvnO/IbtzR/3j
         +r6UTELruvjFs4zGko8mf2zCBAY19tN6NtC1QUR6mmxJ8uG+v9hUDMYVC4b7HOXFBUnu
         3gC8Thrr8m937bu22xGvEEpDk+avMbVxgwUlhQKKN7YjqqQUpyt1gExrkhZdIWcR0x8E
         oDKuUKg8LZneuFy+Irnueb8/OzBBUGX+ppQEeXwvr0HZKDK2K9yJnBUzATd96GPj0qMf
         z9Di4bP1sWxz3JV8xzF4jXb/s/feZMLloECmaNtC4uZBKtYb52v8wR0YoNm8mFXTDsgo
         U8yA==
X-Gm-Message-State: AOJu0YyseGgzLAqrsrZZfNgs6zB7u19ch5+bAPGa1IALZyiuV4fwJltI
	h7//YYDyEXYKzECpDVp02h520tLbiUbDMbTZNYwVDg==
X-Google-Smtp-Source: AGHT+IHnNZLv+A8rBD2iJfouOzY8bodAfVe2SPHWkYOI3dEcOPciD4ew3LweH+XusZAZCM5WonigRoCXzwrqYp9fpWQ=
X-Received: by 2002:a05:6512:1107:b0:50b:f88d:f83b with SMTP id
 l7-20020a056512110700b0050bf88df83bmr112272lfg.78.1701831355848; Tue, 05 Dec
 2023 18:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
 <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
 <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com> <3700f05f-2411-4422-972f-f3df690efb84@collabora.com>
In-Reply-To: <3700f05f-2411-4422-972f-f3df690efb84@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 6 Dec 2023 10:55:44 +0800
Message-ID: <CAGXv+5G5fFTv8zn=YamSdccjuYemE5oKBqjb8CSyGzu9aMJ0eg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_185600_260085_250F916F 
X-CRM114-Status: GOOD (  22.48  )
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

On Tue, Dec 5, 2023 at 6:22=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 04/12/23 17:50, Doug Anderson ha scritto:
> > Hi,
> >
> > On Sun, Dec 3, 2023 at 10:59=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> >>
> >> On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> >>>
> >>> Hi,
> >>>
> >>> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium=
.org> wrote:
> >>>>
> >>>> @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
> >>>>                  reg =3D <0x2c>;
> >>>>                  hid-descr-addr =3D <0x0020>;
> >>>>                  wakeup-source;
> >>>> +               status =3D "fail-needs-probe";
> >>>
> >>> While doing this, you could also remove the hack where the trackpad
> >>> IRQ pinctrl is listed under i2c4.
> >>
> >> Sure. I do think we can do away with it though. According to at least =
one
> >> schematic, the interrupt line has pull-ups on both sides of the voltag=
e
> >> shifter.
> >>
> >> BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups o=
n
> >> both sides of the voltage shifter as well.
> >
> > I dunno if the convention is different on Mediatek boards, but at
> > least on boards I've been involved with in the past we've always put
> > pinctrl entries just to make things explicit. This meant that we
> > didn't rely on the firmware/bootrom/defaults to leave pulls in any
> > particular state. ...otherwise those external pull-ups could be
> > fighting with internal pull-downs, right?
> >
>
> MediaTek boards aren't special and there's no good reason for those to re=
ly on
> firmware/bootrom/defaults - so there is no good reason to avoid declaring=
 any
> relevant pinctrl entry.

I think this should be migrated to use the proper GPIO bindings: the
GPIO_PULL_UP / GPIO_PULL_DOWN / GPIO_BIAS_DISABLE flags.

But that's a different discussion.

ChenYu

