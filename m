Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FD1C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9roHfioN0pnB3zr6C5WkpMaGPUxVyfNNjB7Db5UuQY=; b=I5cJJyWAhW55nj
	nAIgcWJt5YDwEDUj8SpDALXTKwIEJRC55EQ6BO5Sfbc1cmWrwcV9F5Ud00khqB2OUPNF81bRMX33Z
	RnCwTeTvVNaiuqdPosL5PLVjoaCyYiIRv/Wjw4bC8tF/jbXlWv++rDGBXKL8C/YpoEeBGYY9xoAFR
	sRdlZMjsA1Kg5hnVU3FRVQig4OBKfG8OvwtLiUwzEDCQFtzcjrocN7/c37YMgC+cZT62Ut9leM5LI
	v2v/VaJjUe6JcIz3FTeqoeouFKWFjl4gxiolHdnNt2DW9Xvq63C4+gAsrexcFeeEdbSWqSRVVfiSh
	Gc58csfOnn4ekDW1XmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCXb-00Gro9-0L; Sat, 22 Jan 2022 09:18:35 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCWu-00GrNp-9J
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:17:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id t18so10869858plg.9
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYfVcfmzbfl8NtBT3+EuAhwGblYuELjka3vdiDEtzHI=;
 b=NgsuzFLRMEqkgAhDepLZDiqZooShEmng/mWpvDvDmJ9MqFWRIrG0WYU51aW3acaBSU
 lY5MLa8dYgYmA1aGpn8oY7oB89rll/TlYz5usSbFaARxTgJKDJMq8aVSu7GSr4ax1EKF
 ZlhEMDXNVktStkGp4jg7P8wYoke54GHUoWEwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYfVcfmzbfl8NtBT3+EuAhwGblYuELjka3vdiDEtzHI=;
 b=rVUNnbcfitWEa5ewCiyV9nUH7r2BqBRh/LsvpCZtY13vEzTWCDf3FqNMkzqw/3NhZ6
 D+7M+wlYsEOqTkFNW7ZZM8X53s6HNaHFD/6oHSXyU3AvRafVbkQqvs78rg3S/NjDRvZr
 IB8eXc811tWlDGGb1+OjIl/Uq0Aqjaak2WbeX4rPNCIwScI0G5ONYuEmDNzkF/LURb7o
 ETHB+OLP09ZTHhvmfDa6D1akcE2oqTdxv+CYyYw40jkftTRu/ZTpLKyiEAN4fzFK6C1k
 fxwQrCbNwEHh/oHY6aLBTccHwx4BnKTaBeCP4opZ39Q3WXcVEIp1vYOy7GNoS4qrgpYt
 u+/Q==
X-Gm-Message-State: AOAM5307+wF5p5aiW6a178ZNsTMJx573inAi2oe1Rke6A5RIaC3/wqJx
 UahtuqnZLZ9xkFggua914sr1zw==
X-Google-Smtp-Source: ABdhPJyepx5BgVfs2E/KZzdND+69YFZBMR/OAiGeYZ/xGVJtctNBJieEh7MIn+Z/+oV2aVMDwGI7gw==
X-Received: by 2002:a17:902:c613:b0:14a:7280:cfd7 with SMTP id
 r19-20020a170902c61300b0014a7280cfd7mr6903732plr.128.1642843071353; 
 Sat, 22 Jan 2022 01:17:51 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:17:50 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 03/31] clk: mediatek: gate: Internalize clk implementation
Date: Sat, 22 Jan 2022 17:17:03 +0800
Message-Id: <20220122091731.283592-4-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011752_346620_BDFAAD49 
X-CRM114-Status: GOOD (  13.91  )
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

struct mtk_clk_gate and mtk_clk_register_gate() are not used outside of
the gate clk library. Only the API that handles a list of clks is used
by the individual platform clk drivers.

Internalize the parts that aren't used outside of the implementation.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-gate.c | 35 ++++++++++++++++++++++-----------
 drivers/clk/mediatek/clk-gate.h | 31 ++---------------------------
 2 files changed, 25 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 54921768bfba..e51cfd8c653c 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -11,11 +11,28 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 
 #include "clk-gate.h"
 
+struct mtk_clk_gate {
+	struct clk_hw	hw;
+	struct regmap	*regmap;
+	int		set_ofs;
+	int		clr_ofs;
+	int		sta_ofs;
+	u8		bit;
+};
+
+static inline struct mtk_clk_gate *to_mtk_clk_gate(struct clk_hw *hw)
+{
+	return container_of(hw, struct mtk_clk_gate, hw);
+}
+
 static u32 mtk_get_clockgating(struct clk_hw *hw)
 {
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
@@ -140,17 +157,12 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
 };
 EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
 
-struct clk *mtk_clk_register_gate(
-		const char *name,
-		const char *parent_name,
-		struct regmap *regmap,
-		int set_ofs,
-		int clr_ofs,
-		int sta_ofs,
-		u8 bit,
-		const struct clk_ops *ops,
-		unsigned long flags,
-		struct device *dev)
+static struct clk *mtk_clk_register_gate(const char *name,
+					 const char *parent_name,
+					 struct regmap *regmap, int set_ofs,
+					 int clr_ofs, int sta_ofs, u8 bit,
+					 const struct clk_ops *ops,
+					 unsigned long flags, struct device *dev)
 {
 	struct mtk_clk_gate *cg;
 	struct clk *clk;
@@ -180,7 +192,6 @@ struct clk *mtk_clk_register_gate(
 
 	return clk;
 }
-EXPORT_SYMBOL_GPL(mtk_clk_register_gate);
 
 int mtk_clk_register_gates_with_dev(struct device_node *node,
 				    const struct mtk_gate *clks, int num,
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 432b571d23b3..3d75521ba20c 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -7,42 +7,15 @@
 #ifndef __DRV_CLK_GATE_H
 #define __DRV_CLK_GATE_H
 
-#include <linux/regmap.h>
 #include <linux/clk-provider.h>
-
-struct clk;
-
-struct mtk_clk_gate {
-	struct clk_hw	hw;
-	struct regmap	*regmap;
-	int		set_ofs;
-	int		clr_ofs;
-	int		sta_ofs;
-	u8		bit;
-};
-
-static inline struct mtk_clk_gate *to_mtk_clk_gate(struct clk_hw *hw)
-{
-	return container_of(hw, struct mtk_clk_gate, hw);
-}
+#include <linux/device.h>
+#include <linux/of.h>
 
 extern const struct clk_ops mtk_clk_gate_ops_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
 extern const struct clk_ops mtk_clk_gate_ops_no_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_no_setclr_inv;
 
-struct clk *mtk_clk_register_gate(
-		const char *name,
-		const char *parent_name,
-		struct regmap *regmap,
-		int set_ofs,
-		int clr_ofs,
-		int sta_ofs,
-		u8 bit,
-		const struct clk_ops *ops,
-		unsigned long flags,
-		struct device *dev);
-
 struct mtk_gate_regs {
 	u32 sta_ofs;
 	u32 clr_ofs;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
