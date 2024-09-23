Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9833CCF9C71
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=; b=uC1q9FuO6y0fi7Fx2BXwPHRJ/g
	JGnEYPlvxr/0LBT95QahYAgLTtJJpGDSQGLFSqQeq1mB6X+iGXl6pSo0BNt2k1c7hPcdhtsgNzDD0
	TZvyi5D65LOn2d4p/IprSmxnbeLj4nmUs1nhJE6TlFpSzXmACUy6M9D1F3FxHD5lr8qzEGMzu1WWK
	/r5ARvfWPG3ar8nVbYMUu0dnyQXXHgSclKmCvkmAWReNNcuyaWx0TggMukc67HoA/PNgDnyIZh50n
	zxUzh05ybKsB7IAy6KTPnlSwpWa/XJRRaLjxCbWf0Nd/2wzBn0ZPZhK2aCxt7nM7e1U7d1NfSW3F9
	o+wTLZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssoU0-00000000LkF-2WHs;
	Mon, 23 Sep 2024 19:12:28 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssoTy-00000000LjY-1R5M
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 19:12:27 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5365aa568ceso5470592e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 12:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727118741; x=1727723541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=d8fRrsgf8jqzNUtTy1N9yx5wedqkX1lS4jTwWsHNed4cSYseNoljGxRQ1foyk9PJv9
         KPXRJ6xbQi0y/s3jRv7JZ2DaRoDBzUggKM/SqgYRK1Y4kZlYnVgrvUwC81aQptJNrJFV
         4ssNVbCcpREpyBEPLDhVkr3E7oS0ESDGi4ReI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727118741; x=1727723541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTdpdNtDHKc5MwXK6gfkOgHrOXbWdY15It+qZL/P+lM=;
        b=HYL52GyXmeRD71pJ6nv7G3JYOe7RNocWp/EYJPMwKdvdzwV1ADkUq2TDKLmzrgPeZS
         A9vYgd7Bf2fxtn3H55OmeY5jjtrHWRE0QbLZcJ1pdCSzPn46EKfJ9bHNb4asM2PUqtc8
         fdsgrXPYP+iui42rPIDscsTBSaT2Qp4YyqUNz7uGUYBxDMtofRbtserKTSVxIhCbZaNI
         RjhrSrOeMFlzFarRPDgkk1ywSjh1j6Mhv62tOZjam2uy+iV0bDgzdaeQ5S6e0VFQGYzv
         lBtcIMYZJZbU0CYg3N9cnbbLH3oDX+nrYURLKtSpER5GtXHBxZPC84D95/9OSxQCd6WM
         8TFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxvjsW6LK33uSy2P5vafUNdxKQQdk3EBAANSPYxSgWRPuR3RczK4jtkzFuKC+Kw9IrLU7pTHV2zCWe2VpFyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yypdd0iIA/ikVHlKJKgLuRbnRP4efUGcuOql46XCx1skhiB4cnl
	04dWUP87tXT9xcjju1ueePuHwUE6M17dzVtR71CvQeI/y+I92t3yZ+hr7KBt+et7ahGRbuymlUN
	cBw==
X-Google-Smtp-Source: AGHT+IE0wZPBqXn6Zz/R5gz89XdBKG2OQHgyVRhZOcPsXOsxcaRioONTOjgzxubGSciFp9nFh2jXsw==
X-Received: by 2002:a05:6512:ea8:b0:533:407f:5cbd with SMTP id 2adb3069b0e04-536ac2d6a95mr9021758e87.7.1727118740896;
        Mon, 23 Sep 2024 12:12:20 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3a04sm1266686966b.125.2024.09.23.12.12.19
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 12:12:19 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-378c16a4d3eso5126086f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 12:12:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/V0PY8r7ktUGvXw7/9khiLoPUC9OGNGEdkTFTHUEVjdlzMdaDu1iknGKlSO/diRBGQ/L+e3dnItMf11VDdA==@lists.infradead.org
X-Received: by 2002:a5d:4741:0:b0:374:c6b8:50b5 with SMTP id
 ffacd0b85a97d-37a422783aamr9933862f8f.17.1727118739230; Mon, 23 Sep 2024
 12:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-9-wenst@chromium.org>
 <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com> <CAGXv+5EcxGfdzvarg8hmk1zR9X0s8KUzayQdxfWTrasEGpj=1g@mail.gmail.com>
In-Reply-To: <CAGXv+5EcxGfdzvarg8hmk1zR9X0s8KUzayQdxfWTrasEGpj=1g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Sep 2024 12:11:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wv1uFmxFsaxT9tY=-fwnPsXDjnabNxQ-cK3hm2a9Wo7A@mail.gmail.com>
Message-ID: <CAD=FV=Wv1uFmxFsaxT9tY=-fwnPsXDjnabNxQ-cK3hm2a9Wo7A@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_121226_432722_4C13700A 
X-CRM114-Status: GOOD (  22.60  )
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

On Tue, Sep 17, 2024 at 5:41=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, str=
uct i2c_of_probe_simple_ctx *ctx)
> > > +{
> > > +       if (!ctx->gpiod)
> > > +               return;
> > > +
> > > +       dev_dbg(dev, "Setting GPIO to input\n");
> > > +
> > > +       gpiod_direction_input(ctx->gpiod);
> >
> > This is weird. Why set it to input?
>
> It seemed to me this would be more like the initial state, without knowin=
g
> the actual initial state.

In this case, though, you're trying to turn off the resource, not
trying to get back to the initial state. IMO deasserting the GPIO is
the way to do this. If the output needs to make it an input in this
case then it can use some type of open drain mode.


> > I would also say: given that you're providing a parameter anyway and
> > you're giving the GPIO name, can you please move away from the "raw"
> > values and move to "logical" values?
>
> I disagree. When hardware engineers design for swappable components, they
> likely look at the electrical compatibility of them. In this case, an
> active-high "enable" pin is electrically compatible with an active-low
> "reset" pin. If we use the logical value here, then we would need more
> logic to know when the logical polarity has to be reversed.
>
> Note that this doesn't work for components that are electrically
> incompatible. But in that case a lot more board dependent code would be
> needed anyway.

As we talked about in person, that made sense in the previous version
of the patch where you were looking for all GPIOs willy-nilly. Now
you'll be specifically asking for a GPIO by name and we should honor
the "active high" or "active low" nature of it.

-Doug

