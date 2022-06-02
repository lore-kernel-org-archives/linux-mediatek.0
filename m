Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490AAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 21:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I14V+YpWolcKU1d4P4z/cZmMOcongHYkzaVQIpQS070=; b=i+fFnFloc3rJ4b
	IHEbOLdj5AXssNaHN2htwOQiIpZEpY4dU3HkbLGkhz2yDW8VTwwV7UW9Zhm2LWlUuhJRov/8A4+vu
	A5G0IDmJLfvEE1VWUJqbWOHQ7IrmNtA4I6/7T02uNasrOXeyXCe1wpUoZAzdqmYKCKVvmkMpFNqc9
	JkXf1dBvKExvT1NeITDyJF5OxF7iTDRjEvgEerGgfloZECB6nxxTZlNLDKML3RImo0MN6XIWPVNtV
	xOVMnwRMt3N0PVzwlUqintEjqtYy1Zanvbd/6zsIXkuWuP0bbMaWmBwJNI2GpulFjisDN99rIFesA
	SzY+H/OTWjPyqTzZsdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwsbU-004PGv-VD; Thu, 02 Jun 2022 21:43:40 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwsbS-004PGH-9q
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 21:43:39 +0000
Received: by mail-ed1-x52f.google.com with SMTP id w27so7880378edl.7
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XGSI2I0W6obVN72SR94f17TgsNITtbd3TUyps87cem0=;
        b=I8AbK3106c0NrpQBVIg8yCXzXJPrksGELjkTUDJqqYSxzU9eZC8iQ/NMFM/geGRG67
         73F09t9HkHA/VKsA38Qhq4yt4s8Y5hjkDE5abmeqFTz7RgSZJick4aW5MxbxrGHkX0JB
         p1/OipPLgx9HSZ0DWFbl37ExGobwR46qdR7iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XGSI2I0W6obVN72SR94f17TgsNITtbd3TUyps87cem0=;
        b=FM2znM9bFv+3RuuhB4d/3f8m72QJGdTlf1N774oJMdfOp8pCfGBdebWsXNvpLlcxoW
         rL25t4ZxG3zdzj5R7EA/2A932zCcUPhyx8V44FOYjjUDO/5mvC4f6aYRCAs7JL/XmdI3
         tosBF+JuWfUo4LkJSwlhmPppo2VB1uZHYwNmM0Rg/OPQYPdfkdpSrqeRYDm58W8k6k4K
         nIY2yU0GWmitQxOvJVBjdrVFvEvw7G+FjKzVbM8QjxaHM6jPNhVCgj6p+l9FXiKexfy0
         OE8n0h47yjtmORJ9ZeSaWhoi6MqyCdro2maUTx7FjWrG7ZhH6hFvWd+idFLI2omK86A/
         WM9Q==
X-Gm-Message-State: AOAM531azHscZDSgj9LQmqvrcBLHDDP9bJ1EJh1HzkmuC4twyDAj4cwe
	Ra+yptvzW9ylvOaRvxX2hHzRGUUdhEwIKVLl
X-Google-Smtp-Source: ABdhPJzD6f5jaDCbU+TYNlGuB/bAbLkR/ih11qSVg58MomwSX4YnrKsUuphVhc9gf6EU+2A1IVpDmg==
X-Received: by 2002:a05:6402:350b:b0:42d:d565:a62a with SMTP id b11-20020a056402350b00b0042dd565a62amr7444304edd.172.1654206215127;
        Thu, 02 Jun 2022 14:43:35 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id l4-20020a170906644400b006feb047502bsm2120584ejn.151.2022.06.02.14.43.33
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 14:43:34 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id m32-20020a05600c3b2000b0039756bb41f2so3401593wms.3
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 14:43:33 -0700 (PDT)
X-Received: by 2002:a05:600c:2e53:b0:397:4730:ee7a with SMTP id
 q19-20020a05600c2e5300b003974730ee7amr34358678wmf.118.1654206213425; Thu, 02
 Jun 2022 14:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220601094637.1200634-1-hsinyi@chromium.org> <20220601094637.1200634-4-hsinyi@chromium.org>
In-Reply-To: <20220601094637.1200634-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Jun 2022 14:43:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnA80P7BoaAX6JD9Q4ggnk4g4M3wmJFEDNij3+10aL4g@mail.gmail.com>
Message-ID: <CAD=FV=XnA80P7BoaAX6JD9Q4ggnk4g4M3wmJFEDNij3+10aL4g@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/panel: panel-edp: Implement .get_orientation callback
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
X-CRM114-CacheID: sfid-20220602_144338_410315_D03E7643 
X-CRM114-Status: GOOD (  23.13  )
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

On Wed, Jun 1, 2022 at 2:46 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 1732b4f56e38..a2133581a72d 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -609,6 +609,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
>         return p->desc->num_timings;
>  }
>
> +static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
> +{
> +       struct panel_edp *p = to_panel_edp(panel);
> +
> +       return p->orientation;
> +}
> +
>  static int detected_panel_show(struct seq_file *s, void *data)
>  {
>         struct drm_panel *panel = s->private;
> @@ -637,6 +644,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
>         .prepare = panel_edp_prepare,
>         .enable = panel_edp_enable,
>         .get_modes = panel_edp_get_modes,
> +       .get_orientation = panel_edp_get_orientation,
>         .get_timings = panel_edp_get_timings,
>         .debugfs_init = panel_edp_debugfs_init,
>  };

I'm curious: should we be removing the old
drm_connector_set_panel_orientation() from panel_edp_get_modes()?
...or maybe you want to keep it for now because you're only adding
support to the mediatek driver and for other drivers the WARN_ON is
better than no orientation support at all?

Maybe you could put a comment next to the old
drm_connector_set_panel_orientation() saying that it's deprecated and
that drm drivers are expected to add a call to get_orientation()? Then
when people see the WARN_ON splat they'll quickly figure out how to
fix it. ...and eventually we can probably remove all the old calls
from get_modes() ?

-Doug

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
