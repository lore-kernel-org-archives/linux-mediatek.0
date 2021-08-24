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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA31C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 03:31:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A2C61212
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 03:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31A2C61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBySzkER/tPNhb8pV0Ga81JqWNwO4NiSdvqc5JT4wm4=; b=oWgCbjyOZegrxD
	E9/6Kz85xNNYAoH5BtjqksGd3GjXkjeiRJKOXCrgtVy/mqMhgPJES9+jKjiR3Nor/qxIJU2HWJ4zX
	XbFE+3jFiHY5GoTM1sttv5gssKp+u+wLz9b/rWIWbRIwy7XJZuSh9kcz6NBn1CbO9tFj6UccWfHU9
	7pNdCuHN26wQloqOFNDYaBcWDwlcqLzc0raEqMvzFoVWkCyU2aV/MJpx9g3ALYcjEaxZxLLMDuKUr
	8pHjjzxScpJrdhLjcexMj1wptepoMnbxsbCPjdvAA8dLVpm8TdGKi8Xe4Dq8kFjjYFqcATw2jU/S4
	6dayoavqMldU3c6rnwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mINA1-001O9H-Eh; Tue, 24 Aug 2021 03:31:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIN9C-001Nlh-3o; Tue, 24 Aug 2021 03:30:48 +0000
X-UUID: f819143bcdb44f8f9278934d8fb87c81-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IxNFEbPUEp0HM1BZxp3IpWHUV1MdU7SEiF8+P+jat+Q=; 
 b=BBDY8jdo7/i2sKlh2aqGYRY4GFb7KvLE1vNqDZsa9d3hB6JSifEMN6OQDxewqVdcFKVdLdTXApvuR8oKLmsd570K5xiHManZylFbz6aygG//nkNvh4hF2mLvckKlXwQV6YQXwRCj+t1F79UYEz6opXb9KWX0GOf4SyRkqta3w04=;
X-UUID: f819143bcdb44f8f9278934d8fb87c81-20210823
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1067080247; Mon, 23 Aug 2021 20:30:41 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 20:30:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 11:30:38 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 11:30:37 +0800
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
Subject: [RESEND PATCH v5 6/7] i2c: mediatek: Isolate speed setting via dts
 for special devices
Date: Tue, 24 Aug 2021 11:30:27 +0800
Message-ID: <1629775828-19993-7-git-send-email-kewei.xu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
References: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_203046_224381_D597B6F1 
X-CRM114-Status: GOOD (  20.75  )
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

In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
support"), the I2C timing calculation has been revised to support
ac-timing adjustment, however that will break on some I2C components.
As a result we want to introduce a new setting "default-adjust-timing"
so those components can choose to use the old (default) timing algorithm.

Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 77 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 73 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 4da6b43..18b5659 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -66,6 +66,7 @@
 #define I2C_DMA_HARD_RST		0x0002
 #define I2C_DMA_HANDSHAKE_RST		0x0004
 
+#define I2C_DEFAULT_CLK_DIV		5
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
 #define MAX_CLOCK_DIV			256
@@ -250,6 +251,7 @@ struct mtk_i2c {
 	struct clk *clk_arb;		/* Arbitrator clock for i2c */
 	bool have_pmic;			/* can use i2c pins from PMIC */
 	bool use_push_pull;		/* IO config push-pull mode */
+	bool use_default_timing;	/* no timing adjust mode */
 
 	u16 irq_stat;			/* interrupt status */
 	unsigned int clk_src_div;
@@ -532,7 +534,11 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 	else
 		ext_conf_val = I2C_FS_START_CON;
 
-	if (i2c->dev_comp->timing_adjust) {
+	if (i2c->use_default_timing) {
+		if (i2c->dev_comp->timing_adjust)
+			mtk_i2c_writew(i2c, I2C_DEFAULT_CLK_DIV - 1,
+				       OFFSET_CLOCK_DIV);
+	} else if (i2c->dev_comp->timing_adjust) {
 		ext_conf_val = i2c->ac_timing.ext;
 		mtk_i2c_writew(i2c, i2c->ac_timing.inter_clk_div,
 			       OFFSET_CLOCK_DIV);
@@ -615,7 +621,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	unsigned int sample_ns = div_u64(1000000000ULL * (sample_cnt + 1),
 					 clk_src);
 
-	if (!i2c->dev_comp->timing_adjust)
+	if (i2c->use_default_timing || !i2c->dev_comp->timing_adjust)
 		return 0;
 
 	if (i2c->dev_comp->ltiming_adjust)
@@ -775,7 +781,65 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	return 0;
 }
 
-static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
+static int mtk_i2c_set_speed_default_timing(struct mtk_i2c *i2c,
+					    unsigned int parent_clk)
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
+		ret = mtk_i2c_calculate_speed(i2c, clk_src,
+					      I2C_MAX_FAST_MODE_FREQ,
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
@@ -1271,6 +1335,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
 	i2c->use_push_pull =
 		of_property_read_bool(np, "mediatek,use-push-pull");
+	i2c->use_default_timing =
+		of_property_read_bool(np, "mediatek,use-default-timing");
 
 	i2c_parse_fw_timings(i2c->dev, &i2c->timing_info, true);
 
@@ -1357,7 +1423,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	strlcpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
 
-	ret = mtk_i2c_set_speed(i2c, clk_get_rate(clk));
+	if (i2c->use_default_timing)
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
