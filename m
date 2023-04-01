Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3B3C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPV9HRMY9LSg4JnVSIQdXFkTx1dU76Wmm+2iMaFj6x0=; b=2rK2RXw+LlH6xNFvQ39cvgigU/
	obRAdMmHVe/14o0d48gyDOpIw3mEjOBR/X60iwGTKgZU4abcLduk5thAlBpZet83m79y8h3AX0MKJ
	vcv9Z5p+fOMoIYfLLMX35Mbha5hJJv/wEAI7kGaHATWMWpKLZG5bAVnuZGgZ0qt8ENgOZxsF/kond
	7m2OEoMIjIWy+RHLk6XwGLxCIlT08/kdNYA0b9u3I9PZB5gvoTzuKYu5OHi5+5HbqpuNJNS/0pDe0
	NhRlscqFYNmRaXCWXJmEpX+GZH+GWduBuP/PbK4BCwmtxxxbKCXR9shXoL0d0FTWECZuvHqvqq+Br
	Yj9CpCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEH-00AwSe-1Q;
	Sat, 01 Apr 2023 16:37:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEG-00AwRk-0S
	for linux-mediatek@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=QPV9HRMY9LSg4JnVSIQdXFkTx1dU76Wmm+2iMaFj6x0=; b=eNYodXGOBtPkTZjfTjgKmJ8GYR
	KEL6KuIpryDyxdCyuG6qiTzHm0oONaX2PV73mJlJFZKYNc/fU6ih2tuBZqU/ta3PeBcBcPZa/IBI2
	NCxi6gcq3/NVGoRvrjVFzzIcH3CbMDGb1pfWWB42U9ylVae2JXILibfSnEUvFw9qk77hrm/7WXIye
	0FZXzY48iuoTj+TLkZ3D94+Vi5NmXD6yZiNRaNYXeeUXUNkTIQjQlV5LNbTNHQixzHE83pNZimeaT
	2t0tr/CH8F/fGkC4MYNfazGB9Wxpq6nXvOcnfZVAfnx5Yn66qvzEHKbpYnTbIQjBUawJ6E6sryv/L
	8io+v3+w==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxb-00CYOX-KM
	for linux-mediatek@lists.infradead.org; Sat, 01 Apr 2023 16:20:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-0008N8-Et; Sat, 01 Apr 2023 18:19:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-008GRb-LS; Sat, 01 Apr 2023 18:19:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-009kgo-UZ; Sat, 01 Apr 2023 18:19:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 27/49] mtd: rawnand: mtk: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:16 +0200
Message-Id: <20230401161938.2503204-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=e523s9jRh/S6cO5O42rYQ7Q8m7mrxZAiPiAi9ZUPEJY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkn1m1Rxg9dsGd5QzAc25K+CVSCtFVHxMxSh zGEnsX1zBGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZJwAKCRCPgPtYfRL+ TvvGB/4m1l2TIyVfqpOpyosZc+stZOgYdxdZzla9CBSL9m/qBQpJVmNFI3Civ5kIz4GHTJ4axJ1 62s8mhZe20HTIlWfR2BnsWJwOtuzP7+zTcyvcMUrnuSkgwLGA52AkTwmb9qSE8yNmnTD6S51B5l Vhu5A3KRb9dKcjMHVVH+Xi/RXeiBIYIyGtL3flPU+1fHGH3YvaZR9H+wXO4JIyzvgonmPZ5soDy B/ih5y2Sy4L9AsoPcNq1eU77VeQ8AGADEko7yjd2GYQ8p9UVAmYNd7Uq3b3nNfqpznndWHa7N2o TWd84Hb9UlR9s8Mpm1OtCHeNSFt1wcAWqYAxQHzd5DIa+NGC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172011_705877_2815549D 
X-CRM114-Status: GOOD (  12.58  )
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
 drivers/mtd/nand/raw/mtk_nand.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index d540454cbbdf..b2fa6b2074ab 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1601,7 +1601,7 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_nfc_remove(struct platform_device *pdev)
+static void mtk_nfc_remove(struct platform_device *pdev)
 {
 	struct mtk_nfc *nfc = platform_get_drvdata(pdev);
 	struct mtk_nfc_nand_chip *mtk_chip;
@@ -1620,8 +1620,6 @@ static int mtk_nfc_remove(struct platform_device *pdev)
 
 	mtk_ecc_release(nfc->ecc);
 	mtk_nfc_disable_clk(&nfc->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1663,7 +1661,7 @@ static SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_suspend, mtk_nfc_resume);
 
 static struct platform_driver mtk_nfc_driver = {
 	.probe  = mtk_nfc_probe,
-	.remove = mtk_nfc_remove,
+	.remove_new = mtk_nfc_remove,
 	.driver = {
 		.name  = MTK_NAME,
 		.of_match_table = mtk_nfc_id_table,
-- 
2.39.2


