Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13949D75E25
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2024 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krxMhaTOFP6KQfuRozKR1NNs6wdGoTjqof+u9BiFDsk=; b=ciPOQjCgvK3UdMoHy767+6lpsK
	rxyfDbqwokDHO8yGkBZu572dTSATWdNfCHP3hlu8NDQ24+ZYdDNKvYRlU5DAqk5qwIIBzDUcWD3/s
	Puyqe2RzvR9Ue09XlG+578bCVtqJjfg6KusotYA+zVdbZ6BvTM4RmBSYmiu2V8A3yEsx3zGGNK3UI
	sLj0O3DalnaRk4WaDbP+NXOIf13n+Z33eUtn6uxDfHQSh7gafurKZmVsV4nRV3TktEpWCiaEBUcda
	ILfhnx55ArgMqrcrCIjOzXJ6MuMSHylMs/x2wog8bkJP/ofZkhlPPc6HWtmq2QZ+melnO+jiLcsS4
	mYv+2B+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERxZ-00000002NTA-1z0z;
	Fri, 22 Nov 2024 11:36:25 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERwa-00000002NMK-430l
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Nov 2024 11:35:27 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53da353eb2eso3413607e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Nov 2024 03:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732275323; x=1732880123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krxMhaTOFP6KQfuRozKR1NNs6wdGoTjqof+u9BiFDsk=;
        b=YYWKCncTPLOMoffwzTkWUa25jxpia7hbBFvZB0NLCkmt2hP+QdGJDDQy3DY1FGyoVg
         32fXhNOCh/01/y1fmc6eEyatQAUf3CrcSO6wrpUN37bI9iyBiGfTB+rJJ/3mdrkXAd40
         5BHvzs+dpvqyTLvmSimJsi17OeOdf7QJwwviNTFstgDlWRV9Y5L2xuqzrSCWVA+1q/Dt
         jBMNaL6E3urUL/LWaJtxNYGvHdxc6e5gm8obgCWHmLK9lK1HJlsLSlvDiaSwa19Ax+oO
         LsKOWeuTZGbe1y6qZFIVAZhjlL9ci9jdEq4Zozlfub+1sSG0whUcvSAfDPolCY75ECR3
         TibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732275323; x=1732880123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krxMhaTOFP6KQfuRozKR1NNs6wdGoTjqof+u9BiFDsk=;
        b=SSagfc5w/4f1D5V9p1u9Eev7bBme5w+uF8uJkyTgF0VWpLsJBDiXF1TcVpPQrmQ9H2
         i/ORawhP02F6Hf5/KkuS7meNn8SZ+aeOh+5c/uHtELC89wrrcjh+g9IeZZ7Y7dc9D1Uu
         /GbuIGvRO3LTgdsODKkRwu7l2mdeqEuner9C2XFtIS09cuPtMvH8mEq4T/aKUAyIDAfH
         SvmOXiipntW49sTJf5EW63Rd+45Rv7PvRPHK3TR+xSPHIlBYK4THEHOqD8Uipuz3JYa9
         5tX3QMFPR4B05FPoJCbxRSg/CCGxqHmC7YPBSsPQmF0pivxPFC+8OwVQk5TyjdGL+8/M
         g6Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWQKTVtooBXxv+ImcZtJQhJ/6YIp+uxttrl/43asS92x0zAVXpCG1uQcFOZx77ynpJrRu00uKfm2A/JrDidaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYwrKOaJDx0ljzzsPgq9L8I+OrPWRTWl5MvPqPl9fbG5Kt4A/F
	HN9x15/qTL7Cy2mtmC7vBl509PXQlQV1X6gyhA/iX5MfYva3rsRhNjsyjemSLO4=
X-Gm-Gg: ASbGncvmUl6OEvja1QIBSMY8FymVJUYfL2RTp2J9GNNJ0FVmB6q+PZsC2oFwMD+F74o
	onchpfbh7flyl9BJ46Z6PTyYSnCilrbOCJwboUOiFHKAIhgDflR5WrF3hV3pRU6fMOI8IIX0leu
	0tEjdiJVTdq1rbCu5rNnQHDe819QEIA8ybb+6EmrGbLpsUpkqdLLJFvtqdBdxJW/eKylsbiOcir
	W0T8GB2SVAuLsJa/rDTQr3ShIaLUDUXQacBUhXg8Hup3LjVs84jIoKcL7phvQqVwKk1UlDL4R00
	qcc9XnCpmlNCLXyPWSlo03MphfuTiA==
X-Google-Smtp-Source: AGHT+IHcS5D0tQAmLEPHu7UajYtNpfZvhiuBwDM25QDIUqbvD9w+ge3SD7yoJlUUHrhodq7JCz8ehA==
X-Received: by 2002:ac2:5eda:0:b0:53d:d3ff:7874 with SMTP id 2adb3069b0e04-53dd3ff78e0mr1407682e87.29.1732275323001;
        Fri, 22 Nov 2024 03:35:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd3f12809sm270502e87.38.2024.11.22.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:35:21 -0800 (PST)
Date: Fri, 22 Nov 2024 13:35:19 +0200
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
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/7] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <altuhp26ntnpltvfdmikggdmibyizdwnrmwshte7sa2btmbgvj@mbhlvwb4xrzj>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
 <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
 <87ed33zf5e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed33zf5e.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_033525_020720_06FB9530 
X-CRM114-Status: GOOD (  15.59  )
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

On Fri, Nov 22, 2024 at 01:22:53PM +0200, Jani Nikula wrote:
> On Fri, 22 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..8ed58e482fac4662b659276e8bc17690e1fdb9b7 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -280,4 +280,9 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
> >  				const struct drm_framebuffer *fb);
> >  void drm_framebuffer_debugfs_init(struct drm_device *dev);
> >  
> > +/* drm_connector_hdmi_codec.c */
> > +
> > +int drm_connector_hdmi_codec_init(struct drm_connector *connector);
> > +void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
> > +
> >  #endif /* __DRM_INTERNAL_H__ */
> 
> Better fit in drm_crtc_internal.h or drm_crtc_helper_internal.h?
> 
> Maybe we could use an internal header inside display/. Or just 1:1
> drm_foo_internal.h for every drm_foo.c to keep things simple and have
> fewer interdependencies.

Sounds like drm_connector_hdmi_codec_internal.h. Most likely we should
also split or rename drm_crtc_*_internal.h, but that's a separate topic.

-- 
With best wishes
Dmitry

