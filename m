Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC56FC04FFE
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 19:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vo7bJCbMEyu5Np64fs6j9DVC1r29O4aKCfzOk7tSQ4o=; b=HKqz0llpG0AI5LA/B9d9PPs0so
	Z8tvoxRkcBKvkxB05ybAtnq0/FQOAaEKMD5HLQidhjQD1dYBIULSgPQQLTidfSQHSjjtATb1998Sm
	wtedZSMDNUyb0hHqZ1jcloPRppGi0Y/Ad2MRSOjky/W1FnAgAp0MnWiOdjvImnttaPU2nGQmFMDsD
	QlMzgA4QUUo6lmDFOWUcLL8ggBtefkPk+8J+GDpeuvLpelBBMsv1B/h3I0Hh9TSEpazbUrwjRb60H
	n6SwmBp9UmhSxFdkXU+ziChrmGG1ESXPxxCeIxDwRXEzAYxGgrMRlWuR93U78HYsNCwQxJEz6zqbQ
	YUBBDKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLly-00000001GtF-1Yeg;
	Tue, 23 Apr 2024 19:25:46 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLls-00000001Gox-3fNt;
	Tue, 23 Apr 2024 19:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713900340; x=1745436340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GFgvUWu7beexxqgqYJWuWc2RAm6vGMhqSdFbjSi68w0=;
  b=BvYX5OX87epPxmoLcZMpRb/wlwHxGNI9Wg9s77fVhoM56Z1vkyxf97Tp
   YNFMlJtuh6cG/vMlKtfA1WghFmx88jBg82+VRsCvxJU1M/xTfRGq+gFh7
   PTpWV0g3IOgDSV0vMROne/dIOEZaANWGpHCc2oWr06+ucuTRpsX2szGTH
   3MrFP6emGh5Jo9BTShxaPK+GPwPTpKzWWRJZx7yW35Sm7eB4G2v5BhVMm
   nz3ZQLBP0u9U00z9xIQSDxCvFB0sKf/OjXPa5qnhKoEsSUnYKO/xOF2s+
   ZUTERMONn7NaNUVSMe9LJ6mxpL08oeSSlHgVVEgY6P/ONfbpRJpzU8S6R
   g==;
X-CSE-ConnectionGUID: P5ZnR1PwRnSj891CJRUiNA==
X-CSE-MsgGUID: hWx2NHSrRMKDbN1h0kDRIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9669110"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9669110"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:25:36 -0700
X-CSE-ConnectionGUID: LIxgFSoYQRiMXQah94XU/Q==
X-CSE-MsgGUID: uRkgrTKnQBm24ipxZkoGzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="61923095"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 23 Apr 2024 12:25:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BB7F9142; Tue, 23 Apr 2024 22:25:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Sean Young <sean@mess.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stefani Seibold <stefani@seibold.net>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 1/3] media: rc: Add missing io.h
Date: Tue, 23 Apr 2024 22:23:08 +0300
Message-ID: <20240423192529.3249134-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
References: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_122541_038441_343D9BF7 
X-CRM114-Status: GOOD (  10.14  )
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

In many remote control drivers the io.h is implied by others.
This is not good as it prevents from cleanups done in other headers.
Add missing include.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/rc/mtk-cir.c   | 1 +
 drivers/media/rc/serial_ir.c | 1 +
 drivers/media/rc/st_rc.c     | 1 +
 drivers/media/rc/sunxi-cir.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 4e294e59d3cb..b2f82b2d1c8d 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/io.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index 96ae0294ac10..fc5fd3927177 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/serial_reg.h>
 #include <linux/types.h>
diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
index 28477aa95563..988b09191c4c 100644
--- a/drivers/media/rc/st_rc.c
+++ b/drivers/media/rc/st_rc.c
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index bf58c965ead8..b49df8355e6b 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -12,6 +12,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac


