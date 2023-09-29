Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5C1E728C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7a6k3tAgqXj/5nxJNFDLMmiggV9+lpXALcuey9Wboo=; b=OF7R2BOR8wn5HuelFlzRX/IVaj
	xkCVEYmivqVLzkHR2NrIwd2FaQWs55yktBxGWywW7oLjwsUS9vyPi/LW2yY5/jT3DLt0w+NLA04/n
	9EHdBsMzbMmc9kctGDT5lQ09cCbZgPAyeyzhRsmTe6Y6QBpH86PjvLHvzfLJ8RjInXVgkaKZDqFig
	SCM5CHZGGR8iZTtKoVMJEZskxHE2PcXbO33BxKlqPBF308jDtpAqzFCflhpxfRjaYtMzPfg9ipS2F
	J5fagud3HQldaUFyE7ER8F/Vufe2M4+7J8WR6EVhATGwWqAx26UY//BZbFjx9FEl7Yjzrfump53uy
	acWfiAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmGDS-008HAq-1H;
	Fri, 29 Sep 2023 16:19:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmGDB-008H5E-22
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Sep 2023 16:19:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qmGD5-0007o4-GR; Fri, 29 Sep 2023 18:19:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qmGD5-009r5c-3Q; Fri, 29 Sep 2023 18:19:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qmGD4-006165-QO; Fri, 29 Sep 2023 18:19:22 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 05/11] pwm: mtk-disp: Simplify using devm_pwmchip_add()
Date: Fri, 29 Sep 2023 18:19:12 +0200
Message-Id: <20230929161918.2410424-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
References: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=J2X1TCgGm2aiqZ1DsX5bUui3ufiRtvhRg3HnY+fgzOs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlFvj54D2J0JZGcHBTpeSmu5Mae16b94F5WOmVo 8PHPZe9K+OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRb4+QAKCRCPgPtYfRL+ TrIqB/9hQa72vyvBBSQ/n+Cx0Zvc7D1UUcOtRDbErHARp2Cx9dBlB/s9aVRGHAwIOatI+D+x/ux di1XfnnjLvpj81RMSVOZRRU/edU8HCobPdH56lBHyCEV+AR9DcKQlkquo67RN8iB8h7Jq3bzO8l Jk6DzEUsH6u+afQpGm/8i6Aox9UcxdDkF7jq2Uqu3jO5r/s3RH386wbDK25CNh2SKp+hBvPolqI 72ZK0jp1MQCfgIvqwx7TeV1UQ+KXmx0MglzyATwPmO+SUrfgwm6yihukDdWVQtG2swSQobKsQzk oNfWwZ2SRi4l0vTDdCPHGbsXCgpGvB6tuwaleRJYvqA12E1R
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_091929_715610_86162CF9 
X-CRM114-Status: GOOD (  14.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

With devm_pwmchip_add() pwmchip_remove() can be dropped from the remove
callback. Then the remove callback is empty and can go away, too. With
mtk_disp_pwm_remove() the last user of platform_get_drvdata() is gone and
so platform_set_drvdata() can be dropped, too.

Also use dev_err_probe() for simplified (and improved) error reporting.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-mtk-disp.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index a83bd6e18b07..e34fb4409695 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -247,34 +247,25 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 
 	mdp->clk_main = devm_clk_get(&pdev->dev, "main");
 	if (IS_ERR(mdp->clk_main))
-		return PTR_ERR(mdp->clk_main);
+		return dev_err_probe(&pdev->dev, PTR_ERR(mdp->clk_main),
+				     "Failed to get main clock\n");
 
 	mdp->clk_mm = devm_clk_get(&pdev->dev, "mm");
 	if (IS_ERR(mdp->clk_mm))
-		return PTR_ERR(mdp->clk_mm);
+		return dev_err_probe(&pdev->dev, PTR_ERR(mdp->clk_mm),
+				     "Failed to get mm clock\n");
 
 	mdp->chip.dev = &pdev->dev;
 	mdp->chip.ops = &mtk_disp_pwm_ops;
 	mdp->chip.npwm = 1;
 
-	ret = pwmchip_add(&mdp->chip);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "pwmchip_add() failed: %pe\n", ERR_PTR(ret));
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, mdp);
+	ret = devm_pwmchip_add(&pdev->dev, &mdp->chip);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "pwmchip_add() failed\n");
 
 	return 0;
 }
 
-static void mtk_disp_pwm_remove(struct platform_device *pdev)
-{
-	struct mtk_disp_pwm *mdp = platform_get_drvdata(pdev);
-
-	pwmchip_remove(&mdp->chip);
-}
-
 static const struct mtk_pwm_data mt2701_pwm_data = {
 	.enable_mask = BIT(16),
 	.con0 = 0xa8,
@@ -320,7 +311,6 @@ static struct platform_driver mtk_disp_pwm_driver = {
 		.of_match_table = mtk_disp_pwm_of_match,
 	},
 	.probe = mtk_disp_pwm_probe,
-	.remove_new = mtk_disp_pwm_remove,
 };
 module_platform_driver(mtk_disp_pwm_driver);
 
-- 
2.40.1


