Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D98EE68973
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cXfxCOSCCDsGQXdudRWpM8YQIgHxf/iMVVa46Ci1WQ4=; b=CopWiYTAEr/TtXGtHbwKlTHrkR
	F+RnUDknnZrZxxU+Eo3ZHHZLBP+sGzEKKj2xkfx6lg0EDc9vOp3ud4RljE3VbmXBjz1JZH/YA7ugr
	UkxijqwL0hS3x9JbOqblBgdPa/doImWnmQbEfam+7pz+SMuvWDZumujYCrWvW6QF/YlxXMxmCjvBI
	KMJW+R2bUOQjNWxo4y4i/W1YLPz2BSRxJzgbq9l71bX9onnn0mi1pAM6el7B4V04QOiVra52rc3jh
	gqrLqju6IWYvy5xnWEBUWUcSP+11dtMuccaj+Jjr44wfSPjn8fjA6xACSjEd2DE677c3AhFJd+8WA
	Oh97bXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SR5-00000003Ejw-1BG7;
	Thu, 31 Oct 2024 10:29:51 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SOp-00000003ENm-1ptq;
	Thu, 31 Oct 2024 10:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730370452; x=1761906452;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sMV2z22HhG0zsL48EdWLeFMLr9EjY9q66UIZQ9UxxWA=;
  b=Sox055b8VSghbL9gLQI2dyW34g6nGOnelV5LC4PwqNZGdCQYahO/ZZUG
   olrYeqStWAaEInk8fgBozhf6isVxZ5TD1uhsRrMjSYaW+TGko6sDMWKim
   qpcz/tVoY08V2vhtjqfNVmq8pu7b8Aj6nWsbOsCyScbAfYfdhdDqi2/MD
   icyfA9ok67mAa/y3AUur69tO6INOoMsemuf8ryiD+2j+CKDYpPywvujuH
   L9ExIrd+pi78afkUO2fS2TGVEYB/YW9ifrVosznEVnk1QZzcw9KGphDRv
   FPCdCP7sJmMs2B3ZI1+IDH5UTe7EZpqRVxsg2DE886pmNLGJ7hA58j5a8
   Q==;
X-CSE-ConnectionGUID: KaaiUdbqQ8emvnEplpLvhg==
X-CSE-MsgGUID: DxTECaC6Rb2Imx83fIPSOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33790967"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33790967"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:27:30 -0700
X-CSE-ConnectionGUID: L3AEn0I4SUmVHwy636km8Q==
X-CSE-MsgGUID: S6Rf/zfdSbiDY2tP1Ub+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="120049378"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 31 Oct 2024 03:27:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3410717D; Thu, 31 Oct 2024 12:27:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Nicolas Belin <nbelin@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
Date: Thu, 31 Oct 2024 12:27:25 +0200
Message-ID: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_032731_551691_C2455BB7 
X-CRM114-Status: UNSURE (   8.12  )
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index d398e83ea052..9f28d6bf0323 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -6,12 +6,19 @@
  * Authors: Nicolas Belin <nbelin@baylibre.com>
  */
 
+#include <linux/array_size.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
+
 #include "mt8365-afe-common.h"
-#include <linux/pinctrl/consumer.h>
 #include "../common/mtk-soc-card.h"
 #include "../common/mtk-soundcard-driver.h"
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


