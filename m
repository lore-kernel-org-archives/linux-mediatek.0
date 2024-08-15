Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEBDC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Aug 2024 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5h80tcGsfqjYM1UFpSbRtoNZZUnUPL2z1uKz9S/Kkk=; b=GHWDQ1aZvEVO132zD4Mc+6oKy6
	2wSVf5MV3PFXpXnla4xOxC2N1Fei3mWR3+OhlkvBHFeHMGtM6bQm3OYwpPTBTp+pUqfrwEkcuraQn
	w7+YHScVjlmrQwC1rhwHSIPEiC3Xpvv3sjZFzc2xDRHfyrlNY/G1CXRzDlxhJ6IPphcEvJFmoaTSO
	WO1/1v66l5gza+pcawVGWmEPeW/pcwQC0hIFtdb1ibJl1f9yb+mVr/7muT3+imUlb5w6sllDgextn
	c7RaJCE5UC/SRqfsAbyEPEx55ANCIUaoTmFmxweKG6+iIb9gxDji4VVtbHuBVz0Y4cUyPYpyibqvD
	HSVaBR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seXCf-00000009WXW-1Vlr;
	Thu, 15 Aug 2024 09:55:33 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seXCb-00000009WWC-0rrn
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Aug 2024 09:55:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5314c6dbaa5so983937e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Aug 2024 02:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723715727; x=1724320527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5h80tcGsfqjYM1UFpSbRtoNZZUnUPL2z1uKz9S/Kkk=;
        b=JUyjLsLxNNMBKiYm6IOUnnx9xJl3JOpcBzO7P4wgcYp0mDIhcfB25/P9uIWFV9oK17
         qDGDfpa6NrZGDFW1qtWpP8yN5jfFJ78rXd7dLrGGxSIhMv93jDcL/zEKe90Nhr3aI51t
         HaYXJuvjKB5+Fa3bczOZZh1rJWLo4aOg2fnm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723715727; x=1724320527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5h80tcGsfqjYM1UFpSbRtoNZZUnUPL2z1uKz9S/Kkk=;
        b=QyG/Bf0NWYcI9Kn5nMvW/9Cm9hv5TBDQAjXNeUZxx9pBD5fVSH9KjEtX3AOANRJgRz
         F/MdE0Eo8W/DKzOUdL+ryzxA2CVr+KLFNZ+IG77E9X/faGwbtAHFxqAuvl77DcG8+kVv
         bpyD2TN0R2eqHQYT8C65g2vcehY1ectui/AxLZSPEo7I4NjBSb2ypdHiyt/ixxhcy42u
         YoteUzd5Dpi+0cPqzdFRlNPbEoi8E4XrjbbTG7wrT8mdrOFbls2cRpkfW9NJFIG3hce/
         SsAB6JxH3h/9lx7/7C8yTwBY2tvUYIQ7Tb7rCKbhBItgx//aH8/QtHC1JJyh6jbOkOU5
         lBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOaHRErOfv/M7plwscaJr9glOtBc4aCAk6DwV09rZcfV7UjhIPIMYYdJ1Jw6loFVpIy/KC4F7iLGoslkjuGqFIlf0iT1ioCn8tU82iNy5zNz/M
X-Gm-Message-State: AOJu0YxejEBhlis2eUO8Ki7AKfiuq/1CMroKyVm23pZpDUgZtlL/SKZW
	L0CwkkMpMrz8b9W+eb/xzTOhTMIf4yuHEnUOnngqISRr3SFFQMd+tnd3JrORm+903CfzLV/IoEV
	Ei65tyj6slAK9SepsRl9f6jzTIJ93Az3OsKVf
X-Google-Smtp-Source: AGHT+IHk5D9Axhf7aH2jIvdVPiigXA+7hFBYb9TbjKDhBcQ8ihLDumNSY3TL20N3WQe0JURETR/Gp6xRXUf3bXq00mc=
X-Received: by 2002:a05:6512:2351:b0:52c:a0b8:4dc0 with SMTP id
 2adb3069b0e04-532edbc076amr3321287e87.28.1723715726777; Thu, 15 Aug 2024
 02:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240808095931.2649657-1-wenst@chromium.org> <20240808095931.2649657-4-wenst@chromium.org>
 <ZrtC4Q4N_3x2KTNb@smile.fi.intel.com>
In-Reply-To: <ZrtC4Q4N_3x2KTNb@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Aug 2024 17:55:15 +0800
Message-ID: <CAGXv+5GfCcft4+no1dTVRa3Sx7XbiufjSqJb4UPRc9yZv3b+rQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] i2c: Introduce OF component probe function
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
X-CRM114-CacheID: sfid-20240815_025529_298581_30D14C30 
X-CRM114-Status: GOOD (  38.36  )
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

On Tue, Aug 13, 2024 at 7:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 08, 2024 at 05:59:26PM +0800, Chen-Yu Tsai wrote:
> > Some devices are designed and manufactured with some components having
> > multiple drop-in replacement options. These components are often
> > connected to the mainboard via ribbon cables, having the same signals
> > and pin assignments across all options. These may include the display
> > panel and touchscreen on laptops and tablets, and the trackpad on
> > laptops. Sometimes which component option is used in a particular devic=
e
> > can be detected by some firmware provided identifier, other times that
> > information is not available, and the kernel has to try to probe each
> > device.
> >
> > This change attempts to make the "probe each device" case cleaner. The
> > current approach is to have all options added and enabled in the device
> > tree. The kernel would then bind each device and run each driver's prob=
e
> > function. This works, but has been broken before due to the introductio=
n
> > of asynchronous probing, causing multiple instances requesting "shared"
> > resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> > time, with only one instance succeeding. Work arounds for these include
> > moving the pinmux to the parent I2C controller, using GPIO hogs or
> > pinmux settings to keep the GPIO pins in some fixed configuration, and
> > requesting the interrupt line very late. Such configurations can be see=
n
> > on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> > Lenovo Thinkpad 13S.
> >
> > Instead of this delicate dance between drivers and device tree quirks,
> > this change introduces a simple I2C component probe. function For a
> > given class of devices on the same I2C bus, it will go through all of
> > them, doing a simple I2C read transfer and see which one of them respon=
ds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree. The
> > status for all the device nodes for the component options must be set
> > to "failed-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > +int i2c_of_probe_component(struct device *dev, const char *type)
>
> Use respective scoped variants and remove the related of_node_put() calls=
.

Ack. Will also try splitting and reworking the code so they have
tighter scopes.

> ...
>
> > +             ocs =3D kzalloc(sizeof(*ocs), GFP_KERNEL);
>
> Use __free()

This ends up only a bit better than with gotos once this small section
is split out into a helper function.

AFAIK ocs, or at least the underlying properties, have to be left around
once the changeset is applied as they are now part of the dynamic live
tree. And that's fine since once applied, nothing is going to un-apply
it. OTOH in the error path it needs extra cleanup if any actions were
added.

So I end up with the following to silence the "must check return value"
warning on success, and cleanup on error:

ret =3D of_changeset_apply(ocs);
if (!ret) {
        void *ptr __always_unused =3D no_free_ptr(ocs);
} else {
        of_changeset_destroy(ocs);
}

In my case it might actually be safe to do of_changeset_destroy(ocs) and
free it regardless, but I'm not really confident.


ChenYu



> > +             if (!ocs) {
> > +                     ret =3D -ENOMEM;
> > +                     goto err_put_node;
> > +             }
>
> > +err_free_ocs:
> > +     kfree(ocs);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

