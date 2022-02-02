Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FF6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HblP+2fbANTGHyaGRBCYdczO1AXnvORutMHiKzMkj7k=; b=WozRYKXcRteDlh
	IiefTMOh/H2D3QPDpvqlox9vCThFqN3uOiwEBI4CRZvgcEhvSohRReIiGDJjHtUSaYsXdOmeUMuD8
	/ziIGyWxmZZBqCrB1wL4EQ+n6SLmPK8c5GABRYNE1hC2j1uu0jm4Os1Cp216yiNi3AKpa0ePIPk8U
	nm2dfDY6gr+03J1Z3o43zQi+YCbMvPS0fzDaTHnFrTy3fRNgSGkt8Mu9plMXSxJuxVBLXlVhjQDno
	Cyq3Qfv3/65oMeWBcBu09wn234xU/H+p2AbzF96SbqzT7PnnytGXZfUICJZw3zXPubU/rdkOuI6G/
	+8C5dtk8l5btnvy60+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG50-00FRUB-JM; Wed, 02 Feb 2022 13:53:50 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1D-00FP0L-BI
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:49:56 +0000
Received: by mail-pg1-x531.google.com with SMTP id h23so18329423pgk.11
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FrZ/0MdvYKx4iaQqido6RE0SQZOpyPkZyyEsJWJ6uvQ=;
 b=kr16j1M0ul8lOBTGXLrQNyQAn0031+sSYig0cCR7kjq/VDai6jwZxUPCannWakW7ov
 t6eL4uUJmLgO2yfgvEwb8IVL01LHyy6huvnflt/lirwoirOJb6TT6YYCKkTo8SDSFA3G
 B8xh+k350+mauwcTQQcRRUHrq0wnUKHmsd0Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FrZ/0MdvYKx4iaQqido6RE0SQZOpyPkZyyEsJWJ6uvQ=;
 b=nduk9FxIAiOMYraETEfY4FQsCmmp8BY2cCoWPtOp3zSQ4e9552AQkV+OcCdBSkVsx0
 Ay+HNhXWyO4hAwAko3M6KWjBSBEZkcqoKZRbBBUMRab9oSYsmc/nsRMeRvJtL0x/NcMQ
 UfPGdcAWI2mN+XiOCzSfdrJezSbNJhpL6Q5+mxW7Tdu7MU724kwE1sCmiKv9M6MAPKcS
 ihUoGLFybOKJEbz4mdP0YNSXAUBnSGANqMRZDGp3RuS45bFAp95IH1i+nHQYX8QlajLr
 RV5UhYGIvClCezdODkDGL1FfHRabx8jnremeFKmGqC3H9ez7qzL1wYCG5/FG2gE2dlYb
 +tLQ==
X-Gm-Message-State: AOAM531ewGs87FO9rewXHcaHPSGGqjQ4F4rTpN0/n7MxBMzhnZFN1EYl
 nhHt8EIL6awRM5KYE0kipsrsNA==
X-Google-Smtp-Source: ABdhPJz6RliNQTrYa3nwSg3QqKgNI7uqG/4+XpmghPiK9Jj3ex4tFYMUF5mHVSMN/zT1r/+Ay6SMtg==
X-Received: by 2002:a05:6a00:238b:: with SMTP id
 f11mr1606430pfc.73.1643809794541; 
 Wed, 02 Feb 2022 05:49:54 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:54 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/31] clk: mediatek: cpumux: Clean up included headers
Date: Wed,  2 Feb 2022 21:48:11 +0800
Message-Id: <20220202134834.690675-9-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054955_396022_D9C8D579 
X-CRM114-Status: GOOD (  11.35  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
