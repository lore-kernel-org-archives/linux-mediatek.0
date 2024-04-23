Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83148C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 19:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqeYhrfFLqq6SdBrMAUZdZSjyRNnqpiz7Nyx9DYD9I0=; b=Cdk6+Cf2bTTo6Wsc1/GsekOQQR
	4E/431TDHBFRQC27oDEaxfV6e+glulaueAyIzp9JwLFKEOqearBFguLtlBxVqXegNV+JdtwvOg9gr
	39lwh62JSn8RVU6Y3iHf4LP0CDAy4xlc2ZdW+hjB7OEcHHnBYWOZ/v7tskveunBL2MELh5AIUMoWA
	UkZiBQjce6u9QjxhDqmg/MOXFCMnS05zgssbsCyjDfIWejTJDpoWB6fy895+kOtQjGftHME+PvJes
	w+FEpNlZum8aAGY/TnTlngzprUuqh3v1yHySgIveAGIFojJ1Pk0I4OVsXGn7hbX0Z5upcfvbIdc9D
	C2Gum3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLlx-00000001Gt4-42Ao;
	Tue, 23 Apr 2024 19:25:45 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzLls-00000001Goy-1CmI;
	Tue, 23 Apr 2024 19:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713900340; x=1745436340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iARSuX9KuhJ/Yd1VAlCEEM5wx1EpDHoBr77TViozzoM=;
  b=ln7358j+kMP8u8dWEQlZHdH0yfT18RQmQRSGDa/i6+ofMuatAbjF4zYP
   b2/dLjD0m71DKfPde2RSQMLan7kKVjarmBkkUVLO1Cnbk2KIGyhm2uCEy
   Qeno1/uLmywEhhTRDEOwEXRVoiUOLu7SNmkuwSzbnEnAkMt0ycJLLVeV4
   HxMh7+9thEWApc6WdQcJ8I5UkyaHC5LXW6vB8TXj6ndpkje7tkn/iFvaP
   DwEaQj7aWly4CrwEyoSBy33FcLFaS9ga0Fn7hbFri0soJLEXgh1DhtO13
   XZO5xL6Owx8cmJ94ukmuLUKVFku6QlW/rbEkT8KdUfYi2KwvdRhBjq+YN
   g==;
X-CSE-ConnectionGUID: DpURiXGNTLWuLYKSzl8Bsg==
X-CSE-MsgGUID: U20v9JybRjqf9Wna1z0cKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9613661"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9613661"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:25:36 -0700
X-CSE-ConnectionGUID: w/ztJlpcRnuDr+9rvjbvpw==
X-CSE-MsgGUID: v5WeMhnJTXS6NM71pfP0ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24440742"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 23 Apr 2024 12:25:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D372D489; Tue, 23 Apr 2024 22:25:30 +0300 (EEST)
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
Subject: [PATCH v2 3/3] kfifo: Don't use "proxy" headers
Date: Tue, 23 Apr 2024 22:23:10 +0300
Message-ID: <20240423192529.3249134-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
References: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_122540_370119_C3A1DB48 
X-CRM114-Status: GOOD (  10.04  )
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
 include/linux/kfifo.h       |  9 +++++++--
 lib/kfifo.c                 | 10 +++++-----
 samples/kfifo/dma-example.c |  3 ++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index 0b35a41440ff..6b28d642f332 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -36,10 +36,15 @@
  * to lock the reader.
  */
 
-#include <linux/kernel.h>
+#include <linux/array_size.h>
 #include <linux/spinlock.h>
 #include <linux/stddef.h>
-#include <linux/scatterlist.h>
+#include <linux/types.h>
+
+#include <asm/barrier.h>
+#include <asm/errno.h>
+
+struct scatterlist;
 
 struct __kfifo {
 	unsigned int	in;
diff --git a/lib/kfifo.c b/lib/kfifo.c
index 12f5a347aa13..15acdee4a8f3 100644
--- a/lib/kfifo.c
+++ b/lib/kfifo.c
@@ -5,13 +5,13 @@
  * Copyright (C) 2009/2010 Stefani Seibold <stefani@seibold.net>
  */
 
-#include <linux/kernel.h>
-#include <linux/export.h>
-#include <linux/slab.h>
 #include <linux/err.h>
-#include <linux/log2.h>
-#include <linux/uaccess.h>
+#include <linux/export.h>
 #include <linux/kfifo.h>
+#include <linux/log2.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
 
 /*
  * internal helper to calculate the unused elements in a fifo
diff --git a/samples/kfifo/dma-example.c b/samples/kfifo/dma-example.c
index 0cf27483cb36..74fe915b7ffe 100644
--- a/samples/kfifo/dma-example.c
+++ b/samples/kfifo/dma-example.c
@@ -6,8 +6,9 @@
  */
 
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/kfifo.h>
+#include <linux/module.h>
+#include <linux/scatterlist.h>
 
 /*
  * This module shows how to handle fifo dma operations.
-- 
2.43.0.rc1.1336.g36b5255a03ac


