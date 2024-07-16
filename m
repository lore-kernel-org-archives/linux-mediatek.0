Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1899CC3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 09:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LE0se1f80ElC+S3eq8PsQCnApS/GMaT85l8NdsYXEhg=; b=vpX30+zSCihSMj4qe5Kb6VPUlC
	ihvw6tGc8ssX01VeYi0Wk+H+VIAR8h4Kzre6oA2waNbVXii2IxND/KsagWIFBnQAS3SP/VJxlY7uy
	GzTN2PQ84sT7x1FPhX7RnOTMjhJVIz8NE+iUoPtqrwHWTlmKmG4qgVgCWo+xSZTujew1aDdawevy0
	j8R+P1hKEJCt+bJUv/Bf5t1DAbSFWgTJyL1SX+VorrN6HrzCNUl4v+kUcO7blcC3GmFaOxZ6KnnMr
	s3dWJwIk1VF8FAVFK0nOdiOXOLPRfPhBUOukhG4uQNdgmroci6NQqgkXa/oEPELxivMYmD+PnkwNf
	ruy44dQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTeiB-00000009uxf-2K00;
	Tue, 16 Jul 2024 09:43:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTei6-00000009uuM-3pUQ;
	Tue, 16 Jul 2024 09:43:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F71E611FD;
	Tue, 16 Jul 2024 09:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9850EC4AF09;
	Tue, 16 Jul 2024 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721122982;
	bh=eNChfPChigiUxAWMQ3GMxFV/+m9v/jfaNQ16NzY8u8s=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=QMEWyG/YnYqbz5SV4MXIBqUNls9iqmvOzFWQ1NTePO3AsSHLUkQXT1z6YSiKL17F2
	 6Tzbn81TwwU63iI4bYx/ABq8c3EkqvY4F9UxyUw0Jp1YQO5Ph7u0MvCvPbHeCw9sIr
	 DwP2I/gMCPV0KtQ2vB1cIlybHr4zZW6i92aKhE3tad6BsxgVp/StTJWSolS4rUzLqH
	 IyUzsOU7CNx71PSDivf7y1kgYcsuXoT4no1Z4mIKPlyBAkDKKbfO7NrFmFDvWIsjKd
	 uet+mQjUnQONjhoIVQlXfHH6ceZikM/2gZyyCH3g8P1VFpZRd9dsBK9hNKIc5/0lgP
	 ro65TJyb6Fjyw==
Message-ID: <b357f0ccad87752368a8514fe796e6b8@kernel.org>
Date: Tue, 16 Jul 2024 09:42:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 4/5] drm/bridge-connector: move to DRM_DISPLAY_HELPER
 module
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-4-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-4-61e6417cfd99@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, igt-dev@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Anitha
 Chrisanthus" <anitha.chrisanthus@intel.com>, "Biju Das" <biju.das.jz@bp.renesas.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Edmund
 Dea" <edmund.j.dea@intel.com>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Kevin Hilman" <khilman@baylibre.com>, "Kieran
 Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurentiu
 Palcu" <laurentiu.palcu@oss.nxp.com>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Mikko Perttunen" <mperttunen@nvidia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Cercueil" <paul@crapouillou.net>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shawn Guo" <shawnguo@kernel.org>, "Thierry Reding" <thierry.reding@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_024303_066750_43A62E72 
X-CRM114-Status: UNSURE (   5.77  )
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

On Mon, 15 Jul 2024 09:33:04 +0300, Dmitry Baryshkov wrote:
> drm_bridge_connector is a "leaf" driver, belonging to the display
> helper, rather than the "CRTC" drm_kms_helper module. Move the driver
> to the drm/display and add necessary Kconfig selection clauses.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

