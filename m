Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987C6C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgIPBL49s6pLnX2rr2CVRXJcjA04DzSAxMjDyxEtQ1A=; b=F+gkcRTRfADVSz
	GrraON+j08yBINSc6KGP6VH86ReEyVkfa83ltiCSip/T0lUMT9LeDV8UwsPajgI9dW4IHLCdQgUMZ
	x2EKJPC97aP/8GHb0cfVcIiAWIlwTAh22ncid+U7J+zmXShIJNcajWOddR+0K+gR++euxypUcA7ih
	phxlYLbprKeziy04/SJw9lymoHRvUgrhl/afEs5s58TclfkpHmgsPIRgojxuUvjPslibYb/3Lpn7c
	FbPTzIUNGgAzzgT8BuwZSHAQ8aJQ0auej3DysIfV+fzGxZGKiUsfZ/jopHSRC8XHxJR0NfpjC7b+w
	BfC7Dw0ZUrdTGd5RQqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCYN-00GsFd-JZ; Sat, 22 Jan 2022 09:19:23 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCX1-00GrPW-2L
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso8177114pjv.1
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kbKt7ttJEIbn2PG8GXADqtWmeHu+9XOdvvWCDvq3ah8=;
 b=HNsD0ReKRNDG4ZtQO0GD+qXHMUslr6wilW+RBb24z8L0AosEtrU+AKZV6wZk1k2g5d
 UDAFJ5iY2XaAbthYJ2P8V+dhnsYtH7/gnu5QJ65OVnxpI1rg7GoU2RG4CPdtmgyNecYK
 NgI9nutHRuVY/OYbPkUE6pQDesSxO+GaEEcRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbKt7ttJEIbn2PG8GXADqtWmeHu+9XOdvvWCDvq3ah8=;
 b=T+iLOJyApXMqvrq1oA43U5csNB63H6JE/+DVko9jEWVNfDYb4R+ZPLjBUKQSMXhjsD
 k+ltcuxjPBs4KYPMH3ychBaq2l2FvZRZclX8grIHzCR6t6Lep7oN+EXrDAB1Ekia0ySM
 4H+S5BH7IXyy15qncdR1/yn8Jv6sEHM5KWWV7fHM2jzPpUau8wXLH85IpOdLHU7WKT1x
 VfCoisEoN1zvVCRuqmr9r+DBVI50TVUbdiyPHysuY/6k2LCS3jsEzmKHilFPNVgnKDUx
 td3q3B0tluOZkCqIvIJ49RmKh6vEEEvBDsKDQPJG+HNjCsFASzmKWoxd5XlDhfRluIay
 WWMA==
X-Gm-Message-State: AOAM530TAlw9RJG6wF78BAIyZRr74gZhwV1oXg2o3Pw7i78qKkjIj4uy
 9ZqES/z0w/f6oVMvlMecAy5ddQ==
X-Google-Smtp-Source: ABdhPJz1mN6Vyg0MLeNqvqpKaPRCRA2I5Ia0lsjKPddm7l0OSH/TgsnehVCnbgfVwGDtbynaaYk9iQ==
X-Received: by 2002:a17:903:110c:b0:149:9004:4e7c with SMTP id
 n12-20020a170903110c00b0014990044e7cmr6902111plh.167.1642843075780; 
 Sat, 22 Jan 2022 01:17:55 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:17:55 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 05/31] clk: mediatek: gate: Clean up included headers
Date: Sat, 22 Jan 2022 17:17:05 +0800
Message-Id: <20220122091731.283592-6-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011759_228450_8D62E6BB 
X-CRM114-Status: UNSURE (   9.85  )
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
 drivers/clk/mediatek/clk-gate.c | 11 +++--------
 drivers/clk/mediatek/clk-gate.h | 10 +++++++---
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index ed1ad5535d41..e8881ae1489a 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -4,18 +4,13 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
-
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
-#include <linux/container_of.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/printk.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 
 #include "clk-gate.h"
 
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 344adffb6578..6b5738826a22 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -7,9 +7,13 @@
 #ifndef __DRV_CLK_GATE_H
 #define __DRV_CLK_GATE_H
 
-#include <linux/clk-provider.h>
-#include <linux/device.h>
-#include <linux/of.h>
+#include <linux/types.h>
+
+struct clk;
+struct clk_onecell_data;
+struct clk_ops;
+struct device;
+struct device_node;
 
 extern const struct clk_ops mtk_clk_gate_ops_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
