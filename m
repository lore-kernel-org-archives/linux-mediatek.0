Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA0FC5AE4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sq9G32K6TtoLD+AvzTy4qXTHDqDo8A0lDQFf/DMBYSM=; b=QVN0TaeI8svkMvxNozzrfkAQO4
	ChOLDVjv7GXu8aV+1YizYgfCNt3qcmJ8AIrQWVYtT3oHkZhdVvyVGpnrJKi/TVcsPjVmEnA+/vFc/
	UJuZ6TuWeAdUzEmaYu62FRmd1bIuKHh5LVTjcrftBwhWANO8ETyjLWfLnTEydeJXB/0KHeR8xR3H1
	3CIGghCx0SCQR1Zjt32KY5nGnbh6BFOXxXdT28w8Wc01TSlY5/QhQktiGjXsoFtuUJXLMnToNXUQ8
	IEVo9roHTSHu6sDIwcHnx5/ziQT7tFIeYr+RJvGAtn1d6QRo7VaCCLtDPov9gsSu8lOg6j4xcjZql
	DaQ6Z38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vNS-0067FC-1y;
	Fri, 17 Nov 2023 09:43:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vN3-0066re-0d;
	Fri, 17 Nov 2023 09:42:42 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE1636607392;
	Fri, 17 Nov 2023 09:42:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700214159;
	bh=HjqA+sAHeyELuvvhdsMlpINGaociXjYFjdm6q68a7V8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QB2DhMohU9aUoMVpp1jgKL7000YNibLkZki0bLfFnrK44cENycT3czeG5A7IYvMCJ
	 29wWlwwY5JpqVbbu4oUpRcYd3GF7q07/ttSK5mezW5H9RhM1FuTod/1QJD7dgn77ro
	 n30Eehv3Kb5ok3Avp+KXvV9jwMcQMO+9+OMK/X5J7Ku/CXKQIkJRzbO8qXTCnZx5Pm
	 QixvEOKgsOyn8J2lOoN7yKgvdrO9YLj0H5dVZ/L/weAkxQFby/tWFrih+s/7ovGhWX
	 Mc4JHQp4YlalMqJk0yWwPBQmuzgDeuBexJITVPb0xDbrWUEwB1VVd8gYBUfsEJUIE3
	 itu85EOByiuIw==
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
Subject: [PATCH v1 05/20] soc: mediatek: mtk-svs: Reduce memory footprint of struct svs_bank
Date: Fri, 17 Nov 2023 10:42:13 +0100
Message-ID: <20231117094228.40013-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
References: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_014241_379791_2BA14C6B 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Many 32-bit members of this struct can be size reduced to either 16-bit
or even 8-bit, for a total saving of ~61 bytes per bank. Keeping in mind
that one SoC declares at least two banks, this brings a minimum of ~122
bytes saving (depending on compiler optimization).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 51 +++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 1c7592fd6ae7..6c27fb523bfa 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -456,13 +456,13 @@ struct svs_bank {
 	char *buck_name;
 	char *tzone_name;
 	enum svsb_phase phase;
-	s32 volt_od;
+	short int volt_od;
 	u32 reg_data[SVSB_PHASE_MAX][SVS_REG_MAX];
 	u32 pm_runtime_enabled_count;
-	u32 mode_support;
+	u8 mode_support;
 	u32 freq_base;
 	u32 turn_freq_base;
-	u32 vboot;
+	u8 vboot;
 	u32 opp_dfreq[MAX_OPP_ENTRIES];
 	u32 opp_dvolt[MAX_OPP_ENTRIES];
 	u32 freq_pct[MAX_OPP_ENTRIES];
@@ -470,36 +470,36 @@ struct svs_bank {
 	u32 volt_step;
 	u32 volt_base;
 	u32 volt_flags;
-	u32 vmax;
-	u32 vmin;
+	u8 vmax;
+	u8 vmin;
 	u32 age_config;
-	u32 age_voffset_in;
+	u16 age_voffset_in;
 	u32 dc_config;
-	u32 dc_voffset_in;
-	u32 dvt_fixed;
-	u32 vco;
-	u32 chk_shift;
+	u16 dc_voffset_in;
+	u8 dvt_fixed;
+	u8 vco;
+	u8 chk_shift;
 	u32 core_sel;
-	u32 opp_count;
+	u8 opp_count;
 	u32 int_st;
-	u32 sw_id;
-	u32 cpu_id;
+	u8 sw_id;
+	u8 cpu_id;
 	u32 ctl0;
 	u32 temp;
 	u32 tzone_htemp;
-	u32 tzone_htemp_voffset;
+	u16 tzone_htemp_voffset;
 	u32 tzone_ltemp;
-	u32 tzone_ltemp_voffset;
-	u32 bts;
-	u32 mts;
-	u32 bdes;
-	u32 mdes;
-	u32 mtdes;
-	u32 dcbdet;
-	u32 dcmdet;
+	u16 tzone_ltemp_voffset;
+	u16 bts;
+	u16 mts;
+	u16 bdes;
+	u16 mdes;
+	u8 mtdes;
+	u8 dcbdet;
+	u8 dcmdet;
 	u32 turn_pt;
 	u32 vbin_turn_pt;
-	u32 type;
+	u8 type;
 };
 
 static u32 percent(u32 numerator, u32 denominator)
@@ -1267,6 +1267,7 @@ static inline void svs_error_isr_handler(struct svs_platform *svsp)
 static inline void svs_init01_isr_handler(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb = svsp->pbank;
+	u32 val;
 
 	dev_info(svsb->dev, "%s: VDN74~30:0x%08x~0x%08x, DC:0x%08x\n",
 		 __func__, svs_readl_relaxed(svsp, VDESIGN74),
@@ -1276,8 +1277,8 @@ static inline void svs_init01_isr_handler(struct svs_platform *svsp)
 	svs_save_bank_register_data(svsp, SVSB_PHASE_INIT01);
 
 	svsb->phase = SVSB_PHASE_INIT01;
-	svsb->dc_voffset_in = ~(svs_readl_relaxed(svsp, DCVALUES) &
-				GENMASK(15, 0)) + 1;
+	val = ~(svs_readl_relaxed(svsp, DCVALUES) & GENMASK(15, 0)) + 1;
+	svsb->dc_voffset_in = val & GENMASK(15, 0);
 	if (svsb->volt_flags & SVSB_INIT01_VOLT_IGNORE ||
 	    (svsb->dc_voffset_in & SVSB_DC_SIGNED_BIT &&
 	     svsb->volt_flags & SVSB_INIT01_VOLT_INC_ONLY))
-- 
2.42.0


