Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC59C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:14:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98701208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iVtmI6f9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mXKqaKgT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98701208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U3F62uopsEj8yD3jQud9ml+/uWK/PNSHoO38LTAdAqc=; b=iVtmI6f9mGItIvxTDXrYKSe4q
	g1Hqs2bexUfKXTryRdlnQIib3cWfcXaGCh32Z1K5cBkROvhZaLWIdMPJV4vYwmL+PGFTRSTmzTups
	K4+n9JEFAyhuYnvB5Y+ifleuTaP2T5TRTN9yHZmjxsLGAIcrnfo1YKZeU1aJIIPoGwaQIQae6m8Am
	X+G93kO8CnlN70sMjk/T7w0epFSYKfS87Sb833BaaOceLEYFvmZEqbAzz2UT7xkM7SXV4gFpsFeXa
	Y56EiU/5Qzsq8wF+DAIACbVAOWJvn9q2ERO4FE3SWRhkzeXSzEX+8fphoiexibFGK3hEp9Av6bo1z
	sx+ZyXSwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHewF-0003zq-Bd; Mon, 14 Sep 2020 03:13:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHeua-00033n-TI; Mon, 14 Sep 2020 03:12:18 +0000
X-UUID: ccfbdb5d17c946f1ba180092168437ca-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gjbZ7EKE7bYC9s+TAJMXV+z2AM8mP9qQSnfSBopillU=; 
 b=mXKqaKgT1GxlOpOlLtd0LOuK/xJxMjiSUSHPD+7n8iGQHBg8wEE37Hhi2JSqWCD3HYZy2za3PVFHwfyxLqEveBS3+m825gkDFRPNI7/TH5ZNwvXiYn9h0NrHm+YTnoANdOri15BcZAg9QETgd1dMpLpqmGBzbBXo4arjI2mjERE=;
X-UUID: ccfbdb5d17c946f1ba180092168437ca-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1610747035; Sun, 13 Sep 2020 19:11:53 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 20:04:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 11:04:48 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Sep 2020 11:04:48 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case
 <ryandcase@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH V5 06/17] soc: mediatek: add driver for dvfsrc support
Date: Mon, 14 Sep 2020 11:04:33 +0800
Message-ID: <1600052684-21198-7-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5298DCA3361E2D22C6AA253035DFF938DC9B689EC198D5F934C9C7B4230BF4EC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_231213_133531_422A7D72 
X-CRM114-Status: GOOD (  24.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Mike
 Turquette <mturquette@linaro.org>, James Liao <jamesjj.liao@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Henry Chen <henryc.chen@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add dvfsrc driver for MT6873/MT8183/MT8192

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/soc/mediatek/Kconfig            |  12 +
 drivers/soc/mediatek/Makefile           |   1 +
 drivers/soc/mediatek/mtk-dvfsrc.c       | 618 ++++++++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk_dvfsrc.h |  34 ++
 4 files changed, 665 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
 create mode 100644 include/linux/soc/mediatek/mtk_dvfsrc.h

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 3f5e5cb..ac78c47 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -16,6 +16,18 @@ config MTK_CMDQ
 	  time limitation, such as updating display configuration during the
 	  vblank.
 
+config MTK_DVFSRC
+	tristate "MediaTek DVFSRC Support"
+	depends on ARCH_MEDIATEK
+	depends on MTK_SCPSYS
+	help
+	  Say yes here to add support for the MediaTek DVFSRC (dynamic voltage
+	  and frequency scaling resource collector) found
+	  on different MediaTek SoCs. The DVFSRC is a proprietary
+	  hardware which is used to collect all the requests from
+	  system and turn into the decision of minimum Vcore voltage
+	  and minimum DRAM frequency to fulfill those requests.
+
 config MTK_PMIC_WRAP
 	tristate "MediaTek PMIC Wrapper Support"
 	depends on RESET_CONTROLLER
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index 2afa7b9..65e9597 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
+obj-$(CONFIG_MTK_DVFSRC) += mtk-dvfsrc.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
new file mode 100644
index 0000000..c539677
--- /dev/null
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -0,0 +1,618 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 MediaTek Inc.
+ */
+#include <linux/arm-smccc.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk_dvfsrc.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+#include <dt-bindings/power/mt8183-power.h>
+#include <dt-bindings/soc/mtk,dvfsrc.h>
+#include "mtk-scpsys.h"
+
+#define DVFSRC_IDLE     0x00
+#define DVFSRC_GET_TARGET_LEVEL(x)  (((x) >> 0) & 0x0000ffff)
+#define DVFSRC_GET_CURRENT_LEVEL(x) (((x) >> 16) & 0x0000ffff)
+#define kbps_to_mbps(x) ((x) / 1000)
+
+#define MT8183_DVFSRC_OPP_LP4   0
+#define MT8183_DVFSRC_OPP_LP4X  1
+#define MT8183_DVFSRC_OPP_LP3   2
+
+#define POLL_TIMEOUT        1000
+#define STARTUP_TIME        1
+
+#define MTK_SIP_DVFSRC_INIT		0x00
+
+#define DVFSRC_OPP_DESC(_opp_table)	\
+{	\
+	.opps = _opp_table,	\
+	.num_opp = ARRAY_SIZE(_opp_table),	\
+}
+
+struct dvfsrc_opp {
+	u32 vcore_opp;
+	u32 dram_opp;
+};
+
+struct dvfsrc_domain {
+	u32 id;
+	u32 state;
+};
+
+struct dvfsrc_opp_desc {
+	const struct dvfsrc_opp *opps;
+	u32 num_opp;
+};
+
+struct mtk_dvfsrc;
+struct dvfsrc_soc_data {
+	const int *regs;
+	u32 num_domains;
+	struct dvfsrc_domain *domains;
+	const struct dvfsrc_opp_desc *opps_desc;
+	int (*get_target_level)(struct mtk_dvfsrc *dvfsrc);
+	int (*get_current_level)(struct mtk_dvfsrc *dvfsrc);
+	u32 (*get_vcore_level)(struct mtk_dvfsrc *dvfsrc);
+	u32 (*get_vcp_level)(struct mtk_dvfsrc *dvfsrc);
+	void (*set_dram_bw)(struct mtk_dvfsrc *dvfsrc, u64 bw);
+	void (*set_dram_peak_bw)(struct mtk_dvfsrc *dvfsrc, u64 bw);
+	void (*set_dram_hrtbw)(struct mtk_dvfsrc *dvfsrc, u64 bw);
+	void (*set_opp_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
+	void (*set_vcore_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
+	void (*set_vscp_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
+	int (*wait_for_opp_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
+	int (*wait_for_vcore_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
+};
+
+struct mtk_dvfsrc {
+	struct device *dev;
+	struct platform_device *icc;
+	struct platform_device *regulator;
+	const struct dvfsrc_soc_data *dvd;
+	int dram_type;
+	const struct dvfsrc_opp_desc *curr_opps;
+	void __iomem *regs;
+	spinlock_t req_lock;
+	struct mutex pstate_lock;
+	struct notifier_block scpsys_notifier;
+};
+
+static u32 dvfsrc_read(struct mtk_dvfsrc *dvfs, u32 offset)
+{
+	return readl(dvfs->regs + dvfs->dvd->regs[offset]);
+}
+
+static void dvfsrc_write(struct mtk_dvfsrc *dvfs, u32 offset, u32 val)
+{
+	writel(val, dvfs->regs + dvfs->dvd->regs[offset]);
+}
+
+#define dvfsrc_rmw(dvfs, offset, val, mask, shift) \
+	dvfsrc_write(dvfs, offset, \
+		(dvfsrc_read(dvfs, offset) & ~(mask << shift)) | (val << shift))
+
+enum dvfsrc_regs {
+	DVFSRC_SW_REQ,
+	DVFSRC_SW_REQ2,
+	DVFSRC_LEVEL,
+	DVFSRC_TARGET_LEVEL,
+	DVFSRC_SW_BW,
+	DVFSRC_SW_PEAK_BW,
+	DVFSRC_SW_HRT_BW,
+	DVFSRC_VCORE_REQUEST,
+};
+
+static const int mt8183_regs[] = {
+	[DVFSRC_SW_REQ] =	0x4,
+	[DVFSRC_SW_REQ2] =	0x8,
+	[DVFSRC_LEVEL] =	0xDC,
+	[DVFSRC_SW_BW] =	0x160,
+};
+
+static const int mt6873_regs[] = {
+	[DVFSRC_SW_REQ] =		0xC,
+	[DVFSRC_LEVEL] =		0xD44,
+	[DVFSRC_SW_PEAK_BW] =		0x278,
+	[DVFSRC_SW_BW] =		0x26C,
+	[DVFSRC_SW_HRT_BW] =		0x290,
+	[DVFSRC_TARGET_LEVEL] =		0xD48,
+	[DVFSRC_VCORE_REQUEST] =	0x6C,
+};
+
+static const struct dvfsrc_opp *get_current_opp(struct mtk_dvfsrc *dvfsrc)
+{
+	int level;
+
+	level = dvfsrc->dvd->get_current_level(dvfsrc);
+	return &dvfsrc->curr_opps->opps[level];
+}
+
+static int dvfsrc_is_idle(struct mtk_dvfsrc *dvfsrc)
+{
+	if (!dvfsrc->dvd->get_target_level)
+		return true;
+
+	return dvfsrc->dvd->get_target_level(dvfsrc);
+}
+
+static int dvfsrc_wait_for_vcore_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	const struct dvfsrc_opp *curr;
+
+	return readx_poll_timeout_atomic(get_current_opp, dvfsrc, curr,
+					 curr->vcore_opp >= level, STARTUP_TIME,
+					 POLL_TIMEOUT);
+}
+
+static int mt6873_get_target_level(struct mtk_dvfsrc *dvfsrc)
+{
+	return dvfsrc_read(dvfsrc, DVFSRC_TARGET_LEVEL);
+}
+
+static int mt6873_get_current_level(struct mtk_dvfsrc *dvfsrc)
+{
+	u32 curr_level;
+
+	/* HW level 0 is begin from 0x1, and max opp is 0x1*/
+	curr_level = ffs(dvfsrc_read(dvfsrc, DVFSRC_LEVEL));
+	if (curr_level > dvfsrc->curr_opps->num_opp)
+		curr_level = 0;
+	else
+		curr_level = dvfsrc->curr_opps->num_opp - curr_level;
+
+	return curr_level;
+}
+
+static int mt6873_wait_for_opp_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	const struct dvfsrc_opp *target, *curr;
+
+	target = &dvfsrc->curr_opps->opps[level];
+	return readx_poll_timeout_atomic(get_current_opp, dvfsrc, curr,
+		curr->dram_opp >= target->dram_opp,
+		STARTUP_TIME, POLL_TIMEOUT);
+}
+
+static u32 mt6873_get_vcore_level(struct mtk_dvfsrc *dvfsrc)
+{
+	return (dvfsrc_read(dvfsrc, DVFSRC_SW_REQ) >> 4) & 0x7;
+}
+
+static u32 mt6873_get_vcp_level(struct mtk_dvfsrc *dvfsrc)
+{
+	return (dvfsrc_read(dvfsrc, DVFSRC_VCORE_REQUEST) >> 12) & 0x7;
+}
+
+static void mt6873_set_dram_bw(struct mtk_dvfsrc *dvfsrc, u64 bw)
+{
+	bw = div_u64(kbps_to_mbps(bw), 100);
+	bw = min_t(u64, bw, 0xFF);
+	dvfsrc_write(dvfsrc, DVFSRC_SW_BW, bw);
+}
+
+static void mt6873_set_dram_peak_bw(struct mtk_dvfsrc *dvfsrc, u64 bw)
+{
+	bw = div_u64(kbps_to_mbps(bw), 100);
+	bw = min_t(u64, bw, 0xFF);
+	dvfsrc_write(dvfsrc, DVFSRC_SW_PEAK_BW, bw);
+}
+
+static void mt6873_set_dram_hrtbw(struct mtk_dvfsrc *dvfsrc, u64 bw)
+{
+	bw = div_u64((kbps_to_mbps(bw) + 29), 30);
+	bw = min_t(u64, bw, 0x3FF);
+	dvfsrc_write(dvfsrc, DVFSRC_SW_HRT_BW, bw);
+}
+
+static void mt6873_set_vcore_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	spin_lock(&dvfsrc->req_lock);
+	dvfsrc_rmw(dvfsrc, DVFSRC_SW_REQ, level, 0x7, 4);
+	spin_unlock(&dvfsrc->req_lock);
+}
+
+static void mt6873_set_vscp_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	dvfsrc_rmw(dvfsrc, DVFSRC_VCORE_REQUEST, level, 0x7, 12);
+}
+
+static int mt8183_wait_for_opp_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	const struct dvfsrc_opp *target, *curr;
+	int ret;
+
+	target = &dvfsrc->curr_opps->opps[level];
+	ret = readx_poll_timeout(get_current_opp, dvfsrc, curr,
+				 curr->dram_opp >= target->dram_opp &&
+				 curr->vcore_opp >= target->vcore_opp,
+				 STARTUP_TIME, POLL_TIMEOUT);
+	if (ret < 0) {
+		dev_warn(dvfsrc->dev,
+			 "timeout, target: %u, dram: %d, vcore: %d\n", level,
+			 curr->dram_opp, curr->vcore_opp);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt8183_get_target_level(struct mtk_dvfsrc *dvfsrc)
+{
+	return DVFSRC_GET_TARGET_LEVEL(dvfsrc_read(dvfsrc, DVFSRC_LEVEL));
+}
+
+static int mt8183_get_current_level(struct mtk_dvfsrc *dvfsrc)
+{
+	int level;
+
+	/* HW level 0 is begin from 0x10000 */
+	level = DVFSRC_GET_CURRENT_LEVEL(dvfsrc_read(dvfsrc, DVFSRC_LEVEL));
+	/* Array index start from 0 */
+	return ffs(level) - 1;
+}
+
+static u32 mt8183_get_vcore_level(struct mtk_dvfsrc *dvfsrc)
+{
+	return (dvfsrc_read(dvfsrc, DVFSRC_SW_REQ2) >> 2) & 0x3;
+}
+
+static void mt8183_set_dram_bw(struct mtk_dvfsrc *dvfsrc, u64 bw)
+{
+	dvfsrc_write(dvfsrc, DVFSRC_SW_BW, div_u64(kbps_to_mbps(bw), 100));
+}
+
+static void mt8183_set_opp_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	int vcore_opp, dram_opp;
+	const struct dvfsrc_opp *opp;
+
+	/* translate pstate to dvfsrc level, and set it to DVFSRC HW */
+	opp = &dvfsrc->curr_opps->opps[level];
+	vcore_opp = opp->vcore_opp;
+	dram_opp = opp->dram_opp;
+
+	dev_dbg(dvfsrc->dev, "vcore_opp: %d, dram_opp: %d\n",
+		vcore_opp, dram_opp);
+	dvfsrc_write(dvfsrc, DVFSRC_SW_REQ, dram_opp | vcore_opp << 2);
+}
+
+static void mt8183_set_vcore_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	dvfsrc_write(dvfsrc, DVFSRC_SW_REQ2, level << 2);
+}
+
+void mtk_dvfsrc_send_request(const struct device *dev, u32 cmd, u64 data)
+{
+	int ret, state;
+	struct mtk_dvfsrc *dvfsrc = dev_get_drvdata(dev);
+
+	dev_dbg(dvfsrc->dev, "cmd: %d, data: %llu\n", cmd, data);
+
+	switch (cmd) {
+	case MTK_DVFSRC_CMD_BW_REQUEST:
+		dvfsrc->dvd->set_dram_bw(dvfsrc, data);
+		return;
+	case MTK_DVFSRC_CMD_PEAK_BW_REQUEST:
+		if (dvfsrc->dvd->set_dram_peak_bw)
+			dvfsrc->dvd->set_dram_peak_bw(dvfsrc, data);
+		return;
+	case MTK_DVFSRC_CMD_OPP_REQUEST:
+		if (dvfsrc->dvd->set_opp_level)
+			dvfsrc->dvd->set_opp_level(dvfsrc, data);
+		break;
+	case MTK_DVFSRC_CMD_VCORE_REQUEST:
+		dvfsrc->dvd->set_vcore_level(dvfsrc, data);
+		break;
+	case MTK_DVFSRC_CMD_HRTBW_REQUEST:
+		if (dvfsrc->dvd->set_dram_hrtbw)
+			dvfsrc->dvd->set_dram_hrtbw(dvfsrc, data);
+		else
+			return;
+		break;
+	case MTK_DVFSRC_CMD_VSCP_REQUEST:
+		dvfsrc->dvd->set_vscp_level(dvfsrc, data);
+		break;
+	default:
+		dev_err(dvfsrc->dev, "unknown command: %d\n", cmd);
+		return;
+	}
+
+	/* DVFSRC need to wait at least 2T(~196ns) to handle request
+	 * after recieving command
+	 */
+	udelay(STARTUP_TIME);
+
+	ret = readx_poll_timeout(dvfsrc_is_idle, dvfsrc,
+				 state, state == DVFSRC_IDLE,
+				 STARTUP_TIME, POLL_TIMEOUT);
+
+	if (ret < 0) {
+		dev_warn(dvfsrc->dev,
+			 "%d: idle timeout, data: %llu, last: %d -> %d\n",
+			 cmd, data,
+			 dvfsrc->dvd->get_current_level(dvfsrc),
+			 dvfsrc->dvd->get_target_level(dvfsrc));
+		return;
+	}
+
+	/* The previous change may be requested by previous request.
+	 * So we delay 1us, then start checking opp is reached enough.
+	 */
+	udelay(STARTUP_TIME);
+
+	if (cmd == MTK_DVFSRC_CMD_OPP_REQUEST)
+		ret = dvfsrc->dvd->wait_for_opp_level(dvfsrc, data);
+	else
+		ret = dvfsrc->dvd->wait_for_vcore_level(dvfsrc, data);
+
+	if (ret < 0) {
+		dev_warn(dvfsrc->dev,
+			 "%d: wait timeout, data: %llu, last: %d -> %d\n",
+			 cmd, data,
+			 dvfsrc->dvd->get_current_level(dvfsrc),
+			 dvfsrc->dvd->get_target_level(dvfsrc));
+	}
+
+}
+EXPORT_SYMBOL(mtk_dvfsrc_send_request);
+
+int mtk_dvfsrc_query_info(const struct device *dev, u32 cmd, int *data)
+{
+	struct mtk_dvfsrc *dvfsrc = dev_get_drvdata(dev);
+
+	switch (cmd) {
+	case MTK_DVFSRC_CMD_VCORE_LEVEL_QUERY:
+		*data = dvfsrc->dvd->get_vcore_level(dvfsrc);
+		break;
+	case MTK_DVFSRC_CMD_VSCP_LEVEL_QUERY:
+		*data = dvfsrc->dvd->get_vcp_level(dvfsrc);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(mtk_dvfsrc_query_info);
+
+static int dvfsrc_set_performance(struct notifier_block *b,
+				  unsigned long pstate, void *v)
+{
+	bool match = false;
+	int i;
+	struct mtk_dvfsrc *dvfsrc;
+	struct scp_event_data *sc = v;
+	struct dvfsrc_domain *d;
+	u32 highest;
+
+	if (sc->event_type != MTK_SCPSYS_PSTATE)
+		return 0;
+
+	dvfsrc = container_of(b, struct mtk_dvfsrc, scpsys_notifier);
+
+	if (!dvfsrc->dvd->num_domains)
+		return 0;
+
+	d = dvfsrc->dvd->domains;
+
+	if (pstate > dvfsrc->curr_opps->num_opp) {
+		dev_err(dvfsrc->dev, "pstate out of range = %ld\n", pstate);
+		return 0;
+	}
+
+	mutex_lock(&dvfsrc->pstate_lock);
+
+	for (i = 0, highest = 0; i < dvfsrc->dvd->num_domains; i++, d++) {
+		if (sc->domain_id == d->id) {
+			d->state = pstate;
+			match = true;
+		}
+		highest = max(highest, d->state);
+	}
+
+	if (!match)
+		goto out;
+
+	/* pstat start from level 1, array index start from 0 */
+	mtk_dvfsrc_send_request(dvfsrc->dev, MTK_DVFSRC_CMD_OPP_REQUEST,
+				highest - 1);
+
+out:
+	mutex_unlock(&dvfsrc->pstate_lock);
+	return 0;
+}
+
+static void pstate_notifier_register(struct mtk_dvfsrc *dvfsrc)
+{
+	dvfsrc->scpsys_notifier.notifier_call = dvfsrc_set_performance;
+	register_scpsys_notifier(&dvfsrc->scpsys_notifier);
+}
+
+static int mtk_dvfsrc_probe(struct platform_device *pdev)
+{
+	struct arm_smccc_res ares;
+	struct resource *res;
+	struct mtk_dvfsrc *dvfsrc;
+	int ret;
+
+	dvfsrc = devm_kzalloc(&pdev->dev, sizeof(*dvfsrc), GFP_KERNEL);
+	if (!dvfsrc)
+		return -ENOMEM;
+
+	dvfsrc->dvd = of_device_get_match_data(&pdev->dev);
+	dvfsrc->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	dvfsrc->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(dvfsrc->regs))
+		return PTR_ERR(dvfsrc->regs);
+
+	spin_lock_init(&dvfsrc->req_lock);
+	mutex_init(&dvfsrc->pstate_lock);
+
+	arm_smccc_smc(MTK_SIP_VCOREFS_CONTROL, MTK_SIP_DVFSRC_INIT, 0, 0, 0,
+		0, 0, 0, &ares);
+
+	if (!ares.a0) {
+		dvfsrc->dram_type = ares.a1;
+		dev_info(dvfsrc->dev, "dram_type: %d\n", dvfsrc->dram_type);
+	} else {
+		dev_err(dvfsrc->dev, "init fails: %lu\n", ares.a0);
+		return ares.a0;
+	}
+
+	dvfsrc->curr_opps = &dvfsrc->dvd->opps_desc[dvfsrc->dram_type];
+	platform_set_drvdata(pdev, dvfsrc);
+	if (dvfsrc->dvd->num_domains)
+		pstate_notifier_register(dvfsrc);
+
+	dvfsrc->regulator = platform_device_register_data(dvfsrc->dev,
+			"mtk-dvfsrc-regulator", -1, NULL, 0);
+	if (IS_ERR(dvfsrc->regulator)) {
+		dev_err(dvfsrc->dev, "Failed create regulator device\n");
+		ret = PTR_ERR(dvfsrc->regulator);
+		goto err;
+	}
+
+	dvfsrc->icc = platform_device_register_data(dvfsrc->dev,
+			"mediatek-emi-icc", -1, NULL, 0);
+	if (IS_ERR(dvfsrc->icc)) {
+		dev_err(dvfsrc->dev, "Failed create icc device\n");
+		ret = PTR_ERR(dvfsrc->icc);
+		goto unregister_regulator;
+	}
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret)
+		platform_device_unregister(dvfsrc->icc);
+
+	return 0;
+
+unregister_regulator:
+	platform_device_unregister(dvfsrc->regulator);
+err:
+	return ret;
+}
+
+static const struct dvfsrc_opp dvfsrc_opp_mt8183_lp4[] = {
+	{0, 0}, {0, 1}, {0, 2}, {1, 2},
+};
+
+static const struct dvfsrc_opp dvfsrc_opp_mt8183_lp3[] = {
+	{0, 0}, {0, 1}, {1, 1}, {1, 2},
+};
+
+static const struct dvfsrc_opp_desc dvfsrc_opp_mt8183_desc[] = {
+	DVFSRC_OPP_DESC(dvfsrc_opp_mt8183_lp4),
+	DVFSRC_OPP_DESC(dvfsrc_opp_mt8183_lp3),
+	DVFSRC_OPP_DESC(dvfsrc_opp_mt8183_lp3),
+};
+
+static struct dvfsrc_domain dvfsrc_domains_mt8183[] = {
+	{ MT8183_POWER_DOMAIN_MFG_ASYNC, 0 },
+	{ MT8183_POWER_DOMAIN_MFG, 0 },
+	{ MT8183_POWER_DOMAIN_CAM, 0 },
+	{ MT8183_POWER_DOMAIN_DISP, 0 },
+	{ MT8183_POWER_DOMAIN_ISP, 0 },
+	{ MT8183_POWER_DOMAIN_VDEC, 0 },
+	{ MT8183_POWER_DOMAIN_VENC, 0 },
+};
+
+static const struct dvfsrc_soc_data mt8183_data = {
+	.opps_desc = dvfsrc_opp_mt8183_desc,
+	.regs = mt8183_regs,
+	.domains = dvfsrc_domains_mt8183,
+	.num_domains = ARRAY_SIZE(dvfsrc_domains_mt8183),
+	.get_target_level = mt8183_get_target_level,
+	.get_current_level = mt8183_get_current_level,
+	.get_vcore_level = mt8183_get_vcore_level,
+	.set_dram_bw = mt8183_set_dram_bw,
+	.set_opp_level = mt8183_set_opp_level,
+	.set_vcore_level = mt8183_set_vcore_level,
+	.wait_for_opp_level = mt8183_wait_for_opp_level,
+	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level,
+};
+
+static const struct dvfsrc_opp dvfsrc_opp_mt6873_lp4[] = {
+	{0, 0}, {1, 0}, {2, 0}, {3, 0},
+	{0, 1}, {1, 1}, {2, 1}, {3, 1},
+	{0, 2}, {1, 2}, {2, 2}, {3, 2},
+	{1, 3}, {2, 3}, {3, 3}, {1, 4},
+	{2, 4}, {3, 4}, {2, 5}, {3, 5},
+	{3, 6},
+};
+
+static const struct dvfsrc_opp_desc dvfsrc_opp_mt6873_desc[] = {
+	DVFSRC_OPP_DESC(dvfsrc_opp_mt6873_lp4),
+};
+
+static const struct dvfsrc_soc_data mt6873_data = {
+	.opps_desc = dvfsrc_opp_mt6873_desc,
+	.regs = mt6873_regs,
+	.get_target_level = mt6873_get_target_level,
+	.get_current_level = mt6873_get_current_level,
+	.get_vcore_level = mt6873_get_vcore_level,
+	.get_vcp_level = mt6873_get_vcp_level,
+	.set_dram_bw = mt6873_set_dram_bw,
+	.set_dram_peak_bw = mt6873_set_dram_peak_bw,
+	.set_dram_hrtbw = mt6873_set_dram_hrtbw,
+	.set_vcore_level = mt6873_set_vcore_level,
+	.set_vscp_level = mt6873_set_vscp_level,
+	.wait_for_opp_level = mt6873_wait_for_opp_level,
+	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level,
+};
+
+static int mtk_dvfsrc_remove(struct platform_device *pdev)
+{
+	struct mtk_dvfsrc *dvfsrc = platform_get_drvdata(pdev);
+
+	platform_device_unregister(dvfsrc->regulator);
+	platform_device_unregister(dvfsrc->icc);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_dvfsrc_of_match[] = {
+	{
+		.compatible = "mediatek,mt8183-dvfsrc",
+		.data = &mt8183_data,
+	}, {
+		.compatible = "mediatek,mt8192-dvfsrc",
+		.data = &mt6873_data,
+	}, {
+		.compatible = "mediatek,mt6873-dvfsrc",
+		.data = &mt6873_data,
+	}, {
+		/* sentinel */
+	},
+};
+
+static struct platform_driver mtk_dvfsrc_driver = {
+	.probe	= mtk_dvfsrc_probe,
+	.remove	= mtk_dvfsrc_remove,
+	.driver = {
+		.name = "mtk-dvfsrc",
+		.of_match_table = of_match_ptr(mtk_dvfsrc_of_match),
+	},
+};
+
+static int __init mtk_dvfsrc_init(void)
+{
+	return platform_driver_register(&mtk_dvfsrc_driver);
+}
+subsys_initcall(mtk_dvfsrc_init);
+
+static void __exit mtk_dvfsrc_exit(void)
+{
+	platform_driver_unregister(&mtk_dvfsrc_driver);
+}
+module_exit(mtk_dvfsrc_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MTK DVFSRC driver");
diff --git a/include/linux/soc/mediatek/mtk_dvfsrc.h b/include/linux/soc/mediatek/mtk_dvfsrc.h
new file mode 100644
index 0000000..f2176b5
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk_dvfsrc.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+#ifndef __SOC_MTK_DVFSRC_H
+#define __SOC_MTK_DVFSRC_H
+
+#define MTK_DVFSRC_CMD_BW_REQUEST		0
+#define MTK_DVFSRC_CMD_OPP_REQUEST		1
+#define MTK_DVFSRC_CMD_VCORE_REQUEST		2
+#define MTK_DVFSRC_CMD_HRTBW_REQUEST		3
+#define MTK_DVFSRC_CMD_VSCP_REQUEST		4
+#define MTK_DVFSRC_CMD_PEAK_BW_REQUEST		5
+
+#define MTK_DVFSRC_CMD_VCORE_LEVEL_QUERY	0
+#define MTK_DVFSRC_CMD_VSCP_LEVEL_QUERY		1
+
+#if IS_ENABLED(CONFIG_MTK_DVFSRC)
+void mtk_dvfsrc_send_request(const struct device *dev, u32 cmd, u64 data);
+int mtk_dvfsrc_query_info(const struct device *dev, u32 cmd, int *data);
+
+#else
+
+static inline void mtk_dvfsrc_send_request(const struct device *dev, u32 cmd,
+					   u64 data)
+{ return -ENODEV; }
+
+static inline int mtk_dvfsrc_query_info(const struct device *dev, u32 cmd,
+					int *data);
+{ return -ENODEV; }
+
+#endif /* CONFIG_MTK_DVFSRC */
+
+#endif
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
