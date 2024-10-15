Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A62CFC26E
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSQe+OWkJptNhalICgZHHnWYpzgrAnYhHgBYOyd2y2A=; b=su6UwG17xLK9kbV3MxooeDuXh8
	VVFjp5gvBrfkzZ5DvjcYBun0B1QCcH4gR7ddwghmlVWXDGOp2McNvfH9vYcYjpXGEFmzoM3R8oXnS
	3cXvnSuYosRCZlwjXhGJJKtKTMVHueD4M+tOjOvRZLmw5m9Uz6Prf7guGYcHADwdSanSrftham4/d
	DbZnBSuyHtqD5oCNfHctuq7+LO7Zp0TLzuLRb+n/dywoJHnygdthJqdlW4YNcCNf23cmjWvx/AZWQ
	OMF9N5l+DvAL8eI59RWOxoWVL+qcb+ZQC+WxNcNpbaSdX3LJDbkrtbziGmMmYwk8TTgTj6QgqnzoO
	PwZqObDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0bK8-00000007Fki-0Y9H;
	Tue, 15 Oct 2024 06:46:28 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0b7E-00000007E2j-0VOD
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 06:33:09 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2395294e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 23:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728973986; x=1729578786; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSQe+OWkJptNhalICgZHHnWYpzgrAnYhHgBYOyd2y2A=;
        b=Mjm2TwUjF8tVeV60WrV7sEuGsVw1Qg2pNkwASz3Sqi/gL8+krGRVopeim3B2qz7Ojv
         qu53BDgEFLuouNJFo6ol82usE+9rR1VonFuhjvNy4zui+Yi6HnpDCEQwUXumjq0Uq7Zc
         qXzLMJKPO8yUQOPPM+IQfqOdY0oTjUm2l4cwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728973986; x=1729578786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSQe+OWkJptNhalICgZHHnWYpzgrAnYhHgBYOyd2y2A=;
        b=QtLIekAt4wbJFQ5gKcPpSYOkiwRUg+Nf7xly99ns6V5sEsoQL/n5pYb1Cvj1lLTFE2
         UuzAvLu3p0G9qTWYOQkSOOV0i14tNetQw4sEbMMcO9hLlwoZ5xCKUers2FMo5b7p2N99
         APXfhabWHvlnYDI0+c+hj+BxpdI7CAniIYAPGZinQ5ThaZD5w/ukk4c8M7Ips1/uI9Av
         Y8aEkja3paAwl5eSKTJCSZwlG3ykSWxgIwe/fQ8XUhUY4WPP3PQ7e5BL2RqMkWR0YZAK
         iWb3u/x1iDJoT12KJu7jVpr9VfPu9qyJQmct71oO/GbGcpkdTK4VvjbDNKaAM/YqWVvj
         orcA==
X-Forwarded-Encrypted: i=1; AJvYcCWBPfPn9iKziQLpwUPsP/IKWsjxtYkZHoyei9kJR0s6+9uR+bm0LIWepGCa8sZhhJEHuTP7xZESWw+qp5j0gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzys3u5TLU1AI9uDFrEoTE2LvI8x+ZsXFli/Pv2SI5Ck7tpRag4
	ebLOP1YPP1ZaCDKnaWCHz3+YkvyOR2ITQijHN8p2cmCEygaMwzyICI66/bwBKFMtKZWNcbZr1cA
	uAmD7vwL7n4aXMrXPAwgyAj5AyY853DwuUIzq
X-Google-Smtp-Source: AGHT+IEi5VM5BInri+Xle/NpCFhUkRIBDd77CTdk9H6/daGndiGJT4jSou7J34vtaK0aKDEUC8sIsGSEXiAysfqU1+Q=
X-Received: by 2002:a05:6512:2396:b0:539:eb82:d453 with SMTP id
 2adb3069b0e04-539eb82d67dmr3760676e87.39.1728973986262; Mon, 14 Oct 2024
 23:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com> <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
 <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com> <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com>
In-Reply-To: <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 14:32:54 +0800
Message-ID: <CAGXv+5H0Yvt1cwPOim-quT3C+=s9NapnryJhNxs_QW=DAyAycQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241014_233308_212874_B86AC9E0 
X-CRM114-Status: GOOD (  20.61  )
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

On Mon, Oct 14, 2024 at 7:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 14, 2024 at 12:56:20PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Oct 10, 2024 at 11:32=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > > +   .cfg =3D &chromeos_i2c_probe_simple_trackpad_cfg,
> > > >
> > > >       .cfg =3D DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simpl=
e_ops),
> > > >
> > > > Or even
> > > >
> > > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                     =
   \
> > > >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> >
> > I'm not inclined on using compound literals here. "simple X cfg" will
> > likely get shared between multiple |chromeos_i2c_probe_data| entries,
> > and AFAIK the toolchain can't merge them. So we would end up with one
> > compound literal per entry, even if their contents are the same.
>
> I'm not sure I follow, you are using compound literal _already_.
> How does my proposal change that?

I'm using it where it makes sense, i.e. where the embedded variable
is not going to be shared with other instances.

For the dumb probers, there's only going to be one instance per "type".

For the simple probers, the config part is still one instance per "type",
but the parameters are board and component specific. There will be
multiple instances. Hence the config part can be shared, while the
parameters likely won't be.

> > > With that also looking at the above
> > >
> > > #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                         =
   \
> > >         DEFINE_I2C_OF_PROBE_CFG(type, NULL)
> >
> > For the "dumb" case it makes sense though, since it would be one instan=
ce
> > per type. But we could go further and just wrap the whole
> > |chromeos_i2c_probe_data| declaration.
>
> Maybe it's too far from now...

This is what I have:

#define DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(_type)
                        \
       static const struct chromeos_i2c_probe_data
chromeos_i2c_probe_dumb_ ## _type =3D {       \
               .cfg =3D &(const struct i2c_of_probe_cfg) {
                        \
                       .type =3D #_type,
                        \
               },
                        \
};

DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(touchscreen);


ChenYu

