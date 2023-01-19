Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237D0C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Li01CMmpN2fnm9Fn+HCZl5UfJpp4ocXLI+nhOFMxqnw=; b=wonKOyjeOjbzaKetMxeM6sO0+x
	8Z8FpAkteEqtpEIGflyd6FuhpermjsIrjX54sY65s7vSK5IXc98s1yp8KZCeemzcIc3kIp2SKZLIJ
	caXcD6x7GGhPuPtrodBY4j7oRswBdfzfVuKppS6R95TsexWk9MbPPsa17exqntm1M0wW7kZwQTrs5
	36kDM+ymdmlI4nxNYiKb3lIvFTwvaY8O2cY7WfUcffDEOoeR6RcQIlqahWaJ3knVfKEefSZ+UVQbm
	sbYsBlJ1UVdN8zxhBRDcFVUpvguY9a5BfhhGT6hUs9ZCnBsyP21HOt+LHS5uH4F4ri7dTKrtt1uZC
	mLEJD2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUYL-004xHS-1D; Thu, 19 Jan 2023 13:02:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUMV-004rn0-Lc; Thu, 19 Jan 2023 12:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Li01CMmpN2fnm9Fn+HCZl5UfJpp4ocXLI+nhOFMxqnw=; b=k5G9GUV4dHw3kbAzrFS0nin3Ta
	DZonyaAmwRu90m1CPox6S+yVfsLTlbTvAQr85ozGG2LeOMzJRKgWoHK6lhzuVXtlLjLaaaoqQLhhZ
	Hjf+bjLoqijLOtZFiUG7ilVvnhrgvoVJO/Y3gDJeRIAiZ+AxmiYXwZOI98vAxW0mBC4uW2qr92W5u
	3CsFZ8iibPDzLeCNnqPZkttU7Y7avdgg2Ed9/9iJjs5zmDxEulkaFdxwy90+3LEJmR4xx8rJSfNwg
	zGKi2m6TIUQCAvtL7jJ5ApgOTPFRD2+o1XIEBIbRWOYZRQLVN86gQw/p9BLOYFaKfj2n+BQYBpE+1
	1eLgCuRw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIULx-000IPE-1C;
	Thu, 19 Jan 2023 12:49:18 +0000
X-UUID: b91e0e8297f711edbbe3f76fe852e059-20230119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Li01CMmpN2fnm9Fn+HCZl5UfJpp4ocXLI+nhOFMxqnw=;
	b=g0HbboCtz7x89v6GEj6YGaij/IisvhC/jrOZGo6hZp2fguqcgd8VyWPtHZGinpoablshlgkZRgcNMLd20ejDWJOaWRJ9ZcSKU0lmPX7ezpg8Q+9VRVD4nVNcDTOPO4YBqGMuoqQXZ9h7V5qTi0IWjZYS0lOwZIRyrpzHsE3IlKM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:fa233b77-0786-4a05-99c5-73c21f4dfed3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:298449f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: b91e0e8297f711edbbe3f76fe852e059-20230119
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 921900764; Thu, 19 Jan 2023 05:49:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 19 Jan 2023 20:48:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 19 Jan 2023 20:48:57 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v5 19/19] clk: mediatek: Add MT8188 adsp clock support
Date: Thu, 19 Jan 2023 20:48:48 +0800
Message-ID: <20230119124848.26364-20-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_124916_257769_B8CB0E59 
X-CRM114-Status: GOOD (  15.95  )
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

Add MT8188 adsp clock controller which provides clock gate
control for Audio DSP.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile                 |  2 +-
 .../clk/mediatek/clk-mt8188-adsp_audio26m.c   | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 8befaedfdd3d..b56ae9bee1d8 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -89,7 +89,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 				   clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
 				   clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o \
 				   clk-mt8188-vpp0.o clk-mt8188-vpp1.o clk-mt8188-wpe.o \
-				   clk-mt8188-imp_iic_wrap.o
+				   clk-mt8188-imp_iic_wrap.o clk-mt8188-adsp_audio26m.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
new file mode 100644
index 000000000000..f91381a1316c
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Garmin Chang <garmin.chang@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs adsp_audio26m_cg_regs = {
+	.set_ofs = 0x80,
+	.clr_ofs = 0x80,
+	.sta_ofs = 0x80,
+};
+
+#define GATE_ADSP_FLAGS(_id, _name, _parent, _shift)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &adsp_audio26m_cg_regs, _shift,		\
+		&mtk_clk_gate_ops_no_setclr, CLK_IGNORE_UNUSED)
+
+static const struct mtk_gate adsp_audio26m_clks[] = {
+	GATE_ADSP_FLAGS(CLK_AUDIODSP_AUDIO26M, "audiodsp_audio26m", "clk26m", 3),
+};
+
+static const struct mtk_clk_desc adsp_audio26m_desc = {
+	.clks = adsp_audio26m_clks,
+	.num_clks = ARRAY_SIZE(adsp_audio26m_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8188_adsp_audio26m[] = {
+	{ .compatible = "mediatek,mt8188-adsp-audio26m", .data = &adsp_audio26m_desc },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_mt8188_adsp_audio26m_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8188-adsp_audio26m",
+		.of_match_table = of_match_clk_mt8188_adsp_audio26m,
+	},
+};
+builtin_platform_driver(clk_mt8188_adsp_audio26m_drv);
-- 
2.18.0


