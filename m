Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3179DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16KrMAj9R0JQ39KS7DRljQMgtlXvP2/CMNlwqCLp3aY=; b=dIFvcMUgB84ZLd
	Sqs8YEOfwUfmoTVi3g/IhMRIzohSndxmtpduPX1mK8brO5aJkLdPSOj4cJdKf+9eQh9/hVdru6YNg
	kJ/nzL2f7fntb3EMPpRrocLEPt4FSh6dG4tBR28Ia3XqVQkV45jtzUXEyipPzDDRiWeovFkJf0yIZ
	hUcONpwJkPTxrv34PDvySwT/TNfmAC4S0nSQZLi3joOxcQLntT8tTGeR26Bo5wnGlj3qmGDbatoyR
	vkYZNLRvPAKH4I0RmXSzesSg/ucWc63DVFfRDwoSlctsyaoZ+fW10ZuOMxDOVXDnaVZ2It9fuGqwK
	xPC6FauT6m4W+uCEuTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJxZx-002mix-LZ; Tue, 15 Feb 2022 13:09:13 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJxZh-002mV2-8P
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 13:09:05 +0000
Received: by mail-il1-x12c.google.com with SMTP id e11so13814964ils.3
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Feb 2022 05:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h8vn3ZFW8UjLnMLsgl86dcA80MaxOlksJ/pmKV8vWGU=;
 b=Xw6MjLP9Kt6wH/XPSkTrQGGvUPWDpKraFYxM4d6yH3RKbYA/YECy72aCJttKSuP587
 10FtshqY75bNZ0wPI428PCyMW2OAb6yh/TT1o8uOiXl/AYRQtBPDYcnJeIpx7cQYKuhp
 wqae+oOmMT9dVZpOYgXDUMAKab0DYkhYdVNJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h8vn3ZFW8UjLnMLsgl86dcA80MaxOlksJ/pmKV8vWGU=;
 b=12pxSm+sfcRR9bSZuTS3UxlZnSJYtE/NOOAPq9QBxktfll0QyXDds2nBo+b39RFXzM
 QfyI0D0twZTXWWre1okQeqbvd26+265O+iOSeYVJWMK0KxrhXtZ4idMyFHJkyBoUgByL
 stgs5P1kL7aK5jzbn7BmwWzPUxf+3zlF/Ke3rCklWjZfPIb//O+sspRTHpC6CuY/LbzR
 ne9llUsUOUq5pgILE2PzHlb8vVS6TiZ+WK6sBAxPJZ6Vrqoh7o+U0cmwf2Y0y62l1tNt
 sFq6v1HVMftRXotnnSpj/GifP4eSD+ZiN8jYZ9zYZvQ3jbEm1LfdiMXKSOlUFLW7+cCu
 Ja2A==
X-Gm-Message-State: AOAM530ngAuyEqeN2kMU2OdgnaSXTeLqLjW/bupgiPZQrSInvJ2opNTC
 5FqG9hWYQoXyANoDr0CI8fYRj2G7N1ZtL+LLVKE0Pg==
X-Google-Smtp-Source: ABdhPJyn0t3qtaQoYKT56xmJWFr+oDNaEgC/gP1GxkSxrJmyzV5aD6tH7GwuIxyug6WO9KvMRXh2z7t2mVNvKMkI28E=
X-Received: by 2002:a05:6e02:18c6:: with SMTP id
 s6mr2544341ilu.230.1644930522121; 
 Tue, 15 Feb 2022 05:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <87leydhqt3.fsf@collabora.com>
 <CAJMQK-igpiYj-pkgG9amrQuVzf1Mc9BDDOwOdKLUbceKr=CHiQ@mail.gmail.com>
 <87czjoixno.fsf@collabora.com>
In-Reply-To: <87czjoixno.fsf@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 15 Feb 2022 21:08:16 +0800
Message-ID: <CAJMQK-gvvvhj2dsu8bkT6ytj=0MZaRFmsVOqJVrtVo4Y+XCEdQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220215_050857_310235_C13C2EA1 
X-CRM114-Status: GOOD (  33.68  )
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

On Tue, Feb 15, 2022 at 12:03 PM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Hsin-Yi Wang <hsinyi@chromium.org> writes:
>
> > On Tue, Feb 15, 2022 at 9:17 AM Gabriel Krisman Bertazi
> > <krisman@collabora.com> wrote:
> >>
> >> Hsin-Yi Wang <hsinyi@chromium.org> writes:
> >>
> >> > drm_dev_register() sets connector->registration_state to
> >> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> >> > drm_connector_set_panel_orientation() is first called after
> >> > drm_dev_register(), it will fail several checks and results in following
> >> > warning.
> >>
> >> Hi,
> >>
> >> I stumbled upon this when investigating the same WARN_ON on amdgpu.
> >> Thanks for the patch :)
> >>
> >> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> >> > index a50c82bc2b2fec..572ead7ac10690 100644
> >> > --- a/drivers/gpu/drm/drm_connector.c
> >> > +++ b/drivers/gpu/drm/drm_connector.c
> >> > @@ -1252,7 +1252,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
> >> >   *   INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
> >> >   *   coordinates, so if userspace rotates the picture to adjust for
> >> >   *   the orientation it must also apply the same transformation to the
> >> > - *   touchscreen input coordinates. This property is initialized by calling
> >> > + *   touchscreen input coordinates. This property value is set by calling
> >> >   *   drm_connector_set_panel_orientation() or
> >> >   *   drm_connector_set_panel_orientation_with_quirk()
> >> >   *
> >> > @@ -2341,8 +2341,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
> >> >   * @connector: connector for which to set the panel-orientation property.
> >> >   * @panel_orientation: drm_panel_orientation value to set
> >> >   *
> >> > - * This function sets the connector's panel_orientation and attaches
> >> > - * a "panel orientation" property to the connector.
> >> > + * This function sets the connector's panel_orientation value. If the property
> >> > + * doesn't exist, it will try to create one.
> >> >   *
> >> >   * Calling this function on a connector where the panel_orientation has
> >> >   * already been set is a no-op (e.g. the orientation has been overridden with
> >> > @@ -2373,19 +2373,12 @@ int drm_connector_set_panel_orientation(
> >> >       info->panel_orientation = panel_orientation;
> >> >
> >> >       prop = dev->mode_config.panel_orientation_property;
> >> > -     if (!prop) {
> >> > -             prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> >> > -                             "panel orientation",
> >> > -                             drm_panel_orientation_enum_list,
> >> > -                             ARRAY_SIZE(drm_panel_orientation_enum_list));
> >> > -             if (!prop)
> >> > -                     return -ENOMEM;
> >> > -
> >> > -             dev->mode_config.panel_orientation_property = prop;
> >> > -     }
> >> > +     if (!prop &&
> >> > +         drm_connector_init_panel_orientation_property(connector) < 0)
> >> > +             return -ENOMEM;
> >> >
> >>
> >> In the case where the property has not been created beforehand, you
> >> forgot to reinitialize prop here, after calling
> >> drm_connector_init_panel_orientation_property().  This means
> > hi Gabriel,
> >
> > drm_connector_init_panel_orientation_property() will create prop if
> > it's null. If prop fails to be created there, it will return -ENOMEM.
>
> Yes.  But *after the property is successfully created*, the prop variable is still
> NULL.  And then you call the following, using prop, which is still NULL:
>
> >> > +     drm_object_property_set_value(&connector->base, prop,
> >> > +                                   info->panel_orientation);
>
> This will do property->dev right on the first line of code, and dereference the
> null prop pointer.

Ah, right. Sorry that I totally missed this.
I'll fix it in the next version if the idea of this patch is accepted.
There might be another preferred solution for this.

>
> You must do
>
>   prop = dev->mode_config.panel_orientation_property;
>
> again after drm_connector_init_panel_orientation_property successfully
> returns, or call drm_object_property_set_value using
> dev->mode_config.panel_orientation_property directly:
>
>   drm_object_property_set_value(&connector->base,
>                         dev->mode_config.panel_orientation_property
>                         info->panel_orientation);
>
> --
> Gabriel Krisman Bertazi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
