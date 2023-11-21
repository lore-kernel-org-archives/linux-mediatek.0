Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4254AC61D96
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOfrnj0W5T4YSpQhtI41J9NL3fAawxAwLpl21veR5b4=; b=vMtdPIUMZ3W3cEzqTEdUEWjHRY
	fc/QmDn4lHkR/kL/yCadocpCJD75/vWl8vLZ3cb7Gz5rj3E0rPu4wpwBnppDGRAcZNwIN97EsNxP5
	YCSlatLwsOd4AnyCUK2b0E/AOA1G5ox+62HU179d0tcHq1c7yhdFZvk4tc+gblGEwIEsim92GRL/D
	xeNJ8o9JdYWa1ex+jSyPNE/6PRtkqp6tiGDwbWy6ceUpU24PZf6GUiXMvEYuEiV+7RmaprAMytTsB
	XWUq0ObWn9ZLG96cbUyVnsLR2UB9do9mQZxNQejYknaceGG98FMHyQ4a80eUzP0Gng/xCyHxC/WuE
	iNH+yqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QEM-00Gkbp-0b;
	Tue, 21 Nov 2023 12:51:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QDX-00Gjwx-33;
	Tue, 21 Nov 2023 12:51:06 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD4BF6607324;
	Tue, 21 Nov 2023 12:51:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700571062;
	bh=Ugc04MbnUnt7uzZ2TQCUP0pKACMxidFV1p9AUF2t0WA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQS7q6n01f7NFD/WR90kOGIjofEUXiDULQkINnbAdxfBjYOmqhYupMpay6gLUT8oK
	 Xg1oc4y9nYZgOjNNmdo/ehlnSwRmRL+iHfLNFy379spt4Edi0h1fgb8aVrC8VYT0GE
	 jkj8Mm7l/p3a9TDVhYumybgPwMeuSe3DB6G6eAG9ql7xHeqvu5CGC24FcCmqJi9TN4
	 5yPQs/WNnTHQOsAmJkz4DNYA9jBbefwy3tDBazK/9eGY3aMYdbrG7zZyfpSLy+G+fK
	 slZej5DsmRyLIBSnaq4vbNrOUQaOwwljJjEfpYtV7JcE/h0g8yYKjhAcTzRI8NUtvR
	 oC50u1xv/WzeA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v3 11/20] soc: mediatek: mtk-svs: Drop supplementary svs per-bank pointer
Date: Tue, 21 Nov 2023 13:50:35 +0100
Message-ID: <20231121125044.78642-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
References: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_045104_267708_F976C33A 
X-CRM114-Status: GOOD (  16.72  )
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

Drop the "pbank" pointer from struct svs_bank: this was used to simply
pass a pointer to the SVS bank that the flow was working on.
That for instance needs more locking, and it's avoidable by adding one
more parameter to functions working on specific banks, either a bank
index number, or passing the svs_bank pointer directly from the caller.

Even if the locking can now be reduced, for now, it was still left in
place for the sake of making sure to not introduce any stability and/or
reliability regression.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 87 ++++++++++++++++------------------
 1 file changed, 40 insertions(+), 47 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 517a27c58888..e7df3a577b4c 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -372,7 +372,6 @@ struct svs_fusemap {
  * @base: svs platform register base
  * @dev: svs platform device
  * @main_clk: main clock for svs bank
- * @pbank: svs bank pointer needing to be protected by spin_lock section
  * @banks: svs banks that svs platform supports
  * @rst: svs platform reset control
  * @efuse_max: total number of svs efuse
@@ -387,7 +386,6 @@ struct svs_platform {
 	void __iomem *base;
 	struct device *dev;
 	struct clk *main_clk;
-	struct svs_bank *pbank;
 	struct svs_bank *banks;
 	struct reset_control *rst;
 	size_t efuse_max;
@@ -483,8 +481,8 @@ struct svs_bank {
 	struct regulator *buck;
 	struct thermal_zone_device *tzd;
 	struct mutex lock;	/* lock to protect voltage update process */
-	void (*set_freq_pct)(struct svs_platform *svsp);
-	void (*get_volts)(struct svs_platform *svsp);
+	void (*set_freq_pct)(struct svs_platform *svsp, struct svs_bank *svsb);
+	void (*get_volts)(struct svs_platform *svsp, struct svs_bank *svsb);
 	char *name;
 	char *buck_name;
 	char *tzone_name;
@@ -555,10 +553,8 @@ static void svs_writel_relaxed(struct svs_platform *svsp, u32 val,
 	writel_relaxed(val, svsp->base + svsp->regs[rg_i]);
 }
 
-static void svs_switch_bank(struct svs_platform *svsp)
+static void svs_switch_bank(struct svs_platform *svsp, struct svs_bank *svsb)
 {
-	struct svs_bank *svsb = svsp->pbank;
-
 	svs_writel_relaxed(svsp, svsb->core_sel, CORESEL);
 }
 
@@ -693,8 +689,7 @@ static void svs_bank_disable_and_restore_default_volts(struct svs_platform *svsp
 		return;
 
 	spin_lock_irqsave(&svs_lock, flags);
-	svsp->pbank = svsb;
-	svs_switch_bank(svsp);
+	svs_switch_bank(svsp, svsb);
 	svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
 	svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
 	spin_unlock_irqrestore(&svs_lock, flags);
@@ -926,9 +921,8 @@ static u32 interpolate(u32 f0, u32 f1, u32 v0, u32 v1, u32 fx)
 	return DIV_ROUND_UP(vx, 100);
 }
 
-static void svs_get_bank_volts_v3(struct svs_platform *svsp)
+static void svs_get_bank_volts_v3(struct svs_platform *svsp, struct svs_bank *svsb)
 {
-	struct svs_bank *svsb = svsp->pbank;
 	u32 i, j, *vop, vop74, vop30, turn_pt = svsb->turn_pt;
 	u32 b_sft, shift_byte = 0, opp_start = 0, opp_stop = 0;
 	u32 middle_index = (svsb->opp_count / 2);
@@ -1041,9 +1035,8 @@ static void svs_get_bank_volts_v3(struct svs_platform *svsp)
 	}
 }
 
-static void svs_set_bank_freq_pct_v3(struct svs_platform *svsp)
+static void svs_set_bank_freq_pct_v3(struct svs_platform *svsp, struct svs_bank *svsb)
 {
-	struct svs_bank *svsb = svsp->pbank;
 	u32 i, j, *freq_pct, freq_pct74 = 0, freq_pct30 = 0;
 	u32 b_sft, shift_byte = 0, turn_pt;
 	u32 middle_index = (svsb->opp_count / 2);
@@ -1124,9 +1117,8 @@ static void svs_set_bank_freq_pct_v3(struct svs_platform *svsp)
 	svs_writel_relaxed(svsp, freq_pct30, FREQPCT30);
 }
 
-static void svs_get_bank_volts_v2(struct svs_platform *svsp)
+static void svs_get_bank_volts_v2(struct svs_platform *svsp, struct svs_bank *svsb)
 {
-	struct svs_bank *svsb = svsp->pbank;
 	u32 temp, i;
 
 	temp = svs_readl_relaxed(svsp, VOP74);
@@ -1181,9 +1173,8 @@ static void svs_get_bank_volts_v2(struct svs_platform *svsp)
 	}
 }
 
-static void svs_set_bank_freq_pct_v2(struct svs_platform *svsp)
+static void svs_set_bank_freq_pct_v2(struct svs_platform *svsp, struct svs_bank *svsb)
 {
-	struct svs_bank *svsb = svsp->pbank;
 	u32 freqpct74_val, freqpct30_val;
 
 	freqpct74_val = FIELD_PREP(SVSB_FREQPCTS_FLD_PCT0_4, svsb->freq_pct[8]) |
@@ -1201,12 +1192,13 @@ static void svs_set_bank_freq_pct_v2(struct svs_platform *svsp)
 }
 
 static void svs_set_bank_phase(struct svs_platform *svsp,
+			       unsigned int bank_idx,
 			       enum svsb_phase target_phase)
 {
-	struct svs_bank *svsb = svsp->pbank;
+	struct svs_bank *svsb = &svsp->banks[bank_idx];
 	u32 des_char, temp_char, det_char, limit_vals, init2vals, ts_calcs;
 
-	svs_switch_bank(svsp);
+	svs_switch_bank(svsp, svsb);
 
 	des_char = FIELD_PREP(SVSB_DESCHAR_FLD_BDES, svsb->bdes) |
 		   FIELD_PREP(SVSB_DESCHAR_FLD_MDES, svsb->mdes);
@@ -1225,7 +1217,7 @@ static void svs_set_bank_phase(struct svs_platform *svsp,
 	svs_writel_relaxed(svsp, svsb->age_config, AGECONFIG);
 	svs_writel_relaxed(svsp, SVSB_RUNCONFIG_DEFAULT, RUNCONFIG);
 
-	svsb->set_freq_pct(svsp);
+	svsb->set_freq_pct(svsp, svsb);
 
 	limit_vals = FIELD_PREP(SVSB_LIMITVALS_FLD_DTLO, SVSB_VAL_DTLO) |
 		     FIELD_PREP(SVSB_LIMITVALS_FLD_DTHI, SVSB_VAL_DTHI) |
@@ -1267,18 +1259,20 @@ static void svs_set_bank_phase(struct svs_platform *svsp,
 }
 
 static inline void svs_save_bank_register_data(struct svs_platform *svsp,
+					       unsigned short bank_idx,
 					       enum svsb_phase phase)
 {
-	struct svs_bank *svsb = svsp->pbank;
+	struct svs_bank *svsb = &svsp->banks[bank_idx];
 	enum svs_reg_index rg_i;
 
 	for (rg_i = DESCHAR; rg_i < SVS_REG_MAX; rg_i++)
 		svsb->reg_data[phase][rg_i] = svs_readl_relaxed(svsp, rg_i);
 }
 
-static inline void svs_error_isr_handler(struct svs_platform *svsp)
+static inline void svs_error_isr_handler(struct svs_platform *svsp,
+					 unsigned short bank_idx)
 {
-	struct svs_bank *svsb = svsp->pbank;
+	struct svs_bank *svsb = &svsp->banks[bank_idx];
 
 	dev_err(svsb->dev, "%s: CORESEL = 0x%08x\n",
 		__func__, svs_readl_relaxed(svsp, CORESEL));
@@ -1290,16 +1284,17 @@ static inline void svs_error_isr_handler(struct svs_platform *svsp)
 		svs_readl_relaxed(svsp, SMSTATE1));
 	dev_err(svsb->dev, "TEMP = 0x%08x\n", svs_readl_relaxed(svsp, TEMP));
 
-	svs_save_bank_register_data(svsp, SVSB_PHASE_ERROR);
+	svs_save_bank_register_data(svsp, bank_idx, SVSB_PHASE_ERROR);
 
 	svsb->phase = SVSB_PHASE_ERROR;
 	svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
 	svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
 }
 
-static inline void svs_init01_isr_handler(struct svs_platform *svsp)
+static inline void svs_init01_isr_handler(struct svs_platform *svsp,
+					  unsigned short bank_idx)
 {
-	struct svs_bank *svsb = svsp->pbank;
+	struct svs_bank *svsb = &svsp->banks[bank_idx];
 	u32 val;
 
 	dev_info(svsb->dev, "%s: VDN74~30:0x%08x~0x%08x, DC:0x%08x\n",
@@ -1307,7 +1302,7 @@ static inline void svs_init01_isr_handler(struct svs_platform *svsp)
 		 svs_readl_relaxed(svsp, VDESIGN30),
 		 svs_readl_relaxed(svsp, DCVALUES));
 
-	svs_save_bank_register_data(svsp, SVSB_PHASE_INIT01);
+	svs_save_bank_register_data(svsp, bank_idx, SVSB_PHASE_INIT01);
 
 	svsb->phase = SVSB_PHASE_INIT01;
 	val = ~(svs_readl_relaxed(svsp, DCVALUES) & GENMASK(15, 0)) + 1;
@@ -1325,32 +1320,34 @@ static inline void svs_init01_isr_handler(struct svs_platform *svsp)
 	svsb->core_sel &= ~SVSB_DET_CLK_EN;
 }
 
-static inline void svs_init02_isr_handler(struct svs_platform *svsp)
+static inline void svs_init02_isr_handler(struct svs_platform *svsp,
+					  unsigned short bank_idx)
 {
-	struct svs_bank *svsb = svsp->pbank;
+	struct svs_bank *svsb = &svsp->banks[bank_idx];
 
 	dev_info(svsb->dev, "%s: VOP74~30:0x%08x~0x%08x, DC:0x%08x\n",
 		 __func__, svs_readl_relaxed(svsp, VOP74),
 		 svs_readl_relaxed(svsp, VOP30),
 		 svs_readl_relaxed(svsp, DCVALUES));
 
-	svs_save_bank_register_data(svsp, SVSB_PHASE_INIT02);
+	svs_save_bank_register_data(svsp, bank_idx, SVSB_PHASE_INIT02);
 
 	svsb->phase = SVSB_PHASE_INIT02;
-	svsb->get_volts(svsp);
+	svsb->get_volts(svsp, svsb);
 
 	svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
 	svs_writel_relaxed(svsp, SVSB_INTSTS_F0_COMPLETE, INTSTS);
 }
 
-static inline void svs_mon_mode_isr_handler(struct svs_platform *svsp)
+static inline void svs_mon_mode_isr_handler(struct svs_platform *svsp,
+					    unsigned short bank_idx)
 {
-	struct svs_bank *svsb = svsp->pbank;
+	struct svs_bank *svsb = &svsp->banks[bank_idx];
 
-	svs_save_bank_register_data(svsp, SVSB_PHASE_MON);
+	svs_save_bank_register_data(svsp, bank_idx, SVSB_PHASE_MON);
 
 	svsb->phase = SVSB_PHASE_MON;
-	svsb->get_volts(svsp);
+	svsb->get_volts(svsp, svsb);
 
 	svsb->temp = svs_readl_relaxed(svsp, TEMP) & GENMASK(7, 0);
 	svs_writel_relaxed(svsp, SVSB_INTSTS_FLD_MONVOP, INTSTS);
@@ -1368,7 +1365,6 @@ static irqreturn_t svs_isr(int irq, void *data)
 		WARN(!svsb, "%s: svsb(%s) is null", __func__, svsb->name);
 
 		spin_lock_irqsave(&svs_lock, flags);
-		svsp->pbank = svsb;
 
 		/* Find out which svs bank fires interrupt */
 		if (svsb->int_st & svs_readl_relaxed(svsp, INTST)) {
@@ -1376,20 +1372,20 @@ static irqreturn_t svs_isr(int irq, void *data)
 			continue;
 		}
 
-		svs_switch_bank(svsp);
+		svs_switch_bank(svsp, svsb);
 		int_sts = svs_readl_relaxed(svsp, INTSTS);
 		svs_en = svs_readl_relaxed(svsp, SVSEN);
 
 		if (int_sts == SVSB_INTSTS_F0_COMPLETE &&
 		    svs_en == SVSB_PTPEN_INIT01)
-			svs_init01_isr_handler(svsp);
+			svs_init01_isr_handler(svsp, idx);
 		else if (int_sts == SVSB_INTSTS_F0_COMPLETE &&
 			 svs_en == SVSB_PTPEN_INIT02)
-			svs_init02_isr_handler(svsp);
+			svs_init02_isr_handler(svsp, idx);
 		else if (int_sts & SVSB_INTSTS_FLD_MONVOP)
-			svs_mon_mode_isr_handler(svsp);
+			svs_mon_mode_isr_handler(svsp, idx);
 		else
-			svs_error_isr_handler(svsp);
+			svs_error_isr_handler(svsp, idx);
 
 		spin_unlock_irqrestore(&svs_lock, flags);
 		break;
@@ -1518,8 +1514,7 @@ static int svs_init01(struct svs_platform *svsp)
 		}
 
 		spin_lock_irqsave(&svs_lock, flags);
-		svsp->pbank = svsb;
-		svs_set_bank_phase(svsp, SVSB_PHASE_INIT01);
+		svs_set_bank_phase(svsp, idx, SVSB_PHASE_INIT01);
 		spin_unlock_irqrestore(&svs_lock, flags);
 
 		time_left = wait_for_completion_timeout(&svsb->init_completion,
@@ -1588,8 +1583,7 @@ static int svs_init02(struct svs_platform *svsp)
 
 		reinit_completion(&svsb->init_completion);
 		spin_lock_irqsave(&svs_lock, flags);
-		svsp->pbank = svsb;
-		svs_set_bank_phase(svsp, SVSB_PHASE_INIT02);
+		svs_set_bank_phase(svsp, idx, SVSB_PHASE_INIT02);
 		spin_unlock_irqrestore(&svs_lock, flags);
 
 		time_left = wait_for_completion_timeout(&svsb->init_completion,
@@ -1645,8 +1639,7 @@ static void svs_mon_mode(struct svs_platform *svsp)
 			continue;
 
 		spin_lock_irqsave(&svs_lock, flags);
-		svsp->pbank = svsb;
-		svs_set_bank_phase(svsp, SVSB_PHASE_MON);
+		svs_set_bank_phase(svsp, idx, SVSB_PHASE_MON);
 		spin_unlock_irqrestore(&svs_lock, flags);
 	}
 }
-- 
2.42.0


