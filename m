Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7910C49361
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 09:03:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6137961002
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 09:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6137961002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaOfOuQrtGPNmK8J6r+I2YDlntAmEHkMjCgN4Z7HIis=; b=ZIhqIjHAqB7CTm
	3lXTm2WlxLTi6avyYFWHq0izIjVcEFOrh6Niy6MFOlvDFrAKa6VWO46uOYdJPl50OJkN7pdnKWjzh
	dD3jEhWKXnT39wpB17BMqoXa5RElSFkIjqra1qiSbjFacYdYnxi0V5piD115ZtoIqHEV71VnTlE3H
	eJwPzLweMuKGzw2hRhGvgYA7XZSQ9S6Dj111C1nTilI/BV41hdkyEy0ZMWHQF7EE1Q547cGj7FOeE
	2q/K8+CwuYFZxBQd6HzUZ5jsE3Bvq5xlRqbTYwI4m4dFKMnbiqh06gX6ZlC40sug6rJDM82mhcKZ3
	zUKip086lBKN+znDqqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvFq2-002njT-KY; Mon, 21 Jun 2021 09:03:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvFox-002nCM-4Z; Mon, 21 Jun 2021 09:02:20 +0000
X-UUID: c6a68d608c3240ccbaf1d6b3101a6ab8-20210621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WXFVKisqSjxf3sbvOiOvLJdSURbqehbccMFKkoVE+w4=; 
 b=Oa5YbKr/PtyYF9A2sBy4jDw93wtOHSsDkXOfTEvHCSHBeNBQwWuEiZMYMKE9OXT5RVGeamAiJx67fo4U9xMXc9LfZFNi2Pt8jG3+TAYiULEX0sBKUMKkNUKsyb5DDIO2HgrWzoFe7/JzGuSWWEQoU7pBcJ/taYC2I84BuMWJmus=;
X-UUID: c6a68d608c3240ccbaf1d6b3101a6ab8-20210621
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 319894293; Mon, 21 Jun 2021 02:02:13 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 02:02:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Jun 2021 17:02:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Jun 2021 17:02:09 +0800
From: <kewei.xu@mediatek.com>
To: <bbrezillon@kernel.org>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <xinping.qian@mediatek.com>, Kewei Xu
 <kewei.xu@mediatek.com>
Subject: [PATCH V2 3/3] i2c: mediatek: Isolate speed setting via dts for
 special devices
Date: Mon, 21 Jun 2021 17:01:54 +0800
Message-ID: <1624266114-21539-4-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1624266114-21539-1-git-send-email-kewei.xu@mediatek.com>
References: <1624266114-21539-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_020219_240878_79080398 
X-CRM114-Status: GOOD (  19.99  )
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

From: Kewei Xu <kewei.xu@mediatek.com>

In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
support"), the I2C timing calculation has been revised to support
ac-timing adjustment, however that will break on some I2C components.
As a result we want to introduce a new setting "default-adjust-timing"
so those components can choose to use the old (default) timing algorithm.

Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 77 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 71 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index fe3cea7..88dc462 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -65,6 +65,7 @@
 #define I2C_DMA_HARD_RST		0x0002
 #define I2C_DMA_HANDSHAKE_RST		0x0004
 
+#define I2C_DEFAULT_CLK_DIV		5
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
 #define MAX_CLOCK_DIV			256
@@ -249,6 +250,7 @@ struct mtk_i2c {
 	struct clk *clk_arb;		/* Arbitrator clock for i2c */
 	bool have_pmic;			/* can use i2c pins from PMIC */
 	bool use_push_pull;		/* IO config push-pull mode */
+	bool default_timing_adjust;	/* no timing adjust mode */
 
 	u16 irq_stat;			/* interrupt status */
 	unsigned int clk_src_div;
@@ -526,7 +528,11 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 	else
 		ext_conf_val = I2C_FS_START_CON;
 
-	if (i2c->dev_comp->timing_adjust) {
+	if (i2c->default_timing_adjust) {
+		if (i2c->dev_comp->timing_adjust)
+			mtk_i2c_writew(i2c, I2C_DEFAULT_CLK_DIV - 1,
+				       OFFSET_CLOCK_DIV);
+	} else if (i2c->dev_comp->timing_adjust) {
 		ext_conf_val = i2c->ac_timing.ext;
 		mtk_i2c_writew(i2c, i2c->ac_timing.inter_clk_div,
 			       OFFSET_CLOCK_DIV);
@@ -609,7 +615,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	unsigned int sample_ns = div_u64(1000000000ULL * (sample_cnt + 1),
 					 clk_src);
 
-	if (!i2c->dev_comp->timing_adjust)
+	if (i2c->default_timing_adjust || !i2c->dev_comp->timing_adjust)
 		return 0;
 
 	if (i2c->dev_comp->ltiming_adjust)
@@ -769,7 +775,63 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	return 0;
 }
 
-static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
+static int mtk_i2c_set_speed_default_timing(struct mtk_i2c *i2c, unsigned int parent_clk)
+{
+	unsigned int clk_src;
+	unsigned int step_cnt;
+	unsigned int sample_cnt;
+	unsigned int l_step_cnt;
+	unsigned int l_sample_cnt;
+	unsigned int target_speed;
+	int ret;
+
+	if (i2c->dev_comp->timing_adjust)
+		i2c->clk_src_div *= I2C_DEFAULT_CLK_DIV;
+
+	clk_src = parent_clk / i2c->clk_src_div;
+	target_speed = i2c->speed_hz;
+
+	if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
+		/* Set master code speed register */
+		ret = mtk_i2c_calculate_speed(i2c, clk_src, I2C_MAX_FAST_MODE_FREQ,
+					      &l_step_cnt, &l_sample_cnt);
+		if (ret < 0)
+			return ret;
+
+		i2c->timing_reg = (l_sample_cnt << 8) | l_step_cnt;
+
+		/* Set the high speed mode register */
+		ret = mtk_i2c_calculate_speed(i2c, clk_src, target_speed,
+					      &step_cnt, &sample_cnt);
+		if (ret < 0)
+			return ret;
+
+		i2c->high_speed_reg = I2C_TIME_DEFAULT_VALUE |
+			(sample_cnt << 12) | (step_cnt << 8);
+
+		if (i2c->dev_comp->ltiming_adjust)
+			i2c->ltiming_reg = (l_sample_cnt << 6) | l_step_cnt |
+					   (sample_cnt << 12) | (step_cnt << 9);
+	} else {
+		ret = mtk_i2c_calculate_speed(i2c, clk_src, target_speed,
+					      &step_cnt, &sample_cnt);
+		if (ret < 0)
+			return ret;
+
+		i2c->timing_reg = (sample_cnt << 8) | step_cnt;
+
+		/* Disable the high speed transaction */
+		i2c->high_speed_reg = I2C_TIME_CLR_VALUE;
+
+		if (i2c->dev_comp->ltiming_adjust)
+			i2c->ltiming_reg = (sample_cnt << 6) | step_cnt;
+	}
+
+	return 0;
+}
+
+static int mtk_i2c_set_speed_adjust_timing(struct mtk_i2c *i2c,
+					   unsigned int parent_clk)
 {
 	unsigned int clk_src;
 	unsigned int step_cnt;
@@ -1293,8 +1355,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
 	i2c->use_push_pull =
 		of_property_read_bool(np, "mediatek,use-push-pull");
-
-	i2c_parse_fw_timings(i2c->dev, &i2c->timing_info, true);
+	i2c->default_timing_adjust =
+		of_property_read_bool(np, "mediatek,default-timing-adjust");
 
 	return 0;
 }
@@ -1372,7 +1434,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	strlcpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
 
-	ret = mtk_i2c_set_speed(i2c, clk_get_rate(clk));
+	if (i2c->default_timing_adjust)
+		ret = mtk_i2c_set_speed_default_timing(i2c, clk_get_rate(clk));
+	else
+		ret = mtk_i2c_set_speed_adjust_timing(i2c, clk_get_rate(clk));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set the speed.\n");
 		return -EINVAL;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
