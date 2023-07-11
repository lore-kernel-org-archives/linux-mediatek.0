Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60610EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkwnZAXUnxXlGIIXfjo6QLOuqBYji33K6e2hAQN+rq4=; b=PVRavpHk46oaRfty/TGCmhWtFr
	RkzdLNO+5Hfmp2ud2xRy6VMqlr6+IcXeC4RiGzJvwyPZin6z2qPnVf95hTGdhhuJd4Nb6jRynGtiI
	juZW3qk9UkCxIEyEm0b/5xcS1fYLd7MyM7T7HANmMeFeWVEvqCg4CHUViX9mW5b0PS+oWQZaI3kwP
	zHekx2q49FZJQUYJyxXVkwNpPVN+UaFIUb3x//+g5zXerYCmyt+blSfxshqh1yLIGmybrEBldaUEZ
	4fbREfZXEGtDkWX3B1pawXJLJFSItMO0/IUDG8mrAZ2PqXZDUNl+vFqVGqueEee1UCWC6byc2w6+D
	9RRqichg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJH0f-00FV0D-2f;
	Tue, 11 Jul 2023 17:18:45 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJH0Z-00FUvU-20;
	Tue, 11 Jul 2023 17:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689095919; x=1720631919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pAWPsjI4cTEbUbFXGBMVoie/XvBSHdTVWugoYwa5pwQ=;
  b=U8cGkc8C5y9snCwyg9MVZUTZ3OedH+HOoLfW6LgDcZMdSkpPXQ29OdId
   wPyWx+x0tw/QIP74AJlAvJ1T7T2dL5jIEsrihYex7veKJ6Dgjp/Mr47U2
   uROieHbndNf0aJUB77qlizhKPoIx6zqCgzFVu6GmDkAtgSd8WmOwj4OTC
   +fZH2I7A775CNeNhA1MAn6rNn69Y+w8GYWrSm0+xbjAmWDXBGF8dfo8yj
   uBwX9qiGALzvmqvBV4nRMUX7Ji6IXDjr7UhrDjM5Lmcye5XFKwBommaNi
   SHSNIgzclS2CbRYA8PIITlaGK9J+63zzaS1WinEagrWi8y7pvdxJdVhKH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344284035"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="344284035"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="845338540"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="845338540"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 11 Jul 2023 10:18:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 99EF06B9; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Serge Semin <fancer.lancer@gmail.com>,
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
	Richard Cochran <richardcochran@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 09/14] spi: Use struct_size() helper
Date: Tue, 11 Jul 2023 20:17:51 +0300
Message-Id: <20230711171756.86736-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
References: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_101839_677891_F32BF22D 
X-CRM114-Status: GOOD (  19.47  )
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

The Documentation/process/deprecated.rst suggests to use flexible array
members to provide a way to declare having a dynamically sized set of
trailing elements in a structure.This makes code robust agains bunch of
the issues described in the documentation, main of which is about the
correctness of the sizeof() calculation for this data structure.

Due to above, prefer struct_size() over open-coded versions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/spi/spi.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 21b77bdfac29..35fd61070d9b 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/kthread.h>
 #include <linux/mod_devicetable.h>
+#include <linux/overflow.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/u64_stats_sync.h>
@@ -1081,6 +1082,8 @@ struct spi_transfer {
  * @state: for use by whichever driver currently owns the message
  * @resources: for resource management when the spi message is processed
  * @prepared: spi_prepare_message was called for the this message
+ * @t: for use with spi_message_alloc() when message and transfers have
+ *	been allocated together
  *
  * A @spi_message is used to execute an atomic sequence of data transfers,
  * each represented by a struct spi_transfer.  The sequence is "atomic"
@@ -1133,6 +1136,9 @@ struct spi_message {
 
 	/* List of spi_res reources when the spi message is processed */
 	struct list_head        resources;
+
+	/* For embedding transfers into the memory of the message */
+	struct spi_transfer	t[];
 };
 
 static inline void spi_message_init_no_memset(struct spi_message *m)
@@ -1193,16 +1199,13 @@ static inline struct spi_message *spi_message_alloc(unsigned ntrans, gfp_t flags
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


