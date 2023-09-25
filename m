Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC92CCE7A95
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TojteD2kHv7LRipP51FuusLBi8cFdz6n7Tc0BdaA0Uc=; b=PXwpHq37rGgcAamh8ZkL2k/zmD
	tc5JnzKN4KdrfA7P5R5dlpyydn3zDpK4OzIqpjM2VrRM/pROejPEDjwoqiAAo0OXDWjTPw5Z2SSIR
	3i2ddzEetGI7i1QL3Cet2GE0Jav86SWh5uoBDikKfBvbgYF6/opqvTd3CuC6+PXte9jiHMBDHB9VQ
	mPvqZ/3P/U4Wbeds5t1sSzFf0ozv0j40xyGZxtuQqZ0u6gfp1d4VWKSpw6AXsz6BB6kKhtwqlPHtH
	Of4E3GBbHHgVpvUMjm5sI2Xega+wS5huQbbe/WU56O4xmbSoqJrT+j7ZMmvOgOimdnbVSk3trKBdH
	BIH1s7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiJr-00Dtpy-1X;
	Mon, 25 Sep 2023 09:55:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiJc-00Dtf3-10
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 09:55:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJX-0007sR-N0; Mon, 25 Sep 2023 11:55:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJW-008pzS-Py; Mon, 25 Sep 2023 11:55:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJW-004dlG-Gp; Mon, 25 Sep 2023 11:55:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 14/40] soc/mediatek: mtk-devapc: Convert to platform remove callback returning void
Date: Mon, 25 Sep 2023 11:55:05 +0200
Message-Id: <20230925095532.1984344-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4mDlQdT+SKDigR9rWkmGPnQAJhFIImIOy2rzeN86XAI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlEVhPt6NjlVUHKAv3ujhoIKwQ5eFrE/R60mg3Z 3zLG5Nsz7+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRFYTwAKCRCPgPtYfRL+ TvveB/95rUhbP47NLVnmld4lik0f5Kegu9YzqCK+obwHfQCB+6WDKyQop+Ocow3WKMlEG0J5Wn5 AdXkSoHN543Zsw07iWqWq21fqAcLvOFO6iNlNWWBiDEmvfruDaIGIiam1XqZmsqwsArXMNMVHwQ Qk5wnAPEQIJKOqW37uymybCX0W9C/BrxTVSp3MXmSTUMZEg66qJ/oB962uMUPO17hM084l5lUqi QUVT20D70XL4TpxAQTgSxQpCs8Gl6fXNSpy676mUSMtLTkJ1VUx6sHC8wS79Ldbysumvr3gSlHf gFMn7W6P8smqQyIpxx47VX91SPWnOKi3VJXvbgLh6XIrAIaW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_025544_350196_081E9A4A 
X-CRM114-Status: GOOD (  15.35  )
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
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/soc/mediatek/mtk-devapc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index b28feb967540..56cc345552a4 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -292,18 +292,16 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_devapc_remove(struct platform_device *pdev)
+static void mtk_devapc_remove(struct platform_device *pdev)
 {
 	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
 
 	stop_devapc(ctx);
-
-	return 0;
 }
 
 static struct platform_driver mtk_devapc_driver = {
 	.probe = mtk_devapc_probe,
-	.remove = mtk_devapc_remove,
+	.remove_new = mtk_devapc_remove,
 	.driver = {
 		.name = "mtk-devapc",
 		.of_match_table = mtk_devapc_dt_match,
-- 
2.40.1


