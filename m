Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5978C74A5B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le+nve5a90cmLjlGQahYsjZ6+9KtyXEUc3JKQfie8q8=; b=uFEt9zDbupnuhsp0KywQ+9ZYoC
	FsJG9RvjiqVzfnH6zvUl8m2TuucN9y644f9uf3f6Aw1pcm+IAOGa1aIs43KBk7cXsQvTp3MLYsmmF
	8zMzC15z68Fp2dIEovtFI2TT2yLoDbnKAFympdRhHWGhrPQNAxmbd+U4fdr+NRf75hg61VXsjLXny
	ufJ0TtvO5tlBR/Y8aj4EyH2Saf7tUfX05cPkaEscWsuOIzFeNOVGgTF7csEPPLJVC7O/DqHKCZ+TI
	htvspjvQceTgajtXz9awkpoS1GjdVcxEGvyXyo5RMPXq1QIjEokjbIE/blEOdw/2UobFWEILZaDjv
	9+vod6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSZe-008k3K-0X;
	Sun, 26 Mar 2023 15:46:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSZc-008k26-0d
	for linux-mediatek@bombadil.infradead.org;
	Sun, 26 Mar 2023 15:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=le+nve5a90cmLjlGQahYsjZ6+9KtyXEUc3JKQfie8q8=; b=abYNb2CmSeuJaA0tZBTwqW+eqM
	G+U1aKpvrtmTFtZxv4p4OcwddM4fB36SPz0qHd5s1W0+6LrDPnDJ0jr9sH/HFXmu7H6XrG5CL/Kxs
	c6BwyrWIFPGQTtMSQNtwAD9dM0ksf9Ab6s6RwznZdKB85d04AX5a0W9bgXEf1mBAgu/gVMHAAZnXB
	1cdvPjfCNnMh9g0McOAoM2fEDYSYD8PUtkC3XvEJZHpV0LQdEt7NECCgl0q3sU1xvNjWAAQ6tbpmo
	i8C3MVEmrqsUf1hS+t268aVVPtl7oINgBywOmBNT1hXV9gIZJW71PdFROKmi7ex1bjKsE/65YakTY
	bB8k1Tog==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgRQU-005qle-17
	for linux-mediatek@lists.infradead.org;
	Sun, 26 Mar 2023 14:33:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ9-0007tl-SP; Sun, 26 Mar 2023 16:32:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ7-006ran-T5; Sun, 26 Mar 2023 16:32:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ7-0088VT-5F; Sun, 26 Mar 2023 16:32:31 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 026/117] media: mtk_jpeg_core: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:30:53 +0200
Message-Id: <20230326143224.572654-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IZIj6Rcya8lyzehME46hWnaWQrNRiQ4RwQC3u+/JWoI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFalVAS2hpuonmHSWesmFzRyBeyN1VmK+ISfk cRh8yzEC4+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWpQAKCRCPgPtYfRL+ TvjzCACGLrL2wp5xaiQ0pyQSsecrPx148r2Ausl3xa6MLBfur3BBV0+z62ql2rlGDxsxI5X2t/5 nEegckpaTWYaEp/8gjbGCoCeXxmFnkHSY2/wq5X0tCgEoxIXkoLHtgRoSEdmY3wO6tyyx0Yszyq U1JUgBCTEZ13ZD49Yy0vBm9RMb5YsiyTDDOn+hSWovzV1tNlKUtBe6kqIzdC0R5YuYcziPoFBSs KAmFHvOp80/bM9edWCUBUC+pKnjUdbunIFfFIf1HE+uO4csbagP9lhXmuH64wrdLOhNPaDx6ZnY 0/K5zMXy7R6OvOO+7uMkxWjgxPdzWviMS8urx4KhxiYhTbJ2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_153254_640606_DCA798AC 
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
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 969516a940ba..e043da5ea325 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1790,7 +1790,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_jpeg_remove(struct platform_device *pdev)
+static void mtk_jpeg_remove(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
 
@@ -1798,8 +1798,6 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
 	video_unregister_device(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
-
-	return 0;
 }
 
 static __maybe_unused int mtk_jpeg_pm_suspend(struct device *dev)
@@ -1928,7 +1926,7 @@ MODULE_DEVICE_TABLE(of, mtk_jpeg_match);
 
 static struct platform_driver mtk_jpeg_driver = {
 	.probe = mtk_jpeg_probe,
-	.remove = mtk_jpeg_remove,
+	.remove_new = mtk_jpeg_remove,
 	.driver = {
 		.name           = MTK_JPEG_NAME,
 		.of_match_table = of_match_ptr(mtk_jpeg_match),
-- 
2.39.2


