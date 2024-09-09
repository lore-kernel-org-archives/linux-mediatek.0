Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C31EB64DE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 02:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMqW2/x+fk7uF1c9DEdkk0ZnLtGrl9rFz+k1/Bb5Q1k=; b=NHUfBvlgLmdma6rrizAUl6jrr3
	BiWlRldZfhIPKY9s1BulG6f/Dx8h1dC7y+37P37P3DXtbL3Txtmx6iV7SDA2Z8Myt6MJrOSp33aGx
	XxeDMLtXyPl7ycDsArjPbeqjRH/XtdwjI5lmvBwfdGyu77Tz8zZrJkSKcKsKhhvvDRhFdaiJos3Aj
	XLAdXcNd6IbkZXzT55vgplMEEgq+duQoFkUdU0sRQfq0RonIh2rcgjpl284aQ/5RGWzFR8d4Z85v0
	gLnAttXO2ZkN54AdBcG2IgX5mz0vU/iA5OBm99NZ/QvlREjE/PpIRL8QA035QQ39EXF488VUgQ9wo
	vElxkKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUPR-00000000JYR-46Qr;
	Mon, 09 Sep 2024 02:45:46 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUPO-00000000JXY-3CPm
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 02:45:44 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2f752d9ab62so31474641fa.3
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 19:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725849941; x=1726454741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMqW2/x+fk7uF1c9DEdkk0ZnLtGrl9rFz+k1/Bb5Q1k=;
        b=d+Ixll22ktXLS7HaljeCc8t74V2jXutIYWUSWEmjCi0l44nu9hYRKmJjs5Pa4X9XKn
         6zg5mgHWwHRAh73u17NZu+yl337GkoTnQtk+yycPciuz99DGqSC/XzoUmTgJrUQs0SKt
         7aj6LIdOpeJraUYdJysI5dU/dwQTkFseIJ01c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725849941; x=1726454741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMqW2/x+fk7uF1c9DEdkk0ZnLtGrl9rFz+k1/Bb5Q1k=;
        b=menlj4hIXRPK/vriN7nOZCp0FbNMM2QQB5NcKxfYXXj9rVJ4YsrrV3ohW7DOOwfJmZ
         cCXW0lmmj642gw3pdPTNIgRhFASGdHEDtJgOEKpQS1r/8pKBfIXMA8LKCsEGLJNFfqd+
         MElp4rxLQ95aGURsQFe02iJkltOS+XIwkcidqHdOH8iRClO4FF1MRxOOO457Ae8aJXsK
         H/spVDNuwsRJo8V9I8cV2B0d6ZzPTtfc1B2xHCDhqDQuGKuRtLy5GJofhl/fViTsJV57
         ZAM8woRulExj92gTfqETS+DGWYDDQQhjJMT20YPBHSqW7jMd5aneARILDaYjWwMybN18
         sriQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd9jPye1oIB8CmKxkxMlhanEufHv+f7IGfnGdRE70/g5LRk7/YxVavksIh01Xu6Ie3AR1RaWV8EpDfyYoTSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFxeeQ3Yld15WmaPBWA58ABOWyq1l5QLPHbqiK0KTO0BJvsQQm
	IDiGCrrKsPttPb6UTtw4A5h810YNsrPA4lOoXtrw+OzLrUux9jJxmP0IN7u0Aeznso2n9v+oy2N
	PbD3gQ6CaEPa8A1uoHA+ls2aMsrL090EPdP7B
X-Google-Smtp-Source: AGHT+IHKcGbtZMLF5gC+Rr5ltwNIMAF/guOu0Im7D+JgNL7Cng1B+SOmWwSxiNMZsp714FjogNvrNqttyc4V2OI3P10=
X-Received: by 2002:a05:6512:6c4:b0:533:4620:ebfb with SMTP id
 2adb3069b0e04-536587ae621mr6193097e87.21.1725849940576; Sun, 08 Sep 2024
 19:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-7-wenst@chromium.org>
 <ZthjSK9N9z11YXi2@smile.fi.intel.com>
In-Reply-To: <ZthjSK9N9z11YXi2@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Sep 2024 10:45:29 +0800
Message-ID: <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240908_194542_845219_15D3C780 
X-CRM114-Status: GOOD (  26.13  )
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

On Wed, Sep 4, 2024 at 9:40=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 04, 2024 at 05:00:08PM +0800, Chen-Yu Tsai wrote:
> > The I2C device tree component prober needs to get and toggle GPIO lines
> > for the components it intends to probe. These components may not use th=
e
> > same name for their GPIO lines, so the prober must go through the devic=
e
> > tree, check each property to see it is a GPIO property, and get the GPI=
O
> > line.
> >
> > Instead of duplicating the GPIO suffixes, or exporting them to the
> > prober to do pattern matching, simply add and export a new function tha=
t
> > does the pattern matching and returns the length of the GPIO name. The
> > caller can then use that to copy out the name if it needs to.
>
> > Andy suggested a much shorter implementation.
>
> No need to have this sentence in the commit message, changelog area is fi=
ne.
> But if you wish... :-)

It does seem out of place without any context. I'll move it to the
changelog area. :D

> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> ...
>
> > +/**
> > + * gpio_get_property_name_length - Returns the GPIO name length from a=
 property name
> > + * @propname:        name of the property to check
> > + *
> > + * This function checks if the given property name matches the GPIO pr=
operty
> > + * patterns, and returns the length of the name of the GPIO. The patte=
rn is
> > + * "*-<GPIO suffix>" or just "<GPIO suffix>".
> > + *
> > + * Returns:
> > + * The length of the string before '-<GPIO suffix>' if it matches
> > + * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
> > + * -EINVAL if the string doesn't match the pattern.
>
> Should be %-EINVAL as we agreed with Bart when I updated GPIOLIB kernel-d=
oc.

Ack.

In the regulator cleanups I did, I used -%EINVAL instead. But then I
realized that constants aren't really cross-referenced. I probably
have to go through all of them to fix those up.


ChenYu

