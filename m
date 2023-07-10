Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D79EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSq2GNiSU47yjVpWEpFDOdrjHxdaed9YHkooTUQNIN8=; b=UneFXrsXgJ5dwB3bvakdspzvCn
	tkXya5Gtn6Xc6ipplq6alrj15MX+AqjroBo5Ife4nRDNQo8BRnksPtvNN5a+MzLEw/By+uhPoPpL7
	iXdPPZqHcGp7HTPztz0j1BO9ZqOsoE9+xVP796dfzmMDo+KArj87iX0yyfGNbOxXvqGTk7TJbzgWi
	6Tp76PU/k6GqlRUm21Z9FrvmRExSMx5dpyzildrC80hdHcnWrYh8ahd0cZ+Utpp1f1Co2kvkpkXq5
	adB1XGpl+duCCnnV1Q/BRICv6K1FcA4qxKoqNqFpBqMuZFMFZAHHt/p1E2WCW79fYtxJ41igH+EEQ
	SNtaW+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7r-00BE7t-27;
	Mon, 10 Jul 2023 10:28:15 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7f-00BDpt-2m;
	Mon, 10 Jul 2023 10:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688984883; x=1720520883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8VTp2VvPftW0K82t/UQGFNBKatn1Y+wh44m0tYwuY/M=;
  b=Nf0I1IIMR1HFHKszExi5nQov1OzQXaSb4oakD2wxGnU02fx5cG0fJbrR
   xFlOynpUlFpci+vVXjYunebIXX4ratlccKe0QKBsvttCbQ5C9mjZk3H9O
   bPMjFQ61d/+sDeX6jot2leXnxyxEfhJ6b3wUnAbpnt21scmkodFhkCiUj
   kjr6QO7C5l4yO7s7YPTruxtQ34kqucx4UVb4xHDrGLFUpXnLXmjmPWv3Y
   VlTiKNp9mV49UWacHdFzovZEpUUT1Wc8LcCNcTWx4PSXGBe1V1Q/IzDUR
   IwsgmbRLV2A4r76caRtfRaEYQozRCTbhtZvBB1VNJG7hgn5PPSvm2MCU+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="367803796"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="367803796"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 03:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755956019"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="755956019"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 03:27:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6D8A169F; Mon, 10 Jul 2023 13:27:53 +0300 (EEST)
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
Subject: [PATCH v1 8/8] spi: Use struct_size() helper
Date: Mon, 10 Jul 2023 13:27:51 +0300
Message-Id: <20230710102751.83314-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_032803_966840_8233BB97 
X-CRM114-Status: GOOD (  17.82  )
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

Prefer struct_size() over open-coded versions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/spi/spi.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index e9fb96016dc1..d4d686af76bd 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -17,6 +17,7 @@
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/overflow.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
@@ -1100,6 +1101,8 @@ struct spi_transfer {
  * @state: for use by whichever driver currently owns the message
  * @resources: for resource management when the SPI message is processed
  * @prepared: spi_prepare_message was called for the this message
+ * @t: for use with spi_message_alloc() when memory has message and transfers
+ *	together
  *
  * A @spi_message is used to execute an atomic sequence of data transfers,
  * each represented by a struct spi_transfer.  The sequence is "atomic"
@@ -1154,6 +1157,9 @@ struct spi_message {
 
 	/* List of spi_res resources when the SPI message is processed */
 	struct list_head        resources;
+
+	/* For embedding transfers into the memory of the message */
+	struct spi_transfer	t[];
 };
 
 static inline void spi_message_init_no_memset(struct spi_message *m)
@@ -1214,16 +1220,13 @@ static inline struct spi_message *spi_message_alloc(unsigned ntrans, gfp_t flags
 {
 	struct spi_message *m;
 
-	m = kzalloc(sizeof(struct spi_message)
-			+ ntrans * sizeof(struct spi_transfer),
-			flags);
+	m = kzalloc(struct_size(m, t, ntrans), flags);
 	if (m) {
 		unsigned i;
-		struct spi_transfer *t = (struct spi_transfer *)(m + 1);
 
 		spi_message_init_no_memset(m);
-		for (i = 0; i < ntrans; i++, t++)
-			spi_message_add_tail(t, m);
+		for (i = 0; i < ntrans; i++)
+			spi_message_add_tail(&m->t[i], m);
 	}
 	return m;
 }
-- 
2.40.0.1.gaa8946217a0b


