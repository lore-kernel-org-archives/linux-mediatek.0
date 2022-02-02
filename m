Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC54C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiAj6TXcshYSai0gwhQmnT6O2BMMofBAWynO82qnVRo=; b=36uW81pJmaLc5K
	ZJDRDgDI+UdmrA3ejiyUFjO642HLmFStcGk7SamS1HbdbzUjfXCDhyLfr9wyGChLSrx84R/Ug9NEt
	KaG7GwozP/SZL84Y0FvTOke2OBE6L1D7b6ArqcGcYTjRcBSPkoppgmpbrJEGedjddJPpYx95wR52b
	bwTZKOS3Eo3Z0NrHNao6i5dpoOeQMvhBTgP83jhOZ3NRooL/4w+CqLl1gbPARym06r2H+4zW/mKUY
	IFFlXXvEYD/5n+qgSXo5lZer3hRXHD7BgQY3UreBjRT/juKUxcZzVtN856+FbfHSqi/6uY+IKom17
	A3dgAPKBF4AXXHCYjF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG98-00FTgX-7a; Wed, 02 Feb 2022 13:58:06 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1O-00FP9l-SR
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:08 +0000
Received: by mail-pg1-x529.google.com with SMTP id q132so682466pgq.7
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o96FYGbHJ72XBS1HhlvbpoWVDn8elKqn4OTG7Iw+mEs=;
 b=RhLz21DXPJQfKR+n26oncQXVj4xqQ04C52QcLlmftxu0nWOcTJ6Y5dYYkD9/QSgXhw
 JfOiFZAQSUL3eQTzvcQQBKph1gciE1wZgXFlj/zYQljKWURs7XFvrEXNGtNx/nQ34RV3
 bt0VE1z5lCh5z8dM+b/Jin29QyTIS4H7MUYv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o96FYGbHJ72XBS1HhlvbpoWVDn8elKqn4OTG7Iw+mEs=;
 b=mcng/j8D97jBErok1HwH38lJVMfBB+zjoLyWSFR230LzqiZauDiIF4QpK8M/urwbz7
 FRj/u2S4jNRU18nfmaGjRkG6Jthtuo3cIf9a5VsM660jya62rqK7lnF3Sr9cOVA1vL8H
 8mKXXsDJWdghBoQBsL9dozmYCoT1duRDY9Om4VLsbN900bCEPITXBOc5bJqQqV7gyBGU
 8N0ZvnPJXj/P8QD7ii0Mg04lqzUos0aHAfXsdrhEOtgy3pFLyMaKpF2QJdRHsX3liVzQ
 guPTHz6hfwqMV6i7XPhuVafklgT9RqT+kUqtEGX4cXrnVCbc/aHFmSwBNYuo92rXcPck
 2bmQ==
X-Gm-Message-State: AOAM530pqoAhQx619xG80JeCK/mxVXgtMTb5vxMEp2n1CUFdC69kzaq+
 j9Ta0SZylImKFPU3vEpVo8py/A==
X-Google-Smtp-Source: ABdhPJwGk4mMv+6QTWbFNcM4eaBrE2MyeosyxrmnAMXK3NCjCSxZCRqIb3HJDTR1SsrBYzKnGI0BBw==
X-Received: by 2002:a63:d943:: with SMTP id e3mr24468905pgj.427.1643809806414; 
 Wed, 02 Feb 2022 05:50:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:06 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/31] clk: mediatek: pll: Clean up included headers
Date: Wed,  2 Feb 2022 21:48:17 +0800
Message-Id: <20220202134834.690675-15-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055006_968788_B842ADE3 
X-CRM114-Status: GOOD (  11.85  )
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

Also, copy the MHZ macro from clk-mtk.h, and drop clk-mtk.h from the
included headers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-pll.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index b54e33b75d4e..8439d37e354d 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -4,17 +4,19 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/slab.h>
-#include <linux/clkdev.h>
-#include <linux/delay.h>
 
-#include "clk-mtk.h"
 #include "clk-pll.h"
 
+#define MHZ			(1000 * 1000)
+
 #define REG_CON0		0
 #define REG_CON1		4
 
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
