Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE5EF4613F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 12:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAF8p1U7uar8PP4HOzHLKTDH3jnvZLO9q7mrlu5qKKs=; b=qmqI1Yqtye6ceQ5pssgDgQ8+U3
	mAni/RRcPi3m9bF0e2v7W/s1YD7SedrHyDUE48nIYRCHSImHK3JC8+jvnG/H1VXBRyzD5v5WjgnCX
	rb2j1CtDEcm4qni4JbIDaDTl9ZLg6frwrTJBrKpKPT53RV63fHPJllI99NHUMfs5wTLP93Serd3R2
	6BpTVjcYyc33H9yp4mx1wm+QR453XM/l34ouYevOX5OGF7GIZld7Rj3prZE+6YPZMVxHLMpUxTKwP
	CQIyFh3TLZOVVeXQTD15N7z0LpFMe0ECG29mg9O5CVEoxAiTfLg2vSHcBRbP6aX1xrGBRted1+5Ni
	vCHemS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Id-00000001SSl-116R;
	Tue, 24 Mar 2026 12:55:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Ib-00000001SSH-0r2n;
	Tue, 24 Mar 2026 12:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D22960180;
	Tue, 24 Mar 2026 12:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896B3C19424;
	Tue, 24 Mar 2026 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356956;
	bh=x9GUZF8oVtf8rR9qYu62wTpiEswFPmE02/ei7YJtid4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eSYOw08eJ6g6mU188ifGnIiCj5eU9B72ydk5Z3j79gDD2hyqgBBtm1TrxAlVCKUx1
	 XX+BA43vPXn2rPdwn72j9VJMiJAoLas4KxELQIfr7P7UVVTmvjqD68L+4MdAdWs2fH
	 m3+IwlCoV1dfc4BAkjCgu/ea0C0wf2/h27d0SoqZxaouJ1j83vRMdb+yjVyJaZRoSn
	 8lcoTRABcNcoRoxrN+n7lto8X7HIfw72/df9lLNgtxUzcffZ0uA3RDVkIoAs/etLuO
	 qAPKXZtp60DrBIrawPlMXWDywnCzEM0+etpTW626pZVG9KL/5ZFdXgiCabvk6uqacQ
	 1M+RLdJyXuSfQ==
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Liu Ying <victor.liu@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 00/14] drm: Create drm_output_color_format enum
Date: Tue, 24 Mar 2026 13:55:51 +0100
Message-ID: <177435694766.397542.7138744621268133444.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
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

On Thu, 05 Mar 2026 10:04:52 +0100, Maxime Ripard wrote:
> This series creates an enum to represent the output color format as an
> enum instead of a bitmask, and consolidate the HDMI helpers to use the
> new enum.
> 
> This should make Nicolas' work easier.
> 
> It has been build tested, and passes kunit tests.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

