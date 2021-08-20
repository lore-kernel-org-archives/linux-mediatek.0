Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4DFC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:28:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ED9160F5E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3ED9160F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ea6tlGU1Bav/g5wjeQnVIyLxo80V5FZ67RVZafwFwcc=; b=OUm08Z12tyCQli
	RaCyRxMwl2DpkPaC6GW2nzT2qIhlMNiA5VpHCHel3l7L3hUHSkL7ZsAwBPrgAKF+JzNnuelfC59qW
	dByjt8ZSJJ7LCtGmKy6xFftuZeMb6O52m3El6qdDjZxJZYJXwcvWTJQH2qsI9tPshNRxX8zf4k+L9
	tJklxF9d3oxjDjWjHfbijuuZeEx31Qr+qIu56c4xQixm2sq8cMD/18wGWvL97DeDObQ61rAi4vXrU
	iT80GsWkk+3bkaruO1xY8Au5GAHCEM3hzXqOUZkjrw6AD8WusU66PmfCLj8kBL2rjdPUEwMup1Uy7
	cl7fa8Vs+Puixex/jF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2hJ-00Ar7j-Qf; Fri, 20 Aug 2021 11:28:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2Wq-00AmE8-Ol; Fri, 20 Aug 2021 11:17:42 +0000
X-UUID: 5ed06ca662df4990a4cd5e82ef82022a-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LKV3v3ksAtIikliECZgdN1+8COa8C/dqd4yDPhVI3fU=; 
 b=p4u4v+u/hheoH1I7G9A7Q9a1eCaItDuz/WPhflHRCU4c3qwzKYa2waUxeXNLdbANWncscwWzwVxEtwZrnWGb4LHCc4PsatxQdlL9fKRE6n7AXNGY+ELCBtiRGx4+mRD5hE6QgbgvqhGkyGglcuy3HfdSXjV3QUlXetvUwKEPme4=;
X-UUID: 5ed06ca662df4990a4cd5e82ef82022a-20210820
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 108499520; Fri, 20 Aug 2021 04:17:39 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 04:17:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:17:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 19:17:35 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v2 16/24] clk: mediatek: Add MT8195 vdecsys clock support
Date: Fri, 20 Aug 2021 19:14:56 +0800
Message-ID: <20210820111504.350-17-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210820111504.350-1-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_041740_855481_3C7021CE 
X-CRM114-Status: GOOD (  15.60  )
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

Add MT8195 vdec clock controllers which provide clock gate
control for video decoder.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |   3 +-
 drivers/clk/mediatek/clk-mt8195-vdec.c | 104 +++++++++++++++++++++++++
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdec.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 472e5bc40fcb..ac269f6d39e3 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
-					clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o
+					clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
+					clk-mt8195-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-vdec.c b/drivers/clk/mediatek/clk-mt8195-vdec.c
new file mode 100644
index 000000000000..2acc0cf88331
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-vdec.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mt8195-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+static const struct mtk_gate_regs vdec0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vdec1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vdec2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDEC0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdec2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vdec_clks[] = {
+	/* VDEC0 */
+	GATE_VDEC0(CLK_VDEC_VDEC, "vdec_vdec", "top_vdec", 0),
+	/* VDEC1 */
+	GATE_VDEC1(CLK_VDEC_LAT, "vdec_lat", "top_vdec", 0),
+	/* VDEC2 */
+	GATE_VDEC2(CLK_VDEC_LARB1, "vdec_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_gate vdec_core1_clks[] = {
+	/* VDEC0 */
+	GATE_VDEC0(CLK_VDEC_CORE1_VDEC, "vdec_core1_vdec", "top_vdec", 0),
+	/* VDEC1 */
+	GATE_VDEC1(CLK_VDEC_CORE1_LAT, "vdec_core1_lat", "top_vdec", 0),
+	/* VDEC2 */
+	GATE_VDEC2(CLK_VDEC_CORE1_LARB1, "vdec_core1_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_gate vdec_soc_clks[] = {
+	/* VDEC0 */
+	GATE_VDEC0(CLK_VDEC_SOC_VDEC, "vdec_soc_vdec", "top_vdec", 0),
+	/* VDEC1 */
+	GATE_VDEC1(CLK_VDEC_SOC_LAT, "vdec_soc_lat", "top_vdec", 0),
+	/* VDEC2 */
+	GATE_VDEC2(CLK_VDEC_SOC_LARB1, "vdec_soc_larb1", "top_vdec", 0),
+};
+
+static const struct mtk_clk_desc vdec_desc = {
+	.clks = vdec_clks,
+	.num_clks = ARRAY_SIZE(vdec_clks),
+};
+
+static const struct mtk_clk_desc vdec_core1_desc = {
+	.clks = vdec_core1_clks,
+	.num_clks = ARRAY_SIZE(vdec_core1_clks),
+};
+
+static const struct mtk_clk_desc vdec_soc_desc = {
+	.clks = vdec_soc_clks,
+	.num_clks = ARRAY_SIZE(vdec_soc_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8195_vdec[] = {
+	{
+		.compatible = "mediatek,mt8195-vdecsys",
+		.data = &vdec_desc,
+	}, {
+		.compatible = "mediatek,mt8195-vdecsys_core1",
+		.data = &vdec_core1_desc,
+	}, {
+		.compatible = "mediatek,mt8195-vdecsys_soc",
+		.data = &vdec_soc_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8195_vdec_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8195-vdec",
+		.of_match_table = of_match_clk_mt8195_vdec,
+	},
+};
+builtin_platform_driver(clk_mt8195_vdec_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
