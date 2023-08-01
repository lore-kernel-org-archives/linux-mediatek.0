Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934FAC001E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gJqBXmiX93tHeT0Dp9Vx+RaHaL50rUAQw+lqzycyIvc=; b=fuZUOySWAuHQebjNb1MaQL9dVJ
	oeY/acGZ6bhv+AOViFWzLecz/sqF8Gp4xFlSdjZuUCSZv5jx+krej7/wb6F0op5PPkMVsfsJI/Tdb
	uV3E2aKwHRum1o+wWKkG+I7jJr41ssN7cF9nYuCXL+kXrw0JiuxaswCVYGmrk8QP9yIaWa41SuEoR
	JZO1FcuzEPDsy+9n7Lf1bTpIHvuh8GDsh1KSWe/Umj3UxxT0wp1FZ7tR2ENq2J1ePGX6D/HMoIKCJ
	unme0ZNItuvlJ5X+EqZfqE83ceuGX9rF0y85M3vavCo9a+i6JtFfXtT5LTuqZaajxgS/xVdXFP45Q
	HywMsNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQnAH-00236y-1t;
	Tue, 01 Aug 2023 11:03:45 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQnAA-00233G-1f
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 11:03:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qQn9L-0006er-TG; Tue, 01 Aug 2023 13:02:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qQn9G-000MYc-Qz; Tue, 01 Aug 2023 13:02:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qQn9F-009bb2-Rs; Tue, 01 Aug 2023 13:02:41 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Edmund Dea <edmund.j.dea@intel.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Liu Shixin <liushixin2@huawei.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Su Hui <suhui@nfschina.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Danilo Krummrich <dakr@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Deepak R Varma <drv@mailo.com>,
	Steven Price <steven.price@arm.com>,
	Thierry Reding <treding@nvidia.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Alexey Brodkin <abrodkin@synopsys.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@pengutronix.de,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	etnaviv@lists.freedesktop.org,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 00/12] drm: Convert to platform remove callback returning void
Date: Tue,  1 Aug 2023 13:02:27 +0200
Message-Id: <20230801110239.831099-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4647; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lLYOduakdAZPV7h2t7p0GtcJJgBTffjjiGktWPRzcYQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkyOWz7AY2J/amMZa1ly1xZnt1qVfdI+rjtzZOC 8JCyUY0p4KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMjlswAKCRCPgPtYfRL+ ToYFCACzSxwyZvnMzJgJyOkvEePf/ZXRnGrtlXaVQ3ZoUTHkj+i/+jpBQWVCP7WrMGN7DsJJNtK 0JA9E3Yn8ljBPqK2hZbNAJIiaj3l1RjP00t00TVHzUaRcD8bpf0MQbCl7XVh+S1lGpscwAhUhU5 EuB/uIagIPze58OicfVqTEO6iH3tvWG6Tiw+Vj2etWniKNEhnyG94qzpKxsJ1UQxqjG+th5ODs2 R/fbiH6ltN6uLcrT7oBmUbtwgnmFm0z6KSzEqBKSAi6WhI4Cz6iIb1+Kt+G3TH2c0+5ZjkMcAix V3zjdSfyyffaoQc3LkxVPtw9eSDLh/jJp7lNI4Ci05e+WBPm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_040338_737866_F1154FCD 
X-CRM114-Status: GOOD (  10.30  )
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

Hello,

(implicit) v1 of this series can be found at
https://lore.kernel.org/dri-devel/20230507162616.1368908-1-u.kleine-koenig@pengutronix.de

Back then the series contained 53 patches. A big bunch was already
applied to drm-misc, this is the remainder; with only little changes
compared to v1:

 - rebased to todays drm-misc-next
 - Squashed together the two mediatek patches
 - Adapted the subject prefix for the arcpgu as pointed out by Thomas
   Zimmermann. (This affected two patches originally, one of them was merged
   already before anyhow (next-20230801~41^2~34^2~179).)

All these patches are pairwise independant of each other and so can be
applied individually to their respective maintainer trees. I'm open to
get these all in together via drm-misc, but each maintainer picking the
individual patches that they are repsonsible for is maybe the easier
approach?!

Best regards
Uwe
   

Uwe Kleine-König (12):
  drm/armada: Convert to platform remove callback returning void
  drm/etnaviv: Convert to platform remove callback returning void
  drm/imx/dcss: Convert to platform remove callback returning void
  drm/imx/ipuv3: Convert to platform remove callback returning void
  drm/ingenic: Convert to platform remove callback returning void
  drm/kmb: Convert to platform remove callback returning void
  drm/mediatek: Convert to platform remove callback returning void
  drm/msm: Convert to platform remove callback returning void
  drm/nouveau: Convert to platform remove callback returning void
  drm/shmobile: Convert to platform remove callback returning void
  drm/sprd: Convert to platform remove callback returning void
  drm/arcpgu: Convert to platform remove callback returning void

 drivers/gpu/drm/armada/armada_crtc.c             | 5 ++---
 drivers/gpu/drm/armada/armada_drv.c              | 5 ++---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c            | 6 ++----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c            | 5 ++---
 drivers/gpu/drm/imx/dcss/dcss-drv.c              | 6 ++----
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c          | 6 ++----
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c         | 5 ++---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c              | 5 ++---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c              | 5 ++---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c           | 5 ++---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c     | 6 ++----
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c        | 6 ++----
 drivers/gpu/drm/ingenic/ingenic-ipu.c            | 5 ++---
 drivers/gpu/drm/kmb/kmb_drv.c                    | 5 ++---
 drivers/gpu/drm/mediatek/mtk_cec.c               | 5 ++---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c          | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c        | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_color.c        | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c        | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_merge.c        | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c          | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c         | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dp.c                | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dpi.c               | 6 ++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c           | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dsi.c               | 6 ++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c              | 5 ++---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c          | 6 ++----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c          | 5 ++---
 drivers/gpu/drm/msm/adreno/adreno_device.c       | 5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c          | 6 ++----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c         | 6 ++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c         | 5 ++---
 drivers/gpu/drm/msm/dp/dp_display.c              | 6 ++----
 drivers/gpu/drm/msm/dsi/dsi.c                    | 6 ++----
 drivers/gpu/drm/msm/hdmi/hdmi.c                  | 6 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 6 ++----
 drivers/gpu/drm/msm/msm_drv.c                    | 6 ++----
 drivers/gpu/drm/msm/msm_mdss.c                   | 6 ++----
 drivers/gpu/drm/nouveau/nouveau_platform.c       | 5 ++---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 6 ++----
 drivers/gpu/drm/sprd/sprd_dpu.c                  | 6 ++----
 drivers/gpu/drm/sprd/sprd_drm.c                  | 5 ++---
 drivers/gpu/drm/sprd/sprd_dsi.c                  | 6 ++----
 drivers/gpu/drm/tiny/arcpgu.c                    | 6 ++----
 45 files changed, 90 insertions(+), 164 deletions(-)

base-commit: 290cdd7959a734a0ef20ec096af7810177c4b9f8
-- 
2.39.2


