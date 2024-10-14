Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596CACF2590
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 04:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9mFtNqYh9KUexI71xOhNoOB0u6iXKtOOnwmm3eW4KA=; b=UEWEm4qFEkpLl19q1M7HjjDBVs
	nXmf94E2b+oNqH0iPBLT2ps9qdwwn/dq5FHUAzDXWj3xvoHJrQ4M0XBQKdBVZG019Xs1/jzXJZgTx
	IUn7u7rc7sbwTpjEUQ5EFF5V0Z4p+vMb1ugxqcb7lVhlsRwuRSt9aw6NstolIKTBiRsWXEFv7Bmms
	VW0x8jy2YFUk9+/77ygcCJu7nkvHHZYgaRIa0Fgb5xLDmUqhA5i2f43b3/bFykDeI+I2Zksu9d02T
	v8CTm1z8LnQ0t+vhZuIPWpRZjMKb6WAMalWUKs/Lcg3NhWPAdxYJdoQSs9xHtbd/dx4DJejS1wxKY
	d1dvHQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0D9d-00000003kfV-1Rtl;
	Mon, 14 Oct 2024 04:58:01 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0D8F-00000003kXo-000R
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 04:56:36 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f7606199so406253e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 21:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728881792; x=1729486592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9mFtNqYh9KUexI71xOhNoOB0u6iXKtOOnwmm3eW4KA=;
        b=EaUGJ/g0v6MU14AlkzQ60kHw+3a+q3g+APK1rFbuDxQD8J1ZSmsMK7mot0MWBjlOZm
         HpZLpVJrY22dh0GykGI0d0kdQQanBRLwHTEL7P6L4z4sVFS9K+38i3Xss3fS5ip9Kupb
         k+h+9yy/hNwLgjfoEz9TCZWgh5hFxvo5+s2i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728881792; x=1729486592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9mFtNqYh9KUexI71xOhNoOB0u6iXKtOOnwmm3eW4KA=;
        b=HNZo9r/TD2M1VzYxjc5UqlMoLY5xnLpcyY+snRyOEC2r4quRZiZY3zwc1a12tMIl0N
         8dZ+jzzjhFgk2lvdUHt1No4T7x3HJ/doH3VP/FwLJeOURchzboIO4r89U+AARIKi584w
         DlE9cq/tV76qsEsi2UnlM1L+3/1eqJ6Nnk8ydALSHa7ycIT7xfmImy/Jcw+PusmEd5Yh
         8C0kMdSo9V3EheCfujG5TetqlznAzQcMRN+3aZJqO79v5cgEuaRkli7PYFA7FIV/C5Me
         lDGuQjehC8iiMQVUQHrsLc2wCaWIKRSVnyFFruqCLsLGgSEbVljWc8tSCa6T5Ip+GqUs
         mzUg==
X-Forwarded-Encrypted: i=1; AJvYcCWYnI+Hq6PkrrUfHRsJqAk464FtxSedVJIA7cBVjvrziYwq1zB1Yk9gOpbbYHYG2BHz/vb158CTpdERuLLx+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOkyWeO3MdVuD0Ml++O2gev1r0gaR6PH6cl/NNM1pX/mvA6kmc
	uPoNS2P4nzH8xfxqMwICHbjSJ8X0kpiTnZHLEdTakZrfOXclCOSxFLCPSSLhutD3JvH8wU4V+eW
	iN9HZHcnnk/MjNqa2AmYlUwtlQqMx7nTxt+FR
X-Google-Smtp-Source: AGHT+IHhR8KAjvYTJxUr2lWhSCMmkKSBa/eO8EdYJtU/6/vYtzRfFH677PpHu0f+4UfTQZcguYvFpFsxHDu0B8cJTi8=
X-Received: by 2002:a05:6512:4204:b0:539:e3d8:fa33 with SMTP id
 2adb3069b0e04-539e3d8fcd6mr2914559e87.54.1728881791743; Sun, 13 Oct 2024
 21:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com> <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
In-Reply-To: <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 12:56:20 +0800
Message-ID: <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware prober
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_215635_101318_88AB6390 
X-CRM114-Status: GOOD (  17.30  )
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

On Thu, Oct 10, 2024 at 11:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_=
touchscreen =3D {
> > > +   .cfg =3D &(const struct i2c_of_probe_cfg) {
> >
> > Perhaps you can introduce something like
> >
> > #define DEFINE_I2C_OF_PROBE_CFG(_type_, _ops_)                \
> >       (struct ...) {                                  \
> >               .ops =3D _ops_,                           \
> >               .type =3D #_type_,                        \
> >       }
> >
> > and use it here as
> >
> >       .cfg =3D DEFINE_I2C_OF_PROBE_CFG(touchscreen, NULL),
> >
> > > +           .type =3D "touchscreen"
> >
> > Ditto.
>
> This was for leaving trailing comma.

Ack.

> > > +   }
> >
> > Ditto.
> >
> > > +};
> > > +
> > > +static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_track=
pad_cfg =3D {
> > > +   .ops =3D &i2c_of_probe_simple_ops,
> > > +   .type =3D "trackpad"
> >
> > Leave a comma.

Ack

> > > +};
>
> ...
>
> > > +   .cfg =3D &chromeos_i2c_probe_simple_trackpad_cfg,
> >
> >       .cfg =3D DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_op=
s),
> >
> > Or even
> >
> > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                        \
> >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)

I'm not inclined on using compound literals here. "simple X cfg" will
likely get shared between multiple |chromeos_i2c_probe_data| entries,
and AFAIK the toolchain can't merge them. So we would end up with one
compound literal per entry, even if their contents are the same.

> With that also looking at the above
>
> #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                            \
>         DEFINE_I2C_OF_PROBE_CFG(type, NULL)

For the "dumb" case it makes sense though, since it would be one instance
per type. But we could go further and just wrap the whole
|chromeos_i2c_probe_data| declaration.


ChenYu

