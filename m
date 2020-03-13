Return-Path: <SRS0=2fV0=46=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02D6C4CECE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:35:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D9820746
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jlJN8gU1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hOdrwW+f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3D9820746
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBm1wW8nkWyTOFWJmdNKR83PfCv2sgyGUOaEIm4fxqw=; b=jlJN8gU1E+jrYb
	cghd2qLyXWY6CX/xsh7kl+U27yV53gU23+b29Ix2zTKTTTIhloCWfW0U+bLfDMhZnF9IfDGU+EMSK
	Do+9rgb5q2M/lLgassiHoDSe5yQWad+DnYTv3bqMTWhYPWgbjtW9WZLe9ojnKc2Nxg1yMqtrpU3QE
	byN1lyq+xJGfeVckGm3OxPZ7R/i19or0mohmWMmuUCo8EC0JA4jO9UO+uqw3IdvLCSFNUy6/lmGWr
	GgRc0JEiLDiUWIL2tPrZXmcUbtRzS8UWwdSaH4cVjG8nI7PuC2/HjjXZbHjqFYUMusRXO54v//hAp
	gWmSqG3pqq/jO+oCUF2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgiX-00061r-5K; Fri, 13 Mar 2020 09:34:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgiD-0005gy-4S; Fri, 13 Mar 2020 09:34:39 +0000
X-UUID: e763018ca5e44e6fbab2043218c0665b-20200313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zExW2URhkKjviTYR3CaVYGGXfCHDwBC3OUgJOe+y4WM=; 
 b=hOdrwW+fMXR1iOy1QDdIZGXUUyg91e6jmDXH0p4RBnAV0Zf+wJVSHQGQXR912b1hYmclRE42Y0lMu8trzebGS7QQX44Xv3edLeCwfIO7GFgT0+RWZ6hp1pZ+97eqwzt6sJbXSDixINGOynJ8jee5oBkKwNql2Jc8kyPL+YKNPU4=;
X-UUID: e763018ca5e44e6fbab2043218c0665b-20200313
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 457823317; Fri, 13 Mar 2020 01:34:32 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 02:34:31 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 17:33:00 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 13 Mar 2020 17:33:41 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case
 <ryandcase@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH V4 06/13] soc: mediatek: add MT8183 dvfsrc support
Date: Fri, 13 Mar 2020 17:34:19 +0800
Message-ID: <1584092066-24425-7-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
References: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_023437_199233_AC12B46C 
X-CRM114-Status: GOOD (  19.94  )
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
 Mike Turquette <mturquette@linaro.org>, srv_heupstream@mediatek.com,
 James Liao <jamesjj.liao@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Arvin Wang <arvin.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add dvfsrc driver for MT8183

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/soc/mediatek/Kconfig      |  15 ++
 drivers/soc/mediatek/Makefile     |   1 +
 drivers/soc/mediatek/mtk-dvfsrc.c | 434 ++++++++++++++++++++++++++++++++++++++
 include/soc/mediatek/mtk_dvfsrc.h |  30 +++
 4 files changed, 480 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
 create mode 100644 include/soc/mediatek/mtk_dvfsrc.h

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index f837b3c..44808f4 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -16,6 +16,21 @@ config MTK_CMDQ
 	  time limitation, such as updating display configuration during the
 	  vblank.
 
+config MTK_DVFSRC
+	bool "MediaTek DVFSRC Support"
+	depends on ARCH_MEDIATEK
+	default ARCH_MEDIATEK
+	select MTK_INFRACFG
+	select PM_GENERIC_DOMAINS if PM
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
index 2b2c2537..84182f0 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
+obj-$(CONFIG_MTK_DVFSRC) += mtk-dvfsrc.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
new file mode 100644
index 0000000..85b3572
--- /dev/null
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 MediaTek Inc.
+ */
+#include <linux/arm-smccc.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <soc/mediatek/mtk_dvfsrc.h>
+#include <soc/mediatek/mtk_sip.h>
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
+struct mtk_dvfsrc;
+struct dvfsrc_soc_data {
+	const int *regs;
+	u32 num_opp;
+	u32 num_domains;
+	const struct dvfsrc_opp **opps;
+	struct dvfsrc_domain *domains;
+	int (*get_target_level)(struct mtk_dvfsrc *dvfsrc);
+	int (*get_current_level)(struct mtk_dvfsrc *dvfsrc);
+	u32 (*get_vcore_level)(struct mtk_dvfsrc *dvfsrc);
+	void (*set_dram_bw)(struct mtk_dvfsrc *dvfsrc, u64 bw);
+	void (*set_opp_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
+	void (*set_vcore_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
+	int (*wait_for_opp_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
+	int (*wait_for_vcore_level)(struct mtk_dvfsrc *dvfsrc, u32 level);
+};
+
+struct mtk_dvfsrc {
+	struct device *dev;
+	struct clk *clk_dvfsrc;
+	const struct dvfsrc_soc_data *dvd;
+	int dram_type;
+	void __iomem *regs;
+	struct mutex req_lock;
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
+enum dvfsrc_regs {
+	DVFSRC_SW_REQ,
+	DVFSRC_SW_REQ2,
+	DVFSRC_LEVEL,
+	DVFSRC_SW_BW,
+	DVFSRC_LAST,
+};
+
+static const int mt8183_regs[] = {
+	[DVFSRC_SW_REQ] =	0x4,
+	[DVFSRC_SW_REQ2] =	0x8,
+	[DVFSRC_LEVEL] =	0xDC,
+	[DVFSRC_SW_BW] =	0x160,
+	[DVFSRC_LAST] =		0x308,
+};
+
+static const struct dvfsrc_opp *get_current_opp(struct mtk_dvfsrc *dvfsrc)
+{
+	int level;
+
+	level = dvfsrc->dvd->get_current_level(dvfsrc);
+	return &dvfsrc->dvd->opps[dvfsrc->dram_type][level];
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
+static int mt8183_wait_for_opp_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	const struct dvfsrc_opp *target, *curr;
+	int ret;
+
+	target = &dvfsrc->dvd->opps[dvfsrc->dram_type][level];
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
+	dvfsrc_write(dvfsrc, DVFSRC_SW_BW, kbps_to_mbps(bw) / 100);
+}
+
+static void mt8183_set_opp_level(struct mtk_dvfsrc *dvfsrc, u32 level)
+{
+	int vcore_opp, dram_opp;
+	const struct dvfsrc_opp *opp;
+
+	/* translate pstate to dvfsrc level, and set it to DVFSRC HW */
+	opp = &dvfsrc->dvd->opps[dvfsrc->dram_type][level];
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
+	mutex_lock(&dvfsrc->req_lock);
+
+	switch (cmd) {
+	case MTK_DVFSRC_CMD_BW_REQUEST:
+		dvfsrc->dvd->set_dram_bw(dvfsrc, data);
+		goto out;
+	case MTK_DVFSRC_CMD_OPP_REQUEST:
+		dvfsrc->dvd->set_opp_level(dvfsrc, data);
+		break;
+	case MTK_DVFSRC_CMD_VCORE_REQUEST:
+		dvfsrc->dvd->set_vcore_level(dvfsrc, data);
+		break;
+	default:
+		dev_err(dvfsrc->dev, "unknown command: %d\n", cmd);
+		goto out;
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
+		goto out;
+	}
+
+	if (cmd == MTK_DVFSRC_CMD_OPP_REQUEST)
+		dvfsrc->dvd->wait_for_opp_level(dvfsrc, data);
+	else
+		dvfsrc->dvd->wait_for_vcore_level(dvfsrc, data);
+
+out:
+	mutex_unlock(&dvfsrc->req_lock);
+}
+EXPORT_SYMBOL(mtk_dvfsrc_send_request);
+
+int mtk_dvfsrc_query_info(const struct device *dev, u32 cmd, int *data)
+{
+	struct mtk_dvfsrc *dvfsrc = dev_get_drvdata(dev);
+
+	switch (cmd) {
+	case MTK_DVFSRC_CMD_VCORE_QUERY:
+		*data = dvfsrc->dvd->get_vcore_level(dvfsrc);
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
+	d = dvfsrc->dvd->domains;
+
+	if (pstate > dvfsrc->dvd->num_opp) {
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
+	dvfsrc->clk_dvfsrc = devm_clk_get(dvfsrc->dev, "dvfsrc");
+	if (IS_ERR(dvfsrc->clk_dvfsrc)) {
+		dev_err(dvfsrc->dev, "failed to get clock: %ld\n",
+			PTR_ERR(dvfsrc->clk_dvfsrc));
+		return PTR_ERR(dvfsrc->clk_dvfsrc);
+	}
+
+	ret = clk_prepare_enable(dvfsrc->clk_dvfsrc);
+	if (ret)
+		return ret;
+
+	mutex_init(&dvfsrc->req_lock);
+	mutex_init(&dvfsrc->pstate_lock);
+
+	arm_smccc_smc(MTK_SIP_SPM, MTK_SIP_SPM_DVFSRC_INIT, 0, 0, 0, 0, 0, 0,
+		      &ares);
+
+	if (!ares.a0) {
+		dvfsrc->dram_type = ares.a1;
+		dev_info(dvfsrc->dev, "dram_type: %d\n", dvfsrc->dram_type);
+	} else {
+		dev_err(dvfsrc->dev, "init fails: %lu\n", ares.a0);
+		clk_disable_unprepare(dvfsrc->clk_dvfsrc);
+		return ares.a0;
+	}
+
+	platform_set_drvdata(pdev, dvfsrc);
+	pstate_notifier_register(dvfsrc);
+
+	return devm_of_platform_populate(&pdev->dev);
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
+static const struct dvfsrc_opp *dvfsrc_opp_mt8183[] = {
+	[MT8183_DVFSRC_OPP_LP4] = dvfsrc_opp_mt8183_lp4,
+	[MT8183_DVFSRC_OPP_LP4X] = dvfsrc_opp_mt8183_lp3,
+	[MT8183_DVFSRC_OPP_LP3] = dvfsrc_opp_mt8183_lp3,
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
+	.opps = dvfsrc_opp_mt8183,
+	.num_opp = ARRAY_SIZE(dvfsrc_opp_mt8183_lp4),
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
+static int mtk_dvfsrc_remove(struct platform_device *pdev)
+{
+	struct mtk_dvfsrc *dvfsrc = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(dvfsrc->clk_dvfsrc);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_dvfsrc_of_match[] = {
+	{
+		.compatible = "mediatek,mt8183-dvfsrc",
+		.data = &mt8183_data,
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
diff --git a/include/soc/mediatek/mtk_dvfsrc.h b/include/soc/mediatek/mtk_dvfsrc.h
new file mode 100644
index 0000000..06ad201
--- /dev/null
+++ b/include/soc/mediatek/mtk_dvfsrc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+#ifndef __SOC_MTK_DVFSRC_H
+#define __SOC_MTK_DVFSRC_H
+
+#define MTK_DVFSRC_CMD_BW_REQUEST	0
+#define MTK_DVFSRC_CMD_OPP_REQUEST	1
+#define MTK_DVFSRC_CMD_VCORE_REQUEST	2
+
+#define MTK_DVFSRC_CMD_VCORE_QUERY	0
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
