Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D733E77173
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Dec 2024 11:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgmDh4KwwG/UnaAkdqryGTFKEgNCKuqZpZNBZIAjct8=; b=QgRYm2M3fRkwWaKDSNb8ICB0MG
	0Yc4AhCpaT0ArEGMLRxzqzvpCIG+rg73J7SRvSDb5/v3Gn4sMJvE16y+de/LC9CprjgAZNLXKZ3iZ
	lZ6i0Ixvr74+lg3I+s4eShyeFeCnvpptLvjF/a6OVxPgI4frGLXMOqOIkT3LF5lWfnwaBm7PPJ2dN
	uRtBAEoewAKWAEywQU+PA5cQwqCZJj4Q0V50HaN4cXHtEkcT68y0FxbByefH7UGCTAnrhW//l0SZz
	IxhnaTCLIeUdQL4np5bJV8CFkFbE0oMWo3bpUcYPO+x/FguOq40GQ4r9xRwMmdFXrUQHTw9uNA+3B
	pnFCbijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKF7q-00000005A5U-0Cmu;
	Sun, 08 Dec 2024 11:06:58 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKF7l-00000005A45-0vTn
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Dec 2024 11:06:56 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53e3c47434eso633276e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Dec 2024 03:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733656011; x=1734260811; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MgmDh4KwwG/UnaAkdqryGTFKEgNCKuqZpZNBZIAjct8=;
        b=vfTlVBoARQxL45HViaCN9YHLqp/W0xQqjVfvMWh7eeZBzLjxzCKTG2Tb+Kng5Bxsz+
         tlXp6A5j4Oy6YihdOzlPhcaaGySiI/8DGXbapmDtBk0dOzBhP/yJMRDN1UyoLT/owhHK
         NZbbR5ky2L5fJh2ECodOqbV6ugapzJf1cQGocIpqq+jR3on7WghPolJWYLYH4BHpoIeZ
         WrnXe0ia/M3BCzqoxKKXWICjDF3N1TqFkpdL7Q4flhYVmLHEtl+xOZQ0RIYhARmUBMPK
         YjHYO90XABy8Fzv1TEYPMesyTcj63NXbUXwnCvZq4yB7sFH6xHqFKL3s/OWjw6JAKu+b
         kh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733656011; x=1734260811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgmDh4KwwG/UnaAkdqryGTFKEgNCKuqZpZNBZIAjct8=;
        b=JB35nFH/BnAE9w0tZHTYMOukhmJpGa3eJlscydWMxAYrBF4aU8hhkWcpry5iPRtFdH
         IwqvPQt12gUME6KvV6hVXEZsn6Pe96gkBau6kuk5oLxbVZzqoGXGXohQcY08EULnC/rH
         tJ8I/nwj43teSAuTVSN9Xc8l3wIVoyoS37YIZVKLZJBMXJ9+oKqV6El7UOQBeBat/FP2
         J5FH9nk8HyvQnZOVHi711ySBPoHrkaxcz54weK0+NT3D9vbE3bsuJnWQeMi5G+3TbhrD
         0hXSYvyi6/ok2Hwy7R0IuvlXCzVvg5q45103oubHRNg8X0RN3nf1wU6Hre7cVO/TmsO7
         uciw==
X-Forwarded-Encrypted: i=1; AJvYcCUt2G+m2VN0BOraDxfnE5RUtKv5e+wbPiA9cGZPa2V1JGu2TS0ALPRwnM010UxTYyb0ONYK6DkHkOyBda1Rjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI2UGk8i2qJMsPIRoulo+7XWJ9ZZmkCwf9F7gR1/aqYVFF6+o9
	1fGWxXt5FcTW/P329AHfR5fS77u3YlpRjo9zVHnIspRz54aS7cyWKPU1dHmbMrQ=
X-Gm-Gg: ASbGnctUYWyB+HJbpAk42+EZjsSuthBgCMvrUoNrJPkEHKhBx00n4QkqkQUMl3txgoq
	SozE4LT7eVIp6g3S245gxenuFCwGowhBljIzQLL+mDa/tR9YOAQd9xnBQZNP/Oflx1EfeQxNfGt
	GSb0ABMVVut7o8F8sR8A2WwH2xUesdmHrQ8FvBlGPjlcXyD4Y7sRoISw8h6PKCqcps9f8R8KIfq
	5C6HvgSw/clMaqBpI+eljPlg7HxVk53DOZ9taGjhLzNZh1OoHDosuvOzDU2aGovEEghvu3qfKEF
	43n1BJLj7iT/+dFAvolIHAxwuaCUMA==
X-Google-Smtp-Source: AGHT+IF5QEJjlcVoMCHYbEL9bkvB8NPE0fGP+5uB3Gu8Bcq90JNJIBJcqtP7X6LzerdMng+XvLTRkw==
X-Received: by 2002:a05:6512:ac4:b0:53e:3a43:9245 with SMTP id 2adb3069b0e04-53e3a4393c1mr2104284e87.28.1733656010740;
        Sun, 08 Dec 2024 03:06:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54019dc9a76sm309093e87.274.2024.12.08.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:06:49 -0800 (PST)
Date: Sun, 8 Dec 2024 13:06:46 +0200
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
Subject: Re: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
Message-ID: <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
 <20241206-caped-proficient-rattlesnake-c882f3@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-caped-proficient-rattlesnake-c882f3@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_030653_335229_87C6D785 
X-CRM114-Status: GOOD (  31.80  )
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

On Fri, Dec 06, 2024 at 03:34:52PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Dec 06, 2024 at 12:16:03PM +0200, Dmitry Baryshkov wrote:
> > The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
> > already reads EDID and propagates it to the drm_connector. Stop
> > rereading EDID as a part of the .get_modes() callback and just update
> > the list of modes. This matches the behaviour of the i915 driver.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
> >  1 file changed, 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800f02926300ffceb75c69 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
> >  
> >  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
> >  {
> > -	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> >  	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
> > -	const struct drm_edid *drm_edid;
> >  	int ret = 0;
> >  
> > -	/*
> > -	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
> > -	 * results in reentrancy issues since cec_s_phys_addr() might call
> > -	 * .adap_enable, which leads to that funtion being called with our mutex
> > -	 * held.
> > -	 *
> > -	 * Concurrency isn't an issue at the moment since we don't share
> > -	 * any state with any of the other frameworks so we can ignore
> > -	 * the lock for now.
> > -	 */
> > -
> > -	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> > -	drm_edid_connector_update(connector, drm_edid);
> > -	cec_s_phys_addr(vc4_hdmi->cec_adap,
> > -			connector->display_info.source_physical_address, false);
> > -	if (!drm_edid)
> > -		return 0;
> > -
> >  	ret = drm_edid_connector_add_modes(connector);
> > -	drm_edid_free(drm_edid);
> 
> I don't think that works though, for mostly two reasons:
> 
>  1) We're not sure we'll even have an hotplug interrupt if the system
>     boots with the connector plugged in for example.
> 
>  2) afaik, the get_modes ioctl directly calls get_modes too.

I think both paths use .fill_modes, not get_modes. And fill_modes
explicitly calls .detect / .detect_ctx. It would be nice if somebody can
verify the change on the acual hw. But as I wrote, i915 driver does
exactly the same: the EDID is read / updated in .detect_ctx(), while
.get_modes() only performs drm_edid_connector_add_modes().
Okay, there is one significant difference which we should probably patch
out: the .force() is also implemented to update EDID in the forced case.
I should probably do the same for the drivers being handled in this
patchset.

-- 
With best wishes
Dmitry

