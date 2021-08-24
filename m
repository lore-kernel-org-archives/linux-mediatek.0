Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E308C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 03:32:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B0C61206
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 03:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01B0C61206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1Utu+th8N0MScZ0Zb8YcUUBycsKdVb9snBYuaj1Pio=; b=PUGo/9tRLxB8qn
	EqeBIrldSPp3Ov6tmfYnLDbsAn8/4s24XkWgrfjaWKt75Fyga7yCcAqn6PIyLIjx4r+wW9zNa72D9
	ovV2fMHB/2mguDRFX05Xnvx5W8AIPfyqvByfbXk/VWXvKkPu5fKHn1PXkgKg0tfp5XDnXypiBguiI
	TWLe9dkU1+wXfgyW0VvN9wa5vBtCTaP3xUwF25LpVvqwf2NmnIkRlw8FHhhbaBt7zfd3khVqv+WYW
	rCswvgFRgICjdFNYRLm2QNBnmucwpSQkq4fP4iy3zdG+J1s6stPli8xX944yLakk+4qwR8oiqQTcn
	VBRsjDCJeCMvzco3VTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mINAr-001OdZ-Fh; Tue, 24 Aug 2021 03:32:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIN9E-001NnC-KK; Tue, 24 Aug 2021 03:30:52 +0000
X-UUID: 90a4fc4658b74220bfab2dc6043aa2e1-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9fD9nFF82Qtb+Zijl/uWXFtq5XzFQqnDZroMmHoEGZg=; 
 b=XEqNNjtA7AjlH1qfUPqFryUYLxRK0fqdp5dksG6Wr1wzijBx5mIk8mvAYCOruBP1cnnrIbjyrXT0HrWGP7OuP5prW86UFojhzqsN3Gl0s+B6fJvdQ+pv9fYuNguo/ZpZBgfdAksKcXBeZE7NEB6G25OKhKlmT9UkaixEiEaLvmU=;
X-UUID: 90a4fc4658b74220bfab2dc6043aa2e1-20210823
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1642432890; Mon, 23 Aug 2021 20:30:42 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 20:30:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 11:30:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 11:30:38 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>
Subject: [RESEND PATCH v5 7/7] i2c: mediatek: modify bus speed calculation
 formula
Date: Tue, 24 Aug 2021 11:30:28 +0800
Message-ID: <1629775828-19993-8-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
References: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_203048_722937_82BD07A6 
X-CRM114-Status: GOOD (  16.05  )
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

When clock-div is 0 or greater than 1, the bus speed
calculated by the old speed calculation formula will be
larger than the target speed. So we update the formula.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 18b5659..0b42acd8 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -69,11 +69,12 @@
 #define I2C_DEFAULT_CLK_DIV		5
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
-#define MAX_CLOCK_DIV			256
+#define MAX_CLOCK_DIV_8BITS		256
+#define MAX_CLOCK_DIV_5BITS		32
 #define MAX_HS_STEP_CNT_DIV		8
-#define I2C_STANDARD_MODE_BUFFER	(1000 / 2)
-#define I2C_FAST_MODE_BUFFER		(300 / 2)
-#define I2C_FAST_MODE_PLUS_BUFFER	(20 / 2)
+#define I2C_STANDARD_MODE_BUFFER	(1000 / 3)
+#define I2C_FAST_MODE_BUFFER		(300 / 3)
+#define I2C_FAST_MODE_PLUS_BUFFER	(20 / 3)
 
 #define I2C_CONTROL_RS                  (0x1 << 1)
 #define I2C_CONTROL_DMA_EN              (0x1 << 2)
@@ -725,14 +726,26 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	unsigned int best_mul;
 	unsigned int cnt_mul;
 	int ret = -EINVAL;
+	int clock_div_constraint = 0;
 
 	if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
 		target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;
 
+	if (i2c->use_default_timing) {
+		clock_div_constraint = 0;
+	} else if (i2c->dev_comp->ltiming_adjust &&
+		   i2c->ac_timing.inter_clk_div > 1) {
+		clock_div_constraint = 1;
+	} else if (i2c->dev_comp->ltiming_adjust &&
+		   i2c->ac_timing.inter_clk_div == 0) {
+		clock_div_constraint = -1;
+	}
+
 	max_step_cnt = mtk_i2c_max_step_cnt(target_speed);
 	base_step_cnt = max_step_cnt;
 	/* Find the best combination */
-	opt_div = DIV_ROUND_UP(clk_src >> 1, target_speed);
+	opt_div = DIV_ROUND_UP(clk_src >> 1, target_speed) +
+		  clock_div_constraint;
 	best_mul = MAX_SAMPLE_CNT_DIV * max_step_cnt;
 
 	/* Search for the best pair (sample_cnt, step_cnt) with
@@ -767,7 +780,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	sample_cnt = base_sample_cnt;
 	step_cnt = base_step_cnt;
 
-	if ((clk_src / (2 * sample_cnt * step_cnt)) > target_speed) {
+	if ((clk_src / (2 * (sample_cnt * step_cnt - clock_div_constraint))) >
+		 target_speed) {
 		/* In this case, hardware can't support such
 		 * low i2c_bus_freq
 		 */
@@ -854,13 +868,16 @@ static int mtk_i2c_set_speed_adjust_timing(struct mtk_i2c *i2c,
 	target_speed = i2c->speed_hz;
 	parent_clk /= i2c->clk_src_div;
 
-	if (i2c->dev_comp->timing_adjust)
-		max_clk_div = MAX_CLOCK_DIV;
+	if (i2c->dev_comp->timing_adjust && i2c->dev_comp->ltiming_adjust)
+		max_clk_div = MAX_CLOCK_DIV_5BITS;
+	else if (i2c->dev_comp->timing_adjust)
+		max_clk_div = MAX_CLOCK_DIV_8BITS;
 	else
 		max_clk_div = 1;
 
 	for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
 		clk_src = parent_clk / clk_div;
+		i2c->ac_timing.inter_clk_div = clk_div - 1;
 
 		if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 			/* Set master code speed register */
@@ -907,8 +924,6 @@ static int mtk_i2c_set_speed_adjust_timing(struct mtk_i2c *i2c,
 		break;
 	}
 
-	i2c->ac_timing.inter_clk_div = clk_div - 1;
-
 	return 0;
 }
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
