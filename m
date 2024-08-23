Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89083C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVFI/kAx4GZJG5dq3c75HD5Ktn0yw4zArYMGtwgACRE=; b=RMb1LyPkKO/tFTdtNxA/FJGeNb
	eFATstESkPle8zvs6ILfp9hIYSJLl0dIskc2ngdzdOe5JWAqcL3IhNbPCBJ6/KRHffI5Uy8LCUcYk
	8OGaR7uYTJ10jqLTFmMKCnwPM5GaxfSHfb+zXNR0ubbOSCFYgn5Yu7peYdntkGUFQWnSKjuHCq93H
	HXj1M7+qF4lwvex4WnaQwXxoNpXN03YXyq4DplyYs8hftDkhiJ1COXVDmETEMML4Mj34/R4CFVXd8
	Cqhqj9PTFCRyQKG7wrfTci74df7Qi8n38lx2GgcU0SohomAH53IhJfshZCo7lx6tGnlrFoonTigPX
	3Cnj5kbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shP58-0000000FiXF-3goN;
	Fri, 23 Aug 2024 07:51:38 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shP4f-0000000FiQQ-1uK2
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 07:51:10 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-533461323cdso1958198e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724399467; x=1725004267; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVFI/kAx4GZJG5dq3c75HD5Ktn0yw4zArYMGtwgACRE=;
        b=GLHNjuNQnwAPvQ4lWdWtUKOhE7wYt/Ajd8EUbl3OYE5Be4CzpXcBWap0CTqizdYSY4
         SHiaCdxR/XOaHc28e6ZTb1JOfrrcWFC0MDG+iwOTTt+iFf+vVqBNfEHk8TqEDTn/bCR9
         5NJ7Hlmo78ncLPQFCl82gOBxhmM2mRmtCsHlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724399467; x=1725004267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVFI/kAx4GZJG5dq3c75HD5Ktn0yw4zArYMGtwgACRE=;
        b=bQ+dPWZxYglzIQaoX4dwv2A0KPMyLnw+cwpOcqENsiYge0EuH9NMQIVr0m2zUucr1E
         EteRz2Kky2JiBPo0tGQDJxjdJdiHfDoOqPe98dUfAaBCv+j3eD3Rh6bBut+MTyYojL7m
         bNxeFMImGvJ3Mi8ZXAG3LGZOkwCToDE6EEUSlIl3EL+Ql3GOA37xznOko0zxS9a8d6pV
         BeESbCAMvNEaHGzosV3kdxIoKYDh1slxS6x9BKQ7uP5VrAO84nRq2+JzZkzx3hn9uQxh
         DrlZHMvtdoLjAJykHhbc6cbWQB3OZA2sFdtPakg8GQUKWAhEX9ErVCZnGcvaZOa4WhZI
         OXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHmSUUdlFd1aFA93Fl4MWgr1Atlk63cgotqwvZ2odm6A3fINdtmfOu7ftSFiBPutY0Pl1VKCrt0z0VWoTmag==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcmN1l/dGnzyBMA3Z3+Iep9H7F7g2IKZVxqs991X7Lzqk/BvR4
	nQYWl+Fo12hALcUqduVENc4FS/NNBfTs3cuc2Ck7CRrc1/BT3Cx0sECMjQf+mNO56Afb8ogc24q
	Ckxz74vwhH1EblfSBHL4eXEn1lK4pUVL2qMmg
X-Google-Smtp-Source: AGHT+IGwq8qrwQzH9MhG9+f2TAUzL+lDTX48ZdahHSVAEA0ONPP07O3k9tJzluNvWAvmzLEjq7LhXUIOSOn/Kv6k6WU=
X-Received: by 2002:a05:6512:3087:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-53438868deemr943389e87.52.1724399466989; Fri, 23 Aug 2024
 00:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-6-wenst@chromium.org>
 <ZsdNA2b9CDRrtno2@smile.fi.intel.com>
In-Reply-To: <ZsdNA2b9CDRrtno2@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 15:50:55 +0800
Message-ID: <CAGXv+5H0eGEjQU8qbKjua5qfbL2FaX2bMSyQg0PMVQrFfaiR8g@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] gpiolib: Add gpio_property_name_length()
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
X-CRM114-CacheID: sfid-20240823_005109_535754_708612E5 
X-CRM114-Status: GOOD (  33.91  )
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

On Thu, Aug 22, 2024 at 10:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:58PM +0800, Chen-Yu Tsai wrote:
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
> ...
>
> > +/**
> > + * gpio_property_name_length - Returns the GPIO name length from a pro=
perty name
> > + * @str:     string to check
>
> It's property name, so, I would name this 'propname'.

Ack.

> > + * This function checks if the given name matches the GPIO property pa=
tterns, and
> > + * returns the length of the name of the GPIO. The pattern is "*-<GPIO=
 suffix>"
> > + * or just "<GPIO suffix>".
> > + *
> > + * Returns:
> > + * The length of the string before '-' if it matches "*-<GPIO suffix>"=
, or
>
> What about "x-y-gpios"? It's unclear what will be the behaviour.

I thought it was implied that the '-' mentioned here is the one before the
suffix. I made it more explicit.

> > + * 0 if no name part, just the suffix, or
> > + * -EINVAL if the string doesn't match the pattern.
> > + */
> > +int gpio_property_name_length(const char *str)
>
> gpio_get_... ?

Ack.

> > +{
> > +     size_t len;
> > +
> > +     len =3D strlen(str);
>
> If it has a thousands characters...?

Shouldn't matter much? I suppose using strrchr() as you suggested
requires one less pass.

> > +     /* string need to be at minimum len(gpio) */
> > +     if (len < 4)
> > +             return -EINVAL;
>
> Do we really need it here? See below as well.
>
> > +     /* Check for no-name case: "gpio" / "gpios" */
> > +     for (const char *const *p =3D gpio_suffixes; *p; p++)
> > +             if (!strcmp(str, *p))
> > +                     return 0;
>
> > +     for (size_t i =3D len - 4; i > 0; i--) {
> > +             /* find right-most '-' and check if remainder matches suf=
fix */
> > +             if (str[i] !=3D '-')
> > +                     continue;
> > +
> > +             for (const char *const *p =3D gpio_suffixes; *p; p++)
> > +                     if (!strcmp(str + i + 1, *p))
> > +                             return i;
> > +
> > +             return -EINVAL;
> > +     }
>
> This can be combined with the above
>
>         for (const char *const *p =3D gpio_suffixes; *p; p++) {
>                 /*
>                  * Find right-most '-' and check if remainder matches suf=
fix.
>                  * If no separator found, check for no-name cases.
>                  */
>                 dash =3D strrchr(propname, '-');

I believe this line could be moved out of the for-loop. Otherwise it
looks much more concise compared to my version. I'll omit the comment
though, as it is just rehashing the kerneldoc description, and now
that the function is so short, it shouldn't be hard to read.

I'll add you as "Suggested-by".


Thanks
ChenYu

>                 if (!strcmp(dash ? dash + 1 : propname, *p))
>                         return i;
>         }
>
> > +     return -EINVAL;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

