Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9649ECCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=; b=psd47LG9HfRp+qcWbggT+aYw3m
	r8UrFA3exFeZbFYJ8++KHoLZmMoP7YV4q0SRk1FDNrywcBoWoBLTEeg3jp1EbFaraEgemTTx/ysx5
	+Nu2ZC+GfL2jMOv0L3TtoijB9JksRrerx7DVAUB1UxFXhNptXkQurA2rZ7Bap0cp646d2MIITbtom
	qd0YwfmLZSJzMbs5VPdBHAppb3AdnsAtNbGC/NsqN7cNyVuvE1P+5uimWznPl616xlRuAQ+FVAhMZ
	5Mt9Ip1NTsvXmsBn4orb5bZWRgbnuD3qh81N0i2AOGq7FEQRBJBjRmx9u1a2SgLgYvCnJrLrexgoK
	8hrtVbMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Kze-0000000Dn9x-418a;
	Mon, 13 Oct 2025 16:01:50 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Kzd-0000000Dn96-0kPR
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 16:01:50 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-639df8d869fso8241868a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 09:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760371307; x=1760976107; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=V02vthWqUITUt5rLgQZqoiz0+Rjl8kBCfYUr5xOnpoUZVrBarrvAONbMgCwrdeLAr6
         CNrIPfOXFBTB+ShNtJ74w2Jbwe6+ZaRU7Ho1YwMaaPAv4YiEkPILD5haKalXUKF5cPsI
         14/iPXkoHymlYLKnta9vubK0TOBul+1ouRHzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371307; x=1760976107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=Ij5icM++t9GALKtBRWVCKPTxqEeGROhMXbOIeZCoGbQVR0vZ0x1U44/caoLjw6vB6G
         CFf13G+2stHS3+pfhBG8ZkXzuZc+xmvDWCUAQXinFAyyYa91JsDZ+wO93vxmNZIB90pZ
         klOrEFjkYfeiOIonrvoUtCsv1qBL2WnXP4Jj4mI5q59hLKLJb+9C/jZz0UDFu6c/IwDR
         UvesXZZoQoCIs6mGmAltLBsIC3lryo63I9+ZXThb6rHvpN4Y9BVosJBRsn7XDbQ8FX7a
         4V8XgEYkrqzJiiQMYzsJn1YiQo5RCuIIxRn3yJYVWMEsJRoJQdPen8qsnwNLfRd0fC1I
         nywg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Q28FnmYNovl3T8nph0g6GrzYTHVQl/BXTSy2YeFIFROuZjC/mcVipC2aW2tXygFe/t3fWMjl0XAZdpYKIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI0k3BP1dbmDD9I1ie99hm12bWaFZnL7REo6NDCaQ7ulh+4YHs
	fZkw6KcqfUT78Um8Y6FNBEg0LIFXs599KtAaFi1KxIoSQpznJ8lHcEtZ8+RW2nE37cKAfLJJzTS
	UDmdGfYpf
X-Gm-Gg: ASbGncvOylZFYBHuiLi9hl8EtGdCvFNahQTlI04PD+CMa9h2i4z77es7YZaJE3fKiTx
	tPYAJ2pzGXR+D+aEtR+WyVpeWytZPuGLMjeubMndaHtYYWJXsURlMf5LO+KhDnZdaCtx5ITQIvf
	UYkGcHalD7qM4eBgN6NWhYSrwWjr5QEVC4qTkYNRz7OgrXvHc9RKmWTtdA+9dcwOn0RvtJ30LpV
	rG7EpamPoEfxVTGrAcNUvPYNc1Kv5l7cFp3MlW1ZvncE7PFtmsmszl0ssd3s50TvEyR7F8XGITl
	hckDwlSxf0f5+9KRDg7ciR1KRqIMMkec4FuoDmTfTXPM7K6ZgjW5zoh6c1QrsYltszMaoB0Uufe
	+RSfjt5EIjhXfpSHtvPf5EcRR5MXIgx1GTaosfG0kEXm60LJwCagh2uCEEIKz9NVnKATDN24vZz
	XjG04EwYQdJOLcgw==
X-Google-Smtp-Source: AGHT+IE62sUx2kzi6OjABwBXOOzuwE1CQ/EPUNE/3bjxGvvHFyrERPFv0KxAOGJ8RdLGjB4lrjGGrA==
X-Received: by 2002:a05:6402:1ec8:b0:639:e33f:8535 with SMTP id 4fb4d7f45d1cf-639e33f93a5mr17518097a12.0.1760371307175;
        Mon, 13 Oct 2025 09:01:47 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63b9c4d5517sm3316619a12.3.2025.10.13.09.01.46
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:01:47 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so8618152a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 09:01:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzu0gIlKj6NdJ0QZH0uk3EvdPe9gcwYUiI7B20lLFgGd76aDBCkhejeBL2ic6alGowfqM22/VGmwHiBmeLQA==@lists.infradead.org
X-Received: by 2002:ac2:4c50:0:b0:55f:4ac2:a58c with SMTP id
 2adb3069b0e04-5906dc0ff30mr6173104e87.22.1760370964286; Mon, 13 Oct 2025
 08:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org> <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
In-Reply-To: <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:55:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
X-Gm-Features: AS18NWCmgLaH0rMvCIhheSPVtWPGKkpbEBd_aB_kzUyM4RaB_yHSiy8sRs-muw0
Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
Subject: Re: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Julien Massot <julien.massot@collabora.com>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Yong Zhi <yong.zhi@intel.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_090149_259275_72291249 
X-CRM114-Status: GOOD (  21.50  )
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

Hi Kieran

On Mon, 13 Oct 2025 at 17:03, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Ricardo Ribalda (2025-10-13 15:14:50)
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR().
> >
> > This patch fixes this cocci report:
> > ./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()
>
> Ohhh nice. Is this new ? First I've come across it.

It is actually from 2019:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c

I just learned about it because there is a new check in coccinelle :).

It is pretty cool, but you need to be careful to check IS_ERR(ptr)
before doing the printk, otherwise %pe will print the pointer value.

Regards!

>
>
>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/imx335.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
> >         imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
> >                                                      GPIOD_OUT_HIGH);
> >         if (IS_ERR(imx335->reset_gpio)) {
> > -               dev_err(imx335->dev, "failed to get reset gpio %ld\n",
> > -                       PTR_ERR(imx335->reset_gpio));
> > +               dev_err(imx335->dev, "failed to get reset gpio %pe\n",
> > +                       imx335->reset_gpio);
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> >                 return PTR_ERR(imx335->reset_gpio);
> >         }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda

