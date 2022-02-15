Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F73C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 04:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNAtgtoXtZle0qJ/8VBYHIHgaMOENEU6xo/O955mrgY=; b=Gj+N6OO0KMjtCb
	LuzuPzahYkGudQrR/m3KoBSjUpHgR2J3/sWpAGM/eBiNzGzDbLKg1U5uU5cvDIOLCBXGqTCzACEbE
	QkFi61PuBAxH04tfwDocaIKrM41uSKq6Sg9xXf/pkV88mYWKc3ak8kEX0FN6FS6+EhGNMgULyAGxY
	b8mprwZnd3Bgnmv3A4nbSgMEZDiJVYa9zxD+ufX3GMDoCJMUlMxRd2K+YhIkkVhppDn+UOOFCoo0f
	fJ3HjTX1taqvD54VNTMvyu/XAqMzdeGAV3s7c9UOn/lZYgd8iV/ulVGNOf/4Su+tRSX0jb60HYWoC
	GtQi4yAdKQWMAsd96Waw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJp4M-0009G9-9y; Tue, 15 Feb 2022 04:04:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJp46-0009A8-1e; Tue, 15 Feb 2022 04:03:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id A6AEC1F43572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644897824;
 bh=VG0gC/LlBYOoQhn5utxIdgmPSt7IfHbptUv0GV7NTBo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Ub6dmZitRz45cR9qIKXjTsVXU7KmUgK7H9oGw3VoIqMVy2lNgKyINSxJJ4Mxa9LeQ
 OSnaNgDQeenPnKVsHAu7FJW2ksmbmmFKxFZ9DhHBEOytGwf5+mTHiU3/rYyeYKZgAI
 353erPgVFDlsdFJrWkpczRGLtWgrEDwEWidKsuTfjbzacs2ubqbjvCv53HpQkQgTDO
 sveWRuEs68cTQpVqRLx8QCaXWu0m6E77IzTClO5SoAIoZgIg7biB2Noa4C7YbpiD3/
 +EhnyHcdKXZg/HDB7nczR4ihB2+cz0qN/2Cx4c4omJOGZErQyt9d55dDNGrym2WOmM
 PBwrKU+TudUGg==
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
Organization: Collabora
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <87leydhqt3.fsf@collabora.com>
 <CAJMQK-igpiYj-pkgG9amrQuVzf1Mc9BDDOwOdKLUbceKr=CHiQ@mail.gmail.com>
Date: Mon, 14 Feb 2022 23:03:39 -0500
In-Reply-To: <CAJMQK-igpiYj-pkgG9amrQuVzf1Mc9BDDOwOdKLUbceKr=CHiQ@mail.gmail.com>
 (Hsin-Yi Wang's message of "Tue, 15 Feb 2022 11:15:02 +0800")
Message-ID: <87czjoixno.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_200346_442057_4B681115 
X-CRM114-Status: GOOD (  26.35  )
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

> On Tue, Feb 15, 2022 at 9:17 AM Gabriel Krisman Bertazi
> <krisman@collabora.com> wrote:
>>
>> Hsin-Yi Wang <hsinyi@chromium.org> writes:
>>
>> > drm_dev_register() sets connector->registration_state to
>> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
>> > drm_connector_set_panel_orientation() is first called after
>> > drm_dev_register(), it will fail several checks and results in following
>> > warning.
>>
>> Hi,
>>
>> I stumbled upon this when investigating the same WARN_ON on amdgpu.
>> Thanks for the patch :)
>>
>> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> > index a50c82bc2b2fec..572ead7ac10690 100644
>> > --- a/drivers/gpu/drm/drm_connector.c
>> > +++ b/drivers/gpu/drm/drm_connector.c
>> > @@ -1252,7 +1252,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>> >   *   INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
>> >   *   coordinates, so if userspace rotates the picture to adjust for
>> >   *   the orientation it must also apply the same transformation to the
>> > - *   touchscreen input coordinates. This property is initialized by calling
>> > + *   touchscreen input coordinates. This property value is set by calling
>> >   *   drm_connector_set_panel_orientation() or
>> >   *   drm_connector_set_panel_orientation_with_quirk()
>> >   *
>> > @@ -2341,8 +2341,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>> >   * @connector: connector for which to set the panel-orientation property.
>> >   * @panel_orientation: drm_panel_orientation value to set
>> >   *
>> > - * This function sets the connector's panel_orientation and attaches
>> > - * a "panel orientation" property to the connector.
>> > + * This function sets the connector's panel_orientation value. If the property
>> > + * doesn't exist, it will try to create one.
>> >   *
>> >   * Calling this function on a connector where the panel_orientation has
>> >   * already been set is a no-op (e.g. the orientation has been overridden with
>> > @@ -2373,19 +2373,12 @@ int drm_connector_set_panel_orientation(
>> >       info->panel_orientation = panel_orientation;
>> >
>> >       prop = dev->mode_config.panel_orientation_property;
>> > -     if (!prop) {
>> > -             prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
>> > -                             "panel orientation",
>> > -                             drm_panel_orientation_enum_list,
>> > -                             ARRAY_SIZE(drm_panel_orientation_enum_list));
>> > -             if (!prop)
>> > -                     return -ENOMEM;
>> > -
>> > -             dev->mode_config.panel_orientation_property = prop;
>> > -     }
>> > +     if (!prop &&
>> > +         drm_connector_init_panel_orientation_property(connector) < 0)
>> > +             return -ENOMEM;
>> >
>>
>> In the case where the property has not been created beforehand, you
>> forgot to reinitialize prop here, after calling
>> drm_connector_init_panel_orientation_property().  This means
> hi Gabriel,
>
> drm_connector_init_panel_orientation_property() will create prop if
> it's null. If prop fails to be created there, it will return -ENOMEM.

Yes.  But *after the property is successfully created*, the prop variable is still
NULL.  And then you call the following, using prop, which is still NULL:

>> > +     drm_object_property_set_value(&connector->base, prop,
>> > +                                   info->panel_orientation);

This will do property->dev right on the first line of code, and dereference the
null prop pointer.

You must do

  prop = dev->mode_config.panel_orientation_property;

again after drm_connector_init_panel_orientation_property successfully
returns, or call drm_object_property_set_value using
dev->mode_config.panel_orientation_property directly:

  drm_object_property_set_value(&connector->base,
			dev->mode_config.panel_orientation_property
		        info->panel_orientation);

-- 
Gabriel Krisman Bertazi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
