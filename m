Return-Path: <SRS0=woo5=5L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6246EC43331
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 11:54:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C9020748
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 11:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PYnXFdFz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DZV5q670"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33C9020748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b7UcDZ3C03T31gSMJLbaUNSIHOMkHMuq+HGq4pJoKOM=; b=PYnXFdFzCXPiVz
	1/DQdYbAaodm9p/EDM+RLLB+LZBD8nXI1YXqvTIa+eaKnUQ6A1+PniclqREsEkY7HQJZnYEZ26Bwi
	u4NQzN6DlFnXKVl6Ciw75acSFoo1OBvbPzRqWdVU/wy4uOAZ6nS2cSwVNQURIiLuPDfzm3TJH7CIe
	f0dr8SOErpuxhw4Zl6faXQuEvxW5mzFLshdGwnKtSKTnxg1b/Dl8F4hE5pUoQWApwjpbxrxvRLy6A
	jpOZiTeOwFxEmrT7OkiOnhqbv/uteBE7XFXU6yZTOYPvNlyMqLn2M6JKHGpEDCnpK30Etq3IRFZ7v
	OOpmKPi/THvMsilqEPjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHR60-0003EQ-29; Thu, 26 Mar 2020 11:54:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHR5v-0003Cv-Qb; Thu, 26 Mar 2020 11:54:46 +0000
X-UUID: bd8148f931b64186b4c0ceffd23d5edc-20200326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=s12A0zWwSPFwWWL3hA7SUCBHPhMCTxane52Og4gdNx4=; 
 b=DZV5q6701Z5tlZBX3aIj+NwrmPHB3/d4OOfg12lYyy7rGvgjI6u7+58RqVZaQnNq1s2Ev3SuKQCHbaab0RTLbuWeXZdXhp6z3qoaxg6TbE12S7reZaAkiZ9tUEnVCgNrBoVQQx8VMZEGHGm0/wleMnxEvWMpM1VjlBX8nNoFzZ4=;
X-UUID: bd8148f931b64186b4c0ceffd23d5edc-20200326
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1579982628; Thu, 26 Mar 2020 03:54:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Mar 2020 04:54:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Mar 2020 19:54:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 26 Mar 2020 19:54:33 +0800
From: <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH] i2c: mediatek: Add i2c ac-timing adjust support
Date: Thu, 26 Mar 2020 19:54:36 +0800
Message-ID: <1585223676-30809-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_045443_881283_104E7698 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: qii.wang@mediatek.com, srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qii Wang <qii.wang@mediatek.com>

This patch adds a algorithm to calculate some ac-timing parameters
which can fully meet I2C Spec.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 332 ++++++++++++++++++++++++++++++++++------
 1 file changed, 281 insertions(+), 51 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2152ec5f..4da9aac 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -40,12 +40,11 @@
 #define I2C_SOFT_RST			0x0001
 #define I2C_FIFO_ADDR_CLR		0x0001
 #define I2C_DELAY_LEN			0x0002
-#define I2C_ST_START_CON		0x8001
-#define I2C_FS_START_CON		0x1800
 #define I2C_TIME_CLR_VALUE		0x0000
 #define I2C_TIME_DEFAULT_VALUE		0x0003
 #define I2C_WRRD_TRANAC_VALUE		0x0002
 #define I2C_RD_TRANAC_VALUE		0x0001
+#define I2C_SCL_MIS_COMP_VALUE		0x0000
 
 #define I2C_DMA_CON_TX			0x0000
 #define I2C_DMA_CON_RX			0x0001
@@ -55,13 +54,16 @@
 #define I2C_DMA_HARD_RST		0x0002
 #define I2C_DMA_4G_MODE			0x0001
 
-#define I2C_DEFAULT_CLK_DIV		5
 #define I2C_DEFAULT_SPEED		100000	/* hz */
 #define MAX_FS_MODE_SPEED		400000
 #define MAX_HS_MODE_SPEED		3400000
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
+#define MAX_CLOCK_DIV			256
 #define MAX_HS_STEP_CNT_DIV		8
+#define I2C_STANDARD_MODE_BUFFER	(1000 / 2)
+#define I2C_FAST_MODE_BUFFER		(300 / 2)
+#define I2C_FAST_MODE_PLUS_BUFFER	(20 / 2)
 
 #define I2C_CONTROL_RS                  (0x1 << 1)
 #define I2C_CONTROL_DMA_EN              (0x1 << 2)
@@ -126,6 +128,12 @@ enum I2C_REGS_OFFSET {
 	OFFSET_TRANSFER_LEN_AUX,
 	OFFSET_CLOCK_DIV,
 	OFFSET_LTIMING,
+	OFFSET_SCL_HIGH_LOW_RATIO,
+	OFFSET_HS_SCL_HIGH_LOW_RATIO,
+	OFFSET_SCL_MIS_COMP_POINT,
+	OFFSET_STA_STO_AC_TIMING,
+	OFFSET_HS_STA_STO_AC_TIMING,
+	OFFSET_SDA_TIMING,
 };
 
 static const u16 mt_i2c_regs_v1[] = {
@@ -153,6 +161,12 @@ enum I2C_REGS_OFFSET {
 	[OFFSET_DEBUGCTRL] = 0x68,
 	[OFFSET_TRANSFER_LEN_AUX] = 0x6c,
 	[OFFSET_CLOCK_DIV] = 0x70,
+	[OFFSET_SCL_HIGH_LOW_RATIO] = 0x74,
+	[OFFSET_HS_SCL_HIGH_LOW_RATIO] = 0x78,
+	[OFFSET_SCL_MIS_COMP_POINT] = 0x7C,
+	[OFFSET_STA_STO_AC_TIMING] = 0x80,
+	[OFFSET_HS_STA_STO_AC_TIMING] = 0x84,
+	[OFFSET_SDA_TIMING] = 0x88,
 };
 
 static const u16 mt_i2c_regs_v2[] = {
@@ -171,9 +185,11 @@ enum I2C_REGS_OFFSET {
 	[OFFSET_HS] = 0x30,
 	[OFFSET_IO_CONFIG] = 0x34,
 	[OFFSET_FIFO_ADDR_CLR] = 0x38,
+	[OFFSET_SDA_TIMING] = 0x3c,
 	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
 	[OFFSET_CLOCK_DIV] = 0x48,
 	[OFFSET_SOFTRESET] = 0x50,
+	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
 	[OFFSET_DEBUGSTAT] = 0xe0,
 	[OFFSET_DEBUGCTRL] = 0xe8,
 	[OFFSET_FIFO_STAT] = 0xf4,
@@ -194,6 +210,19 @@ struct mtk_i2c_compatible {
 	unsigned char ltiming_adjust: 1;
 };
 
+struct mtk_i2c_ac_timing {
+	u16 htiming;
+	u16 ltiming;
+	u16 hs;
+	u16 ext;
+	u16 inter_clk_div;
+	u16 scl_hl_ratio;
+	u16 hs_scl_hl_ratio;
+	u16 sta_stop;
+	u16 hs_sta_stop;
+	u16 sda_timing;
+};
+
 struct mtk_i2c {
 	struct i2c_adapter adap;	/* i2c host adapter */
 	struct device *dev;
@@ -218,9 +247,46 @@ struct mtk_i2c {
 	u16 ltiming_reg;
 	unsigned char auto_restart;
 	bool ignore_restart_irq;
+	struct mtk_i2c_ac_timing ac_timing;
 	const struct mtk_i2c_compatible *dev_comp;
 };
 
+/**
+ * struct i2c_spec_values:
+ * min_low_ns: min LOW period of the SCL clock
+ * min_su_sta_ns: min set-up time for a repeated START condition
+ * max_hd_dat_ns: max data hold time
+ * min_su_dat_ns: min data set-up time
+ */
+struct i2c_spec_values {
+	unsigned int min_low_ns;
+	unsigned int min_high_ns;
+	unsigned int min_su_sta_ns;
+	unsigned int max_hd_dat_ns;
+	unsigned int min_su_dat_ns;
+};
+
+static const struct i2c_spec_values standard_mode_spec = {
+	.min_low_ns = 4700 + I2C_STANDARD_MODE_BUFFER,
+	.min_su_sta_ns = 4700 + I2C_STANDARD_MODE_BUFFER,
+	.max_hd_dat_ns = 3450 - I2C_STANDARD_MODE_BUFFER,
+	.min_su_dat_ns = 250 + I2C_STANDARD_MODE_BUFFER,
+};
+
+static const struct i2c_spec_values fast_mode_spec = {
+	.min_low_ns = 1300 + I2C_FAST_MODE_BUFFER,
+	.min_su_sta_ns = 600 + I2C_FAST_MODE_BUFFER,
+	.max_hd_dat_ns = 900 - I2C_FAST_MODE_BUFFER,
+	.min_su_dat_ns = 100 + I2C_FAST_MODE_BUFFER,
+};
+
+static const struct i2c_spec_values fast_mode_plus_spec = {
+	.min_low_ns = 500 + I2C_FAST_MODE_PLUS_BUFFER,
+	.min_su_sta_ns = 260 + I2C_FAST_MODE_PLUS_BUFFER,
+	.max_hd_dat_ns = 400 - I2C_FAST_MODE_PLUS_BUFFER,
+	.min_su_dat_ns = 50 + I2C_FAST_MODE_PLUS_BUFFER,
+};
+
 static const struct i2c_adapter_quirks mt6577_i2c_quirks = {
 	.flags = I2C_AQ_COMB_WRITE_THEN_READ,
 	.max_num_msgs = 1,
@@ -400,14 +466,38 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 	if (i2c->dev_comp->dcm)
 		mtk_i2c_writew(i2c, I2C_DCM_DISABLE, OFFSET_DCM_EN);
 
-	if (i2c->dev_comp->timing_adjust)
-		mtk_i2c_writew(i2c, I2C_DEFAULT_CLK_DIV - 1, OFFSET_CLOCK_DIV);
-
 	mtk_i2c_writew(i2c, i2c->timing_reg, OFFSET_TIMING);
 	mtk_i2c_writew(i2c, i2c->high_speed_reg, OFFSET_HS);
 	if (i2c->dev_comp->ltiming_adjust)
 		mtk_i2c_writew(i2c, i2c->ltiming_reg, OFFSET_LTIMING);
 
+	if (i2c->dev_comp->timing_adjust) {
+		mtk_i2c_writew(i2c, i2c->ac_timing.ext, OFFSET_EXT_CONF);
+		mtk_i2c_writew(i2c, i2c->ac_timing.inter_clk_div,
+			       OFFSET_CLOCK_DIV);
+		mtk_i2c_writew(i2c, I2C_SCL_MIS_COMP_VALUE,
+			       OFFSET_SCL_MIS_COMP_POINT);
+		mtk_i2c_writew(i2c, i2c->ac_timing.sda_timing,
+			       OFFSET_SDA_TIMING);
+
+		if (i2c->dev_comp->ltiming_adjust) {
+			mtk_i2c_writew(i2c, i2c->ac_timing.htiming,
+				       OFFSET_TIMING);
+			mtk_i2c_writew(i2c, i2c->ac_timing.hs, OFFSET_HS);
+			mtk_i2c_writew(i2c, i2c->ac_timing.ltiming,
+				       OFFSET_LTIMING);
+		} else {
+			mtk_i2c_writew(i2c, i2c->ac_timing.scl_hl_ratio,
+				       OFFSET_SCL_HIGH_LOW_RATIO);
+			mtk_i2c_writew(i2c, i2c->ac_timing.hs_scl_hl_ratio,
+				       OFFSET_HS_SCL_HIGH_LOW_RATIO);
+			mtk_i2c_writew(i2c, i2c->ac_timing.sta_stop,
+				       OFFSET_STA_STO_AC_TIMING);
+			mtk_i2c_writew(i2c, i2c->ac_timing.hs_sta_stop,
+				       OFFSET_HS_STA_STO_AC_TIMING);
+		}
+	}
+
 	/* If use i2c pin from PMIC mt6397 side, need set PATH_DIR first */
 	if (i2c->have_pmic)
 		mtk_i2c_writew(i2c, I2C_CONTROL_WRAPPER, OFFSET_PATH_DIR);
@@ -425,6 +515,129 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 	writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
 }
 
+static const struct i2c_spec_values *mtk_i2c_get_spec(unsigned int speed)
+{
+	if (speed <= I2C_DEFAULT_SPEED)
+		return &standard_mode_spec;
+	else if (speed <= MAX_FS_MODE_SPEED)
+		return &fast_mode_spec;
+	else
+		return &fast_mode_plus_spec;
+}
+
+static int mtk_i2c_max_step_cnt(unsigned int target_speed)
+{
+	if (target_speed > MAX_FS_MODE_SPEED)
+		return MAX_HS_STEP_CNT_DIV;
+	else
+		return MAX_STEP_CNT_DIV;
+}
+
+/*
+ * Check and Calculate i2c ac-timing
+ *
+ * Hardware design:
+ * sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src
+ * xxx_cnt_div =  spec->min_xxx_ns / sample_ns
+ *
+ * Sample_ns is rounded down for xxx_cnt_div would be greater
+ * than the smallest spec.
+ * The sda_timing is chosen as the middle value between
+ * the largest and smallest.
+ */
+static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
+				   unsigned int clk_src,
+				   unsigned int check_speed,
+				   unsigned int step_cnt,
+				   unsigned int sample_cnt)
+{
+	const struct i2c_spec_values *spec;
+	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
+	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
+	long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;
+
+	if (!i2c->dev_comp->timing_adjust)
+		return 0;
+
+	if (i2c->dev_comp->ltiming_adjust)
+		max_sta_cnt = 0x100;
+
+	spec = mtk_i2c_get_spec(check_speed);
+
+	if (i2c->dev_comp->ltiming_adjust)
+		clk_ns = 1000000000 / clk_src;
+	else
+		clk_ns = sample_ns / 2;
+
+	su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
+	if (su_sta_cnt > max_sta_cnt)
+		return -1;
+
+	low_cnt = DIV_ROUND_UP(spec->min_low_ns, sample_ns);
+	max_step_cnt = mtk_i2c_max_step_cnt(check_speed);
+	if ((2 * step_cnt) > low_cnt && low_cnt < max_step_cnt) {
+		if (low_cnt > step_cnt) {
+			high_cnt = 2 * step_cnt - low_cnt;
+		} else {
+			high_cnt = step_cnt;
+			low_cnt = step_cnt;
+		}
+	} else {
+		return -2;
+	}
+
+	sda_max = spec->max_hd_dat_ns / sample_ns;
+	if (sda_max < low_cnt)
+		sda_max = sda_max;
+	else
+		sda_max = 0;
+
+	sda_min = DIV_ROUND_UP(spec->min_su_dat_ns, sample_ns);
+	if (sda_min > low_cnt)
+		sda_min = sda_min;
+	else
+		sda_min = 0;
+
+	if (sda_min > sda_max)
+		return -3;
+
+	if (check_speed > MAX_FS_MODE_SPEED) {
+		if (i2c->dev_comp->ltiming_adjust) {
+			i2c->ac_timing.hs = I2C_TIME_DEFAULT_VALUE |
+				(sample_cnt << 12) | (high_cnt << 8);
+			i2c->ac_timing.ltiming &= ~GENMASK(15, 9);
+			i2c->ac_timing.ltiming |= (sample_cnt << 12) |
+				(low_cnt << 9);
+			i2c->ac_timing.ext &= ~GENMASK(7, 1);
+			i2c->ac_timing.ext |= (su_sta_cnt << 1) | (1 << 0);
+		} else {
+			i2c->ac_timing.hs_scl_hl_ratio = (1 << 12) |
+				(high_cnt << 6) | low_cnt;
+			i2c->ac_timing.hs_sta_stop = (su_sta_cnt << 8) |
+				su_sta_cnt;
+		}
+		i2c->ac_timing.sda_timing &= ~GENMASK(11, 6);
+		i2c->ac_timing.sda_timing |= (1 << 12) |
+			((sda_max + sda_min) / 2) << 6;
+	} else {
+		if (i2c->dev_comp->ltiming_adjust) {
+			i2c->ac_timing.htiming = (sample_cnt << 8) | (high_cnt);
+			i2c->ac_timing.ltiming = (sample_cnt << 6) | (low_cnt);
+			i2c->ac_timing.ext = (su_sta_cnt << 8) | (1 << 0);
+		} else {
+			i2c->ac_timing.scl_hl_ratio = (1 << 12) |
+				(high_cnt << 6) | low_cnt;
+			i2c->ac_timing.sta_stop = (su_sta_cnt << 8) |
+				su_sta_cnt;
+		}
+
+		i2c->ac_timing.sda_timing = (1 << 12) |
+			(sda_max + sda_min) / 2;
+	}
+
+	return 0;
+}
+
 /*
  * Calculate i2c port speed
  *
@@ -449,15 +662,12 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	unsigned int opt_div;
 	unsigned int best_mul;
 	unsigned int cnt_mul;
+	int ret = -EINVAL;
 
 	if (target_speed > MAX_HS_MODE_SPEED)
 		target_speed = MAX_HS_MODE_SPEED;
 
-	if (target_speed > MAX_FS_MODE_SPEED)
-		max_step_cnt = MAX_HS_STEP_CNT_DIV;
-	else
-		max_step_cnt = MAX_STEP_CNT_DIV;
-
+	max_step_cnt = mtk_i2c_max_step_cnt(target_speed);
 	base_step_cnt = max_step_cnt;
 	/* Find the best combination */
 	opt_div = DIV_ROUND_UP(clk_src >> 1, target_speed);
@@ -476,6 +686,11 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 			continue;
 
 		if (cnt_mul < best_mul) {
+			ret = mtk_i2c_check_ac_timing(i2c, clk_src,
+				target_speed, step_cnt - 1, sample_cnt - 1);
+			if (ret)
+				continue;
+
 			best_mul = cnt_mul;
 			base_sample_cnt = sample_cnt;
 			base_step_cnt = step_cnt;
@@ -484,6 +699,9 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 		}
 	}
 
+	if (ret)
+		return -EINVAL;
+
 	sample_cnt = base_sample_cnt;
 	step_cnt = base_step_cnt;
 
@@ -509,47 +727,68 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	unsigned int l_step_cnt;
 	unsigned int l_sample_cnt;
 	unsigned int target_speed;
+	unsigned int clk_div;
+	unsigned int max_clk_div;
 	int ret;
 
-	clk_src = parent_clk / i2c->clk_src_div;
 	target_speed = i2c->speed_hz;
+	parent_clk /= i2c->clk_src_div;
 
-	if (target_speed > MAX_FS_MODE_SPEED) {
-		/* Set master code speed register */
-		ret = mtk_i2c_calculate_speed(i2c, clk_src, MAX_FS_MODE_SPEED,
-					      &l_step_cnt, &l_sample_cnt);
-		if (ret < 0)
-			return ret;
-
-		i2c->timing_reg = (l_sample_cnt << 8) | l_step_cnt;
-
-		/* Set the high speed mode register */
-		ret = mtk_i2c_calculate_speed(i2c, clk_src, target_speed,
-					      &step_cnt, &sample_cnt);
-		if (ret < 0)
-			return ret;
-
-		i2c->high_speed_reg = I2C_TIME_DEFAULT_VALUE |
-			(sample_cnt << 12) | (step_cnt << 8);
+	if (i2c->dev_comp->timing_adjust)
+		max_clk_div = MAX_CLOCK_DIV;
+	else
+		max_clk_div = 1;
+
+	for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
+		clk_src = parent_clk / clk_div;
+
+		if (target_speed > MAX_FS_MODE_SPEED) {
+			/* Set master code speed register */
+			ret = mtk_i2c_calculate_speed(i2c, clk_src,
+						      MAX_FS_MODE_SPEED,
+						      &l_step_cnt,
+						      &l_sample_cnt);
+			if (ret < 0)
+				continue;
+
+			i2c->timing_reg = (l_sample_cnt << 8) | l_step_cnt;
+
+			/* Set the high speed mode register */
+			ret = mtk_i2c_calculate_speed(i2c, clk_src,
+						      target_speed, &step_cnt,
+						      &sample_cnt);
+			if (ret < 0)
+				continue;
+
+			i2c->high_speed_reg = I2C_TIME_DEFAULT_VALUE |
+					(sample_cnt << 12) | (step_cnt << 8);
+
+			if (i2c->dev_comp->ltiming_adjust)
+				i2c->ltiming_reg =
+					(l_sample_cnt << 6) | l_step_cnt |
+					(sample_cnt << 12) | (step_cnt << 9);
+		} else {
+			ret = mtk_i2c_calculate_speed(i2c, clk_src,
+						      target_speed, &l_step_cnt,
+						      &l_sample_cnt);
+			if (ret < 0)
+				continue;
 
-		if (i2c->dev_comp->ltiming_adjust)
-			i2c->ltiming_reg = (l_sample_cnt << 6) | l_step_cnt |
-					   (sample_cnt << 12) | (step_cnt << 9);
-	} else {
-		ret = mtk_i2c_calculate_speed(i2c, clk_src, target_speed,
-					      &step_cnt, &sample_cnt);
-		if (ret < 0)
-			return ret;
+			i2c->timing_reg = (l_sample_cnt << 8) | l_step_cnt;
 
-		i2c->timing_reg = (sample_cnt << 8) | step_cnt;
+			/* Disable the high speed transaction */
+			i2c->high_speed_reg = I2C_TIME_CLR_VALUE;
 
-		/* Disable the high speed transaction */
-		i2c->high_speed_reg = I2C_TIME_CLR_VALUE;
+			if (i2c->dev_comp->ltiming_adjust)
+				i2c->ltiming_reg =
+					(l_sample_cnt << 6) | l_step_cnt;
+		}
 
-		if (i2c->dev_comp->ltiming_adjust)
-			i2c->ltiming_reg = (sample_cnt << 6) | step_cnt;
+		break;
 	}
 
+	i2c->ac_timing.inter_clk_div = clk_div - 1;
+
 	return 0;
 }
 
@@ -589,12 +828,6 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 	mtk_i2c_writew(i2c, control_reg, OFFSET_CONTROL);
 
-	/* set start condition */
-	if (i2c->speed_hz <= I2C_DEFAULT_SPEED)
-		mtk_i2c_writew(i2c, I2C_ST_START_CON, OFFSET_EXT_CONF);
-	else
-		mtk_i2c_writew(i2c, I2C_FS_START_CON, OFFSET_EXT_CONF);
-
 	addr_reg = i2c_8bit_addr_from_msg(msgs);
 	mtk_i2c_writew(i2c, addr_reg, OFFSET_SLAVE_ADDR);
 
@@ -951,9 +1184,6 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return -EINVAL;
 
-	if (i2c->dev_comp->timing_adjust)
-		i2c->clk_src_div *= I2C_DEFAULT_CLK_DIV;
-
 	if (i2c->have_pmic && !i2c->dev_comp->pmic_i2c)
 		return -EINVAL;
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
