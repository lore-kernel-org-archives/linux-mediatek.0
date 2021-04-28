Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D27C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:17:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21CD4613DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21CD4613DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=URCbf7pYkzQ/PuuSTrWdWDJ+dYgqZiEbEdDCVOTYhLg=; b=BgwjY+ffA+NsrfRBazx3fnHJn
	2j7SfaI5d8FDyoWLh8gIym/ZLSs6iMv0lxdAmbTCYidRUWjX+LNlyYIhkMSPCQUeoquTh7K9rqPcP
	XmI6HdbIKnJ9XNb1QTfbHS+EHNCcR8iXSBrYwR61KklAhzRNCyoacfr7KoPnce4AifvZ+ybc9Z8wW
	i1TwDaJO0Gnnk2Swnv8bavGRKrB3fFpF5bBINj8t2K7rhKYeUn6ETHaGZ7YAjsip6f7YgljlVNQYM
	OIRQFo7qldc42tYf9hDLlqA0YCE9gM/4ZFwp8r9E7viCcFssosCfuAx6UxsntpzO//Z4YiIqY8K7R
	zGYcC77hQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbmrj-003olD-F4; Wed, 28 Apr 2021 16:16:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmrg-003oky-7O
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 16:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6XXKhWivBSiK0NUKDt4xItDduSTkSI/DwmkHBVIryfE=; b=C2bndhkA7mS+MW0goa9BPYvMKF
 ZRONtd2zX1pUCBe65Y2LAT3KVgl8e/MeUw9qa+2zB/pOr/JwC5mYNMlyldUhbL90uRIuLZXpuDLBc
 hO+v7cA+9AvPhLvDKnfdXQC/ym0QxZyu0dKwZ6yVj9bHYU25xyLhl0PXjoG9uaK7B9Kzrm5UC6ODz
 BX5kWJgE0XQnEgsHQBcE7rsm9Zcx0KdX2jUAuhB5HgyhYcC6OKdHrikF3OBzjXAxvxs2Kjyr6ogNs
 a9k3vKtab3lIvfY3NQmSR2dSzXSXmVjAP4r6zbB3nGNLH9dk4anWlwUDJ21lu8b3TOEmEq8rqv00E
 wqdQPlSA==;
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmrd-0000t8-37
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 16:16:38 +0000
Received: by mail-yb1-xb32.google.com with SMTP id s9so16272428ybe.5
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6XXKhWivBSiK0NUKDt4xItDduSTkSI/DwmkHBVIryfE=;
 b=YD7+rQwZcFk9G5WfMpF2SXvysZJiFPSNUB3ux7Ts9/pxBovPkuuYtjCpojtGEwY0zf
 /kkrBf94JI9OFohX2Vu1j7vth1Ang5WI3vJKsFfby8hG6HRoj5fDAVQR+wG+J0HTU1Fx
 6WETSMYtWrCaC+3T2iIL10+a43BNMyUKmazERfc21vzI+zSj88vK4HbAoW6MDAeCH8Y2
 aAfDMyns5pgBnV6tOx1hfniDKHe3HXlJmCgSY8rZFuAf5FrYbga6vhoUITc+aDFeM5nH
 ay+BaVxn0K/jK+e+rN45JiDT90J8yhCdXE8dQms+0o295Gr+GCfVdzDZWnytjy1ArE3M
 rmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6XXKhWivBSiK0NUKDt4xItDduSTkSI/DwmkHBVIryfE=;
 b=h0yFtuj2gs1KpuyJPXNCrPgbKUrcPoYQDJdKfzcrWLRI68Ifl5pGeezwklYvYMdzzq
 zf4DW+XLgYUkmwypzwfBY8Utb2H8iBxo0M+RAJZXaPeNKxktUNR/z6aNG53TU6iJlXuT
 hgU4FPRvdiTGerX9eLiNFYYpn+WBxsmJg6YMfjJj50fk216qLJHzv1HvgnT0HPLVBOWJ
 yNV6EXjG37wAg5F37iGtbQLKVNct+7hGAxLpY6SLPpGefS8i69ySVYRn4lrIV9hmoOq6
 3/CO/eN6+0tN5pXJIQyhRKhDQ4J2dJAEuq2Cnjgvl3BD28j02RHmZrrRx+6Lw64itlQ3
 Rjdw==
X-Gm-Message-State: AOAM530B0EsYxdWAQx7ncuUV4VJkiE6TyZValGNFpsVnIGvaVsALb90j
 fJwIQgzty31mo7DSVR8fYfrDd65a1R8hqZThfJnLmg==
X-Google-Smtp-Source: ABdhPJyk+0pdGni0YhDJHRrFSzkV+84hkmtaaAKvqYezlshGZOUwoDR3b5BQB/gwJO2y45E+fpNGPMjUpRVSeso7ysM=
X-Received: by 2002:a25:be09:: with SMTP id h9mr42591798ybk.239.1619626595052; 
 Wed, 28 Apr 2021 09:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210428045533.564724-1-hsinyi@chromium.org>
In-Reply-To: <20210428045533.564724-1-hsinyi@chromium.org>
From: Sean Paul <sean@poorly.run>
Date: Wed, 28 Apr 2021 12:15:59 -0400
Message-ID: <CAMavQKKJp-d-ji6Ao8=1Mnx0pA0+YBregZ4aS0OS1sEqKCoE8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] gpu: drm: separate panel orientation property
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_091637_168888_39E5E08B 
X-CRM114-Status: GOOD (  25.74  )
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

On Wed, Apr 28, 2021 at 12:55 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>


Thank you for revising the patchset, this looks much better to me!


/snip

>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 7631f76e7f34..cda83314d7ad 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c

/snip

> @@ -2173,8 +2173,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>   * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   *
> - * This function sets the connector's panel_orientation and attaches
> - * a "panel orientation" property to the connector.
> + * This function sets the connector's panel_orientation value. If the property
> + * doesn't exist, it will create one first.

I still don't think this function should overload initialization and
assignment. I'd prefer we just removed the creation from
set_panel_orientation entirely so this WARN can't be hit.


>   *
>   * Calling this function on a connector where the panel_orientation has
>   * already been set is a no-op (e.g. the orientation has been overridden with
> @@ -2206,18 +2206,16 @@ int drm_connector_set_panel_orientation(
>
>         prop = dev->mode_config.panel_orientation_property;
>         if (!prop) {
> -               prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> -                               "panel orientation",
> -                               drm_panel_orientation_enum_list,
> -                               ARRAY_SIZE(drm_panel_orientation_enum_list));
> -               if (!prop)
> -                       return -ENOMEM;
> +               int ret;
>
> -               dev->mode_config.panel_orientation_property = prop;
> +               ret = drm_connector_init_panel_orientation_property(connector);
> +               if (ret)
> +                       return ret;
> +               prop = dev->mode_config.panel_orientation_property;
>         }
>
> -       drm_object_attach_property(&connector->base, prop,
> -                                  info->panel_orientation);
> +       drm_object_property_set_value(&connector->base, prop,
> +                                     info->panel_orientation);
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation);
> @@ -2225,7 +2223,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
>  /**
>   * drm_connector_set_panel_orientation_with_quirk -
>   *     set the connector's panel_orientation after checking for quirks
> - * @connector: connector for which to init the panel-orientation property.
> + * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   * @width: width in pixels of the panel, used for panel quirk detection
>   * @height: height in pixels of the panel, used for panel quirk detection
> @@ -2252,6 +2250,40 @@ int drm_connector_set_panel_orientation_with_quirk(
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
