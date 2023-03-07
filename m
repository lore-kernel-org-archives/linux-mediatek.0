Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71001C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 11:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3JcZZBc7GuPqnEJrNQcrbIrqMYPTnYvyRytAwwycKA=; b=EFHFWHuyZ1ALrxr2C7H4YHKfP2
	yI5mtg+qbrcr8zgVGVsUw9d08CUd+t/1YND69sQIzgEEvMyMAoLTiQK27wUf56V8fv3tk7oK4+FLR
	Y73TwwV7pnokKA/wOuiTZ5FcD3c0q+yFl9ZSPh2OCuQkdT/gZcVy0+d0KM4FCeMH6+77HXxMehXvT
	4o5DW4/CCxVXMABbB6ibdqSbqq+ms/+K8dXbhT8GNHrbn5qbcLb5tURgH+jXlqSrgYFqAtn/8F7dJ
	pgEDwkMKDwR9zMVTfm6bfzKTRpAJWq7qcL34CWt7Lnjl4vP1LUiFvobvg+mZlAw8Uo30OCFNKkQix
	J0tYj9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVym-00HZFH-Gz; Tue, 07 Mar 2023 11:59:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVyU-00HZ1D-AM
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 11:59:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZVyJ-0006TP-A5; Tue, 07 Mar 2023 12:59:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZVyG-002TEq-KL; Tue, 07 Mar 2023 12:59:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZVyF-002yj7-KN; Tue, 07 Mar 2023 12:59:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 08/31] phy: mediatek: phy-mtk-mipi-dsi: Convert to platform remove callback returning void
Date: Tue,  7 Mar 2023 12:58:37 +0100
Message-Id: <20230307115900.2293120-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OaSKTY4uqDyE/b4P9Kpjn5LpWgMlD/CRSWsvB/MD7Nw=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkByacJQfciNykwOUJrVNhGA5Nxd2zTC7TCkwZQ 4c8QctKW9SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcmnAAKCRDB/BR4rcrs CSVVCACQo1k2/vqezM/4H1xRWVHIdvVsDLdfoHThYAyWII3ivZoIokEktT25evY1Znhmyu0nuhw uwLCJgEkYRjZszqxZQhA/fe0I12lZhSesE7LbSnIY6KrtAhkkah6WX3dIe3h0jo9a9NQyn/X9qy vJ84H9UfFtjkQPehl4G/LD5yKO/fq1BBmA4KUM1bIx5HZ0qE4dDZvyf4BbOT1sk1nHEuF9ZquKk m22ixqZB+EqEelFK8wKKBX+IPTa9hVnLK7xXNqVPizdhQNnQR/7zEvsPmtowJNhcfz7PjY2DQz+ b55i6avd4ukF7PdeLPGi92kGTgKYoqzzcOB1rqVzV1uu6BF0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_035922_391598_2D7DAD74 
X-CRM114-Status: GOOD (  16.33  )
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
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index cf9c386385bb..526c05a4af5e 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -180,10 +180,9 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 				   mipi_tx->pll);
 }
 
-static int mtk_mipi_tx_remove(struct platform_device *pdev)
+static void mtk_mipi_tx_remove(struct platform_device *pdev)
 {
 	of_clk_del_provider(pdev->dev.of_node);
-	return 0;
 }
 
 static const struct of_device_id mtk_mipi_tx_match[] = {
@@ -199,7 +198,7 @@ MODULE_DEVICE_TABLE(of, mtk_mipi_tx_match);
 
 static struct platform_driver mtk_mipi_tx_driver = {
 	.probe = mtk_mipi_tx_probe,
-	.remove = mtk_mipi_tx_remove,
+	.remove_new = mtk_mipi_tx_remove,
 	.driver = {
 		.name = "mediatek-mipi-tx",
 		.of_match_table = mtk_mipi_tx_match,
-- 
2.39.1


