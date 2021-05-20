Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DB9C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 13:05:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5512F610A8
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 13:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5512F610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcIdnA/+AjokRPnfD/0AuM2xzA4JGSfvXNjor7nIJfo=; b=XJXYG2DXdjFHMkCBxH4x3w6AXE
	YjmRIhUrXaEp/CY9fm6NY1oBwyGp8J11psEjFgXXgcHEESzT+lSkhcE5yZtzUjc3pWYpquJisQNDX
	VPpkVuYfs8EqaZg3sEzEHvveEozxr94YOhSP6t7QpI32fQQhmm2KmWFPGaNAFdNV62bbOdTTuS+kZ
	1j9RMt83yFrvuTT7dJW12e7di1sTeLSeq+i2ypp+uKpYITvY6ZBvuAdVjZ5YtVYOAWz/Zq0Ii0b3V
	fMyCRHfBeKVxhaaEHziOd/gse6uOZg50cMGUh3WRrE4NjNbRoxzJgj/IwF47UGkKfJLqtNJ2JXWEB
	CBxsCoaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljiMj-00176p-TN; Thu, 20 May 2021 13:05:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljiLj-0016bt-JK
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 13:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LaILeXDQ0boA1j3FLO8VWLh6qerXlZqRCMq60RpzKEc=; b=DKIfcb3vVBmVeOLZaqnwNlnSrr
 nI+SVvp4GZ5vhoZ348RfSB+7I298afkDMrm+pnUAZOBCHb43xUlX53SCSggqgAcTIUi1gvMKvCOmp
 lwz0H/JBwSPDXLQaYqpbtfYW8uxwBkwLAbHWt+qXF40G9+z7ufZ1ugK8MeUNTW2eGOLozhZkgtD5J
 EJ///laI/3rdD8vj+csxyuq3RCauKKS7lSd5RfUjexVXBE1khb69NWLuz31cG4SmBgW+wEPndhJZ1
 IqLAWBWVSuzITsWTDOK3+Zwhze7DfwfwEaShqLjOf27IDcyRuqWadz7B2vuA2e0H2de9fPhZ7ueK/
 KiRaVu6w==;
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljiLg-00GLyj-95
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 13:04:26 +0000
Received: by mail-io1-xd30.google.com with SMTP id k132so2885056iof.4
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LaILeXDQ0boA1j3FLO8VWLh6qerXlZqRCMq60RpzKEc=;
 b=RLn3xKHobOFvZGz0ghTnYHK5Te1heylHLZDMRa3NHzie16L+RemZXJOUMR8pspyJeI
 SpSZLpUvz2zfoewTkT/8c4ogotCfIxI9BrwEyqbR/i39/NSX+/ddum+nIx8nPzvEf46F
 1Qyv2f8KAfkNMh/WLc9+XBJQbYYB4fbxfiOS8XBmRo5c3fctrNHps/D01fWHNCinljpR
 hQFc7DDzlf55fLKCo2BIkR122dc5qMbMYuu09BSUEfNmMOCwyENSOh4fUgItIcy6I0v8
 oGS+REV9VRblzjm7xKQuuOImHJXunvMud7pkMdkW1Xn9RQZ/TudNEtnKlmd+fkZ+Cony
 9ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LaILeXDQ0boA1j3FLO8VWLh6qerXlZqRCMq60RpzKEc=;
 b=MtAv8xmFr9HsH+F2GiIe3iKcgeY/W+GgeRHB9ladjnhgRqilhTHk6xpbmbbYK58b38
 eec74suTk73/hw/q9lbaYu0qDHmi+6taaboxxwnfe+ugGApugyiBLU6hvdAlckTc2djE
 wFIFHzcXwotjDCOYNT6smdA+Qj7xKLLUMgOh/zGDRAulW+Y/cffDezHBclHOYYFovcOg
 hUUvv0mrX5kXzKxRp/bb7vmgtQvbs0/T0Ept8y9+V/8GW7QAxQVZIKrP+s6ltEd38a3g
 z+iwLsTO8XsDhPLY5le9wMYGL1vPZ0j8yGdydUkpUqyawe3yTc9dpDuaYKt8aD1D4d+3
 28lw==
X-Gm-Message-State: AOAM530AR4JAq9qGBr89E1F2rIXOhliA70AELGQ6AWceDqP7i6g/GeMC
 gxCtq1f64ysFrQ8pDTdcCF6OunO1ccPKepClkbk/bA==
X-Google-Smtp-Source: ABdhPJwfNwnUIs9JCwBhNCCzuYKrbU6/EOU4x7fJTdO30hXcwWQCXXe29GQIVa9BkbOHDSpYhHQrhZMscQ9WkDc7cmU=
X-Received: by 2002:a5d:9959:: with SMTP id v25mr5618382ios.85.1621515860195; 
 Thu, 20 May 2021 06:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210429042834.1127456-1-hsinyi@chromium.org>
In-Reply-To: <20210429042834.1127456-1-hsinyi@chromium.org>
From: Sean Paul <sean@poorly.run>
Date: Thu, 20 May 2021 09:03:44 -0400
Message-ID: <CAMavQK+QTaG0Bgb7cYw=mvKcyaQo4FKPYJPSppUx=CZvo_QJeg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] gpu: drm: separate panel orientation property
 creating and value setting
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_060424_330193_9511E8D5 
X-CRM114-Status: GOOD (  35.08  )
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

On Thu, Apr 29, 2021 at 12:28 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> drm_dev_register() sets connector->registration_state to
> DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> drm_connector_set_panel_orientation() is first called after
> drm_dev_register(), it will fail several checks and results in following
> warning.
>
> Add a function to create panel orientation property and set default value
> to UNKNOWN, so drivers can call this function to init the property earlier
> , and let the panel set the real value later.
>
> [    4.480976] ------------[ cut here ]------------
> [    4.485603] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:45 __drm_mode_object_add+0xb4/0xbc
> <snip>
> [    4.609772] Call trace:
> [    4.612208]  __drm_mode_object_add+0xb4/0xbc
> [    4.616466]  drm_mode_object_add+0x20/0x2c
> [    4.620552]  drm_property_create+0xdc/0x174
> [    4.624723]  drm_property_create_enum+0x34/0x98
> [    4.629241]  drm_connector_set_panel_orientation+0x64/0xa0
> [    4.634716]  boe_panel_get_modes+0x88/0xd8
> [    4.638802]  drm_panel_get_modes+0x2c/0x48
> [    4.642887]  panel_bridge_get_modes+0x1c/0x28
> [    4.647233]  drm_bridge_connector_get_modes+0xa0/0xd4
> [    4.652273]  drm_helper_probe_single_connector_modes+0x218/0x700
> [    4.658266]  drm_mode_getconnector+0x1b4/0x45c
> [    4.662699]  drm_ioctl_kernel+0xac/0x128
> [    4.666611]  drm_ioctl+0x268/0x410
> [    4.670002]  drm_compat_ioctl+0xdc/0xf0
> [    4.673829]  __arm64_compat_sys_ioctl+0xc8/0x100
> [    4.678436]  el0_svc_common+0xf4/0x1c0
> [    4.682174]  do_el0_svc_compat+0x28/0x3c
> [    4.686088]  el0_svc_compat+0x10/0x1c
> [    4.689738]  el0_sync_compat_handler+0xa8/0xcc
> [    4.694171]  el0_sync_compat+0x178/0x180
> [    4.698082] ---[ end trace b4f2db9d9c88610b ]---
> [    4.702721] ------------[ cut here ]------------
> [    4.707329] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:243 drm_object_attach_property+0x48/0xb8
> <snip>
> [    4.833830] Call trace:
> [    4.836266]  drm_object_attach_property+0x48/0xb8
> [    4.840958]  drm_connector_set_panel_orientation+0x84/0xa0
> [    4.846432]  boe_panel_get_modes+0x88/0xd8
> [    4.850516]  drm_panel_get_modes+0x2c/0x48
> [    4.854600]  panel_bridge_get_modes+0x1c/0x28
> [    4.858946]  drm_bridge_connector_get_modes+0xa0/0xd4
> [    4.863984]  drm_helper_probe_single_connector_modes+0x218/0x700
> [    4.869978]  drm_mode_getconnector+0x1b4/0x45c
> [    4.874410]  drm_ioctl_kernel+0xac/0x128
> [    4.878320]  drm_ioctl+0x268/0x410
> [    4.881711]  drm_compat_ioctl+0xdc/0xf0
> [    4.885536]  __arm64_compat_sys_ioctl+0xc8/0x100
> [    4.890142]  el0_svc_common+0xf4/0x1c0
> [    4.893879]  do_el0_svc_compat+0x28/0x3c
> [    4.897791]  el0_svc_compat+0x10/0x1c
> [    4.901441]  el0_sync_compat_handler+0xa8/0xcc
> [    4.905873]  el0_sync_compat+0x178/0x180
> [    4.909783] ---[ end trace b4f2db9d9c88610c ]---
>

+intel-gfx for i915 changes

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v6, v5:
> don't create property in set_panel_orientation.
>
> v4, v3:
> create property in dsi driver and set value in panel.
>
> v2:
> create property in connector init
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210426051848.2600890-1-hsinyi@chromium.org/
>
> v1:
> set panel orientation in dsi driver
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210409045314.3420733-1-hsinyi@chromium.org/
> ---
>  drivers/gpu/drm/drm_connector.c         | 58 ++++++++++++++++++-------
>  drivers/gpu/drm/i915/display/icl_dsi.c  |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c |  1 +
>  drivers/gpu/drm/i915/display/vlv_dsi.c  |  1 +
>  include/drm/drm_connector.h             |  2 +
>  5 files changed, 47 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 7631f76e7f34..7189baaabf41 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1210,7 +1210,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   *     INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
>   *     coordinates, so if userspace rotates the picture to adjust for
>   *     the orientation it must also apply the same transformation to the
> - *     touchscreen input coordinates. This property is initialized by calling
> + *     touchscreen input coordinates. This property value is set by calling
>   *     drm_connector_set_panel_orientation() or
>   *     drm_connector_set_panel_orientation_with_quirk()
>   *
> @@ -2173,8 +2173,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>   * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   *
> - * This function sets the connector's panel_orientation and attaches
> - * a "panel orientation" property to the connector.
> + * This function sets the connector's panel_orientation value. If the property
> + * doesn't exist, it will return an error.
>   *
>   * Calling this function on a connector where the panel_orientation has
>   * already been set is a no-op (e.g. the orientation has been overridden with
> @@ -2205,19 +2205,11 @@ int drm_connector_set_panel_orientation(
>         info->panel_orientation = panel_orientation;
>
>         prop = dev->mode_config.panel_orientation_property;
> -       if (!prop) {
> -               prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> -                               "panel orientation",
> -                               drm_panel_orientation_enum_list,
> -                               ARRAY_SIZE(drm_panel_orientation_enum_list));
> -               if (!prop)
> -                       return -ENOMEM;
> -
> -               dev->mode_config.panel_orientation_property = prop;
> -       }
> +       if (WARN_ON(!prop))
> +               return -EINVAL;
>
> -       drm_object_attach_property(&connector->base, prop,
> -                                  info->panel_orientation);
> +       drm_object_property_set_value(&connector->base, prop,
> +                                     info->panel_orientation);
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation);
> @@ -2225,7 +2217,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
>  /**
>   * drm_connector_set_panel_orientation_with_quirk -
>   *     set the connector's panel_orientation after checking for quirks
> - * @connector: connector for which to init the panel-orientation property.
> + * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   * @width: width in pixels of the panel, used for panel quirk detection
>   * @height: height in pixels of the panel, used for panel quirk detection
> @@ -2252,6 +2244,40 @@ int drm_connector_set_panel_orientation_with_quirk(
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
>
> +/**
> + * drm_connector_init_panel_orientation_property -
> + *     create the connector's panel orientation property
> + *
> + * This function attaches a "panel orientation" property to the connector
> + * and initializes its value to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
> + *
> + * The value of the property can be set by drm_connector_set_panel_orientation()
> + * or drm_connector_set_panel_orientation_with_quirk() later.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_init_panel_orientation_property(
> +       struct drm_connector *connector)
> +{
> +       struct drm_device *dev = connector->dev;
> +       struct drm_property *prop;
> +
> +       prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> +                       "panel orientation",
> +                       drm_panel_orientation_enum_list,
> +                       ARRAY_SIZE(drm_panel_orientation_enum_list));
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       dev->mode_config.panel_orientation_property = prop;
> +       drm_object_attach_property(&connector->base, prop,
> +                                  DRM_MODE_PANEL_ORIENTATION_UNKNOWN);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_init_panel_orientation_property);
> +
>  int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>                                     struct drm_property *property,
>                                     uint64_t value)
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index 9282978060b0..5ac4538e4283 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1903,6 +1903,7 @@ static void icl_dsi_add_properties(struct intel_connector *connector)
>
>         connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>
> +       drm_connector_init_panel_orientation_property(&connector->base);
>         drm_connector_set_panel_orientation_with_quirk(&connector->base,
>                                 intel_dsi_get_panel_orientation(connector),
>                                 connector->panel.fixed_mode->hdisplay,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a5231ac3443a..f1d664e5abb2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5263,6 +5263,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>         intel_panel_setup_backlight(connector, pipe);
>
>         if (fixed_mode) {
> +               drm_connector_init_panel_orientation_property(connector);
>                 drm_connector_set_panel_orientation_with_quirk(connector,
>                                 dev_priv->vbt.orientation,
>                                 fixed_mode->hdisplay, fixed_mode->vdisplay);
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 9bee99fe5495..853855482af1 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1632,6 +1632,7 @@ static void vlv_dsi_add_properties(struct intel_connector *connector)
>
>                 connector->base.state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>
> +               drm_connector_init_panel_orientation_property(&connector->base);
>                 drm_connector_set_panel_orientation_with_quirk(
>                                 &connector->base,
>                                 intel_dsi_get_panel_orientation(connector),
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1922b278ffad..4396c1c4a5db 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1696,6 +1696,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>         struct drm_connector *connector,
>         enum drm_panel_orientation panel_orientation,
>         int width, int height);
> +int drm_connector_init_panel_orientation_property(
> +       struct drm_connector *connector);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>                                           int min, int max);
>
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
