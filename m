Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB66C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN8wE37CW6KZWOJbP+fQPY6HhlOmKXcOapeQiu1UXlY=; b=qYJ7kF5oIq+Qa11hxJZf/agDFa
	AkZRYpshr4xpx1Bs8mQTDFLQjDA7jRacDswA+3ujZtqizcgH5Wwyv1VtFUC/dWrj2748QC376wTkg
	aKkAynA4DXOfA+XQAOHyWXvfEBKil19Jn4Xprrrq9fXpZUwVWv/CnxsssMG5S9jeQ6qY+JdKTDpS7
	U76ozq8eO+ajlLyo4T8ajUk8NY8FALMHddPpKHJZOZPBVR2Sgv0SHnLIFlR1OPbdIqwztCDushsnw
	R/pMHBACCpsRoPj2Ojiugn6b1pt1YSgtxJpTVoCno+v2V3bSKnBpAanSxq6u9Rye6TMTNlg4k7pi5
	wkzF+CXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEryW-001U9l-Bl; Mon, 09 Jan 2023 13:14:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEryT-001U8v-V8; Mon, 09 Jan 2023 13:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rN8wE37CW6KZWOJbP+fQPY6HhlOmKXcOapeQiu1UXlY=; b=aLHqdQPTzcYz1W1vUEBXA/LtHI
	SaEvXYz+JIzABvIWdmRVgsOvEbFJCli+CISkRsqf/d4syM9RDXf0bP/HphTnpA0H49lESL9P3CxT1
	/SXdciJKF9KXf/gQwuKSV2x1A3hYEhErOuZztSsERBihJ53h5uZcpfJ+eBXJIVe//5jj6HnhO+tHv
	epf5dwZ07W3eSdxj/rov66QmB9MBTGs7p8cv9YXDumGpwQZQJ1OezeuN0Rbg2Vpe/GMFqvo5i/V0f
	eHaKRBTH2T4mQO05LNBYgtsQMM4qWa1Irp+ubxRs3JaynsMkzvpC+LkyNHg2igA9ji74oDbby82mp
	uJNFhxAQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pErgT-002jLO-19;
	Mon, 09 Jan 2023 12:55:29 +0000
X-UUID: 5223bef66b194de5b9fcab36a1c1e5fe-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rN8wE37CW6KZWOJbP+fQPY6HhlOmKXcOapeQiu1UXlY=;
	b=O0+gpCFe4NpeBfKQwDVhwLPM5Q6EcyLSholoRGwLMtrUMO1StJQzA29z82LKKJH3Zw4+rdsNupfIpp1J4v8KuT0FY+jc2KXeWhaCx9BIAaJ/2uFgXDBed0DqVfVhRVMyJeOOU3f4YNUj+cGnM/g22e9qEl9yyscHKbabAL1mafM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:d90faad4-85a3-4672-9115-0b7eb59525fe,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:bf881d54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 5223bef66b194de5b9fcab36a1c1e5fe-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1821664994; Mon, 09 Jan 2023 05:55:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 Jan 2023 20:45:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Jan 2023 20:45:20 +0800
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
Subject: [PATCH v4 03/19] clk: mediatek: Add MT8188 topckgen clock support
Date: Mon, 9 Jan 2023 20:45:00 +0800
Message-ID: <20230109124516.31425-4-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
References: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_125526_167328_00A9BAF5 
X-CRM114-Status: GOOD (  13.56  )
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

Add MT8188 topckgen clock controller which provides muxes, dividers
to handle variety clock selection in other IP blocks.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/clk/mediatek/Makefile              |    2 +-
 drivers/clk/mediatek/clk-mt8188-topckgen.c | 1352 ++++++++++++++++++++
 2 files changed, 1353 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8188-topckgen.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 13ab8deb362c..89b1b331cad0 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -83,7 +83,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
 				   clk-mt8186-mfg.o clk-mt8186-mm.o clk-mt8186-wpe.o \
 				   clk-mt8186-img.o clk-mt8186-vdec.o clk-mt8186-venc.o \
 				   clk-mt8186-cam.o clk-mt8186-mdp.o clk-mt8186-ipe.o
-obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o
+obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8188-topckgen.c b/drivers/clk/mediatek/clk-mt8188-topckgen.c
new file mode 100644
index 000000000000..dd0014b461ff
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8188-topckgen.c
@@ -0,0 +1,1352 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Garmin Chang <garmin.chang@mediatek.com>
+
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-mux.h"
+
+static DEFINE_SPINLOCK(mt8188_clk_lock);
+
+static const struct mtk_fixed_clk top_fixed_clks[] = {
+	FIXED_CLK(CLK_TOP_ULPOSC1, "ulposc_ck1", NULL, 260000000),
+	FIXED_CLK(CLK_TOP_MPHONE_SLAVE_BCK, "mphone_slave_bck", NULL, 49152000),
+	FIXED_CLK(CLK_TOP_PAD_FPC, "pad_fpc_ck", NULL, 50000000),
+	FIXED_CLK(CLK_TOP_466M_FMEM, "hd_466m_fmem_ck", NULL, 533000000),
+	FIXED_CLK(CLK_TOP_PEXTP_PIPE, "pextp_pipe", NULL, 250000000),
+	FIXED_CLK(CLK_TOP_DSI_PHY, "dsi_phy", NULL, 500000000),
+};
+
+static const struct mtk_fixed_factor top_divs[] = {
+	FACTOR(CLK_TOP_MFGPLL, "mfgpll_ck", "mfgpll", 1, 1),
+	FACTOR(CLK_TOP_MAINPLL, "mainpll_ck", "mainpll", 1, 1),
+	FACTOR(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll_ck", 1, 3),
+	FACTOR(CLK_TOP_MAINPLL_D4, "mainpll_d4", "mainpll_ck", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D4_D2, "mainpll_d4_d2", "mainpll_d4", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D4_D4, "mainpll_d4_d4", "mainpll_d4", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D4_D8, "mainpll_d4_d8", "mainpll_d4", 1, 8),
+	FACTOR(CLK_TOP_MAINPLL_D5, "mainpll_d5", "mainpll_ck", 1, 5),
+	FACTOR(CLK_TOP_MAINPLL_D5_D2, "mainpll_d5_d2", "mainpll_d5", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D5_D4, "mainpll_d5_d4", "mainpll_d5", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D5_D8, "mainpll_d5_d8", "mainpll_d5", 1, 8),
+	FACTOR(CLK_TOP_MAINPLL_D6, "mainpll_d6", "mainpll_ck", 1, 6),
+	FACTOR(CLK_TOP_MAINPLL_D6_D2, "mainpll_d6_d2", "mainpll_d6", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D6_D4, "mainpll_d6_d4", "mainpll_d6", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D6_D8, "mainpll_d6_d8", "mainpll_d6", 1, 8),
+	FACTOR(CLK_TOP_MAINPLL_D7, "mainpll_d7", "mainpll_ck", 1, 7),
+	FACTOR(CLK_TOP_MAINPLL_D7_D2, "mainpll_d7_d2", "mainpll_d7", 1, 2),
+	FACTOR(CLK_TOP_MAINPLL_D7_D4, "mainpll_d7_d4", "mainpll_d7", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D7_D8, "mainpll_d7_d8", "mainpll_d7", 1, 8),
+	FACTOR(CLK_TOP_MAINPLL_D9, "mainpll_d9", "mainpll_ck", 1, 9),
+	FACTOR(CLK_TOP_UNIVPLL, "univpll_ck", "univpll", 1, 1),
+	FACTOR(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll_ck", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll_ck", 1, 3),
+	FACTOR(CLK_TOP_UNIVPLL_D4, "univpll_d4", "univpll_ck", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D2, "univpll_d4_d2", "univpll_d4", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D4, "univpll_d4_d4", "univpll_d4", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D8, "univpll_d4_d8", "univpll_d4", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll_ck", 1, 5),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll_d5", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll_d5", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D8, "univpll_d5_d8", "univpll_d5", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D6, "univpll_d6", "univpll_ck", 1, 6),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D2, "univpll_d6_d2", "univpll_d6", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D4, "univpll_d6_d4", "univpll_d6", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D8, "univpll_d6_d8", "univpll_d6", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll_ck", 1, 7),
+	FACTOR(CLK_TOP_UNIVPLL_192M, "univpll_192m", "univpll_ck", 1, 13),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D4, "univpll_192m_d4", "univpll_192m", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D8, "univpll_192m_d8", "univpll_192m", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D10, "univpll_192m_d10", "univpll_192m", 1, 10),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D16, "univpll_192m_d16", "univpll_192m", 1, 16),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D32, "univpll_192m_d32", "univpll_192m", 1, 32),
+	FACTOR(CLK_TOP_IMGPLL, "imgpll_ck", "imgpll", 1, 1),
+	FACTOR(CLK_TOP_APLL1_D3, "apll1_d3", "apll1", 1, 3),
+	FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "apll1", 1, 4),
+	FACTOR(CLK_TOP_APLL2_D3, "apll2_d3", "apll2", 1, 3),
+	FACTOR(CLK_TOP_APLL2_D4, "apll2_d4", "apll2", 1, 4),
+	FACTOR(CLK_TOP_APLL3_D4, "apll3_d4", "apll3", 1, 4),
+	FACTOR(CLK_TOP_APLL4_D4, "apll4_d4", "apll4", 1, 4),
+	FACTOR(CLK_TOP_APLL5_D4, "apll5_d4", "apll5", 1, 4),
+	FACTOR(CLK_TOP_MMPLL, "mmpll_ck", "mmpll", 1, 1),
+	FACTOR(CLK_TOP_MMPLL_D4, "mmpll_d4", "mmpll_ck", 1, 4),
+	FACTOR(CLK_TOP_MMPLL_D4_D2, "mmpll_d4_d2", "mmpll_d4", 1, 2),
+	FACTOR(CLK_TOP_MMPLL_D5, "mmpll_d5", "mmpll_ck", 1, 5),
+	FACTOR(CLK_TOP_MMPLL_D5_D2, "mmpll_d5_d2", "mmpll_d5", 1, 2),
+	FACTOR(CLK_TOP_MMPLL_D5_D4, "mmpll_d5_d4", "mmpll_d5", 1, 4),
+	FACTOR(CLK_TOP_MMPLL_D6, "mmpll_d6", "mmpll_ck", 1, 6),
+	FACTOR(CLK_TOP_MMPLL_D6_D2, "mmpll_d6_d2", "mmpll_d6", 1, 2),
+	FACTOR(CLK_TOP_MMPLL_D7, "mmpll_d7", "mmpll_ck", 1, 7),
+	FACTOR(CLK_TOP_MMPLL_D9, "mmpll_d9", "mmpll_ck", 1, 9),
+	FACTOR(CLK_TOP_TVDPLL1_D2, "tvdpll1_d2", "tvdpll1", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL1_D4, "tvdpll1_d4", "tvdpll1", 1, 4),
+	FACTOR(CLK_TOP_TVDPLL1_D8, "tvdpll1_d8", "tvdpll1", 1, 8),
+	FACTOR(CLK_TOP_TVDPLL1_D16, "tvdpll1_d16", "tvdpll1", 1, 16),
+	FACTOR(CLK_TOP_TVDPLL2_D2, "tvdpll2_d2", "tvdpll2", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL2_D4, "tvdpll2_d4", "tvdpll2", 1, 4),
+	FACTOR(CLK_TOP_TVDPLL2_D8, "tvdpll2_d8", "tvdpll2", 1, 8),
+	FACTOR(CLK_TOP_TVDPLL2_D16, "tvdpll2_d16", "tvdpll2", 1, 16),
+	FACTOR(CLK_TOP_MSDCPLL, "msdcpll_ck", "msdcpll", 1, 1),
+	FACTOR(CLK_TOP_MSDCPLL_D2, "msdcpll_d2", "msdcpll_ck", 1, 2),
+	FACTOR(CLK_TOP_MSDCPLL_D16, "msdcpll_d16", "msdcpll_ck", 1, 16),
+	FACTOR(CLK_TOP_ETHPLL, "ethpll_ck", "ethpll", 1, 1),
+	FACTOR(CLK_TOP_ETHPLL_D2, "ethpll_d2", "ethpll_ck", 1, 2),
+	FACTOR(CLK_TOP_ETHPLL_D4, "ethpll_d4", "ethpll_ck", 1, 4),
+	FACTOR(CLK_TOP_ETHPLL_D8, "ethpll_d8", "ethpll_ck", 1, 8),
+	FACTOR(CLK_TOP_ETHPLL_D10, "ethpll_d10", "ethpll_ck", 1, 10),
+	FACTOR(CLK_TOP_ADSPPLL, "adsppll_ck", "adsppll", 1, 1),
+	FACTOR(CLK_TOP_ADSPPLL_D2, "adsppll_d2", "adsppll_ck", 1, 2),
+	FACTOR(CLK_TOP_ADSPPLL_D4, "adsppll_d4", "adsppll_ck", 1, 4),
+	FACTOR(CLK_TOP_ADSPPLL_D8, "adsppll_d8", "adsppll_ck", 1, 8),
+	FACTOR(CLK_TOP_ULPOSC1_D2, "ulposc1_d2", "ulposc_ck1", 1, 2),
+	FACTOR(CLK_TOP_ULPOSC1_D4, "ulposc1_d4", "ulposc_ck1", 1, 4),
+	FACTOR(CLK_TOP_ULPOSC1_D8, "ulposc1_d8", "ulposc_ck1", 1, 8),
+	FACTOR(CLK_TOP_ULPOSC1_D7, "ulposc1_d7", "ulposc_ck1", 1, 7),
+	FACTOR(CLK_TOP_ULPOSC1_D10, "ulposc1_d10", "ulposc_ck1", 1, 10),
+	FACTOR(CLK_TOP_ULPOSC1_D16, "ulposc1_d16", "ulposc_ck1", 1, 16),
+};
+
+static const char * const axi_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d7_d2",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"mainpll_d6_d2",
+	"ulposc1_d4"
+};
+
+static const char * const spm_parents[] = {
+	"clk26m",
+	"ulposc1_d10",
+	"mainpll_d7_d4",
+	"clk32k"
+};
+
+static const char * const scp_parents[] = {
+	"clk26m",
+	"univpll_d4",
+	"mainpll_d6",
+	"univpll_d6",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"univpll_d3",
+	"mainpll_d3"
+};
+
+static const char * const bus_aximem_parents[] = {
+	"clk26m",
+	"mainpll_d7_d2",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"mainpll_d6"
+};
+
+static const char * const vpp_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"univpll_d4_d2",
+	"mmpll_d4_d2",
+	"mmpll_d7",
+	"univpll_d6",
+	"mainpll_d4",
+	"mmpll_d5",
+	"tvdpll1",
+	"tvdpll2",
+	"univpll_d4",
+	"mmpll_d4"
+};
+
+static const char * const ethdr_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"univpll_d4_d2",
+	"mmpll_d4_d2",
+	"mmpll_d7",
+	"univpll_d6",
+	"mainpll_d4",
+	"mmpll_d5_d4",
+	"tvdpll1",
+	"tvdpll2",
+	"univpll_d4",
+	"mmpll_d4"
+};
+
+static const char * const ipe_parents[] = {
+	"clk26m",
+	"imgpll_ck",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"mmpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"mainpll_d7"
+};
+
+static const char * const cam_parents[] = {
+	"clk26m",
+	"tvdpll1",
+	"mainpll_d4",
+	"mmpll_d4",
+	"univpll_d4",
+	"univpll_d5",
+	"univpll_d6",
+	"mmpll_d7",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"imgpll_ck"
+};
+
+static const char * const ccu_parents[] = {
+	"clk26m",
+	"univpll_d6",
+	"mainpll_d4_d2",
+	"mainpll_d4",
+	"univpll_d5",
+	"mainpll_d6",
+	"mmpll_d6",
+	"mmpll_d7",
+	"univpll_d4_d2",
+	"univpll_d7"
+};
+
+static const char * const ccu_ahb_parents[] = {
+	"clk26m",
+	"univpll_d6",
+	"mainpll_d4_d2",
+	"mainpll_d4",
+	"univpll_d5",
+	"mainpll_d6",
+	"mmpll_d6",
+	"mmpll_d7",
+	"univpll_d4_d2",
+	"univpll_d7"
+};
+
+static const char * const img_parents[] = {
+	"clk26m",
+	"imgpll_ck",
+	"univpll_d4",
+	"mainpll_d4",
+	"univpll_d5",
+	"mmpll_d6",
+	"mmpll_d7",
+	"univpll_d6",
+	"mainpll_d6",
+	"mmpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"univpll_d5_d2"
+};
+
+static const char * const camtm_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d6_d4"
+};
+
+static const char * const dsp_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp1_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d5",
+	"mmpll_d5",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp2_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d5",
+	"mmpll_d5",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp3_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d5",
+	"mmpll_d5",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp4_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"mainpll_d4",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp5_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"mainpll_d4",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp6_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"mainpll_d4",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const dsp7_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d5",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const mfg_core_tmp_parents[] = {
+	"clk26m",
+	"mainpll_d5_d2",
+	"univpll_d6",
+	"univpll_d7"
+};
+
+static const char * const camtg_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_192m_d10",
+	"clk13m",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg2_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_192m_d10",
+	"clk13m",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const camtg3_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_192m_d10",
+	"clk13m",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const uart_parents[] = {
+	"clk26m",
+	"univpll_d6_d8"
+};
+
+static const char * const spi_parents[] = {
+	"clk26m",
+	"mainpll_d5_d4",
+	"mainpll_d6_d4",
+	"univpll_d6_d4",
+	"univpll_d6_d2",
+	"mainpll_d6_d2",
+	"mainpll_d4_d4",
+	"univpll_d5_d4"
+};
+
+static const char * const msdc5hclk_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d6_d2"
+};
+
+static const char * const msdc50_0_parents[] = {
+	"clk26m",
+	"msdcpll_ck",
+	"msdcpll_d2",
+	"univpll_d4_d4",
+	"mainpll_d6_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const msdc30_1_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d6_d2",
+	"mainpll_d7_d2",
+	"msdcpll_d2"
+};
+
+static const char * const msdc30_2_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d6_d2",
+	"mainpll_d7_d2",
+	"msdcpll_d2"
+};
+
+static const char * const intdir_parents[] = {
+	"clk26m",
+	"univpll_d6",
+	"mainpll_d4",
+	"univpll_d4"
+};
+
+static const char * const aud_intbus_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d7_d4"
+};
+
+static const char * const audio_h_parents[] = {
+	"clk26m",
+	"univpll_d7",
+	"apll1",
+	"apll2"
+};
+
+static const char * const pwrap_ulposc_parents[] = {
+	"clk26m",
+	"ulposc1_d10",
+	"ulposc1_d7",
+	"ulposc1_d8",
+	"ulposc1_d16",
+	"mainpll_d4_d8",
+	"univpll_d5_d8",
+	"tvdpll1_d16"
+};
+
+static const char * const atb_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2"
+};
+
+static const char * const sspm_parents[] = {
+	"clk26m",
+	"mainpll_d7_d2",
+	"mainpll_d6_d2",
+	"mainpll_d5_d2",
+	"mainpll_d9",
+	"mainpll_d4_d2"
+};
+
+static const char * const dp_parents[] = {
+	"clk26m",
+	"tvdpll1_d2",
+	"tvdpll2_d2",
+	"tvdpll1_d4",
+	"tvdpll2_d4",
+	"tvdpll1_d8",
+	"tvdpll2_d8",
+	"tvdpll1_d16",
+	"tvdpll2_d16"
+};
+
+static const char * const edp_parents[] = {
+	"clk26m",
+	"tvdpll1_d2",
+	"tvdpll2_d2",
+	"tvdpll1_d4",
+	"tvdpll2_d4",
+	"tvdpll1_d8",
+	"tvdpll2_d8",
+	"tvdpll1_d16",
+	"tvdpll2_d16"
+};
+
+static const char * const dpi_parents[] = {
+	"clk26m",
+	"tvdpll1_d2",
+	"tvdpll2_d2",
+	"tvdpll1_d4",
+	"tvdpll2_d4",
+	"tvdpll1_d8",
+	"tvdpll2_d8",
+	"tvdpll1_d16",
+	"tvdpll2_d16"
+};
+
+static const char * const disp_pwm0_parents[] = {
+	"clk26m",
+	"univpll_d6_d4",
+	"ulposc1_d2",
+	"ulposc1_d4",
+	"ulposc1_d16",
+	"ethpll_d4"
+};
+
+static const char * const disp_pwm1_parents[] = {
+	"clk26m",
+	"univpll_d6_d4",
+	"ulposc1_d2",
+	"ulposc1_d4",
+	"ulposc1_d16"
+};
+
+static const char * const usb_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const ssusb_xhci_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const usb_2p_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const ssusb_xhci_2p_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const usb_3p_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const ssusb_xhci_3p_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const i2c_parents[] = {
+	"clk26m",
+	"mainpll_d4_d8",
+	"univpll_d5_d4"
+};
+
+static const char * const seninf_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const seninf1_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const gcpu_parents[] = {
+	"clk26m",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"mmpll_d5_d2",
+	"univpll_d5_d2"
+};
+
+static const char * const venc_parents[] = {
+	"clk26m",
+	"mmpll_d4_d2",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"univpll_d6",
+	"mmpll_d6",
+	"mainpll_d5_d2",
+	"mainpll_d6_d2",
+	"mmpll_d9",
+	"univpll_d4_d4",
+	"mainpll_d4",
+	"univpll_d4",
+	"univpll_d5",
+	"univpll_d5_d2",
+	"mainpll_d5"
+};
+
+static const char * const vdec_parents[] = {
+	"clk26m",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"univpll_d4_d2",
+	"mmpll_d4_d2",
+	"univpll_d6",
+	"mainpll_d5",
+	"univpll_d5",
+	"mmpll_d6",
+	"mainpll_d4",
+	"tvdpll2",
+	"univpll_d4",
+	"imgpll_ck",
+	"univpll_d6_d2",
+	"mmpll_d9"
+};
+
+static const char * const pwm_parents[] = {
+	"clk32k",
+	"clk26m",
+	"univpll_d4_d8",
+	"univpll_d6_d4"
+};
+
+static const char * const mcupm_parents[] = {
+	"clk26m",
+	"mainpll_d6_d2",
+	"mainpll_d7_d4"
+};
+
+static const char * const spmi_p_mst_parents[] = {
+	"clk26m",
+	"clk13m",
+	"ulposc1_d8",
+	"ulposc1_d10",
+	"ulposc1_d16",
+	"ulposc1_d7",
+	"clk32k",
+	"mainpll_d7_d8",
+	"mainpll_d6_d8",
+	"mainpll_d5_d8"
+};
+
+static const char * const spmi_m_mst_parents[] = {
+	"clk26m",
+	"clk13m",
+	"ulposc1_d8",
+	"ulposc1_d10",
+	"ulposc1_d16",
+	"ulposc1_d7",
+	"clk32k",
+	"mainpll_d7_d8",
+	"mainpll_d6_d8",
+	"mainpll_d5_d8"
+};
+
+static const char * const dvfsrc_parents[] = {
+	"clk26m",
+	"ulposc1_d10",
+	"univpll_d6_d8",
+	"msdcpll_d16"
+};
+
+static const char * const tl_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"mainpll_d4_d4"
+};
+
+static const char * const aes_msdcfde_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d6",
+	"mainpll_d4_d4",
+	"univpll_d4_d2",
+	"univpll_d6"
+};
+
+static const char * const dsi_occ_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"univpll_d5_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const wpe_vpp_parents[] = {
+	"clk26m",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"mmpll_d4_d2",
+	"mainpll_d6",
+	"mmpll_d7",
+	"univpll_d6",
+	"mainpll_d5",
+	"univpll_d5",
+	"mainpll_d4",
+	"tvdpll1",
+	"univpll_d4"
+};
+
+static const char * const hdcp_parents[] = {
+	"clk26m",
+	"univpll_d4_d8",
+	"mainpll_d5_d8",
+	"univpll_d6_d4"
+};
+
+static const char * const hdcp_24m_parents[] = {
+	"clk26m",
+	"univpll_192m_d4",
+	"univpll_192m_d8",
+	"univpll_d6_d8"
+};
+
+static const char * const hdmi_apb_parents[] = {
+	"clk26m",
+	"univpll_d6_d4",
+	"msdcpll_d2"
+};
+
+static const char * const snps_eth_250m_parents[] = {
+	"clk26m",
+	"ethpll_d2"
+};
+
+static const char * const snps_eth_62p4m_ptp_parents[] = {
+	"apll2_d3",
+	"apll1_d3",
+	"clk26m",
+	"ethpll_d8"
+};
+
+static const char * const snps_eth_50m_rmii_parents[] = {
+	"clk26m",
+	"ethpll_d10"
+};
+
+static const char * const adsp_parents[] = {
+	"clk26m",
+	"clk13m",
+	"mainpll_d6",
+	"mainpll_d5_d2",
+	"univpll_d4_d4",
+	"univpll_d4",
+	"ulposc1_d2",
+	"ulposc1_ck1",
+	"adsppll_ck",
+	"adsppll_d2",
+	"adsppll_d4",
+	"adsppll_d8"
+};
+
+static const char * const audio_local_bus_parents[] = {
+	"clk26m",
+	"clk13m",
+	"mainpll_d4_d4",
+	"mainpll_d7_d2",
+	"mainpll_d5_d2",
+	"mainpll_d4_d2",
+	"mainpll_d7",
+	"mainpll_d4",
+	"univpll_d6",
+	"ulposc1_ck1",
+	"ulposc1_d4",
+	"ulposc1_d2"
+};
+
+static const char * const asm_h_parents[] = {
+	"clk26m",
+	"univpll_d6_d4",
+	"univpll_d6_d2",
+	"mainpll_d5_d2"
+};
+
+static const char * const asm_l_parents[] = {
+	"clk26m",
+	"univpll_d6_d4",
+	"univpll_d6_d2",
+	"mainpll_d5_d2"
+};
+
+static const char * const apll1_parents[] = {
+	"clk26m",
+	"apll1_d4"
+};
+
+static const char * const apll2_parents[] = {
+	"clk26m",
+	"apll2_d4"
+};
+
+static const char * const apll3_parents[] = {
+	"clk26m",
+	"apll3_d4"
+};
+
+static const char * const apll4_parents[] = {
+	"clk26m",
+	"apll4_d4"
+};
+
+static const char * const apll5_parents[] = {
+	"clk26m",
+	"apll5_d4"
+};
+
+static const char * const i2so1_parents[] = {
+	"clk26m",
+	"apll1",
+	"apll2",
+	"apll3",
+	"apll4",
+	"apll5"
+};
+
+static const char * const i2so2_parents[] = {
+	"clk26m",
+	"apll1",
+	"apll2",
+	"apll3",
+	"apll4",
+	"apll5"
+};
+
+static const char * const i2si1_parents[] = {
+	"clk26m",
+	"apll1",
+	"apll2",
+	"apll3",
+	"apll4",
+	"apll5"
+};
+
+static const char * const i2si2_parents[] = {
+	"clk26m",
+	"apll1",
+	"apll2",
+	"apll3",
+	"apll4",
+	"apll5"
+};
+
+static const char * const dptx_parents[] = {
+	"clk26m",
+	"apll1",
+	"apll2",
+	"apll3",
+	"apll4",
+	"apll5"
+};
+
+static const char * const aud_iec_parents[] = {
+	"clk26m",
+	"apll1",
+	"apll2",
+	"apll3",
+	"apll4",
+	"apll5"
+};
+
+static const char * const a1sys_hp_parents[] = {
+	"clk26m",
+	"apll1_d4"
+};
+
+static const char * const a2sys_parents[] = {
+	"clk26m",
+	"apll2_d4"
+};
+
+static const char * const a3sys_parents[] = {
+	"clk26m",
+	"apll3_d4",
+	"apll4_d4",
+	"apll5_d4"
+};
+
+static const char * const a4sys_parents[] = {
+	"clk26m",
+	"apll3_d4",
+	"apll4_d4",
+	"apll5_d4"
+};
+
+static const char * const ecc_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d5_d2",
+	"mainpll_d4_d2",
+	"mainpll_d6",
+	"univpll_d6"
+};
+
+static const char * const spinor_parents[] = {
+	"clk26m",
+	"clk13m",
+	"mainpll_d7_d8",
+	"univpll_d6_d8"
+};
+
+static const char * const ulposc_parents[] = {
+	"ulposc_ck1",
+	"ethpll_d2",
+	"mainpll_d4_d2",
+	"ethpll_d10"
+};
+
+static const char * const srck_parents[] = {
+	"ulposc1_d10",
+	"clk26m"
+};
+
+static const char * const mfg_fast_ref_parents[] = {
+	"top_mfg_core_tmp",
+	"mfgpll_ck"
+};
+
+static const struct mtk_mux top_mtk_muxes[] = {
+	/*
+	 * CLK_CFG_0
+	 * axi_sel and bus_aximem_sel are bus clocks, should not be closed by Linux.
+	 * spm_sel and scp_sel are main clocks in always-on co-processor.
+	 */
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_AXI, "top_axi", axi_parents,
+				   0x020, 0x024, 0x028, 0, 4, 7, 0x04, 0, CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SPM, "top_spm", spm_parents,
+				   0x020, 0x024, 0x028, 8, 4, 15, 0x04, 1, CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SCP, "top_scp", scp_parents,
+				   0x020, 0x024, 0x028, 16, 4, 23, 0x04, 2, CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_BUS_AXIMEM, "top_bus_aximem", bus_aximem_parents,
+				   0x020, 0x024, 0x028, 24, 4, 31, 0x04, 3, CLK_IS_CRITICAL),
+	/* CLK_CFG_1 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VPP, "top_vpp",
+			     vpp_parents, 0x02C, 0x030, 0x034, 0, 4, 7, 0x04, 4),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ETHDR, "top_ethdr",
+			     ethdr_parents, 0x02C, 0x030, 0x034, 8, 4, 15, 0x04, 5),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IPE, "top_ipe",
+			     ipe_parents, 0x02C, 0x030, 0x034, 16, 4, 23, 0x04, 6),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAM, "top_cam",
+			     cam_parents, 0x02C, 0x030, 0x034, 24, 4, 31, 0x04, 7),
+	/* CLK_CFG_2 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CCU, "top_ccu",
+			     ccu_parents, 0x038, 0x03C, 0x040, 0, 4, 7, 0x04, 8),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CCU_AHB, "top_ccu_ahb",
+			     ccu_ahb_parents, 0x038, 0x03C, 0x040, 8, 4, 15, 0x04, 9),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IMG, "top_img",
+			     img_parents, 0x038, 0x03C, 0x040, 16, 4, 23, 0x04, 10),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTM, "top_camtm",
+			     camtm_parents, 0x038, 0x03C, 0x040, 24, 4, 31, 0x04, 11),
+	/* CLK_CFG_3 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP, "top_dsp",
+			     dsp_parents, 0x044, 0x048, 0x04C, 0, 4, 7, 0x04, 12),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP1, "top_dsp1",
+			     dsp1_parents, 0x044, 0x048, 0x04C, 8, 4, 15, 0x04, 13),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP2, "top_dsp2",
+			     dsp2_parents, 0x044, 0x048, 0x04C, 16, 4, 23, 0x04, 14),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP3, "top_dsp3",
+			     dsp3_parents, 0x044, 0x048, 0x04C, 24, 4, 31, 0x04, 15),
+	/* CLK_CFG_4 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP4, "top_dsp4",
+			     dsp4_parents, 0x050, 0x054, 0x058, 0, 4, 7, 0x04, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP5, "top_dsp5",
+			     dsp5_parents, 0x050, 0x054, 0x058, 8, 4, 15, 0x04, 17),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP6, "top_dsp6",
+			     dsp6_parents, 0x050, 0x054, 0x058, 16, 4, 23, 0x04, 18),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP7, "top_dsp7",
+			     dsp7_parents, 0x050, 0x054, 0x058, 24, 4, 31, 0x04, 19),
+	/* CLK_CFG_5 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_CORE_TMP, "top_mfg_core_tmp",
+			     mfg_core_tmp_parents, 0x05C, 0x060, 0x064, 0, 4, 7, 0x04, 20),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG, "top_camtg",
+			     camtg_parents, 0x05C, 0x060, 0x064, 8, 4, 15, 0x04, 21),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG2, "top_camtg2",
+			     camtg2_parents, 0x05C, 0x060, 0x064, 16, 4, 23, 0x04, 22),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG3, "top_camtg3",
+			     camtg3_parents, 0x05C, 0x060, 0x064, 24, 4, 31, 0x04, 23),
+	/* CLK_CFG_6 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_UART, "top_uart",
+			     uart_parents, 0x068, 0x06C, 0x070, 0, 4, 7, 0x04, 24),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SPI, "top_spi",
+			     spi_parents, 0x068, 0x06C, 0x070, 8, 4, 15, 0x04, 25),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC50_0_HCLK, "top_msdc5hclk",
+			     msdc5hclk_parents, 0x068, 0x06C, 0x070, 16, 4, 23, 0x04, 26),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC50_0, "top_msdc50_0",
+			     msdc50_0_parents, 0x068, 0x06C, 0x070, 24, 4, 31, 0x04, 27),
+	/* CLK_CFG_7 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC30_1, "top_msdc30_1",
+			     msdc30_1_parents, 0x074, 0x078, 0x07C, 0, 4, 7, 0x04, 28),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC30_2, "top_msdc30_2",
+			     msdc30_2_parents, 0x074, 0x078, 0x07C, 8, 4, 15, 0x04, 29),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_INTDIR, "top_intdir",
+			     intdir_parents, 0x074, 0x078, 0x07C, 16, 4, 23, 0x04, 30),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_INTBUS, "top_aud_intbus",
+			     aud_intbus_parents, 0x074, 0x078, 0x07C, 24, 4, 31, 0x04, 31),
+	/* CLK_CFG_8 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUDIO_H, "top_audio_h",
+			     audio_h_parents, 0x080, 0x084, 0x088, 0, 4, 7, 0x08, 0),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_PWRAP_ULPOSC, "top_pwrap_ulposc",
+			     pwrap_ulposc_parents, 0x080, 0x084, 0x088, 8, 4, 15, 0x08, 1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ATB, "top_atb",
+			     atb_parents, 0x080, 0x084, 0x088, 16, 4, 23, 0x08, 2),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSPM, "top_sspm",
+			     sspm_parents, 0x080, 0x084, 0x088, 24, 4, 31, 0x08, 3),
+	/* CLK_CFG_9 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DP, "top_dp",
+			     dp_parents, 0x08C, 0x090, 0x094, 0, 4, 7, 0x08, 4),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_EDP, "top_edp",
+			     edp_parents, 0x08C, 0x090, 0x094, 8, 4, 15, 0x08, 5),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPI, "top_dpi",
+			     dpi_parents, 0x08C, 0x090, 0x094, 16, 4, 23, 0x08, 6),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_PWM0, "top_disp_pwm0",
+			     disp_pwm0_parents, 0x08C, 0x090, 0x094, 24, 4, 31, 0x08, 7),
+	/* CLK_CFG_10 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_PWM1, "top_disp_pwm1",
+			     disp_pwm1_parents, 0x098, 0x09C, 0x0A0, 0, 4, 7, 0x08, 8),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_USB_TOP, "top_usb_top",
+			     usb_parents, 0x098, 0x09C, 0x0A0, 8, 4, 15, 0x08, 9),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSUSB_XHCI, "top_ssusb_xhci",
+			     ssusb_xhci_parents, 0x098, 0x09C, 0x0A0, 16, 4, 23, 0x08, 10),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_USB_TOP_2P, "top_usb_top_2p",
+			     usb_2p_parents, 0x098, 0x09C, 0x0A0, 24, 4, 31, 0x08, 11),
+	/* CLK_CFG_11 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSUSB_XHCI_2P, "top_ssusb_xhci_2p",
+			     ssusb_xhci_2p_parents, 0x0A4, 0x0A8, 0x0AC, 0, 4, 7, 0x08, 12),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_USB_TOP_3P, "top_usb_top_3p",
+			     usb_3p_parents, 0x0A4, 0x0A8, 0x0AC, 8, 4, 15, 0x08, 13),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSUSB_XHCI_3P, "top_ssusb_xhci_3p",
+			     ssusb_xhci_3p_parents, 0x0A4, 0x0A8, 0x0AC, 16, 4, 23, 0x08, 14),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_I2C, "top_i2c",
+			     i2c_parents, 0x0A4, 0x0A8, 0x0AC, 24, 4, 31, 0x08, 15),
+	/* CLK_CFG_12 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF, "top_seninf",
+			     seninf_parents, 0x0B0, 0x0B4, 0x0B8, 0, 4, 7, 0x08, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF1, "top_seninf1",
+			     seninf1_parents, 0x0B0, 0x0B4, 0x0B8, 8, 4, 15, 0x08, 17),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_GCPU, "top_gcpu",
+			     gcpu_parents, 0x0B0, 0x0B4, 0x0B8, 16, 4, 23, 0x08, 18),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VENC, "top_venc",
+			     venc_parents, 0x0B0, 0x0B4, 0x0B8, 24, 4, 31, 0x08, 19),
+	/*
+	 * CLK_CFG_13
+	 * top_mcupm is main clock in co-processor, should not be handled by Linux.
+	 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VDEC, "top_vdec",
+			     vdec_parents, 0x0BC, 0x0C0, 0x0C4, 0, 4, 7, 0x08, 20),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_PWM, "top_pwm",
+			     pwm_parents, 0x0BC, 0x0C0, 0x0C4, 8, 4, 15, 0x08, 21),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_MCUPM, "top_mcupm", mcupm_parents,
+				   0x0BC, 0x0C0, 0x0C4, 16, 4, 23, 0x08, 22, CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SPMI_P_MST, "top_spmi_p_mst",
+			     spmi_p_mst_parents, 0x0BC, 0x0C0, 0x0C4, 24, 4, 31, 0x08, 23),
+	/*
+	 * CLK_CFG_14
+	 * dvfsrc_sel is for internal DVFS usage, should not be handled by Linux.
+	 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SPMI_M_MST, "top_spmi_m_mst",
+			     spmi_m_mst_parents, 0x0C8, 0x0CC, 0x0D0, 0, 4, 7, 0x08, 24),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_DVFSRC, "top_dvfsrc", dvfsrc_parents,
+				   0x0C8, 0x0CC, 0x0D0, 8, 4, 15, 0x08, 25, CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_TL, "top_tl",
+			     tl_parents, 0x0C8, 0x0CC, 0x0D0, 16, 4, 23, 0x08, 26),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AES_MSDCFDE, "top_aes_msdcfde",
+			     aes_msdcfde_parents, 0x0C8, 0x0CC, 0x0D0, 24, 4, 31, 0x08, 27),
+	/* CLK_CFG_15 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSI_OCC, "top_dsi_occ",
+			     dsi_occ_parents, 0x0D4, 0x0D8, 0x0DC, 0, 4, 7, 0x08, 28),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_WPE_VPP, "top_wpe_vpp",
+			     wpe_vpp_parents, 0x0D4, 0x0D8, 0x0DC, 8, 4, 15, 0x08, 29),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_HDCP, "top_hdcp",
+			     hdcp_parents, 0x0D4, 0x0D8, 0x0DC, 16, 4, 23, 0x08, 30),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_HDCP_24M, "top_hdcp_24m",
+			     hdcp_24m_parents, 0x0D4, 0x0D8, 0x0DC, 24, 4, 31, 0x08, 31),
+	/* CLK_CFG_16 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_HDMI_APB, "top_hdmi_apb",
+			     hdmi_apb_parents, 0x0E0, 0x0E4, 0x0E8, 0, 4, 7, 0x0C, 0),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SNPS_ETH_250M, "top_snps_eth_250m",
+			     snps_eth_250m_parents, 0x0E0, 0x0E4, 0x0E8, 8, 4, 15, 0x0C, 1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SNPS_ETH_62P4M_PTP, "top_snps_eth_62p4m_ptp",
+			     snps_eth_62p4m_ptp_parents, 0x0E0, 0x0E4, 0x0E8, 16, 4, 23, 0x0C, 2),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SNPS_ETH_50M_RMII, "snps_eth_50m_rmii",
+			     snps_eth_50m_rmii_parents, 0x0E0, 0x0E4, 0x0E8, 24, 4, 31, 0x0C, 3),
+	/* CLK_CFG_17 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ADSP, "top_adsp",
+			     adsp_parents, 0x0EC, 0x0F0, 0x0F4, 0, 4, 7, 0x0C, 4),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUDIO_LOCAL_BUS, "top_audio_local_bus",
+			     audio_local_bus_parents, 0x0EC, 0x0F0, 0x0F4, 8, 4, 15, 0x0C, 5),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ASM_H, "top_asm_h",
+			     asm_h_parents, 0x0EC, 0x0F0, 0x0F4, 16, 4, 23, 0x0C, 6),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ASM_L, "top_asm_l",
+			     asm_l_parents, 0x0EC, 0x0F0, 0x0F4, 24, 4, 31, 0x0C, 7),
+	/* CLK_CFG_18 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_APLL1, "top_apll1",
+			     apll1_parents, 0x0F8, 0x0FC, 0x100, 0, 4, 7, 0x0C, 8),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_APLL2, "top_apll2",
+			     apll2_parents, 0x0F8, 0x0FC, 0x100, 8, 4, 15, 0x0C, 9),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_APLL3, "top_apll3",
+			     apll3_parents, 0x0F8, 0x0FC, 0x100, 16, 4, 23, 0x0C, 10),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_APLL4, "top_apll4",
+			     apll4_parents, 0x0F8, 0x0FC, 0x100, 24, 4, 31, 0x0C, 11),
+	/* CLK_CFG_19 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_APLL5, "top_apll5",
+			     apll5_parents, 0x0104, 0x0108, 0x010C, 0, 4, 7, 0x0C, 12),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_I2SO1, "top_i2so1",
+			     i2so1_parents, 0x0104, 0x0108, 0x010C, 8, 4, 15, 0x0C, 13),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_I2SO2, "top_i2so2",
+			     i2so2_parents, 0x0104, 0x0108, 0x010C, 16, 4, 23, 0x0C, 14),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_I2SI1, "top_i2si1",
+			     i2si1_parents, 0x0104, 0x0108, 0x010C, 24, 4, 31, 0x0C, 15),
+	/* CLK_CFG_20 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_I2SI2, "top_i2si2",
+			     i2si2_parents, 0x0110, 0x0114, 0x0118, 0, 4, 7, 0x0C, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPTX, "top_dptx",
+			     dptx_parents, 0x0110, 0x0114, 0x0118, 8, 4, 15, 0x0C, 17),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_IEC, "top_aud_iec",
+			     aud_iec_parents, 0x0110, 0x0114, 0x0118, 16, 4, 23, 0x0C, 18),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_A1SYS_HP, "top_a1sys_hp",
+			     a1sys_hp_parents, 0x0110, 0x0114, 0x0118, 24, 4, 31, 0x0C, 19),
+	/* CLK_CFG_21 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_A2SYS, "top_a2sys",
+			     a2sys_parents, 0x011C, 0x0120, 0x0124, 0, 4, 7, 0x0C, 20),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_A3SYS, "top_a3sys",
+			     a3sys_parents, 0x011C, 0x0120, 0x0124, 8, 4, 15, 0x0C, 21),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_A4SYS, "top_a4sys",
+			     a4sys_parents, 0x011C, 0x0120, 0x0124, 16, 4, 23, 0x0C, 22),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ECC, "top_ecc",
+			     ecc_parents, 0x011C, 0x0120, 0x0124, 24, 4, 31, 0x0C, 23),
+	/*
+	 * CLK_CFG_22
+	 * top_ulposc/top_srck are clock source of always on co-processor,
+	 * should not be closed by Linux.
+	 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SPINOR, "top_spinor",
+			     spinor_parents, 0x0128, 0x012C, 0x0130, 0, 4, 7, 0x0C, 24),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_ULPOSC, "top_ulposc", ulposc_parents,
+				   0x0128, 0x012C, 0x0130, 8, 4, 15, 0x0C, 25, CLK_IS_CRITICAL),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SRCK, "top_srck", srck_parents,
+				   0x0128, 0x012C, 0x0130, 16, 4, 23, 0x0C, 26, CLK_IS_CRITICAL),
+};
+
+static const struct mtk_composite top_adj_divs[] = {
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV0, "apll12_div0", "top_i2si1", 0x0320, 0, 0x0328, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV1, "apll12_div1", "top_i2si2", 0x0320, 1, 0x0328, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV2, "apll12_div2", "top_i2so1", 0x0320, 2, 0x0328, 8, 16),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV3, "apll12_div3", "top_i2so2", 0x0320, 3, 0x0328, 8, 24),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV4, "apll12_div4", "top_aud_iec", 0x0320, 4, 0x0334, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV9, "apll12_div9", "top_dptx", 0x0320, 9, 0x0338, 8, 8),
+};
+static const struct mtk_gate_regs top0_cg_regs = {
+	.set_ofs = 0x238,
+	.clr_ofs = 0x238,
+	.sta_ofs = 0x238,
+};
+
+static const struct mtk_gate_regs top1_cg_regs = {
+	.set_ofs = 0x250,
+	.clr_ofs = 0x250,
+	.sta_ofs = 0x250,
+};
+
+#define GATE_TOP0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+#define GATE_TOP1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
+
+static const struct mtk_gate top_clks[] = {
+	/* TOP0 */
+	GATE_TOP0(CLK_TOP_CFGREG_CLOCK_EN_VPP0, "cfgreg_clock_vpp0", "top_vpp", 0),
+	GATE_TOP0(CLK_TOP_CFGREG_CLOCK_EN_VPP1, "cfgreg_clock_vpp1", "top_vpp", 1),
+	GATE_TOP0(CLK_TOP_CFGREG_CLOCK_EN_VDO0, "cfgreg_clock_vdo0", "top_vpp", 2),
+	GATE_TOP0(CLK_TOP_CFGREG_CLOCK_EN_VDO1, "cfgreg_clock_vdo1", "top_vpp", 3),
+	GATE_TOP0(CLK_TOP_CFGREG_CLOCK_ISP_AXI_GALS, "cfgreg_clock_isp_axi_gals", "top_vpp", 4),
+	GATE_TOP0(CLK_TOP_CFGREG_F26M_VPP0, "cfgreg_f26m_vpp0", "clk26m", 5),
+	GATE_TOP0(CLK_TOP_CFGREG_F26M_VPP1, "cfgreg_f26m_vpp1", "clk26m", 6),
+	GATE_TOP0(CLK_TOP_CFGREG_F26M_VDO0, "cfgreg_f26m_vdo0", "clk26m", 7),
+	GATE_TOP0(CLK_TOP_CFGREG_F26M_VDO1, "cfgreg_f26m_vdo1", "clk26m", 8),
+	GATE_TOP0(CLK_TOP_CFGREG_AUD_F26M_AUD, "cfgreg_aud_f26m_aud", "clk26m", 9),
+	GATE_TOP0(CLK_TOP_CFGREG_UNIPLL_SES, "cfgreg_unipll_ses", "univpll_d2", 15),
+	GATE_TOP0(CLK_TOP_CFGREG_F_PCIE_PHY_REF, "cfgreg_f_pcie_phy_ref", "clk26m", 18),
+	/* TOP1 */
+	GATE_TOP1(CLK_TOP_SSUSB_TOP_REF, "ssusb_ref", "clk26m", 0),
+	GATE_TOP1(CLK_TOP_SSUSB_PHY_REF, "ssusb_phy_ref", "clk26m", 1),
+	GATE_TOP1(CLK_TOP_SSUSB_TOP_P1_REF, "ssusb_p1_ref", "clk26m", 2),
+	GATE_TOP1(CLK_TOP_SSUSB_PHY_P1_REF, "ssusb_phy_p1_ref", "clk26m", 3),
+	GATE_TOP1(CLK_TOP_SSUSB_TOP_P2_REF, "ssusb_p2_ref", "clk26m", 4),
+	GATE_TOP1(CLK_TOP_SSUSB_PHY_P2_REF, "ssusb_phy_p2_ref", "clk26m", 5),
+	GATE_TOP1(CLK_TOP_SSUSB_TOP_P3_REF, "ssusb_p3_ref", "clk26m", 6),
+	GATE_TOP1(CLK_TOP_SSUSB_PHY_P3_REF, "ssusb_phy_p3_ref", "clk26m", 7),
+};
+
+static const struct of_device_id of_match_clk_mt8188_topck[] = {
+	{ .compatible = "mediatek,mt8188-topckgen", },
+	{}
+};
+
+/* Register mux notifier for MFG mux */
+static int clk_mt8188_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
+{
+	struct mtk_mux_nb *mfg_mux_nb;
+
+	mfg_mux_nb = devm_kzalloc(dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
+	if (!mfg_mux_nb)
+		return -ENOMEM;
+
+	mfg_mux_nb->ops = &clk_mux_ops;
+	mfg_mux_nb->bypass_index = 0; /* Bypass to TOP_MFG_CORE_TMP */
+
+	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);
+}
+
+static int clk_mt8188_topck_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *top_clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw *hw;
+	int r;
+	void __iomem *base;
+
+	top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!top_clk_data)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		r = PTR_ERR(base);
+		goto free_top_data;
+	}
+
+	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
+					top_clk_data);
+	if (r)
+		goto free_top_data;
+
+	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	if (r)
+		goto unregister_fixed_clks;
+
+	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
+				   &mt8188_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_factors;
+
+	hw = devm_clk_hw_register_mux(&pdev->dev, "mfg_ck_fast_ref", mfg_fast_ref_parents,
+				      ARRAY_SIZE(mfg_fast_ref_parents), CLK_SET_RATE_PARENT,
+				      (base + 0x250), 8, 1, 0, &mt8188_clk_lock);
+	if (IS_ERR(hw)) {
+		r = PTR_ERR(hw);
+		goto unregister_muxes;
+	}
+	top_clk_data->hws[CLK_TOP_MFG_CK_FAST_REF] = hw;
+
+	r = clk_mt8188_reg_mfg_mux_notifier(&pdev->dev,
+					    top_clk_data->hws[CLK_TOP_MFG_CK_FAST_REF]->clk);
+	if (r)
+		goto unregister_muxes;
+
+	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
+					&mt8188_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_muxes;
+
+	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	if (r)
+		goto unregister_composite_divs;
+
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, top_clk_data);
+	if (r)
+		goto unregister_gates;
+
+	platform_set_drvdata(pdev, top_clk_data);
+
+	return r;
+
+unregister_gates:
+	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+unregister_composite_divs:
+	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
+unregister_muxes:
+	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
+unregister_factors:
+	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+unregister_fixed_clks:
+	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
+free_top_data:
+	mtk_free_clk_data(top_clk_data);
+	return r;
+}
+
+static int clk_mt8188_topck_remove(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *top_clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
+	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
+	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
+	mtk_free_clk_data(top_clk_data);
+
+	return 0;
+}
+
+static struct platform_driver clk_mt8188_topck_drv = {
+	.probe = clk_mt8188_topck_probe,
+	.remove = clk_mt8188_topck_remove,
+	.driver = {
+		.name = "clk-mt8188-topck",
+		.of_match_table = of_match_clk_mt8188_topck,
+	},
+};
+builtin_platform_driver(clk_mt8188_topck_drv);
-- 
2.18.0


