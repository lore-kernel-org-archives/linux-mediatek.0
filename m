Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204C8C4707F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:49:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D21BF61090
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D21BF61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cfmHa527IuRp2SLhf6J2xtzpQTSIVYuHlPn1dn4iB8=; b=kPHAhYIIP4jsyw
	27WEiAr/vnRRySkOc1d8d6jEpoDco0nkDejVV4Ic7XkGVelIOEsHpajfgiBIH2e3hGQ7gAKxgJhME
	c99aQsB4J656YxqGM00CNqsPIwFJwQOXNUbsb4kOKrO1ZYr7PTOhT58oDBF9pu1rX7s9JfRTdRbkO
	X4UsLlAUvqT75Ntniew1oBslNnyJWFuT2vto86w0sl/K92ab287lLNO5GEzdwW3LExaQIwlZvT8El
	9fyn/wHgLLR1hJFkcJHbE52QsDCGFdG1gY1NeQu7GBXrAUzOLFSQ6/b423Pu07jnfvAe2sYXg66DE
	+YYNtzEzc7Pn00VF6vWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lljbl-00AEyc-GW; Wed, 26 May 2021 02:49:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lljbT-00AEmn-BS; Wed, 26 May 2021 02:49:05 +0000
X-UUID: 92623b3f61ce417b81015aef303c4140-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8nbeH06NFP6eUTnDEu6NUPXmY+6twJtP65hfMHmJhSQ=; 
 b=oov1i1PiNE+MsINVbfIPyVyb4oTiynVHamErtYX31giLjoMyncru8+5ClM63Z+UPonKZnuSo2AvaZYKbHqdpllntNRvx+YY30hNlU27RiCWfSA2Wlsx8tZuz8xcs7UyQmwE6wEhzwqtQ5LYPARHLy+bmWieP9udFEwxDesrVlKA=;
X-UUID: 92623b3f61ce417b81015aef303c4140-20210525
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1070407433; Tue, 25 May 2021 19:49:01 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 19:48:59 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 10:48:50 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 26 May 2021 10:48:49 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <cawa.cheng@mediatek.com>,
 <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v3 2/3] pwm: mtk_disp: implement atomic API .apply()
Date: Wed, 26 May 2021 10:48:45 +0800
Message-ID: <20210526024846.120838-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526024846.120838-1-jitao.shi@mediatek.com>
References: <20210526024846.120838-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 80BEA21B4CD8C9F0031E778334128608FA1B12B6D78293AE391449E7867A17C42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_194903_502250_A817C0E5 
X-CRM114-Status: GOOD (  17.34  )
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

Change-Id: Ic82e5abe8d5f92302a5fe9e6736b84232b328b61
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 114 +++++++++++++++++++------------------
 1 file changed, 58 insertions(+), 56 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index bc2fdbe853ba..9c95b9af417f 100644
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
 
@@ -204,19 +219,6 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 
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
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
