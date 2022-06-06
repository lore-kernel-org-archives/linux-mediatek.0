Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC0BC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYOUY/Y6rx8Zk+aH/CyCiuz355NL3qgy6YbqKF6bNFA=; b=Z5aWAE4wh6TAlB
	z9vXUp0WkWXGRZbM5uk8FyqAQg5G4mXMp+oe5q21Va/AqmcQWYH1MiyOYAYYSJcPg99GFA87Vs9mB
	i/+VdhKfRg0M40tuzJINNL9WFoJ/CvhJO4Qokgxv9Yj6/nXjsQ6pCkbCfFmp5Vb46cH6S+arWG6lW
	ZYdKVOPehZP4dmg0YZ0WnZ7tPLgYQL8139eZhhf2NcNq13e/5QIln4eWq+PtHn4IWjpv7AeJaKl/i
	NNsmmfK/Cf4QIf4qg8CAI9DsR4E7eEXW72c3uMcIeWlLXDGK0zKVj4U2jhvEjuuBhPFGqcuHOB01d
	a6wDx501fcX97BFO6D3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyI67-002PKN-Bl; Mon, 06 Jun 2022 19:09:07 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyI5w-002PFi-6U
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 19:08:57 +0000
Received: by mail-oi1-x22b.google.com with SMTP id y69so7128246oia.7
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=U+d48J6VO4jwWOwK4nY7MppUng+HS6f87TdgczeTWfA=;
        b=jbYQLfVc8E3vRnH/nAaGpEpu3GBx4LeR4+rgdiFOihSxweRGcyNUDXo8oXTht50+6z
         vCTaJSGT4TIKqAoQCMUYxwZN9KwxGDwPDjCxGedcYvmUQ583rhPZD1tmOJE3v34dIpjn
         C98AM8dS6nf6IlEL28J7wSLX2wRF8ySv7yZOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=U+d48J6VO4jwWOwK4nY7MppUng+HS6f87TdgczeTWfA=;
        b=yxgXGse06MxGOaREzMSrsCX86T1uJHdTq58s4ZXzwMNK4ZwdWa1M8SDqVpLfWJiL/I
         op/vq88fZ4cO1+9dIXAROwcZqoDI58Bf57BVdVJvXWeDRuWaErdy73HBHRlGHdZkE70N
         ruYHbCvZNC6Y6XiG6QUMtltZlnYJ8fpF5U2VnXvwV+kgg/zKvoYIkk+5l/a552eFWw9X
         ExjjqdGAjEgJRkJ8c32JWYt4gvA9gm/SwTUVw3WAb+DBIYjXks7Iv1jivYC2gHXaH6jn
         FCPSK57EBrXrN9f+8J2q5NzQhGUZEMEEkMTWF7f3QX6uSEGeT7OESQOPJruhZosbSLrX
         20yQ==
X-Gm-Message-State: AOAM531JspX8R+YJE7GeccDqekLRzF4B2IuN8TOyMu8pgUbh/p3RrB8/
	l/g0ExRUu1LDlDt7Y5vng7nNaODHOkCMfWoTpKDLRg==
X-Google-Smtp-Source: ABdhPJy4c94CssdxgDB7cICSjvhkR/T7a00ZnGxM1AaOQjnzXXHNZCZXMZRtPZa2NcP41pwS569R9SzLPrA11kDyVIA=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr11740857oil.193.1654542527131; Mon, 06
 Jun 2022 12:08:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jun 2022 12:08:46 -0700
MIME-Version: 1.0
In-Reply-To: <20220606152431.1889185-5-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org> <20220606152431.1889185-5-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 6 Jun 2022 12:08:46 -0700
Message-ID: <CAE-0n51xPADPVcBH7QRh96t7q=mx4VhxrEb1cZENcsu7Z=Nv0A@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/panel: lvds: Implement .get_orientation callback
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	Rob Clark <robdclark@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_120856_283516_767BD782 
X-CRM114-Status: GOOD (  11.85  )
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

Quoting Hsin-Yi Wang (2022-06-06 08:24:27)
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index f11252fb00fe..491b64c2c8d6 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -99,15 +99,30 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
>         drm_display_info_set_bus_formats(&connector->display_info,
>                                          &lvds->bus_format, 1);
>         connector->display_info.bus_flags = lvds->bus_flags;
> +
> +       /*
> +        * drm drivers are expected to call drm_panel_get_orientation() to get
> +        * panel's orientation then drm_connector_set_panel_orientation() to
> +        * set the property before drm_dev_register(). Otherwise there will be
> +        * a WARN_ON if orientation is set after drm is registered.
> +        */

Should this comment also be a "TODO: Remove once all drm drivers call
drm_connector_set_panel_orientation()"?

>         drm_connector_set_panel_orientation(connector, lvds->orientation);
>
>         return 1;
>  }
>
> +static enum drm_panel_orientation panel_lvds_get_orientation,(struct drm_panel *panel)

Stray comma here                                            ---^

> +{
> +       struct panel_lvds *lvds = to_panel_lvds(panel);
> +
> +       return lvds->orientation;
> +}
> +

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
