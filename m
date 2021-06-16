Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C97C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:10:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE5661027
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 23:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE5661027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9FKEhVKHUaJd/cb+Zy98a6kSGC4XNMfRFcp7Xa25QY=; b=kmjFW9ckmDIyIc
	WqceX0axHKMxaPDQrWHyGmyn22v+UKRhzZcu+fWZlPjRzwfZSEhk0mLotus58B8YuA35Veo+DMNEQ
	w96bKI36SIS2VtVyC49J41YDIIuKMSHbwnWhq2+jaVH9RJf7TyRJqrOoncCtzCB2vG7AGAxNzzlUW
	U3YSBZu7tlDkybQs4Ss0QF208jFm5IA3l+7L4M0u9+J9zEo09X+wfxiduV8IL46tD+0G/LtzINpLC
	iaKar8L9XxEdrjoIvVe6aCBEfLp1ImqNtLGX1aByTH2HysDJzVwOsAepQzyWvizqIM5lGRF/DDlJe
	PkeWpy+3XyYhPcl2yjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteft-0082PI-I5; Wed, 16 Jun 2021 23:10:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteVw-007xV2-OX; Wed, 16 Jun 2021 23:00:06 +0000
X-UUID: b8df023884994c9fa1feb1c193fa970d-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=129MY6hAYdpTKexU8c5c4MwQiH5YC8WC5dwoX3ikc6g=; 
 b=kTK5fb+zVRxes/cq7F7R6bQg6DGs8Y33DUlWZzNnGpfYDjgp+ZnThhOJEjlUSCUDWMzh2/HLoiyL35ioKglddUa9KReSeibtLAas690gvkCAyJpjiRJg6ABW1w/klMj4UVFkYd5kUGcH0PQ0rhloPOlp27vB39G1smT8mhwp30c=;
X-UUID: b8df023884994c9fa1feb1c193fa970d-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 684348220; Wed, 16 Jun 2021 15:59:58 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:50:31 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:50:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:50:29 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 17/22] clk: mediatek: Add MT8195 vencsys clock support
Date: Thu, 17 Jun 2021 06:47:38 +0800
Message-ID: <20210616224743.5109-18-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_160004_861297_179C9E68 
X-CRM114-Status: GOOD (  17.05  )
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

Add MT8195 vencsys clock providers

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |  6 +++
 drivers/clk/mediatek/Makefile          |  1 +
 drivers/clk/mediatek/clk-mt8195-venc.c | 71 ++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-venc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 1e89c68f6c6c..3352686d98cf 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -660,6 +660,12 @@ config COMMON_CLK_MT8195_VDOSYS1
 	help
 	  This driver supports MediaTek MT8195 vdosys1 clocks.
 
+config COMMON_CLK_MT8195_VENCSYS
+	bool "Clock driver for MediaTek MT8195 vencsys"
+	depends on COMMON_CLK_MT8195
+	help
+	  This driver supports MediaTek MT8195 vencsys clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 76c0fa837cb0..76a6b404e34b 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -93,5 +93,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS0) += clk-mt8195-vdo0.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS1) += clk-mt8195-vdo1.o
+obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c b/drivers/clk/mediatek/clk-mt8195-venc.c
new file mode 100644
index 000000000000..410ca69d5759
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-venc.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8195-clk.h>
+
+static const struct mtk_gate_regs venc_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_VENC(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate venc_clks[] = {
+	GATE_VENC(CLK_VENC_LARB, "venc_larb", "venc_sel", 0),
+	GATE_VENC(CLK_VENC_VENC, "venc_venc", "venc_sel", 4),
+	GATE_VENC(CLK_VENC_JPGENC, "venc_jpgenc", "venc_sel", 8),
+	GATE_VENC(CLK_VENC_JPGDEC, "venc_jpgdec", "venc_sel", 12),
+	GATE_VENC(CLK_VENC_JPGDEC_C1, "venc_jpgdec_c1", "venc_sel", 16),
+	GATE_VENC(CLK_VENC_GALS, "venc_gals", "venc_sel", 28),
+};
+
+static const struct mtk_gate venc_core1_clks[] = {
+	GATE_VENC(CLK_VENC_CORE1_LARB, "venc_core1_larb", "venc_sel", 0),
+	GATE_VENC(CLK_VENC_CORE1_VENC, "venc_core1_venc", "venc_sel", 4),
+	GATE_VENC(CLK_VENC_CORE1_JPGENC, "venc_core1_jpgenc", "venc_sel", 8),
+	GATE_VENC(CLK_VENC_CORE1_JPGDEC, "venc_core1_jpgdec", "venc_sel", 12),
+	GATE_VENC(CLK_VENC_CORE1_JPGDEC_C1, "venc_core1_jpgdec_c1", "venc_sel", 16),
+	GATE_VENC(CLK_VENC_CORE1_GALS, "venc_core1_gals", "venc_sel", 28),
+};
+
+static const struct mtk_clk_desc venc_desc = {
+	.clks = venc_clks,
+	.num_clks = ARRAY_SIZE(venc_clks),
+};
+
+static const struct mtk_clk_desc venc_core1_desc = {
+	.clks = venc_core1_clks,
+	.num_clks = ARRAY_SIZE(venc_core1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8195_venc[] = {
+	{
+		.compatible = "mediatek,mt8195-vencsys",
+		.data = &venc_desc,
+	}, {
+		.compatible = "mediatek,mt8195-vencsys_core1",
+		.data = &venc_core1_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8195_venc_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8195-venc",
+		.of_match_table = of_match_clk_mt8195_venc,
+	},
+};
+
+builtin_platform_driver(clk_mt8195_venc_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
