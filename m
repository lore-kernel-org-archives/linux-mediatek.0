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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248ECC48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 00:49:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBBE860698
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 00:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBBE860698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gyq+5PkUI6lOHphbpoR5UO2yp4o5VCVStMaeDMKwrmo=; b=zcghwIM5LFLptM
	sWRIdvXJwr73dRA2DyNZIedoDxo4ftF2qaDxjyV9w40T//S6wR66cSs2dIT0oc9OGOK59N494qyIu
	EpuA6tMZdKFNZrJ+rDbe6HMo60fq8TWudgjJeFu24HHhyWIsV4j4j2qQx0f5DCsMc+LWJl89DrR7w
	7pdK/mAg8RXVBuTk70Y24rb+nH4A2fpEA6LupIfHYfoQdU2s8VOGM5l2cbX438o6epsqe+Eg+NJyA
	7xnQ52S3iXOyjWKDXFiXQ96C79cPHv1G11vb1Wwv9DRQsFWQYVhLF27HQcgix7NMzHYz8ieiIz9du
	vp8YD+0qrhrTX/H4lVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltJjx-004EF9-59; Wed, 16 Jun 2021 00:49:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltJir-004DuQ-89; Wed, 16 Jun 2021 00:48:03 +0000
X-UUID: 8009a5bad7ee4cda9477cc9f43f672c2-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3T0SwXsekZO5iUp9Qc0iH+WC7THfy41P3cvZLZvDv8M=; 
 b=m/k6pwm4ejXwHwi0XtUInHLNRdQwjHjKZ5LcKsMWPcJGtnWywBFG5IboxragzFb7PTFwxgX+MWyLX6ccLn+LQ4cSwG/mYTrLoPvE94QyveLuB/EyqHNE53yEwXofIbbvkFd20QI0gNsxJZaIG28CAbJu76txwbYGm+msdm306mY=;
X-UUID: 8009a5bad7ee4cda9477cc9f43f672c2-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 708852166; Tue, 15 Jun 2021 17:47:58 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 17:39:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 08:39:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 08:39:39 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH v10 17/19] clk: mediatek: Add MT8192 scp adsp clock support
Date: Wed, 16 Jun 2021 08:36:41 +0800
Message-ID: <20210616003643.28648-18-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616003643.28648-1-chun-jie.chen@mediatek.com>
References: <20210616003643.28648-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_174801_639725_A4C21AD3 
X-CRM114-Status: GOOD (  17.56  )
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

Add MT8192 scp adsp clock provider

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/Kconfig               |  6 +++
 drivers/clk/mediatek/Makefile              |  1 +
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c | 50 ++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8192-scp_adsp.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 88b24f74aff2..eb4aa29d8106 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -562,6 +562,12 @@ config COMMON_CLK_MT8192_MSDC
 	help
 	  This driver supports MediaTek MT8192 msdc and msdc_top clocks.
 
+config COMMON_CLK_MT8192_SCP_ADSP
+	bool "Clock driver for MediaTek MT8192 scp_adsp"
+	depends on COMMON_CLK_MT8192
+	help
+	  This driver supports MediaTek MT8192 scp_adsp clocks.
+
 config COMMON_CLK_MT8516
 	bool "Clock driver for MediaTek MT8516"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 8e4e343d4af4..a336fe753e9a 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -77,5 +77,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MDPSYS) += clk-mt8192-mdp.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MFGCFG) += clk-mt8192-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MMSYS) += clk-mt8192-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
+obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
 obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
 obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
diff --git a/drivers/clk/mediatek/clk-mt8192-scp_adsp.c b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
new file mode 100644
index 000000000000..58725d79dd13
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2021 MediaTek Inc.
+// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
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
+static const struct mtk_gate_regs scp_adsp_cg_regs = {
+	.set_ofs = 0x180,
+	.clr_ofs = 0x180,
+	.sta_ofs = 0x180,
+};
+
+#define GATE_SCP_ADSP(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &scp_adsp_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+static const struct mtk_gate scp_adsp_clks[] = {
+	GATE_SCP_ADSP(CLK_SCP_ADSP_AUDIODSP, "scp_adsp_audiodsp", "adsp_sel", 0),
+};
+
+static const struct mtk_clk_desc scp_adsp_desc = {
+	.clks = scp_adsp_clks,
+	.num_clks = ARRAY_SIZE(scp_adsp_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8192_scp_adsp[] = {
+	{
+		.compatible = "mediatek,mt8192-scp_adsp",
+		.data = &scp_adsp_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
+static struct platform_driver clk_mt8192_scp_adsp_drv = {
+	.probe = mtk_clk_simple_probe,
+	.driver = {
+		.name = "clk-mt8192-scp_adsp",
+		.of_match_table = of_match_clk_mt8192_scp_adsp,
+	},
+};
+
+builtin_platform_driver(clk_mt8192_scp_adsp_drv);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
