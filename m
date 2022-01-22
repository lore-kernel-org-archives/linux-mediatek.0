Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E697C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfKK6zVxAatZEWMVxnnyTPkum57Y7mXDD1fyMy+q/MY=; b=sRzAVCeXcMnQIY
	UuRXwaml2W5tyuS4mTdEGKsHsb6MB/ILFm2ORWIE5ljg/T6yy5UFcRY8+F50LquwSQ0miNXBAXIOk
	AaUK1TLX6STTkB0lgd2H5G+5ZuRfu4TzPyQ9wE8SaV3hLn5SytZDxv5c3fup+fCvjVPGX1hJqcOgk
	PallnEaDiMkB30kw16Z4yIZQaJexSEoJ+j3dMfOaPKz9k8F1U2kWowHFrryX5d0q//MOlV00uRWE0
	SayKf1EcriaOKjVqx5x+v+sVvK9tz27+GE+nuDCyenze/4jmZ4LvFdt5TyHL1rm3aAmBQuEPZVTwT
	NDMAenj8OiANkenX1sOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCkc-00GxXj-4a; Sat, 22 Jan 2022 09:32:02 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXV-00GrkU-Is
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:31 +0000
Received: by mail-pg1-x535.google.com with SMTP id e9so10275554pgb.3
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y7ikYR2DO0KTQJWDZKewH0oM7Rmj3LYjnAGwR2+oJK8=;
 b=MK5yUJ0QuCGEKf3Fc/Pxxv6kVp2sCxxGWLo2+2smGGBR2K/o7OHOjjJgu2n+G57HdW
 eAjYKu6r69okMTLnUNRSORWTYe+o4pIcmJH6zpYeOFj361NZkjOI+OknPUS5cKY/PrsO
 D/j75AnvdU5gV234xvjW9KODPrnuFljn+y8n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y7ikYR2DO0KTQJWDZKewH0oM7Rmj3LYjnAGwR2+oJK8=;
 b=gm8cJEIr/mdsMzcj1vvl4IXxtuVTN8Pl3GRgrQcl4cB75wg7jeBvTGilG7HqqaI/v/
 Xp5DGEYZPgV0HrWYeZRlK2de6H7diK+YpCIPbtdXQV3mDz3LWtRzitbjI659/+W0vioK
 W2ulKebJ6hszRS6oJZNDaNWeU0qFiz97qtEp8+LGV2UOm0GGc6tdRmHX4D37IIFBkkec
 BS7HCC49CcZVY7FUE8ke301MzJcQIR8juooFwLpFEHPr/7t2lgxqJv7IINdNItwDb7XU
 NALj6rFnmWkv0YRc1g6NYJ5SiuZU0soi5AxD2EWkfHDK9pfsW0JmRRELMH7nRtKR4nxx
 aLGg==
X-Gm-Message-State: AOAM5311aqFNTokTjeZSm2VMkFnSCf0+xlWYqCZ+EAD2KH0ZoYIuaMeO
 fmOmuB4ozRVZY/zHED7pKlKK0w==
X-Google-Smtp-Source: ABdhPJzqwpvGnrOLvq1Wc8tRhNv6bldrv9fnylHIYcV+GIPyjQgEr0P19blEPg/NwRaCCyKvYFaDxw==
X-Received: by 2002:a63:b204:: with SMTP id x4mr5614276pge.224.1642843109114; 
 Sat, 22 Jan 2022 01:18:29 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:28 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 20/31] clk: mediatek: mtk: Clean up included headers
Date: Sat, 22 Jan 2022 17:17:20 +0800
Message-Id: <20220122091731.283592-21-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011829_683976_357D125D 
X-CRM114-Status: UNSURE (   9.92  )
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
---
 drivers/clk/mediatek/clk-mtk.c | 13 ++++++-------
 drivers/clk/mediatek/clk-mtk.h | 12 ++++++------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index cd76e1d80242..d2c50186cceb 100644
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
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
