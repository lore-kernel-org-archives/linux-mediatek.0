Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9947CFC6184
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 23:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TI7TITmGzIQHc7WsNOaVJ244cb5V1Nwa651mKiB3q/E=; b=MRG/HMlg5SEM5Rqz5J/yQ9tVbc
	wMzQebZ9N5+W+spQaeIYy9FssamGwz6Y1zx31kQTf/Ipve9bhgzF0EC8kcaUPBu7grgYvIx5XyOAS
	9rLJ+qiuQjousvvXKtZcTU2FGqV9EttQqlfYV1KOK2HUajt206YgHA+twslCScS1elxpvI20vxTER
	yqpO25edzqYWGl+paOF4vXuK3YwlW+xKy11F+cRzwv9fp8+SpH056pBHKlUM7dJgIsup/LQKg0Bh8
	8cOkI0wnA+bg2oLs5ndo13N/2HxhJ5ciFZDtybEFN5NH6V10nqwVBF//fxvK+lVo21ifmphLIJ2si
	a2HvN1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spG2c-0000000HNYs-0sr7;
	Fri, 13 Sep 2024 23:49:30 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spG2Y-0000000HNYE-3cZd
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 23:49:28 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6c524b4a3aeso19270796d6.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 16:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726271365; x=1726876165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TI7TITmGzIQHc7WsNOaVJ244cb5V1Nwa651mKiB3q/E=;
        b=DuCt0m3nktwLoN+ZZTadqaBEnfvvjSFPa/14sVs7vHLeZgOxf1NGu7R/9s2GOHX9+T
         hFsVWydyMusoap6+wXgpiExj5xovoWQIeZ0jM4PykpZgP3FXiTlq4lrO71T6/9P2yWM8
         gtZgAXIgx3DAlgEsN/S37ON9G+gudrJgli3HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271365; x=1726876165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI7TITmGzIQHc7WsNOaVJ244cb5V1Nwa651mKiB3q/E=;
        b=ZkSFr5bJVkh2CiCw0RRs67PAYfz0eiEhyCs0VO2MZy11+abN1xgmiZaaXqbt2v2C/z
         4cQuyyNOQZoyLyHQ3vrdfjiRQLuKSUwasNar/+u0aYR+anRM8rkXZqiv4rDbIFwsOekc
         3/lzu8UKPTX3QqEQzQiTrnU8ObyqgUQGxRfqnwhzWrNy3Lv1mWkd6wFE8wmmwqaung3z
         LCfx1HBDohmFjudBcv4gDWnpfmQ9+YZ3jeku7pDkcfpxkADbRAXz0Q94mfF/Br02MNun
         roZOlxMP3jrKAHyGoiGtpDUekqoLbtXvWa582lRdqHB8FlRBM4ZN7o5hZBZgXkxcInI+
         wiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrWMf79ckF2C6APgw6da46AxZZ/CDFuW3KhjwwpGRoFUFAorBBr3zDdXTUXdRva/tIsYjIQvSg8vRPxbJ4rQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvbgwPBB7qIu8nnbrnkkz9/qxPtPyjJlJrElDusFUZytZCf78n
	c58xgo1hwa5Vks0CBNg9RVNTJj7uc0Yy8BGMSyak7nn+ck/RV0Z0M9rppl4yskAZJduYUshFrH4
	=
X-Google-Smtp-Source: AGHT+IGsvFJOiHF8YBL6Nlm8cI4QzyVtLADTCkawe/odJwzhvytIVtqeJI7ROA4R+gILT3joOLX8/w==
X-Received: by 2002:a0c:f208:0:b0:6c5:540c:82b0 with SMTP id 6a1803df08f44-6c57350c38amr111829666d6.4.1726271365021;
        Fri, 13 Sep 2024 16:49:25 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c64237asm1383886d6.64.2024.09.13.16.49.24
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:49:24 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a9ae8fc076so281232785a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 16:49:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVXO9s1i6nqB3XYNlOIJJW0aKFcRoNaaqjcv/HghZFFOxJs+F77Dp4w6lcQLlYvxHrVWaZwQPQy/1xLhBgRA==@lists.infradead.org
X-Received: by 2002:a05:6214:448c:b0:6c3:5599:93a0 with SMTP id
 6a1803df08f44-6c57347d602mr144060086d6.0.1726271006617; Fri, 13 Sep 2024
 16:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-9-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-9-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
Message-ID: <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240913_164926_926459_158EAB58 
X-CRM114-Status: GOOD (  17.93  )
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

On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> +static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c_o=
f_probe_simple_ctx *ctx)
> +{
> +       int ret;
> +
> +       if (!ctx->gpiod)
> +               return 0;
> +
> +       dev_dbg(dev, "Setting GPIO\n");
> +
> +       ret =3D gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_hi=
gh_to_enable ? 1 : 0);
> +       if (ret)
> +               return ret;
> +
> +       msleep(ctx->opts->post_reset_deassert_delay_ms);

Like in the previous patch, you need an "if
(ctx->opts->post_reset_deassert_delay_ms)" before the msleep().


> +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct =
i2c_of_probe_simple_ctx *ctx)
> +{
> +       if (!ctx->gpiod)
> +               return;
> +
> +       dev_dbg(dev, "Setting GPIO to input\n");
> +
> +       gpiod_direction_input(ctx->gpiod);

This is weird. Why set it to input?


> @@ -347,6 +438,7 @@ int i2c_of_probe_simple_cleanup(struct device *dev, v=
oid *data)
>  {
>         struct i2c_of_probe_simple_ctx *ctx =3D data;
>
> +       i2c_of_probe_simple_disable_gpio(dev, ctx);

Maybe add a comment before the GPIO call that it's a noop if we found
something and i2c_of_probe_simple_free_res_early() was already called?
Otherwise you need to read into the function to understand why this
doesn't crash if the early call was made. To me, that makes the
abstraction add confusion instead of simplifying things.


> @@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, const =
struct i2c_of_probe_cfg *cf
>   * struct i2c_of_probe_simple_opts - Options for simple I2C component pr=
ober callbacks
>   * @res_node_compatible: Compatible string of device node to retrieve re=
sources from.
>   * @supply_name: Name of regulator supply.
> + * @gpio_name: Name of GPIO.

Talk about the fact that gpio_name can be NULL or an empty string and
that they mean different things.


>   * @post_power_on_delay_ms: Delay in ms after regulators are powered on.=
 Passed to msleep().
> + * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Passe=
d to msleep().
> + * @gpio_high_to_enable: %true if GPIO should be set to electrical high =
to enable component.

Now that you've added the GPIOs and more delays, the description of
this structure needs to list exactly what the power sequence your
simple functions assume.

I would also say: given that you're providing a parameter anyway and
you're giving the GPIO name, can you please move away from the "raw"
values and move to "logical" values?

