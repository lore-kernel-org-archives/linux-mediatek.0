Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447FFC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDSd7lQHfMh4N6pdU3G4lOG+LYWwWx0HbZfSlgSns7Q=; b=xbjEjt0+5Tv7Z2
	YOoL48IdP8nR1NgFVKI2vzI00oJHw1ecRPIYARzE5RWcinvkvNgCIMo6pnAOj63H5+ip+1CpYBsY6
	R2t+B57IscsYoBg+nj6haA18d7gJtIzD17rnBmhhlVDcL5awPkGkIJu7BSv3DFuKSXOYuctl7PUzs
	iQEcJ15KRHgDYbnOvd7c1+yB7e+UiaL4QWfbHvxwUR4cznC1ZCcI+/Fwx8YvKFeN0WnnSC5O6iiW/
	bIlANWHmzYNAe7cogcJpsXAAbcoCbApY7eHXa5qTVun25WHyHkPq0B3aLvjdjgLYPsgCcnFiZVB1c
	e3/eaS1haTR4XCOWhtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCbU-00Gtnj-AP; Sat, 22 Jan 2022 09:22:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXB-00GrWi-KZ
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id c9so10869777plg.11
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vNUxjw49tFByvcP8t/7//e7iEPYHFps9QVk8zZRKtaU=;
 b=FphTI/EUT+pYQ6+s8N+x8etvO1gp8ydoS32Ye8uTFtcA0dTunlpW4uIwQ8xsAMAxcJ
 59qGp9DBrlbRSSwNDb82LSehk5xTkcD/mHbvAFeT676O/lkQPLP6mUPFmHnuvbvCzsH0
 CmhrQYDiTI3PF6wwTPqVw2KJy6h1l7YA5ZCvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vNUxjw49tFByvcP8t/7//e7iEPYHFps9QVk8zZRKtaU=;
 b=P8Gdzdto/AqFtZcELxjcGv5Lk+xfAyf88OiDMY4L6MBu+rMrMlTY8BzEmdiA4mkHj6
 xU1MCY0zC1zt+QdAQji5KBzHlO8rcFW+pc15loZhIoz62y3G4Wdl5/lpdn2CVmY/ZCPk
 LOmlLb9rQwFRTSlXFtBbaLVh/Z/1OoVCnaVNXEVMD9IoYJk1LzVDGvNQ0pOZaqRW8tCQ
 PQ2KaE4EOhMrYF+sLpNmzTKHQF3JQ70VhpjSElLiNsw0hlYH/IcAa2BlH3/Ezmc3oT+6
 N8fz1tOFzXB1JNw5esoqH57GUCR+wFHgOj1exIaOPfIa7OK5GDxJr0vna4iX/O6SfsfA
 rTMA==
X-Gm-Message-State: AOAM5323flCaFMGQTwe0/io20lcfT8p+G6J/HfGIUgCLY47pdO83EFCT
 ZDGcu9MNy3Tc/iBePZQXAYvlbw==
X-Google-Smtp-Source: ABdhPJzt50XykWx+0tWjlGukGzZMOR/XsM+FWIFaNqeZRK3fs6wk/ktZqv15RMlzys50RaboRzuhyQ==
X-Received: by 2002:a17:90a:5e05:: with SMTP id
 w5mr4443843pjf.57.1642843089091; 
 Sat, 22 Jan 2022 01:18:09 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:08 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 11/31] clk: mediatek: mux: Clean up included headers
Date: Sat, 22 Jan 2022 17:17:11 +0800
Message-Id: <20220122091731.283592-12-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011809_737735_5A838DC2 
X-CRM114-Status: GOOD (  10.10  )
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
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
