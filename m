Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A208CD1D88F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQgdud0CKtJUsCxMGehxz9oQ+EPp7xHVsXi0/0jf+Z0=; b=IyrOvXvy8Kemj4l7KsSNC3jA9q
	YqnBhRJ+uMfv3Tls6POBq1LCBbJI9ZvP0jrgl1mhxhpTq5Vq8bqP19v7d6CL4cVTCZv5HB5kAibxT
	4cPepJosTASGbP8qVuidl+sh+gr3+esOebeyXkNIUE8by5HF8Np6RXbntOeIkj+XoakC8A09y5nOn
	e0gzDDxyp5jzW1ioGRSVSJWWT4FKmuAeNQQHJS/9/fkqaJsXQoNg6/fXtpN2HBNe65ToVStuJbdr6
	TdRSdUsmbhyOVHKjzAbZAVW/mkSZSWXLxPFY1FCifph6ge9RbXRIDOkeQIqLlpsKJvpMfJun3JHWh
	B0kcO/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lqQ-000000096x4-49Vl;
	Tue, 15 Oct 2024 18:00:30 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lpF-000000096kf-0Cv5
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 17:59:18 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so3064417e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015154; x=1729619954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQgdud0CKtJUsCxMGehxz9oQ+EPp7xHVsXi0/0jf+Z0=;
        b=eDTW+CX56FvlWscDbRVKsmKvAeQy9tzL8GH4b8Z3M/KnLhg9enwupQZ8KrQjz3Uxcx
         8dx13RaDtvRIMSrA3Wlv5DVDDCVh5C5bfFrPl6eA+vvrcypz5fOf1mCtKNsCsRfwD0st
         /U2F+lExEgtLneMIUO4qeXPvDriDFEHDX3AhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015154; x=1729619954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQgdud0CKtJUsCxMGehxz9oQ+EPp7xHVsXi0/0jf+Z0=;
        b=FeKcmGrV4SUZS6CnC8iKL8YbLv7xA4JKjHoy+rELaHgVXehfkmJQzCJXRmrzCisWou
         /1RU0vf2dL2mTfWN8K89M6+c2Sn5HZlI2VHSjiwxWWDtLC0lJXap4LWQGv7+Dzxpa8dm
         I4Hbsy3igp8n06OZHU+eSJw2/PqornrgX7y3RPwtwCdRaidrBgm18HGEBtzQiEHDWAGg
         TVoi133RT0fBjmdAY05dXt1j45EZwg6mKPUi8p2IQ2bYstn4pBjusLJ1WdDC3FQAdyiH
         2EeF94CZfYA80BAdt38SbijL2YX1a+RK+p0EqzKA5jY6ujQF1ouPV+O5QNglrrmdDB+C
         fZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVzazohvbZMaYYj3Z2n8eCOkkRt2Boaqe/Qf98dSbrtx102i4FVMGq8gf9XNAoR0q6AbVTnzDT17dDXsfER1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5bLtXGada5gvviv+Nyrgxx0tyoZHcEZHFLUCScy5ptxv0cut5
	ofQNElAwhyeL+xkbz2uApLqqRdTaRQdEVN1S55zB+Sauk0iiJVrY4wdnxMDPl9T3Tr2I5NVgVCd
	DNL4o
X-Google-Smtp-Source: AGHT+IFBtgtW/8A+SRTmfYs1Ktb18lrG1QqM4GaHc87blg9/mUvWlk6NV9Gv4QYnGMaIlWRbDEAjPg==
X-Received: by 2002:a05:6512:1285:b0:536:55a9:caf0 with SMTP id 2adb3069b0e04-53a03e9f884mr1124519e87.0.1729015154388;
        Tue, 15 Oct 2024 10:59:14 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a0000628fsm228958e87.189.2024.10.15.10.59.12
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:59:12 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3294972e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 10:59:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0CsCl02EDrC5ySDwdLjTieUKV10geb+P9Z8vWa+mfdQ1hmm7h1h4xUoaPqbnRsypDLCCphIwuAKCxs/87hg==@lists.infradead.org
X-Received: by 2002:a05:6512:1091:b0:539:f13c:e5ce with SMTP id
 2adb3069b0e04-53a03f77ea6mr882102e87.46.1729015152112; Tue, 15 Oct 2024
 10:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-7-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:58:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
Message-ID: <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
To: Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20241015_105917_124116_ACA9C93C 
X-CRM114-Status: GOOD (  12.62  )
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

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct =
i2c_of_probe_simple_ctx *ctx)
> +{
> +       if (!ctx->gpiod)
> +               return;
> +
> +       /* Ignore error if GPIO is not in output direction */
> +       gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);

I'm not sure I understand the comment. Does disable() ever get called
when set() wasn't called beforehand? How could it not be in output
direction?


>  void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
>  {
>         struct i2c_of_probe_simple_ctx *ctx =3D data;
>
> +       /* GPIO operations here are no-ops if a component was found and e=
nabled. */

Instead of the above, maybe:

GPIO operations here are no-ops if i2c_of_probe_simple_cleanup_early()
was called.


Just commenting nits, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

