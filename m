Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB5CC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1x/954YsIisqD97Ev0aVRxObzswnBbVxYWdcDa63+M=; b=Zk3BPII2dMFcwx1HTp90Dlngc0
	+jXTBwgVDyiWOmVkGkqygBHXh45GEJkIzxNYY3J7HO+MmzF632Vp23UvZcMbgD3ohcbNaAyzDiIoQ
	Sy8yFIfPmdVg3Kmzyt/7EjDVg1RvdgajkTCS3Lz3YAWiQCzRb5IbzcUEC4ODUx98ewbZ+ODpIBi7g
	TuoAxgJyZSNoGUkpoi/pDAT2vYjOSXTf015oW6UaU6gq5xsEfro9x1i3QAcXv/ZdfW4U1cUmv1fEN
	OFLnibLg+daW5AO+7LIcGNwsmAVydUa8VlwKv0WOD38z1PTxF2TL+SBCFRGgTjoYklRzq00ZV5Ool
	9H41DPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqPp-00A7iS-1d;
	Wed, 06 Dec 2023 11:50:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqOU-00A6NH-0L
	for linux-mediatek@bombadil.infradead.org;
	Wed, 06 Dec 2023 11:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S1x/954YsIisqD97Ev0aVRxObzswnBbVxYWdcDa63+M=; b=C/jRcZWUfNbemSX6jd8wtbmykA
	BFfYi92nnmIH+vt/2i0vcYCbJbe0oYpWUzeQTTRbKiuobRsnxv4PQzflBal7yheOs3mkYI77RIuQ/
	ey++NPfbcp+08+OMGFce+dwy/NBCxfsyd7muiXWU2CBUfAu+M+zfJ5J2Ome0P4u987YFhBUnAolJV
	8reCaSlEGwmPHJ75yoKCiNmhkCTwQSMNoc2+lvpP0BzRj8qAbqcTqkqUvU/03gnXJzoB4oHWS5OrM
	hUGHxfECQNvkPexQHShTufQE10CYFDyYFP8DniAmZ0RwMac9262inZZD9Zh2W+Az1/PnB6XNKBv+O
	7HTRwIuQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqOQ-0059Vs-0G
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Dec 2023 11:48:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOJ-00076x-GN; Wed, 06 Dec 2023 12:48:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOH-00Dww8-9N; Wed, 06 Dec 2023 12:48:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOH-00FR1Z-0J; Wed, 06 Dec 2023 12:48:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 077/115] pwm: mtk-disp: Make use of devm_pwmchip_alloc() function
Date: Wed,  6 Dec 2023 12:44:31 +0100
Message-ID: <e5852ac7208917932f9e6bce96a40ecd1a2b5991.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=3mAoZwowhY5Q8LCYbYjvGDo+okdiQ2FoVEfE9Yl1Q1g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF7xh32gzhap3jjyjBbN3xzzHqKLN2B8d4VSv x40XBxRKimJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBe8QAKCRCPgPtYfRL+ Tn5qB/4jM5NCMPtVpE7/WT8nG1cdwNbVeL5IHXkTjMY3RcH0zqTyQrnkxNcJgk8B1lDuXZ+41oE pNbPJUAsu8g3Z9U+YiQE32GukVNXxUttZxMVm4fKsIiCRboZD9TrPURE13Lq5xCkjW+5JusZLAc njClh0Mg+XDBZ51RwUO9D74m54USiy+8bTyUD+4jZ0ig7t8+h9eYDImSP3YBpa8HVKzVFmgYAcr Mf2resUYHXr4FgFDvnbdJxzfPtUImqMsJAgiqBVQqP80GndKWQsuIpOzFu5DhO0voSwk9fwI1bq 1gOpCfYzKCoftO5sk6ganeKLuRraJZilfrxaXZ9rHWD6TbNf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_114842_208807_9AEB4445 
X-CRM114-Status: GOOD (  14.71  )
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
index 186aa5c04435..bafd6b6195f6 100644
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
+	return pwmchip_get_drvdata(chip);
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


