Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050E9C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zyov40Q0wo9O6asj4knI9mVgPVy/8ZXTtED7OO2jTIo=; b=kBS3Rkf0SWfpwXqM32bY7v4IZw
	6jiMhIz3BdPxCzVXkaYvLNaDlwKyLbjATCk4LpoF9lhfbfSYbN2wUl4Y0V+Q7oXi8y8i5NM9YR5AA
	KYyuJNAbnLCkmZGV/HGjhf9wjEJQQ17bv2yGsSkU6gu7U0a/GJlvlUkk3aWq4Rc5GJaVB+aTlhAwT
	0feD7geSLM234MocIgQN7NtgNzzgiQFI5iO/vs7/0O6AAU03P9RPU3H/xYNK8czIDuJBi81aLtpmt
	JYWblkkOZhCuPoC2ARPmA9Zcmd6NOdsNSDmvygO9x12Cx2v0I7StvZh35m2k62JT5TS9j80RVGhwY
	Ub9bPfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt9f-00C4MJ-31;
	Mon, 10 Jul 2023 15:50:27 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIt91-00C3g7-2y;
	Mon, 10 Jul 2023 15:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689004187; x=1720540187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NaAUtfuKUjWfIyo2AvU+b2/TN3c63zF3Fr8TWiuiUkI=;
  b=OQ5qqTEX505x8Tgg17KG2VYoY4Eoklsdx9vI3+fiRHFXRmQw8ife7Gy1
   3OjRoss7RokLb4a8I70/DORBCaZSr1cXwjnUsKVwtfB1iGAnvJq3WMwR/
   NYkyT/8JLOse+WlzoEbMmj4FrgkxPepIu6iWUVaqVrF+x3qWPqV8841OB
   i/cYdmWST0L3a5qMgJo8t1Lp+xO2QkNklpqhz+70ER3xKjms3K9QZJfqF
   lAWdZ+MRlaXTrftIM0FXrb1kcYJY4KjK/e27x2zpCrdVZE7jPnphgAJkt
   UMItyVe64xZQm3q5Q/lWrS2KN7OWDcvMUKkvhzsWJZdo+CACJFCkAEoq9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349185451"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="349185451"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 08:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="844921872"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="844921872"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 Jul 2023 08:49:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8BD3669A; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH v2 07/15] spi: Sort headers alphabetically
Date: Mon, 10 Jul 2023 18:49:24 +0300
Message-Id: <20230710154932.68377-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_084948_063410_BAF376B1 
X-CRM114-Status: GOOD (  12.09  )
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

Sorting headers alphabetically helps locating duplicates, and
make it easier to figure out where to insert new headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c       | 42 ++++++++++++++++++++---------------------
 include/linux/spi/spi.h | 14 +++++++-------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index cfb1c985d940..06a92a3a5746 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4,36 +4,36 @@
 // Copyright (C) 2005 David Brownell
 // Copyright (C) 2008 Secret Lab Technologies Ltd.
 
-#include <linux/kernel.h>
-#include <linux/device.h>
-#include <linux/init.h>
+#include <linux/acpi.h>
 #include <linux/cache.h>
-#include <linux/dma-mapping.h>
+#include <linux/clk/clk-conf.h>
+#include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/export.h>
+#include <linux/gpio/consumer.h>
+#include <linux/highmem.h>
+#include <linux/idr.h>
+#include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
-#include <linux/clk/clk-conf.h>
-#include <linux/slab.h>
-#include <linux/mod_devicetable.h>
-#include <linux/spi/spi.h>
-#include <linux/spi/spi-mem.h>
-#include <linux/gpio/consumer.h>
-#include <linux/pm_runtime.h>
+#include <linux/percpu.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
-#include <linux/export.h>
+#include <linux/ptp_clock_kernel.h>
 #include <linux/sched/rt.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
 #include <uapi/linux/sched/types.h>
-#include <linux/delay.h>
-#include <linux/kthread.h>
-#include <linux/ioport.h>
-#include <linux/acpi.h>
-#include <linux/highmem.h>
-#include <linux/idr.h>
-#include <linux/platform_data/x86/apple.h>
-#include <linux/ptp_clock_kernel.h>
-#include <linux/percpu.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/spi.h>
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 0ce1cb18a076..2026eae97329 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -6,19 +6,19 @@
 #ifndef __LINUX_SPI_H
 #define __LINUX_SPI_H
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/completion.h>
 #include <linux/device.h>
-#include <linux/mod_devicetable.h>
-#include <linux/slab.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kthread.h>
-#include <linux/completion.h>
+#include <linux/mod_devicetable.h>
 #include <linux/scatterlist.h>
-#include <linux/gpio/consumer.h>
-
-#include <uapi/linux/spi/spi.h>
-#include <linux/acpi.h>
+#include <linux/slab.h>
 #include <linux/u64_stats_sync.h>
 
+#include <uapi/linux/spi/spi.h>
+
 struct dma_chan;
 struct software_node;
 struct ptp_system_timestamp;
-- 
2.40.0.1.gaa8946217a0b


