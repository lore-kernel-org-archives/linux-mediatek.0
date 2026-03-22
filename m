Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4ABFC72C2
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Mar 2026 14:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmdXwTMByXlQtXyVEuM8ZEQe80RkWuQUj8gRkLjyMOs=; b=K8dNxrYj5VgOCJJ7FqRqrCgq4i
	NioZk6FHeOEzH1JiBvOyIRVAmYb45VQiX35rAERviCW57qR7ubA4oDlZ71/N9jRVgeJGeaRW8wmzq
	jxGGlwrW/MCdeEUZK1QRJtvq8wlKkS1KAkQobI9WK0/TX2jU8CYHfEKtE9QZkIlQ2WgMB3oWtl6vk
	LyRvM6WQ3xbdR6oo8/CVyKZwn9sirEdiGMJ01aAIPxDOFgrzfCoy/mB23+w9bYeQH9rWpcK3OSiZY
	eMM+FIMabzRCCvf9QcogGm8FW34h546JhEpo2gOIetRMYpVvW8jnwtm92fDwxPz6jjRKKwGNZCKmX
	S40kRMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JMq-0000000FODW-3Qk2;
	Sun, 22 Mar 2026 14:01:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JMn-0000000FOCB-3p6B
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Mar 2026 14:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAC8944528
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 14:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF71EC2BCC9
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774188080;
	bh=QmdXwTMByXlQtXyVEuM8ZEQe80RkWuQUj8gRkLjyMOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lrt8fvFazEtLA06IWldGlVlmOQ9mHzsIa5lVgNVMJuSLZls+9ojaALd2yLH9TNEK8
	 Z9AFdviJ2lH+eG675obsclGgxjJPTRcR4aY9K2wcxIRO4SxtnQE2vD38hUhjmnSxNl
	 fbIkJfFr85Mi6bC+kRkjnqxWTUvDU0vDN932IWPczz0VpJZdBLSRxu5Xe42qUqrH62
	 ouH6ScH4hlVLr8Ah+of3+v7WGTtarOykMwhMNii4TFCDP1/dh7cH0Fn36QDbjgMLbj
	 tVPINM0Fdw6zw+4j9KR5Qak4ZCyu+equOiDjcaEFva7JzaVpWesAogJeJme0DmRoVn
	 6fJJI4MGAtdWA==
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0e38f3f60so1736294eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 07:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG2J3RiaGxL6Zq0v2tILb9V+lwoLh7D6LvUhrbR53JTH98l25vrzalRhysMHNK+VE/HUsJU6YpuFKvtRDc7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3nHozgB1M8jUeT5cJzNMAbwNltFcKIaojJkERVOatZJpuZI9W
	+R58E/Cp7zGaAc2Y8FjTRm9AaUSaBhckiI43ibzJDRXZmLh052P12Wc69ekzAZnGo+dyTWup0j0
	gFIgfesX9DO7g1dllpvbf6jOCPN07Eg==
X-Received: by 2002:a05:7022:125:b0:119:e569:f875 with SMTP id
 a92af1059eb24-12a72342011mr4458266c88.18.1774188079697; Sun, 22 Mar 2026
 07:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org> <20260305-drm-rework-color-formats-v3-11-f3935f6db579@kernel.org>
In-Reply-To: <20260305-drm-rework-color-formats-v3-11-f3935f6db579@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 14:01:07 +0000
X-Gmail-Original-Message-ID: <CAAOTY__bMYqtVLqYin4sLs1F=-yWoYVj=W0osL_vcwdqCHVACw@mail.gmail.com>
X-Gm-Features: AaiRm51o2YPhQeYKXw9UtRNG-i4wgZe6wEfJUWBYiwwTcCwjkboilWj5OZVfgGo
Message-ID: <CAAOTY__bMYqtVLqYin4sLs1F=-yWoYVj=W0osL_vcwdqCHVACw@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] drm/mediatek: dp: Convert to drm_output_color_format
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_070121_984684_C24E45BB 
X-CRM114-Status: GOOD (  12.61  )
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

Maxime Ripard <mripard@kernel.org> =E6=96=BC 2026=E5=B9=B43=E6=9C=885=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=889:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
>
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X =3D BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
>
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>

