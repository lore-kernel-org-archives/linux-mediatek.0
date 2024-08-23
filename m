Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4FAC52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TB2ZVz2m724zZx6Ujp8dGDELTqfijkJibPZvF/Zp9rA=; b=WOERudAyNoIXzvf4r/YBu1VrKu
	JxoWCYNIrZHcmvjK8YcR+mgaTVmhOHcZKifHtsMD8ee+gDRqUCKtqyJyfN682c0LrTvYB+r0ttDvz
	JtpWVhCHO73jv0EvcL/K0T/F5e5PSuHsElyZ0uXDJg0Hft8xj7eblR05CXSGwoowuBZygOqhYgd7d
	wzZSs+5279GswoLT6mQ55EUgUUI910vBJ6YL8PY6OnXtobmz7+yHADYjBhYcqwtlU481UDaKmFe31
	P4mFSI37ZQVupvsPKSNhkD7SskY1KKiwatc/5M47g6F4B3EySxASIVL+oB/5Nzfo7B85QtICOT3p5
	G3UG1GRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shO8S-0000000FWom-2eKy;
	Fri, 23 Aug 2024 06:51:00 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shO7g-0000000FWdu-44Yb
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 06:50:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5342109d726so672433e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724395811; x=1725000611; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB2ZVz2m724zZx6Ujp8dGDELTqfijkJibPZvF/Zp9rA=;
        b=CoF7IPigaosmuMJrCxMMK1np95wNEQ52smBIetFv8mGkfD5xdwKFomqG+VeuG/d9XC
         PVpK4oqRBqHmd8N/hkA7T5F4dKS6aFSInkanDslxNO4pQqfnH8BcCaN5Dwy6EYfLTacf
         0NRsy+y7Srzd9qfsTM3GL77ku5KCCCcwYWRn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724395811; x=1725000611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB2ZVz2m724zZx6Ujp8dGDELTqfijkJibPZvF/Zp9rA=;
        b=sphAWHLHEBQIB2hgfYJ3hGa0StwCV2lKFB9C3g5rsZgTDeGppYVVZIDqPqJIvmR2xE
         cqepmjnhJsrl6XPVypuXwFxnNxbUW1Nc+m8mVMPfS4EiGbAMYk2X8D7P7ySxB7MR8V6i
         XQk14LdvNLLOkbcF9CNc1rU/2hVb+N2P2HUjL2UB7h9CEqpDljc0oAf5pgAw/ooo7VN2
         7PSk4I22oRvZY+Gavpe31s4lfmN7X6yVn2XSH8YCinLa5H9ivIgU8lYRrENNwoYBEfbr
         t1EcIF5EvMjbK7KXPmNJIxtjHUjix3ZzCxAccSb//OmDX5gfz57wy+H3qukmH23R2cGb
         OxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVafzpF5AAUVcZMwU/D3MBx8bPGfdiGAqtMcgaVmbkdnqUn4xn/ANPezqWqUbcYcWD2XdvbOoeF1L46CmFyoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS87Tqr+BCRlZnFGvc6nFkJjhOVniGwit4y3mzXGrEabzYXZ44
	5C1BGN7znFnr9s6Ki+lVcinKBQbObn65P0Ydxlk7HMVwegTgOK01IIbkuSE/MCQv2oQaVMMInOR
	dLncdnVLz/YBYuFThxoErF57ylMOo7kkAQOVK
X-Google-Smtp-Source: AGHT+IGa3g4OYj5kLrZwDfDw6Q/Usbiq0edBIdEx656twbCcRzHHZoU+PFE0vnmEsF1p09zxCx1iToHq1XRcOx6R0cA=
X-Received: by 2002:a05:6512:3052:b0:533:4613:21be with SMTP id
 2adb3069b0e04-5334ca861e8mr1890209e87.18.1724395810568; Thu, 22 Aug 2024
 23:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-3-wenst@chromium.org>
 <ZsdBddTDuvNasHNq@smile.fi.intel.com>
In-Reply-To: <ZsdBddTDuvNasHNq@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 14:49:59 +0800
Message-ID: <CAGXv+5FjwxGQgV6SdLfTeNRYbpcgwkEnCWvaZiWh4rs3bhs-2A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240822_235013_066950_7F922E55 
X-CRM114-Status: GOOD (  25.23  )
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

On Thu, Aug 22, 2024 at 9:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:55PM +0800, Chen-Yu Tsai wrote:
> > There's still a bit of OF-specific code in the regulator device lookup
> > function.
> >
> > Move those bits of code over to of_regulator.c, and create a new
> > function of_regulator_dev_lookup() to encapsulate the code moved out of
> > regulator_dev_lookup().
> >
> > Also mark of_find_regulator_by_node() as static, since there are no
> > other users in other compile units.
> >
> > There are no functional changes.
>
> ...
>
> > +/**
> > + * of_get_child_regulator - get a child regulator device node
> > + * based on supply name
> > + * @parent: Parent device node
> > + * @prop_name: Combination regulator supply name and "-supply"
> > + *
> > + * Traverse all child nodes.
> > + * Extract the child regulator device node corresponding to the supply=
 name.
> > + * returns the device node corresponding to the regulator if found, el=
se
> > + * returns NULL.
>
> At the same time you may fix kernel-doc warnings (no "Return" section) in=
 these
> three (on your wish you may fix others in a separate change, but it's not
> related to this series).

As you said some other functions are missing it as well, so I'll do a
patch separate from this series to fix them all.

> > + */
>
> ...
>
> > +/** of_regulator_dev_lookup - lookup a regulator device with device tr=
ee only
>
> Something went wrong with the indentation.

Will fix, and also add a "Return" section.


Thanks
ChenYu

> > + * @dev: Device pointer for regulator supply lookup.
> > + * @supply: Supply name or regulator ID.
> > + *
> > + * If successful, returns a struct regulator_dev that corresponds to t=
he name
> > + * @supply and with the embedded struct device refcount incremented by=
 one.
> > + * The refcount must be dropped by calling put_device().
> > + * On failure one of the following ERR-PTR-encoded values is returned:
> > + * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could =
succeed
> > + * in the future.
> > + */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

