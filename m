Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9138C47096
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 10:06:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A941461057
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 10:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A941461057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJ+/p8lVmDrWfebbv0zRkO8m2tRHDqNBDd0f9QuY660=; b=MJmnIti+pJmaya
	6Msx7Up+gmEuto+Vwx62JtA+6pFE1HZ5zM3fhc6jS96+KWbzWMX0BScDOqIR36a/s9AjXx2V7sk16
	D/i5M/sGVCSh1J3OGMAII21CkKgBQZaWdZOtTndoutCKepUmx7OH//dLtkXvkehd7/6a1erPHqyNs
	u2zKKT1z0p6u509rNIKY7QNYL9wQ7U2obCO1cWeXm4PwrupAvTIWEBJxvLrw6O0JvOg2i5CRQu0sA
	Ye+brQc88bL5Knaus7MgGCWdnY8I7TZ0lZvyDaC9Cu8CMQpjCX6rLcRgMVexYF+iYywxjw/VZlJpr
	5eZp5QLkNOG9G98jFpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lokEi-0080lN-8A; Thu, 03 Jun 2021 10:06:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lokES-0080em-NU; Thu, 03 Jun 2021 10:05:46 +0000
X-UUID: 1c4cdc7491f24869b522b84ffc5b171e-20210603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YNbAAjwe3Tas+/FGMxKXSmSdGqigi5knEDo/2a/57Dg=; 
 b=XlFBHZThZlkLGYVy4Pk6bEuAcDRAFz2MMQXU7RGag+xMN21cYynpi8hPNfrqFxlgREWKrb1gOF8C87TVZbnCJAnoFbbb5OtLTcZ2VA7wNL+LrZgwCHwHNWaRg7R19MQySutS/wm9ASE6B6gGwTQ3iwU3gVZd4UhnZCJcgG/494I=;
X-UUID: 1c4cdc7491f24869b522b84ffc5b171e-20210603
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1244654212; Thu, 03 Jun 2021 03:05:40 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 03:05:39 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Jun 2021 18:05:36 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 3 Jun 2021 18:05:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <cawa.cheng@mediatek.com>,
 <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v4 1/3] pwm: mtk-disp: adjust the clocks to avoid them mismatch
Date: Thu, 3 Jun 2021 18:05:29 +0800
Message-ID: <20210603100531.161901-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603100531.161901-1-jitao.shi@mediatek.com>
References: <20210603100531.161901-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3246ED2CBDC04E5775C7CF41B260AE6F4A0EF525BDB6E497B03331E47BD24CAD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_030545_172157_0A6C9B73 
X-CRM114-Status: GOOD (  16.72  )
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

The clk_main and clk_mm clocks are still on when system enter
suspend. That will casue the power consumption.

The clocks call the clk_prepare() in probe(), but the clk_unprepare()
is called in remove(), it isn't called when system suspend.

Remove the clcok opterations from probe() and remove.
Add the clk_prepare_enable() in config().
Add the clk_disable_unprepare() in disable().

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 81 ++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 48 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 9b3ba401a3db..b5771e2c54b8 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -47,6 +47,7 @@ struct mtk_disp_pwm {
 	struct clk *clk_main;
 	struct clk *clk_mm;
 	void __iomem *base;
+	bool enabled;
 };
 
 static inline struct mtk_disp_pwm *to_mtk_disp_pwm(struct pwm_chip *chip)
@@ -74,6 +75,22 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	u64 div, rate;
 	int err;
 
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
+
 	/*
 	 * Find period, high_width and clk_div to suit duty_ns and period_ns.
 	 * Calculate proper div value to keep period value in the bound.
@@ -87,9 +104,15 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	rate = clk_get_rate(mdp->clk_main);
 	clk_div = div_u64(rate * period_ns, NSEC_PER_SEC) >>
 			  PWM_PERIOD_BIT_WIDTH;
-	if (clk_div > PWM_CLKDIV_MAX)
+	if (clk_div > PWM_CLKDIV_MAX) {
+		dev_err(chip->dev, "clock rate is too high: rate = %d Hz\n",
+			rate);
+		if (!mdp->enabled) {
+			clk_disable_unprepare(mdp->clk_mm);
+			clk_disable_unprepare(mdp->clk_main);
+		}
 		return -EINVAL;
-
+	}
 	div = NSEC_PER_SEC * (clk_div + 1);
 	period = div64_u64(rate * period_ns, div);
 	if (period > 0)
@@ -98,16 +121,6 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	high_width = div64_u64(rate * duty_ns, div);
 	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
 
-	err = clk_enable(mdp->clk_main);
-	if (err < 0)
-		return err;
-
-	err = clk_enable(mdp->clk_mm);
-	if (err < 0) {
-		clk_disable(mdp->clk_main);
-		return err;
-	}
-
 	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
 				 PWM_CLKDIV_MASK,
 				 clk_div << PWM_CLKDIV_SHIFT);
@@ -124,9 +137,6 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 					 0x0);
 	}
 
-	clk_disable(mdp->clk_mm);
-	clk_disable(mdp->clk_main);
-
 	return 0;
 }
 
@@ -135,18 +145,9 @@ static int mtk_disp_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
 	int err;
 
-	err = clk_enable(mdp->clk_main);
-	if (err < 0)
-		return err;
-
-	err = clk_enable(mdp->clk_mm);
-	if (err < 0) {
-		clk_disable(mdp->clk_main);
-		return err;
-	}
-
 	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
 				 mdp->data->enable_mask);
+	mdp->enabled = true;
 
 	return 0;
 }
@@ -158,8 +159,11 @@ static void mtk_disp_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
 				 0x0);
 
-	clk_disable(mdp->clk_mm);
-	clk_disable(mdp->clk_main);
+	if (mdp->enabled) {
+		clk_disable_unprepare(mdp->clk_mm);
+		clk_disable_unprepare(mdp->clk_main);
+	}
+	mdp->enabled = false;
 }
 
 static const struct pwm_ops mtk_disp_pwm_ops = {
@@ -192,14 +196,6 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(mdp->clk_mm))
 		return PTR_ERR(mdp->clk_mm);
 
-	ret = clk_prepare(mdp->clk_main);
-	if (ret < 0)
-		return ret;
-
-	ret = clk_prepare(mdp->clk_mm);
-	if (ret < 0)
-		goto disable_clk_main;
-
 	mdp->chip.dev = &pdev->dev;
 	mdp->chip.ops = &mtk_disp_pwm_ops;
 	mdp->chip.npwm = 1;
@@ -207,7 +203,7 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	ret = pwmchip_add(&mdp->chip);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
-		goto disable_clk_mm;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -226,24 +222,13 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-
-disable_clk_mm:
-	clk_unprepare(mdp->clk_mm);
-disable_clk_main:
-	clk_unprepare(mdp->clk_main);
-	return ret;
 }
 
 static int mtk_disp_pwm_remove(struct platform_device *pdev)
 {
 	struct mtk_disp_pwm *mdp = platform_get_drvdata(pdev);
-	int ret;
-
-	ret = pwmchip_remove(&mdp->chip);
-	clk_unprepare(mdp->clk_mm);
-	clk_unprepare(mdp->clk_main);
 
-	return ret;
+	return pwmchip_remove(&mdp->chip);
 }
 
 static const struct mtk_pwm_data mt2701_pwm_data = {
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
