Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C1DC74A5B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4Y7ky7nwwGEwJ6wVYuZLmb6qm5aApYaIgUwtd+ILNg=; b=2Er08hUxBmGWIzeKglfCaaO6WE
	BoSO43KtlqXid9mX9G4tC8zQ7c+gWyZJTtlItAYyzg0W4Lb1sWSbImwQ8nN58h/wQCVbVoXvcwwFN
	HsK+p5rh1hYQHUcHmXea6nvZQBlZHRgjih7mcBtS7OcEPjosP3dGHlYxDIzFIdCW8GuvkMuffC7RG
	QesfcZRTLqQq/LnECt3lBEXx9giclWJVbiSVTsh4gnOg05o6vFaBU5L+nsQT1KuDZtEqxCxALhgFx
	AC2D0EkIT07LMj39pCrO+GbK8eMfARt32gunN7nh5STUDXgyfQAs5BLnoaEca50zmKYqzSElzgNA+
	tOXWmXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRTB-008ayk-0q;
	Sun, 26 Mar 2023 14:35:41 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQr-008Z75-0X
	for linux-mediatek@bombadil.infradead.org;
	Sun, 26 Mar 2023 14:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=E4Y7ky7nwwGEwJ6wVYuZLmb6qm5aApYaIgUwtd+ILNg=; b=rm5V9mNF58cmOGpn//eoeqYqKP
	CfySt1tItIrNxSkKCTyJsRNmeTomMSMLQxv1MgnX+V/45cN2Mz+1ZRKNnGFmlIwm1PNpgxLYVDVZF
	ECNmhn3uDuXoW1Lyr9bq/e2J/+ztLsZPK0me3F2wNIy4VF9o4KMAJxk8N9WzkoCn81dlz1dJz4+lH
	cbquCLFfcxiBQALB8nvySPaAS+ixu9d5Jf5fuLNGc7gHeUBx6N1Yxok9ticbFU9FxR7jeSH5wmyOQ
	MGCS3U8dhrS5gUFUBnAushyzv7wgsYgn+fj7ohAfbevajelBrkF4JrF6yAk/B+EHDaiHwgb/1P44E
	+YfVnLxg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pgRQo-006aSG-7D
	for linux-mediatek@lists.infradead.org; Sun, 26 Mar 2023 14:33:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQR-0000Tv-Tk; Sun, 26 Mar 2023 16:32:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQQ-006rhK-1n; Sun, 26 Mar 2023 16:32:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQP-0088am-0k; Sun, 26 Mar 2023 16:32:49 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Wang <sean.wang@mediatek.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 108/117] media: mtk-cir: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:32:15 +0200
Message-Id: <20230326143224.572654-111-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lU1RdDgCVLlCsb/5z6KnJIo7xN0yoS8qGARlY6xon2g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFdC1rNVy7Bq53g9nT0u1IGm+3MdTtjUTG0+n Z+iKKpJ7juJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBXQgAKCRCPgPtYfRL+ TvzaB/4x1CsgN+jw2vmR6VOIzhF0VtklHVsaM1mCVhFAlsAOc87OR8/ajkgPnGDiBPX9qTQ7VDZ GIQ+53bVnoRnoJLQrt1kOAfU1f3MYcUSCiEiPfsVmSFEdlwHR7D9IbNtbKWgHWUeEBv+tJUJR3e LkNcpwoy61kC17sOZVYetG5wM1PJTcZfKtsrkKj2lKjePHhJ6AKCuWxgtN8/oEwtKyyCbjIjgsb krZp86LJdODjWBHVPe+rZAkKU1JsatDjjWKUAnivIwb526wSAgtbSvV46LAiHco4CSYvwCfuvXK N6+cOXITCHF8gcXkaJOC78YeS7EPMdGddKy8f96zDQOo9ukl
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_153314_275308_E81B0C68 
X-CRM114-Status: GOOD (  12.46  )
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
 drivers/media/rc/mtk-cir.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 27b7412d02a5..df9349330a93 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -420,7 +420,7 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_ir_remove(struct platform_device *pdev)
+static void mtk_ir_remove(struct platform_device *pdev)
 {
 	struct mtk_ir *ir = platform_get_drvdata(pdev);
 
@@ -434,13 +434,11 @@ static int mtk_ir_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ir->bus);
 	clk_disable_unprepare(ir->clk);
-
-	return 0;
 }
 
 static struct platform_driver mtk_ir_driver = {
 	.probe          = mtk_ir_probe,
-	.remove         = mtk_ir_remove,
+	.remove_new     = mtk_ir_remove,
 	.driver = {
 		.name = MTK_IR_DEV,
 		.of_match_table = mtk_ir_match,
-- 
2.39.2


