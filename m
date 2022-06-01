Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1f14E7KfQ+s4qiEO84GjwMPVTXwaym0ovN5Dy2CzlI=; b=u9X7b6BW5ua5mm
	zVtlD3oVWYOXxvs7+vJ+ZHgKp13wVRT6DlkPgE5vpB0sOwcvAE0SkQ7np1BWl9Df/EiHsBSDIfd39
	0xm+CR7DSnfvAHNkNKAKCUC1C0g1Ak4BpTgKD7st4IlwUF8mX8ksWI3tmnyFmhIQAQsiiIuWBjgoJ
	FS/2MNVtY/SvdNeM3Xp3S7TkSOc4nJI2FF6AsKYY0Xh1JnJ7mSDfLaZhRvvqF7JuLRg8oE4KCj5wS
	VdnaELAKUu0JVr+MSUDn8LwSKgx3EDsEBaDRUsGp3MCIoDrJiEOKrQDgktLzJbBXJTLyJRdu+Z9ED
	x6XdvhGuEagR1Y8LS4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKgS-00EvHz-1M; Wed, 01 Jun 2022 09:30:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKgO-00EvGG-Ap
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:30:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id rs12so2452598ejb.13
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RTq2qApdr0XDjYdhICkGJiEtvpG4jeHig+budTOXpzw=;
        b=N5bZXB4HEnh1aE629ihk0RNtGOggnXdOo8MhyhV/pnh0CS3sIL/F0HjMn6dkeMJhys
         uvLvUCgQ22KIadzabZUoW8aH9DgEKYOj0O7xEDoueNU6mwjz5rjcJ9pvqB5Ab7qEQqf2
         RzK5un4TdNweT81vZseW8sNyrkZ8icMt397oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RTq2qApdr0XDjYdhICkGJiEtvpG4jeHig+budTOXpzw=;
        b=0btSGqv9O/3dDErPQC8/z3qXNWN96CGCmPYm1auUeXSEDKNJXk1LzU7r2aFJHY9uxh
         VCIT7bXhxpeth/DvRd6D8z2920ElyvHQYReDz+OajQOSgs1azdUTboH9/LIx4TungP2i
         JAsHnpLg6zin1SqjKtCHgf4ruD95icWvl2ZJpO2tS9+REnz8E9UVAwcGXiD1kx/SC5iT
         UdORu96CmeFMML9NgxLxfH+I1g9vuQhGC0YD2TuS9qYUFIFFUQ557nqqQbZOOgcB42cP
         BI7n/gG6wqYNvaogv9ZS4A7CBX/LzX0u6TYUFEqF9eS5ruCLtEBlDR6OmdtX0nkKhvMi
         wh3g==
X-Gm-Message-State: AOAM532m4WWZJ+pZ3+aXEPm8t8nXc50p9LFMyZ5WjBD+P4ff5eywrKaT
	z7NXei8ObsyRp6UdL6uhLsAxMZHcitJgEpWFRWI1mA==
X-Google-Smtp-Source: ABdhPJxO4OEEAdvJqMndbTEvHBclpdxbIJVkiSSJC2U5lu+FvyjTBUCrzqDl4iM+Hnoyelw7MdIsxnbVinBAcMcjCA0=
X-Received: by 2002:a17:907:160c:b0:6fe:c56f:751 with SMTP id
 hb12-20020a170907160c00b006fec56f0751mr46232867ejc.746.1654075824444; Wed, 01
 Jun 2022 02:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220601081823.1038797-1-hsinyi@chromium.org> <20220601081823.1038797-9-hsinyi@chromium.org>
 <c890efc4-dfda-cab1-8a46-527e3e02168a@redhat.com>
In-Reply-To: <c890efc4-dfda-cab1-8a46-527e3e02168a@redhat.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 1 Jun 2022 17:29:58 +0800
Message-ID: <CAJMQK-iNFyScoh5pZkWA9cPmdmz+YNhuDH-v0fveSfCT0udZFA@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Hans de Goede <hdegoede@redhat.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	Rob Clark <robdclark@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_023028_441269_D82A38D5 
X-CRM114-Status: GOOD (  37.44  )
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

On Wed, Jun 1, 2022 at 4:57 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 6/1/22 10:18, Hsin-Yi Wang wrote:
> > Panel orientation property should be set before drm_dev_register().
> > Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> > panels sets orientation property relatively late, mostly in .get_modes()
> > callback, since this is when they are able to get the connector and
> > binds the orientation property to it, though the value should be known
> > when the panel is probed.
> >
> > Let the drm driver check if the remote end point is a panel and if it
> > contains the orientation property. If it does, set it before
> > drm_dev_register() is called.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > The concept is the same as the previous version.
> > https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
> > The only difference is, it now uses the panel API instead of parsing
> > orientation from the driver.
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index bd3f5b485085..12836a697f56 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -185,6 +185,7 @@ struct mtk_dsi {
> >       struct drm_encoder encoder;
> >       struct drm_bridge bridge;
> >       struct drm_bridge *next_bridge;
> > +     struct drm_panel *panel;
> >       struct drm_connector *connector;
> >       struct phy *phy;
> >
> > @@ -822,6 +823,16 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >               ret = PTR_ERR(dsi->connector);
> >               goto err_cleanup_encoder;
> >       }
> > +
> > +     /* Read panel orientation */
> > +     if (dsi->panel) {
> > +             enum drm_panel_orientation orientation;
> > +
> > +             orientation = drm_panel_get_orientation(dsi->panel);
> > +             if (orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
> > +                     drm_connector_set_panel_orientation(dsi->connector, orientation);
> > +     }
> > +
> >       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> >       return 0;
>
> drm_connector_set_panel_orientation() is a no-op when called with
> DRM_MODE_PANEL_ORIENTATION_UNKNOWN, so the check for this is not
> necessary. This allows this to be simplified to:
>
>         /* Read panel orientation */
>         if (dsi->panel)
>                 drm_connector_set_panel_orientation(dsi->connector,
>                                                     drm_panel_get_orientation(dsi->panel));
>
>
> Note since drm_panel_get_orientation() checks for a NULL panel, you could even
> drop the "if (dsi->panel)", but I think the meaning of the code is more
> clear with that present.
>
Will update this
>
>
>
>
>
> > @@ -837,6 +848,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
> >       struct drm_device *drm = data;
> >       struct mtk_dsi *dsi = dev_get_drvdata(dev);
> >
> > +     /* Get panel if existed */
> > +     ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
> > +
>
> Check ret? or maybe not assign to ret ?    I understand some errors are expected
> so maybe something like:
>
>         if (ret && ret != -ENODEV)
>                 return ret;
>
I will choose not to assign ret. In some cases that the end point is a
bridge (not panel), since we assign NULL to the bridge, we will get
EPROBE_DEFER.

If the panel fails at this stage,
drm_connector_set_panel_orientation() is just a no-op. Let dsi still
be able to be binded.


> ?
>
> Note -ENODEV is probably not the right error the check for!
>
> Regards,
>
> Hans
>
>
>
> >       ret = mtk_dsi_encoder_init(drm, dsi);
> >       if (ret)
> >               return ret;
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
