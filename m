Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F002CAC58C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=; b=Oyue0aR/Zhs/NqY0KiXEXKJzAc
	VlkMpg+HnVUw5EaUL3rPX6qrZ+hJ342c3Ru1MEP0x3Nm7U8elLrrKnzA00FCSRX9J39Zohdr3skoc
	9CAxdECcQehbHuyL+J+/+hsJsl3pfCxRM/+HzYijm7vvlYjCmzXJPRlC/M4nFCeo01DptEIUfLgx9
	hJlTUOq3ChUfKhVO96S1V1HFflvV6jv8KmRIT3dd0W4hI3GSNZniEuo9z/1jgH+V6vH2xwfLGQkbf
	86dcmzKh5X36NNoipFPWKvLuaMGl1869keAghUYg0fE8xOw7XLmz6UEaomIVMH+8s3DOUbBfxG2XF
	aJmnB9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0ni-00000008NvO-1NaM;
	Tue, 09 Sep 2025 16:02:34 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyKh-00000007M0X-0TaC
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 13:24:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-336d3e4df3eso44287131fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757424265; x=1758029065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=;
        b=GQrb03GkAt4JwD5Dp7AbgHKpFXOW2pja9QCWMP6vuIrm7NWHQU8Rwpfe/F49fZ+d0b
         GjHlfoTTtbUv+5PkTkGl6M6/vskL6a0vbdQA2KYgaXphpUN669+xQ/HEXGyq366FF7h6
         9ZgxeV6/7G94pXdi+XEPC941F7XMPd1IprXz642+QIDN8XEEjdEQ0dz5StPQwBDotxuS
         MAK5g9dT+RfJckrHlUtvB+qFXHawIJ7qXSfhUe0Oxj4GrNUQTxj4W9/U9MTvN/i5Y3Cc
         F+qxJ5MyMOt3f2klrrWHXlHOIcFOYpMJXImwg4Fk9nyqtJOfnxrgtheaLCD8giC5QzZj
         ttgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424265; x=1758029065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HhvoYavio6XW9UGp4dKzH+wlvXL0CQx3DgO+74W6ths=;
        b=rMeDVQC+D2IP/1JkY/1naaoyMTXuFKGHOHkG6btNZMKMv5XS0XMh/rhKYCzmyiH9Tz
         v+sXsPgVyQSsq/vfa7q6LQeBwr8/yokojut2dli0/GpN6AcY1Jw5XFVxV+Ou62w25J8l
         3N+B8JlXleAYO/ItbuiYyYseILw+3luZvcD6u3S9GEoXx4gxsON5ACCkEPpMpp4I+m/k
         97R9eXAhwsmLOjpeAQyDUz3UOu54s4FpYpdH448wRjj6PcD2Tp/sKlkiViY+JmIL00DY
         m1Q9dctCX2hsFNzF4PlfR6f+5xTD0RcIBGR9M2uPvPYpjXQJ3h3cAKzq6YaMawlfTkcM
         Ovbw==
X-Forwarded-Encrypted: i=1; AJvYcCX3tfq0viQp01leehTrCay2f26WzsAGJSxWP2E564oZdW5C7fXzjIxktdLaKzNCyD7dDFhx98TDbF04Gi7VTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvEGNx+ZB/eYdsMdYoXkB3FBdaRqNPu8vdzzXgCmlIjDuGaDAn
	WzULYfZsgsF/3Rt7ArRkAyJ6sg27bwCkzUnCOq9b1J24GwIAoIhreow7UfVdn6XYH8QkXq3GvVp
	V5Yb8JSZYRhxRdqq452tBfIvK5QpqCWIXHRAD2lbPLA==
X-Gm-Gg: ASbGnctLg65dFV6VL1ZIAes6xZlRBb6L+0cORgZVIRGTV3TqPq5MW1p07T13U+KinRI
	9kSD8bYnqThCJ9aEK9r0L86U2X4gwflE85SMWP1+olV4aAfS5OYQNU6U2zw58G4nTjcis3pOY4z
	byTlJKjhQRJh+SqXyTWmHI/P/I6FsiFqTNTnluenlMH3Me823xXeq9vhHKbR0jueXY3RhwNXLfI
	Hx/NXKqEDNbSTFoVJgy8O1dDSjlYAL4vIqy5TQ=
X-Google-Smtp-Source: AGHT+IGqxpMTWwovk8l5WQ5dYhWUYy4ZcII/K/jrdWFPYe7kT1CZQHo3Y8LCGp8PKQqEA3qrGlITiYRoPcmLayU54qE=
X-Received: by 2002:a05:651c:b12:b0:336:dd88:69e0 with SMTP id
 38308e7fff4ca-33b57c39f8cmr32465971fa.29.1757424264537; Tue, 09 Sep 2025
 06:24:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 08:24:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Sep 2025 08:24:23 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
Date: Tue, 9 Sep 2025 08:24:23 -0500
X-Gm-Features: Ac12FXwbBQSlPLH49oae8yjyXj1ugyDMbkjsHTtBWh1WBSZW49QTty0I4jg5ioo
Message-ID: <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_062427_156162_EC8419C7 
X-CRM114-Status: GOOD (  21.66  )
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

On Tue, 9 Sep 2025 15:13:04 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Tue, Sep 09, 2025 at 01:35:04PM +0200, Bartosz Golaszewski wrote:
>> On Tue, Sep 9, 2025 at 1:31=E2=80=AFPM Andy Shevchenko
>> <andriy.shevchenko@intel.com> wrote:
>> > On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:
>
> ...
>
>> > > +     config =3D (typeof(config)){
>> >
>> > This looks unusual. Why can't properly formed compound literal be used=
 as in
>> > many other places in the kernel?
>>
>> It is correct C
>
> If it compiles, it doesn't mean it's correct C, it might be non-standard.
> Have you checked with the standard (note, I read that part in the past,
> but I may forgot the details, so I don't know the answer to this)?
>

It's a GNU extension alright but it's supported in the kernel as it evaluat=
es
to a simple cast.

>> and checkpatch doesn't raise any warnings.
>
> checkpatch is far from being useful in the questions like this.
> It false positively complains for for_each*() macros all over
> the kernel, for example.
>
>> It's the
>> same kind of argument as between kmalloc(sizeof(struct foo)) vs
>> kmalloc(sizeof(f)).
>
> Maybe, but it introduces a new style while all other cases use the other,
> _established_ style. So we have a precedent and the form the code is writ=
ten
> in is against the de facto usage of the compound literals.
>

It may not be *very* common but it's hardly new style:

$ git grep -P "\(typeof\(.*\)\) ?\{" | wc
    108     529    7315

Bart

>> I guess it's personal taste but I like this version better.
>
> In kernel we also try to be consistent. This add inconsistency. Am I wron=
g?
>
>> > > +             .dev =3D &pdev->dev,
>> > > +             .sz =3D 4,
>> > > +             .dat =3D sd->gpio_pub_base + GPINR,
>> > > +             .set =3D sd->gpio_pub_base + GPOUTR,
>> > > +             .dirout =3D sd->gpio_pub_base + GPOER,
>> > > +     };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

