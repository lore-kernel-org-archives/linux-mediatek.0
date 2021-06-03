Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06FEC47082
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 10:06:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B795611CA
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 10:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B795611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XXh+mZBHR1sXkYadp+bIdigHNf4KnnfG8GYN/UQApI=; b=YoxzxU2ElxLz5q
	+zUCftngd3gY9bWvCge+Xb6b8aGepDPu5zRlGV3xcwlA1iysh27+pdwC0LuOTAmojxEHg436ZPM9T
	DUJ3cbxfpp3KHwFqzNGjpBW6YnmBek3iZsSctn29gVQ27VKAKOo53domdZ6ni+Be6k30mCi/uFXMK
	ups+zUhXxjYrYEzTnPwHTKm12WizkPlq2F+LmMy4AyH6FjU/K1Os3+A594Y/inapOXb7bAoGZEBtb
	0waavNxhQ9pyodn7Jj+ImoXLhD6CJ3w5TQwo976Eq4yMOa6ATooFfnp8QhbAjqhL5KOpr2T3UIGre
	In/5GK/7rnqccms67u8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lokF7-0080tp-JA; Thu, 03 Jun 2021 10:06:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lokEU-0080em-Vg; Thu, 03 Jun 2021 10:05:48 +0000
X-UUID: b36ad4045dfc4ffda56b9272d6a46e46-20210603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QqNKLLnVKmpfmXU5JOxvCuHSUVBulaReraScJ4dYxAg=; 
 b=bWZ5cBP62iB5ga5nDrWGOHFdDKpekzFp/qA5yORgeV12phdq7ZxjmuBffkR/0H7P9ZC9cn0C8W5HsBRW+EuYF9pkYQ9iyk8w6do0TYpaVYTMlR4wd6hzNHqAV8uLmgeM0cPAtoDSF2cELJWgRWVrcdXiPaqXHBxwp8d7tYb3+Mc=;
X-UUID: b36ad4045dfc4ffda56b9272d6a46e46-20210603
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2043694545; Thu, 03 Jun 2021 03:05:44 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 03:05:43 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Jun 2021 18:05:38 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 3 Jun 2021 18:05:38 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <cawa.cheng@mediatek.com>,
 <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v4 3/3] pwm: mtk-disp: Switch to atomic API
Date: Thu, 3 Jun 2021 18:05:31 +0800
Message-ID: <20210603100531.161901-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603100531.161901-1-jitao.shi@mediatek.com>
References: <20210603100531.161901-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BF5039ACF230207A3A171D0F20606B00DFDFFF836FCB485BEBAA3C56F56918192000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_030547_114795_8C93BCB6 
X-CRM114-Status: GOOD (  14.29  )
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

Convert the legacy api to atomic API.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 78 ++++++++++++++++++++++++++++----------
 1 file changed, 59 insertions(+), 19 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index b87b3c00a685..d77348d0527c 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -67,8 +67,8 @@ static void mtk_disp_pwm_update_bits(struct mtk_disp_pwm *mdp, u32 offset,
 	writel(value, address);
 }
 
-static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			       int duty_ns, int period_ns)
+static int mtk_disp_pwm_config(struct pwm_chip *chip,
+			       const struct pwm_state *state)
 {
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
 	u32 clk_div, period, high_width, value;
@@ -102,7 +102,7 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * high_width = (PWM_CLK_RATE * duty_ns) / (10^9 * (clk_div + 1))
 	 */
 	rate = clk_get_rate(mdp->clk_main);
-	clk_div = div_u64(rate * period_ns, NSEC_PER_SEC) >>
+	clk_div = div_u64(rate * state->period, NSEC_PER_SEC) >>
 			  PWM_PERIOD_BIT_WIDTH;
 	if (clk_div > PWM_CLKDIV_MAX) {
 		dev_err(chip->dev, "clock rate is too high: rate = %d Hz\n",
@@ -114,11 +114,11 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
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
@@ -144,39 +144,79 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 					 mdp->data->con0_sel);
 	}
 
+	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
+				 mdp->data->enable_mask);
+	mdp->enabled = true;
+
 	return 0;
 }
 
-static int mtk_disp_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
+static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			      const struct pwm_state *state)
 {
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
-	int err;
 
-	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-				 mdp->data->enable_mask);
-	mdp->enabled = true;
+	if (!state->enabled) {
+		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
+					 0x0);
 
-	return 0;
+		if (mdp->enabled) {
+			clk_disable_unprepare(mdp->clk_mm);
+			clk_disable_unprepare(mdp->clk_main);
+		}
+		mdp->enabled = false;
+		return 0;
+	}
+
+	return mtk_disp_pwm_config(chip, state);
 }
 
-static void mtk_disp_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
+static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
+				   struct pwm_device *pwm,
+				   struct pwm_state *state)
 {
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
+	u32 clk_div, period, high_width, con0, con1;
+	u64 rate;
+	int err;
 
-	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-				 0x0);
+	if (!mdp->enabled) {
+		err = clk_prepare_enable(mdp->clk_main);
+		if (err < 0) {
+			dev_err(chip->dev, "Can't enable mdp->clk_main: %d\n", err);
+			return;
+		}
+		err = clk_prepare_enable(mdp->clk_mm);
+		if (err < 0) {
+			dev_err(chip->dev, "Can't enable mdp->clk_mm: %d\n", err);
+			clk_disable_unprepare(mdp->clk_main);
+			return;
+		}
+	}
+
+	rate = clk_get_rate(mdp->clk_main);
 
-	if (mdp->enabled) {
+	con0 = readl(mdp->base + mdp->data->con0);
+	con1 = readl(mdp->base + mdp->data->con1);
+
+	state->enabled = !!(con0 & BIT(0));
+
+	clk_div = (con0 & PWM_CLKDIV_MASK) >> PWM_CLKDIV_SHIFT;
+	period = con1 & PWM_PERIOD_MASK;
+	state->period = div_u64(period * (clk_div + 1) * NSEC_PER_SEC, rate);
+	high_width = (con1 & PWM_HIGH_WIDTH_MASK) >> PWM_HIGH_WIDTH_SHIFT;
+	state->duty_cycle = div_u64(high_width * (clk_div + 1) * NSEC_PER_SEC,
+				    rate);
+
+	if (!mdp->enabled) {
 		clk_disable_unprepare(mdp->clk_mm);
 		clk_disable_unprepare(mdp->clk_main);
 	}
-	mdp->enabled = false;
 }
 
 static const struct pwm_ops mtk_disp_pwm_ops = {
-	.config = mtk_disp_pwm_config,
-	.enable = mtk_disp_pwm_enable,
-	.disable = mtk_disp_pwm_disable,
+	.apply = mtk_disp_pwm_apply,
+	.get_state = mtk_disp_pwm_get_state,
 	.owner = THIS_MODULE,
 };
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
