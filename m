Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B662FEE0211
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LtJuWg5rZzkpKKkENXUM608sDYwm9QANqJ5OTuJVDE=; b=LyJDCeOhbDlp4jGqEpAlcbaZKb
	PcBf9Nl4tmnEX/1stZc4sgAYvlxmtarYJEu8m+dqNJztYmyB11h79zaBEaZuQ1F0XwF3z0hI0s0YW
	LMkLGJHqtVS+R0W0bqjhalqpg/axHqQgQNQZn8ctL8b3OK5vPwgByEENNyLu22oNqZuXOlND5XjeU
	EjaPTn6Tj/ostyR0uzMGL48yj/xrPqGdXm8f7eUg8Qt5o7f80ldcv6jueT0UWqA/EZ1rOufEnUibP
	qZkKr6S9IaDJaor8JnLkI5yC9Ozyo6tffq/kxRZCBGy3Ti13iyu0j7mPeV74FRGbo+2vQ++6UtsB1
	gGbC7K0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHzr-00000008UjI-13pv;
	Wed, 11 Sep 2024 07:42:39 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHvA-00000008TG2-26xq
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:37:49 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2f758f84dfbso13009641fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726040266; x=1726645066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LtJuWg5rZzkpKKkENXUM608sDYwm9QANqJ5OTuJVDE=;
        b=TXEcL1rjsRis5CsJ0MUZV1+DSSqm821QtIgcOWFNET3RfO79YObAM9PzhnL7vBplrZ
         LQW7+qaBSSDDlr0KBJ/ZOE6IxsDcFI2eEclWYMkBpIDbHt11tJk4zcBwdvZzD5z4MOAb
         Wleff3/+gQvvQoYWoXcU2b1SvWy5L7OYWRMuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040266; x=1726645066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LtJuWg5rZzkpKKkENXUM608sDYwm9QANqJ5OTuJVDE=;
        b=NRV585oNdZqKvxuiF0LyXD208c62HXPR10zlf/zhqA56T+UBP9tb5avCcxkmxDdiIR
         14yZExh4h8W4FKIe2EYeXE5oJGx87OscrzD3HjiBMc+8TcDOVmrmMjSs8hFza7bfmsB3
         sQQGwWxdaD0I+IV2PAuWqtVJBUobXMOvs5oZ0Oem5F/UpgwlbqtezWbPfhvQXc9WNw4A
         bn6OuHFiKQv+oNCFs0XrFFDSngVxvTFCZd00AQQEZOKOOXkrhaly+1/EplDkt1xJNRqv
         H3RYATM0TtfUIofr9AmQYom1QMsK2fY4tj1chJJTAIkdj9nmn+CVak9Dv1bYv4AtD/q1
         l1Lw==
X-Forwarded-Encrypted: i=1; AJvYcCX2ll9wmoYfc93Nvw085os+TeJPnNiG9WZxCtpAFddecxGDOOHiBoZKiQAJaUY3WEopoZ5TUtsG3p3zJuIxyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxve0cdhtGgvud1RMr7JAt/ilNGXUbUU29OD7pHLI2jw0oP97D1
	jdDpnwUDCRR6OUNf/SalwhensLgMAVmeNUZCkp6gulYZnSnjIjCxt1etoE0jDSGQSlQZFl4Zj8v
	ZFaIm+t53CLWwSwa/KfaGFOohbA216KTLxLfe
X-Google-Smtp-Source: AGHT+IEd4894jUMhTj+lpuZUCwhAQoDemTfiQND7C5Rfboo0QkW+QbXwdarpgS+S2rznD6UFho/GB5hhLLZk1Dxbtzw=
X-Received: by 2002:a05:6512:b23:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-53673c95c1fmr1178265e87.39.1726040266114; Wed, 11 Sep 2024
 00:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-7-wenst@chromium.org>
 <ZthjSK9N9z11YXi2@smile.fi.intel.com> <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
In-Reply-To: <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Sep 2024 15:37:35 +0800
Message-ID: <CAGXv+5Hrz2rA1_eAY8S96ankeWS4wr9EX-hr1LUY5JGx=FoNPQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] gpiolib: Add gpio_get_property_name_length()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_003748_558123_D5E12C3B 
X-CRM114-Status: GOOD (  29.95  )
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

On Mon, Sep 9, 2024 at 10:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Sep 4, 2024 at 9:40=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Sep 04, 2024 at 05:00:08PM +0800, Chen-Yu Tsai wrote:
> > > The I2C device tree component prober needs to get and toggle GPIO lin=
es
> > > for the components it intends to probe. These components may not use =
the
> > > same name for their GPIO lines, so the prober must go through the dev=
ice
> > > tree, check each property to see it is a GPIO property, and get the G=
PIO
> > > line.
> > >
> > > Instead of duplicating the GPIO suffixes, or exporting them to the
> > > prober to do pattern matching, simply add and export a new function t=
hat
> > > does the pattern matching and returns the length of the GPIO name. Th=
e
> > > caller can then use that to copy out the name if it needs to.
> >
> > > Andy suggested a much shorter implementation.
> >
> > No need to have this sentence in the commit message, changelog area is =
fine.
> > But if you wish... :-)
>
> It does seem out of place without any context. I'll move it to the
> changelog area. :D
>
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > ...
> >
> > > +/**
> > > + * gpio_get_property_name_length - Returns the GPIO name length from=
 a property name
> > > + * @propname:        name of the property to check
> > > + *
> > > + * This function checks if the given property name matches the GPIO =
property
> > > + * patterns, and returns the length of the name of the GPIO. The pat=
tern is
> > > + * "*-<GPIO suffix>" or just "<GPIO suffix>".
> > > + *
> > > + * Returns:
> > > + * The length of the string before '-<GPIO suffix>' if it matches
> > > + * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
> > > + * -EINVAL if the string doesn't match the pattern.
> >
> > Should be %-EINVAL as we agreed with Bart when I updated GPIOLIB kernel=
-doc.
>
> Ack.
>
> In the regulator cleanups I did, I used -%EINVAL instead. But then I
> realized that constants aren't really cross-referenced. I probably
> have to go through all of them to fix those up.

FTR this patch ended up getting dropped from the series as it was no
longer needed. However if folks think there is still value in this patch,
I can still send a new version.


ChenYu

