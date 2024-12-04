Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDBDE7716C
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 03:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov4oIDApdgx4WHS7bE5m2BIEReCDIeuVyAq9ezmep2w=; b=xgUJ+W4r/2E4qxVafNE6PvN8LC
	l3NP/B4EdzjJiPEzZEGqFHnFEQ6uxr4mfta0breLBIyxD+3UY9d4eruLH7Qlun0Poz0j0fGKFfEXE
	UtkyZY0cRVLsVslImEQPCCcgXO9wAEzGDmD9RqXzhMAZJsCRwMa/2zZJtHgUKEhD7cGpApgjcCl6+
	htD5MCNvotX2jr20YlnRnpFLntEEHg45IbPnKYF9v2M0E0zLxNoNfCSBwcYqHYAYaAp38f9XJV4kB
	+YIqBYvlwnIrTE+rsT167TnG/oWzvCvceH472DP6ZM8RLStEStgy7e8dcsD+lkF5uSPy1YJwneH4T
	4vbhhxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfv6-0000000BN2Q-27Fg;
	Wed, 04 Dec 2024 03:19:20 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfu5-0000000BMrl-0sMc
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Dec 2024 03:18:19 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53df1e0641fso7009853e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Dec 2024 19:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733282295; x=1733887095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ov4oIDApdgx4WHS7bE5m2BIEReCDIeuVyAq9ezmep2w=;
        b=FUblq3kaVGpQ/7JifRvJ2B6QzfMSKwRvDsAk8gJmWis5VaRQXS8Za/5e+ZyBy9eJt/
         EtkC3ljOpT0lQN5X0nvnFtWhwAhwDuDHbZs1ZTzS4xvZBGZH0oKg/aSbKvANx2tEx5Pd
         UNMAFlSc1Qh/tijRgNoLinT+SsiWYTN7+hvrBROHu/VmqyGl70layNWDzJ73SxeWSRTP
         I23e9EQJ36TSXwTYGCR9Qx/Bw34FWCQQopt4w6Y4JFdt/YZCTfbEkj5yW22+MNgSUpzn
         6+ppAOue5xdOjPE2VAKNZHLeo5CxyRDrcP5QAil0Kek7nJZ6QtwzdOPlQyCLH7LDjWtj
         cF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733282295; x=1733887095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov4oIDApdgx4WHS7bE5m2BIEReCDIeuVyAq9ezmep2w=;
        b=mUJm3sK2/+lzFhXnbUPL8aHs2tkV8asPyaqEUk+z8vHU6+FpQ4/+cRnneEtR2QIGaS
         w1P4TcKtk76IdMRd7KNdk683WBBMcR8j5Wr3kSYVJHjAI/+cdIA7w6ZMPhbGCtuioOj4
         VxMtMfNf3y/JxQ026gax2Jgev/vLbmWFOFklGeoYVhE55/mHXL10EyIsaVtRlTvvOrFl
         7dapJMxU+xnTYCWDHCBmhGmeXQknJLCG/QJFTs3vcEpsfJBr/TGGi8KmRWyOZR0M6k1L
         QycPTf1ziPkrtLtoggiLxzFqF8BsWAR7b4aGn1yCpig0cr5QBv9j/0L5gGp3cjoLkpXs
         Nreg==
X-Forwarded-Encrypted: i=1; AJvYcCURSiCm5DENMIzQ1UheKzDFFF6Rn5QCkYoST3eenCFKQHzTTqqt976C9UNvXFjI0q2o67K7JFvawHaXKBNMBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjSdHYK9SLhsloN9TdmSiQEsd8tIaBQbLLqRxA6VSZ1q7K4Sd4
	y/I9DM1b2AkW2790HNEA3RWmeggLDAslp6aZtqrHXgW5E+Vg6F8+DkA9lQSJEtk=
X-Gm-Gg: ASbGncuhNtCYCCPF+hQmC02iV/lkGy4OQcjmfG7/3h8nqmUnfSkGCZS30sYMt3sPzSD
	uVhN3CduuZvDuR6otmX5hpYQCMxf191e+KxVhVN6uE/ZuP546atlnS3FeqK2NnmPmqH80Dyu1qY
	S6WvwkkO3ipOjNlbH1c9P1E/8qiKtk3ubnOJdZYnSlking59ALggmsn259orLbDeaNeiiexrYks
	XSMPaA+T6cj+G+xf7VKR3oL/KMBem/rgX1DIlFrAnizmsdw0CCmFc3ICQ3RYY/xmgsY/hvsKJNu
	CABIXC35bgZg1C8nXDB0qmcQpR5KSA==
X-Google-Smtp-Source: AGHT+IFJX8QZfHrEBC9Xxxj95DpGajpX3DiwA7TRxy/4ydOL7I3C5fwKfR6CJxAdfz87Jxn9zNInqQ==
X-Received: by 2002:a05:6512:3a8e:b0:53d:a550:2885 with SMTP id 2adb3069b0e04-53e12a34282mr2179215e87.47.1733282295266;
        Tue, 03 Dec 2024 19:18:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649f13csm2058532e87.230.2024.12.03.19.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 19:18:14 -0800 (PST)
Date: Wed, 4 Dec 2024 05:18:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
Message-ID: <txzri7x4pdeakx4juandk3hfhsbx3dhlulxfuehqlmrr7b3wpw@jaunqktsro6x>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
 <87a5dc4zd5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5dc4zd5.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_191817_262864_AD146349 
X-CRM114-Status: GOOD (  34.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 03, 2024 at 04:25:58PM +0200, Jani Nikula wrote:
> On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > Extend drm_bridge_connector code to read the EDID and use it to update
> > connector status if the bridge chain implements HDMI bridge. Performing
> > it from the generic location minimizes individual bridge's code and
> > enforces standard behaviour from all corresponding drivers.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 67 ++++++++++++++++++++------
> >  1 file changed, 53 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..71ae3b2c9049016d1cc0d39a787f6461633efd53 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -17,6 +17,7 @@
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> > +#include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> >  
> > @@ -175,17 +176,55 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
> >   * Bridge Connector Functions
> >   */
> >  
> > +static const struct drm_edid *
> > +drm_bridge_connector_read_edid(struct drm_connector *connector,
> > +			       enum drm_connector_status status)
> > +{
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	const struct drm_edid *drm_edid;
> > +	struct drm_bridge *bridge;
> > +
> > +	bridge = bridge_connector->bridge_edid;
> > +	if (!bridge)
> > +		return NULL;
> > +
> > +	if (status != connector_status_connected)
> > +		return NULL;
> > +
> > +	drm_edid = drm_bridge_edid_read(bridge, connector);
> > +	if (!drm_edid_valid(drm_edid)) {
> 
> What's the case this check is for?
> 
> My preference would be that bridge->funcs->edid_read() uses
> drm_edid_read*() family of functions that do the checks and return the
> EDID.
> 
> There are some cases that just allocate a blob and return it. Would be
> nice if they could be converted, but in the mean time could use
> drm_edid_valid() right there. Additional validity checks are redundant.

This was c&p from drm_bridge_connector_get_modes_edid(). If you think
that the check is redundant, could you please send a patch dropping the
check?

> 
> BR,
> Jani.
> 
> 
> > +		drm_edid_free(drm_edid);
> > +		return NULL;
> > +	}
> > +
> > +	return drm_edid;
> > +}
> > +
> >  static enum drm_connector_status
> >  drm_bridge_connector_detect(struct drm_connector *connector, bool force)
> >  {
> >  	struct drm_bridge_connector *bridge_connector =
> >  		to_drm_bridge_connector(connector);
> >  	struct drm_bridge *detect = bridge_connector->bridge_detect;
> > +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
> >  	enum drm_connector_status status;
> >  
> >  	if (detect) {
> >  		status = detect->funcs->detect(detect);
> >  
> > +		if (hdmi) {
> > +			const struct drm_edid *drm_edid;
> > +			int ret;
> > +
> > +			drm_edid = drm_bridge_connector_read_edid(connector, status);
> > +			ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> > +			if (ret)
> > +				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
> > +
> > +			drm_edid_free(drm_edid);
> > +		}
> > +
> >  		drm_bridge_connector_hpd_notify(connector, status);
> >  	} else {
> >  		switch (connector->connector_type) {
> > @@ -246,29 +285,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
> >  static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
> >  					       struct drm_bridge *bridge)
> >  {
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
> >  	enum drm_connector_status status;
> >  	const struct drm_edid *drm_edid;
> > -	int n;
> >  
> >  	status = drm_bridge_connector_detect(connector, false);
> >  	if (status != connector_status_connected)
> > -		goto no_edid;
> > +		return 0;
> >  
> > -	drm_edid = drm_bridge_edid_read(bridge, connector);
> > -	if (!drm_edid_valid(drm_edid)) {
> > +	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
> > +	if (!hdmi) {
> > +		drm_edid = drm_bridge_connector_read_edid(connector, status);
> > +		if (!drm_edid) {
> > +			drm_edid_connector_update(connector, NULL);
> > +			return 0;
> > +		}
> > +
> > +		drm_edid_connector_update(connector, drm_edid);
> >  		drm_edid_free(drm_edid);
> > -		goto no_edid;
> >  	}
> >  
> > -	drm_edid_connector_update(connector, drm_edid);
> > -	n = drm_edid_connector_add_modes(connector);
> > -
> > -	drm_edid_free(drm_edid);
> > -	return n;
> > -
> > -no_edid:
> > -	drm_edid_connector_update(connector, NULL);
> > -	return 0;
> > +	return drm_edid_connector_add_modes(connector);
> >  }
> >  
> >  static int drm_bridge_connector_get_modes(struct drm_connector *connector)
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry

