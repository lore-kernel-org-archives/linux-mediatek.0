Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C22C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RWMWXKVDKQqKqX60EkNKKMQgEKFIcALmdLdDjYajCY=; b=y+XLU0hDEd86Gt
	BpcquAwXAR3CZVyVEgASlLNzYBLZ1aOf5QDsAMvgEow8gUviUhJ/Aizlje5qDL6vh20xP7v8DcTZc
	RBxk7hTqb3uTHQ+YFpzUqUhGq5O/OpaLG+vrMPvytBpBLMXKXBQ+aoaF20XxttWyyrASO3ltLrh/j
	HSiN5T6uWz8sN4S9OVhUspJ49hYu8LmVJQ0ZIklW3yqTiaKaBoFozh+0adDQI7QxMUeiCwweYfIoJ
	Sac9MvMBqzMPIKK4JYQHf+tdEXyPdevShyELFMJJpkbe5Fgfop940t87Jmq6zAjFVp1anlQ0m5BSK
	x5pK/gdLRTbYNySNnPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns28g-00CUgj-46; Fri, 20 May 2022 12:53:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns26c-00CTeC-AQ; Fri, 20 May 2022 12:51:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5A8E61F462C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653051104;
 bh=Fo+/ZjhNQoJvd6sqh6rdL7fraQLbd7Rg63FwzQi2DIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YB7ITXrEVoRW5GVcgydo4v1h+1GmiSWeKWfP1BVqjc5eIGbWZodCSo2wIOHHIPyWc
 lv4enyKopzi41y3XDRKn9hqUB31qEGNyYXWaVq0CEfx36dtUhTyJPUJJ/hULINQNJP
 H3xx2lePFETeyOXjFEkCp1YjTuB6ySC3CSzBds7SQLufnzAh2biDibBI3ohn1u+2m+
 Nyb2xFdin1VUV+bkiFZJ53MLKSJnet2aVrsfrikEhxLxrxaJh3Wjn9yD3cMt31tAZD
 RRrsv1SeUP5PuNpnDh5kMu6IE+F0bbhKUaYCWa3+P369ZlyR6/kjW+1bA450O0e/OC
 pkLXGJaeluFrQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] Input: mtk-pmic-keys - Add support for MT6331 PMIC keys
Date: Fri, 20 May 2022 14:51:32 +0200
Message-Id: <20220520125132.229191-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_055146_611967_FB77EF10 
X-CRM114-Status: GOOD (  10.56  )
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

Add support for PMIC Keys of the MT6331 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index acd5aefac5f9..4a03fdfe8282 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6331/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
@@ -22,6 +23,10 @@
 #define MTK_PMIC_MT6397_PWRKEY_RST_EN	BIT(6)
 #define MTK_PMIC_MT6397_RST_DU_MASK	GENMASK(9, 8)
 
+#define MTK_PMIC_MT6331_HOMEKEY_RST_EN	BIT(8)
+#define MTK_PMIC_MT6331_PWRKEY_RST_EN	BIT(9)
+#define MTK_PMIC_MT6331_RST_DU_MASK	GENMASK(13, 12)
+
 #define MTK_PMIC_PWRKEY_INDEX	0
 #define MTK_PMIC_HOMEKEY_INDEX	1
 #define MTK_PMIC_MAX_KEY_COUNT	2
@@ -86,6 +91,19 @@ static const struct mtk_pmic_regs mt6323_regs = {
 	.rst_lprst_mask = MTK_PMIC_MT6397_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6331_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x2,
+				   MT6331_INT_MISC_CON, 0x4,
+				   MTK_PMIC_MT6331_PWRKEY_RST_EN),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x4,
+				   MT6331_INT_MISC_CON, 0x2,
+				   MTK_PMIC_MT6331_HOMEKEY_RST_EN),
+	.pmic_rst_reg = MT6331_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_MT6331_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6358_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
@@ -284,6 +302,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
+	}, {
+		.compatible = "mediatek,mt6331-keys",
+		.data = &mt6331_regs,
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_regs,
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
