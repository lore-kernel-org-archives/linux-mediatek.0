Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DC5CD13CF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kw6IqkbApTGBRcMOTyEmtKlIm/JnBcjUDqAFqi2AYYA=; b=M3+ail+sexIoweRGX+DYeedr7o
	w97hbPBuxFCUx/vy34UIzDCuYTR+4tJ3FzRh6xYN3h6ChZ0PpY78mXGL7OPr6Elr+9g2RcOoUPTxL
	WKKkyQlPoBdTFPXBaOOr+BgVvKfhI+xbyfR/38pkd8jsRevtX0NjoYpeTXPHNIllk4FDj4bG8NUzQ
	9nio43s1lPWtiSjiqPBvoJGj+KpbrwEJqMVbn1iyID2bTwtFPWzlX3zleqeEmGQ7Jl+iMy9Jnmsf+
	1BlHmCAei42RuNdiBHbKK0fCpxV1mCV9ZiOaFRH4p2/+ZdKfyM79Tn69Ti55lK69UGRWHNkM64XBC
	jpsRyCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOrk-0000000GtEn-3z4s;
	Tue, 03 Sep 2024 08:26:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOka-0000000GsMb-2XoU;
	Tue, 03 Sep 2024 08:18:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87A465C578F;
	Tue,  3 Sep 2024 08:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA55C4CEC4;
	Tue,  3 Sep 2024 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725351535;
	bh=g7ymmQH2esDD1HmWV3+1wWNSYvcNjH8kYis73gaYP5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=olU2tuWXIpJl+vvUtyzzy74giwBPEJKRv8ViT1WDop+wVwLYcWCzt7Fu1FzdP6aOQ
	 omZ2kda/DoqTHYh3BkIvuTszwSh13Y9pVP4iFGHuElNuBYCZ8Vz6ReM5BwFxRINaD0
	 iQYhbM7oWAy2epdsGIzsk2p8ejaUfgj+rLveyEhczMqXf8oEfXlZcAUcHKEtTVa7Mj
	 7s1O+Bgz3RyrHOYTi2tc5gAPrI9OHgf4jYH859LrRxIeVK2YmYyLP60IwNE/VmSLvy
	 B6zB3xZ8LTxG5NxuO3KX4cOo45+Q1C3iSPJW0YEaPc51JXE6yIaGfAnbACwSfrOjjx
	 yiZn+bVCzwblw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Edmund Dea <edmund.j.dea@intel.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 0/3] drm: fix two issues related to HDMI Connector implementation
Date: Tue,  3 Sep 2024 10:18:50 +0200
Message-ID: <172535151881.1826612.11747911526055879779.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
References: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_011856_771582_96074BAE 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Tue, 03 Sep 2024 05:01:55 +0300, Dmitry Baryshkov wrote:
> Running IGT tests on Qualcomm Dragonboard820c uncovered two issues with
> the HDMI Connector implementation and with its integration into the
> drm_bridge_connector. Fix those issues.
> 
> Note, I'm not fully satisfied with the drm_bridge_connector move. Maybe
> it's better to add drm_bridge_funcs::connector_reset() and call it from
> __drm_atomic_helper_connector_reset().
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime

