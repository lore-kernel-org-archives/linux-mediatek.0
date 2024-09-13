Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB4EFC6172
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 23:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGpao8Kwq4txpjKiG0IecbBKjp+Vjjk+9Rmjd0MdGw0=; b=Akm4sS3sFMtdkTMr7BCJ4j/xXH
	r2OiL1JoDoAztV4fDKV0qGXywGsOKIpAydiCPMXkQspviyTyFqqHhj1KlvnFnjfSda+vM1vqH9uoI
	1uoKJmYhjLPrF/vh2eG2hrPA2mHmIhRdRJovT5XbBu8CdEq+yddH1v5qh4xe5Mma70HvUB9mv+l4c
	x4O0I/ve1jTQDtmbMIER8qwNBCnG3fUdS2GOGrJDwHtxKpGKv0s4IAWft7UAC606yFaANico9WiEw
	R9SAvJL+DUPgW74kutqS3RZ1HsFrtQUjyqZ9E0JDN+wNeIYBl5X1QIJnV8WKI+QwT1ckWA9L1cGpM
	9FpcNj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spFyo-0000000HNIV-1lWB;
	Fri, 13 Sep 2024 23:45:34 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spFwt-0000000HN0G-3GIF
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 23:43:37 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6c524b4a3aeso19239976d6.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 16:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726271010; x=1726875810; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGpao8Kwq4txpjKiG0IecbBKjp+Vjjk+9Rmjd0MdGw0=;
        b=QbQHhgjGZS9eD/P0IIEmkdYyTRsWhpfm+iABz0ccj8hwv629zOprZbWsmbqAqOCcnw
         JZq69tBe/FPF7Eg5ffdMpbhLnokoA5E7+ZGyheI1svFfghXRcK+04783xLcVrYGVX2FW
         XG0ITosAU9SIU1ZuiTb+em71GMU1uVwoIm42U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271010; x=1726875810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGpao8Kwq4txpjKiG0IecbBKjp+Vjjk+9Rmjd0MdGw0=;
        b=kowQO/eWDTjSiRznl8CeDtT2yk1DuWajwaNOY76lHVZ5mTGSlmfsA6GCEfBEIniMOO
         63rRoajgqnmLDh6vsdrOKTwtG3veyWw4Fi0nfPidYx/CHxtwAVwCuCqPCmBfpiNujLnJ
         y3Ph+PWWQeS4y0w5I0vOQP1x6BVqBazPm6aEzTLzVNYzCBR3Bu5PHyMQfJ9mBIzzkOe3
         mBKUmFwo42nCSR5uhVd0Va8e0Xaf6DrSo8/rSGl7PpNRE3gkioMVKhwMqhXfrCKao0eh
         7XAgCmF4XtmuCwgO3ltTsxww+CeHbRYxpB8HMKsDsrYOs8P7cuZbfKvmf8iK/2Od828x
         Sg8A==
X-Forwarded-Encrypted: i=1; AJvYcCXJbIJmEdP8W0Io4ZX/Msc+j3iLSbAYvzYv4+0c6cFzESRNXKce1O2apzOcgfkEeLTgrERCGNx7m86WnKhEaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeE2njME6oBQvt/UivnyEMqUdPV8omiUumhVtY5oti2B0VSgVk
	h9nYKoDkwmOToD9h4hWfo/DY5x7nEAhp2HQ43xCY6zPXOM+9xYKusfcw1pcFoVFp95XQRWLn8tA
	=
X-Google-Smtp-Source: AGHT+IEO1EjiZbmvaZWyvUCwQQ9oxSwPdyAm8hJb4tapglLNzdCqGa7bMIW5Stoedhy8egCO0xOy/g==
X-Received: by 2002:a05:6214:588a:b0:6c5:1667:baa2 with SMTP id 6a1803df08f44-6c5735198f8mr113157556d6.18.1726271009608;
        Fri, 13 Sep 2024 16:43:29 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c691a97sm1319636d6.86.2024.09.13.16.43.23
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:43:24 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6c524b4a3aeso19238716d6.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 16:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWGPhTPv4UlkAVVCnElu6jtk5C96hCRPEWGpB/rlTJshoN8uKt65jj3SwzFf892+ibV9i/zxxWrfL6di6muw==@lists.infradead.org
X-Received: by 2002:a05:6214:390a:b0:6bf:7d3c:a64d with SMTP id
 6a1803df08f44-6c573570b31mr113649466d6.32.1726271002581; Fri, 13 Sep 2024
 16:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-8-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-8-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VL3nA8hwC8Ejy9T0ZWdYKxMjts8fgF7Y3CO507njOKkg@mail.gmail.com>
Message-ID: <CAD=FV=VL3nA8hwC8Ejy9T0ZWdYKxMjts8fgF7Y3CO507njOKkg@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] i2c: of-prober: Add simple helpers for regulator support
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
X-CRM114-CacheID: sfid-20240913_164335_829886_70CDF603 
X-CRM114-Status: GOOD (  21.69  )
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

On Wed, Sep 11, 2024 at 12:28=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> +static int i2c_of_probe_simple_enable_regulator(struct device *dev, stru=
ct i2c_of_probe_simple_ctx *ctx)
> +{
> +       int ret;
> +
> +       if (!ctx->supply)
> +               return 0;
> +
> +       dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->sup=
ply_name);
> +
> +       ret =3D regulator_enable(ctx->supply);
> +       if (ret)
> +               return ret;
> +
> +       msleep(ctx->opts->post_power_on_delay_ms);

Presumably you want an "if (ctx->opts->post_power_on_delay_ms)" before
the call to msleep() since it doesn't check that for you.


> +/**
> + * i2c_of_probe_simple_enable - Enable resources for I2C OF prober simpl=
e helpers
> + * @dev: Pointer to the &struct device of the caller, only used for dev_=
printk() messages
> + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> + *
> + * If a regulator supply was found, enable that regulator.
> + *
> + * Return: %0 on success or no-op, or a negative error number on failure=
.
> + */
> +int i2c_of_probe_simple_enable(struct device *dev, void *data)
> +{
> +       struct i2c_of_probe_simple_ctx *ctx =3D data;
> +       int ret;
> +
> +       ret =3D i2c_of_probe_simple_enable_regulator(dev, ctx);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

Instead of the above, just:

return i2c_of_probe_simple_enable_regulator(dev, ctx);

I guess maybe you'd have to undo it in the next patch, but it does
make this patch stand by itself better..

Although I'd also say that if it were me I might just get rid of the
helpers and inline the stuff. The helpers don't _really_ add too much.
3 of the 4 callers are just simple wrappers of the helper and I don't
think it would be terrible to inline the last one. I guess with the
next patch when you add GPIOs it maybe makes more sense, but even then
it feels like a stretch to me. Anyway, feel free to ignore if you
want.

> +/**
> + * DOC: I2C OF component prober simple helpers
> + *
> + * Components such as trackpads are commonly connected to a devices base=
board
> + * with a 6-pin ribbon cable. That gives at most one voltage supply and =
one
> + * GPIO besides the I2C bus, interrupt pin, and common ground. Touchscre=
ens,

Maybe speculate here that the GPIO is often an enable or reset line?
Otherwise you leave the reader wondering what this mysterious GPIO is
for.

