Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F5FC46CD3
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Dec 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zexQrPRY2pegCafFa/wmTU1bBUVX5N00Vi67wRiCGYs=; b=rOUHElmxQtQ4jyQx5CZQzd5CS/
	FweSXjJ9Fa+zgVqmyFbxwVFe/3K5EFpozI4duMD+DCgZPFQUaakLTqRiLJGvWIZy0g1V8eLGh9yq7
	V9IeXbiIH/bNDehSSG8JrXGzKmU4ibhoePlpIkI7Plgq0DKaBNnr5uok78utOdD4bmz8ThRM4ez4Y
	vnF3bVywMh0GeSAdaqkVsYNkGBET2PRTxPem7gWrwjQNXcQ1TWMGQpcp4p2iwo+o87eNWKwoevhQK
	vfAS6HvWVeFf4nsrCVR+68+W/fuIkWoTgTAfJUfOIQJSKGnb1vmzN07kV35UKJOyjJy891aQmNwq/
	iBNzQVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEs9t-007x93-0I;
	Sun, 17 Dec 2023 14:30:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEs9m-007x3j-2q
	for linux-mediatek@lists.infradead.org;
	Sun, 17 Dec 2023 14:30:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rEs9f-0006VJ-OC; Sun, 17 Dec 2023 15:30:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rEs9b-00GUh4-VU; Sun, 17 Dec 2023 15:30:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rEs9b-004hyq-J9; Sun, 17 Dec 2023 15:30:03 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel@pengutronix.de,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	linux-tegra@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 00/15] memory: Convert to platform remove callback returning void
Date: Sun, 17 Dec 2023 15:29:26 +0100
Message-ID: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2631; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=FyuyHaIj5jd4bPxOXQjJ+ozo7s7sihGMLWkkNmVGnME=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlfwXFp0yrTZyYp2KFK2fwTyu80UmXy69MORJAs wm48iAIgimJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZX8FxQAKCRCPgPtYfRL+ TgNJB/9eFZpgOAoyZMQMzWGucpEqIvWX6W0eNcnXBmurNkaFQmk9v1UHmj1xyNFW24mvDrwXPRz PaBLdyRO1QyT7ZOOWdkxvvYU+/g6yBUmpw+P5lihn0tefw+vl6Ej1suMnbs2tMdJ0FTQYQZRyQL ZnZyl3AYPprWtaCsKyu9b4pRwdQGJ4KG1NnvRkE562N+Wg7eXkwU5ah9EQWW4t+Jcs6SgvZHMhp 1quJkD1SA//uBFFZXLUV5UysntvLZwazuV3zLV81y6r02+H5X8Y3mcj7mX2qPf8Ubh9GWDrcybC h8kJTYL4+I5P2Hh+7xPkiTW8Rt32gZGaprL2X8zZ8V/x9QkC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_063014_931888_0C86E5E4 
X-CRM114-Status: UNSURE (   7.71  )
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

Hello,

this series converts the platform drivers below drivers/memory to make
use of .remove_new. See commit 5c5a7680e67b ("platform: Provide a remove
callback that returns no value") for an extended explanation and the
eventual goal. The TL;DR; is to make it harder for driver authors to
leak resources without noticing.

This is merge window material. All patches are pairwise independent of
each other so they can be applied individually. Still it would be great
to let them go in all together.

Best regards
Uwe

Uwe Kleine-König (15):
  memory: brcmstb_dpfe: Convert to platform remove callback returning void
  memory: brcmstb_memc: Convert to platform remove callback returning void
  memory: emif: Convert to platform remove callback returning void
  memory: fsl-corenet-cf: Convert to platform remove callback returning void
  memory: fsl_ifc: Convert to platform remove callback returning void
  memory: jz4780-nemc: Convert to platform remove callback returning void
  memory: mtk-smi: Convert to platform remove callback returning void
  memory: omap-gpmc: Convert to platform remove callback returning void
  memory: renesas-rpc-if: Convert to platform remove callback returning void
  memory: exynos5422-dmc: Convert to platform remove callback returning void
  memory: stm32-fmc2-ebi: Convert to platform remove callback returning void
  memory: tegra186-emc: Convert to platform remove callback returning void
  memory: tegra210-emc: Convert to platform remove callback returning void
  memory: ti-aemif: Convert to platform remove callback returning void
  memory: ti-emif-pm: Convert to platform remove callback returning void

 drivers/memory/brcmstb_dpfe.c            |  6 ++----
 drivers/memory/brcmstb_memc.c            |  6 ++----
 drivers/memory/emif.c                    |  6 ++----
 drivers/memory/fsl-corenet-cf.c          |  6 ++----
 drivers/memory/fsl_ifc.c                 |  6 ++----
 drivers/memory/jz4780-nemc.c             |  5 ++---
 drivers/memory/mtk-smi.c                 | 10 ++++------
 drivers/memory/omap-gpmc.c               |  6 ++----
 drivers/memory/renesas-rpc-if.c          |  6 ++----
 drivers/memory/samsung/exynos5422-dmc.c  |  6 ++----
 drivers/memory/stm32-fmc2-ebi.c          |  6 ++----
 drivers/memory/tegra/tegra186-emc.c      |  6 ++----
 drivers/memory/tegra/tegra210-emc-core.c |  6 ++----
 drivers/memory/ti-aemif.c                |  5 ++---
 drivers/memory/ti-emif-pm.c              |  6 ++----
 15 files changed, 32 insertions(+), 60 deletions(-)

base-commit: 17cb8a20bde66a520a2ca7aad1063e1ce7382240
-- 
2.42.0

