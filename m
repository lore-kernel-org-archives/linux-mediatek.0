Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E74AC77B75
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 May 2023 16:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtKetNYBDSZwa9TXvdgyXP0dC0As/dk5TBMd7zMWL24=; b=21Jms8XAxC+RF33U9HoLK2SiVd
	xljpcuZFgbGvmjQOY6G9dhsvjoUoazc29t38Ksx3zkVgQzW8ghzUindb37k3m2RLshtshVwAiMiac
	NVV+k2ipBfEqopVIYQoCv3s1kA83l1Z48IaeI7n+RdqQeNj08nYm7uFGtQvKOxiVJfQVOH26ZyXfo
	Lnp9aF9ybvy8GsprGZRF5hs+AYDYQZlRrtJ8A1sGw0K2kNGUUVWr8TuZhm8lu9bKQ049vrYCvZ7pC
	2B9+Y+B0oYRa7kBA5v8ncU0/rHOayIdoyIPzFyRs+mSOX0CriDGk3/uLxt3ogk6nr1/RdkepH0f2a
	DtfMsvUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvhEA-00GNFl-0S;
	Sun, 07 May 2023 16:27:14 +0000
Received: from [2001:67c:670:201:290:27ff:fe1d:cc33] (helo=metis.ext.pengutronix.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvhDp-00GNAS-2P
	for linux-mediatek@lists.infradead.org;
	Sun, 07 May 2023 16:27:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pvhDX-00020X-8y; Sun, 07 May 2023 18:26:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pvhDV-001nDO-V0; Sun, 07 May 2023 18:26:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pvhDV-002AhU-AA; Sun, 07 May 2023 18:26:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 28/53] drm/mediatek: Convert to platform remove callback returning void
Date: Sun,  7 May 2023 18:25:51 +0200
Message-Id: <20230507162616.1368908-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1660; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=prZqrFdxCvTbI4x7dOHdK28JIgaSkJ1VYLZDHRrC16U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EEWK/WmDsYyD/3xN+xXQG+bjxUxR+WBFuju Ad7JEEcqpaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRBAAKCRCPgPtYfRL+ TkSiB/9GGYKfJFILOekgh04x2byXZ/E2ie7ZdAkC2jOqnARySWmBKMoi3KpUN9L89qGW7K6ZTyB LXB+FXvVmxqtAFf2SmobjSpTtXbGQssX/IFTJ/ghOQjWjBr5rBHZhU8lX5twjDOCIeWl7Xw+P28 I8lYgp4UweLS+ZajeQyMKG7/l9PbdmTc1dpygpvcO6ipOdJA3nqC2MXbBPDUsdFUMzj2ZJ0gfYH GVlPa9vlGGZt9axD5vtmaXzRjwVFV0IYVCR44tZTvjPfnHzeh1T0e5bKZK3OQisibx+RxjwfmLd bFos7s4rJMWt568qw5yI7xx+nYMOwgHyQkQXJ/mMjW/ivEqa
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_092653_807495_0DB77142 
X-CRM114-Status: GOOD (  14.74  )
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
 drivers/gpu/drm/mediatek/mtk_cec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index b640bc0559e7..f47f417d8ba6 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -235,13 +235,12 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_cec_remove(struct platform_device *pdev)
+static void mtk_cec_remove(struct platform_device *pdev)
 {
 	struct mtk_cec *cec = platform_get_drvdata(pdev);
 
 	mtk_cec_htplg_irq_disable(cec);
 	clk_disable_unprepare(cec->clk);
-	return 0;
 }
 
 static const struct of_device_id mtk_cec_of_ids[] = {
@@ -252,7 +251,7 @@ MODULE_DEVICE_TABLE(of, mtk_cec_of_ids);
 
 struct platform_driver mtk_cec_driver = {
 	.probe = mtk_cec_probe,
-	.remove = mtk_cec_remove,
+	.remove_new = mtk_cec_remove,
 	.driver = {
 		.name = "mediatek-cec",
 		.of_match_table = mtk_cec_of_ids,
-- 
2.39.2


