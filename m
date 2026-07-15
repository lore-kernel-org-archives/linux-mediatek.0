Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C7DC44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2xNjQMKnxOxV+YIQMMgbHvL77Gl204HIj3OPEzRzsM=; b=BiddvuVeyX8hRT0bVaXRI19SpS
	r+pjcGOKdl8IYyehxI766IfR4YPe/V0RbW8xgw1H33UjL1hhpvFFTM8DFLDPs/AZB4USNh1C+AhUk
	YiwXi+MaaBgEqxbQorEMzvg7PnS1DehE0ArH7uYbNx/g0zaJ4lqtf54jsxZOzQHKk5VKPRJQC9mzG
	yUYzaDl1CQtVh8U9AyWJs2IlID03C9XAXyS784qnoCVCYyJJNRuUNT7/1jdt02WqjO/chUDTwhIlt
	jdNxIs8OxZPDDkf4vQpQ/7TdnxxIqRosPvMcihXT1soG2Ns07DWTSzXJSM6dTOAYDJ+YzUydBzsLF
	/jj5eVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuOW-0000000E4m9-2KZU;
	Wed, 15 Jul 2026 07:51:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuOU-0000000E4lj-27Br;
	Wed, 15 Jul 2026 07:51:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F076841B1E;
	Wed, 15 Jul 2026 07:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4233D1F000E9;
	Wed, 15 Jul 2026 07:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784101861;
	bh=u2xNjQMKnxOxV+YIQMMgbHvL77Gl204HIj3OPEzRzsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JWLtEZZ2CK+RaDqDe5EsHoQ92youKV2BQAAQlaGJgphg5k/mzjYpg36OjbHXCF0LU
	 L1Y44OGtN3iW7cGAZcdkABWxxSsSwNIe3J3HXLSrVDLhkRNVKlPGhmxsW8VJ0LYZVe
	 kuckzsBquT8Bg2aTLWGuvbRhdskKXfpn7/pV1xKmwLlVXUd8Ljp99hWyXa42uCk1xj
	 Xe1MeTI6c87qN6VIFN1C+xvlYYR1qGRhb2UfBhXWGb97BoTWYYsncELSaIdmxEfRfg
	 L6+E8kZKPgscKW1i2KjiaCKSpPWZ1MnI3ZWyRobQz5dHLOfBNRAxRQbPL+POzb/nGz
	 j+pPTVb/xOArQ==
From: Maxime Ripard <mripard@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	freedreno@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: Re: [PATCH v2 00/37] drm/bridge: Convert all bridges to atomic
Date: Wed, 15 Jul 2026 09:50:57 +0200
Message-ID: <178410185255.27166.12276953519235775875.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
References: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 07 Jul 2026 17:11:07 +0200, Maxime Ripard wrote:
> Over the years, most of the bridges have been converted to atomic
> modesetting and hooks, but not all of them. This forces us to maintain
> two different code path in quite a few places, which is pretty
> bothersome. The switch to atomic modesetting for legacy bridges though
> is pretty trivial, and we don't have a lot of drivers still using the
> legacy path.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

