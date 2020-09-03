Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBECC2D0A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 838EF2078E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="igOhdG0K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HX+EdATu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 838EF2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4dDIhNRqrCb/VbDtT6fzI4gp8ilThbi4o3ZiVwqS+Nc=; b=igOhdG0KlybQPTguwgbJD4qD6
	Zjw8Mhxro3KBG89ZAuhmWpYH11zlD6rxj5d6UVo3TpxXvIXqlZYfBSPRCgT5T34RLaQfjL8qzLKHh
	bYshydlkUf/wJMPs9ehBqPzs2Rm3FopGx+gdLvZPScEZLmR5HXa4IX6S8Ov5MqFYJmwXuPbryodJ4
	mWuNrK0tP481ZnDW5Av72iiPWQ43yjcmeifdazecROcxX4igvORpOC+o6FgeOHJclivIJ3++iZPjh
	I1LreIRwfqRXU4nbqe/UR6ASlzH3QkdiRit7TlG+GcNcUg37MMcuuCLLgQTCwAUGc/oguuaITKgiK
	khOg1fuIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDybX-00076h-Oh; Thu, 03 Sep 2020 23:25:19 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDybL-0006zl-Cx
 for linux-mediatek@lists.infradead.org; Thu, 03 Sep 2020 23:25:12 +0000
Received: by mail-pf1-x444.google.com with SMTP id u20so3591430pfn.0
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Sep 2020 16:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rGnhoXwDJpbKl2Taj/rxRecun7QGp2xg578jHD4svho=;
 b=HX+EdATuuxHBZGgcuszukpsbKI96f7DdQSvJJt51OtBzjMIM9DgjvczExmomjl3rVe
 Uhv+Nr6nSXroA75r//hdDFdHdZndyKmTMfXsTasdoZEb66fknSQYyPpq6d8LlGoshMO8
 vDu5YTVLQ6coIGnwf4cT7AG8mR/WLjXm+5Lyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rGnhoXwDJpbKl2Taj/rxRecun7QGp2xg578jHD4svho=;
 b=NRoWJ1PQBaDRyL7IkENe2xmiSLVMwVOWNEgNWynfSNVQfHxQDGZ8/PnTprUXbs8M7y
 8bIELtJhfJkqqeKo2ZOjO26TI+wW8ZI+dsTunjcHsetO9lhCzCNRDAw88XvOHUlnN0t6
 /xQHpxQIM+uACdFFhXFXpX7x1e4vvRDTK3Wz/FUIm6v00QhY331oQEF8T1I8Hejv3nvP
 ElC1TOxj+ypXjBSsk+va/T6v9+VchXE/AL0LsMgWWJcCzaEE4K6FtSs72FMCX1o4ogsm
 6vCp8p06pI4GFjrUmK0wWnaxKSad/qkI02x+R7lOvMrLAGTCyu6KMWLbhk/DfeX2cPhk
 LVyA==
X-Gm-Message-State: AOAM5339GJmr7cUE9LtVx6UHsSdeRyrBNOZwpKwXq84wptwcNO+Gq1S0
 N5lpc1CZahPgUY1ybi7Fc0L7qw==
X-Google-Smtp-Source: ABdhPJx42fUqMLgszqAfIRRY8iZxu5ZS9sF4p4+uDsNv70HKnXUvRvuDqZVySxSxgSf5JiS/ZXaSBg==
X-Received: by 2002:a17:902:b20d:b029:d0:92cc:a1dd with SMTP id
 t13-20020a170902b20db02900d092cca1ddmr162830plr.12.1599175504397; 
 Thu, 03 Sep 2020 16:25:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q7sm3614459pgg.10.2020.09.03.16.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 16:25:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 1/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 existed in v4.4
Date: Thu,  3 Sep 2020 16:24:36 -0700
Message-Id: <20200903162412.1.Id501e96fa63224f77bb86b2135a5e8324ffb9c43@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200903232441.2694866-1-dianders@chromium.org>
References: <20200903232441.2694866-1-dianders@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_192507_479409_5E4F27FF 
X-CRM114-Status: GOOD (  18.45  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Yangtao Li <tiny.windzz@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Paul Cercueil <paul@crapouillou.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Marek Vasut <marex@denx.de>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Lee Jones <lee.jones@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Pierre Ossman <pierre@ossman.eu>, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, swboyd@chromium.org,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Lars Persson <lars.persson@axis.com>,
 Ben Dooks <ben-linux@fluff.org>, Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Barry Song <baohua@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vkoul@kernel.org>, Patrice Chotard <patrice.chotard@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Ricky Wu <ricky_wu@realtek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
probe") but applied to a whole pile of drivers.  This batch converts
the drivers that appeared to be around in the v4.4 timeframe.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/android-goldfish.c | 1 +
 drivers/mmc/host/atmel-mci.c        | 1 +
 drivers/mmc/host/au1xmmc.c          | 1 +
 drivers/mmc/host/davinci_mmc.c      | 1 +
 drivers/mmc/host/dw_mmc-exynos.c    | 1 +
 drivers/mmc/host/dw_mmc-k3.c        | 1 +
 drivers/mmc/host/dw_mmc-pltfm.c     | 1 +
 drivers/mmc/host/dw_mmc-rockchip.c  | 1 +
 drivers/mmc/host/jz4740_mmc.c       | 1 +
 drivers/mmc/host/moxart-mmc.c       | 1 +
 drivers/mmc/host/mtk-sd.c           | 1 +
 drivers/mmc/host/mvsdio.c           | 1 +
 drivers/mmc/host/mxcmmc.c           | 1 +
 drivers/mmc/host/mxs-mmc.c          | 1 +
 drivers/mmc/host/omap.c             | 1 +
 drivers/mmc/host/omap_hsmmc.c       | 1 +
 drivers/mmc/host/pxamci.c           | 1 +
 drivers/mmc/host/rtsx_pci_sdmmc.c   | 1 +
 drivers/mmc/host/rtsx_usb_sdmmc.c   | 1 +
 drivers/mmc/host/s3cmci.c           | 1 +
 drivers/mmc/host/sdhci-acpi.c       | 1 +
 drivers/mmc/host/sdhci-bcm-kona.c   | 1 +
 drivers/mmc/host/sdhci-cns3xxx.c    | 1 +
 drivers/mmc/host/sdhci-dove.c       | 1 +
 drivers/mmc/host/sdhci-esdhc-imx.c  | 1 +
 drivers/mmc/host/sdhci-iproc.c      | 1 +
 drivers/mmc/host/sdhci-of-arasan.c  | 1 +
 drivers/mmc/host/sdhci-of-at91.c    | 1 +
 drivers/mmc/host/sdhci-of-esdhc.c   | 1 +
 drivers/mmc/host/sdhci-of-hlwd.c    | 1 +
 drivers/mmc/host/sdhci-pxav2.c      | 1 +
 drivers/mmc/host/sdhci-pxav3.c      | 1 +
 drivers/mmc/host/sdhci-s3c.c        | 1 +
 drivers/mmc/host/sdhci-sirf.c       | 1 +
 drivers/mmc/host/sdhci-spear.c      | 1 +
 drivers/mmc/host/sdhci-st.c         | 1 +
 drivers/mmc/host/sdhci-tegra.c      | 1 +
 drivers/mmc/host/sdhci_f_sdh30.c    | 1 +
 drivers/mmc/host/sh_mmcif.c         | 1 +
 drivers/mmc/host/sunxi-mmc.c        | 1 +
 drivers/mmc/host/tmio_mmc.c         | 1 +
 drivers/mmc/host/usdhi6rol0.c       | 1 +
 drivers/mmc/host/wbsd.c             | 1 +
 drivers/mmc/host/wmt-sdmmc.c        | 1 +
 44 files changed, 44 insertions(+)

diff --git a/drivers/mmc/host/android-goldfish.c b/drivers/mmc/host/android-goldfish.c
index ceb4924e02d0..e878fdf8f20a 100644
--- a/drivers/mmc/host/android-goldfish.c
+++ b/drivers/mmc/host/android-goldfish.c
@@ -537,6 +537,7 @@ static struct platform_driver goldfish_mmc_driver = {
 	.remove		= goldfish_mmc_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 300901415aa2..19d72eb0ec5a 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -2668,6 +2668,7 @@ static struct platform_driver atmci_driver = {
 	.remove		= atmci_remove,
 	.driver		= {
 		.name		= "atmel_mci",
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= of_match_ptr(atmci_dt_ids),
 		.pm		= &atmci_dev_pm_ops,
 	},
diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
index 9bb1910268ca..bd00515fbaba 100644
--- a/drivers/mmc/host/au1xmmc.c
+++ b/drivers/mmc/host/au1xmmc.c
@@ -1189,6 +1189,7 @@ static struct platform_driver au1xmmc_driver = {
 	.resume        = au1xmmc_resume,
 	.driver        = {
 		.name  = DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index a138e1ea6805..384e989f493a 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1395,6 +1395,7 @@ static const struct dev_pm_ops davinci_mmcsd_pm = {
 static struct platform_driver davinci_mmcsd_driver = {
 	.driver		= {
 		.name	= "davinci_mmc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= davinci_mmcsd_pm_ops,
 		.of_match_table = davinci_mmc_dt_ids,
 	},
diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
index 95adeee07217..0c75810812a0 100644
--- a/drivers/mmc/host/dw_mmc-exynos.c
+++ b/drivers/mmc/host/dw_mmc-exynos.c
@@ -592,6 +592,7 @@ static struct platform_driver dw_mci_exynos_pltfm_driver = {
 	.remove		= dw_mci_exynos_remove,
 	.driver		= {
 		.name		= "dwmmc_exynos",
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= dw_mci_exynos_match,
 		.pm		= &dw_mci_exynos_pmops,
 	},
diff --git a/drivers/mmc/host/dw_mmc-k3.c b/drivers/mmc/host/dw_mmc-k3.c
index 50977ff18074..ea7e6c734394 100644
--- a/drivers/mmc/host/dw_mmc-k3.c
+++ b/drivers/mmc/host/dw_mmc-k3.c
@@ -473,6 +473,7 @@ static struct platform_driver dw_mci_k3_pltfm_driver = {
 	.remove		= dw_mci_pltfm_remove,
 	.driver		= {
 		.name		= "dwmmc_k3",
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= dw_mci_k3_match,
 		.pm		= &dw_mci_k3_dev_pm_ops,
 	},
diff --git a/drivers/mmc/host/dw_mmc-pltfm.c b/drivers/mmc/host/dw_mmc-pltfm.c
index 7de37f524a96..73731cd3ba23 100644
--- a/drivers/mmc/host/dw_mmc-pltfm.c
+++ b/drivers/mmc/host/dw_mmc-pltfm.c
@@ -98,6 +98,7 @@ static struct platform_driver dw_mci_pltfm_driver = {
 	.remove		= dw_mci_pltfm_remove,
 	.driver		= {
 		.name		= "dw_mmc",
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= dw_mci_pltfm_match,
 		.pm		= &dw_mci_pltfm_pmops,
 	},
diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
index d4d02134848c..753502ce3c85 100644
--- a/drivers/mmc/host/dw_mmc-rockchip.c
+++ b/drivers/mmc/host/dw_mmc-rockchip.c
@@ -383,6 +383,7 @@ static struct platform_driver dw_mci_rockchip_pltfm_driver = {
 	.remove		= dw_mci_rockchip_remove,
 	.driver		= {
 		.name		= "dwmmc_rockchip",
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= dw_mci_rockchip_match,
 		.pm		= &dw_mci_rockchip_dev_pm_ops,
 	},
diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 21fd0939bb7b..e2a111e54097 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -1125,6 +1125,7 @@ static struct platform_driver jz4740_mmc_driver = {
 	.remove = jz4740_mmc_remove,
 	.driver = {
 		.name = "jz4740-mmc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(jz4740_mmc_of_match),
 		.pm = pm_ptr(&jz4740_mmc_pm_ops),
 	},
diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.c
index fc6b9cf27d0b..2bfb376fddc4 100644
--- a/drivers/mmc/host/moxart-mmc.c
+++ b/drivers/mmc/host/moxart-mmc.c
@@ -717,6 +717,7 @@ static struct platform_driver moxart_mmc_driver = {
 	.remove     = moxart_remove,
 	.driver     = {
 		.name		= "mmc-moxart",
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= moxart_mmc_match,
 	},
 };
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index ed2b24691b4f..691c928edab7 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2689,6 +2689,7 @@ static struct platform_driver mt_msdc_driver = {
 	.remove = msdc_drv_remove,
 	.driver = {
 		.name = "mtk-msdc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = msdc_of_ids,
 		.pm = &msdc_dev_pm_ops,
 	},
diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
index cc0752a9df6d..629efbe639c4 100644
--- a/drivers/mmc/host/mvsdio.c
+++ b/drivers/mmc/host/mvsdio.c
@@ -824,6 +824,7 @@ static struct platform_driver mvsd_driver = {
 	.remove		= mvsd_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = mvsdio_dt_ids,
 	},
 };
diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index b3d654c688e5..12ee07285980 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -1244,6 +1244,7 @@ static struct platform_driver mxcmci_driver = {
 	.id_table	= mxcmci_devtype,
 	.driver		= {
 		.name		= DRIVER_NAME,
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &mxcmci_pm_ops,
 		.of_match_table	= mxcmci_of_match,
 	}
diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
index b1820def36c0..75007f61df97 100644
--- a/drivers/mmc/host/mxs-mmc.c
+++ b/drivers/mmc/host/mxs-mmc.c
@@ -726,6 +726,7 @@ static struct platform_driver mxs_mmc_driver = {
 	.id_table	= mxs_ssp_ids,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &mxs_mmc_pm_ops,
 		.of_match_table = mxs_mmc_dt_ids,
 	},
diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 33d7af7c7762..6aa0537f1f84 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -1504,6 +1504,7 @@ static struct platform_driver mmc_omap_driver = {
 	.remove		= mmc_omap_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(mmc_omap_match),
 	},
 };
diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index 37b8740513f5..036264443646 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -2171,6 +2171,7 @@ static struct platform_driver omap_hsmmc_driver = {
 	.remove		= omap_hsmmc_remove,
 	.driver		= {
 		.name = DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm = &omap_hsmmc_dev_pm_ops,
 		.of_match_table = of_match_ptr(omap_mmc_of_match),
 	},
diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 3a9333475a2b..29f6180a0036 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -811,6 +811,7 @@ static struct platform_driver pxamci_driver = {
 	.remove		= pxamci_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(pxa_mmc_dt_ids),
 	},
 };
diff --git a/drivers/mmc/host/rtsx_pci_sdmmc.c b/drivers/mmc/host/rtsx_pci_sdmmc.c
index 2763a376b054..eb395e144207 100644
--- a/drivers/mmc/host/rtsx_pci_sdmmc.c
+++ b/drivers/mmc/host/rtsx_pci_sdmmc.c
@@ -1471,6 +1471,7 @@ static struct platform_driver rtsx_pci_sdmmc_driver = {
 	.id_table       = rtsx_pci_sdmmc_ids,
 	.driver		= {
 		.name	= DRV_NAME_RTSX_PCI_SDMMC,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(rtsx_pci_sdmmc_driver);
diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index 7225d9312af8..598f49573f5d 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -1458,6 +1458,7 @@ static struct platform_driver rtsx_usb_sdmmc_driver = {
 	.id_table       = rtsx_usb_sdmmc_ids,
 	.driver		= {
 		.name	= "rtsx_usb_sdmmc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &rtsx_usb_sdmmc_dev_pm_ops,
 	},
 };
diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
index a725fb1abce7..e3698aba8dd3 100644
--- a/drivers/mmc/host/s3cmci.c
+++ b/drivers/mmc/host/s3cmci.c
@@ -1804,6 +1804,7 @@ MODULE_DEVICE_TABLE(platform, s3cmci_driver_ids);
 static struct platform_driver s3cmci_driver = {
 	.driver	= {
 		.name	= "s3c-sdi",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = s3cmci_dt_match,
 	},
 	.id_table	= s3cmci_driver_ids,
diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index 284cba11e279..fc41d0451f20 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -1027,6 +1027,7 @@ static const struct dev_pm_ops sdhci_acpi_pm_ops = {
 static struct platform_driver sdhci_acpi_driver = {
 	.driver = {
 		.name			= "sdhci-acpi",
+		.probe_type		= PROBE_PREFER_ASYNCHRONOUS,
 		.acpi_match_table	= sdhci_acpi_ids,
 		.pm			= &sdhci_acpi_pm_ops,
 	},
diff --git a/drivers/mmc/host/sdhci-bcm-kona.c b/drivers/mmc/host/sdhci-bcm-kona.c
index a6c2bd202b45..4d4aac85cc7a 100644
--- a/drivers/mmc/host/sdhci-bcm-kona.c
+++ b/drivers/mmc/host/sdhci-bcm-kona.c
@@ -324,6 +324,7 @@ static int sdhci_bcm_kona_probe(struct platform_device *pdev)
 static struct platform_driver sdhci_bcm_kona_driver = {
 	.driver		= {
 		.name	= "sdhci-kona",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &sdhci_pltfm_pmops,
 		.of_match_table = sdhci_bcm_kona_of_match,
 	},
diff --git a/drivers/mmc/host/sdhci-cns3xxx.c b/drivers/mmc/host/sdhci-cns3xxx.c
index 811eab1b8964..2a29c7a4f308 100644
--- a/drivers/mmc/host/sdhci-cns3xxx.c
+++ b/drivers/mmc/host/sdhci-cns3xxx.c
@@ -98,6 +98,7 @@ static int sdhci_cns3xxx_probe(struct platform_device *pdev)
 static struct platform_driver sdhci_cns3xxx_driver = {
 	.driver		= {
 		.name	= "sdhci-cns3xxx",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &sdhci_pltfm_pmops,
 	},
 	.probe		= sdhci_cns3xxx_probe,
diff --git a/drivers/mmc/host/sdhci-dove.c b/drivers/mmc/host/sdhci-dove.c
index fe9da3122fe9..5e5bf82e5976 100644
--- a/drivers/mmc/host/sdhci-dove.c
+++ b/drivers/mmc/host/sdhci-dove.c
@@ -105,6 +105,7 @@ MODULE_DEVICE_TABLE(of, sdhci_dove_of_match_table);
 static struct platform_driver sdhci_dove_driver = {
 	.driver		= {
 		.name	= "sdhci-dove",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &sdhci_pltfm_pmops,
 		.of_match_table = sdhci_dove_of_match_table,
 	},
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 325e241b5f99..6a859616dcc7 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1925,6 +1925,7 @@ static const struct dev_pm_ops sdhci_esdhc_pmops = {
 static struct platform_driver sdhci_esdhc_imx_driver = {
 	.driver		= {
 		.name	= "sdhci-esdhc-imx",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = imx_esdhc_dt_ids,
 		.pm	= &sdhci_esdhc_pmops,
 	},
diff --git a/drivers/mmc/host/sdhci-iproc.c b/drivers/mmc/host/sdhci-iproc.c
index b540aa6faacb..c9434b461aab 100644
--- a/drivers/mmc/host/sdhci-iproc.c
+++ b/drivers/mmc/host/sdhci-iproc.c
@@ -369,6 +369,7 @@ static int sdhci_iproc_probe(struct platform_device *pdev)
 static struct platform_driver sdhci_iproc_driver = {
 	.driver = {
 		.name = "sdhci-iproc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_iproc_of_match,
 		.acpi_match_table = ACPI_PTR(sdhci_iproc_acpi_ids),
 		.pm = &sdhci_pltfm_pmops,
diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 3aea46db2ea7..829ccef87426 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -1693,6 +1693,7 @@ static int sdhci_arasan_remove(struct platform_device *pdev)
 static struct platform_driver sdhci_arasan_driver = {
 	.driver = {
 		.name = "sdhci-arasan",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_arasan_of_match,
 		.pm = &sdhci_arasan_dev_pm_ops,
 	},
diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index 1ece2c50042c..5564d7b23e7c 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -465,6 +465,7 @@ static int sdhci_at91_remove(struct platform_device *pdev)
 static struct platform_driver sdhci_at91_driver = {
 	.driver		= {
 		.name	= "sdhci-at91",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_at91_dt_match,
 		.pm	= &sdhci_at91_dev_pm_ops,
 	},
diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
index 45881b309956..3a3340c9b8c9 100644
--- a/drivers/mmc/host/sdhci-of-esdhc.c
+++ b/drivers/mmc/host/sdhci-of-esdhc.c
@@ -1468,6 +1468,7 @@ static int sdhci_esdhc_probe(struct platform_device *pdev)
 static struct platform_driver sdhci_esdhc_driver = {
 	.driver = {
 		.name = "sdhci-esdhc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_esdhc_of_match,
 		.pm = &esdhc_of_dev_pm_ops,
 	},
diff --git a/drivers/mmc/host/sdhci-of-hlwd.c b/drivers/mmc/host/sdhci-of-hlwd.c
index da844a39af6e..12675797b296 100644
--- a/drivers/mmc/host/sdhci-of-hlwd.c
+++ b/drivers/mmc/host/sdhci-of-hlwd.c
@@ -80,6 +80,7 @@ MODULE_DEVICE_TABLE(of, sdhci_hlwd_of_match);
 static struct platform_driver sdhci_hlwd_driver = {
 	.driver = {
 		.name = "sdhci-hlwd",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_hlwd_of_match,
 		.pm = &sdhci_pltfm_pmops,
 	},
diff --git a/drivers/mmc/host/sdhci-pxav2.c b/drivers/mmc/host/sdhci-pxav2.c
index 9282bc4b8c41..f18906b5575f 100644
--- a/drivers/mmc/host/sdhci-pxav2.c
+++ b/drivers/mmc/host/sdhci-pxav2.c
@@ -226,6 +226,7 @@ static int sdhci_pxav2_probe(struct platform_device *pdev)
 static struct platform_driver sdhci_pxav2_driver = {
 	.driver		= {
 		.name	= "sdhci-pxav2",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(sdhci_pxav2_of_match),
 		.pm	= &sdhci_pltfm_pmops,
 	},
diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
index e55037ceda73..a6d89a3f1946 100644
--- a/drivers/mmc/host/sdhci-pxav3.c
+++ b/drivers/mmc/host/sdhci-pxav3.c
@@ -567,6 +567,7 @@ static const struct dev_pm_ops sdhci_pxav3_pmops = {
 static struct platform_driver sdhci_pxav3_driver = {
 	.driver		= {
 		.name	= "sdhci-pxav3",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(sdhci_pxav3_of_match),
 		.pm	= &sdhci_pxav3_pmops,
 	},
diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 9194bb73e601..ae75bebbbfbf 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -784,6 +784,7 @@ static struct platform_driver sdhci_s3c_driver = {
 	.id_table	= sdhci_s3c_driver_ids,
 	.driver		= {
 		.name	= "s3c-sdhci",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(sdhci_s3c_dt_match),
 		.pm	= &sdhci_s3c_pmops,
 	},
diff --git a/drivers/mmc/host/sdhci-sirf.c b/drivers/mmc/host/sdhci-sirf.c
index f4b05dd6c20a..e9b347b3af7e 100644
--- a/drivers/mmc/host/sdhci-sirf.c
+++ b/drivers/mmc/host/sdhci-sirf.c
@@ -220,6 +220,7 @@ MODULE_DEVICE_TABLE(of, sdhci_sirf_of_match);
 static struct platform_driver sdhci_sirf_driver = {
 	.driver		= {
 		.name	= "sdhci-sirf",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_sirf_of_match,
 		.pm	= &sdhci_pltfm_pmops,
 	},
diff --git a/drivers/mmc/host/sdhci-spear.c b/drivers/mmc/host/sdhci-spear.c
index b4b63089a4e2..d463e2fd5b1a 100644
--- a/drivers/mmc/host/sdhci-spear.c
+++ b/drivers/mmc/host/sdhci-spear.c
@@ -181,6 +181,7 @@ MODULE_DEVICE_TABLE(of, sdhci_spear_id_table);
 static struct platform_driver sdhci_driver = {
 	.driver = {
 		.name	= "sdhci",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &sdhci_pm_ops,
 		.of_match_table = of_match_ptr(sdhci_spear_id_table),
 	},
diff --git a/drivers/mmc/host/sdhci-st.c b/drivers/mmc/host/sdhci-st.c
index 1301cebfc3ea..4e9ff3e828ba 100644
--- a/drivers/mmc/host/sdhci-st.c
+++ b/drivers/mmc/host/sdhci-st.c
@@ -521,6 +521,7 @@ static struct platform_driver sdhci_st_driver = {
 	.remove = sdhci_st_remove,
 	.driver = {
 		   .name = "sdhci-st",
+		   .probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		   .pm = &sdhci_st_pmops,
 		   .of_match_table = of_match_ptr(st_sdhci_match),
 		  },
diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 428cdc53c858..ed12aacb1c73 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -1782,6 +1782,7 @@ static SIMPLE_DEV_PM_OPS(sdhci_tegra_dev_pm_ops, sdhci_tegra_suspend,
 static struct platform_driver sdhci_tegra_driver = {
 	.driver		= {
 		.name	= "sdhci-tegra",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_tegra_dt_match,
 		.pm	= &sdhci_tegra_dev_pm_ops,
 	},
diff --git a/drivers/mmc/host/sdhci_f_sdh30.c b/drivers/mmc/host/sdhci_f_sdh30.c
index 4625cc071b61..3f5977979cf2 100644
--- a/drivers/mmc/host/sdhci_f_sdh30.c
+++ b/drivers/mmc/host/sdhci_f_sdh30.c
@@ -219,6 +219,7 @@ MODULE_DEVICE_TABLE(acpi, f_sdh30_acpi_ids);
 static struct platform_driver sdhci_f_sdh30_driver = {
 	.driver = {
 		.name = "f_sdh30",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(f_sdh30_dt_ids),
 		.acpi_match_table = ACPI_PTR(f_sdh30_acpi_ids),
 		.pm	= &sdhci_pltfm_pmops,
diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 9f53634aa411..e5e457037235 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -1562,6 +1562,7 @@ static struct platform_driver sh_mmcif_driver = {
 	.remove		= sh_mmcif_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &sh_mmcif_dev_pm_ops,
 		.of_match_table = sh_mmcif_of_match,
 	},
diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index 5e95bbc51644..fc62773602ec 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1514,6 +1514,7 @@ static const struct dev_pm_ops sunxi_mmc_pm_ops = {
 static struct platform_driver sunxi_mmc_driver = {
 	.driver = {
 		.name	= "sunxi-mmc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(sunxi_mmc_of_match),
 		.pm = &sunxi_mmc_pm_ops,
 	},
diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
index 757c90160ae4..d2d3b8df1bbe 100644
--- a/drivers/mmc/host/tmio_mmc.c
+++ b/drivers/mmc/host/tmio_mmc.c
@@ -213,6 +213,7 @@ static const struct dev_pm_ops tmio_mmc_dev_pm_ops = {
 static struct platform_driver tmio_mmc_driver = {
 	.driver = {
 		.name = "tmio-mmc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm = &tmio_mmc_dev_pm_ops,
 	},
 	.probe = tmio_mmc_probe,
diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.c
index 369b8dee2e3d..f644f7035f16 100644
--- a/drivers/mmc/host/usdhi6rol0.c
+++ b/drivers/mmc/host/usdhi6rol0.c
@@ -1890,6 +1890,7 @@ static struct platform_driver usdhi6_driver = {
 	.remove		= usdhi6_remove,
 	.driver		= {
 		.name	= "usdhi6rol0",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = usdhi6_of_match,
 	},
 };
diff --git a/drivers/mmc/host/wbsd.c b/drivers/mmc/host/wbsd.c
index 67f917d6ecd3..cd63ea865b77 100644
--- a/drivers/mmc/host/wbsd.c
+++ b/drivers/mmc/host/wbsd.c
@@ -1905,6 +1905,7 @@ static struct platform_driver wbsd_driver = {
 	.resume		= wbsd_platform_resume,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
index 2c4ba1fa4bbf..cf10949fb0ac 100644
--- a/drivers/mmc/host/wmt-sdmmc.c
+++ b/drivers/mmc/host/wmt-sdmmc.c
@@ -990,6 +990,7 @@ static struct platform_driver wmt_mci_driver = {
 	.remove = wmt_mci_remove,
 	.driver = {
 		.name = DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm = wmt_mci_pm_ops,
 		.of_match_table = wmt_mci_dt_ids,
 	},
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
