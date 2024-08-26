Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EC1C5321D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 06:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pb5HMPckE7rab17yr39tAC0kkeNgAa+55ZzvCXR8H9k=; b=M6W22a9WTbiow+KzwhMug2i6yL
	e5kE8k9vuDi7//Xz2Y0jsgFAud2bRUiMtwDN5zMJl7qMAAZVnBfP1zlLVm3hZoNtX9fOHyFJCwmMa
	+/GGb2bWAKR5kqggmB3i9jtvjbk+cF+Mf8/JV1EvimC51cawRR/bCfkmYcLascnfCx2FpqjaLRIt9
	deGeELCFR+K8bYMYLM0O5r1QHF+TcZIwBVjU3Tpt74z95L0SVTlv6lsacTEMvZyBL7ADIrR5JiGVq
	I4knZWK9KKTFLfACTeGPALoUrXbG9GXuaAUEUooNGKVDeoU5DwpEaQfSJUTImH9dyjdk5AdI9PoGH
	x1lpLOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siTeC-000000068ZW-0eSA;
	Mon, 26 Aug 2024 06:56:16 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siTUy-000000066bu-2fmv
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 06:46:46 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2f50966c448so11516121fa.2
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Aug 2024 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724654802; x=1725259602; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb5HMPckE7rab17yr39tAC0kkeNgAa+55ZzvCXR8H9k=;
        b=T/HrC58td63MgXTydjVnJxK6iUMTYi1NO+ScxDw+1HyAn0O9PqB3FFUPamaamN0BQB
         UgJPQRqT9i7wqUTVlV3wIm1TiqGeozQ4IpmZW+X1oFJ7FnSHlPCoBjTrlG9DD0+QJ52J
         ndj8wHEuwqQWS5qh8gPMwwXkjdnCuS4RH5CRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724654802; x=1725259602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pb5HMPckE7rab17yr39tAC0kkeNgAa+55ZzvCXR8H9k=;
        b=fc/7x4DEtEg35wZtZ2ik+EYQ+/vTfSFmH/dOMan8ccD/4ePuCVvAbkYd/9D0+MOh83
         Wi3/zMeefBwrSWUuaor0c8GHvLoHeBoavv8/w+K+QyxM48kEhozc/5GvNETNrT1EEGu2
         ZFqtljV+m+CnfsCDFfWJi/MuNZbjoxcQtVOf7ZRZKYchztuz803modgSPp8N5Tf3ep6+
         gIO3LiGrpC3C6GR6WotCWT3YwA/111FPIsjhSRwvzHGgLOobuazFuK81kjokU2Ondg7n
         Of6+Rp0BnElCxLs8zw86NilR21OhxlK0amp2jjUO3/5xDR2VMeKGINNb1HQxKC8mdvJS
         Yp1A==
X-Forwarded-Encrypted: i=1; AJvYcCWTJL8TAkVIQ2kLs8SzUrkWvGB+FNF6SYiulZG7VL467Fjz89nIrtW2OVzinNygoZussonlZ3cibTzE5W6bbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywku/+FK1XtkhzTIJvDmzgHuN8MijLDzCIntUfSxOwjwJPpoRXD
	DCcCaMPBFh5tENnbMfbp9zlUAgF0sicC82rbsxlOFZjwclBHhmdSqC1+9kFKu+b7Me62FTTR3uX
	dqxpx2GTq/U3dmL9egpesIsCsxCZg/0qffnoW
X-Google-Smtp-Source: AGHT+IH4DcAdsdETmFTlhuJdrATVXH7fDL01UNUX4b9VbFz9hg6UqEkKKO/I+KkXGBZXYBevq6GR/cInwzl+FyACB/c=
X-Received: by 2002:a05:6512:3b98:b0:533:4785:82a7 with SMTP id
 2adb3069b0e04-53438783b14mr7187223e87.28.1724654802231; Sun, 25 Aug 2024
 23:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-3-wenst@chromium.org>
 <ZsdBddTDuvNasHNq@smile.fi.intel.com> <CAGXv+5FjwxGQgV6SdLfTeNRYbpcgwkEnCWvaZiWh4rs3bhs-2A@mail.gmail.com>
 <ZsiR-kizxnvZufgR@smile.fi.intel.com>
In-Reply-To: <ZsiR-kizxnvZufgR@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Aug 2024 14:46:30 +0800
Message-ID: <CAGXv+5G1OsrPSwFs64-MPSQgp28=Jk7zKs1WDDjVNrmPfSd0sw@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
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
X-CRM114-CacheID: sfid-20240825_234644_732266_FD0A4A26 
X-CRM114-Status: GOOD (  25.58  )
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

On Fri, Aug 23, 2024 at 9:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Aug 23, 2024 at 02:49:59PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Aug 22, 2024 at 9:47=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Aug 22, 2024 at 05:19:55PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > +/**
> > > > + * of_get_child_regulator - get a child regulator device node
> > > > + * based on supply name
> > > > + * @parent: Parent device node
> > > > + * @prop_name: Combination regulator supply name and "-supply"
> > > > + *
> > > > + * Traverse all child nodes.
> > > > + * Extract the child regulator device node corresponding to the su=
pply name.
> > > > + * returns the device node corresponding to the regulator if found=
, else
> > > > + * returns NULL.
> > >
> > > At the same time you may fix kernel-doc warnings (no "Return" section=
) in these
> > > three (on your wish you may fix others in a separate change, but it's=
 not
> > > related to this series).
> >
> > As you said some other functions are missing it as well, so I'll do a
> > patch separate from this series to fix them all.
>
> But you need to fix them in this patch series. We do not add patches with=
 known
> issues, which are really easy to fix beforehand.

I'd say that's a preexisting thing, and code movement shouldn't change it.
But, yeah, I can send another patch fixing up all the kerneldoc issues
in both files.

ChenYu

> (And below seems you indirectly agrees on that)
>
> > > > + */
>
> ...
>
> > > > +/** of_regulator_dev_lookup - lookup a regulator device with devic=
e tree only
> > >
> > > Something went wrong with the indentation.
> >
> > Will fix, and also add a "Return" section.
>
> Thank you!
>
> > > > + * @dev: Device pointer for regulator supply lookup.
> > > > + * @supply: Supply name or regulator ID.
> > > > + *
> > > > + * If successful, returns a struct regulator_dev that corresponds =
to the name
> > > > + * @supply and with the embedded struct device refcount incremente=
d by one.
> > > > + * The refcount must be dropped by calling put_device().
> > > > + * On failure one of the following ERR-PTR-encoded values is retur=
ned:
> > > > + * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup co=
uld succeed
> > > > + * in the future.
> > > > + */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

