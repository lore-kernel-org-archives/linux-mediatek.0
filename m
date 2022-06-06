Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02875C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcEi9sZ/iURqnTHhaDbU0z5RTvYcBbSz9K7TSmU6G1M=; b=0x10d1VFRZWJWo
	kBAmdkG4cotfEJf1R9oU3eSqirFCHdCMoVDgjobvrAQv7Decq4yL2l7EkoYLr69+3Ic3G9nWO1dIZ
	tss44tqD1glEKc+nCFH3uLaHrqT9LoA4DZKZgzXxiIGUh5GqplVjC4SHHr6hpghNIabEiruUdzNg7
	COUV3zbvV5GJFsSt3BSpVF57jea8Mw89CiMjeuZ3lz7gsQM0JsbbnfpCk8iSs57B6UMEcbf3zgs5g
	BBRlDFDztcec7fryoravrVKHCUIHh8A17byqc4peedIBAn0Y5rZs+HgRfZKpPBlm5AEI8iJAXXGQa
	iGvLHq33Q0Apub5UEVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDcA-001TdW-VH; Mon, 06 Jun 2022 14:21:55 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDc3-001Taa-7w
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 14:21:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id fd25so19059919edb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=opLWEqC00jn82y4owwASw7k3zRYvjzMou2cjWKLBV64=;
        b=gkHpY3ulU0qVJsCW/7cg5SzAjNDdn7t3avgpO4JqTMDcqwd128gyp/ezfuttq/hmoR
         aLEzdUBdsdu9XlKb5oqWrctb+KeObzqrZ5blifz3w5ziL2IdUk1HAwIZtGb0nj94jxEo
         WdDsmtzzAZ//UM7RfSH9d71dAoQNSW5P6aMlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opLWEqC00jn82y4owwASw7k3zRYvjzMou2cjWKLBV64=;
        b=2UpjgWQFOZ5evO4IBAc/7TyyWXTgoMgvZ9T3WF97tg6J69w9XMSpFh9bD15AqjJc3m
         QY/jBjEAzCnc/aQeMGXkFcPNdOW9I6q3lYiivOxfkZkeP828kG2YaWgWGcgNwhsU8fg+
         f07ALhxrK0b4dPVB3G4yExbhj5JGH6L1gn7axYrt6q0RGB7z+rWX34NgVPXd84FmT+Dm
         BJL4Qolr1PkKlLKCzlmMD0HUgGkG+J3Y5lG8McaPoPPBrzQrAqxNGHHwkj3T1tXGxIGV
         x06LJgIPymKIjtYH7srQvItOGGGRtrNeVsQbSrk/lfUmpXdJQfQZC2P5dCGRaOpgv3De
         x0ng==
X-Gm-Message-State: AOAM530xfvwEozIBv4G5+aJrqAPHy3FZan/1vAO//aIhnhXw0yCJRgYB
	ptr+tNwvBkcBZ1u6h+tb80coMnTWZXjl8Vrw
X-Google-Smtp-Source: ABdhPJzwAvzrB7Y5DTi7amwpSEhkDb+8d5YuI8GfDPeTR3tCbJxjGWqbjFsH8KNskNiTSE6ISOGQZA==
X-Received: by 2002:a05:6402:50:b0:431:69fc:eff4 with SMTP id f16-20020a056402005000b0043169fceff4mr3997184edu.243.1654525304918;
        Mon, 06 Jun 2022 07:21:44 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id ss9-20020a170907c00900b00711d8696de9sm598194ejc.70.2022.06.06.07.21.39
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 07:21:42 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id n185so7754469wmn.4
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:21:39 -0700 (PDT)
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr12815954wmd.118.1654525298761; Mon, 06
 Jun 2022 07:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org> <20220606044720.945964-2-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:21:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7FmkJyyXr4C6jy9-hOhnzgoo=g5tx_3z3rnCCC40Exg@mail.gmail.com>
Message-ID: <CAD=FV=V7FmkJyyXr4C6jy9-hOhnzgoo=g5tx_3z3rnCCC40Exg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
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
X-CRM114-CacheID: sfid-20220606_072147_316077_1EB8DA43 
X-CRM114-Status: GOOD (  20.89  )
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

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN().
>
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
>
> Add an API to return the property from panel to drm/kms driver, so the
> drivers are able to call drm_connector_set_panel_orientation() before
> drm_dev_register().
>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: no change
> ---
>  drivers/gpu/drm/drm_panel.c |  8 ++++++++
>  include/drm/drm_panel.h     | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..4a512ca80673 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -223,6 +223,14 @@ int drm_panel_get_modes(struct drm_panel *panel,
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>
> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
> +{
> +       if (panel && panel->funcs && panel->funcs->get_orientation)
> +               return panel->funcs->get_orientation(panel);
> +
> +       return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> +}
> +EXPORT_SYMBOL(drm_panel_get_orientation);
>  #ifdef CONFIG_OF

nit: there used to be a blank line before the #ifdef but there no
longer is after your patch.

Other than that...

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
