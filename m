Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E246CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6ggDv0KgYu3zd+EWPH3ET1e1kqKAJcz8ceG5BXphBI=; b=eu1RYI2mHY34wX1O8dk8SV6LGR
	8kbcM+6qU/pkWdcmclI53jwvzTxw5jKHI4aXJo9A0D3oMRSM8Qmn/6oSyCd3pXSY3P8rtTSOse+co
	5+0su047QkSTmBGSUqkkIC2V9x+MOWTNEPpepOnW6Uy0kLpOLDfmO7dyyB+nsqonoq1j3rwZbOb9j
	SYIDvif4lTIp8JPMRLgzI1hyFlR6MMTogkR7VWvInMhreeorNtIBwkZBjW4vLrqToT1BtytLazT1E
	RydKqa1l7/HzlUMqKcNDkwuS/BOKkFXAHTVq8KJPw9LNOD9lvB5iX6TxhdnLGUVwYZFKd1dwflMzB
	Iq9lM6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NsQ-00DjUx-Im; Thu, 22 Dec 2022 15:52:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NrP-00Divf-Ji; Thu, 22 Dec 2022 15:51:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B9E36602CD6;
	Thu, 22 Dec 2022 15:51:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671724312;
	bh=O2dXAgLPaUw3PkOtSt7LNqIQn4RCHuSEGA3KmIfxgy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j94yEu/+BnkCUzCaAbk1OacUqkQnfPDedpq8hhng1JViiT+dKInf3x8bN3WYn6POf
	 ZKIAro0r2KrzZeO6IjpNzX4nP2Z1grBopDy+Ga2R/CY93I7xdYpY4Fd7WjI4x1d46j
	 FBEMzVMnopo9HFxIxcbRnM2gHPFti4ISwkcx3iwmobG5wvFXaJu0tAWFbhqr6Yx838
	 9A7SVcVPjNtYjJ4VO2c1J+313kIfn1ntMxWVCbMnojZ3DFdPKW9ir1xkZ7/otGJRmv
	 8wupUQXGE1cSk+bRaFBo66T+o7peG1mPppu78seNjpoiXXuWuf0Kx/O1+ySv2XY3cd
	 HRmzgefp9xp6Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	edward-jw.yang@mediatek.com,
	johnson.wang@mediatek.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	jose.exposito89@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 1/6] clk: mediatek: fhctl: Add support for older fhctl register layout
Date: Thu, 22 Dec 2022 16:51:42 +0100
Message-Id: <20221222155147.158837-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
References: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_075155_943211_98D010CA 
X-CRM114-Status: GOOD (  19.06  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Frequency Hopping Controller (FHCTL) seems to have different
versions, as it has a slightly different register layout on some
older SoCs like MT6795, MT8173, MT8183 (and others).

This driver is indeed compatible with at least some of those older
IP revisions, so all we need to do is to add a way to select the
right register layout at registration time.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-fhctl.c             | 26 +++++++++++++++++---
 drivers/clk/mediatek/clk-fhctl.h             |  9 ++++++-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  2 ++
 drivers/clk/mediatek/clk-pllfh.c             | 23 +++++++++++++----
 drivers/clk/mediatek/clk-pllfh.h             |  1 +
 5 files changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/mediatek/clk-fhctl.c b/drivers/clk/mediatek/clk-fhctl.c
index 4f271acef5fe..45e4842cbf04 100644
--- a/drivers/clk/mediatek/clk-fhctl.c
+++ b/drivers/clk/mediatek/clk-fhctl.c
@@ -14,7 +14,20 @@
 #define PERCENT_TO_DDSLMT(dds, percent_m10) \
 	((((dds) * (percent_m10)) >> 5) / 100)
 
-static const struct fhctl_offset fhctl_offset = {
+const struct fhctl_offset fhctl_offset_v1 = {
+	.offset_hp_en = 0x0,
+	.offset_clk_con = 0x4,
+	.offset_rst_con = 0x8,
+	.offset_slope0 = 0xc,
+	.offset_slope1 = 0x10,
+	.offset_cfg = 0x0,
+	.offset_updnlmt = 0x4,
+	.offset_dds = 0x8,
+	.offset_dvfs = 0xc,
+	.offset_mon = 0x10,
+};
+
+const struct fhctl_offset fhctl_offset_v2 = {
 	.offset_hp_en = 0x0,
 	.offset_clk_con = 0x8,
 	.offset_rst_con = 0xc,
@@ -27,9 +40,16 @@ static const struct fhctl_offset fhctl_offset = {
 	.offset_mon = 0x10,
 };
 
-const struct fhctl_offset *fhctl_get_offset_table(void)
+const struct fhctl_offset *fhctl_get_offset_table(enum fhctl_variant v)
 {
-	return &fhctl_offset;
+	switch (v) {
+	case FHCTL_PLLFH_V1:
+		return &fhctl_offset_v1;
+	case FHCTL_PLLFH_V2:
+		return &fhctl_offset_v2;
+	default:
+		return ERR_PTR(-EINVAL);
+	};
 }
 
 static void dump_hw(struct mtk_clk_pll *pll, struct fh_pll_regs *regs,
diff --git a/drivers/clk/mediatek/clk-fhctl.h b/drivers/clk/mediatek/clk-fhctl.h
index 51275febf086..bfa6d281a3ee 100644
--- a/drivers/clk/mediatek/clk-fhctl.h
+++ b/drivers/clk/mediatek/clk-fhctl.h
@@ -7,6 +7,13 @@
 #ifndef __CLK_FHCTL_H
 #define __CLK_FHCTL_H
 
+#include "clk-pllfh.h"
+
+enum fhctl_variant {
+	FHCTL_PLLFH_V1,
+	FHCTL_PLLFH_V2,
+};
+
 struct fhctl_offset {
 	u32 offset_hp_en;
 	u32 offset_clk_con;
@@ -19,7 +26,7 @@ struct fhctl_offset {
 	u32 offset_dvfs;
 	u32 offset_mon;
 };
-const struct fhctl_offset *fhctl_get_offset_table(void);
+const struct fhctl_offset *fhctl_get_offset_table(enum fhctl_variant v);
 const struct fh_operation *fhctl_get_ops(void);
 void fhctl_hw_init(struct mtk_fh *fh);
 
diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index 1d673c6278a9..9fded5020ca4 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -7,6 +7,7 @@
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/mt8186-clk.h>
 
+#include "clk-fhctl.h"
 #include "clk-mtk.h"
 #include "clk-pll.h"
 #include "clk-pllfh.h"
@@ -98,6 +99,7 @@ enum fh_pll_id {
 		.data = {						\
 			.pll_id = _pllid,				\
 			.fh_id = _fhid,					\
+			.fh_ver = FHCTL_PLLFH_V2,			\
 			.fhx_offset = _offset,				\
 			.dds_mask = GENMASK(21, 0),			\
 			.slope0_value = 0x6003c97,			\
diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index f48780bec507..b9297726f5a0 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -104,14 +104,16 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
 	}
 }
 
-static void pllfh_init(struct mtk_fh *fh, struct mtk_pllfh_data *pllfh_data)
+static int pllfh_init(struct mtk_fh *fh, struct mtk_pllfh_data *pllfh_data)
 {
 	struct fh_pll_regs *regs = &fh->regs;
 	const struct fhctl_offset *offset;
 	void __iomem *base = pllfh_data->state.base;
 	void __iomem *fhx_base = base + pllfh_data->data.fhx_offset;
 
-	offset = fhctl_get_offset_table();
+	offset = fhctl_get_offset_table(pllfh_data->data.fh_ver);
+	if (IS_ERR(offset))
+		return PTR_ERR(offset);
 
 	regs->reg_hp_en = base + offset->offset_hp_en;
 	regs->reg_clk_con = base + offset->offset_clk_con;
@@ -129,6 +131,8 @@ static void pllfh_init(struct mtk_fh *fh, struct mtk_pllfh_data *pllfh_data)
 	fh->lock = &pllfh_lock;
 
 	fh->ops = fhctl_get_ops();
+
+	return 0;
 }
 
 static bool fhctl_is_supported_and_enabled(const struct mtk_pllfh_data *pllfh)
@@ -142,20 +146,29 @@ mtk_clk_register_pllfh(const struct mtk_pll_data *pll_data,
 {
 	struct clk_hw *hw;
 	struct mtk_fh *fh;
+	int ret;
 
 	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
 	if (!fh)
 		return ERR_PTR(-ENOMEM);
 
-	pllfh_init(fh, pllfh_data);
+	ret = pllfh_init(fh, pllfh_data);
+	if (ret) {
+		hw = ERR_PTR(ret);
+		goto out;
+	}
 
 	hw = mtk_clk_register_pll_ops(&fh->clk_pll, pll_data, base,
 				      &mtk_pllfh_ops);
 
+	if (IS_ERR(hw))
+		goto out;
+
+	fhctl_hw_init(fh);
+
+out:
 	if (IS_ERR(hw))
 		kfree(fh);
-	else
-		fhctl_hw_init(fh);
 
 	return hw;
 }
diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
index c0a6e1537034..5f419c2ec01f 100644
--- a/drivers/clk/mediatek/clk-pllfh.h
+++ b/drivers/clk/mediatek/clk-pllfh.h
@@ -18,6 +18,7 @@ struct fh_pll_state {
 struct fh_pll_data {
 	int pll_id;
 	int fh_id;
+	int fh_ver;
 	u32 fhx_offset;
 	u32 dds_mask;
 	u32 slope0_value;
-- 
2.39.0


