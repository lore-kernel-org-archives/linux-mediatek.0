Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1632C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 03:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/Kik9axVK37srAAqO7pC+qGrZt5AoZpcPTsohLh3DM=; b=N26/U4IXUWlA/5
	6RXHzJlmlM5/Y5ULOUUp6YBwj8qouXsXHrjvMAOE8fbLTDejiukroMCvEt+lJbO/ppUg1g+95wsK1
	hTsFpnWC+eDV2cZOHHeSMyHuyU3q+aBtXlYMmjpmxM712cs6f39rJd1nUrI6aSrxzEAtyrOaO48Ra
	jhETujA0ZfJF4u73iwK2dTQX/0OPjQFgUi4DpoPpxMdV7Nl5Au4B0O4yEDIgwfQQNfEKt697coHUs
	hoWlnbYj/Ov0FU1nJTq/HN05thxNdKQ8/Px2zMuxe9KJexeI+MdSleRF2qitJHCuPHLJvTBTz+wec
	PDtOVUYsSJIZcM+ukeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJoJd-0002SE-KO; Tue, 15 Feb 2022 03:15:45 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJoJQ-0002Oc-Vq
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 03:15:34 +0000
Received: by mail-lf1-x12e.google.com with SMTP id u20so5766951lff.2
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 19:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+P11z1Rjs9Tcih/Zook2fZ60KP4QhmCWOTSK5iKxWk=;
 b=N4nYj7rNTC5uHpVcGL9QlugWcvGRZTp+CiKvYeKf6QUKM4NHmpN97jHR5JAyLwHU0G
 majfPSjK77b6t7X4lhovHCqFEO9SKlCLRi0DdE6BDr2pljCbwZc8Y9ndC4l5LcpZmSKW
 hvN2WlQweb/oFJ9OJ7+bDCb4FLOS9Ok0j1ryA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+P11z1Rjs9Tcih/Zook2fZ60KP4QhmCWOTSK5iKxWk=;
 b=Gs3FmthA4DD5gRCdTCka0bscvs08Fum1a4hbeCjbQXvN94xLqc6ZOMsbUpeei5uODh
 HgB2ji7gyNCm0ReqK7eNJnuMJHZg9Hk8FE1hucd7/EcgmLTXxy55zr+1FGhzEPTCutqY
 l4itprsC7cMniRme/w2IIteu5Eks7u9LiHrW60dCrE1faMRF7MsupVtaNL838M03gjhm
 Ed2oDggdtOM4qEfxsYuQRkXWFxP1RMBvS9XAm+EBtUhGgGTOv657Rxq5rpohdvhL1ISV
 3CPTqPYaxW7g2gcPGlTmz1Rbg8M+nPP5MpIanqAjeGYKhZGrwjEz6AWtduNGWWrPn3q6
 TG1g==
X-Gm-Message-State: AOAM533dC1fx9C7aML8Kj+m3l9LOuTKiPE5O4vStXtLIw/xakEtqei5Z
 bs3T8sMbj0aaR+IvlK2lqo5AgqGRv5dIulRIzTyb60qnYMMntg==
X-Google-Smtp-Source: ABdhPJzcbB9EByvT8Z4nbkpVZTyBXtRJOPYoyd47w64TJMSIQNnBwmZMUvf0GIvBRqtwNFPqBweHvkB8bEuLFTrC7OU=
X-Received: by 2002:a05:6512:1699:: with SMTP id
 bu25mr1543879lfb.403.1644894928818; 
 Mon, 14 Feb 2022 19:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <87leydhqt3.fsf@collabora.com>
In-Reply-To: <87leydhqt3.fsf@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 15 Feb 2022 11:15:02 +0800
Message-ID: <CAJMQK-igpiYj-pkgG9amrQuVzf1Mc9BDDOwOdKLUbceKr=CHiQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] gpu: drm: separate panel orientation property
 creating and value setting
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_191533_068947_2D6DADB4 
X-CRM114-Status: GOOD (  27.84  )
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

On Tue, Feb 15, 2022 at 9:17 AM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Hsin-Yi Wang <hsinyi@chromium.org> writes:
>
> > drm_dev_register() sets connector->registration_state to
> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > drm_connector_set_panel_orientation() is first called after
> > drm_dev_register(), it will fail several checks and results in following
> > warning.
>
> Hi,
>
> I stumbled upon this when investigating the same WARN_ON on amdgpu.
> Thanks for the patch :)
>
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index a50c82bc2b2fec..572ead7ac10690 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -1252,7 +1252,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
> >   *   INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
> >   *   coordinates, so if userspace rotates the picture to adjust for
> >   *   the orientation it must also apply the same transformation to the
> > - *   touchscreen input coordinates. This property is initialized by calling
> > + *   touchscreen input coordinates. This property value is set by calling
> >   *   drm_connector_set_panel_orientation() or
> >   *   drm_connector_set_panel_orientation_with_quirk()
> >   *
> > @@ -2341,8 +2341,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
> >   * @connector: connector for which to set the panel-orientation property.
> >   * @panel_orientation: drm_panel_orientation value to set
> >   *
> > - * This function sets the connector's panel_orientation and attaches
> > - * a "panel orientation" property to the connector.
> > + * This function sets the connector's panel_orientation value. If the property
> > + * doesn't exist, it will try to create one.
> >   *
> >   * Calling this function on a connector where the panel_orientation has
> >   * already been set is a no-op (e.g. the orientation has been overridden with
> > @@ -2373,19 +2373,12 @@ int drm_connector_set_panel_orientation(
> >       info->panel_orientation = panel_orientation;
> >
> >       prop = dev->mode_config.panel_orientation_property;
> > -     if (!prop) {
> > -             prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> > -                             "panel orientation",
> > -                             drm_panel_orientation_enum_list,
> > -                             ARRAY_SIZE(drm_panel_orientation_enum_list));
> > -             if (!prop)
> > -                     return -ENOMEM;
> > -
> > -             dev->mode_config.panel_orientation_property = prop;
> > -     }
> > +     if (!prop &&
> > +         drm_connector_init_panel_orientation_property(connector) < 0)
> > +             return -ENOMEM;
> >
>
> In the case where the property has not been created beforehand, you
> forgot to reinitialize prop here, after calling
> drm_connector_init_panel_orientation_property().  This means
hi Gabriel,

drm_connector_init_panel_orientation_property() will create prop if
it's null. If prop fails to be created there, it will return -ENOMEM.

> drm_object_property_set_value() will be called with a NULL second argument
> and Oops the kernel.
>
>
> > -     drm_object_attach_property(&connector->base, prop,
> > -                                info->panel_orientation);
> > +     drm_object_property_set_value(&connector->base, prop,
> > +                                   info->panel_orientation);
>
>
> --
> Gabriel Krisman Bertazi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
