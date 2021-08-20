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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2ABCC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB3361075
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DB3361075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jb0UBL6oeVWYDJCg6+uQTV/gSRi6TnLSN6XqmgRH9Y=; b=Ssx1SJUOcGSnQo
	Nlw1BD0AyfYWzjhmX7urfsNP9GJX28a/7LUcneBRlWaFEgLS5OnDGcKJCb+w0OtiUe6LU1WUA1hAl
	4EvbWhZu+AeYsMJc1rkD8OnSueiOYVg1pH1aD1BuPei7mHLlmajIrrlXQ3kMmteXa+OOe+yIEoDqG
	AxpB2TPC0sjNSzd7cfbno5qePu563yRviIuINAk4yZEQJSafdQk+1/eidPvpvhxQpw1fajlnAFFvS
	6cp3sehS76hMKl+J53qg2j7ZTB6Ip5H8oj2/oyr0LNHevgR5pc5Ee6VEFm5Aq1msEEDcf2cE8KSnw
	qfFW0eb8qkKNoEa3hMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2k7-00AsEE-8j; Fri, 20 Aug 2021 11:31:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2Wz-00AmJ3-1G; Fri, 20 Aug 2021 11:17:53 +0000
X-UUID: 610b269fe2274dfb8348d144596b7150-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gFL5+G3o6DETNA5hNCBkL38FCXHdgkJXMjp9r9kpKl4=; 
 b=uxX7sgvcwoFfyKd8oe8C00B1nDsV6CWiJKYo5HoPhK1e0Q/aeu8C+QA1XTz+zK087FjhSSnoKLSSnVpBkx9zvNgOSHvA5w6q21XQkclUnC4yOd7FyShePnFbs0I1A6sYwQC45uMIvpvEz+Y4YArKKkypKI1bwDkP0Fni7ZSSrU4=;
X-UUID: 610b269fe2274dfb8348d144596b7150-20210820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1552843065; Fri, 20 Aug 2021 04:17:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 04:17:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:17:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 19:17:44 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v2 19/24] clk: mediatek: Add MT8195 vencsys clock support
Date: Fri, 20 Aug 2021 19:14:59 +0800
Message-ID: <20210820111504.350-20-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210820111504.350-1-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_041749_155121_DBC66220 
X-CRM114-Status: GOOD (  16.21  )
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

Add MT8195 vencsys clock controller which provide clock gate
control for video encoder.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Makefile          |  2 +-
 drivers/clk/mediatek/clk-mt8195-venc.c | 69 ++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8195-venc.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 3c8c8cdbd3ef..82ffcc4f2c52 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -82,6 +82,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
 					clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
-					clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o
+					clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o clk-mt8195-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c b/drivers/clk/mediatek/clk-mt8195-venc.c
new file mode 100644
index 000000000000..10702a4ad5ff
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8195-venc.c
@@ -0,0 +1,69 @@
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
+	GATE_VENC(CLK_VENC_LARB, "venc_larb", "top_venc", 0),
+	GATE_VENC(CLK_VENC_VENC, "venc_venc", "top_venc", 4),
+	GATE_VENC(CLK_VENC_JPGENC, "venc_jpgenc", "top_venc", 8),
+	GATE_VENC(CLK_VENC_JPGDEC, "venc_jpgdec", "top_venc", 12),
+	GATE_VENC(CLK_VENC_JPGDEC_C1, "venc_jpgdec_c1", "top_venc", 16),
+	GATE_VENC(CLK_VENC_GALS, "venc_gals", "top_venc", 28),
+};
+
+static const struct mtk_gate venc_core1_clks[] = {
+	GATE_VENC(CLK_VENC_CORE1_LARB, "venc_core1_larb", "top_venc", 0),
+	GATE_VENC(CLK_VENC_CORE1_VENC, "venc_core1_venc", "top_venc", 4),
+	GATE_VENC(CLK_VENC_CORE1_JPGENC, "venc_core1_jpgenc", "top_venc", 8),
+	GATE_VENC(CLK_VENC_CORE1_JPGDEC, "venc_core1_jpgdec", "top_venc", 12),
+	GATE_VENC(CLK_VENC_CORE1_JPGDEC_C1, "venc_core1_jpgdec_c1", "top_venc", 16),
+	GATE_VENC(CLK_VENC_CORE1_GALS, "venc_core1_gals", "top_venc", 28),
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
+builtin_platform_driver(clk_mt8195_venc_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
