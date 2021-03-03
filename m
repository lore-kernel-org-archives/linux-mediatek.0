Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2C6C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 14:06:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F326C64E68
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 14:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F326C64E68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kOI155f6yADcfwN6Ex5HipLCl2IGau90fXOu8BpEKlQ=; b=YxgJfPSb2Deen6FVIEcZAagI5
	E8TtTswf9NzvnV6BdzCp5Sm85RWEG4Th8/hPl17ep3y3oa1ZEZxfz+otuOPq0ROjAEqw5DHq2P33w
	wgmrYeyM4USF67Iq9M8pRoFjRRZ6eL1aWo94Y22lMLJ+1K/VhSHumiAcrUoH06QCsyo2riSUFTGRe
	fTp38K1uwkaTtdQGC6e87VGzELRMIjwDIGE6aEQdazqWLZZZ745HiGXR9jGDkLkmXqtuohPk6BGsn
	zHpI3WQp39tSErzI2WRLLe8JRawncHmh3BzFTFYIvXGBl/A+JhvIVuxvWKo5lRZMwWHY96fKfoUfD
	fLmVFUzBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHS9B-0053Wi-Sl; Wed, 03 Mar 2021 14:06:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS4g-00520x-Ji
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 14:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ud8XCo4zETwyBcC5uBZYedvwqDLvaKNv5XeUnTbkcFs=; b=W5BzNOdrQXnvsyn84Z33Y4EMR4
 SqEVqE6fCB++zYW2CKw9YXutYQj3ioGI1jFO0v6E9sDNo9WSxMBkWmGN+jalX4eHqNKfzNi/Y2f7j
 TQbhp4Dq1+JgNhTfcahPt9yBpzfXQAxM2hI5cb5HhjdShKOKkEQokfp2tWLUL8b+QxKKkd21jBMiY
 pZkHXwTUMw5DQpY7KcwWqVyC1THRRChf1IVI2Mki0A6exCzbE8EKK2/f07CK0kdjJzPyzyt0QpBJD
 NOj34FUh+iNMLh1z5ImpL3yJ4J72Mm0l3eI8rdynPK87PGBTbGUjXnwh/HiyXRWVHamZvAJ0b0t83
 6Sy5H3MQ==;
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOnt-002CdO-LY
 for linux-mediatek@lists.infradead.org; Wed, 03 Mar 2021 10:32:34 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id l192so12296447vsd.5
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Mar 2021 02:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ud8XCo4zETwyBcC5uBZYedvwqDLvaKNv5XeUnTbkcFs=;
 b=MUXW0BLcopSj2WEivWF6kbF45NTv7iE6q4bdW0n64jAOThRVEwx0mwL70/W8QAcW22
 kbp43yMWDe8/wr6M408sE0OwjffCirBG9ZLdfmUcFX2sgeaA6c0HU/locnDgty4g8tBY
 P1x3TV2Q9JYZyg4RAnN+KCw0Zda/CC2Tbyeok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ud8XCo4zETwyBcC5uBZYedvwqDLvaKNv5XeUnTbkcFs=;
 b=E096j7oRhkon3ydlDzBXfg3SctH0b7VWIj4sOcKjvvqoSKCgqG5iKjLXzGTSCI213C
 gMueytUBSRPiRwvXH8aU3Y5e+OSgsAWD1Mk6kc3UeFe3WGrButnq37rYksGbK0tZ61yC
 X/xKZbIzUr5A7synUFphEEfuK46rPtviMg/lfTtLYlbTGytNE8XrUPirrNlHM+lK7q2P
 oIgoK+sNDAmDaiHL6RB+a10otkzGgVO8N/TcI8fPQfdm47t8jT76Jknly1pUvLLFxgdo
 Qj2B0VPLjTVnuYLh7KJbuxWPr7thL2d2Xybp7z2LqKgI4p6CQHBGbtvK7SAgKR3+cj8y
 FbEQ==
X-Gm-Message-State: AOAM533nMAhsh0GLJz9hJC1YfTy0Nxn1LjiUQAuAhMf/YX0n3IUUp7h7
 kw+pp1ql/xKSG5dYEh5zppPqKN2MbJGqxIrZk6b2uw==
X-Google-Smtp-Source: ABdhPJzM84ST5K0eaxhWuR85D0QFzIegAthMVmk/sn+EGXAtrfigTFMmmkIb7ZyoUsPiJw5uyoHo0rSSZNkvG9/REng=
X-Received: by 2002:a67:1046:: with SMTP id 67mr5250935vsq.21.1614767475658;
 Wed, 03 Mar 2021 02:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
In-Reply-To: <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 3 Mar 2021 18:31:04 +0800
Message-ID: <CANMq1KAsvXZAjmYCMQsAUwpkzuA9-PRnNWkpsLuNbOkP6DixGA@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To: Linus Walleij <linus.walleij@linaro.org>
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
X-CRM114-CacheID: sfid-20210303_103234_066530_0A998E48 
X-CRM114-Status: GOOD (  26.44  )
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

On Mon, Mar 1, 2021 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Feb 11, 2021 at 4:34 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
>
> Unless someone like me interpreted it literally...
>
> Like in these:
>
> >  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
> >  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
>
> > diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> > index 2314c8122992..f4cdc3cfd7d0 100644
> > --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> > +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> > @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
> >                 DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
> >                 DSI_MCTL_MAIN_DATA_CTL_READ_EN |
> >                 DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> > -       if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> > +       if (d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> >                 val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
>
> If you read the code you can see that this is interpreted as inserting
> an EOT packet, so here you need to change the logic such:
>
> if (!d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>     val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;
>
> This will make sure the host generates the EOT packet in HS mode
> *unless* the flag is set.
>
> (I checked the data sheet.)
>
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > index b9a0e56f33e2..9d9334656803 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > @@ -899,7 +899,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
> >         dsi->hs_rate = 349440000;
> >         dsi->lp_rate = 9600000;
> >         dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -               MIPI_DSI_MODE_EOT_PACKET;
> > +               MIPI_DSI_MODE_NO_EOT_PACKET;
>
> Here you should just delete the MIPI_DSI_MODE_EOT_PACKET
> flag because this was used with the MCDE driver which interpret the
> flag literally.
>
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > index 4aac0d1573dd..b04b9975e9b2 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > @@ -186,7 +186,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
> >          */
> >         dsi->mode_flags =
> >                 MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -               MIPI_DSI_MODE_EOT_PACKET;
> > +               MIPI_DSI_MODE_NO_EOT_PACKET;
>
> Same, just delete the flag.
>
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> > @@ -97,7 +97,7 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
> >         dsi->hs_rate = 349440000;
> >         dsi->lp_rate = 9600000;
> >         dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> > -               MIPI_DSI_MODE_EOT_PACKET |
> > +               MIPI_DSI_MODE_NO_EOT_PACKET |
> >                 MIPI_DSI_MODE_VIDEO_BURST;
>
> Same, just delete the flag.
>
> > diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > index 065efae213f5..6b706cbf2f9c 100644
> > --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > @@ -450,7 +450,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
> >         else
> >                 dsi->mode_flags =
> >                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > -                       MIPI_DSI_MODE_EOT_PACKET;
> > +                       MIPI_DSI_MODE_NO_EOT_PACKET;
>
> Same, just delete the flag.
>
> These are all just semantic bugs due to the ambiguity of the flags, it is
> possible to provide a Fixes: flag for each file using this flag the wrong way
> but I dunno if it's worth it.

Wow nice catch.

I think we should fix all of those _before_ my patch is applied, with
proper Fixes tags so that this can be backported to stable branches,
even if it's a no-op. I can look into it but that may take a bit of
time.

Thanks,

>
> Yours,
> Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
