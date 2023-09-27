Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C14E82CCB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 19:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WNIaHfHf8G98DYAohgySBFa+DHFzcpuvRsioFtGLyOk=; b=TM0FTtsjiHY9oTfH3HNWek0iVF
	2fpPI8to/WLpcgYs1LdeN2kHuc3a08FTZQCSPJUlFg0Ey+3b0et4yySW4YetLuJY59dz/AqRsJvKi
	FpfMmxsGWrYKbKiQe7/qcZ/jyyoonIZun9Uv6w3tDGXa5xuzhaQvmRLV4SjC5qFRBl6Xav/B+j9kY
	oCVln2dmPIqnGzSXdOPQrnGOXcTigUiixOH6tYnKWcW0LRvoKxS+r70/VbzPIExuaTS1MGZEErX8s
	h/AIAlmtTux9jgU2urqrqvMsU7YteCYhCv3DAfB/kUM6Xfb0gA8GIoM9VMQBIU1PDnvekSbyc8d82
	CRyWJ5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlaMl-001ff5-2D;
	Wed, 27 Sep 2023 19:38:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlaMN-001fOx-0i
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Sep 2023 19:38:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlaLy-00026g-2W; Wed, 27 Sep 2023 21:37:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlaLs-009PZ9-LJ; Wed, 27 Sep 2023 21:37:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlaLs-005RfL-9X; Wed, 27 Sep 2023 21:37:40 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Heiko Stuebner <heiko@sntech.de>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Balsam CHIHI <bchihi@baylibre.com>,
	Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	linux-mediatek@lists.infradead.org,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	=?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	linux-stm32@st-md-mailman.stormreply.com,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-tegra@vger.kernel.org,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	linux-omap@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 00/31] thermal: Convert to platform remove callback returning void
Date: Wed, 27 Sep 2023 21:37:05 +0200
Message-Id: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5170; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2L69+4GE6Q2OL+RVVKSxPv+do5u2Ko5kq68QSNMRgfA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlFIRZWCqRy7l7yarbl47C5yOf60xNKfQ07iYJW A/EEIHW5MqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRSEWQAKCRCPgPtYfRL+ Tu/sB/9Fn3Qg/Pk83TcfVVbu0SeXU/QOP+wQUG8fohOU85pUfxYkY2y+BVYOyX888wGbpmejtdt gW91oAV/dzkhd4Wr86G902HZjFECPbFhgFmENf63i4l4QNzQ8C6SLHeMWu7lKqGRrZF7ZGaGfWR IfLabFwqVCWBSyzWkwWFHFNYfMPAK60prZP+DNUDxK4NrGyRl7ExVV8C0C9zZorPoQ9B/Zn/ljw gidyl7KiLovd01L3cZgFeEQp8wKCgh5hqnCBvL+ze8e51hLIpYH8VnRjGOdMOPeeBbWlYUzK0Mo xhWkvBmAo5OvZftn9CDCw3HOp2YACajk8dVDXk/5/gIaMV0F
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_123811_461699_D0E35B6F 
X-CRM114-Status: GOOD (  11.54  )
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

this series converts all platform drivers below drivers/thermal to use
.remove_new(). The motivation is to get rid of an integer return code
that is (mostly) ignored by the platform driver core and error prone on
the driver side.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

There are no interdependencies between the patches. As there are still
quite a few drivers to convert, I'm happy about every patch that makes
it in. So even if there is a merge conflict with one patch until you
apply or a subject prefix is suboptimal, please apply the remainder of
this series anyhow.

Best regards
Uwe

Uwe Kleine-König (31):
  thermal: amlogic: Convert to platform remove callback returning void
  thermal: armada: Convert to platform remove callback returning void
  thermal: bcm2835: Convert to platform remove callback returning void
  thermal: ns: Convert to platform remove callback returning void
  thermal: da9062: Convert to platform remove callback returning void
  thermal: dove: Convert to platform remove callback returning void
  thermal: hisi: Convert to platform remove callback returning void
  thermal: imx8mm: Convert to platform remove callback returning void
  thermal: imx: Convert to platform remove callback returning void
  thermal: int3400: Convert to platform remove callback returning void
  thermal: int3401: Convert to platform remove callback returning void
  thermal: int3402: Convert to platform remove callback returning void
  thermal: int3403: Convert to platform remove callback returning void
  thermal: int3406: Convert to platform remove callback returning void
  thermal: k3_bandgap: Convert to platform remove callback returning void
  thermal: k3_j72xx_bandgap: Convert to platform remove callback returning void
  thermal: kirkwood: Convert to platform remove callback returning void
  thermal: lvts: Convert to platform remove callback returning void
  thermal: tsens: Convert to platform remove callback returning void
  thermal: rcar_gen3: Convert to platform remove callback returning void
  thermal: rcar: Convert to platform remove callback returning void
  thermal: rockchip: Convert to platform remove callback returning void
  thermal: rzg2l: Convert to platform remove callback returning void
  thermal: exynos_tmu: Convert to platform remove callback returning void
  thermal: spear: Convert to platform remove callback returning void
  thermal: sprd: Convert to platform remove callback returning void
  thermal: stm: Convert to platform remove callback returning void
  thermal: soctherm: Convert to platform remove callback returning void
  thermal: tegra-bpmp: Convert to platform remove callback returning void
  thermal: ti-bandgap: Convert to platform remove callback returning void
  thermal: uniphier: Convert to platform remove callback returning void

 drivers/thermal/amlogic_thermal.c                    | 12 +++++-------
 drivers/thermal/armada_thermal.c                     |  6 ++----
 drivers/thermal/broadcom/bcm2835_thermal.c           |  6 ++----
 drivers/thermal/broadcom/ns-thermal.c                |  6 ++----
 drivers/thermal/da9062-thermal.c                     |  5 ++---
 drivers/thermal/dove_thermal.c                       |  6 ++----
 drivers/thermal/hisi_thermal.c                       |  6 ++----
 drivers/thermal/imx8mm_thermal.c                     |  6 ++----
 drivers/thermal/imx_thermal.c                        |  6 ++----
 .../thermal/intel/int340x_thermal/int3400_thermal.c  |  5 ++---
 .../thermal/intel/int340x_thermal/int3401_thermal.c  |  6 ++----
 .../thermal/intel/int340x_thermal/int3402_thermal.c  |  6 ++----
 .../thermal/intel/int340x_thermal/int3403_thermal.c  |  6 ++----
 .../thermal/intel/int340x_thermal/int3406_thermal.c  |  5 ++---
 drivers/thermal/k3_bandgap.c                         |  6 ++----
 drivers/thermal/k3_j72xx_bandgap.c                   |  6 ++----
 drivers/thermal/kirkwood_thermal.c                   |  6 ++----
 drivers/thermal/mediatek/lvts_thermal.c              |  6 ++----
 drivers/thermal/qcom/tsens.c                         |  6 ++----
 drivers/thermal/rcar_gen3_thermal.c                  |  6 ++----
 drivers/thermal/rcar_thermal.c                       |  6 ++----
 drivers/thermal/rockchip_thermal.c                   |  6 ++----
 drivers/thermal/rzg2l_thermal.c                      |  6 ++----
 drivers/thermal/samsung/exynos_tmu.c                 |  6 ++----
 drivers/thermal/spear_thermal.c                      |  6 ++----
 drivers/thermal/sprd_thermal.c                       |  5 ++---
 drivers/thermal/st/stm_thermal.c                     |  6 ++----
 drivers/thermal/tegra/soctherm.c                     |  6 ++----
 drivers/thermal/tegra/tegra-bpmp-thermal.c           |  6 ++----
 drivers/thermal/ti-soc-thermal/ti-bandgap.c          |  6 ++----
 drivers/thermal/uniphier_thermal.c                   |  6 ++----
 31 files changed, 65 insertions(+), 123 deletions(-)

base-commit: 18030226a48de1fbfabf4ae16aaa2695a484254f
-- 
2.40.1


