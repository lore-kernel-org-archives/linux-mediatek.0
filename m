Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2537DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 00:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UyWFen2vYVINXOcGAveBUfPFrGPQSo1nF2Bv2dtnls=; b=VWQUOriPZI7TiM
	yElKH5JGtdP8K+OCgEC0fXsPzY7JUGjJ/mHiEP72/jkl1Q8SUXlN3X7vg9t/gCKbgZC7u33CZz9cX
	FDdQURUjnjY+4dAlXEfJTaO1QT8bFNSLmRzhOL9UqMSI5Sl+rlN7z2O1C9ICaxJwSEew6llHi0wpZ
	tu10VS4FaLGjqOI9MVEtEslLabdo4G2fNDFvKcvrudbHLwyhaPwHVFYXU8EbS3k7+dX1ZBBmRrHRA
	cJZLxxrS+YHR/78DR7SgzK4mMhRFMI+suxoUYPiA0FJGxb9ayZVB5wbM7mwHC9pYvSUcq4wju42T7
	9K/R/xR0h+d9NdSim8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqOzs-005QaJ-KI; Mon, 16 May 2022 00:54:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqOzN-005QRx-Jl; Mon, 16 May 2022 00:53:36 +0000
X-UUID: 46dfaf0b3e1f4cbb9c3a9eba43f8ec44-20220515
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1669f739-c8da-437d-acb2-e285f23fadaf, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:087465a7-eab7-4b74-a74d-5359964535a9,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 46dfaf0b3e1f4cbb9c3a9eba43f8ec44-20220515
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1661961990; Sun, 15 May 2022 17:53:22 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 May 2022 17:43:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 16 May 2022 08:43:18 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 May 2022 08:43:18 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Subject: [PATCH v25 5/7] soc: mediatek: SVS: add debug commands
Date: Mon, 16 May 2022 08:43:09 +0800
Message-ID: <20220516004311.18358-6-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220516004311.18358-1-roger.lu@mediatek.com>
References: <20220516004311.18358-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_175333_728122_54E493E0 
X-CRM114-Status: GOOD (  20.00  )
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

The purpose of SVS is to help find the suitable voltages
for DVFS. Therefore, if SVS bank voltages are concerned
to be wrong, we can show/disable SVS bank voltages by
this patch.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/soc/mediatek/mtk-svs.c | 275 +++++++++++++++++++++++++++++++++
 1 file changed, 275 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 44ccad1e3327..aa0665725339 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/cpuidle.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -23,6 +24,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/thermal.h>
@@ -69,6 +71,39 @@
 
 static DEFINE_SPINLOCK(svs_lock);
 
+#define debug_fops_ro(name)						\
+	static int svs_##name##_debug_open(struct inode *inode,		\
+					   struct file *filp)		\
+	{								\
+		return single_open(filp, svs_##name##_debug_show,	\
+				   inode->i_private);			\
+	}								\
+	static const struct file_operations svs_##name##_debug_fops = {	\
+		.owner = THIS_MODULE,					\
+		.open = svs_##name##_debug_open,			\
+		.read = seq_read,					\
+		.llseek = seq_lseek,					\
+		.release = single_release,				\
+	}
+
+#define debug_fops_rw(name)						\
+	static int svs_##name##_debug_open(struct inode *inode,		\
+					   struct file *filp)		\
+	{								\
+		return single_open(filp, svs_##name##_debug_show,	\
+				   inode->i_private);			\
+	}								\
+	static const struct file_operations svs_##name##_debug_fops = {	\
+		.owner = THIS_MODULE,					\
+		.open = svs_##name##_debug_open,			\
+		.read = seq_read,					\
+		.write = svs_##name##_debug_write,			\
+		.llseek = seq_lseek,					\
+		.release = single_release,				\
+	}
+
+#define svs_dentry_data(name)	{__stringify(name), &svs_##name##_debug_fops}
+
 /**
  * enum svsb_phase - svs bank phase enumeration
  * @SVSB_PHASE_ERROR: svs bank encounters unexpected condition
@@ -268,6 +303,7 @@ struct svs_platform_data {
  * @tzone_name: thermal zone name
  * @phase: bank current phase
  * @volt_od: bank voltage overdrive
+ * @reg_data: bank register data in different phase for debug purpose
  * @pm_runtime_enabled_count: bank pm runtime enabled count
  * @mode_support: bank mode support.
  * @freq_base: reference frequency for bank init
@@ -326,6 +362,7 @@ struct svs_bank {
 	char *tzone_name;
 	enum svsb_phase phase;
 	s32 volt_od;
+	u32 reg_data[SVSB_PHASE_MAX][SVS_REG_MAX];
 	u32 pm_runtime_enabled_count;
 	u32 mode_support;
 	u32 freq_base;
@@ -467,6 +504,220 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 	return ret;
 }
 
+static int svs_dump_debug_show(struct seq_file *m, void *p)
+{
+	struct svs_platform *svsp = (struct svs_platform *)m->private;
+	struct svs_bank *svsb;
+	unsigned long svs_reg_addr;
+	u32 idx, i, j, bank_id;
+
+	for (i = 0; i < svsp->efuse_max; i++)
+		if (svsp->efuse && svsp->efuse[i])
+			seq_printf(m, "M_HW_RES%d = 0x%08x\n",
+				   i, svsp->efuse[i]);
+
+	for (i = 0; i < svsp->tefuse_max; i++)
+		if (svsp->tefuse)
+			seq_printf(m, "THERMAL_EFUSE%d = 0x%08x\n",
+				   i, svsp->tefuse[i]);
+
+	for (bank_id = 0, idx = 0; idx < svsp->bank_max; idx++, bank_id++) {
+		svsb = &svsp->banks[idx];
+
+		for (i = SVSB_PHASE_INIT01; i <= SVSB_PHASE_MON; i++) {
+			seq_printf(m, "Bank_number = %u\n", bank_id);
+
+			if (i == SVSB_PHASE_INIT01 || i == SVSB_PHASE_INIT02)
+				seq_printf(m, "mode = init%d\n", i);
+			else if (i == SVSB_PHASE_MON)
+				seq_puts(m, "mode = mon\n");
+			else
+				seq_puts(m, "mode = error\n");
+
+			for (j = DESCHAR; j < SVS_REG_MAX; j++) {
+				svs_reg_addr = (unsigned long)(svsp->base +
+							       svsp->regs[j]);
+				seq_printf(m, "0x%08lx = 0x%08x\n",
+					   svs_reg_addr, svsb->reg_data[i][j]);
+			}
+		}
+	}
+
+	return 0;
+}
+
+debug_fops_ro(dump);
+
+static int svs_enable_debug_show(struct seq_file *m, void *v)
+{
+	struct svs_bank *svsb = (struct svs_bank *)m->private;
+
+	switch (svsb->phase) {
+	case SVSB_PHASE_ERROR:
+		seq_puts(m, "disabled\n");
+		break;
+	case SVSB_PHASE_INIT01:
+		seq_puts(m, "init1\n");
+		break;
+	case SVSB_PHASE_INIT02:
+		seq_puts(m, "init2\n");
+		break;
+	case SVSB_PHASE_MON:
+		seq_puts(m, "mon mode\n");
+		break;
+	default:
+		seq_puts(m, "unknown\n");
+		break;
+	}
+
+	return 0;
+}
+
+static ssize_t svs_enable_debug_write(struct file *filp,
+				      const char __user *buffer,
+				      size_t count, loff_t *pos)
+{
+	struct svs_bank *svsb = file_inode(filp)->i_private;
+	struct svs_platform *svsp = dev_get_drvdata(svsb->dev);
+	unsigned long flags;
+	int enabled, ret;
+	char *buf = NULL;
+
+	if (count >= PAGE_SIZE)
+		return -EINVAL;
+
+	buf = (char *)memdup_user_nul(buffer, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	ret = kstrtoint(buf, 10, &enabled);
+	if (ret)
+		return ret;
+
+	if (!enabled) {
+		spin_lock_irqsave(&svs_lock, flags);
+		svsp->pbank = svsb;
+		svsb->mode_support = SVSB_MODE_ALL_DISABLE;
+		svs_switch_bank(svsp);
+		svs_writel_relaxed(svsp, SVSB_EN_OFF, SVSEN);
+		svs_writel_relaxed(svsp, SVSB_INTSTS_CLEAN, INTSTS);
+		spin_unlock_irqrestore(&svs_lock, flags);
+
+		svsb->phase = SVSB_PHASE_ERROR;
+		svs_adjust_pm_opp_volts(svsb);
+	}
+
+	kfree(buf);
+
+	return count;
+}
+
+debug_fops_rw(enable);
+
+static int svs_status_debug_show(struct seq_file *m, void *v)
+{
+	struct svs_bank *svsb = (struct svs_bank *)m->private;
+	struct dev_pm_opp *opp;
+	int tzone_temp = 0, ret;
+	u32 i;
+
+	ret = thermal_zone_get_temp(svsb->tzd, &tzone_temp);
+	if (ret)
+		seq_printf(m, "%s: temperature ignore\n", svsb->name);
+	else
+		seq_printf(m, "%s: temperature = %d\n", svsb->name, tzone_temp);
+
+	for (i = 0; i < svsb->opp_count; i++) {
+		opp = dev_pm_opp_find_freq_exact(svsb->opp_dev,
+						 svsb->opp_dfreq[i], true);
+		if (IS_ERR(opp)) {
+			seq_printf(m, "%s: cannot find freq = %u (%ld)\n",
+				   svsb->name, svsb->opp_dfreq[i],
+				   PTR_ERR(opp));
+			return PTR_ERR(opp);
+		}
+
+		seq_printf(m, "opp_freq[%02u]: %u, opp_volt[%02u]: %lu, ",
+			   i, svsb->opp_dfreq[i], i,
+			   dev_pm_opp_get_voltage(opp));
+		seq_printf(m, "svsb_volt[%02u]: 0x%x, freq_pct[%02u]: %u\n",
+			   i, svsb->volt[i], i, svsb->freq_pct[i]);
+		dev_pm_opp_put(opp);
+	}
+
+	return 0;
+}
+
+debug_fops_ro(status);
+
+static int svs_create_debug_cmds(struct svs_platform *svsp)
+{
+	struct svs_bank *svsb;
+	struct dentry *svs_dir, *svsb_dir, *file_entry;
+	const char *d = "/sys/kernel/debug/svs";
+	u32 i, idx;
+
+	struct svs_dentry {
+		const char *name;
+		const struct file_operations *fops;
+	};
+
+	struct svs_dentry svs_entries[] = {
+		svs_dentry_data(dump),
+	};
+
+	struct svs_dentry svsb_entries[] = {
+		svs_dentry_data(enable),
+		svs_dentry_data(status),
+	};
+
+	svs_dir = debugfs_create_dir("svs", NULL);
+	if (IS_ERR(svs_dir)) {
+		dev_err(svsp->dev, "cannot create %s: %ld\n",
+			d, PTR_ERR(svs_dir));
+		return PTR_ERR(svs_dir);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(svs_entries); i++) {
+		file_entry = debugfs_create_file(svs_entries[i].name, 0664,
+						 svs_dir, svsp,
+						 svs_entries[i].fops);
+		if (IS_ERR(file_entry)) {
+			dev_err(svsp->dev, "cannot create %s/%s: %ld\n",
+				d, svs_entries[i].name, PTR_ERR(file_entry));
+			return PTR_ERR(file_entry);
+		}
+	}
+
+	for (idx = 0; idx < svsp->bank_max; idx++) {
+		svsb = &svsp->banks[idx];
+
+		if (svsb->mode_support == SVSB_MODE_ALL_DISABLE)
+			continue;
+
+		svsb_dir = debugfs_create_dir(svsb->name, svs_dir);
+		if (IS_ERR(svsb_dir)) {
+			dev_err(svsp->dev, "cannot create %s/%s: %ld\n",
+				d, svsb->name, PTR_ERR(svsb_dir));
+			return PTR_ERR(svsb_dir);
+		}
+
+		for (i = 0; i < ARRAY_SIZE(svsb_entries); i++) {
+			file_entry = debugfs_create_file(svsb_entries[i].name,
+							 0664, svsb_dir, svsb,
+							 svsb_entries[i].fops);
+			if (IS_ERR(file_entry)) {
+				dev_err(svsp->dev, "no %s/%s/%s?: %ld\n",
+					d, svsb->name, svsb_entries[i].name,
+					PTR_ERR(file_entry));
+				return PTR_ERR(file_entry);
+			}
+		}
+	}
+
+	return 0;
+}
+
 static u32 interpolate(u32 f0, u32 f1, u32 v0, u32 v1, u32 fx)
 {
 	u32 vx;
@@ -591,6 +842,16 @@ static void svs_set_bank_phase(struct svs_platform *svsp,
 	}
 }
 
+static inline void svs_save_bank_register_data(struct svs_platform *svsp,
+					       enum svsb_phase phase)
+{
+	struct svs_bank *svsb = svsp->pbank;
+	enum svs_reg_index rg_i;
+
+	for (rg_i = DESCHAR; rg_i < SVS_REG_MAX; rg_i++)
+		svsb->reg_data[phase][rg_i] = svs_readl_relaxed(svsp, rg_i);
+}
+
 static inline void svs_error_isr_handler(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb = svsp->pbank;
@@ -605,6 +866,8 @@ static inline void svs_error_isr_handler(struct svs_platform *svsp)
 		svs_readl_relaxed(svsp, SMSTATE1));
 	dev_err(svsb->dev, "TEMP = 0x%08x\n", svs_readl_relaxed(svsp, TEMP));
 
+	svs_save_bank_register_data(svsp, SVSB_PHASE_ERROR);
+
 	svsb->phase = SVSB_PHASE_ERROR;
 	svs_writel_relaxed(svsp, SVSB_EN_OFF, SVSEN);
 	svs_writel_relaxed(svsp, SVSB_INTSTS_CLEAN, INTSTS);
@@ -619,6 +882,8 @@ static inline void svs_init01_isr_handler(struct svs_platform *svsp)
 		 svs_readl_relaxed(svsp, VDESIGN30),
 		 svs_readl_relaxed(svsp, DCVALUES));
 
+	svs_save_bank_register_data(svsp, SVSB_PHASE_INIT01);
+
 	svsb->phase = SVSB_PHASE_INIT01;
 	svsb->dc_voffset_in = ~(svs_readl_relaxed(svsp, DCVALUES) &
 				GENMASK(15, 0)) + 1;
@@ -644,6 +909,8 @@ static inline void svs_init02_isr_handler(struct svs_platform *svsp)
 		 svs_readl_relaxed(svsp, VOP30),
 		 svs_readl_relaxed(svsp, DCVALUES));
 
+	svs_save_bank_register_data(svsp, SVSB_PHASE_INIT02);
+
 	svsb->phase = SVSB_PHASE_INIT02;
 	svsb->get_volts(svsp);
 
@@ -655,6 +922,8 @@ static inline void svs_mon_mode_isr_handler(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb = svsp->pbank;
 
+	svs_save_bank_register_data(svsp, SVSB_PHASE_MON);
+
 	svsb->phase = SVSB_PHASE_MON;
 	svsb->get_volts(svsp);
 
@@ -1626,6 +1895,12 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_iounmap;
 	}
 
+	ret = svs_create_debug_cmds(svsp);
+	if (ret) {
+		dev_err(svsp->dev, "svs create debug cmds fail: %d\n", ret);
+		goto svs_probe_iounmap;
+	}
+
 	return 0;
 
 svs_probe_iounmap:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
