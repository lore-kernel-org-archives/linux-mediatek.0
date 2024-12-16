Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B48E7717F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2024 17:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwf0Q6wp6H/pRC8arADlqkyBJYwrH22sNYfvDfmEvNU=; b=y526Z3YH9qe2mXzOuQpnN/NM/y
	/v/ikas5bovSXms1pWAuXMM9V7wsWCsV4yB9vBUVyWtg6ElV6zGdeHW9spQzXgyuK3uolFpAE0rOP
	KxMiuPmSyffRwQWRLGrdtI0vNs08yQ+eoU88ktevWUChHEZ4dFWG2SFBRa4+4S6dNCltgNxTCxK9F
	9yjfxrEkg5G6+DnCfJVfjTBbLL6ciJ4QCYXKcZg9Q84ItWJfjdj3dxGOLZxHx9Lf291vVi10U2lGU
	xHylvuVg/3QapjVHKslmM+qY/TgnfHHWDvEppoDeDvZ7Y7UEJ3xN3DkYn0QoANNArtv8j69WFCSM8
	PaaDuODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFN0-0000000ArDa-2u7g;
	Mon, 16 Dec 2024 17:59:02 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFK8-0000000AqNR-0FuN
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Dec 2024 17:56:06 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3022598e213so43009981fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2024 09:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734371762; x=1734976562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qwf0Q6wp6H/pRC8arADlqkyBJYwrH22sNYfvDfmEvNU=;
        b=eaVg9askj+JYmXl1qmUwieQSA9DFOyBDBZjHT/qLQEO1c+d9vSpGZgxhuBDiRDmKmB
         4SOj9e2r8ooytJc2LVOL9EJCJUYs+QFdKlmwN1ldTg9TT8Afmiw/iTN2NI8PaenIVhEs
         gPuwB5c/e2zN5D9GJ7gco6AcFCGDZESN4LiE9lmRJ402uJUm8KTaRbcY73B1UXb5P42Z
         4ceiGsYi4fDNqZb8UgxkMJ44YMvC8KyLey5sEruxnGmDnwkFFMLjK6PG5WU4eXvFGhiN
         gLirsfUdnpV3mjabUNxXH97MPKX9RUJCXQEtbKR3SFCGiHZUxtXiTX14hO7eGRFrvhJB
         +PEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371762; x=1734976562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwf0Q6wp6H/pRC8arADlqkyBJYwrH22sNYfvDfmEvNU=;
        b=l6bc2T0lTrlQR26112LViT+JcRRLl0Pw+s/n5BJ8SPN1rxNkG5yFPX2s9PnH+gK2Jg
         8cvRqOdCk4sU2zFQL2yfJqRftChIZwkhPCvvX9S+Z3YwEJLhH6AfyMT56Ix9+2DTc6bi
         jghz5aT7rOZZgdG7CI9Q3mU5XbWCK9mhE3WH6PYdgd5LYIVqgcDPcr3EynsUqOgvlnnB
         6BLWZDsQffK0QGULdTtEIkRtAX0tN1efBDrkeBDorBwjt+OTWvodynua0I5X9ViVa1A+
         8RbMdSDZqufccko5Ax6H0RHjX7FOGy6MGxHH7ZWfXgKn3DymQFUsr7dyTxVkuM6oxfuT
         PC/A==
X-Forwarded-Encrypted: i=1; AJvYcCWiZCdC5QAaY5u0vn9zDg0G/h9gF4NBmsfqzOiau0mW6RHmP/tfbTcYa4XKf4ldHLYdRg6O+gdo/+Zw3r+Nxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJhf6MmJCz1EvGJuJPvOAqxt1vtasrRk9o6DhehiujDDP0Koa2
	W1C9h02+v8sE/MUrNisEVqajJS5a+HabLDtRab5Yxgs7s0g+vEyqHG3h2uZOPWM=
X-Gm-Gg: ASbGncsd0l0nXd+lSBogyqsX3mWBFDj62CopntIlcWaHet1nR069DyzWI0ukFVJsj3q
	bDvj/lKydt7+JjW4RXCKXVsqWsaiaiGJ4mRjrLKYWman4Njrn1v6eEozVbRQmD1K0WxlQ3VV93L
	Rjil9g/Wtts9RC0nBxFEGf4sJ3WQr1Mz2+3QdBiMnJ50MxO1KD4RSPQEg97OfMamIqvNvFVqY+j
	OhVWXYcShWalux7B5I8IUigIbKdGL7qqDLuYfcEQ/0Oektu28DmQgVe1Anixrszt7JY/sDqlb1J
	J60Y18/79keGpskw5gl/9u2nTvJ4N58CoXek
X-Google-Smtp-Source: AGHT+IG29n5FlljcG2G5r78Pj66GgzI4srZEZjCTKnfT1NsJdZGIbQtNCeGwmhS44dO/GlUjtQdAug==
X-Received: by 2002:a05:6512:280a:b0:540:5b5c:c181 with SMTP id 2adb3069b0e04-5408b800764mr4435678e87.6.1734371761893;
        Mon, 16 Dec 2024 09:56:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f4b8sm949454e87.13.2024.12.16.09.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:56:00 -0800 (PST)
Date: Mon, 16 Dec 2024 19:55:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
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
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 06/10] drm/display/hdmi: implement hotplug functions
Message-ID: <bapkgt2e33bhdmun4efcuaedshyyv7qvjgugu5y53ordw3gigl@n7zbfoga7qo7>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-6-50dc145a9c06@linaro.org>
 <20241216-courageous-mysterious-pelican-5a8d2e@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-courageous-mysterious-pelican-5a8d2e@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095604_117591_D7EA24F0 
X-CRM114-Status: GOOD (  31.75  )
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

On Mon, Dec 16, 2024 at 06:20:04PM +0100, Maxime Ripard wrote:
> On Fri, Dec 06, 2024 at 12:16:00PM +0200, Dmitry Baryshkov wrote:
> > The HDMI Connectors need to perform a variety of tasks when the HDMI
> > connector state changes. Such tasks include setting or invalidating CEC
> > address, notifying HDMI codec driver, updating scrambler data, etc.
> > 
> > Implementing such tasks in a driver-specific callbacks is error prone.
> > Start implementing the generic helper function (currently handling only
> > the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
> > framework.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 61 +++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_state_helper.h     |  8 ++++
> >  2 files changed, 69 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index 80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e..4cdeb63688b9e48acd8e8ae87a45b6253f7dd12b 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -769,3 +769,64 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
> > +
> > +/**
> > + * drm_atomic_helper_connector_hdmi_hotplug_edid - Handle the hotplug event for the HDMI connector passing custom EDID
> > + * @connector: A pointer to the HDMI connector
> > + * @status: Connection status
> > + * @drm_edid: EDID to process
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data. Most
> > + * drivers should be able to use @drm_atomic_helper_connector_hdmi_hotplug()
> > + * instead.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *connector,
> > +					      enum drm_connector_status status,
> > +					      const struct drm_edid *drm_edid)
> > +{
> > +	if (status == connector_status_disconnected) {
> > +		// TODO: also handle CEC and scramber, HDMI sink disconnected.
> > +		drm_connector_hdmi_codec_plugged_notify(connector, false);
> > +	}
> > +
> > +	drm_edid_connector_update(connector, drm_edid);
> > +
> > +	if (status == connector_status_connected) {
> > +		// TODO: also handle CEC and scramber, HDMI sink is now connected.
> > +		drm_connector_hdmi_codec_plugged_notify(connector, true);
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug_edid);
> 
> I think we discussed it in a previous version's thread after you sent
> that one, but I'd rather have that helper call an edid retrieval
> function than passing it edids.

Ack, I forgot to add the hook. I'll do that for the next version. I'll
add the .read_edid callback to the HDMI functions.

> 
> Also, EDIDs are mandatory for HDMI, so I'd call the function
> drm_atomic_helper_connector_hdmi_hotplug.

See below.

> 
> > +/**
> > + * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
> > + * @connector: A pointer to the HDMI connector
> > + * @status: Connection status
> > + *
> > + * This function should be called as a part of the .detect() / .detect_ctx()
> > + * and .force() callbacks, updating the HDMI-specific connector's data.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int
> > +drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
> > +					 enum drm_connector_status status)
> > +{
> > +	const struct drm_edid *drm_edid;
> > +	int ret;
> > +
> > +	drm_edid = drm_edid_read(connector);
> > +	ret = drm_atomic_helper_connector_hdmi_hotplug_edid(connector, status, drm_edid);
> > +	drm_edid_free(drm_edid);
> 
> Oh. Why do we need the two variants? Or is it to deal with drivers that
> don't set connector->ddc?

Yes. There are enough HDMI bridge drivers that would provide the
callback instead of the DDC bus. Adding callback should solve that.

-- 
With best wishes
Dmitry

