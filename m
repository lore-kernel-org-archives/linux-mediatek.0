Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208A2EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F1zJlITBWJ0pbk3kS7QvMBajMJf3zu3mzpMn1bCvK0=; b=5BppMTDvwtEnvTxZv69v+XZzBf
	ofSN0QufAv+/MjCzDzi2O/pIKkevJ9m5o05jiwTMtn2YBuG/ro0V/LkaickwO3hYWNV8Mw30PC6US
	bO7hZiLaKM/Eea59HZ46m87Hl2rjdU6obnICYAH1d7Znw/4CGwT0kTNOpbj3mMd6bKg9Ne9536sAO
	hswU9Zx6EVX+AeE3UlnQ95tOBkuu5eTprd+gqGPtzqy0FWPDtaGGecJ+/6cS+LL82a5DeG5xey+fp
	qCnmua3iKL8lq5cOzWVkW0otLKKGm9UZ2mdSTy7tVBR7U7hVuQqK/bWety2RjSLK12JNsl2X7INdl
	EwKZaLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7p-00BE5G-1J;
	Mon, 10 Jul 2023 10:28:13 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7f-00BDta-0p;
	Mon, 10 Jul 2023 10:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688984883; x=1720520883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UcwkOydYrSjyDo6SStNIT6kPqq10Rd6pUpZ9iNE8Ekk=;
  b=XzgRlmfcNDk5TbAW6Ats/eYL9wZXJECdkLkwnpU9Q5RuhjVMZ0LO9SUQ
   IeKiUh8E4ZXySsKvB4HOl7lG8x/WBnLSYpTHzwFKo4UDh8XppMTayt5qe
   Bi+6s8Vm8R+b3onSZLMgsyQYYIiuP09PkFR/rmLroA3p2amfDkQPUn6ES
   yKY28zlnExP9cBSgGDlA6bKBc8CtEJHNG7IMyqvnHTaaUADdIbezqNTjU
   PRHAPPi49KrHa2pLRpjdbZXhAHrK8ib2O07AHmhafY8Asmqp9InPrM+yv
   MF4KRQSGoa0zIUhPGF0Hv8VzfcQSa+BqBc0A2+HTS5bNcQ4bTuf7em1wX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364345469"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="364345469"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 03:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865297556"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="865297556"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:27:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4C598604; Mon, 10 Jul 2023 13:27:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Cc: Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH v1 6/8] spi: Clean up headers
Date: Mon, 10 Jul 2023 13:27:49 +0300
Message-Id: <20230710102751.83314-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_032803_307887_CA6CC3E3 
X-CRM114-Status: GOOD (  12.52  )
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

There is a few things done:
- include only the headers we are direct user of
- when pointer is in use, provide a forward declaration
- add missing headers
- group generic headers and subsystem headers
- sort each group alphabetically

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/spi/spi.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index becad31aeea2..8e7fc0f21714 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -6,27 +6,41 @@
 #ifndef __LINUX_SPI_H
 #define __LINUX_SPI_H
 
-#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/completion.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
-#include <linux/gpio/consumer.h>
+#include <linux/export.h>
 #include <linux/kthread.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/smp.h>
+#include <linux/spinlock_types.h>
+#include <linux/string.h>
+#include <linux/types.h>
 #include <linux/u64_stats_sync.h>
 
+#include <asm/byteorder.h>
+
 #include <uapi/linux/spi/spi.h>
 
+struct acpi_device;
 struct dma_chan;
-struct software_node;
+struct gpio_desc;
 struct ptp_system_timestamp;
+struct software_node;
+
 struct spi_controller;
-struct spi_transfer;
 struct spi_controller_mem_ops;
 struct spi_controller_mem_caps;
+struct spi_device_id;
 struct spi_message;
+struct spi_transfer;
 
 /*
  * INTERFACES between SPI master-side drivers and SPI slave protocol handlers,
-- 
2.40.0.1.gaa8946217a0b


