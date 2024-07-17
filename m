Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82116C3DA4B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=; b=jsbBR0dnfk72oTr2h2mpiCjgTH
	4uYh0z0dI4G7W+6/g+O4TZ235SWYBXtItxUZ79gI9reawQxn4vhirrNE7pwxBuWYw6o/aoV1O8zSf
	k+6T+KgXRs7UvhrH3vb4Z7PswkKzovhP3/MXvkIx4TMoOQuqYuHNMBHULsoif/Trnn8yAdcWWR5MA
	+kGz1a1FKhOFE00wQ7BMg+193Bz/4cB0RvnzeCo+udcuDsSy4Wftx52RqRhqWeEGlYh38DB/ImaQS
	aMAi3cPm6HF0mtBwg67vez81KZAOFhpraWfkpUHF3oN01tkK6xFqm/GUep2xppOq54aT11iTVQJ5u
	MP7nrDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU59z-0000000DyTv-49mr;
	Wed, 17 Jul 2024 13:57:36 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU59w-0000000DyRu-12nj
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jul 2024 13:57:34 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ebe3fb5d4dso8604561fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jul 2024 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721224650; x=1721829450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
        b=d9QVUeuaGhBmlS2IcBZHVOc6mh0zi/zlnCoBAf7QS118TBjLpVPGLXTA+JrXR4QhJb
         Qt7Y6F2dHeVmuJOzEXVE8pMe8DXLfMGqtDVFDlrMj5I9dqw1Sh3Vf5KPLBKK6miucd+r
         NtShP6M87fNxXLMXngzFhaUyqkWjGHeuf5GtBfWTClCfwjgty0Kdpn316cG15ewpdmsj
         RkKJOCLwFsbjkRJDwAcv0bgK8ARgmv/ptpLrBOpLqs4wA6/t19dqE5EZIijxBj7PeQQS
         rb41Vrp9+JiuUfUgvhAphVNcBYIU/LzN4hSjKf6ODk+5WxaFyfcc0Yr0Ri0GKH7jMN77
         k9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721224650; x=1721829450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
        b=YSbtX7DGB7+yrm5ZcCZD/OqoUEsPRNAqpj0/LITBPIj+2g1H2H2VsM3kYrtMqf87su
         Xwq2edjSNG/iBPoDvHdvYUVTxOEvszbff+PGh5C9o+5SzrI6+wy6nDcaRtqEUwatVL5O
         fLEHSOI2jO3HJuHYSBIguCsMiX4xrNYz2weINGWpZ74TNcKcy9SAn+jty186+U0zw6TY
         tX0bDQfBx6iw/C6e4GL4Sz+e375iIbwLx4V/rumPcey/jX+FqrGbkzx0uPtiwL0rk5+l
         +S9xn0sLEJKS6j7KeajyPycmEjpKCsShEgvdqwty9PI6N/BbBlT4hX/XfDK0iVVUTZvn
         ZUig==
X-Forwarded-Encrypted: i=1; AJvYcCVJlBvjFuUI5N11JDxbU+PJAY/OANmstfdHcJo6evlDktof0PCPWKibadKpsFX7Cjzb+W1c8h4d5FfRgEmGqFiSYHSPp2pTC9m1Vllt+Sqf+W3+
X-Gm-Message-State: AOJu0YyLXlXQGzHUSMB9EEg76BXCxuAyOIGmm1XkeRHzRfDxC1tXV8rA
	OuOrpE8zrX9tJMdXvisXjikrTma/mNq0+dW/hk+YFGEwErms6ZqYD7OefWTfVLY=
X-Google-Smtp-Source: AGHT+IG7iDrtCuBBKWvQaoQQbv/0kaeeUtziuz9N7l7vX5y+JvpROqU3u5NL1wFj8j7PpznoM4x7Ww==
X-Received: by 2002:a05:651c:2213:b0:2ec:1df4:589b with SMTP id 38308e7fff4ca-2eefcd61dd7mr7308201fa.1.1721224648985;
        Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee19148adsm14501371fa.100.2024.07.17.06.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:57:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/5] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
Message-ID: <gbcunf7zmafn5z76mrlgldmsy74s7e6jacv53mgpym2l75uq6h@talxrisbufsw>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
 <20240715-drm-bridge-connector-fix-hdmi-reset-v4-2-61e6417cfd99@linaro.org>
 <20240717-bouncy-horned-mamba-5691b8@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-bouncy-horned-mamba-5691b8@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_065732_446081_77D2DE5A 
X-CRM114-Status: GOOD (  18.14  )
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

On Wed, Jul 17, 2024 at 03:42:46PM GMT, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jul 15, 2024 at 09:33:02AM GMT, Dmitry Baryshkov wrote:
> > Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
> > that are immutable by definition - e.g. ranges with min == max or enums
> > with a single value. This matches the behaviour of the IGT tests, see
> > kms_properties.c / validate_range_prop(), validate_enum_prop(),
> > validate_bitmask_prop().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> We had a discussion yesterday about it on IRC with Sima, Simon and
> Xaver.
> 
> https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622;
> 
> The conclusion was that it would create an inconsistency between drivers
> on whether a given property is immutable or not, which will lead to more
> troubles for userspace.
> 
> It's not clear why Ville added that check in the first place, so the
> best course of action is to remove the IGT test and get the discussion
> started there.

Ack, I'll work on removing those tests later today.

-- 
With best wishes
Dmitry

