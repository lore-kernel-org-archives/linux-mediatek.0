Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC93C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mr+X1yAaA7l4cDpExPUsuv+uOnQkUQ/mJqPLH89wOBo=; b=hzIue3hVsbet1O
	U1Q1aa/h7YIrDo1NUpfqeuv3kjoVLEa4dITBLBrPSIBqOdGQrH2g7obTJI7fJHbbMyu3x3i8gFnJh
	8gaAo9qhU46QK4B5vLZZfpbBJjJpVSH5AJd8F/oZfxZrwcHgJR1pseCZ+kGhIzNe4U8PBQ120e63F
	nnEIFGYKXaHaqmcdNYYeTRjKA8dtepaIZ1t3R9NQ7FchoYJ2nESizIKy4jewAgdweZzG1NaNQ85NW
	5SvruHs54MAbqrFonQrqi8VqPSddCK5FNBQgHiLk9tN6vt/YqaMn7dxWZ3UMDkE0nrMPdE5+1zQMv
	5I0liKg3Ub87YNAJ7L5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nybCD-008IO6-Pz; Tue, 07 Jun 2022 15:32:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nybCA-008ILy-DT
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 15:32:39 +0000
Received: by mail-ed1-x52a.google.com with SMTP id b8so6822814edj.11
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8mWAcxmdEaXtXEf9bkpBT1dXxrFHE82EQI8/Jd/D+m0=;
        b=GPfz/jg87i8Zik3e8kzVXPFh+GLz9PHfv82fQeGPkCn0GfiS5QUaw/pZFKY3MMdomI
         /LuGFP+pL0A4/djAMIc8djgLEpFxw3hqlfiemCoHbAJraq7EEdYsE7sHKSJQfkCWxDhT
         erwf8YK192cyUffD1u6jI914YqFVstgnWVijI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8mWAcxmdEaXtXEf9bkpBT1dXxrFHE82EQI8/Jd/D+m0=;
        b=7h4UomXtgdl36pXvTMrejo+KqfleYO1Er1J0jkG9wqs9rN+SyL6y2EJEV3RlZn9oeN
         shKYz6zfyufrxB5/apXhZZ4AtbPlFuPitxINLMQDJn847KNZyj7v+jfSO3CCc5YcxmCP
         emg2qAtvFavABeuweubefp+MaAxdWYwHFjozPCfEQl83YM27a8HC2U9DzBCJ5dBEl6Eb
         8lkFV0siwcine/Qrg/Ub/K4hVuTK6thgSR3lMXnfk/g7e3LR/0HGh5iy3qQNvERanmOo
         lktfyJ9strh5ZyCDYw+YrfdR2PrIjOTdtlPUC1JTRPtwqJsqwdlROPsErLKJeRLi9UFn
         qqjg==
X-Gm-Message-State: AOAM533gJKWQQCPhUsfZdxsJj0FUVMwQ3rkRO5g7L4GBk7Sw8/m0g/AS
	mnqB0wtifQcWfYzcx/aIqIcJvfvwJB8bM/Yb
X-Google-Smtp-Source: ABdhPJzZT5TQKrj0qzuPrX741xkt+KA5SrR5lLi2DfATtXI/aFuT7Aeb7SwPEw6RIXRViuRtuXplpA==
X-Received: by 2002:aa7:c450:0:b0:431:55c6:29f9 with SMTP id n16-20020aa7c450000000b0043155c629f9mr14070635edr.14.1654615953880;
        Tue, 07 Jun 2022 08:32:33 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709064ac900b006f3ef214e20sm7747769ejt.134.2022.06.07.08.32.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 08:32:32 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id q26so14322600wra.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 08:32:32 -0700 (PDT)
X-Received: by 2002:a5d:608d:0:b0:218:3cfa:afe9 with SMTP id
 w13-20020a5d608d000000b002183cfaafe9mr12177876wrt.422.1654615951748; Tue, 07
 Jun 2022 08:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220607090549.2345795-1-hsinyi@chromium.org> <20220607090549.2345795-9-hsinyi@chromium.org>
In-Reply-To: <20220607090549.2345795-9-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Jun 2022 08:32:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xe=iEh080QjE+Awgw0Q+Rb=xnrAj6OtO3EXp==XgvD0g@mail.gmail.com>
Message-ID: <CAD=FV=Xe=iEh080QjE+Awgw0Q+Rb=xnrAj6OtO3EXp==XgvD0g@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
X-CRM114-CacheID: sfid-20220607_083238_520128_8053A221 
X-CRM114-Status: GOOD (  31.17  )
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

Hi,

On Tue, Jun 7, 2022 at 2:06 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Panel orientation property should be set before drm_dev_register().
> Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
>
> Let the drm driver check if the remote end point is a panel and if it
> contains the orientation property. If it does, set it before
> drm_dev_register() is called.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v4->v5:
> - use the new function in v5.
> - don't use drm_of_find_panel_or_bridge().
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d9f10a33e6fa..998b1237e193 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -185,6 +185,7 @@ struct mtk_dsi {
>         struct drm_encoder encoder;
>         struct drm_bridge bridge;
>         struct drm_bridge *next_bridge;
> +       struct drm_panel *panel;
>         struct drm_connector *connector;
>         struct phy *phy;
>
> @@ -822,6 +823,10 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>                 ret = PTR_ERR(dsi->connector);
>                 goto err_cleanup_encoder;
>         }
> +
> +       /* Read panel orientation */
> +       drm_connector_set_orientation_from_panel(dsi->connector, dsi->panel);
> +
>         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>
>         return 0;
> @@ -836,6 +841,16 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>         int ret;
>         struct drm_device *drm = data;
>         struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +       struct device_node *panel_node;
> +
> +       /* Get panel if existed */
> +       panel_node = of_graph_get_remote_node(dev->of_node, 0, 0);
> +       if (panel_node) {
> +               dsi->panel = of_drm_find_panel(panel_node);
> +               if (IS_ERR(dsi->panel))
> +                       dsi->panel = NULL;
> +               of_node_put(panel_node);
> +       }

While the above works, it feels like we could do better. What about this?

* We add _some_ way to determine if a bridge is actually a
panel_bridge. If nothing else maybe this could be
drm_bridge_is_panel() and it could just check if bridge.funcs ==
panel_bridge_bridge_funcs

* In drm_bridge_connector_init(), when we're looping through all the
bridges we find the panel_bridge if it's there.

* At the end of drm_bridge_connector_init() if we found a panel_bridge
then we call a function like drm_panel_bridge_set_orientation().


Then you can fully get rid of the mediatek patch, right? The above
will only work if you're using a panel_bridge / bridge_connector, but
that's "the future" anyway and we want to encourage people to
transition to that.

-Doug

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
