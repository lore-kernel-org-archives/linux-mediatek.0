Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830EFEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 10:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05Eo8yAcewTO+WPsEETnF/DlVCQ3v4XdrP+vRxVBOe8=; b=ndUM8tUNTb7xiz58u18KjGW0bb
	F7oZ95OR3RlbQ+Bv8F8Vx7KtnVE0e0ldlmTDDsmvE7+fmoKEKkIBOzPs+/mrdpbAmQkEaGV9UL/Uk
	9fCEcQItksUrW++QNNV7g5/4yEkJ+/6WN/QdlWo/uMEQz93UoDkQt1Jbz2pfJFftJO2JpVhp8vw3O
	SRyvCsdbWFNA2dsTfiyPcnSzokO9q7KAXEFfWtVtnqwP4TY7Sqi9JhI37BoKXhoCIuvbhi64eYUYC
	LkLuFSUXmn2EEQJBSEXNwhWF33qbBpY1IjemTTrgeigILVT2DSKm6taXIeLOR617o4lyFgvmVc7y4
	Wpfxf13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7c-00BDrh-2G;
	Mon, 10 Jul 2023 10:28:00 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7Z-00BDpZ-0F;
	Mon, 10 Jul 2023 10:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688984876; x=1720520876;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=REWyC/nAC6Z96ggpA1NLsyDE3cGETw1DuCTFixDA/T8=;
  b=WPa7xZELtJl7AToo5eIM8LMreroBLxpMJCTmw50PQWMNGzPkswKB4Gbf
   MbpQ7QifXjNMighG2vrqqoZnzEldnWcWqjHSfg/5yOIgk3Z1/UUSlZh42
   N5G0PkXhzKM5TWTXI3tDjBTcKszGoszOG8XLpeQnMswlmez3HewQUK0D4
   npzGnudfuQhireDkLLBNDuHCmK3X8cyChOg4UgVqbIMmO0NXrf5bGkEf5
   NW2hTBMHNDJ4zLvqqhMrglRJ7KY4W6ArQW29MuHs3YOXoMZaRy5dXf8mn
   so8J7gqlIoVzQTbwutNsYQ6ce4BX96VXCZAQjZcj+Pkr1m4YMoqdL6ogw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364345393"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="364345393"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 03:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865297523"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="865297523"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:27:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0244B379; Mon, 10 Jul 2023 13:27:52 +0300 (EEST)
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
Subject: [PATCH v1 2/8] spi: Drop duplicate IDR allocation code in spi_register_controller()
Date: Mon, 10 Jul 2023 13:27:45 +0300
Message-Id: <20230710102751.83314-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_032757_133502_64F9F3F6 
X-CRM114-Status: GOOD (  16.50  )
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

Refactor spi_register_controller() to drop duplicate IDR allocation.
Instead of if-else-if branching use two sequential if:s, which allows
to re-use the logic of IDR allocation in all cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 50 ++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 8f3282a71c63..6d74218cf38e 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3081,6 +3081,20 @@ static int spi_controller_check_ops(struct spi_controller *ctlr)
 	return 0;
 }
 
+/* Allocate dynamic bus number using Linux idr */
+static int spi_controller_id_alloc(struct spi_controller *ctlr, int start, int end)
+{
+	int id;
+
+	mutex_lock(&board_lock);
+	id = idr_alloc(&spi_master_idr, ctlr, start, end, GFP_KERNEL);
+	mutex_unlock(&board_lock);
+	if (WARN(id < 0, "couldn't get idr"))
+		return id == -ENOSPC ? -EBUSY : id;
+	ctlr->bus_num = id;
+	return 0;
+}
+
 /**
  * spi_register_controller - register SPI master or slave controller
  * @ctlr: initialized master, originally from spi_alloc_master() or
@@ -3108,8 +3122,8 @@ int spi_register_controller(struct spi_controller *ctlr)
 {
 	struct device		*dev = ctlr->dev.parent;
 	struct boardinfo	*bi;
+	int			first_dynamic;
 	int			status;
-	int			id, first_dynamic;
 
 	if (!dev)
 		return -ENODEV;
@@ -3122,27 +3136,13 @@ int spi_register_controller(struct spi_controller *ctlr)
 	if (status)
 		return status;
 
+	if (ctlr->bus_num < 0)
+		ctlr->bus_num = of_alias_get_id(ctlr->dev.of_node, "spi");
 	if (ctlr->bus_num >= 0) {
 		/* Devices with a fixed bus num must check-in with the num */
-		mutex_lock(&board_lock);
-		id = idr_alloc(&spi_master_idr, ctlr, ctlr->bus_num,
-			ctlr->bus_num + 1, GFP_KERNEL);
-		mutex_unlock(&board_lock);
-		if (WARN(id < 0, "couldn't get idr"))
-			return id == -ENOSPC ? -EBUSY : id;
-		ctlr->bus_num = id;
-	} else {
-		/* Allocate dynamic bus number using Linux idr */
-		id = of_alias_get_id(ctlr->dev.of_node, "spi");
-		if (id >= 0) {
-			ctlr->bus_num = id;
-			mutex_lock(&board_lock);
-			id = idr_alloc(&spi_master_idr, ctlr, ctlr->bus_num,
-				       ctlr->bus_num + 1, GFP_KERNEL);
-			mutex_unlock(&board_lock);
-			if (WARN(id < 0, "couldn't get idr"))
-				return id == -ENOSPC ? -EBUSY : id;
-		}
+		status = spi_controller_id_alloc(ctlr, ctlr->bus_num, ctlr->bus_num + 1);
+		if (status)
+			return status;
 	}
 	if (ctlr->bus_num < 0) {
 		first_dynamic = of_alias_get_highest_id("spi");
@@ -3151,13 +3151,9 @@ int spi_register_controller(struct spi_controller *ctlr)
 		else
 			first_dynamic++;
 
-		mutex_lock(&board_lock);
-		id = idr_alloc(&spi_master_idr, ctlr, first_dynamic,
-			       0, GFP_KERNEL);
-		mutex_unlock(&board_lock);
-		if (WARN(id < 0, "couldn't get idr"))
-			return id;
-		ctlr->bus_num = id;
+		status = spi_controller_id_alloc(ctlr, first_dynamic, 0);
+		if (status)
+			return status;
 	}
 	ctlr->bus_lock_flag = 0;
 	init_completion(&ctlr->xfer_completion);
-- 
2.40.0.1.gaa8946217a0b


