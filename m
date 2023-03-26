Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA2DC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/pK3EXrTkJd8ReqzJcuIVKZoOGqXk2SRN6UY4Ykjsw=; b=tx1fo4ugupkTWV9umKmTvauBCV
	LpnHDMitbRGkRcE9LA5m9Qgc2pMnOtjReqHif9N5N2xeXdc/oBAHsJiEfmPaidJLVSNC5584PyU2b
	K6ua16VDu6SUnN/VwbQlqgnNFqBMyv7QjBl24IBqxNupcm2mfv8gsw4fEKygcJWujCCPp4DC9Mhph
	AnPUfPbYZlVw0mHKcyMGu+H3nOsj8yF8ouQ8I6cdd7JoKjg6moWEvLK2YVvjZy06fKhhvPmLUJO4G
	h/rGg8uuOfo0mbAsF5MNBLpSOjqZR84gOWmjIZe6CkZW08HRDBhAHHdoGReMTOfEoRjjVS8jn9euX
	wMomJtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQu-008Z9c-0C;
	Sun, 26 Mar 2023 14:33:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQX-008Yjx-2i
	for linux-mediatek@bombadil.infradead.org;
	Sun, 26 Mar 2023 14:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=T/pK3EXrTkJd8ReqzJcuIVKZoOGqXk2SRN6UY4Ykjsw=; b=BTOgXGt8BY+pvpNoeRNp1ibBs1
	aXdqjXcPU8Z2OMayyQ3LlxPD1eJmJg5EJo+IJk9EhitnoCzBTZzoPvn5g6EPMg+G34o38m2ML0elV
	OzQ0+NaURkMe0zTv0HHh6CKPRMT0e13dbRCrlGOQbN/B/NjxCGV1SBTieJ6DNXkRg5yFovLfkxWsg
	lbPYLCaaoPttaKMF/qaQlxnk4930EIUxGNRQhRbeJRECd+QKtbNmzWSKFY0hb/woUqSA1L8bcDkr6
	2n4C7hpl7CqJ9m0Y5OPdpir99h7HAb1QmazRDcpLG6BGKocuMcM1daHRkxvUhr1PNPmpvIwu5u+Ws
	1T8suGjg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pgRQR-006aQi-TS
	for linux-mediatek@lists.infradead.org; Sun, 26 Mar 2023 14:32:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQB-0007yF-0u; Sun, 26 Mar 2023 16:32:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ9-006rbB-E1; Sun, 26 Mar 2023 16:32:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ8-0088Vj-0T; Sun, 26 Mar 2023 16:32:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 030/117] media: mtk_vcodec_enc_drv: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:30:57 +0200
Message-Id: <20230326143224.572654-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iWZQWni5H+Z+BEh9nLVGdQ7KridiLmts8udqla8jAqE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFarZ2Tvj6+2UCxNTYlxWwzIXahGDoc2x8SpM QxSpw33l6yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWqwAKCRCPgPtYfRL+ Tk3SB/4iM2L2a0F42ERFVuzNvi9MbRs/YSxe0/SmKJMLjJ7qf9uAbuQqOmOwq8IXUZp9mYXT+Au JJ1rtkxh9JEvX/1ZOAbuM+9+Txn/q6Gr4E8sUaHQ95I9ai0nXKmAJV36oboKqxsjlMZwU6gqHwZ ihvXgnKCeP1IJEIPkvMcXcym6yvfQf+sXr2usGHmOHH1YynvZXA8c3+vur63y3RgclWUe4iIohn yu55dnrJLFQY52srRK/nC+s6p5nm6QQq9sRStI6FjgLhRTMpR0ryrx7NpHI9xmieAv3+9xrKnmG nx3wz4OqYuWyzueoHADdA5vthEXfmswE9gHcw5qrejLVdI/J
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_153252_003268_82C277EB 
X-CRM114-Status: GOOD (  12.75  )
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
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 9095186d5495..cd0d5da8195a 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -451,7 +451,7 @@ static const struct of_device_id mtk_vcodec_enc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
 
-static int mtk_vcodec_enc_remove(struct platform_device *pdev)
+static void mtk_vcodec_enc_remove(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dev *dev = platform_get_drvdata(pdev);
 
@@ -466,12 +466,11 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 	pm_runtime_disable(dev->pm.dev);
 	mtk_vcodec_fw_release(dev->fw_handler);
-	return 0;
 }
 
 static struct platform_driver mtk_vcodec_enc_driver = {
 	.probe	= mtk_vcodec_probe,
-	.remove	= mtk_vcodec_enc_remove,
+	.remove_new = mtk_vcodec_enc_remove,
 	.driver	= {
 		.name	= MTK_VCODEC_ENC_NAME,
 		.of_match_table = mtk_vcodec_enc_match,
-- 
2.39.2


