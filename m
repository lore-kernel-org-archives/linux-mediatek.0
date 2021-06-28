Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66DAC49EA3
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 11:10:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F6861C6C
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 11:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F6861C6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RMc5ZKFThFwwF99WcC9UeSiIf4oK8KGvW5tGySy/rQ=; b=a2Q9XYCkRqgIgU
	5wF+qp959MtdUwoxIqOD/IA3GUoeIXsa8kAxe5spUFyu1pZfPWw6Yq/KU7tPI9ylFTcknfckgBc5P
	cl5bDNLPR0NadDQxhfIgmXZzdmles506jvpGVNqDk8EHj4AJQWMB6rzMK/wwWcepSX7qayCa+JhXe
	vJAPGFb+Vcnt0CT7MF0wqMVPxcebvlzJ/bTl+d+x/bqI0yKpPGCELgeiBJFaT8MeDRl8F34JGLwmt
	4njk15C2rDPGdLVV1NOWGkG2vH3gd689uNFjZZ0PX77Qq9wg6GLo41kWlTDxIarOXywRvkMA/0wp7
	rCRO9il2PL8063og///w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxpA0-007izL-QL; Mon, 28 Jun 2021 11:10:40 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxp9x-007iy1-OQ
 for linux-mediatek@lists.infradead.org; Mon, 28 Jun 2021 11:10:39 +0000
Received: by mail-lj1-x22a.google.com with SMTP id k21so4339819ljh.2
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Jun 2021 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWqtZ2im8bhpe7wgbjV8zsEbbfLVDc0iR3ke9Y3lfWw=;
 b=GWKNCASd9MPmyxEUsoGR9JzIVqWCjK0OSZF1l1oCdifzvEDMqh0KUYe3MV8Dgbr+PA
 la9gyUtlwDg0n3+3jlE9gokVLM6wdEqMHpYm1GUNKILSnuRdU+RgBU7sRxOUjljpyx1u
 zKT2T7iMjOJzomPtHeovnBESXt8hdlSg1o9l9GDzfxR/6G/S3tgN1K7+yyCGozJ1EgyI
 9PvkiqVsL1bXqLvS7gQ+U/3JwHmPIo1Hy4i7AHzDiPuPyOEXwm7HJstY+KYKcy+at9Yg
 H1VQ4aM1iq7p8brNaOJS61SqZPEocFRr1bHCErosV2zAZJTQ2DzKJf/Yr1Gt16mOzVxo
 1abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWqtZ2im8bhpe7wgbjV8zsEbbfLVDc0iR3ke9Y3lfWw=;
 b=YaHrKqQcS5aNKz0xG9D8doSzY6UlxD805KUxnONIBkFf1kJIk02OO42x7ZzUAtyAGf
 anDjRmYfOptScSgF+U+J4/EG6RDQKBW5oe68IjXNo9AxiP8H4Y63vNau+32uOxYe+jm9
 bd2Lqecdtz+000s/5WOxP+upUilexcxk99lFA4IBHCN+gP6uHaUhRssIRk6DOv0bse30
 8iYeSHz9n/g14X4E2F7VbPMtkDxdQKI1tFaKRWYj9II2tms9xxuHKKUOvr6d7xZV20+L
 3EuxxsfnXX1K+Trxlx3O8Lm2aVspbY0TglZ6bpnICgNWb9zZCK1lbev52MREI8QYWDjl
 IfmQ==
X-Gm-Message-State: AOAM530FC9RChGNLLyMKcGxnc+Yopbm1NMRU9EZvuPWARhMmLlAe1NG3
 9dRYEvTriO7LQkpYGZU5s6Z98u6jlBCMKglFxbjF8g==
X-Google-Smtp-Source: ABdhPJzyEQpk+qVTQTN61ga94Up2dG17/tdSZ8ryGBxDStAhbzvUPZemkx4xWP9DPdoHPznWcXaHK8zDx3IUoLZtJDU=
X-Received: by 2002:a2e:9483:: with SMTP id c3mr19694556ljh.273.1624878635125; 
 Mon, 28 Jun 2021 04:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
 <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
In-Reply-To: <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Jun 2021 13:10:23 +0200
Message-ID: <CACRpkdYK3nw890YFNxgtrwDvxcoeNVu7MxqUw94NN_6PiYxkJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.velikov@collabora.com>,
 Inki Dae <inki.dae@samsung.com>, Jernej Skrabec <jernej.skrabec@siol.net>, 
 Jonas Karlman <jonas@kwiboo.se>, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Jordan Crouse <jcrouse@codeaurora.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Rajendra Nayak <rnayak@codeaurora.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>,
 Xin Ji <xji@analogixsemi.com>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 MSM <linux-arm-msm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_041037_898427_D79BF758 
X-CRM114-Status: GOOD (  16.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 3, 2021 at 11:31 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> On Mon, Mar 1, 2021 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > >                 dsi->mode_flags =
> > >                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > > -                       MIPI_DSI_MODE_EOT_PACKET;
> > > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
> >
> > Same, just delete the flag.
> >
> > These are all just semantic bugs due to the ambiguity of the flags, it is
> > possible to provide a Fixes: flag for each file using this flag the wrong way
> > but I dunno if it's worth it.
>
> Wow nice catch.
>
> I think we should fix all of those _before_ my patch is applied, with
> proper Fixes tags so that this can be backported to stable branches,
> even if it's a no-op. I can look into it but that may take a bit of
> time.

This is fixed now, please will you proceed with this patch, because I
really like it!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
