Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C62C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 18:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vxgik4OCwFLNCa3fayBT85AzBZ/r78D3QYFEdvBOCeE=; b=AAKHk0Im4unP8/61CZ4W6r8ljI
	SIw9Gx18rNEmPBg4AudofFkiS6xi4Nj49YuD/+EX+/vXDrpP5UkX6jlTMOVlwzOE1mMcEmifeS7Mt
	beGbIUoSAmvgSbteORUaDda7YJn0oUNs2wY4B45THwBFVqEbmphZY/7qT4WOpxsSoKcxvBUg4u3KT
	8jZRHNpgV488E/Nvv/czFQyOq5w1Ry7y/oP4//yKcLLo+Q/u2Q2k3BnQ3PPmB3gDjNjF237ZZo6g3
	yFm2EAD17ceC9QVsjYesPtgyAF8aGFeL6z5vaOXv6gfw735ieCf3ImRmxZfh+o6fJybjfayXiy+s9
	dkBastXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYAbW-007ENq-ER; Fri, 03 Mar 2023 18:58:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYAYf-007Crd-To
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 18:55:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYAYZ-0006NZ-6o; Fri, 03 Mar 2023 19:55:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYAYY-001cUh-Cb; Fri, 03 Mar 2023 19:55:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYAYW-001ukX-7i; Fri, 03 Mar 2023 19:55:00 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@pengutronix.de,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 15/30] pwm: mtk-disp: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 19:54:30 +0100
Message-Id: <20230303185445.2112695-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
References: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Grb01OXJBD2d5JT37ohCwJo6sMsGmbgBXYbL/lnoknQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAkIvMhJdzniXalqUQKDk24lFD0q7kY/mf3jae eQlBbcwrxOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJCLwAKCRDB/BR4rcrs CeR8B/4l+YurH0oWACkangTyL1EWM2oTqVAdR7h7cKltjsPubrV3TuSVXLvaSu8U0O3XnAKg2Wy o2G2ICQ09IyP+svx1qWq4iLrhYFgskwY4kE/7RrPoO+5Go1zAh0Wgv4or996e+07jv0azrhZ4Ar q4TDDTLTNaoW8VUkZZseUMJRLMGSvE+/zVoC1Oi2MgwtvVUprU40tOhHMTJX9YxKHCY5gkXo9bk tuec1wTPgX8VOPzql2sr/7N9TtwlNMT2uK2F6AJ4q/v+OK9UiPpnWEpuBGeknqPqTwxe+26bmYo ep77xiexknEGKbQB3IPEBdo7rclJsWVV74XPuYb1NOymtBuf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_105509_994107_8AC7A756 
X-CRM114-Status: GOOD (  15.56  )
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-mtk-disp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 692a06121b28..4cfe88d54652 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -260,13 +260,11 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_disp_pwm_remove(struct platform_device *pdev)
+static void mtk_disp_pwm_remove(struct platform_device *pdev)
 {
 	struct mtk_disp_pwm *mdp = platform_get_drvdata(pdev);
 
 	pwmchip_remove(&mdp->chip);
-
-	return 0;
 }
 
 static const struct mtk_pwm_data mt2701_pwm_data = {
@@ -314,7 +312,7 @@ static struct platform_driver mtk_disp_pwm_driver = {
 		.of_match_table = mtk_disp_pwm_of_match,
 	},
 	.probe = mtk_disp_pwm_probe,
-	.remove = mtk_disp_pwm_remove,
+	.remove_new = mtk_disp_pwm_remove,
 };
 module_platform_driver(mtk_disp_pwm_driver);
 
-- 
2.39.1


