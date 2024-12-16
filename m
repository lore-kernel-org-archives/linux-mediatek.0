Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3466E77183
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2024 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29HZw9kHGxpHsgmlYwTPoFjON5PsGOojd/3ISS3t80s=; b=0KvX8tGfXFnV/r+sSHzdnFGJKk
	8ci/wzDDoQz8+lfyziuAwjyyZA+xkP7P8XhYkIlUhoh+Icz6XfOKFvlUReijwT5gNRBG4whGKQXez
	IvOavseTMo25nE4d0s24C10OhQ0QTRSg5LqS9g0K03IMcWaNo77keJUn5z35iNM2qTSy4N9sRV/HJ
	r5sMxislU9BLI0zYO7Jt91SovsDA/fSbGB1xlbh2M5xOv+MUrJrgFwjpWrb0bbTIVJtnEr+HhsYjr
	nt7ZoyWTuBmf6sfuaIFDKEOPUuyYi76agINwK5lvu8ZRO2PHU063M+gWtcYW0gfIHiBA0IPzQdPQg
	lseKLdGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFFH-0000000ApBa-3o4j;
	Mon, 16 Dec 2024 17:51:03 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFE8-0000000Aov8-25I5
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Dec 2024 17:49:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-540201cfedbso4498988e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2024 09:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734371390; x=1734976190; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=29HZw9kHGxpHsgmlYwTPoFjON5PsGOojd/3ISS3t80s=;
        b=Np2QCILsA1NVfoaY9g6g4gRBnkj6pl+ShBBVSGTUE+SUOrKM8N+ji4QCpnq/8/Bz5v
         nsCfY2ZhHmCOKyI846FeB2thUVydxI7bCEY7OCbhmsc262d0TIhx8jEBYWBG0EqiaeoW
         yfRHc8d2RxyRoEHr2Arypp3TZFlVtuQZsVIal47+vgTSlX1gtheO3xudI62NsTZTKDz6
         gkKeydT+d8Xybng0TjqBX8jkTXmfl9oYuSJueu4X08fPgiY7/iCFOe6t5E5buYMR2Gra
         ZOxlV1DNMsreDCGF6Whgblf9YU8FL6p8IGHEhvE0E+7WKlNIPgDnCCQp4VqJLYgvEbxF
         Yfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371390; x=1734976190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29HZw9kHGxpHsgmlYwTPoFjON5PsGOojd/3ISS3t80s=;
        b=dCv5loWeX20D338kD+vzR8A7IU2iZMaLxvuSBddGuQ+zqyNStcsCmJem6TjVgzJBfM
         8lCxgsHwjYoL6qqGX8iqysIocLrVmvhln9VdgpbenqzmneN+sBsOi83WossSosYhDBQA
         R8hx6nzXBvF9JWIAigVXKHt3bnJieXzRL29GK+kjmYwbdZtsCpZsbct2M6iwiunmXAyR
         mq2SZ/afsJKzvERsW8U8huf8Da/2mzKvT82i7nXleM432+z2CSNLbFKJhAIv+fLXdhmx
         YdgkVw3y2+Z3OIg2Oxx39f5O1ecIHB/RgLWwLnh8JYsBD1odf4IJrDaY+8TSfGHDci4z
         TGvw==
X-Forwarded-Encrypted: i=1; AJvYcCWs3kKgvr5jIKnQ1bj3OiGhx1YSihyRJQgmoexH2AhPBcyhcyEFgnat+D35l5gDj6NbQvcGxwZXEM9SCIbbQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBxnsUTF3SWW6D2AUf2cDcDz60pZ91aFmp+JD5Ee1RdNz6Qi9/
	72CwduLMhSn+OW36KIPJzVt0/oYKiyZBy9GDOawYlvsoVw1+A31oEq7zDUoXFrY=
X-Gm-Gg: ASbGncsus08uhi0PtUDGFUmQWmh5uqAedTx0vqyYM6T47TgToLWMmjd9ZihrOVwHNVX
	VY1GZm+1/RKxnvGqfnK9PRTVMSpPzThxS3uXFVAD3uaGx8K4I6TaFjEncgKDjhqJq4WMfnVbUzZ
	s5vN4v8opH+VypJA291NTpPUXGWGmrhHrOw4WwB+wd5yOMO2eE28HxE1ZifwN12UrhXf755k0sU
	f3tEg3+ywsztBxtLkPnz8ZqgH9I4kM2y8GusokBY+aWteg9R7Rkyz5lldHqf7TPHxmtn8EgS6z0
	dmiOq3R93Vb0+OXYiicgcNLafdozrA4aL5JS
X-Google-Smtp-Source: AGHT+IGejqU6hvp6CTUn8Lo7kd3aSi6GmIf9oBeaAY0N0VSQP5YDDaQsXS6dw98iZgXbtRgL0xzwjQ==
X-Received: by 2002:a05:6512:31c6:b0:540:3561:666f with SMTP id 2adb3069b0e04-5409055837amr4736533e87.20.1734371390228;
        Mon, 16 Dec 2024 09:49:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c0031dsm921971e87.117.2024.12.16.09.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:49:49 -0800 (PST)
Date: Mon, 16 Dec 2024 19:49:47 +0200
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
Subject: Re: [PATCH v6 04/10] drm/bridge: connector: add support for HDMI
 codec framework
Message-ID: <3su4cgtkkysztdvog24tkltvcflfbhdb24c2acelmbtt3dbm3n@dxtsuiqnxawz>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-4-50dc145a9c06@linaro.org>
 <20241216-benign-amiable-grebe-e0b3e1@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-benign-amiable-grebe-e0b3e1@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_094952_548294_BDBD0144 
X-CRM114-Status: GOOD (  28.01  )
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

On Mon, Dec 16, 2024 at 06:14:43PM +0100, Maxime Ripard wrote:
> On Fri, Dec 06, 2024 at 12:15:58PM +0200, Dmitry Baryshkov wrote:
> > Add necessary glue code to be able to use new HDMI codec framework from
> > the DRM bridge drivers. The drm_bridge implements a limited set of the
> > hdmi_codec_ops interface, with the functions accepting both
> > drm_connector and drm_bridge instead of just a generic void pointer.
> > 
> > This framework is integrated with the DRM HDMI Connector framework, but
> > can also be used for DisplayPort connectors.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 100 ++++++++++++++++++++++++-
> >  include/drm/drm_bridge.h                       |  38 ++++++++++
> >  2 files changed, 134 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 512ced87ea18c74e182a558a686ddd83de891814..4fa1bb73d430d02d5b79a1a184c203ec9e9c66e7 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -21,6 +21,8 @@
> >  #include <drm/display/drm_hdmi_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> >  
> > +#include <sound/hdmi-codec.h>
> > +
> >  /**
> >   * DOC: overview
> >   *
> > @@ -368,10 +370,80 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
> >  	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
> >  }
> >  
> > +static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
> > +{
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	struct drm_bridge *bridge;
> > +
> > +	bridge = bridge_connector->bridge_hdmi;
> > +	if (!bridge)
> > +		return -EINVAL;
> > +
> > +	if (bridge->funcs->hdmi_codec_audio_startup)
> > +		return bridge->funcs->hdmi_codec_audio_startup(connector, bridge);
> > +	else
> > +		return 0;
> > +}
> 
> Nit: it looks like you return in other cases, and there's no need for
> that else.
> 
> I'd remove the else.

Ack

> 
> Looks good otherwise, once fixed
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime



-- 
With best wishes
Dmitry

