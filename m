Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFE6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 12:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KKm9d5wOvrEtHpzHVyJSqzIKS/5JMj2zDh5jwbjxas=; b=w3/Q95KYhndfPs
	Rz+gpkohUg9aVq7lmJwbYAhZo7ObnCvJ35ruJczpCqrrtZFRKRUqGvvYO7t1K22EzGlLx8hyRX7Ny
	ulFLwDBkesw3yn3wFu1mAwdWc8n2TeiK3VZ5s921AotLsYo0+Jr75gyNUzZec4hqPn27fnrTZ6UO/
	NyZeWYfyJnf3BinyuCsf0SPbtHu5ZEKTWstBelmA48Tmz5uRi6dV6zN5nw1GeI6cMX/nBaiquBRlv
	Qxz+wlfKWYnYVwlSO6XbPGnquV8wkcDUuBuSgGXLMIslukAdB7fqTRuWWoHOpi2HY56yUhIfDbDuw
	AZK0QM1HfiUgixewp/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKfoh-00AQkn-Vf; Thu, 17 Feb 2022 12:23:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKfoJ-00AQcS-Ko; Thu, 17 Feb 2022 12:23:01 +0000
X-UUID: 82633366a91d4d6ab948567facf679c3-20220217
X-UUID: 82633366a91d4d6ab948567facf679c3-20220217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1410670759; Thu, 17 Feb 2022 05:22:54 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 04:22:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 17 Feb 2022 20:22:50 +0800
Received: from localhost.localdomain (10.17.3.14) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 20:22:49 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>, <ryan-jh.yu@mediatek.com>,
 <david-yh.chiu@mediatek.com>
Subject: [PATCH v10,1/1] i2c: mediatek: modify bus speed calculation formula
Date: Thu, 17 Feb 2022 20:22:43 +0800
Message-ID: <1645100563-59441-2-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1645100563-59441-1-git-send-email-kewei.xu@mediatek.com>
References: <1645100563-59441-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_042259_753433_A59046AC 
X-CRM114-Status: GOOD (  15.89  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 51 +++++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index aa4d218..682293e 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -67,11 +67,12 @@
 
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
@@ -604,6 +605,31 @@ static int mtk_i2c_max_step_cnt(unsigned int target_speed)
 		return MAX_STEP_CNT_DIV;
 }
 
+static int mtk_i2c_get_clk_div_restri(struct mtk_i2c *i2c,
+				      unsigned int sample_cnt)
+{
+	int clk_div_restri = 0;
+
+	if (i2c->dev_comp->ltiming_adjust == 0)
+		return 0;
+
+	if (sample_cnt == 1) {
+		if (i2c->ac_timing.inter_clk_div == 0)
+			clk_div_restri = 0;
+		else
+			clk_div_restri = 1;
+	} else {
+		if (i2c->ac_timing.inter_clk_div == 0)
+			clk_div_restri = -1;
+		else if (i2c->ac_timing.inter_clk_div == 1)
+			clk_div_restri = 0;
+		else
+			clk_div_restri = 1;
+	}
+
+	return clk_div_restri;
+}
+
 /*
  * Check and Calculate i2c ac-timing
  *
@@ -732,6 +758,7 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	unsigned int best_mul;
 	unsigned int cnt_mul;
 	int ret = -EINVAL;
+	int clk_div_restri = 0;
 
 	if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
 		target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;
@@ -749,7 +776,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	 * optimizing for sample_cnt * step_cnt being minimal
 	 */
 	for (sample_cnt = 1; sample_cnt <= MAX_SAMPLE_CNT_DIV; sample_cnt++) {
-		step_cnt = DIV_ROUND_UP(opt_div, sample_cnt);
+		clk_div_restri = mtk_i2c_get_clk_div_restri(i2c, sample_cnt);
+		step_cnt = DIV_ROUND_UP(opt_div + clk_div_restri, sample_cnt);
 		cnt_mul = step_cnt * sample_cnt;
 		if (step_cnt > max_step_cnt)
 			continue;
@@ -763,7 +791,7 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 			best_mul = cnt_mul;
 			base_sample_cnt = sample_cnt;
 			base_step_cnt = step_cnt;
-			if (best_mul == opt_div)
+			if (best_mul == (opt_div + clk_div_restri))
 				break;
 		}
 	}
@@ -774,7 +802,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	sample_cnt = base_sample_cnt;
 	step_cnt = base_step_cnt;
 
-	if ((clk_src / (2 * sample_cnt * step_cnt)) > target_speed) {
+	if ((clk_src / (2 * (sample_cnt * step_cnt - clk_div_restri))) >
+		target_speed) {
 		/* In this case, hardware can't support such
 		 * low i2c_bus_freq
 		 */
@@ -803,13 +832,16 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
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
@@ -856,7 +888,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 		break;
 	}
 
-	i2c->ac_timing.inter_clk_div = clk_div - 1;
 
 	return 0;
 }
-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
