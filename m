Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E99C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 00:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7To0W+4U1gHtnYyGtgD0VBuArtwhrF2fE4verOw+Uo=; b=d5n5eMUdVeHt8d7Op4hVazirXg
	tqipHrpwqcy/BCCmpSa9UivV536A9tl4NTlKME0A/evvS9vqw/uOGICC9v8lUbjzHyUx61eQUMIUf
	5LMChrfzQ+Nb/1sMo83K58Tl7EPkg0zcLPR8JSKaeDIPtsGghHMPFIy20NeQ9ysNft07VGm32vwPL
	F/W0eAaFJ4qojmgIY3UIKq6dc2boA5OwdY79iuYThmGPbqVuFg5j3WUmDYbZLoAw7wYq13vV1x2jr
	YznR+IKA4Ggb5fcmzu7iGO0bXb5YpAu8E1QgPOyAeoQT/2i/6vjN1YEOVg+h6m4LEHVrBQ0WD1Psv
	aJRdTHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1bm2-009iNj-1b;
	Sat, 11 Nov 2023 00:22:54 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1bm0-009iN6-0u
	for linux-mediatek@lists.infradead.org;
	Sat, 11 Nov 2023 00:22:53 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso34719261fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Nov 2023 16:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699662169; x=1700266969; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7To0W+4U1gHtnYyGtgD0VBuArtwhrF2fE4verOw+Uo=;
        b=eiVnkhFtr1S8nqtjfCh4DzbeyzQWjRRo+qA2sOe1jP4U/P31faDqLo6sWs8QbKNd0a
         jFcDRTYo6mBMTm88BW8BGt4/4YH7RByAO83fD0NUy2iXObgM+cLZw2/tOiwB/u+Y+6jE
         19fi9XLy5xXC2TJWbdPO2RuT7UqZssxagRpbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699662169; x=1700266969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7To0W+4U1gHtnYyGtgD0VBuArtwhrF2fE4verOw+Uo=;
        b=enGAvOs/ZXBIZJWyRkOCZslZ69ZJQmdcubjUaZBbT45ZmeoAZrHicYcNA83WJ/vvEU
         1ZwO5FbEnbKxhfvN8vMwCbrQiN1hpPjfEs7agF37TKvB3vtYkt0d/Zrf+NOa3A3VMGAq
         2a/KbRlr+Y8bOl/nmNq9k1i7i+auc4we1hVGcbkjs6l9x5g3mnoTCuCvoRtUe+6xxijH
         xVaJO5T8dqhvq8a/sH47lyigWMaVolX9Te3VFO33229QRKHZcBzCRyhE8B1FMbfjDyIL
         vE6z2aVyh2kC3gB/vgkp0YbomZRFLtGTtBRcj74KJnFrCrWRbkFKJoNYoMD4W4MJH8Xl
         wakw==
X-Gm-Message-State: AOJu0YzyPoS10X/WPA5bhN50SYxqJKgjDU4OyLF4yGR/UAjFWDAgZE8a
	RcIHfQAF5SXHrmsQVZ4iKSGLXbTWmp9vONN2kpw/BFoo
X-Google-Smtp-Source: AGHT+IHXLljiK4C7qQ31fld6XlSQob0F7KdupokAV0lE5sVY2AYC0Z/zE1GD5QXCQ9QUMrFgXsLeLw==
X-Received: by 2002:a2e:86c9:0:b0:2c7:f79e:9c5a with SMTP id n9-20020a2e86c9000000b002c7f79e9c5amr487844ljj.49.1699662169228;
        Fri, 10 Nov 2023 16:22:49 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id h24-20020a2eb0f8000000b002c00da5c522sm57783ljl.78.2023.11.10.16.22.49
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 16:22:49 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50931d0bb04so1066e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Nov 2023 16:22:49 -0800 (PST)
X-Received: by 2002:a05:600c:1d07:b0:408:3727:92c5 with SMTP id
 l7-20020a05600c1d0700b00408372792c5mr32280wms.2.1699662148320; Fri, 10 Nov
 2023 16:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org>
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Nov 2023 16:22:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WZCyp1aaSmpF-_TQ0CTWG1ZuvPZVw4mR=wJH=NTkKqqg@mail.gmail.com>
Message-ID: <CAD=FV=WZCyp1aaSmpF-_TQ0CTWG1ZuvPZVw4mR=wJH=NTkKqqg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, petr.tesarik.ext@huawei.com, rafael@kernel.org, 
	tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_162252_340399_0532CA6D 
X-CRM114-Status: GOOD (  19.62  )
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

On Thu, Nov 9, 2023 at 2:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> The driver as
> implemented currently doesn't deal with regulators or GPIO pins,
> since in the existing device trees they are either always on for
> regulators, or have GPIO hogs or pinmux and pinconfig directly
> tied to the pin controller.

I guess I won't object too much about this limitation for v1, but IMO
it would be good to get this sorted out since I think part of the
power of having the HW Prober is specifically that it can handle this
type of use case. You have a little bit of board-specific code that
knows how to turn on the regulators / GPIOs and can then probe the
devices.

Note: even if this is "board specific", it doesn't mean you couldn't
share code between boards. For instance, you could have a helper
function that would turn on regulators/GPIOs based on some type of
table and that helper function could be used across a whole pile of
Chromebooks. If a Chromebook is sufficiently different that it
couldn't use the helper function then it could call its own function,
but presumably it wouldn't be hard to support a bunch of boards
without much code.

As part of this, I think that your main "HW Prober" for Chromebooks
should be in "drivers/platform/chrome/". I think that the only things
that should be in the "drivers/of" directory should be helper
functions used by the Chromebook HW Probers.


-Doug

