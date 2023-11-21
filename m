Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B229BC61D97
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yC9oNaiFzmfNWrCmcBMTjc7dtxw1MA/81SapbhVFpE=; b=U4adh9O1nTpolGmvIC8ES7EnoI
	d4P/UTIH5ppmM/ZvdvF9bUhCMsiYpEgg13GM/NfkwAPeTBmu0LEHYYl7Bvvvoohdb4jLN6nY2wveV
	o7fa3xpzWZ3QU7ZFS6RHVbEGIjgKT4/oXxVSWnSg2rDj9rmBm2OwFDtHvQKjt2K18vqLdiEFh+C/z
	0xJ0ARkHCk/htZPkwch53wU0H9gZVXviY+nuNdbLiu18IElHrhzX2KLeGWr8UMyh87g39Vynpem/H
	AarjN/3Wh/lYDUSu8UZWAPuWTbYkFb3zfnlvhLyiVP8b6j+Wb1Wjlt6iB1xj/V8/4a/ziagAcUcRK
	ZtGBlZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RBq-00GvlC-1H;
	Tue, 21 Nov 2023 13:53:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RAe-00GuP0-1q
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 13:52:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAY-00061y-2A; Tue, 21 Nov 2023 14:52:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAV-00Ab0m-HG; Tue, 21 Nov 2023 14:51:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAV-004xfb-8G; Tue, 21 Nov 2023 14:51:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 071/108] pwm: mtk-disp: Make use of devm_pwmchip_alloc() function
Date: Tue, 21 Nov 2023 14:50:13 +0100
Message-ID: <20231121134901.208535-72-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=orJh76hEUL7Rk/yjRjkFli3Ba27e4cCKOafNosKLVWA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLWayHDS5NZ5qmBN8Vk5RDJxkTJ93X8/+Wvjd XOnWEPBeWqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1mgAKCRCPgPtYfRL+ ToiLCACIVzX0vX+tLMqizTQb4n+sikw0iWqTW2SyxrHKHO1MY8MsxdoJgziv7acBatLfg7yDNWC p0KAUJsvTP+MP+wQi7lJDsc8/UBc/6dhUernfkdIA0IM4PKi/XRpsgU/TI7A3b24LCVFrE7/0w4 T6vJHHbKRWA88N7yded6eiGrQD2j8/c4zC5SDkhpY2DobxMgHO8EfL2RNGdUwdDpvRc3qCL/yTI Pn8/TYO2ub00w0OdlAUsCrifXnxBrsyf1I5D/0mow63rtTZ9xLGTcnb7e2TdICx0UtM1UyCNzO7 gKkdC+6LgTtYp+hJ1QAC7gU8caJabOx6tuIaYPgaq33Z2ISH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_055208_639300_C71F7968 
X-CRM114-Status: GOOD (  15.43  )
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

This prepares the pwm-mtk-disp driver to further changes of the pwm core
outlined in the commit introducing devm_pwmchip_alloc(). There is no
intended semantical change and the driver should behave as before.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-mtk-disp.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 186aa5c04435..bf8e2a520982 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -42,7 +42,6 @@ struct mtk_pwm_data {
 };
 
 struct mtk_disp_pwm {
-	struct pwm_chip chip;
 	const struct mtk_pwm_data *data;
 	struct clk *clk_main;
 	struct clk *clk_mm;
@@ -52,7 +51,7 @@ struct mtk_disp_pwm {
 
 static inline struct mtk_disp_pwm *to_mtk_disp_pwm(struct pwm_chip *chip)
 {
-	return container_of(chip, struct mtk_disp_pwm, chip);
+	return pwmchip_priv(chip);
 }
 
 static void mtk_disp_pwm_update_bits(struct mtk_disp_pwm *mdp, u32 offset,
@@ -231,12 +230,14 @@ static const struct pwm_ops mtk_disp_pwm_ops = {
 
 static int mtk_disp_pwm_probe(struct platform_device *pdev)
 {
+	struct pwm_chip *chip;
 	struct mtk_disp_pwm *mdp;
 	int ret;
 
-	mdp = devm_kzalloc(&pdev->dev, sizeof(*mdp), GFP_KERNEL);
-	if (!mdp)
-		return -ENOMEM;
+	chip = devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*mdp));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	mdp = to_mtk_disp_pwm(chip);
 
 	mdp->data = of_device_get_match_data(&pdev->dev);
 
@@ -254,11 +255,9 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(mdp->clk_mm),
 				     "Failed to get mm clock\n");
 
-	mdp->chip.dev = &pdev->dev;
-	mdp->chip.ops = &mtk_disp_pwm_ops;
-	mdp->chip.npwm = 1;
+	chip->ops = &mtk_disp_pwm_ops;
 
-	ret = devm_pwmchip_add(&pdev->dev, &mdp->chip);
+	ret = devm_pwmchip_add(&pdev->dev, chip);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret, "pwmchip_add() failed\n");
 
-- 
2.42.0


