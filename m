Return-Path: <SRS0=oN25=F7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3334EC4332D
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Dec 2020 10:56:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87AD224B8
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Dec 2020 10:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D87AD224B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QUN8BxWaYHS2vFktg9Ep4jj70p98UQVAtOmzEUWvC6g=; b=SFFz37pUlojnQaKN+zdmJnl+n
	GDivQv3DPddupRUyo7ADwGGmWJ5OZg0elVq3zyP418ATi4TJx62UREVMdGpO7duWj/PAVtfxIpPBc
	T5YQfZjla5syXDohjWvNxsgm9ythhjJuLhJKoPmZtGNw5CQ59BqAv7DwOIAT0NPWu0LbWmAxKqgBG
	tF06n7e6ap6IrKX2LJHDi8n5ztNZyuOWvFLec1lZ/XL/ctYLaiubUDiWUBgM4JTR3t82pnQEuMrDC
	e+IdndBer7RWdUPikPkWzfTtMUbvhc1tbJ/Jf073QAh56CsLWak5mqj6vJ70iy9M/kQ/H7XjGwB1e
	dlmdk5jpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktTiK-0002mf-Fn; Sun, 27 Dec 2020 10:55:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktTi2-0002eK-7G; Sun, 27 Dec 2020 10:55:36 +0000
X-UUID: 9d7dfc07ccee41a789696fa9da3a5d19-20201227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=w8+IEaGwAIEqqRSfxiJ6QM1s1vKxFLJDUKf1V4kp8YA=; 
 b=j/4mNL2sJLR0u2yTEHDTTk/tLbOLN/+EAayzbb3z6Xh9h3zJ19NCIqGOf9WeU4Tn3FJ41NqzHXoMIBs4um5is7EmBE3NndFzE5Qe1qBzyHU2QjcslHUI223NWtKIs9NGttXPKyfYVfDa9+nYkPm6ZjhNKkkk3xfIfecaMW3gtxE=;
X-UUID: 9d7dfc07ccee41a789696fa9da3a5d19-20201227
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 528915124; Sun, 27 Dec 2020 02:55:23 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Dec 2020 02:56:31 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Dec 2020 18:56:17 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 27 Dec 2020 18:56:17 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 4/7] [v10,4/7]: soc: mediatek: SVS: add debug commands
Date: Sun, 27 Dec 2020 18:54:46 +0800
Message-ID: <20201227105449.11452-5-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201227105449.11452-1-roger.lu@mediatek.com>
References: <20201227105449.11452-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9DFC2110B3273738D29C72154DC976B14F96E737D79865F6ED15D8432CA11F9E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201227_055534_543859_43352849 
X-CRM114-Status: GOOD (  19.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 Angus Lin <Angus.Lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Roger Lu <roger.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The purpose of SVS is to help find the suitable voltages
for DVFS. Therefore, if SVS bank voltages are concerned
to be wrong, we can adjust SVS bank voltages by this patch.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 324 +++++++++++++++++++++++++++++++++
 1 file changed, 324 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 0efefb48839d..ef3aeb4b7dbd 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -6,6 +6,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -24,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/thermal.h>
@@ -60,6 +62,39 @@
 #define SVSB_INTSTS_COMPLETE		0x1
 #define SVSB_INTSTS_CLEAN		0x00ffffff
 
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
+#define svs_dentry(name)	{__stringify(name), &svs_##name##_debug_fops}
+
 static DEFINE_SPINLOCK(mtk_svs_lock);
 
 /*
@@ -238,6 +273,7 @@ struct thermal_parameter {
  * @opp_volts: signed-off voltages from default opp table
  * @freqs_pct: percent of "opp_freqs / freq_base" for bank init
  * @volts: bank voltages
+ * @reg_data: bank register data of each phase
  * @freq_base: reference frequency for bank init
  * @vboot: voltage request for bank init01 stage only
  * @volt_step: bank voltage step
@@ -257,6 +293,7 @@ struct thermal_parameter {
  * @opp_count: bank opp count
  * @int_st: bank interrupt identification
  * @sw_id: bank software identification
+ * @hw_id: bank hardware identification
  * @ctl0: bank thermal sensor selection
  * @cpu_id: cpu core id for SVS CPU only
  * @name: bank name
@@ -281,6 +318,7 @@ struct svs_bank {
 	u32 opp_volts[16];
 	u32 freqs_pct[16];
 	u32 volts[16];
+	u32 reg_data[3][reg_num];
 	u32 freq_base;
 	u32 vboot;
 	u32 volt_step;
@@ -319,6 +357,7 @@ struct svs_bank {
 	u32 opp_count;
 	u32 int_st;
 	u32 sw_id;
+	u32 hw_id;
 	u32 ctl0;
 	u32 cpu_id;
 	u8 *name;
@@ -658,11 +697,15 @@ static void svs_set_bank_phase(struct svs_platform *svsp, u32 target_phase)
 static inline void svs_init01_isr_handler(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb = svsp->pbank;
+	enum svs_reg_index rg_i;
 
 	dev_info(svsb->dev, "%s: VDN74~30:0x%08x~0x%08x, DC:0x%08x\n",
 		 __func__, svs_readl(svsp, VDESIGN74),
 		 svs_readl(svsp, VDESIGN30), svs_readl(svsp, DCVALUES));
 
+	for (rg_i = DESCHAR; rg_i < reg_num; rg_i++)
+		svsb->reg_data[SVSB_PHASE_INIT01][rg_i] = svs_readl(svsp, rg_i);
+
 	svsb->phase = SVSB_PHASE_INIT01;
 	svsb->dc_voffset_in = ~(svs_readl(svsp, DCVALUES) & GENMASK(15, 0)) + 1;
 	if (svsb->init01_volt_flag == SVSB_INIT01_VOLT_IGNORE)
@@ -683,11 +726,15 @@ static inline void svs_init01_isr_handler(struct svs_platform *svsp)
 static inline void svs_init02_isr_handler(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb = svsp->pbank;
+	enum svs_reg_index rg_i;
 
 	dev_info(svsb->dev, "%s: VOP74~30:0x%08x~0x%08x, DC:0x%08x\n",
 		 __func__, svs_readl(svsp, VOP74), svs_readl(svsp, VOP30),
 		 svs_readl(svsp, DCVALUES));
 
+	for (rg_i = DESCHAR; rg_i < reg_num; rg_i++)
+		svsb->reg_data[SVSB_PHASE_INIT02][rg_i] = svs_readl(svsp, rg_i);
+
 	svsb->phase = SVSB_PHASE_INIT02;
 	svsp->get_vops(svsp);
 
@@ -698,6 +745,10 @@ static inline void svs_init02_isr_handler(struct svs_platform *svsp)
 static inline void svs_mon_mode_isr_handler(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb = svsp->pbank;
+	enum svs_reg_index rg_i;
+
+	for (rg_i = DESCHAR; rg_i < reg_num; rg_i++)
+		svsb->reg_data[SVSB_PHASE_MON][rg_i] = svs_readl(svsp, rg_i);
 
 	svsb->phase = SVSB_PHASE_MON;
 	svsb->temp = svs_readl(svsp, TEMP) & GENMASK(7, 0);
@@ -709,6 +760,7 @@ static inline void svs_mon_mode_isr_handler(struct svs_platform *svsp)
 static inline void svs_error_isr_handler(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb = svsp->pbank;
+	enum svs_reg_index rg_i;
 
 	dev_err(svsb->dev, "%s: CORESEL = 0x%08x\n",
 		__func__, svs_readl(svsp, CORESEL));
@@ -718,6 +770,9 @@ static inline void svs_error_isr_handler(struct svs_platform *svsp)
 		svs_readl(svsp, SMSTATE0), svs_readl(svsp, SMSTATE1));
 	dev_err(svsb->dev, "TEMP = 0x%08x\n", svs_readl(svsp, TEMP));
 
+	for (rg_i = DESCHAR; rg_i < reg_num; rg_i++)
+		svsb->reg_data[SVSB_PHASE_MON][rg_i] = svs_readl(svsp, rg_i);
+
 	svsb->mode_support = SVSB_MODE_ALL_DISABLE;
 	svsb->phase = SVSB_PHASE_ERROR;
 
@@ -1446,9 +1501,269 @@ static int svs_resume(struct device *dev)
 	return 0;
 }
 
+/*
+ * svs_dump_debug_show - dump svs/thermal efuse and svs banks' registers
+ */
+static int svs_dump_debug_show(struct seq_file *m, void *p)
+{
+	struct svs_platform *svsp = (struct svs_platform *)m->private;
+	struct svs_bank *svsb;
+	unsigned long svs_reg_addr;
+	u32 idx, i, j;
+
+	for (i = 0; i < svsp->efuse_num; i++)
+		if (svsp->efuse && svsp->efuse[i])
+			seq_printf(m, "M_HW_RES%d = 0x%08x\n",
+				   i, svsp->efuse[i]);
+
+	for (i = 0; i < svsp->tefuse_num; i++)
+		if (svsp->tefuse)
+			seq_printf(m, "THERMAL_EFUSE%d = 0x%08x\n",
+				   i, svsp->tefuse[i]);
+
+	for (idx = 0; idx < svsp->bank_num; idx++) {
+		svsb = &svsp->banks[idx];
+
+		for (i = SVSB_PHASE_INIT01; i <= SVSB_PHASE_MON; i++) {
+			seq_printf(m, "Bank_number = %u\n", svsb->hw_id);
+
+			if (i < SVSB_PHASE_MON)
+				seq_printf(m, "mode = init%d\n", i + 1);
+			else
+				seq_puts(m, "mode = mon\n");
+
+			for (j = DESCHAR; j < reg_num; j++) {
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
+/*
+ * svs_enable_debug_show - show svs bank current enable phase
+ */
+static int svs_enable_debug_show(struct seq_file *m, void *v)
+{
+	struct svs_bank *svsb = (struct svs_bank *)m->private;
+
+	if (svsb->phase == SVSB_PHASE_INIT01)
+		seq_puts(m, "init1\n");
+	else if (svsb->phase == SVSB_PHASE_INIT02)
+		seq_puts(m, "init2\n");
+	else if (svsb->phase == SVSB_PHASE_MON)
+		seq_puts(m, "mon mode\n");
+	else if (svsb->phase == SVSB_PHASE_ERROR)
+		seq_puts(m, "disabled\n");
+	else
+		seq_puts(m, "unknown\n");
+
+	return 0;
+}
+
+/*
+ * svs_enable_debug_write - we only support svs bank disable control
+ */
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
+		spin_lock_irqsave(&mtk_svs_lock, flags);
+		svsp->pbank = svsb;
+		svsb->mode_support = SVSB_MODE_ALL_DISABLE;
+		svs_switch_bank(svsp);
+		svs_writel(svsp, SVSB_EN_OFF, SVSEN);
+		svs_writel(svsp, SVSB_INTSTS_CLEAN, INTSTS);
+		spin_unlock_irqrestore(&mtk_svs_lock, flags);
+
+		svsb->phase = SVSB_PHASE_ERROR;
+		svs_adjust_pm_opp_volts(svsb, true);
+	}
+
+	kfree(buf);
+
+	return count;
+}
+
+debug_fops_rw(enable);
+
+/*
+ * svs_status_debug_show - show svs bank's tzone_temp/voltages/freqs_pct
+ * and its corresponding opp-table's opp_freqs/opp_volts
+ */
+static int svs_status_debug_show(struct seq_file *m, void *v)
+{
+	struct svs_bank *svsb = (struct svs_bank *)m->private;
+	struct dev_pm_opp *opp;
+	int tzone_temp, ret;
+	u32 i;
+
+	ret = svs_get_bank_zone_temperature(svsb->tzone_name, &tzone_temp);
+	if (ret)
+		seq_printf(m, "%s: no \"%s\" zone?\n", svsb->name,
+			   svsb->tzone_name);
+	else
+		seq_printf(m, "%s: temperature = %d\n", svsb->name, tzone_temp);
+
+	for (i = 0; i < svsb->opp_count; i++) {
+		opp = dev_pm_opp_find_freq_exact(svsb->opp_dev,
+						 svsb->opp_freqs[i], true);
+		if (IS_ERR(opp)) {
+			seq_printf(m, "%s: cannot find freq = %u (%ld)\n",
+				   svsb->name, svsb->opp_freqs[i],
+				   PTR_ERR(opp));
+			return PTR_ERR(opp);
+		}
+
+		seq_printf(m, "opp_freqs[%02u]: %u, opp_volts[%02u]: %lu, ",
+			   i, svsb->opp_freqs[i], i,
+			   dev_pm_opp_get_voltage(opp));
+		seq_printf(m, "svsb_volts[%02u]: 0x%x, freqs_pct[%02u]: %u\n",
+			   i, svsb->volts[i], i, svsb->freqs_pct[i]);
+		dev_pm_opp_put(opp);
+	}
+
+	return 0;
+}
+
+debug_fops_ro(status);
+
+/*
+ * svs_volt_offset_debug_show - show svs bank's voltage offset
+ */
+static int svs_volt_offset_debug_show(struct seq_file *m, void *v)
+{
+	struct svs_bank *svsb = (struct svs_bank *)m->private;
+
+	seq_printf(m, "%d\n", svsb->volt_offset);
+
+	return 0;
+}
+
+/*
+ * svs_volt_offset_debug_write - write svs bank's voltage offset
+ */
+static ssize_t svs_volt_offset_debug_write(struct file *filp,
+					   const char __user *buffer,
+					   size_t count, loff_t *pos)
+{
+	struct svs_bank *svsb = file_inode(filp)->i_private;
+	char *buf = NULL;
+	s32 volt_offset;
+
+	if (count >= PAGE_SIZE)
+		return -EINVAL;
+
+	buf = (char *)memdup_user_nul(buffer, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	if (!kstrtoint(buf, 10, &volt_offset)) {
+		svsb->volt_offset = volt_offset;
+		svs_adjust_pm_opp_volts(svsb, true);
+	}
+
+	kfree(buf);
+
+	return count;
+}
+
+debug_fops_rw(volt_offset);
+
+static int svs_create_svs_debug_cmds(struct svs_platform *svsp)
+{
+	struct svs_bank *svsb;
+	struct dentry *svs_dir, *svsb_dir, *file_entry;
+	static const char *d = "/sys/kernel/debug/svs";
+	u32 i, idx;
+
+	struct svs_dentry {
+		const char *name;
+		const struct file_operations *fops;
+	};
+
+	struct svs_dentry svs_entries[] = {
+		svs_dentry(dump),
+	};
+
+	struct svs_dentry svsb_entries[] = {
+		svs_dentry(enable),
+		svs_dentry(status),
+		svs_dentry(volt_offset),
+	};
+
+	svs_dir = debugfs_create_dir("svs", NULL);
+	if (IS_ERR(svs_dir)) {
+		dev_err(svsp->dev, "cannot create %s: %ld\n",
+			d, PTR_ERR(svs_dir));
+		return 0;
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
+	for (idx = 0; idx < svsp->bank_num; idx++) {
+		svsb = &svsp->banks[idx];
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
 static struct svs_bank svs_mt8183_banks[4] = {
 	{
 		.sw_id			= SVSB_CPU_LITTLE,
+		.hw_id			= 0,
 		.cpu_id			= 0,
 		.tzone_name		= "tzts4",
 		.buck_name		= "proc",
@@ -1484,6 +1799,7 @@ static struct svs_bank svs_mt8183_banks[4] = {
 	},
 	{
 		.sw_id			= SVSB_CPU_BIG,
+		.hw_id			= 1,
 		.cpu_id			= 4,
 		.tzone_name		= "tzts5",
 		.buck_name		= "proc",
@@ -1519,6 +1835,7 @@ static struct svs_bank svs_mt8183_banks[4] = {
 	},
 	{
 		.sw_id			= SVSB_CCI,
+		.hw_id			= 2,
 		.tzone_name		= "tzts4",
 		.buck_name		= "proc",
 		.pd_req			= false,
@@ -1553,6 +1870,7 @@ static struct svs_bank svs_mt8183_banks[4] = {
 	},
 	{
 		.sw_id			= SVSB_GPU,
+		.hw_id			= 3,
 		.tzone_name		= "tzts2",
 		.buck_name		= "mali",
 		.pd_req			= true,
@@ -1719,6 +2037,12 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_iounmap;
 	}
 
+	ret = svs_create_svs_debug_cmds(svsp);
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
