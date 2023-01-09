Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA03C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Li01CMmpN2fnm9Fn+HCZl5UfJpp4ocXLI+nhOFMxqnw=; b=EekYS/n0XazWLJzyP9kFv4M9H5
	gH8DneUjg61ItUJxE5dC4BdEHKwPxTSkUYwdfwb8TmZCaomIwsNGG9ABOepFb82niaPx7d+sl6g/n
	kNYgOXZeOJmGcm0H7aRFwz9Lci6NdItbidF16CvhADrWhzHaih9WraJOspDvaEGaNpBp6x3093IvC
	kW+PK0u8qcayeUgD+wUA+qHqadGkBAgB+RHTTfyefkpKAlPKt5IA/bozR3ayeKpx0+hiNM5c1t82h
	z1f02y/Q8SIddZ7nNhVlVFd+8kQc+XFAsnAFDGlWjKrafX74BT315yEdOymglBUAtqsWz6nY3dCDc
	X4mb1gQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErXd-001Hhv-Bf; Mon, 09 Jan 2023 12:46:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErXa-001HgA-UM; Mon, 09 Jan 2023 12:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Li01CMmpN2fnm9Fn+HCZl5UfJpp4ocXLI+nhOFMxqnw=; b=BoFe+sBeFv+lqrOHO2xB2dEFyp
	nOAvXf5iJPOaBgXkYXQJylliZv5OFWTvHD9E/lki9mqV2VsS4KACorw6WHsgKY5xQHRewBtJ0xo1Q
	Pa96cCLc6VGRKQaSnubtfQ4mXCT2j0FCDpUfPAZ9Yp/jUeUW4uhsh6oZdPS4yAS57/psWgoWqP7LH
	508Tx6IvyqyezOsX86trIqG7yp1HxKIQBUpSYB9me6vTfzwMxg3LtiZQBavJ26S8oewYZTJAHdSp0
	xO/2Ag3z6JDfPFa8hJjsmTOdP/yA9Zf/bQul/yT613i0h1Vmscvhtt7u3wvOn67pzeOCSEePvygNV
	xzW7Gdew==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pErXO-002j39-34;
	Mon, 09 Jan 2023 12:46:06 +0000
X-UUID: 7c2c018e5b044078ba6e396fddd539d0-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Li01CMmpN2fnm9Fn+HCZl5UfJpp4ocXLI+nhOFMxqnw=;
	b=dGAp2QFpaKVG4QKkBJD7MHYZ/Ybl/Dw4hqD0lPKbnKO+xU9mTDup8zl0WFsUDYy3Iu3N9iMImRCzgFXrNWumZgEvBwc09EVQNV1tke326Jbz/Dkm+CnTpneji4BaupsX2sVg23dEhgs3ztn2gu7VZZnBOWDJUEFzlxpOtbMBbI0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:3c1f30d5-8546-4957-91b0-2920bf85d384,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.17,REQID:3c1f30d5-8546-4957-91b0-2920bf85d384,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:543e81c,CLOUDID:5b2d47f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:230109204601GO0UZ6MC,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 0
X-UUID: 7c2c018e5b044078ba6e396fddd539d0-20230109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1008179590; Mon, 09 Jan 2023 05:46:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 Jan 2023 20:45:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Jan 2023 20:45:23 +0800
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
Subject: [PATCH v4 19/19] clk: mediatek: Add MT8188 adsp clock support
Date: Mon, 9 Jan 2023 20:45:16 +0800
Message-ID: <20230109124516.31425-20-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
References: <20230109124516.31425-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_124603_711283_645888C6 
X-CRM114-Status: GOOD (  15.73  )
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


