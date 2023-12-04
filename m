Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7263EC10F14
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTNkS8LTnRqCQunaTUOLLsKXlHNWnzfg0xMTKbfGJJg=; b=EH7b9wMKDQBpvsUn2WiXHOV6em
	QpUVuZ4aACB06yzHsIWufxzRU0U+YMHPfVbZjG9SHiO48MiF/YzThZvz9ivw1qE8iH8vKG3SEr0SF
	8J8I3zifEr+Ts1g0NrJ6FQfmwslGI0BhVj2b1ZkIKdgJ9pklBEnx3iXNw9x0VNV+OvYmGMhmFNadY
	51iu7mugQTNhgVbO9RuJkzboPBVR9y/Z6UUJZPi7+RxPy6IKeeMHZ3LFxeN1pWc2Yl+9gZWlFtoiX
	mYBqITHt023QcSVpnudYtLzhpvvsqIjqMtOFLd87OsZRdRZm5Bet5PVEmLLBftUSS62xJEzpV/ttU
	50CC44Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA2vj-00381x-2u;
	Mon, 04 Dec 2023 06:59:47 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA2vf-00381D-06
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 06:59:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be10acaf9so2049422e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Dec 2023 22:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701673180; x=1702277980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTNkS8LTnRqCQunaTUOLLsKXlHNWnzfg0xMTKbfGJJg=;
        b=dEw3TQR+NhsFTiCOrzsCPLYYE9CTvkGc47NVv8dUiPLQ1FkhfFbQLfFWiduPwzy6hH
         2eFvzBdkaJ39XSU21U6evCOjBiYZi2UP/8XIdcjUGTbCP8e+UKFOFgJyXEzlZuZEvMb7
         PcxflEb2IHEaqAUtk4KT5i3u5zfVKHUMixIP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701673180; x=1702277980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTNkS8LTnRqCQunaTUOLLsKXlHNWnzfg0xMTKbfGJJg=;
        b=DHGIjHEzJ5xsamfY4/zTVeRDyipgSenESl1gptnt6LhjzbzD7zporcBS7G1fus3env
         JADUDKNNIAqEYsri9n+cz+mTpsjCSZ9RuIjyf0H59Va9Qp2jXp0O3FudZRFkBhBiL83p
         2wueKXYzRcv8M0Haiiv60EdplkqGpuO/46Q1YhEjlNG2DLkmClz94iY+AYauOOJDLtP4
         NzQTO5T+YlwFRwogl262H05F28ORGbLuqK5dexTjY9/zvxU1d47QOujzwsmdV/WhS741
         EL2/pA0dkYeDbzVJ/JYwbk7972fs5h3sKEuALWqQxusvO/Fu4uvnhty6HmhJ25bCMv6D
         8ESw==
X-Gm-Message-State: AOJu0YxeSnpi98w39gE4C9WDadYS6xOQ2HMEJRXf+ge6kaOVel15TKC7
	DTpcu5dnfDM1X3Wly/NSo+5sM6e3GEFxRooz1oj41A==
X-Google-Smtp-Source: AGHT+IHoyWO3QIHEBY5JdBrYFEV7xzgnarDfjr1JxVNq6dHU5EQ6tbsFVJqwEhCrsQ2CBaDRnPGYgwSDkHN9tbdxHX4=
X-Received: by 2002:a05:6512:b9e:b0:50b:ed31:72a4 with SMTP id
 b30-20020a0565120b9e00b0050bed3172a4mr1697429lfv.28.1701673180528; Sun, 03
 Dec 2023 22:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
In-Reply-To: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 14:59:29 +0800
Message-ID: <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
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
X-CRM114-CacheID: sfid-20231203_225943_094388_A31DA277 
X-CRM114-Status: GOOD (  12.80  )
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

On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
> >                 reg =3D <0x2c>;
> >                 hid-descr-addr =3D <0x0020>;
> >                 wakeup-source;
> > +               status =3D "fail-needs-probe";
>
> While doing this, you could also remove the hack where the trackpad
> IRQ pinctrl is listed under i2c4.

Sure. I do think we can do away with it though. According to at least one
schematic, the interrupt line has pull-ups on both sides of the voltage
shifter.

BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups on
both sides of the voltage shifter as well.

ChenYu

