Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBB1C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 14:13:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B793A64DD6
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 14:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B793A64DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QoEztag6suy13agAt7NEIa2ydcGW5o7Mv2lyNYrgCaI=; b=AC+bFXGsssTiBUcOblZhHNUUG
	s42X2wYd5180pIJiEzsxZBJ2P1q7zObVbu37q9s5wnIM4ssRcDDsX5sSeADngosNYDQy6q5N1Ygh+
	PbWqvld+A966iPWVCfV6QHCYK6p4+Atzb4CDhXp9C/NXhk811kkh8rCjkx0903MaJ8ssG/QBx8F9e
	TdAYRCHBJ7YwaP/424QeJL8Y4/vqD5eDyDSicl2sNAJSzKuK1ukBr4ss2VohsbsPcVRdaQqp6b0/H
	oIVHop588Qzayq6Hh9mXMPNAiTBdv211sXLMzWT3Y56HphK/wEtka6jRv+xkRFQXNvLNv+qoQy+IS
	trhEsebfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5qzq-0002jN-87; Sat, 30 Jan 2021 14:13:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5qzj-0002hf-SD; Sat, 30 Jan 2021 14:13:00 +0000
X-UUID: cfa2bd6254704cc79a8f104fc7b752c7-20210130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=z142kMA0V7srCpnz5rA7rkyxFV15vbaj4XAybX9DI1o=; 
 b=BFrbu5itZILlCInbeZ8e9/z/XdLYD+l/2wGDNirjavqz1DCZ9sDt7mSNNJPEaBpow3O97pLUaLOfaL1UnryWbnIUzSEgyR+MmXPXPEzzhuOdXSOX9Lr9ESLMauhc09KuUVAEdozu/TW6qOYT2j3Hj4BEAwIwYrVA6ayyjgDZY8o=;
X-UUID: cfa2bd6254704cc79a8f104fc7b752c7-20210130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 160886914; Sat, 30 Jan 2021 06:12:56 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Jan 2021 06:12:55 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 30 Jan 2021 22:12:32 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 30 Jan 2021 22:12:31 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/3] pwm: mtk_disp: convert the driver to atomic API
Date: Sat, 30 Jan 2021 22:12:25 +0800
Message-ID: <20210130141226.25357-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20210130141226.25357-1-jitao.shi@mediatek.com>
References: <20210130141226.25357-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7980460A0CAC2FAEAD795254A8283D03A4B70DDD090646ABA84D650C63F783632000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_091300_060692_1DC60899 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: linux-pwm@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Switch the driver to atomic API apply().

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 114 +++++++++++++++++++++++----------------------
 1 file changed, 58 insertions(+), 56 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 21416a8b6b47..502228adf718 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -20,6 +20,7 @@
 #define PWM_CLKDIV_SHIFT	16
 #define PWM_CLKDIV_MAX		0x3ff
 #define PWM_CLKDIV_MASK		(PWM_CLKDIV_MAX << PWM_CLKDIV_SHIFT)
+#define PWM_POLARITY	BIT(2)
 
 #define PWM_PERIOD_BIT_WIDTH	12
 #define PWM_PERIOD_MASK		((1 << PWM_PERIOD_BIT_WIDTH) - 1)
@@ -47,6 +48,7 @@ struct mtk_disp_pwm {
 	struct clk *clk_main;
 	struct clk *clk_mm;
 	void __iomem *base;
+	bool enabled;
 };
 
 static inline struct mtk_disp_pwm *to_mtk_disp_pwm(struct pwm_chip *chip)
@@ -66,11 +68,11 @@ static void mtk_disp_pwm_update_bits(struct mtk_disp_pwm *mdp, u32 offset,
 	writel(value, address);
 }
 
-static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			       int duty_ns, int period_ns)
+static int mtk_disp_pwm_enable(struct pwm_chip *chip,
+			       const struct pwm_state *state)
 {
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
-	u32 clk_div, period, high_width, value;
+	u32 clk_div, period, high_width, value, polarity;
 	u64 div, rate;
 	int err;
 
@@ -84,33 +86,47 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * period = (PWM_CLK_RATE * period_ns) / (10^9 * (clk_div + 1)) - 1
 	 * high_width = (PWM_CLK_RATE * duty_ns) / (10^9 * (clk_div + 1))
 	 */
+	if (!mdp->enabled) {
+		err = clk_prepare_enable(mdp->clk_main);
+		if (err < 0) {
+			dev_err(chip->dev, "Can't enable mdp->clk_main: %d\n",
+				err);
+			return err;
+		}
+		err = clk_prepare_enable(mdp->clk_mm);
+		if (err < 0) {
+			dev_err(chip->dev, "Can't enable mdp->clk_mm: %d\n",
+				err);
+			clk_disable_unprepare(mdp->clk_main);
+			return err;
+		}
+	}
 	rate = clk_get_rate(mdp->clk_main);
-	clk_div = div_u64(rate * period_ns, NSEC_PER_SEC) >>
+	clk_div = div_u64(rate * state->period, NSEC_PER_SEC) >>
 			  PWM_PERIOD_BIT_WIDTH;
-	if (clk_div > PWM_CLKDIV_MAX)
+	if (clk_div > PWM_CLKDIV_MAX) {
+		dev_err(chip->dev, "clock rate is too high: rate = %d Hz\n",
+			rate);
+		clk_disable_unprepare(mdp->clk_mm);
+		clk_disable_unprepare(mdp->clk_main);
 		return -EINVAL;
-
+	}
 	div = NSEC_PER_SEC * (clk_div + 1);
-	period = div64_u64(rate * period_ns, div);
+	period = div64_u64(rate * state->period, div);
 	if (period > 0)
 		period--;
 
-	high_width = div64_u64(rate * duty_ns, div);
+	high_width = div64_u64(rate * state->duty_cycle, div);
 	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
-
-	err = clk_enable(mdp->clk_main);
-	if (err < 0)
-		return err;
-
-	err = clk_enable(mdp->clk_mm);
-	if (err < 0) {
-		clk_disable(mdp->clk_main);
-		return err;
-	}
+	polarity = 0;
+	if (state->polarity == PWM_POLARITY_INVERSED)
+		polarity = PWM_POLARITY;
 
 	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
 				 PWM_CLKDIV_MASK,
 				 clk_div << PWM_CLKDIV_SHIFT);
+	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
+				 PWM_POLARITY, polarity);
 	mtk_disp_pwm_update_bits(mdp, mdp->data->con1,
 				 PWM_PERIOD_MASK | PWM_HIGH_WIDTH_MASK,
 				 value);
@@ -122,50 +138,49 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		mtk_disp_pwm_update_bits(mdp, mdp->data->commit,
 					 mdp->data->commit_mask,
 					 0x0);
+	} else {
+		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
+					 mdp->data->bls_debug_mask,
+					 mdp->data->bls_debug_mask);
+		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
+					 mdp->data->con0_sel,
+					 mdp->data->con0_sel);
 	}
 
-	clk_disable(mdp->clk_mm);
-	clk_disable(mdp->clk_main);
-
+	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
+				 mdp->data->enable_mask);
+	mdp->enabled = true;
 	return 0;
 }
 
-static int mtk_disp_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
+static int mtk_disp_pwm_disable(struct pwm_chip *chip,
+				const struct pwm_state *state)
 {
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
-	int err;
-
-	err = clk_enable(mdp->clk_main);
-	if (err < 0)
-		return err;
 
-	err = clk_enable(mdp->clk_mm);
-	if (err < 0) {
-		clk_disable(mdp->clk_main);
-		return err;
+	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
+				 0x0);
+	if (mdp->enabled) {
+		clk_disable_unprepare(mdp->clk_mm);
+		clk_disable_unprepare(mdp->clk_main);
 	}
 
-	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-				 mdp->data->enable_mask);
+	mdp->enabled = false;
 
 	return 0;
 }
 
-static void mtk_disp_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
+static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			      const struct pwm_state *state)
 {
-	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
+	if (!state->enabled)
+		return mtk_disp_pwm_disable(chip, state);
 
-	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-				 0x0);
-
-	clk_disable(mdp->clk_mm);
-	clk_disable(mdp->clk_main);
+	return mtk_disp_pwm_enable(chip, state);
 }
 
 static const struct pwm_ops mtk_disp_pwm_ops = {
-	.config = mtk_disp_pwm_config,
-	.enable = mtk_disp_pwm_enable,
-	.disable = mtk_disp_pwm_disable,
+	.apply = mtk_disp_pwm_apply,
 	.owner = THIS_MODULE,
 };
 
@@ -205,19 +220,6 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mdp);
 
-	/*
-	 * For MT2701, disable double buffer before writing register
-	 * and select manual mode and use PWM_PERIOD/PWM_HIGH_WIDTH.
-	 */
-	if (!mdp->data->has_commit) {
-		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
-					 mdp->data->bls_debug_mask,
-					 mdp->data->bls_debug_mask);
-		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
-					 mdp->data->con0_sel,
-					 mdp->data->con0_sel);
-	}
-
 	return 0;
 }
 
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
