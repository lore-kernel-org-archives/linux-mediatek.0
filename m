Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C002DC4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Nov 2023 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXBbfAa9sQW5emrnvAEGrPxHnFY7IXOkE7l8qn7ct7Q=; b=pA1dbF5ctT6oYTlawB1nvDGCiF
	nTUNjma7ab2iBaUJAr8+SF9X5oRo2AKNW2CFYg5pb4g6eFEPvdrMPH72Jn04+KFdbVRVcVj8kVJmg
	0iTVfGb6HLTFJQDUQWtRUpqu5NtjQ6kQuzk7Sx/SWA19JlDYUx0bMHkvPANp6H+SrRNmjpdrSO4fF
	q3vihTVT93+PRBgOGbUKYdkMbDqtzmxYxZZ8J7GnzGZ+vbV6lds7yy2npiulliClDxe9lcPsyv85s
	QHIqDn7vWRayL+1bpvmPBri20yR4ajVgkwEbXUsrE5awnX1aaydacKe0IoZrfQ9htqFi82P2xZRJ9
	bO6fbDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzNzt-00E2Ks-0M;
	Sat, 04 Nov 2023 21:16:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzNzn-00E2Hf-1d
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Nov 2023 21:15:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzNza-0007x9-IB; Sat, 04 Nov 2023 22:15:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzNzZ-006e1Q-FH; Sat, 04 Nov 2023 22:15:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzNzZ-00D1bF-6D; Sat, 04 Nov 2023 22:15:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sebastian Reichel <sre@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 08/14] power: reset: mt6323-poweroff: Convert to platform remove callback returning void
Date: Sat,  4 Nov 2023 22:15:10 +0100
Message-ID: <20231104211501.3676352-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104211501.3676352-16-u.kleine-koenig@pengutronix.de>
References: <20231104211501.3676352-16-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+ks+08sNas6pRwQOIu9JqI3KzDyMtEsulLgfZXQOgLc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlRrRfbtVNNlwYL9e4IQ3CBHffi67iJXbrWETgo wljmV/D+IeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUa0XwAKCRCPgPtYfRL+ Tv5UB/9Cyj7hmzhYSg/jRT/T2W3i95PssgWRVEh5CX70+1G/lp2Vkon6fJxXqOQASadNr36iiy+ JETjkP6mjXsqcQs9vwbSXVK1VWPah3sC93rWO+8nBDQPNdksfNccp5R6/vbqZr2d3oIwgdpjxfu LU1Eedx/SSpCa/XvnQ8WstE0J6xQMLXZ7+iT23K2tFkranQkfn5TD1TfW7KYZjsziMncru/dESa gvXn27dj84G3VQW2a2rdGirOxcyQrbus+HiDgJq8tJIYOTlodGxcui5khY6x1S8GzaC0fEa/WFu Is7YBPo+hjgAux4wwm0N2zuVckwFRa5abA4J7QuKwjHSMMoT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_141555_544036_174AB256 
X-CRM114-Status: GOOD (  16.09  )
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
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/power/reset/mt6323-poweroff.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/power/reset/mt6323-poweroff.c b/drivers/power/reset/mt6323-poweroff.c
index 108167f7738b..57a63c0ab7fb 100644
--- a/drivers/power/reset/mt6323-poweroff.c
+++ b/drivers/power/reset/mt6323-poweroff.c
@@ -70,12 +70,10 @@ static int mt6323_pwrc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mt6323_pwrc_remove(struct platform_device *pdev)
+static void mt6323_pwrc_remove(struct platform_device *pdev)
 {
 	if (pm_power_off == &mt6323_do_pwroff)
 		pm_power_off = NULL;
-
-	return 0;
 }
 
 static const struct of_device_id mt6323_pwrc_dt_match[] = {
@@ -86,7 +84,7 @@ MODULE_DEVICE_TABLE(of, mt6323_pwrc_dt_match);
 
 static struct platform_driver mt6323_pwrc_driver = {
 	.probe          = mt6323_pwrc_probe,
-	.remove         = mt6323_pwrc_remove,
+	.remove_new     = mt6323_pwrc_remove,
 	.driver         = {
 		.name   = "mt6323-pwrc",
 		.of_match_table = mt6323_pwrc_dt_match,
-- 
2.42.0


