Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA89E7717F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2024 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YThwe23mDMw58S0YzeDlQzDzb/FEzhlX3ugmbXf8RUY=; b=qPiwg1+6/LvDk375DjouZjC5R9
	zQCLLmaKSfK/aWU+0G3PB3VdVGU7X2EG0lMZjSxelG9NBQ+EvjVCAcSidc9i69EuZG4BfcIzheXIM
	Vmp7fxOwJGgiFaNiqxl5Do7tkDwd7YimU5U1JM1RXDs7uAKYcO1GBUxdZhEZm+PshMHnRZTK+Adet
	7yWOYOtiVYnfHlvpbvdOgXs1nZ7Y2TdDlDplXoU8/ZzetjT1e17SsUKGKmYEKp8zI/Xy7PDfk9Zhh
	7VuhfuS/7jzRu+jrFHqtiKfzgTlD5QMAlvMN2NXbbZdeBLUnWmI6p3c4Txdz1OxbU3a2MwrKd8JAN
	9nRSygpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9FF-00000009om4-2ugl;
	Mon, 16 Dec 2024 11:26:37 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9FC-00000009okX-1qlA
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Dec 2024 11:26:35 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so4465607e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2024 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734348393; x=1734953193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YThwe23mDMw58S0YzeDlQzDzb/FEzhlX3ugmbXf8RUY=;
        b=fZo4SQOwo0xWJhD7JssscCw5uiAjfsNRwZHTJF9Jc7QQNHkcSmYZSR0BxDD3u8FvWq
         HxZwq+QSStwsQS35T3bXbJUClyuR8ae9RSCQQAQiGDDzSP3TEPpZJp40VmwmKcHdS02c
         O6LPSnvRew1Uuf/wDa4vZcIwvSN5FhB9wzdPpcpPg9C5Fqkz+chgLSJCPB7rdyf6VUui
         9XcmUe7R/CDOqBIhY5d9simCjNU5TrvzOb5gXmFCr55mv0DiLZYJ858ND+QkEJhnXD6A
         sHFuyfxavXDAxWN2tWzJ0h9b/pNimmyqfd4D6J/n57+Qcsv2Wgw5J/usCGRpBJjjUvOy
         90nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348393; x=1734953193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YThwe23mDMw58S0YzeDlQzDzb/FEzhlX3ugmbXf8RUY=;
        b=r4VylHTwqX+mc8qRvrlCPBcEgfR779l7zwqT45cZ0R0dRbcfKOC1NbzW6/Xc7v3Mp2
         Kz2OHhL7FL8crBi5ZF6Wq5WFM1lqsobkJhi0s7UVGx3bezFxd7IzkujctvjImeIDTpSK
         0MLckp5UZ6KQ+RQ63SL39shwxO1UWSbs9r7aHo9AtVsP6kkBH1xtU1Qkfo1iFZ29JM8P
         0PNGG2J+ZT+alElUpixW/FSiC06YMT36VNzxE7yeP86yC1fTlfhHGo/u2io6fh1OGxcQ
         SGgzegGnZsBgkJe9uOTQfQlvbaYnQw4lr7/4V6SFjqQzIn9QX6JLnLtX6sATXVBMCMWN
         hZeA==
X-Forwarded-Encrypted: i=1; AJvYcCXbfAKU0r/w1kZUclBFOa1NyCsnRLcDTh1ocD1MA59/VZqea9WrQxZCVsnUs6SkjDdkVFeno6EiqMBPZNNDKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB8uwkexJy5kGDPOoMk8bplcD5xN+SrdvKNQudQgOa1GobWQJ4
	0Lu9PeqPxUHUONkbt5Hhdoou7RKSX+eSZR7Yw5jlW7UXXJarsliRoxXDhJ/mTTQ=
X-Gm-Gg: ASbGncuJp5Zlhgu8OHXPe2KF3ZM4Pb/Is4efR0sTnVEt+/aWyz4+7YU07IcMe4gQBE0
	8QiKeZHd2shK7OuCHDDnadXoFhK3hXiNvADRRUnqrk1FnuwqT3CJzwZzzyVHR+txv+h10600Eow
	+rqcZEePUo3qc3Z/buBCpecGM39F3VKPWLTC+6lEqYL9AYNGOMANIAPlM43wfGqB87hHQ88zNIG
	LKrrF7bptf+nqeU8Q0x2MuFYxOZnxK3+0Yvk6kz+0boeFqS8K5JnZP3FqwbhWvTmqx2u2BChR4g
	w5YSBtAu9+lR3vH5exzv7/TfQxJcvq2/JfOF
X-Google-Smtp-Source: AGHT+IEC5KXhrrXGsT1eFAB/sps15bbUKYwoGeuTdcyybvAtpoczQRZn+Xw2w8c/HQ9Uc8g8NeiFrQ==
X-Received: by 2002:a05:6512:318b:b0:540:2a6e:3731 with SMTP id 2adb3069b0e04-5408b8f4a05mr4156948e87.5.1734348392766;
        Mon, 16 Dec 2024 03:26:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9e02sm811914e87.100.2024.12.16.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:26:32 -0800 (PST)
Date: Mon, 16 Dec 2024 13:26:29 +0200
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
Message-ID: <smaa7geowgyuvqvn6sph63ls5ublpt46zqdvt4yvqcg64scz3q@te52ty7x2soz>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
 <20241206-caped-proficient-rattlesnake-c882f3@houat>
 <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73xdxb575n4ncmadffkwqzczoewbadq3forpvqt4vp7zfln2nq@o2wmbbbepwgg>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_032634_483477_25A81034 
X-CRM114-Status: GOOD (  36.07  )
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

On Sun, Dec 08, 2024 at 01:06:46PM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 03:34:52PM +0100, Maxime Ripard wrote:
> > Hi,
> > 
> > On Fri, Dec 06, 2024 at 12:16:03PM +0200, Dmitry Baryshkov wrote:
> > > The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
> > > already reads EDID and propagates it to the drm_connector. Stop
> > > rereading EDID as a part of the .get_modes() callback and just update
> > > the list of modes. This matches the behaviour of the i915 driver.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
> > >  1 file changed, 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800f02926300ffceb75c69 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
> > >  
> > >  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
> > >  {
> > > -	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> > >  	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
> > > -	const struct drm_edid *drm_edid;
> > >  	int ret = 0;
> > >  
> > > -	/*
> > > -	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
> > > -	 * results in reentrancy issues since cec_s_phys_addr() might call
> > > -	 * .adap_enable, which leads to that funtion being called with our mutex
> > > -	 * held.
> > > -	 *
> > > -	 * Concurrency isn't an issue at the moment since we don't share
> > > -	 * any state with any of the other frameworks so we can ignore
> > > -	 * the lock for now.
> > > -	 */
> > > -
> > > -	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> > > -	drm_edid_connector_update(connector, drm_edid);
> > > -	cec_s_phys_addr(vc4_hdmi->cec_adap,
> > > -			connector->display_info.source_physical_address, false);
> > > -	if (!drm_edid)
> > > -		return 0;
> > > -
> > >  	ret = drm_edid_connector_add_modes(connector);
> > > -	drm_edid_free(drm_edid);
> > 
> > I don't think that works though, for mostly two reasons:
> > 
> >  1) We're not sure we'll even have an hotplug interrupt if the system
> >     boots with the connector plugged in for example.
> > 
> >  2) afaik, the get_modes ioctl directly calls get_modes too.
> 
> I think both paths use .fill_modes, not get_modes. And fill_modes
> explicitly calls .detect / .detect_ctx. It would be nice if somebody can
> verify the change on the acual hw. But as I wrote, i915 driver does
> exactly the same: the EDID is read / updated in .detect_ctx(), while
> .get_modes() only performs drm_edid_connector_add_modes().
> Okay, there is one significant difference which we should probably patch
> out: the .force() is also implemented to update EDID in the forced case.
> I should probably do the same for the drivers being handled in this
> patchset.

Maxime, will .force() cover your concerns? I probably fail to see a path
when .get_mode() is called without calling .detect() / .force() first.

-- 
With best wishes
Dmitry

