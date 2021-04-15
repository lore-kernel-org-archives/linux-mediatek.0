Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018F0C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 05:59:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5941161439
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 05:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5941161439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Jhica3Wm31pu89QPVFHgvNhzzBBcQisL5RpbCiY4E4=; b=pYyu6GCRiWv6erGY1yatNbNIo
	h7mZwbN0oV28Asp34NCX6ATuAvyAfOWjRY7CTAzRHxk9dM+MiyQbKgzfcvGeBfs3HZ6Teyk+i6tZ6
	u9JnHQ7E3rThQHww92mh/DLK7DAimkw6GssuLVmLwxobYuXPWfbaCVdFiIwnXuOrM4pJoTWZmNz91
	FjudKI3ZrSGkpxflnN8tToP6urV535+Ll8jsxwlhiIcfE/qMJFzZt/UOm4U0wmZEOBsvi/+q9PYvR
	laq7mh0nyKtyTXqcpU9qy8buUwlqrp9m97eno4m8lS7KeeS36U1DEkayQ5GqRgO9wcFvLoDkBKEjT
	fOD3PDOMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWv1g-00EyND-Bk; Thu, 15 Apr 2021 05:58:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv1X-00EyLe-KG; Thu, 15 Apr 2021 05:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=835S45q9ER0CurDO/9QxnZgdMqGxFuBsnz+QQye28VY=; b=cu16YSft5OsmkLYgHX1VYJiHum
 L+hVQx4/8hokjWmU8nGkN4awedo5e77D6cSg9x6nbeg260YScqCQEMDoGDjoAszSmB73X8wbZgQ1h
 CnWZgEMBzIe3N0c5rJcfywliZiMk68uIPSbHidsB9z2q4/Zp8alOkRt2jJOuKAVPlSO3MGZOr7lsD
 vihpB9UGOyWuvGpqCmDwLCw8IQv4Eo6qiXx9TDDKVkW9JDojOyd4TsYffhsORXfRzM92hn2sWV8OF
 g1qLUxd+7KQYttT0io97KyjEisQxMbGiDkq/sX9VLVvoGHjLlLAGUUKEsVC8I6po+5bqvhDnUbnKh
 x1soP3DQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWv1T-008IFU-UH; Thu, 15 Apr 2021 05:58:42 +0000
X-UUID: a65fd01b26b7435296249bbc6e770930-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=835S45q9ER0CurDO/9QxnZgdMqGxFuBsnz+QQye28VY=; 
 b=P+IlStYccr4RvKbEuAXd7mmY2mToFlQ9aMrYeDuJBUZpW3JnL2lIMw9CenNEZakT28p/BQsWz04im5lHQ7s/FOUk6JLXcuWrIVJqDSNGP2UglqQNx081NPJHlN9kKSZsfjKtmyoOwEN9VkaVbaJgxnj0xpfE7ZyG+FAyGDe5IOc=;
X-UUID: a65fd01b26b7435296249bbc6e770930-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1697590949; Wed, 14 Apr 2021 22:58:37 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 22:52:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 13:52:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 13:52:52 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>, 
 Chiawen Lee <chiawen.lee@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v2 5/7] soc: mediatek: apu: Add apusys and add apu power
 domain driver
Date: Thu, 15 Apr 2021 13:52:38 +0800
Message-ID: <1618465960-3013-6-git-send-email-flora.fu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B548C7EBE142BE01F37982FA6E166A88DD8CDA575C6AF79AF7744264FED230082000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_225840_022408_F2974D4C 
X-CRM114-Status: GOOD (  24.20  )
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

Add the apusys in soc.
Add driver for apu power domains.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 drivers/soc/mediatek/Kconfig             |  10 +
 drivers/soc/mediatek/Makefile            |   1 +
 drivers/soc/mediatek/apusys/Makefile     |   2 +
 drivers/soc/mediatek/apusys/mtk-apu-pm.c | 612 +++++++++++++++++++++++
 4 files changed, 625 insertions(+)
 create mode 100644 drivers/soc/mediatek/apusys/Makefile
 create mode 100644 drivers/soc/mediatek/apusys/mtk-apu-pm.c

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index fdd8bc08569e..76ee7e354b27 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -5,6 +5,16 @@
 menu "MediaTek SoC drivers"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 
+config MTK_APUSYS
+	bool "MediaTek APUSYS Support"
+	select REGMAP
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  Say yes here to add support for the MediaTek AI Processing Unit
+	  Subsystem(APUSYS).
+	  The APUSYS is a proprietary hardware in SoC to support AI
+	  operations.
+
 config MTK_CMDQ
 	tristate "MediaTek CMDQ Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index c916b6799baa..4ca2d59b75cb 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_MTK_APUSYS) += apusys/
 obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
 obj-$(CONFIG_MTK_DEVAPC) += mtk-devapc.o
 obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
diff --git a/drivers/soc/mediatek/apusys/Makefile b/drivers/soc/mediatek/apusys/Makefile
new file mode 100644
index 000000000000..01c339e35b80
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_MTK_APUSYS) += mtk-apu-pm.o
diff --git a/drivers/soc/mediatek/apusys/mtk-apu-pm.c b/drivers/soc/mediatek/apusys/mtk-apu-pm.c
new file mode 100644
index 000000000000..c21f8b4085fd
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/mtk-apu-pm.c
@@ -0,0 +1,612 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_clk.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define APU_PD_IPUIF_HW_CG		BIT(0)
+#define APU_PD_RPC_AUTO_BUCK		BIT(1)
+#define APU_PD_CAPS(_pd, _x)		((_pd)->data->caps & (_x))
+
+#define MTK_POLL_DELAY_US               10
+#define MTK_POLL_TIMEOUT                USEC_PER_SEC
+
+/*spm_cross_wake_m01*/
+#define WAKEUP_APU		(0x1 << 0)
+
+/* spm_other_pwr_status*/
+#define PWR_STATUS		(0x1 << 5)
+
+/* rpc_intf_pwr_rdy */
+#define PWR0_RDY		(0x1 << 0)
+
+/* rpc_top_con*/
+#define SLEEP_REQ		BIT(0)
+#define APU_BUCK_ELS_EN		BIT(3)
+
+/*conn_clr, conn1_clr, vcore_clr */
+#define CG_CLR	(0xFFFFFFFF)
+
+/* mt8192 rpc_sw_type */
+#define MT8192_RPC_SW_TYPE0	(0x200)
+#define MT8192_RPC_SW_TYPE1	(0x210)
+#define MT8192_RPC_SW_TYPE2	(0x220)
+#define MT8192_RPC_SW_TYPE3	(0x230)
+#define MT8192_RPC_SW_TYPE4	(0x240)
+#define MT8192_RPC_SW_TYPE6	(0x260)
+#define MT8192_RPC_SW_TYPE7	(0x270)
+
+/* rpc_sw_type*/
+static const struct reg_sequence mt8192_rpc_sw_type[] = {
+	{ MT8192_RPC_SW_TYPE0, 0xFF },
+	{ MT8192_RPC_SW_TYPE2, 0x7 },
+	{ MT8192_RPC_SW_TYPE3, 0x7 },
+	{ MT8192_RPC_SW_TYPE6, 0x3 },
+};
+
+struct apu_top_domain {
+	u32 spm_ext_buck_iso;
+	u32 spm_ext_buck_iso_mask;
+	u32 spm_cross_wake_m01;
+	u32 spm_other_pwr;
+	u32 conn_clr;
+	u32 conn1_clr;
+	u32 vcore_clr;
+	u32 rpc_top_con;
+	u32 rpc_top_con_init_mask;
+	u32 rpc_top_sel;
+	u32 rpc_top_intf_pwr_rdy;
+	const struct reg_sequence *rpc_sw_type;
+	int rpc_sw_ntype;
+};
+
+static struct apu_top_domain mt8192_top_reg = {
+	.spm_ext_buck_iso = 0x39C,
+	.spm_ext_buck_iso_mask = 0x21,
+	.spm_cross_wake_m01 = 0x670,
+	.spm_other_pwr = 0x178,
+	.conn_clr = 0x008,
+	.vcore_clr = 0x008,
+	.rpc_top_con = 0x000,
+	.rpc_top_con_init_mask = 0x49E,
+	.rpc_top_sel = 0x004,
+	.rpc_top_intf_pwr_rdy = 0x044,
+	.rpc_sw_type = mt8192_rpc_sw_type,
+	.rpc_sw_ntype = ARRAY_SIZE(mt8192_rpc_sw_type),
+};
+
+struct apusys {
+	struct device *dev;
+	struct regmap *scpsys;
+	struct regmap *conn;
+	struct regmap *conn1;
+	struct regmap *vcore;
+	struct regmap *rpc;
+	struct regulator *vsram_supply;
+	const struct apu_pm_data *data;
+	struct genpd_onecell_data pd_data;
+	struct generic_pm_domain *domains[];
+};
+
+struct apu_domain {
+	struct generic_pm_domain genpd;
+	const struct apu_domain_data *data;
+	struct apusys *apusys;
+	struct regulator *domain_supply;
+	int num_clks;
+	struct clk_bulk_data *clks;
+	struct clk *clk_top_conn;
+	struct clk *clk_top_ipu_if;
+	struct clk *clk_off;
+	struct clk *clk_on_def;
+};
+
+struct apu_domain_data {
+	int domain_idx;
+	char *name;
+	struct apu_top_domain *topd;
+	u8 caps;
+};
+
+struct apu_pm_data {
+	const struct apu_domain_data *domains_data;
+	int num_domains;
+};
+
+#define to_apu_domain(gpd) container_of(gpd, struct apu_domain, genpd)
+
+static int apu_top_init_hw(struct apu_domain *pd)
+{
+	struct apusys *apusys = pd->apusys;
+	int ret;
+
+	/*
+	 * set memory type to PD or sleep group
+	 * sw_type register for each memory group, set to PD mode default
+	 */
+	if (pd->data->topd->rpc_sw_ntype) {
+		ret = regmap_register_patch(apusys->rpc,
+					    pd->data->topd->rpc_sw_type,
+					    pd->data->topd->rpc_sw_ntype);
+		if (ret < 0) {
+			dev_err(apusys->dev, "Failed to rpc patch: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/* mask RPC IRQ and bypass WFI */
+	regmap_set_bits(apusys->rpc, pd->data->topd->rpc_top_sel,
+			pd->data->topd->rpc_top_con_init_mask);
+
+	if (APU_PD_CAPS(pd, APU_PD_RPC_AUTO_BUCK))
+		regmap_set_bits(apusys->rpc,
+				pd->data->topd->rpc_top_con, APU_BUCK_ELS_EN);
+
+	return 0;
+}
+
+static const struct apu_domain_data apu_domain_data_mt8192[] = {
+	{
+		.domain_idx = 0,
+		.name = "apu-top",
+		.caps = APU_PD_IPUIF_HW_CG,
+		.topd = &mt8192_top_reg,
+	}
+};
+
+static const struct apu_pm_data mt8192_apu_pm_data = {
+	.domains_data = apu_domain_data_mt8192,
+	.num_domains = ARRAY_SIZE(apu_domain_data_mt8192),
+};
+
+static int apu_top_power_on(struct generic_pm_domain *genpd)
+{
+	struct apu_domain *pd = to_apu_domain(genpd);
+	struct apusys *apusys = pd->apusys;
+	int ret, tmp;
+
+	if (apusys->vsram_supply) {
+		ret = regulator_enable(apusys->vsram_supply);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (pd->domain_supply) {
+		ret = regulator_enable(pd->domain_supply);
+		if (ret < 0)
+			goto err_regulator;
+	}
+
+	regmap_clear_bits(apusys->scpsys, pd->data->topd->spm_ext_buck_iso,
+			  pd->data->topd->spm_ext_buck_iso_mask);
+
+	if (APU_PD_CAPS(pd, APU_PD_IPUIF_HW_CG)) {
+		ret = clk_prepare_enable(pd->clk_top_conn);
+		if (ret) {
+			dev_err(apusys->dev, "Failed enable top_conn clk\n");
+			goto err_clk;
+		}
+
+		ret = clk_set_parent(pd->clk_top_ipu_if, pd->clk_on_def);
+		if (ret) {
+			dev_err(apusys->dev, "Failed set ipu_if mux\n");
+			goto err_clk;
+		}
+
+		/* The ipu_if clock is gatting by HW. Only enable once. */
+		if (!__clk_is_enabled(pd->clk_top_ipu_if)) {
+			ret = clk_prepare_enable(pd->clk_top_ipu_if);
+			if (ret) {
+				dev_err(apusys->dev, "Failed enable ipu_if\n");
+				goto err_clk;
+			}
+		}
+	} else {
+		ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
+		if (ret)
+			goto err_clk;
+	}
+
+	regmap_set_bits(apusys->scpsys,
+			pd->data->topd->spm_cross_wake_m01, WAKEUP_APU);
+
+	ret = regmap_read_poll_timeout(apusys->scpsys,
+				       pd->data->topd->spm_other_pwr,
+				       tmp, (tmp & PWR_STATUS) == PWR_STATUS,
+				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	if (ret < 0) {
+		dev_err(apusys->dev, "apu top on wait SPM PWR_ACK != 0\n");
+		goto err_clk;
+	}
+
+	ret = regmap_read_poll_timeout(apusys->rpc,
+				       pd->data->topd->rpc_top_intf_pwr_rdy,
+				       tmp, (tmp & PWR0_RDY) == PWR0_RDY,
+				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	if (ret < 0) {
+		dev_err(apusys->dev, "apu top on wait RPC PWR_RDY != 0\n");
+		goto err_clk;
+	}
+
+	if (apusys->vcore)
+		regmap_write(apusys->vcore, pd->data->topd->vcore_clr, CG_CLR);
+
+	if (apusys->conn)
+		regmap_write(apusys->conn, pd->data->topd->conn_clr, CG_CLR);
+
+	if (apusys->conn1)
+		regmap_write(apusys->conn1, pd->data->topd->conn1_clr, CG_CLR);
+
+	return 0;
+
+err_clk:
+	if (APU_PD_CAPS(pd, APU_PD_IPUIF_HW_CG)) {
+		clk_disable_unprepare(pd->clk_top_conn);
+		clk_disable_unprepare(pd->clk_top_ipu_if);
+	} else {
+		clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
+	}
+	if (pd->domain_supply)
+		ret = regulator_disable(pd->domain_supply);
+err_regulator:
+	if (apusys->vsram_supply)
+		ret = regulator_disable(apusys->vsram_supply);
+
+	return ret;
+}
+
+static int apu_top_power_off(struct generic_pm_domain *genpd)
+{
+	struct apu_domain *pd = to_apu_domain(genpd);
+	struct apusys *apusys = pd->apusys;
+	int ret, tmp;
+
+	if (apusys->vcore)
+		regmap_write(apusys->vcore, pd->data->topd->vcore_clr, CG_CLR);
+
+	if (apusys->conn)
+		regmap_write(apusys->conn, pd->data->topd->conn_clr, CG_CLR);
+
+	if (apusys->conn1)
+		regmap_write(apusys->conn1, pd->data->topd->conn1_clr, CG_CLR);
+
+	regmap_clear_bits(apusys->scpsys,
+			  pd->data->topd->spm_cross_wake_m01, WAKEUP_APU);
+
+	regmap_set_bits(apusys->rpc, pd->data->topd->rpc_top_con, SLEEP_REQ);
+
+	ret = regmap_read_poll_timeout(apusys->rpc,
+				       pd->data->topd->rpc_top_intf_pwr_rdy,
+				       tmp, (tmp & PWR0_RDY) == 0x0,
+				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	if (ret < 0) {
+		dev_err(apusys->dev, "apu top off wait RPC PWR_RDY != 0\n");
+		return ret;
+	}
+
+	ret = regmap_read_poll_timeout(apusys->scpsys,
+				       pd->data->topd->spm_other_pwr, tmp,
+				       (tmp & PWR_STATUS) == 0x0,
+				       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	if (ret < 0) {
+		dev_err(apusys->dev, "apu top off wait SPM PWR_ACK != 0\n");
+		return ret;
+	}
+
+	if (APU_PD_CAPS(pd, APU_PD_IPUIF_HW_CG)) {
+		clk_disable_unprepare(pd->clk_top_conn);
+		ret = clk_set_parent(pd->clk_top_ipu_if, pd->clk_off);
+		if (ret) {
+			dev_err(apusys->dev, "Failed set ipu_if rate\n");
+			return ret;
+		}
+	} else {
+		clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
+	}
+
+	regmap_set_bits(apusys->scpsys,
+			pd->data->topd->spm_ext_buck_iso,
+			pd->data->topd->spm_ext_buck_iso_mask);
+
+	if (apusys->vsram_supply) {
+		ret = regulator_disable(apusys->vsram_supply);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (pd->domain_supply) {
+		ret = regulator_disable(pd->domain_supply);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct generic_pm_domain *apu_add_one_domain(struct apusys *apusys,
+						    struct device_node *node)
+{
+	const struct apu_domain_data *domain_data;
+	struct apu_domain *pd;
+	int ret;
+	u32 id;
+
+	ret = of_property_read_u32(node, "reg", &id);
+	if (ret) {
+		dev_dbg(apusys->dev, "%pOF: invalid reg: %d\n", node, ret);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (id >= apusys->data->num_domains) {
+		dev_dbg(apusys->dev, "%pOF: invalid id %d\n", node, id);
+		return ERR_PTR(-EINVAL);
+	}
+
+	domain_data = &apusys->data->domains_data[id];
+
+	pd = devm_kzalloc(apusys->dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return ERR_PTR(-ENOMEM);
+
+	pd->data   = domain_data;
+	pd->apusys = apusys;
+
+	pd->domain_supply = devm_regulator_get_optional(apusys->dev, "domain");
+	if (IS_ERR(pd->domain_supply))
+		pd->domain_supply = NULL;
+
+	/*
+	 * For HW using ipu_if, the clock is switched to 26M
+	 * when power down top domain and switch to default clock rate
+	 * before power on.
+	 */
+	if (APU_PD_CAPS(pd, APU_PD_IPUIF_HW_CG)) {
+		pd->clk_top_conn = of_clk_get_by_name(node, "clk_top_conn");
+		if (IS_ERR(pd->clk_top_conn)) {
+			dev_err(apusys->dev, "Fail to get clk_top_conn clock\n");
+			ret = PTR_ERR(pd->clk_top_conn);
+			goto err_put_clocks;
+		}
+
+		pd->clk_top_ipu_if = of_clk_get_by_name(node, "clk_top_ipu_if");
+		if (IS_ERR(pd->clk_top_ipu_if)) {
+			dev_err(apusys->dev, "Fail to get clk_top_ipu_if clock\n");
+			ret = PTR_ERR(pd->clk_top_ipu_if);
+			goto err_put_clocks;
+		}
+
+		pd->clk_off = of_clk_get_by_name(node, "clk_off");
+		if (IS_ERR(pd->clk_off)) {
+			dev_err(apusys->dev, "Fail to get clk_off clock\n");
+			ret = PTR_ERR(pd->clk_off);
+			goto err_put_clocks;
+		}
+
+		pd->clk_on_def = of_clk_get_by_name(node, "clk_on_default");
+		if (IS_ERR(pd->clk_on_def)) {
+			dev_err(apusys->dev, "Fail to get clk_on_default clock\n");
+			ret = PTR_ERR(pd->clk_on_def);
+			goto err_put_clocks;
+		}
+	} else {
+		ret = devm_clk_bulk_get_all(apusys->dev, &pd->clks);
+		if (ret < 0) {
+			dev_err(apusys->dev, "failed to get clocks %d\n", ret);
+			return ERR_PTR(ret);
+		}
+		pd->num_clks = ret;
+	}
+
+	if (apusys->domains[id]) {
+		ret = -EINVAL;
+		dev_err(apusys->dev, "domain id %d already exists\n", id);
+		goto err_put_clocks;
+	}
+
+	/* set rpc hw init status */
+	ret = apu_top_init_hw(pd);
+	if (ret < 0) {
+		dev_dbg(apusys->dev, "top init fail ret = %d\n", ret);
+		goto err_put_clocks;
+	}
+
+	if (!pd->data->name)
+		pd->genpd.name = node->name;
+	else
+		pd->genpd.name = pd->data->name;
+	pd->genpd.power_off = apu_top_power_off;
+	pd->genpd.power_on = apu_top_power_on;
+
+	/*
+	 * Initially turn on all domains to make the domains usable
+	 * with !CONFIG_PM and to get the hardware in sync with the
+	 * software.  The unused domains will be switched off during
+	 * late_init time.
+	 */
+	ret = pd->genpd.power_on(&pd->genpd);
+	if (ret < 0) {
+		dev_dbg(apusys->dev, "%pOF: power on domain fail: %d\n",
+			node, ret);
+		goto err_put_clocks;
+	}
+
+	pm_genpd_init(&pd->genpd, NULL, false);
+
+	apusys->domains[id] = &pd->genpd;
+
+	return apusys->pd_data.domains[id];
+
+err_put_clocks:
+	if (APU_PD_CAPS(pd, APU_PD_IPUIF_HW_CG)) {
+		clk_put(pd->clk_top_conn);
+		clk_put(pd->clk_top_ipu_if);
+		clk_put(pd->clk_off);
+		clk_put(pd->clk_on_def);
+	}
+	return ERR_PTR(ret);
+}
+
+static void apu_remove_one_domain(struct apu_domain *pd)
+{
+	int ret;
+
+	if (pd->genpd.power_off)
+		pd->genpd.power_off(&pd->genpd);
+
+	/*
+	 * We're in the error cleanup already, so we only complain,
+	 * but won't emit another error on top of the original one.
+	 */
+	ret = pm_genpd_remove(&pd->genpd);
+	if (ret < 0)
+		dev_dbg(pd->apusys->dev,
+			"Remove domain '%s' : %d - state may be inconsistent\n",
+			pd->genpd.name, ret);
+
+	if (APU_PD_CAPS(pd, APU_PD_IPUIF_HW_CG)) {
+		clk_put(pd->clk_top_conn);
+		clk_put(pd->clk_top_ipu_if);
+		clk_put(pd->clk_off);
+		clk_put(pd->clk_on_def);
+	}
+}
+
+static void apu_domain_cleanup(struct apusys *apusys)
+{
+	struct generic_pm_domain *genpd;
+	struct apu_domain *pd;
+	int i;
+
+	for (i = apusys->pd_data.num_domains - 1; i >= 0; i--) {
+		genpd = apusys->pd_data.domains[i];
+		if (genpd) {
+			pd = to_apu_domain(genpd);
+			apu_remove_one_domain(pd);
+		}
+	}
+}
+
+static const struct of_device_id apu_pm_of_match[] = {
+	{
+		.compatible = "mediatek,mt8192-apu-pm",
+		.data = &mt8192_apu_pm_data,
+	},
+	{ }
+};
+
+static int apu_pm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct genpd_onecell_data *pd_data;
+	const struct apu_pm_data *data;
+	struct device_node *node;
+	struct apusys *apusys;
+	int ret;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data) {
+		dev_dbg(&pdev->dev, "no power domain data\n");
+		return -EINVAL;
+	}
+
+	apusys = devm_kzalloc(dev,
+			      struct_size(apusys, domains, data->num_domains),
+			      GFP_KERNEL);
+	if (!apusys)
+		return -ENOMEM;
+
+	apusys->dev = dev;
+	apusys->data = data;
+	apusys->pd_data.domains = apusys->domains;
+	apusys->pd_data.num_domains = data->num_domains;
+
+	apusys->vsram_supply = devm_regulator_get_optional(dev, "vsram");
+	if (IS_ERR(apusys->vsram_supply)) {
+		ret = PTR_ERR(apusys->vsram_supply);
+		if (ret != -EPROBE_DEFER) {
+			dev_err(dev, "vsram_supply fail, ret=%d", ret);
+			apusys->vsram_supply = NULL;
+		}
+		return ret;
+	}
+
+	/* rpc */
+	apusys->rpc = syscon_node_to_regmap(np);
+	if (IS_ERR(apusys->rpc)) {
+		dev_err(dev, "Unable to get rpc\n");
+		return PTR_ERR(apusys->rpc);
+	}
+
+	/* scpsys */
+	apusys->scpsys = syscon_regmap_lookup_by_phandle(np, "mediatek,scpsys");
+	if (IS_ERR(apusys->scpsys)) {
+		dev_err(dev, "Unable to get scpsys\n");
+		return PTR_ERR(apusys->scpsys);
+	}
+
+	/* apusys conn */
+	apusys->conn = syscon_regmap_lookup_by_phandle_optional(np, "mediatek,apu-conn");
+	if (IS_ERR(apusys->conn))
+		dev_info(dev, "No optional phandle apu_conn\n");
+
+	/* apusys conn1 */
+	apusys->conn1 = syscon_regmap_lookup_by_phandle_optional(np, "mediatek,apu-conn1");
+	if (IS_ERR(apusys->conn1))
+		dev_info(dev, "No optional phandle apu_conn1\n");
+
+	/* apusys vcore */
+	apusys->vcore = syscon_regmap_lookup_by_phandle_optional(np, "mediatek,apu-vcore");
+	if (IS_ERR(apusys->vcore))
+		dev_info(dev, "No optional phandle apu_vcore\n");
+
+	for_each_available_child_of_node(np, node) {
+		struct generic_pm_domain *domain;
+
+		domain = apu_add_one_domain(apusys, node);
+		if (IS_ERR(domain)) {
+			ret = PTR_ERR(domain);
+			of_node_put(node);
+			goto err_cleanup_domains;
+		}
+	}
+
+	ret = of_genpd_add_provider_onecell(np, &apusys->pd_data);
+	if (ret) {
+		dev_dbg(dev, "failed to add provider: %d\n", ret);
+		goto err_cleanup_domains;
+	}
+
+	pd_data = &apusys->pd_data;
+
+	return 0;
+
+err_cleanup_domains:
+	apu_domain_cleanup(apusys);
+	return ret;
+}
+
+static struct platform_driver apu_pm_driver = {
+	.probe = apu_pm_probe,
+	.driver = {
+		.name = "mtk-apu-pm",
+		.suppress_bind_attrs = true,
+		.of_match_table = apu_pm_of_match,
+	},
+};
+builtin_platform_driver(apu_pm_driver);
+
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
