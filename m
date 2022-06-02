Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD422C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7mJccDEWEJ90KwIeQfFnJ0JrwdhiykptFcHxoxE6m0=; b=dFGEt13iHPcmPq
	Ng0Yg4KkKcB7taPQappwQ28ipi32QA5HeMY5wNX+9H0Pj0e7FpK3VeXjPBSq36csfhIz8uqE95OrO
	zDbwasY/dCUmv2lWatwRGIHfULhfl8yfkt4emGZbKVrT9JPi6KWdHHKTLuhzrZMh5oZ9OBfugny7d
	kS3fcb7snon6VfECqhX2RqydT+8OGcw8Rs2LBEMO/XeNI0pJYG0Y0eGWppXVW785IQm2zpPtNd8WA
	COcrYiEtu8ZtmFC5F2Zj4xp1NKqhwGqweeSoTqN0oba4jBPWGe4CWJ0NEJGAbcWA5wiGUefNk8zf2
	dBqsB4UCtYtnJpqps69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwslK-004S9K-N8; Thu, 02 Jun 2022 21:53:50 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwslI-004S4v-8x
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 21:53:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id s6so928873eja.0
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 14:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PlQ+AfYx33ch5Af1MOc8eSZOWrp4sa+5BG8p2IQdVOQ=;
        b=LQbMJioZzGwe6/fK5um+5Ha94Y3saA4t6tLL33c0D7+smsDYIjGyCJ62XISlVIfDnb
         k7+IGE4QIPIQO60LtADGNIslNBNGIZ5QqLEoOEwAapZhW8OmMhz8yMIQrfL9zX/HltC7
         qkwO9hwIWO1HMZSqakKMcSasFiJdp5cXvDCAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PlQ+AfYx33ch5Af1MOc8eSZOWrp4sa+5BG8p2IQdVOQ=;
        b=d8UTTDqVXFbSlEGkgsmtsjqa/uiB3+YIkqEfnSwMWtewJPvewM1fbzIuUlW7ep3SlR
         IEs89B52sUjt8I9EllL+19jRLsuD6r7VR42MaGtYtiASFA0d60Oa5Z3okDU9ZIIdfgPP
         te29q0DGWaiK3g6xM5rouotyumc0WVV8QWYLuWuJ1/LhBcZKtY4lwcNNC0gDSZnu40JC
         GQw4YDDUsVABAqY5mndaEwpP9LB9hC7P3eVmSxnvpufOS/RfuKeJhTyN3kNIkzN+xj58
         paadl6wA4LqSsfzslH0TlZCfSktEdrikMNIg5zv4BNi8Ima3RSEprJ+nNtRmkyiRXnKN
         3Rfg==
X-Gm-Message-State: AOAM532Lss3lMIu9ZFP/zvlcG8Nd1VCnbkW8InbRGaTuzhXPsBzkFUrD
	3Pv/07xFiTfzhE0WlTDW45XtpP9ElBca/NHE
X-Google-Smtp-Source: ABdhPJyy/KnGqw8ilFRMp7kcbtkKv3fNz/S8knTtUvfdktBwjxBij3HN3AIsLURMWtYvGDgss0IUgg==
X-Received: by 2002:a17:906:6806:b0:703:1f4e:9868 with SMTP id k6-20020a170906680600b007031f4e9868mr6065005ejr.699.1654206820525;
        Thu, 02 Jun 2022 14:53:40 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906300800b00704dccefd2bsm2110304ejz.204.2022.06.02.14.53.39
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 14:53:40 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id a10so662197wmj.5
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 14:53:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4f0c:b0:397:75d7:613 with SMTP id
 l12-20020a05600c4f0c00b0039775d70613mr35121379wmq.34.1654206512562; Thu, 02
 Jun 2022 14:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220601094637.1200634-1-hsinyi@chromium.org>
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Jun 2022 14:48:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+5GAUBh_ZMPeKhqxQXxau2OKCbt3p2QmsDhROf207dA@mail.gmail.com>
Message-ID: <CAD=FV=W+5GAUBh_ZMPeKhqxQXxau2OKCbt3p2QmsDhROf207dA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add a panel API to return panel orientation
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
X-CRM114-CacheID: sfid-20220602_145348_368723_7707CEC8 
X-CRM114-Status: GOOD (  20.23  )
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
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN()[1].
>
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
>
> The series add a panel API drm_panel_get_orientation() for drm/kms
> drivers. The drivers can use the API to get panel's orientation, so they
> can call drm_connector_set_panel_orientation() before drm_dev_register().
>
> Panel needs to implement .get_orientation callback to return the property.
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/
>
> Hsin-Yi Wang (8):
>   drm/panel: Add an API drm_panel_get_orientation() to return panel
>     orientation
>   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
>   drm/panel: panel-edp: Implement .get_orientation callback
>   drm/panel: lvds: Implement .get_orientation callback
>   drm/panel: panel-simple: Implement .get_orientation callback
>   drm/panel: ili9881c: Implement .get_orientation callback
>   drm/panel: elida-kd35t133: Implement .get_orientation callback
>   drm/mediatek: Config orientation property if panel provides it
>
>  drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
>  drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
>  drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
>  drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
>  drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
>  include/drm/drm_panel.h                        | 10 ++++++++++
>  9 files changed, 77 insertions(+)

Seems reasonable to me. I added a request to the panel-edp patch that
probably applies to all of the panel patches requesting a comment next
to the old calls in get_modes().

I assume that all but patch #8 ought to land through drm-misc. I'm
happy to help commit them once everyone is happy. If the Mediatek
maintainer(s) want to Ack patch #8 I can land that in drm-misc too. If
we want something fancier like an immutable branch you'll probably
have to get someone involved that's got a higher drm pay grade than
me. ;-)

-Doug

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
