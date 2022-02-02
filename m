Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F03C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6+RhMSCyy0XwxZQ+i52dJ8ky7v8oZD2dJML4eIfnSU=; b=jKk6fCnMNpeUgh
	UtVnPqpr211FV7sD8bidvZ+94F143qx1q46FZ7zDEfilVnLfGRm6JHGA3swaykTI5e7qXZdjLy2Hb
	RUYcFRh8xHCi4PnVkERiQr2wKPH5yCq8bXKwvIaO408CKTmBlaT4TA0PVRHOsqyKuhh/lvCfPsnen
	jtiDxR+1PBe0XNAz8+5sHwdvh+/AvE8VDn6/hf6Ou8esfoX8GQ/kNG/THClr9Rz4QS4XVjfN+KnkC
	wP8cJC4oltmEJF/i7zUyQcR6F44hSvYqdI+hzDeDDwEW/t7myWGRZDSgQ+WD+yGxsKvOiRAmjh4fi
	ZBehRq6AJKedDjYhdsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG6Y-00FSQZ-T7; Wed, 02 Feb 2022 13:55:26 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1J-00FP5C-6d
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:02 +0000
Received: by mail-pg1-x535.google.com with SMTP id 132so7343139pga.5
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=atVL6xJF/54HJ2aWxtM+9tGv7OBG0H7yvFIiBDi452k=;
 b=KokZ29ZgNuAl3t+XgjfUEk3Bpr7iTEs+HxAkSQTAjFt8MtVd92B7EM//xJfeoxHFcG
 CURs15ExfQ68RVYPKdkpcVHsJ21gFZHbfjRcl6tSu5KwHMu7ghFUrJxeLlmkYGyzqhJY
 eJSDBxTcm6jX8Ys5/RBbe5fsYH5hpW/v1bP7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=atVL6xJF/54HJ2aWxtM+9tGv7OBG0H7yvFIiBDi452k=;
 b=FB9UGMKcHxnYpfoDh3C42YUxala9pk1pQioZJCdzBxoZ85tXe+/jDUuZ13TC+ybxat
 LeKFvgmJ+ATm3W46CR5aqyNS939lOS5BkoXMTi7Llxwjg5NKwadb9xP814F+9oS1vel7
 3GghuizTTMIuuKrvaQ8pivAy+GLUFcYxtZ/Hnp34fQLztsRUtSXvrvE4SspvGUKNzeZR
 1eSon3QKxOPqvcvznverccGj1IEyuDuv2FiHwv1BFIr0hRrYMP20IDF0Qz3CwfHfCv9d
 dHIpS8LNG8frrqYHruf10m5OOrTgQ3CdxSINOEmHHoyyGo9swUEIr7Ad/HMAEqW34Dmy
 fTzQ==
X-Gm-Message-State: AOAM53233uEf9cdPyOFxbCAKyS4RMxNaMcO3QutTEHARkPx6noVuB65j
 fwgLTytdvxbZH1D1JIahFazpCA==
X-Google-Smtp-Source: ABdhPJwJNNtXsmuuzMgKjlUyJSyJMix5Mr8FLafmoEYLOBjBKCisUB5Vl/24ORK+SOxnDNq5ZWil8A==
X-Received: by 2002:a05:6a00:15d5:: with SMTP id
 o21mr3872002pfu.9.1643809800457; 
 Wed, 02 Feb 2022 05:50:00 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/31] clk: mediatek: mux: Clean up included headers
Date: Wed,  2 Feb 2022 21:48:14 +0800
Message-Id: <20220202134834.690675-12-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055001_277819_4B238F7D 
X-CRM114-Status: GOOD (  11.25  )
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
---
 drivers/clk/mediatek/clk-mux.c | 11 +++++++----
 drivers/clk/mediatek/clk-mux.h |  8 +++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 2d4d8dc0120a..01af6a52711a 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -4,13 +4,16 @@
  * Author: Owen Chen <owen.chen@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/compiler_types.h>
+#include <linux/container_of.h>
+#include <linux/err.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
 
-#include "clk-mtk.h"
 #include "clk-mux.h"
 
 struct mtk_clk_mux {
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 38a2b6014b08..903a3c937959 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -7,7 +7,13 @@
 #ifndef __DRV_CLK_MTK_MUX_H
 #define __DRV_CLK_MTK_MUX_H
 
-#include <linux/clk-provider.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+struct clk;
+struct clk_onecell_data;
+struct clk_ops;
+struct device_node;
 
 struct mtk_mux {
 	int id;
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
