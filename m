Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6735EC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7LGzaOqEFxFKAZcvBfU7NqYSCYno6NWDI1SljnNhNw=; b=rkVQCrl8oAWAWE
	u7cJ+5Q+4uRe/xQMJVUYePGboGe09TnuAbzctn5zek4sL6sM6O/6WC6FZS5z82ZN2uTicsIEatzmS
	hJJ5EP9RBSTUWw5ykNlshtfh9MjIO158NcwMHnN6hPDuUXHF7jSUlRMc/hYi8N6eOsY3skbYlQS9E
	cHb+qCbkwGwZvF9pOcgwsr2eq8djZ6SgHMyzIZljtv56ueZo/ANjYepIzL8KUmjHRnIV879rtRxYR
	eqHzK6jV9b3qYrUwoJHpXA+OmWsm6rbkJiVguQjyaKx8xHrofWVdCK/T0FbG+YuXO3nm7nNQN6cSY
	kye342U2T3IJ4BrvdhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nys6s-00CQ0P-5i; Wed, 08 Jun 2022 09:36:18 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nys6W-00CPr6-13
	for linux-mediatek@lists.infradead.org; Wed, 08 Jun 2022 09:35:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id x62so26257866ede.10
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jun 2022 02:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kOg3HvH8j+WVCx/lSSBrh7BoztwaXs9YDBC9IWClIgg=;
        b=BYg8e6tB+8azsKp0NbkOtO6Sv9a3zM9cNkEsd/Zvy4TRu7dIMeJRCubIXz1+yJEHSm
         eaj8rvMkrQbvG2tDfOe0Sb+HPi67Wwzb2u4p/W+mTgTdUSft07yDROB3L9RVu4HrhY1N
         HrwEILSRfLabHhKX7K/nAJ2mDJqbWxirI90B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOg3HvH8j+WVCx/lSSBrh7BoztwaXs9YDBC9IWClIgg=;
        b=EyE9N/WoVQeTcpOs4wiblzLKCpSk8hSB5EZLYHmXtAUWsXXn58Oj5Gwr0ElEEbo4M6
         ML8KZxDPCNpSJ3vHXcLFOwRIeeXwbpg07aJqbmfNYo8/vADV91Hfw4+ICM1RodBxZ8mn
         rI+kOkMv957TPYrsZahrTaPXhcbaT2stGr1doNGJ3TCKmEmavnbClg7skbD0EB244nCX
         sMBUDR2XAE2VxH8Jh4avz3/69RpLUKC3B2TaGAOKrVCNyEqej9pgQxneJfkQyEtNIvyk
         idYq1qy1eZHZkETPGe1xG984h9QzTRQGqe7f9Eza8WQ7htnnUuHLwYmXhv80wlmcsVmN
         f28Q==
X-Gm-Message-State: AOAM531l3vdJQKZN2aXKB7bg9o8uBbVP2l29Whet21J4hI77l3BB/5m5
	8BKCnpvHFcBtR3/qsEKRITz6En3BwroEF8o9jGroGA==
X-Google-Smtp-Source: ABdhPJxbUUhlJQTDlzFDaW7RW91mrSfMojk1t+tvHzRVYL+0VnFJ2Vlg/w4Krtx80r04u4Z+7aAKFVKb/iNsqLSus5U=
X-Received: by 2002:a05:6402:cab:b0:42d:c842:8369 with SMTP id
 cn11-20020a0564020cab00b0042dc8428369mr37949645edb.181.1654680952985; Wed, 08
 Jun 2022 02:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220607090549.2345795-1-hsinyi@chromium.org> <20220607090549.2345795-9-hsinyi@chromium.org>
 <CAD=FV=Xe=iEh080QjE+Awgw0Q+Rb=xnrAj6OtO3EXp==XgvD0g@mail.gmail.com>
In-Reply-To: <CAD=FV=Xe=iEh080QjE+Awgw0Q+Rb=xnrAj6OtO3EXp==XgvD0g@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 8 Jun 2022 17:35:27 +0800
Message-ID: <CAJMQK-h3-9kSsN2r5+P84DeRNKwCm4pTPsri3tTQQLZjaieSEg@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Doug Anderson <dianders@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_023556_173923_53F1EABE 
X-CRM114-Status: GOOD (  38.21  )
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

On Tue, Jun 7, 2022 at 11:39 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jun 7, 2022 at 2:06 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
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
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> > v4->v5:
> > - use the new function in v5.
> > - don't use drm_of_find_panel_or_bridge().
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index d9f10a33e6fa..998b1237e193 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -185,6 +185,7 @@ struct mtk_dsi {
> >         struct drm_encoder encoder;
> >         struct drm_bridge bridge;
> >         struct drm_bridge *next_bridge;
> > +       struct drm_panel *panel;
> >         struct drm_connector *connector;
> >         struct phy *phy;
> >
> > @@ -822,6 +823,10 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >                 ret = PTR_ERR(dsi->connector);
> >                 goto err_cleanup_encoder;
> >         }
> > +
> > +       /* Read panel orientation */
> > +       drm_connector_set_orientation_from_panel(dsi->connector, dsi->panel);
> > +
> >         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> >         return 0;
> > @@ -836,6 +841,16 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
> >         int ret;
> >         struct drm_device *drm = data;
> >         struct mtk_dsi *dsi = dev_get_drvdata(dev);
> > +       struct device_node *panel_node;
> > +
> > +       /* Get panel if existed */
> > +       panel_node = of_graph_get_remote_node(dev->of_node, 0, 0);
> > +       if (panel_node) {
> > +               dsi->panel = of_drm_find_panel(panel_node);
> > +               if (IS_ERR(dsi->panel))
> > +                       dsi->panel = NULL;
> > +               of_node_put(panel_node);
> > +       }
>
> While the above works, it feels like we could do better. What about this?
>
> * We add _some_ way to determine if a bridge is actually a
> panel_bridge. If nothing else maybe this could be
> drm_bridge_is_panel() and it could just check if bridge.funcs ==
> panel_bridge_bridge_funcs
>
> * In drm_bridge_connector_init(), when we're looping through all the
> bridges we find the panel_bridge if it's there.
>
> * At the end of drm_bridge_connector_init() if we found a panel_bridge
> then we call a function like drm_panel_bridge_set_orientation().
>
>
> Then you can fully get rid of the mediatek patch, right? The above
> will only work if you're using a panel_bridge / bridge_connector, but
> that's "the future" anyway and we want to encourage people to
> transition to that.
>
This also works with the mtk dsi, and it's more generic. I'll drop
this patch and go with this implementation in the next version. Thanks
for the suggestion.

> -Doug

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
