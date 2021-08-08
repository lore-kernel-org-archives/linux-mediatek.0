Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE93FC4320E
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA33E61002
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA33E61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7AjwuEt7A/X5Z2wVgceCPSgyKxLJkbIy2+a1txPb44=; b=ZB9zD1jKcBs4kf
	H15ipi7eLPYmWKuwG/FdWkAh7ksCR318yTy2wKt1qTlpj7GNiAB8S6gftq3PNKW+4wkdLrcRTGC8g
	2YXPdDhKO5xLoYEcSkkkJHFOd1+pemu60d2XKg+hGe4wC7kgv5+VEaiosUcKcafe6R9j9r/XzJ5DP
	Vm1h1Ody+5qOkVjdXlBk66b7TEN1XJKkOZfjy5OCpeSrCWKHzxvEboC4xoV/rI+x1iXneHX1GGiaK
	6kvlTujW6YXd3Nl22UEJZ7Tbr1jNUoOj/ln+IZH85VckAYOkVech8hF+ZaDSPHr0eKTa/5yxn3Wmf
	7SHSvmT51s7xoIrGBfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCing-00Fsxn-G9; Sun, 08 Aug 2021 13:25:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCinH-00Fsqg-Js; Sun, 08 Aug 2021 13:24:49 +0000
X-UUID: 14d54f88ed1d44869016bfb06d36c5c4-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tM+NAWWNnNhPu8Jhbb2yxWWm9Io9X8Hw5AFm5lz7rYk=; 
 b=PPXy9IVToI1JLtX+fmX9lNznFnRbFHEvdVeax7HJaUe8uiTi3zskHFBgapMz3wJ9hSc5SLSzEISv3ABF/8JT/cMocCKjUp2plrHNT96W3JV1+PIVHc0B5C6nGRf8hWJa97jvyJ3iSoEPIXIBps+H62KLjP3cSV+gDAM+XrEYmxo=;
X-UUID: 14d54f88ed1d44869016bfb06d36c5c4-20210808
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1459060213; Sun, 08 Aug 2021 06:24:46 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 06:24:44 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 8 Aug 2021 21:24:39 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 8 Aug 2021 21:24:38 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones
 <lee.jones@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, <shuijing.li@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Subject: [PATCH v7 3/5] pwm: mtk_disp: implement atomic API .apply()
Date: Sun, 8 Aug 2021 21:24:31 +0800
Message-ID: <20210808132433.66037-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808132433.66037-1-jitao.shi@mediatek.com>
References: <20210808132433.66037-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4DAA6490F08629866DF748D93C252BA27607E40579FF54F1C8D7E55B7CD856012000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_062447_698893_3B31AE57 
X-CRM114-Status: GOOD (  14.56  )
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

Switch the driver to support the .apply() method.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 93 ++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 55 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 1070d78d4940..599d7dd8ecab 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -47,6 +47,7 @@ struct mtk_disp_pwm {
 	struct clk *clk_main;
 	struct clk *clk_mm;
 	void __iomem *base;
+	bool enabled;
 };
 
 static inline struct mtk_disp_pwm *to_mtk_disp_pwm(struct pwm_chip *chip)
@@ -66,25 +67,42 @@ static void mtk_disp_pwm_update_bits(struct mtk_disp_pwm *mdp, u32 offset,
 	writel(value, address);
 }
 
-static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			       int duty_ns, int period_ns)
+static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			      const struct pwm_state *state)
 {
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
 	u32 clk_div, period, high_width, value;
 	u64 div, rate;
 	int err;
 
-	err = clk_prepare_enable(mdp->clk_main);
-	if (err < 0) {
-		dev_err(chip->dev, "Can't enable mdp->clk_main: %pe\n", ERR_PTR(err));
-		return err;
+	if (state->polarity != PWM_POLARITY_NORMAL)
+		return -EINVAL;
+
+	if (!state->enabled) {
+		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
+					 0x0);
+		if (mdp->enabled) {
+			clk_disable_unprepare(mdp->clk_mm);
+			clk_disable_unprepare(mdp->clk_main);
+		}
+		mdp->enabled = false;
+		return 0;
 	}
 
-	err = clk_prepare_enable(mdp->clk_mm);
-	if (err < 0) {
-		dev_err(chip->dev, "Can't enable mdp->clk_mm: %pe\n", ERR_PTR(err));
-		clk_disable_unprepare(mdp->clk_main);
-		return err;
+	if (!mdp->enabled) {
+		err = clk_prepare_enable(mdp->clk_main);
+		if (err < 0) {
+			dev_err(chip->dev, "Can't enable mdp->clk_main: %pe\n",
+				ERR_PTR(err));
+			return err;
+		}
+		err = clk_prepare_enable(mdp->clk_mm);
+		if (err < 0) {
+			dev_err(chip->dev, "Can't enable mdp->clk_mm: %pe\n",
+				ERR_PTR(err));
+			clk_disable_unprepare(mdp->clk_main);
+			return err;
+		}
 	}
 
 	/*
@@ -98,20 +116,22 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * high_width = (PWM_CLK_RATE * duty_ns) / (10^9 * (clk_div + 1))
 	 */
 	rate = clk_get_rate(mdp->clk_main);
-	clk_div = div_u64(rate * period_ns, NSEC_PER_SEC) >>
+	clk_div = div_u64(rate * state->period, NSEC_PER_SEC) >>
 			  PWM_PERIOD_BIT_WIDTH;
 	if (clk_div > PWM_CLKDIV_MAX) {
-		clk_disable_unprepare(mdp->clk_mm);
-		clk_disable_unprepare(mdp->clk_main);
+		if (!mdp->enabled) {
+			clk_disable_unprepare(mdp->clk_mm);
+			clk_disable_unprepare(mdp->clk_main);
+		}
 		return -EINVAL;
 	}
 
 	div = NSEC_PER_SEC * (clk_div + 1);
-	period = div64_u64(rate * period_ns, div);
+	period = div64_u64(rate * state->period, div);
 	if (period > 0)
 		period--;
 
-	high_width = div64_u64(rate * duty_ns, div);
+	high_width = div64_u64(rate * state->duty_cycle, div);
 	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
 
 	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
@@ -140,52 +160,15 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 					 mdp->data->con0_sel,
 					 mdp->data->con0_sel);
 	}
-
-	clk_disable_unprepare(mdp->clk_mm);
-	clk_disable_unprepare(mdp->clk_main);
-
-	return 0;
-}
-
-static int mtk_disp_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
-	int err;
-
-	err = clk_prepare_enable(mdp->clk_main);
-	if (err < 0) {
-		dev_err(chip->dev, "Can't enable mdp->clk_main: %pe\n", ERR_PTR(err));
-		return err;
-	}
-
-	err = clk_prepare_enable(mdp->clk_mm);
-	if (err < 0) {
-		dev_err(chip->dev, "Can't enable mdp->clk_mm: %pe\n", ERR_PTR(err));
-		clk_disable_unprepare(mdp->clk_main);
-		return err;
-	}
-
 	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
 				 mdp->data->enable_mask);
+	mdp->enabled = true;
 
 	return 0;
 }
 
-static void mtk_disp_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
-
-	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-				 0x0);
-
-	clk_disable_unprepare(mdp->clk_mm);
-	clk_disable_unprepare(mdp->clk_main);
-}
-
 static const struct pwm_ops mtk_disp_pwm_ops = {
-	.config = mtk_disp_pwm_config,
-	.enable = mtk_disp_pwm_enable,
-	.disable = mtk_disp_pwm_disable,
+	.apply = mtk_disp_pwm_apply,
 	.owner = THIS_MODULE,
 };
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
