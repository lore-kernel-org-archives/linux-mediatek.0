Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9228C61D96
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkwnq5cgnKm20BWg5qes0yiXHdqcwQS0MdrVmlU5yIA=; b=dItiZY0njhrQXbIgpuFOUarSI0
	1s1BZTFwDSCBJHvKxqx1ogi7vrjsrDlujkViwC+p5I+XXpfjodp3zgo+MD/RCmjFz9DNR/xL6y5pi
	5qYUcpXQ8oQh/L/jtpQD7bIWLt3CiZw9FO69d9K7pLtY+Fp8k4u4sXo30NHIGVTWz1hy9BCjTkLH4
	xB9izfbYfgl55RVghJqhjMuRdvPPzdLysu/yLIEjX27+JY8UATnIFztyxEzg+a8GiUMujN+kwmfOL
	QumXLuMLvBRkrbeS5wG+7gBDDQDlm9/TjShh2f25XWL0bIZLfRkiOJP1nQYJRieXBQjRMnlDy+SWn
	93zAw6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RCb-00GwSq-1S;
	Tue, 21 Nov 2023 13:54:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RAp-00Guad-07
	for linux-mediatek@bombadil.infradead.org;
	Tue, 21 Nov 2023 13:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bkwnq5cgnKm20BWg5qes0yiXHdqcwQS0MdrVmlU5yIA=; b=bsuvTNyRQHOPllrOkttHc/mePF
	DylUr72UGugjksRcjmXprrCR2UdUBbh2Z6vDyjplzspEohHvdulrtOILSrTMuiehkSw5yq0THv2tu
	T9CqpOhIiosfktZb3G31fUCZyJg92HlrnJb2aKBihvMR3ARyJVDRuoBibE3JlKmkgW4/60sCZdjs4
	8QNxdXPmXsa03VJr50j9H3slV0U/6WXCa0dUrc5qEzn1RDvyZmzu3FSPYkWWIuHd+jFWfYYZgSQyf
	RMK3GgArlmxUQ50kbo463mZUokkIN3Y3xB5Dcn51JZzc3vQmDoInFUBWJyHxUjE436d1XF7zVjUEl
	7m1Qo6bA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RAk-00BSS7-0U
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 13:52:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAX-0005yZ-2W; Tue, 21 Nov 2023 14:52:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAU-00Ab0Z-TE; Tue, 21 Nov 2023 14:51:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5RAU-004xfP-JO; Tue, 21 Nov 2023 14:51:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 068/108] pwm: mediatek: Make use of devm_pwmchip_alloc() function
Date: Tue, 21 Nov 2023 14:50:10 +0100
Message-ID: <20231121134901.208535-69-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2926; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NvNSjL4xJ1Ai1FiR6lC3rZ+UFrgPRfr2vb9OTrIV/7A=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtSYrdOD3v95z3ll09H/H2vlIvjanNbMU3NP+5lpuuWuU 5RrL39tJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATqTvP/leC5/dHFZn1uyMv KuXuzBabmJYl5JXWoFbwWDPZ/LnKumJJ5nkzDB30HWLK7/m63JAqmnRd/fkOg181biJs+14Wntw oW8ZdyveJ8dz+2urDsc9t216uvx5z3JO147jlkq7irJ3HTVYc0GHu98g//n9vx+ZjwYqJEW1vWQ 4yi6g2Tr7Z9jrf272mebF2pGV7lI30JJnn56L2eFw8+kTD9qCFWGTKjm2Cho0zBX9IR7Wu8N+Yc NlB48CyiVOmfe1WZXe+N1t8h3ruzhr2A7eOVRl/WMpxTvevCv/e97IirGeV2mVOtx5dtK1LNuRA eahFEXNoMY+OxpSOhw2lJ85NkYzyk9j5rKtgjqpX8zlxAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_135214_547555_0AED9803 
X-CRM114-Status: GOOD (  17.60  )
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

This prepares the pwm-mediatek driver to further changes of the pwm core
outlined in the commit introducing devm_pwmchip_alloc(). There is no
intended semantical change and the driver should behave as before.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-mediatek.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index ba76d9753f1b..bc614618086d 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -51,7 +51,6 @@ struct pwm_mediatek_of_data {
  * @soc: pointer to chip's platform data
  */
 struct pwm_mediatek_chip {
-	struct pwm_chip chip;
 	void __iomem *regs;
 	struct clk *clk_top;
 	struct clk *clk_main;
@@ -70,7 +69,7 @@ static const unsigned int mtk_pwm_reg_offset_v2[] = {
 static inline struct pwm_mediatek_chip *
 to_pwm_mediatek_chip(struct pwm_chip *chip)
 {
-	return container_of(chip, struct pwm_mediatek_chip, chip);
+	return pwmchip_priv(chip);
 }
 
 static int pwm_mediatek_clk_enable(struct pwm_chip *chip,
@@ -233,21 +232,26 @@ static const struct pwm_ops pwm_mediatek_ops = {
 
 static int pwm_mediatek_probe(struct platform_device *pdev)
 {
+	struct pwm_chip *chip;
 	struct pwm_mediatek_chip *pc;
+	const struct pwm_mediatek_of_data *soc;
 	unsigned int i;
 	int ret;
 
-	pc = devm_kzalloc(&pdev->dev, sizeof(*pc), GFP_KERNEL);
-	if (!pc)
-		return -ENOMEM;
+	soc = of_device_get_match_data(&pdev->dev);
 
-	pc->soc = of_device_get_match_data(&pdev->dev);
+	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_pwms, sizeof(*pc));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	pc = to_pwm_mediatek_chip(chip);
+
+	pc->soc = soc;
 
 	pc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pc->regs))
 		return PTR_ERR(pc->regs);
 
-	pc->clk_pwms = devm_kmalloc_array(&pdev->dev, pc->soc->num_pwms,
+	pc->clk_pwms = devm_kmalloc_array(&pdev->dev, soc->num_pwms,
 				    sizeof(*pc->clk_pwms), GFP_KERNEL);
 	if (!pc->clk_pwms)
 		return -ENOMEM;
@@ -262,7 +266,7 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_main),
 				     "Failed to get main clock\n");
 
-	for (i = 0; i < pc->soc->num_pwms; i++) {
+	for (i = 0; i < soc->num_pwms; i++) {
 		char name[8];
 
 		snprintf(name, sizeof(name), "pwm%d", i + 1);
@@ -273,11 +277,9 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 					     "Failed to get %s clock\n", name);
 	}
 
-	pc->chip.dev = &pdev->dev;
-	pc->chip.ops = &pwm_mediatek_ops;
-	pc->chip.npwm = pc->soc->num_pwms;
+	chip->ops = &pwm_mediatek_ops;
 
-	ret = devm_pwmchip_add(&pdev->dev, &pc->chip);
+	ret = devm_pwmchip_add(&pdev->dev, chip);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret, "pwmchip_add() failed\n");
 
-- 
2.42.0


