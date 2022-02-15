Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E13EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzZh9irnFHOpo3eKEMj/l9PeHyJki5M98OPR5rD10r8=; b=XTgOmEHxgvq3WH
	6GYkkEabphGpF04vin5r1zW1UPrnZ4vMfLfBdkT0uwTdVbkj+s+fevNAcwjV0CAwb6L+HBkYetPvd
	1adQF/pYAR463DehdXHtCW5jU51trZ8wQNVm8zEaBAaq004AhxobzGQgq+Gykq5lmYMtbAN1y4nM4
	Zw81DSuNlvNFxSf3QDl3t0FHq3rk5ho6MxYHbSQlvhfxiN97M4HNuvnuAoRk2MSFHmZvZ5oieZHKH
	m+M6tYPphbOuSfYJIBhjoW6nYBiVUPnLFDjmgaZ20ffa/hlsg3h0vmebQz/GSrVH1m+dLvB9E+GrY
	ouD84izuvv5yH5qOA93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJmSz-00HQti-Gg; Tue, 15 Feb 2022 01:17:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJmSn-00HQru-7g; Tue, 15 Feb 2022 01:17:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 23E821F43839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644887821;
 bh=z+Pkjj4FCBWwphTASrycJ+DSyiPQpio9khcfraStadg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=HAWv1GWk79QOFTN1XRGwER8IeQYSu+lF/EGQF2nZDTedBqNrkhG7xPrRYOUAtZAdo
 abUnkEPUAjC2K1ibW0LmXH7mduwUhIVTXAoGqr3uSC3mUWKulcQppQji8tX0BvFlw7
 amoDp6LQsvGVLTvIq3LgXyvHBbh3g5FEuhx4dDtmEOATvWiqOXMJeHOb0IoAf9ysme
 VaDslraajxiKEbP5m/iLYi3QSmPewPf6sQisKIWo1FoZ1Ho8/CqgYWPm+coIUbQsF8
 JLs1qIdVs/NEz4GvkrCTJvJuEdt/6XG4TiXnEsa5lDLL/4/uuWcwBnIXpIQwBn7Cp/
 ySE5zSpd49vYg==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org,  David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,  amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,  Chun-Kuang Hu
 <chunkuang.hu@kernel.org>,  Sean Paul <sean@poorly.run>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org,  Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  Simon Ser <contact@emersion.fr>,
 Harry Wentland <harry.wentland@amd.com>,  Alex Deucher
 <alexander.deucher@amd.com>,  Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v8 1/3] gpu: drm: separate panel orientation property
 creating and value setting
References: <20220208084234.1684930-1-hsinyi@chromium.org>
Date: Mon, 14 Feb 2022 20:16:56 -0500
In-Reply-To: <20220208084234.1684930-1-hsinyi@chromium.org> (Hsin-Yi Wang's
 message of "Tue, 8 Feb 2022 16:42:32 +0800")
Message-ID: <87leydhqt3.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_171705_497821_640D2AE0 
X-CRM114-Status: GOOD (  23.51  )
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

Hsin-Yi Wang <hsinyi@chromium.org> writes:

> drm_dev_register() sets connector->registration_state to
> DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> drm_connector_set_panel_orientation() is first called after
> drm_dev_register(), it will fail several checks and results in following
> warning.

Hi,

I stumbled upon this when investigating the same WARN_ON on amdgpu.
Thanks for the patch :)

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a50c82bc2b2fec..572ead7ac10690 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1252,7 +1252,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   *	INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
>   *	coordinates, so if userspace rotates the picture to adjust for
>   *	the orientation it must also apply the same transformation to the
> - *	touchscreen input coordinates. This property is initialized by calling
> + *	touchscreen input coordinates. This property value is set by calling
>   *	drm_connector_set_panel_orientation() or
>   *	drm_connector_set_panel_orientation_with_quirk()
>   *
> @@ -2341,8 +2341,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>   * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   *
> - * This function sets the connector's panel_orientation and attaches
> - * a "panel orientation" property to the connector.
> + * This function sets the connector's panel_orientation value. If the property
> + * doesn't exist, it will try to create one.
>   *
>   * Calling this function on a connector where the panel_orientation has
>   * already been set is a no-op (e.g. the orientation has been overridden with
> @@ -2373,19 +2373,12 @@ int drm_connector_set_panel_orientation(
>  	info->panel_orientation = panel_orientation;
>  
>  	prop = dev->mode_config.panel_orientation_property;
> -	if (!prop) {
> -		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> -				"panel orientation",
> -				drm_panel_orientation_enum_list,
> -				ARRAY_SIZE(drm_panel_orientation_enum_list));
> -		if (!prop)
> -			return -ENOMEM;
> -
> -		dev->mode_config.panel_orientation_property = prop;
> -	}
> +	if (!prop &&
> +	    drm_connector_init_panel_orientation_property(connector) < 0)
> +		return -ENOMEM;
>

In the case where the property has not been created beforehand, you
forgot to reinitialize prop here, after calling
drm_connector_init_panel_orientation_property().  This means
drm_object_property_set_value() will be called with a NULL second argument
and Oops the kernel.


> -	drm_object_attach_property(&connector->base, prop,
> -				   info->panel_orientation);
> +	drm_object_property_set_value(&connector->base, prop,
> +				      info->panel_orientation);


-- 
Gabriel Krisman Bertazi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
