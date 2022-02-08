Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0E6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHF3YukmqR155f72Bje07flOD1RuIRkrd/P8C5y35xI=; b=G9S83IXXD2dPti
	Oq0WQ61RZCTM3AiNwHdfHmBuqUCdcJSJunGCM/G7ywYX0A27ouQR9BMhcyC8cEFWLkurpknGlHQKD
	+a3T+Xu73+KbSLjvcwdrtSI3e0JdZQVZEYau8qAmiw/IRTFGAjwKCuYcFauoPod3xdYeUZ2uyguDK
	pZVZkfRznEDC2HSrWNyBvI5qq1SHzZXj5ZClQWWAPNjNVD7BgFv1l01Wop/zvWJkWx23SFG/OXwjx
	YjY0UreCgnv1tbeacZLD0ROdqvT5c2Y6iPkjGprduNuqYf77jmZFzK7z586kH/yhND9Kp779AhTG5
	XLjb7txgYljVLOnNV2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPzx-00DtI7-3V; Tue, 08 Feb 2022 12:53:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoK-00Dnag-Rw
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id y18so4114653plb.11
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VlKtM6FjYA2dZO07upzgd9Pj04Wu97J4dVvK+jUNEck=;
 b=OrSsQvFFXKSurEYBIMXb9+NOJkRn42Oayov78oivR7/II3RzfciYs9zq3TiYOFrMzf
 3SFpboZilv9rJrVtd6Mqd+OI2aCWZyLByJAU36g2KxT8SNQmX4c40+48wnG5jbzXE7Yp
 XwQ3RYW83qUfjx5/1bULaTZ4NuYSzeASJdaqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VlKtM6FjYA2dZO07upzgd9Pj04Wu97J4dVvK+jUNEck=;
 b=ovssSbbyZNqRG/eEWgnfQmVBF2AhwvjOU4rQppbpLQvthgp5fuSn7wJZE+A49WMgq0
 9LpgiDXuH0dMJUDTYwSsjwAWxo+s1nUlrSJheiH8Neo6TuCC6lbgjzO/4gNRF/iiEFYC
 Lgytu2l8KrU1Dp8LjH2zTA/Tcp0sFT6pESCpv4LkdqmOGvA61PcnImLUm8Y9Mik30gSt
 oxsUlj7Z5EnrzLk9iJoAyAM4P0hj1s5rvS/tQG1cmu0REhOV8g1qvsUtCZSdqZfIuCHG
 QtQ2GqpQ8tcDmzQ6lmHWV60yPglK3kZpIZ7XjJIhtqYSlPk5M/i++mnqrxFbdg80Pf8q
 2Ang==
X-Gm-Message-State: AOAM5331YSkregSmFnYbpuecfTClPndpIGEjZBWJiWUuUCe3fAnliUFL
 FfSIfEzodbTCVRzlrhpNoVY5wQ==
X-Google-Smtp-Source: ABdhPJyZtnIS5wvMBJfJ1PfBAFwhwCamW3QkOJc8pTKF0a7UI+1Dj2KYovaMuZBY9GlrF4L1rpycuQ==
X-Received: by 2002:a17:902:a603:: with SMTP id
 u3mr4462853plq.113.1644324092333; 
 Tue, 08 Feb 2022 04:41:32 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:32 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/31] clk: mediatek: mtk: Clean up included headers
Date: Tue,  8 Feb 2022 20:40:23 +0800
Message-Id: <20220208124034.414635-21-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044132_996283_4D4E2E26 
X-CRM114-Status: GOOD (  10.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some included headers aren't actually used anywhere, while other headers
with the declaration of functions and structures aren't directly
included.

Get rid of the unused ones, and add the ones that should be included
directly.

On the header side, replace headers that are included purely for data
structure definitions with forward declarations. This decreases the
amount of preprocessing and compilation effort required for each
inclusion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 13 ++++++-------
 drivers/clk/mediatek/clk-mtk.h | 12 ++++++------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index f108786caeda..5618c84e4e08 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -4,17 +4,16 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
-#include <linux/clkdev.h>
-#include <linux/module.h>
 #include <linux/mfd/syscon.h>
-#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 4fa658f5d934..7f902581a115 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -7,19 +7,19 @@
 #ifndef __DRV_CLK_MTK_H
 #define __DRV_CLK_MTK_H
 
-#include <linux/regmap.h>
-#include <linux/bitops.h>
 #include <linux/clk-provider.h>
-#include <linux/platform_device.h>
-
-struct clk;
-struct clk_onecell_data;
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
 
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
 #define MHZ (1000 * 1000)
 
+struct platform_device;
+
 struct mtk_fixed_clk {
 	int id;
 	const char *name;
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
