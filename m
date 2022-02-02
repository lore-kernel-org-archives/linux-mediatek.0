Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226E8C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgB+IN3jqjE5ODfFcBV3Eadov/XL/g7YkFfyyl/lRm4=; b=0pB7Fb8KdSipG/
	CQci0lHeTsQUi2gyiBx4Ws8BgcfBpA+4bTMre1eQCg8CM7nfnV4QQZNKqCOAalVD+Fx1oxs4B9aI7
	fdoqxjvctB2xuMqEDhlDrvOEgM4SZF7VFabh0z3BrJW0zQGguYnxiHmgL+/In4lWSsIrdJ5j/pqOG
	QBZAFzgz4AJBMSY7oIqUNpns3KhJC2NrdVn4WIp5rH5KKslcOzKdtmEM0YJfZ6Lj68sVlAMcHAbnf
	XM5nEwfP3OHLuWSrrqHXDcdUfEOf+auMQIxw1IeexEHqdTRhPVVQ25F8ubxuZjs+dqrCAN6pdzYMy
	8aRkZKnae7J5Ycta/Wcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG2B-00FPjs-VR; Wed, 02 Feb 2022 13:50:55 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG13-00FOuQ-BK
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:49:47 +0000
Received: by mail-pg1-x532.google.com with SMTP id h23so18328980pgk.11
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MyQRwL6DQLrE4xYNw8mcC0XQoGB02nn/7BR8gOXw12k=;
 b=NK4YiiG50hLCWW7qrayFHDYOcnbrImJU+goMnLjQsBS0f/CxfUGlpHC4pVOWiKG3fN
 rSRcfrqrLj7IqMGTuyIgDwVddgHV70pVyPfC5bvgF3zu7I+0lI8jMhUZtU8YY1kKicvG
 HTr7ZcyBbY3OePwWetp1EXwJPg+7X3uzvMl30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MyQRwL6DQLrE4xYNw8mcC0XQoGB02nn/7BR8gOXw12k=;
 b=2ThXu0YaMkAwersTDH7kWjGJhCJ2AKtCnlCZJoACDDI9vNS7/Byz/6oGC2a06ouurG
 b8//5M2gt/n8HNahxatOoli/4h+Fz7sXxp8d4Nmu2qQxvA6DXrn4fyBfGGQl7qJgMmUu
 RKz4EnWHqo2h0bdGnDlIXf0k1pIz9V5RD9x+YQA2Pmt5oP2c1meQ/9nRc/V97ahXya4k
 fQdquzCNaiIJdtoqnnhJ2wZ0g/+Ad2JDJcNpCRC4yFLsYKUHB1glJACUuQp64DGjxV2h
 IYuuFETHeauyc4F2Ys5jbA+Fh2XXlmpLK0sGuVeb5G13gyadRFsv4QsgekSVJNnz+3Qy
 SYRA==
X-Gm-Message-State: AOAM533St1CFg+835+10UUVXLL4h4XuFF4CUb6qb8itOr04cJ0bQQJGP
 2LZieFBEYpQr8qrG6Xe8epjhRw==
X-Google-Smtp-Source: ABdhPJxChN04B73w38gJYqKkMrX28K/rq+/lHQmKeoCJv2N1BvoTeTJonWoE6d0/86Dq5UJT8ZgveQ==
X-Received: by 2002:aa7:9498:: with SMTP id z24mr29581913pfk.80.1643809784501; 
 Wed, 02 Feb 2022 05:49:44 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/31] clk: mediatek: gate: Internalize clk implementation
Date: Wed,  2 Feb 2022 21:48:06 +0800
Message-Id: <20220202134834.690675-4-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054945_425189_BD7DD91E 
X-CRM114-Status: GOOD (  15.54  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
