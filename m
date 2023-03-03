Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D54C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaXCVPjMTLiev1mb+8EwCfDrHgM6em5kKtDpTtYrDuo=; b=WNC+M7t/Ibh4SlCWGgOaawvL5K
	DUgY6oW1bOVqhQOcZq+RETeBdOLBNxZzeAMt0jXMFPfKrHau9IykB+kK3WIcdg6xNEXyXRzZ8/0sM
	iaM005lfnUtdYhd5mV/s5IdaSsUjsOrUfIgbylZP7r57rr6rqWMCYt5ECSw78FgIoobiPHQ5110aH
	uAJu3mI1R8LXBnTIjs1J1BoQfjj1p+fsDQOCCiT29NZJ5lvuTLkSmcq/uhEx67JIhXDwSJ5pFqE3S
	SRQAR0u28GGhM+5PQD7Ke9Fm54xaH5jMI6ZTVO1pJBLZFL6Uub+yOzjDHpiUBU9E/k9ONOv0RDZWA
	2HsYWliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY7du-006jrI-Lw; Fri, 03 Mar 2023 15:48:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY7dq-006jpt-MV; Fri, 03 Mar 2023 15:48:19 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pY7cn-0005si-GH; Fri, 03 Mar 2023 16:47:13 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: rafael@kernel.org, daniel.lezcano@linaro.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mark Brown <broonie@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Dhruva Gole <d-gole@ti.com>,
 Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Thara Gopinath <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Zheng Yongjun <zhengyongjun3@huawei.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
 "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
 Shang XiaoJing <shangxiaojing@huawei.com>, Tim Zimmermann <tim@linux4.de>,
 Yang Li <yang.lee@linux.alibaba.com>, Jiang Jian <jiangjian@cdjrlc.com>,
 Daniel Golle <daniel@makrotopia.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ido Schimmel <idosch@nvidia.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Johan Hovold <johan+linaro@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject:  Re: [PATCH v5 02/18] thermal/core: Use the thermal zone 'devdata' accessor in
 thermal located drivers
Date: Fri, 03 Mar 2023 16:47:15 +0100
Message-ID: <3152081.5fSG56mABF@diego>
In-Reply-To: <20230301201446.3713334-3-daniel.lezcano@linaro.org>
References:  <20230301201446.3713334-1-daniel.lezcano@linaro.org>
 <20230301201446.3713334-3-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_074818_765396_41E329E9 
X-CRM114-Status: GOOD (  12.73  )
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

Am Mittwoch, 1. M=E4rz 2023, 21:14:30 CET schrieb Daniel Lezcano:
> The thermal zone device structure is exposed to the different drivers
> and obviously they access the internals while that should be
> restricted to the core thermal code.
>=20
> In order to self-encapsulate the thermal core code, we need to prevent
> the drivers accessing directly the thermal zone structure and provide
> accessor functions to deal with.
>=20
> Use the devdata accessor introduced in the previous patch.
>=20
> No functional changes intended.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se> #=
R-Car
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com> #MediaTek auxadc and lvts
> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek lvts
> Reviewed-by: Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com> #da9062
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>  #spread
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com> #sun8i_thermal
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com> #Broadcom
> Reviewed-by: Dhruva Gole <d-gole@ti.com> # K3 bandgap

Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip



