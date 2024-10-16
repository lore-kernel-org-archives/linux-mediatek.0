Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F3FD206AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 07:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QN7AKsuA98PPPT8uDMCj6K1ZQtwWhhEOz7w0/8n7gmE=; b=NU2Xxd6wKJuvgG+3bUJHRQbrZ0
	o0Y0rrn0PZUANgqj4gtm9kGrybeIxajSeLsRveV78j9Uihn7SGmvSRLrh8tB9V5zX7UxUQ52SiERo
	ykYk7qOXIYIuZdFdysLcVp5g2BVxtjYeR45hU8Hn0mllA/Ob7UGjIGHJCw8u/+LIyLrdw70sqLnMs
	815U6kTJ/2cX2/KCHuEE3B3lnFKi0FLBcV25kpwFeUewgYQRd+GMbGqylEIwe6DHan/43LrBDJGyU
	PIvXpmuVyhRyDgWkJoALw+VU/whJFWz+noMTGdtXslIfGYnDRkkG2xKL1k11t+01VbIarZii6BTZ3
	gJ1C5Qxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ynj-0000000AtMx-09rk;
	Wed, 16 Oct 2024 07:50:35 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ymV-0000000At3N-1Ltl
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 07:49:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f72c913aso3449557e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 00:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729064957; x=1729669757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN7AKsuA98PPPT8uDMCj6K1ZQtwWhhEOz7w0/8n7gmE=;
        b=ZSt136RzSo4usq3DFpFb2xOWmNJw5/tUk6YiKsfHM04+MU8lcjNb1dzNXbPWkWMtDJ
         oORwdshSwRWZmsyqEVbpAzaoyRqsGAwu1T9ZucI3lugWn11r+0UD3aTAcYlAKvoVlbWA
         oU/ezU1Ky+VsxoiIF9e+QX6dyMkkXmRKwNvuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064957; x=1729669757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QN7AKsuA98PPPT8uDMCj6K1ZQtwWhhEOz7w0/8n7gmE=;
        b=N1hzwdfXk3bMYACvnf/o7n/zGnDWdQNG3PdvzcRxR8XGxCw7JveRlW86BSkgvcHkiC
         4IjQKa+MIL4LPoE5GeNZvlSUYgkzMoZ21XImibdo0l/ZVaXC89T7gRdJVdIkQNMc+9oS
         m8akmv3nXYffOQHAYi4Aqe8nN6YJqGtkjAcSRr53dC5K0YaVFcGJI24UnhdYdPOxFJla
         vlIgknauoR0v9tB8jCYqRkND/VaEtn5pLffNqT72mXb9CiQitymoZQ2XMJNpJGXRKoLm
         6uBEbbXullixhdZQC/kbWH0vd0r0up5jMnhJfr2bwnAia++80R5+vYvQrLdKYA1B3bW4
         l77Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvcDOKpSdmWDvj3fwm0Ctq1ZXF5im0IXjvT2bHLgA+SQ33e3XfeHcMh9bA3+aHXs3ZpyA82maNzB5HAi8KPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyefd9XhVzjxVcjFCMvBC0te0xHPd4+mQUvmprX2m/7DVgE7IuR
	AVEIXcJH8aTI81VFXPtcXUchl1YapW4HZFKtfKCuioojKdOey2cN74r+9RSyPY7bH1mA1ci+cRr
	ApjLkJ0F4XGVl97NS66+mKfq03B8JY4NgFojX
X-Google-Smtp-Source: AGHT+IHvTkwvjhIgGqx3Y94zbgKp7DdoAxdd+wPihZcQpAEuvOqZHroRtSnL6ezi7qQpWv1axzh0aG7P3lW1zmgXUYU=
X-Received: by 2002:a05:6512:b08:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-53a03ea078amr2069607e87.0.1729064956730; Wed, 16 Oct 2024
 00:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
In-Reply-To: <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 15:49:05 +0800
Message-ID: <CAGXv+5FTdNqK14OYe=PN5_BcF9Ve7-FyBTKz=mJ+1QiiUzu0_Q@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_004919_407678_44CCEA26 
X-CRM114-Status: GOOD (  15.99  )
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

On Wed, Oct 16, 2024 at 2:00=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struc=
t i2c_of_probe_simple_ctx *ctx)
> > +{
> > +       if (!ctx->gpiod)
> > +               return;
> > +
> > +       /* Ignore error if GPIO is not in output direction */
> > +       gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
>
> I'm not sure I understand the comment. Does disable() ever get called
> when set() wasn't called beforehand? How could it not be in output
> direction?

You're right. I think it was carried over (in my mind) from when it was
still four callbacks.

> >  void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
> >  {
> >         struct i2c_of_probe_simple_ctx *ctx =3D data;
> >
> > +       /* GPIO operations here are no-ops if a component was found and=
 enabled. */
>
> Instead of the above, maybe:
>
> GPIO operations here are no-ops if i2c_of_probe_simple_cleanup_early()
> was called.

Makes sense. Will change.

> Just commenting nits, so:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume this stands even after Andy's suggestion to drop the gpiod check
is applied.

Thanks
ChenYu

