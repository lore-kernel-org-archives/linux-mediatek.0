Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8078CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZtS/K81IS71XTJ10HDISQLdCZ8N23uLgJCFAXOSdUs=; b=Uo2+QY52NjJdjl
	+ubuE16XZmCZPcFk0iMiRl9Z+hrcaL4En7qt91Sio4tcVzDho5azLzSj2BLNzgjiB/lbx2JwnCLOY
	2PpqnWzNZwELh0UQpO3GNNUvY/x+x4+eHCn53bmuRgrKgxzrgePRfjZQ/xyca1JG/FpJ4aH93olAD
	232uR8vC8m1I5lMgeoIUqP6benPNHZuMjjvGNLb+0WVXrr/jTEeU67xECVsqAFIfIZGdMv1/GzO23
	hRp3LtO++1OUD7OnDkEVxYE+3EhnXtDabQ34gNHCupSLLjKqJ0yUAhC2MCJkphH5YzrloJl7gggCT
	DRjQDMEDPur30bOPsxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCaL-00GtDR-RT; Sat, 22 Jan 2022 09:21:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCX5-00GrT3-53
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id l17so4685074plg.1
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMFXap+xL0bvLvySfgNMrXOP9tSLXVuWtG0WsgxxBN8=;
 b=no9YI2kI8gyzTudRYKHgPiFbPAcXOXr00kj1lm3Q/qLeY4IIWESiil9gsKxq18DvLG
 mGuKrkF7ZZyQQOddq9+HibOon3iYZ7aJFs12iYxPjSIDscNDS/Kt1h0okxcmKDQO8nuU
 e4W6Hh7ISgKoKsXRsZBXhN2rOJofin6Xvf5pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CMFXap+xL0bvLvySfgNMrXOP9tSLXVuWtG0WsgxxBN8=;
 b=RtLPCLNXaHkoW/lvf4liFL1vrQsw7SpH6AnewoZfGorkjQhZkywIHy9oYw4uV1cSBu
 xvPCzayuQX8+QSSY9aXNHtsPJytU4dqghbYByyR/xj7JRo9eG6ni7IjV3G0YNGu04q/q
 ZO0/SgvXza9z/OMGwVP4gs6Z1FG+qq0rirrOLSALJB+5sVlDKBdFXEU/z5necv6PK1Ii
 7Zs8Nd3gEESPsxTCh9ZY1wUNYWkR+DTYunLcIft4LB3GY4C2diGL4IFHkCbDGN2wV7+L
 sRq9Ei8XKCzhS0JywUVhYPxmT4LYtP/HHEOkt9u9mEu99PCdLmvL4OfkrM8V4BBx+ROu
 En/g==
X-Gm-Message-State: AOAM530WOAYVDWlSUac0mnIFvAIgh39ggWlujpu+xDQijqSa1Ts5DoJd
 YsgHbzLKIQePUBjn9EMalKfrdw==
X-Google-Smtp-Source: ABdhPJxN30OUYMrT52RzBfbw6qmJzTZhPQfO212jPVtLlFlXIYBizp9DWGFMnLERH3nnKeEUo3eQbw==
X-Received: by 2002:a17:902:dacf:b0:14b:2225:2f06 with SMTP id
 q15-20020a170902dacf00b0014b22252f06mr4851994plx.123.1642843082396; 
 Sat, 22 Jan 2022 01:18:02 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:01 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 08/31] clk: mediatek: cpumux: Clean up included headers
Date: Sat, 22 Jan 2022 17:17:08 +0800
Message-Id: <20220122091731.283592-9-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011803_224556_61266BDC 
X-CRM114-Status: UNSURE (   9.53  )
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

Some headers with the declaration of functions and structures aren't
directly included. Explicitly include them so that future changes to
other headers would not result in an unexpected build break.

On the header side, add forward declarations for any data structures
whose pointers are used in function signatures. No headers are
required.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-cpumux.c | 3 +++
 drivers/clk/mediatek/clk-cpumux.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 344c6399b22f..658aee789f44 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -5,8 +5,11 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/err.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index a538f2bbef0d..b07e89f7c283 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -7,6 +7,10 @@
 #ifndef __DRV_CLK_CPUMUX_H
 #define __DRV_CLK_CPUMUX_H
 
+struct clk_onecell_data;
+struct device_node;
+struct mtk_composite;
+
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
