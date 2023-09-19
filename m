Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4D5CD5BC2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIn8rpgA2Bef5pEZ+CF1yx2/wFYuPdOuXPQ+aBoudK4=; b=g3KIdQWQ7gjU2JsbGdqC57Yd8F
	OnZOep03dkup1fiYgYtDLIR8Z7YY1Mo0ewxZEeNYsXbKN8rVuDkH7CgTGOvT04bdQmqWL9JMim75N
	b8DVmqXByNmQ4351sWnDHk3Hylw3ekomyJB/j+CkZ65WZZ0lNbvdjlpN5JHsdfASzSkxQ+ip+u6TN
	zSgdrMyLa1Hc+cELDDL39v8iiwNhjVipy/mb6tQSZkuxkDe97K4NkadPf2vXqjO0s3A/VDjCEsWbL
	zwutS0Q9R/sD3ru0z6ngaZWalIxvMOh9WNTe5lnypChceLAtguE/iPwNBxc21Da2eKH4nDlBwmPnE
	wRIZBatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiaqK-000WYj-0q;
	Tue, 19 Sep 2023 13:32:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiaq3-000WM7-2V
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 13:32:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiaps-0004mC-D4; Tue, 19 Sep 2023 15:32:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiapr-007T4B-UU; Tue, 19 Sep 2023 15:32:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiapr-0030f2-L2; Tue, 19 Sep 2023 15:32:15 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 24/59] dma: mediatek: mtk-uart-apdma: Convert to platform remove callback returning void
Date: Tue, 19 Sep 2023 15:31:32 +0200
Message-Id: <20230919133207.1400430-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wUbraRdeXmRBw3Mbj/6UX6zPs2CjQGjrTI14q+QjZaE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCaHKS5+AhUvdT2bl40gApNiQ3KFTPSuKLtcbm gR63aS/LsiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQmhygAKCRCPgPtYfRL+ TuzKB/95CaBCD0g/JL73MgWnCheF6AyO79HEHbWfRlHqmChu6bi7T9Y/zuSSRCs9nM13J3NvCBF 8jiOZCQyuvTb1Lrh8l3ukSvL6kJl4gsmC4Jh+FhBI2m4ZvuT7Ca41Vmrn9ym0PDEW2pLxOKcaQA N0FIMlvGJf8IFsQ6igKzue5tMLkiGd1oH5U9uFJtjIIpNA+fKbx5qh2lCLuWG40BTKBxgxs29cr oQDmJR/tOb+Ytz84Qg+7uMQfIACkTJVn2E8riJNLYii48dTzT7GGN84b1+0U1e2Vwc6MQByDgK8 eI907asvIjxgaPRi5om7joa3mZZ3db8IXrcYblNEJKlqjdv4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_063227_881344_05B310C7 
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
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index c51dc017b48a..8552531b4d64 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -573,7 +573,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int mtk_uart_apdma_remove(struct platform_device *pdev)
+static void mtk_uart_apdma_remove(struct platform_device *pdev)
 {
 	struct mtk_uart_apdmadev *mtkd = platform_get_drvdata(pdev);
 
@@ -584,8 +584,6 @@ static int mtk_uart_apdma_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&mtkd->ddev);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -640,7 +638,7 @@ static const struct dev_pm_ops mtk_uart_apdma_pm_ops = {
 
 static struct platform_driver mtk_uart_apdma_driver = {
 	.probe	= mtk_uart_apdma_probe,
-	.remove	= mtk_uart_apdma_remove,
+	.remove_new = mtk_uart_apdma_remove,
 	.driver = {
 		.name		= KBUILD_MODNAME,
 		.pm		= &mtk_uart_apdma_pm_ops,
-- 
2.40.1


