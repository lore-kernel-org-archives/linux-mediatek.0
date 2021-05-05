Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24A7C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:18:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3849461157
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 10:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3849461157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c44NdU5AWMmHPAlYPmqzPuTY3fblCWDss/CdfzK4cGs=; b=jnbN8vSyYJLfoFXvXU2tHpBAH
	B4CDKu/WuBoDkHOk+WWT4oWh+ZNh7+ttCeA/ucXuUybHTg9lHSm9Za1QIJyBnSczw8opPH/v3xRKv
	A66Ssh51pjGfMO/6QrwhjHIPMGPxMM3MkmMjZ5kmNQigyW58n8NM6uD/msg8SpyJTDCNoCmqsDyeb
	AXHcWyadmyLVIXR+xyAVdFdTKd7F+Zu2DXqkM/ghgBwAGANphYBFezFguMtyFprkQ9LxcmB6TEgBE
	uAFHT/Ogsi+F6WtItYtQEm7qdpPJDJoispZ9jMUWVtfJVPeYHaQ9RkQzFcutrlDsS0TMmVmJnP76b
	oHMDjoo6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leEbZ-000tBH-PE; Wed, 05 May 2021 10:18:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEXV-000rPh-79; Wed, 05 May 2021 10:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=7pPFFEgdATBiQJloIzsxdgpExeoIc3kHI7yvXZfpVeI=; b=y5rtexnYoIG/uQDGccjsl0ZPjz
 5oPA7AlO4Sz+EhCsvIFSZkPQkJ0EpoQ8QmFmmFCxh4Vd+ZtA9Ozn+JwVA1Pt8ffvDOl+VLN4THlCO
 mD1Kump69vuuSrrP77DJ2dggikRFpRUrEFxNH/4lCpRy+O0Sin8yibPgZ0Ncr87AjDbfb6MnurwGS
 U8x17kYA14tu76dWYmmPjFPkYqZGKEtNhJ8UTHTlgK0wYKsc4p8zLs5Nqy+wSD6Y6ky63woyyhdAV
 mx7HRHdMQUV9DjFc6foI6qj2a7nklkH11b/Nhyq7mOtnSHYtLFGHCMKVfDtFbO7q4YVDw0lV3wmTq
 ztNmPgKA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leEXS-004ehs-LY; Wed, 05 May 2021 10:13:56 +0000
X-UUID: 372984cf0b6c4ca693898d95d6f9ca35-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7pPFFEgdATBiQJloIzsxdgpExeoIc3kHI7yvXZfpVeI=; 
 b=djsR3uCcjb0FQz534EEUhxdRJ+oCubba14ChXWJ2/V10V7hm5Zm3Yr5RhdogUPORuEUnUiGUNyGbaaEEWK1zET/RBtJmVGs2v3+2yeeQhd5JQk5EMPRk3MDlTUUU68LWTN7VkL7jMBbMbaH4FVzc/cQfbu6s4FINgwgiiYHBK2A=;
X-UUID: 372984cf0b6c4ca693898d95d6f9ca35-20210505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 764153124; Wed, 05 May 2021 03:13:45 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 03:13:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 18:13:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 May 2021 18:13:43 +0800
From: chun-jie.chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 "Rob Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v8 22/22] clk: mediatek: Add MT8192 vencsys clock support
Date: Wed, 5 May 2021 18:07:14 +0800
Message-ID: <20210505100714.3582-23-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
References: <20210505100714.3582-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_031354_730418_12B0F883 
X-CRM114-Status: GOOD (  17.29  )
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

Add MT8192 vencsys clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig           |  6 +++
 drivers/clk/mediatek/Makefile          |  1 +
 drivers/clk/mediatek/clk-mt8192-venc.c | 53 ++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-venc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 31779f2c5c83..576babd86f98 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -574,6 +574,12 @@ config COMMON_CLK_MT8192_VDECSYS
 	help
 	  This driver supports MediaTek MT8192 vdecsys and vdecsys_soc clocks.
 
+config COMMON_CLK_MT8192_VENCSYS
+	bool "Clock driver for MediaTek MT8192 vencsys"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 vencsys clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 887dd6bcf7f2..15bc045f0b71 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -79,5 +79,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MMSYS) += clk-mt8192-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
 obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-venc.c b/drivers/clk/mediatek/clk-mt8192-venc.c
new file mode 100644
index 000000000000..ce220c5334c0
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-venc.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Weiyi Lu <weiyi.lu@mediatek.com>
+
+#include <linux/clk-provider.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mt8192-clk.h>
+
+static const struct mtk_gate_regs venc_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_VENC(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate venc_clks[] = {
+	GATE_VENC(CLK_VENC_SET0_LARB, "venc_set0_larb", "venc_sel", 0),
+	GATE_VENC(CLK_VENC_SET1_VENC, "venc_set1_venc", "venc_sel", 4),
+	GATE_VENC(CLK_VENC_SET2_JPGENC, "venc_set2_jpgenc", "venc_sel", 8),
+	GATE_VENC(CLK_VENC_SET5_GALS, "venc_set5_gals", "venc_sel", 28),
+};
+
+static const struct mtk_clk_desc venc_desc = {
+	.clks = venc_clks,
+	.num_clks = ARRAY_SIZE(venc_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_venc[] = {
+	{
+		.compatible = "mediatek,mt8192-vencsys",
+		.data = &venc_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_venc_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-venc",
+		.of_match_table = of_match_clk_mt8192_venc,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_venc_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
