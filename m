Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70471C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 22:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUF5g1VydiSw6zP+aDC8mUiprn8NUscm3ua89OyjMAM=; b=nwxboSBmyy4UwEhOxMGqhpgfqk
	du6T87B76NJrEEugnXEKsbDPeWJiLRXkpZ3DeVgS3O6/vIO0kXHmXeWZncJhPpvwRxaYIrt27oPQo
	XDLnikWTCohDVFvlQLJSvF5iSUBbZo3ik+6LGZt6lCKRp1HfuRgjSIXja5VY0q9MB5kPGCh7Idb2T
	FhjT6U8PXQfzWfhbPjTTwbIdIZQnLxxT22Zh0+NvBc4zfLIzxMWrxJIpsOyBD4LnCOHdjwbgWFdow
	w3s6uYvyusS3aPZ6Zbik86btFgMEEZ3N3IvsaKjtOd3eh5y88JREC9/lNhG3GqTKMD3FeXBTWlPX9
	R0/ZWUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rFM-006b3B-Cb; Mon, 12 Dec 2022 22:26:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rFB-006azb-PM
	for linux-mediatek@lists.infradead.org; Mon, 12 Dec 2022 22:25:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4rF9-0004eg-QK; Mon, 12 Dec 2022 23:25:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4rF8-00477F-D6; Mon, 12 Dec 2022 23:25:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4rF8-004bob-Fk; Mon, 12 Dec 2022 23:25:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: 
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 2/3] soc: mediatek: mutex: Drop empty platform remove function
Date: Mon, 12 Dec 2022 23:25:48 +0100
Message-Id: <20221212222549.3779846-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212222549.3779846-1-u.kleine-koenig@pengutronix.de>
References: <20221212222549.3779846-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WGfUhoni8vWurjVU/pKwNFMNSVOT2a39AD+uC/+5ko8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl6pkZQAZnNlqbmONBIaCu/XATKlD66kBisINCbtk fPKjji+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eqZAAKCRDB/BR4rcrsCfqTB/ 9eNg97mvFGrIFx70h4TjtfmfUC4O0jZLQfvxO0iG9ECJZaSyNhENtLB+uRn0qiqcgtTq+2gkXsKy7P 3tcpcniSbfioCbY0AvBpMs8sSTLsNRaFFe3NO9lmcA/gixUK5HvT3eZMlA1lWvxzpj6p0VxKmFQtVJ fA6J+7kPOEiPFCfXK2tsBeRkWRcd35JuXbMoocD7Jk7WGSLBL09JyXTx8tQeK2PfLRxJDn9usQjbGu dVSHIVOkTuD4mkkWnPYEJ/ZLE9uiCAtLegaYIyzKJuej+o1oU5wCJG0K2V2PEkudjiDAsIa03baIuh K7aoPrXsb2HQG0JeOgr7IF7F/P7kMt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_142553_848209_337A9CE5 
X-CRM114-Status: GOOD (  11.67  )
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

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/soc/mediatek/mtk-mutex.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c1a33d52038e..85f7fd67d7c6 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -832,11 +832,6 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_mutex_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static const struct of_device_id mutex_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-mutex",
 	  .data = &mt2701_mutex_driver_data},
@@ -866,7 +861,6 @@ MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
 
 static struct platform_driver mtk_mutex_driver = {
 	.probe		= mtk_mutex_probe,
-	.remove		= mtk_mutex_remove,
 	.driver		= {
 		.name	= "mediatek-mutex",
 		.owner	= THIS_MODULE,
-- 
2.38.1


