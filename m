Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37EBC54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G2Res7kz+34uMOH/QfWgumcbTKZf6JuuLkwo9CQ0WUA=; b=S3iTIKsRl9czc3Q3GehpjiU+a8
	nEn+iPaV+uWuqM+siOuAfrAg1j8vKnxjgkP9bHDmHmke66y1Xy+4ZjpKLEqb8qyScCWnC5eS1deM0
	7egvVYtLXpmWBqdkoSbpmJGRU3u0rC7FJ9pby2FSUnRnzcbyVR0rJD5MW9q8DTP6EhHJguiUXhW/u
	Lz+9iKwSnPRm0fBSBUxTWrBa+SxVmhvENjdeop7BkbzW3k7CNFsIx//fi9LribcYd4ifytmyrV9O1
	VyPwukf2QaUwHvn6JdLwqKjpvt0XjhpmlLUQrTV9YTEz4APcIbIMKOdqpQ7Nwp8hj/pU14NSwer0R
	j9GulX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCAO-00000004N4K-0Hdb;
	Thu, 07 Mar 2024 11:44:04 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCAJ-00000004My0-073m;
	Thu, 07 Mar 2024 11:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709811839; x=1741347839;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/WKZb4T8n+V6qspYzWiivDs83Rn6EvfqGQ+VXYpTh3U=;
  b=hF25wficrOSC0TKXTPAQI/xuxgipaNopI4snM38/wpawWp89sv8nKZKV
   AFoGCSl0+V9A4zYckPCjmpEia7a4rJI/K7am+mOiWYOVk2qg4ByYsT0pF
   pmAcyO84yZ3JJuks1iCREV9zDH46lmACEzW+Op/QW26o3qW2hKIMqquAC
   wbtv5PCTruvOjH4ChlWNzPEdQih9zav5FnB6SbbJ1DN4rI34QmVXyE4Im
   u1lA5C9FFhsmdxStyT7Kdscu8I0PUe2AE3JZzoAVKiRGYvJiN/RqQb2Yr
   ZolVfx4ODQFy+ijMzs6ETigZRQfFn9aFU/1+iOF9QeXPN/diU+wCDMnJv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15119967"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="15119967"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 03:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="937045880"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="937045880"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2024 03:43:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C2AAE193; Thu,  7 Mar 2024 13:43:49 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Axe Yang <axe.yang@mediatek.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mmc: mtk-sd: Remove unused of_gpio.h
Date: Thu,  7 Mar 2024 13:43:48 +0200
Message-ID: <20240307114348.3643034-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_034359_257616_EF1DBB91 
X-CRM114-Status: GOOD (  10.59  )
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

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it, simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mmc/host/mtk-sd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 1634b1f5d201..a94835b8ab93 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -13,7 +13,6 @@
 #include <linux/ioport.h>
 #include <linux/irq.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
-- 
2.43.0.rc1.1.gbec44491f096


