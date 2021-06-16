Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3BDC48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 08:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5795E6109E
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 08:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5795E6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lPcyQHd55mjlb8vFsTywISspBWuqXE35qkL8PKgfHE=; b=Duk3j5IvySDIB7
	oL28fdpGT9LooK1kISAuTnE1XyFju6TPLQ01Mn0H7J54ZoN7RSZL0zMbUv9ONqefz65A3jwX3QBZ7
	yxq6s97AhEcVEy+ssqfa/OJVCos+ux9cePeCQinY1SnRbO2ThmCsesTWnkOIVX0l/wWSI8Nrcje8c
	PVo7I87Vm1RNrIGcjgwXvnQQaXkLaGwsOS6idJ7KY3U+88Snd4XCka91nXDfEXA/cSYz0s7kjcjt8
	OtrXt5As05oxrWj4mIXa1hlhY8SMjbUAB8EfVc9T43OK5T1+N2InI7fmjuOzepoxAKSMJ9O3zXfGZ
	yloJtrXupsDzDh+ZgiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltRJd-005Sv5-Pp; Wed, 16 Jun 2021 08:54:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltRJZ-005Ssb-TB; Wed, 16 Jun 2021 08:54:27 +0000
X-UUID: 035441de0af0418faff6c4223d94132d-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/JVhARZuJ57Dw+4fOKCsb1YM6XDl38WEyUL7iSXsfVA=; 
 b=QHJtbg7pH7rFxB3eveIDrlrstxBedPKc92FUKpsCPtFJvJEGc788/XvzDYtsjuKStB1BS1+G0+jlMeT1XzoeKvmwO5EfCxK3vlFMGWpDiP7eM/LmmAuR2SbemF5o/WNAuNybtrZQZX0aAaOTgKmyA86G50S6P3tKA7mtDMzi4zY=;
X-UUID: 035441de0af0418faff6c4223d94132d-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 511439250; Wed, 16 Jun 2021 01:54:22 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:54:20 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Jun 2021 16:54:17 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 16 Jun 2021 16:54:16 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones
 <lee.jones@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <cawa.cheng@mediatek.com>,
 <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v5 2/3] pwm: mtk_disp: implement atomic API .apply()
Date: Wed, 16 Jun 2021 16:52:23 +0800
Message-ID: <20210616085224.157318-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616085224.157318-1-jitao.shi@mediatek.com>
References: <20210616085224.157318-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8778E6DC5881AEC1A3423F979C3A06474028CD6F8F10002821B84EE58CF337632000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_015426_301251_F3B03F88 
X-CRM114-Status: GOOD (  14.04  )
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
 drivers/pwm/pwm-mtk-disp.c | 69 ++++++++++----------------------------
 1 file changed, 17 insertions(+), 52 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 204d76beeb26..a4766e931b68 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -67,14 +67,25 @@ static void mtk_disp_pwm_update_bits(struct mtk_disp_pwm *mdp, u32 offset,
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
 
+	if (!state->enabled) {
+		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
+					 0x0);
+		if (mdp->enabled) {
+			clk_disable_unprepare(mdp->clk_mm);
+			clk_disable_unprepare(mdp->clk_main);
+		}
+		mdp->enabled = false;
+		return 0;
+	}
+
 	if (!mdp->enabled) {
 		err = clk_prepare_enable(mdp->clk_main);
 		if (err < 0) {
@@ -102,7 +113,7 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * high_width = (PWM_CLK_RATE * duty_ns) / (10^9 * (clk_div + 1))
 	 */
 	rate = clk_get_rate(mdp->clk_main);
-	clk_div = div_u64(rate * period_ns, NSEC_PER_SEC) >>
+	clk_div = div_u64(rate * state->period, NSEC_PER_SEC) >>
 			  PWM_PERIOD_BIT_WIDTH;
 	if (clk_div > PWM_CLKDIV_MAX) {
 		if (!mdp->enabled) {
@@ -112,11 +123,11 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
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
@@ -141,36 +152,6 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 					 mdp->data->con0_sel,
 					 mdp->data->con0_sel);
 	}
-
-	if (!mdp->enabled) {
-		clk_disable_unprepare(mdp->clk_mm);
-		clk_disable_unprepare(mdp->clk_main);
-	}
-
-	return 0;
-}
-
-static int mtk_disp_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
-	int err;
-
-	if (!mdp->enabled) {
-		err = clk_prepare_enable(mdp->clk_main);
-		if (err < 0) {
-			dev_err(chip->dev, "Can't enable mdp->clk_main: %pe\n",
-				ERR_PTR(err));
-			return err;
-		}
-		err = clk_prepare_enable(mdp->clk_mm);
-		if (err < 0) {
-			dev_err(chip->dev, "Can't enable mdp->clk_mm: %pe\n",
-				ERR_PTR(err));
-			clk_disable_unprepare(mdp->clk_main);
-			return err;
-		}
-	}
-
 	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
 				 mdp->data->enable_mask);
 	mdp->enabled = true;
@@ -178,24 +159,8 @@ static int mtk_disp_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	return 0;
 }
 
-static void mtk_disp_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
-
-	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-				 0x0);
-
-	if (mdp->enabled) {
-		clk_disable_unprepare(mdp->clk_mm);
-		clk_disable_unprepare(mdp->clk_main);
-	}
-	mdp->enabled = false;
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
