Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EF3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4SdRFpt97Rqr7vbAA3+lh93KpObXTmonOdNpg4YpBk=; b=dMcsxwq9q1ujOy
	xexJRy/J+6w6YfsXZVYqlg9bFlEeXsKgDXN8PqXxvvBSV+tzQqIfczaGOYAuOPUG4IGTVLS9MydeA
	I6TBdhJQnN0d0z40chsOyAjvEirpQqYRyyW78Ony8vVgCF/2i6m93/+VQYeKLM/nKtnWn/Vejg4Tn
	SDtZUiMLoKEtiyuZKw1Ilzn+8sEU7WejRTdA6unqMiDRnk7q8CoXeaeM9+vFF6oppU8lH9ijjF2Or
	h0TDhRlsONvThyEnfRKZauD74Z/qA6G21/tpbP4jlibfKYkGUgbaKP+OrzoLj+RDavHArdW80SCS4
	yx46bonWzq2i+2X6Dmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbH5-0062yG-Bg; Mon, 30 May 2022 09:01:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbH2-0062wI-9W
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 09:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653901275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8JZgcij+gKnMYf8fKHUKx+imL3jnW+UtIPfMaKpnr0=;
	b=DqvwZ3v/Lft2I5Eyv1jFKs3iYfepuidSSuDATF9o1ZW8ZOV/1+12tuY2XXzzE8ZSPtrSIw
	Ox9s+Cr5RLEBi+gfSR51GTaNAx3GR0bJNewZKuQFHu+lSGfZk/lXo+0B3qRDRWb0x5jJt+
	PvBiCwRrcO2jAIENzoXAfXNl/aRBXqk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-K2ZSChKaN4GXfQtcj3puBA-1; Mon, 30 May 2022 05:01:11 -0400
X-MC-Unique: K2ZSChKaN4GXfQtcj3puBA-1
Received: by mail-ej1-f72.google.com with SMTP id m20-20020a170906849400b006ff296bb911so3648667ejx.6
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 02:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=j8JZgcij+gKnMYf8fKHUKx+imL3jnW+UtIPfMaKpnr0=;
        b=jabS6U2rtiC04ckYeNxoXkMqJChpkGtPkXf8yKmi9XQBuDmpPpA/tAUGf9kNMr0b2+
         38DAtZHrKGBs2DAuXj0sDZBVVhGDsDRaSV6NCZKINPIdB3nN2Kj6Qo2gb3j9Iz8x+Vm1
         57hwL/k9IEL3gXWyMzMIPepfV9PIEsUmuDw39EUczcY1mbKAEFUNLQ4XAEAnX1s2Mtie
         e6NAXpgo2a69sLXRJ7av6JnqUToTrTQ/7Uau2suflQnX7ow655qlb3CPVfb9aMrIEaWn
         06L7C67zq74EP34kPZ/aMRIv2mUQjrNwK0QCq9SwKGMveOO4YMpVr58aNXx+5mdaZ34R
         fZPQ==
X-Gm-Message-State: AOAM530KRo/R4N1QyzY9esJVP6w6Di7A8LoSW8MU+IIetoSIpIr941jK
	r7uAKbI9BLiFLlOyKDDYGXEGczmsFf6LxcNJRdTNkLBjWVYEzbuaVJsNY3ryMNZZwMfgXuA1/T6
	K77JBUdpRP52mZvlTnkxnAU9ftSgwXtL8
X-Received: by 2002:a17:906:f88f:b0:6fe:f872:f3af with SMTP id lg15-20020a170906f88f00b006fef872f3afmr29691593ejb.627.1653901270690;
        Mon, 30 May 2022 02:01:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5DlWNOsVX1VM8ucBtn1pO6Mh+8c28hLgjehjeqRui77jXCNk66Axf0S6mekQOhS/6hZ/F4w==
X-Received: by 2002:a17:906:f88f:b0:6fe:f872:f3af with SMTP id lg15-20020a170906f88f00b006fef872f3afmr29691553ejb.627.1653901270378;
        Mon, 30 May 2022 02:01:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e21-20020a1709061e9500b006fee27d471csm3808574ejj.150.2022.05.30.02.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 02:01:09 -0700 (PDT)
Message-ID: <09c12a48-534f-e6b8-eaef-f05874087d35@redhat.com>
Date: Mon, 30 May 2022 11:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 1/4] gpu: drm: separate panel orientation property
 creating and value setting
From: Hans de Goede <hdegoede@redhat.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20220530081910.3947168-1-hsinyi@chromium.org>
 <20220530081910.3947168-2-hsinyi@chromium.org>
 <3ae6d7d1-fcf2-a769-5e4d-f80328ae06fe@redhat.com>
In-Reply-To: <3ae6d7d1-fcf2-a769-5e4d-f80328ae06fe@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_020116_511797_C87BDA1D 
X-CRM114-Status: GOOD (  33.01  )
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

On 5/30/22 10:57, Hans de Goede wrote:
> Hi,
> 
> On 5/30/22 10:19, Hsin-Yi Wang wrote:
>> drm_dev_register() sets connector->registration_state to
>> DRM_CONNECTOR_REGISTERED and dev->registered to true. If
>> drm_connector_set_panel_orientation() is first called after
>> drm_dev_register(), it will fail several checks and results in following
>> warning.
>>
>> Add a function to create panel orientation property and set default value
>> to UNKNOWN, so drivers can call this function to init the property earlier
>> , and let the panel set the real value later.
>>
>> [    4.480976] ------------[ cut here ]------------
>> [    4.485603] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:45 __drm_mode_object_add+0xb4/0xbc
>> <snip>
>> [    4.609772] Call trace:
>> [    4.612208]  __drm_mode_object_add+0xb4/0xbc
>> [    4.616466]  drm_mode_object_add+0x20/0x2c
>> [    4.620552]  drm_property_create+0xdc/0x174
>> [    4.624723]  drm_property_create_enum+0x34/0x98
>> [    4.629241]  drm_connector_set_panel_orientation+0x64/0xa0
>> [    4.634716]  boe_panel_get_modes+0x88/0xd8
>> [    4.638802]  drm_panel_get_modes+0x2c/0x48
>> [    4.642887]  panel_bridge_get_modes+0x1c/0x28
>> [    4.647233]  drm_bridge_connector_get_modes+0xa0/0xd4
>> [    4.652273]  drm_helper_probe_single_connector_modes+0x218/0x700
>> [    4.658266]  drm_mode_getconnector+0x1b4/0x45c
>> [    4.662699]  drm_ioctl_kernel+0xac/0x128
>> [    4.666611]  drm_ioctl+0x268/0x410
>> [    4.670002]  drm_compat_ioctl+0xdc/0xf0
>> [    4.673829]  __arm64_compat_sys_ioctl+0xc8/0x100
>> [    4.678436]  el0_svc_common+0xf4/0x1c0
>> [    4.682174]  do_el0_svc_compat+0x28/0x3c
>> [    4.686088]  el0_svc_compat+0x10/0x1c
>> [    4.689738]  el0_sync_compat_handler+0xa8/0xcc
>> [    4.694171]  el0_sync_compat+0x178/0x180
>> [    4.698082] ---[ end trace b4f2db9d9c88610b ]---
>> [    4.702721] ------------[ cut here ]------------
>> [    4.707329] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:243 drm_object_attach_property+0x48/0xb8
>> <snip>
>> [    4.833830] Call trace:
>> [    4.836266]  drm_object_attach_property+0x48/0xb8
>> [    4.840958]  drm_connector_set_panel_orientation+0x84/0xa0
>> [    4.846432]  boe_panel_get_modes+0x88/0xd8
>> [    4.850516]  drm_panel_get_modes+0x2c/0x48
>> [    4.854600]  panel_bridge_get_modes+0x1c/0x28
>> [    4.858946]  drm_bridge_connector_get_modes+0xa0/0xd4
>> [    4.863984]  drm_helper_probe_single_connector_modes+0x218/0x700
>> [    4.869978]  drm_mode_getconnector+0x1b4/0x45c
>> [    4.874410]  drm_ioctl_kernel+0xac/0x128
>> [    4.878320]  drm_ioctl+0x268/0x410
>> [    4.881711]  drm_compat_ioctl+0xdc/0xf0
>> [    4.885536]  __arm64_compat_sys_ioctl+0xc8/0x100
>> [    4.890142]  el0_svc_common+0xf4/0x1c0
>> [    4.893879]  do_el0_svc_compat+0x28/0x3c
>> [    4.897791]  el0_svc_compat+0x10/0x1c
>> [    4.901441]  el0_sync_compat_handler+0xa8/0xcc
>> [    4.905873]  el0_sync_compat+0x178/0x180
>> [    4.909783] ---[ end trace b4f2db9d9c88610c ]---
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Reviewed-by: Sean Paul <seanpaul@chromium.org>
>> ---
>> v9->v10: rebase to latest linux-next.
>> v9: https://patchwork.kernel.org/project/linux-mediatek/patch/20220318074825.3359978-2-hsinyi@chromium.org/
>> v8: https://patchwork.kernel.org/project/linux-mediatek/patch/20220208084234.1684930-1-hsinyi@chromium.org/
>> v7: https://patchwork.kernel.org/project/linux-mediatek/patch/20220208073714.1540390-1-hsinyi@chromium.org/
>> ---
>>  drivers/gpu/drm/drm_connector.c | 58 +++++++++++++++++++++++++--------
>>  include/drm/drm_connector.h     |  2 ++
>>  2 files changed, 47 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 1c48d162c77e..d68cc78f6684 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1252,7 +1252,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>   *	INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
>>   *	coordinates, so if userspace rotates the picture to adjust for
>>   *	the orientation it must also apply the same transformation to the
>> - *	touchscreen input coordinates. This property is initialized by calling
>> + *	touchscreen input coordinates. This property value is set by calling
>>   *	drm_connector_set_panel_orientation() or
>>   *	drm_connector_set_panel_orientation_with_quirk()
>>   *
>> @@ -2310,8 +2310,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>>   * @connector: connector for which to set the panel-orientation property.
>>   * @panel_orientation: drm_panel_orientation value to set
>>   *
>> - * This function sets the connector's panel_orientation and attaches
>> - * a "panel orientation" property to the connector.
>> + * This function sets the connector's panel_orientation value. If the property
>> + * doesn't exist, it will try to create one.
>>   *
>>   * Calling this function on a connector where the panel_orientation has
>>   * already been set is a no-op (e.g. the orientation has been overridden with
>> @@ -2343,18 +2343,13 @@ int drm_connector_set_panel_orientation(
>>  
>>  	prop = dev->mode_config.panel_orientation_property;
>>  	if (!prop) {
>> -		prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
>> -				"panel orientation",
>> -				drm_panel_orientation_enum_list,
>> -				ARRAY_SIZE(drm_panel_orientation_enum_list));
>> -		if (!prop)
>> +		if (drm_connector_init_panel_orientation_property(connector) < 0)
>>  			return -ENOMEM;
>> -
>> -		dev->mode_config.panel_orientation_property = prop;
>> +		prop = dev->mode_config.panel_orientation_property;
>>  	}
>>  
>> -	drm_object_attach_property(&connector->base, prop,
>> -				   info->panel_orientation);
>> +	drm_object_property_set_value(&connector->base, prop,
>> +				      info->panel_orientation);
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL(drm_connector_set_panel_orientation);
>> @@ -2362,7 +2357,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
>>  /**
>>   * drm_connector_set_panel_orientation_with_quirk - set the
>>   *	connector's panel_orientation after checking for quirks
>> - * @connector: connector for which to init the panel-orientation property.
>> + * @connector: connector for which to set the panel-orientation property.
>>   * @panel_orientation: drm_panel_orientation value to set
>>   * @width: width in pixels of the panel, used for panel quirk detection
>>   * @height: height in pixels of the panel, used for panel quirk detection
>> @@ -2389,6 +2384,43 @@ int drm_connector_set_panel_orientation_with_quirk(
>>  }
>>  EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
>>  
>> +/**
>> + * drm_connector_init_panel_orientation_property -
>> + * 	create the connector's panel orientation property
>> + *
>> + * This function attaches a "panel orientation" property to the connector
>> + * and initializes its value to DRM_MODE_PANEL_ORIENTATION_UNKNOWN.
>> + *
>> + * The value of the property can be set by drm_connector_set_panel_orientation()
>> + * or drm_connector_set_panel_orientation_with_quirk() later.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_connector_init_panel_orientation_property(
>> +	struct drm_connector *connector)
>> +{
>> +	struct drm_device *dev = connector->dev;
>> +	struct drm_property *prop;
>> +
>> +	if(dev->mode_config.panel_orientation_property)
>> +		return 0;
>> +
>> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
>> +			"panel orientation",
>> +			drm_panel_orientation_enum_list,
>> +			ARRAY_SIZE(drm_panel_orientation_enum_list));
>> +	if (!prop)
>> +		return -ENOMEM;
>> +
>> +	dev->mode_config.panel_orientation_property = prop;
>> +	drm_object_attach_property(&connector->base, prop,
>> +				   DRM_MODE_PANEL_ORIENTATION_UNKNOWN);
> 
> DRM_MODE_PANEL_ORIENTATION_UNKNOWN is -1 which is not a valid value
> for an enum. IOW when the panel-orientation is DRM_MODE_PANEL_ORIENTATION_UNKNOWN
> then the property should not be created on the drm-connector object at all.

p.s. note that the original drm_connector_set_panel_orientation() avoids
ever creating the property when the orientation is unknown because of
this bit of code near the top of the function:

        /* Don't attach the property if the orientation is unknown */
        if (panel_orientation == DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
                return 0;

> Which brings us back to what I said in reply to the coverletter,
> it seems that you have a probe ordering problem here; and fixing that
> issue would make this patch-set unnecessary.

Regards,

Hans


>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_connector_init_panel_orientation_property);
>> +
>>  static const struct drm_prop_enum_list privacy_screen_enum[] = {
>>  	{ PRIVACY_SCREEN_DISABLED,		"Disabled" },
>>  	{ PRIVACY_SCREEN_ENABLED,		"Enabled" },
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 3ac4bf87f257..f0681091c617 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1802,6 +1802,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>>  	struct drm_connector *connector,
>>  	enum drm_panel_orientation panel_orientation,
>>  	int width, int height);
>> +int drm_connector_init_panel_orientation_property(
>> +	struct drm_connector *connector);
>>  int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>>  					  int min, int max);
>>  void drm_connector_create_privacy_screen_properties(struct drm_connector *conn);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
