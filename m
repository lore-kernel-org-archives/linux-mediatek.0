Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA9FC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 09:00:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B0B164DF2
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 09:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B0B164DF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oVpMAqa+NeP4kHT/nwWO+x/OhwK9a4BmEO2CaK5IC5U=; b=viKHHaQS0KjrVXF6s6vupLlfW
	NAPx59AWq9QwJjzuALf/Iuemh71MZqgsPpfBEgg1U9AzMD9hQVY/9v9b+SQ/f690OiApZTWJJQpYe
	WEzX1r4o95imgE/prh2zwFtYTHRj5kS7vqebqiTlCVQPWOkZRXJBAc8jSue6VRRld0bFSWFWhsBbo
	su1zUonvPxAx4ByhPb2eFfz3B7C1D6O9O+TzkyBclxUhylxsqA057NjmC6TdzIj5+j+QBFpbpZ+7D
	5s6cfau6ZpsGmnL/AoC5FQ57C1nPJnbyij12v8iY04aaKa8KikXIK2DiY8gUy79D+c95gbch5WRBq
	qIbgegOKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGePE-0003QB-Fr; Mon, 01 Mar 2021 08:59:56 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGeP8-0003Og-K4
 for linux-mediatek@lists.infradead.org; Mon, 01 Mar 2021 08:59:53 +0000
Received: by mail-lj1-x22d.google.com with SMTP id r25so17502536ljk.11
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Mar 2021 00:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AYs79IPnRt3qtzNnShKWZ7vyowWc2VUelHvdooVHnZg=;
 b=kcf6kcitYZpg70CypoUp8KXILwBgfW62DpbNjWslqlp4qw62fI7tzmXjPZQCmQxMc8
 y7E4AtX2Fmm4bNLcfXcEPW4KygtdDIAQoh7/Gppn2wuQW/GKYs0Umn4Wm46XccGHSmBe
 jy7uA45XkN8GMGoDoJDciHZsVQhSFIR5XDAoh0rW972s2s04adtjid+35nHXnoln8MA8
 FxCO26S/5xLKeLnx947E7nXZn0Rnap1zKbmn2OkkQ+VOi8uxBgu0gE1sSxomW3gthjJM
 ufu7iyDDX3VZgWZtHNc17YGxcgin7Xk21+hnZeVkHrui+fqknKWQ+8YcQvAzXeWUB5vl
 a9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AYs79IPnRt3qtzNnShKWZ7vyowWc2VUelHvdooVHnZg=;
 b=q9VlUi4HZpIZD1tLGxEnodab6DS8DTza0k4mQ2SaJfMkXOTohmIOEJnbbLs3/BqKBQ
 oh5VpTaBbCukcchFTM3uzBRbwzc9Y3Pet88v10ZNhZIZtYX4yGPWCXf5lC0P9o4vcUiM
 KhU1iJYaFa3pLEymJSeiT/QdxSkapCQMq1ZPULZPUJ6wNd5Ks/qY7d/SjjHuUx2Gf/Ea
 hSZRscOeX5Q+ZXbR8VOjJ5WEWzidQwlcP/2C4ljvB9Ow3WzwT0YK5J4OF5jgMQ8uz+Kq
 ZOFQOB74AyG2LmWmbCq0G7/GJl5YsIrFBKh538I24jQq0q0dUme4e8Si+MG3ASLIMXqi
 hjbQ==
X-Gm-Message-State: AOAM532o4EML3eymotuX8SSrwH+GnhGwz8cDzrSUvXpXIsLSpfEW0Ww7
 OWAA+e+FVH4u8EjA37pk0UT+q+0Mykp6pzYyd+lwAQ==
X-Google-Smtp-Source: ABdhPJyj3pw+C0NXHPjoJdDWHXn0vLK/WBMS4zWE5j9GGEZHyMLzxq+OeogebxlDuBb2zgJuFq1OMvgpJB8dxst6o6c=
X-Received: by 2002:a2e:9754:: with SMTP id f20mr6463797ljj.200.1614589186573; 
 Mon, 01 Mar 2021 00:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
In-Reply-To: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Mar 2021 09:59:35 +0100
Message-ID: <CACRpkdbQa3BZwgtp3=061cu+y+4qkMqtXQhXH_VuHB3KcLyDCA@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To: Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_035951_034317_CE3F2B4E 
X-CRM114-Status: GOOD (  20.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 MSM <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Xin Ji <xji@analogixsemi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 11, 2021 at 4:34 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> Many of the DSI flags have names opposite to their actual effects,
> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> be disabled. Fix this by including _NO_ in the flag names, e.g.
> MIPI_DSI_MODE_NO_EOT_PACKET.

Unless someone like me interpreted it literally...

Like in these:

>  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-

> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 2314c8122992..f4cdc3cfd7d0 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -760,7 +760,7 @@ static void mcde_dsi_start(struct mcde_dsi *d)
>                 DSI_MCTL_MAIN_DATA_CTL_BTA_EN |
>                 DSI_MCTL_MAIN_DATA_CTL_READ_EN |
>                 DSI_MCTL_MAIN_DATA_CTL_REG_TE_EN;
> -       if (d->mdsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET)
> +       if (d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>                 val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;

If you read the code you can see that this is interpreted as inserting
an EOT packet, so here you need to change the logic such:

if (!d->mdsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
    val |= DSI_MCTL_MAIN_DATA_CTL_HOST_EOT_GEN;

This will make sure the host generates the EOT packet in HS mode
*unless* the flag is set.

(I checked the data sheet.)

> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index b9a0e56f33e2..9d9334656803 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -899,7 +899,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
>         dsi->hs_rate = 349440000;
>         dsi->lp_rate = 9600000;
>         dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -               MIPI_DSI_MODE_EOT_PACKET;
> +               MIPI_DSI_MODE_NO_EOT_PACKET;

Here you should just delete the MIPI_DSI_MODE_EOT_PACKET
flag because this was used with the MCDE driver which interpret the
flag literally.

> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 4aac0d1573dd..b04b9975e9b2 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -186,7 +186,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
>          */
>         dsi->mode_flags =
>                 MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -               MIPI_DSI_MODE_EOT_PACKET;
> +               MIPI_DSI_MODE_NO_EOT_PACKET;

Same, just delete the flag.

> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
> @@ -97,7 +97,7 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
>         dsi->hs_rate = 349440000;
>         dsi->lp_rate = 9600000;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> -               MIPI_DSI_MODE_EOT_PACKET |
> +               MIPI_DSI_MODE_NO_EOT_PACKET |
>                 MIPI_DSI_MODE_VIDEO_BURST;

Same, just delete the flag.

> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> index 065efae213f5..6b706cbf2f9c 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -450,7 +450,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
>         else
>                 dsi->mode_flags =
>                         MIPI_DSI_CLOCK_NON_CONTINUOUS |
> -                       MIPI_DSI_MODE_EOT_PACKET;
> +                       MIPI_DSI_MODE_NO_EOT_PACKET;

Same, just delete the flag.

These are all just semantic bugs due to the ambiguity of the flags, it is
possible to provide a Fixes: flag for each file using this flag the wrong way
but I dunno if it's worth it.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
