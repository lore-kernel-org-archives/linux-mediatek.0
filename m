Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C47C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEH8F6EgO/MPcPfA8coeXY9mlPqtVeKVBjTr6/QZ35g=; b=0KENG5BqEq3CCfZBHLf0t1gXSb
	4CQoC3UErjxiMHFQb/2bcDZaZ3woBc3P0obr//SKTskldnXrql+20EKBNRJfm4zcSvAup9faHLj6C
	J449RK7XSEA8dtBejUs0ZWHkofEM2WSUUOblwTC/ik1WGTPgoABiOcGKjI51QCfvKv0He6wxlWWOD
	OfEWjuQdmTwK8J6KlGInfZkREyzaHrsaN2qQYxIau4i7LyPTK+0dR9xJQDoeM37AcCWbLoKekqIrD
	mBZzxPrZzPzrIbtc1BjNGdYSYEqM4QM3B7oJ+uzi/OsYbi/ckb7lwHXGc1Hk3zd+fgaLVMIq36vNg
	aRWISHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyb0U-009vO4-2r;
	Thu, 02 Nov 2023 16:57:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyb0R-009vLu-0v
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 16:57:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyb0I-00037d-A3; Thu, 02 Nov 2023 17:57:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyb0H-0067FR-Ql; Thu, 02 Nov 2023 17:57:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qyb0H-00BjcX-HQ; Thu, 02 Nov 2023 17:57:09 +0100
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
Subject: [PATCH v3 12/16] drm/mediatek: Convert to platform remove callback returning void
Date: Thu,  2 Nov 2023 17:56:53 +0100
Message-ID: <20231102165640.3307820-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vPVDYdg/isijoE6YPNzKF40xrlgv7PsxpFXT9bLQRAU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlQ9TXdTLtKBZj+1312vLvK/0mNoI9zOGh1FzV9 LSjFAT0OzeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUPU1wAKCRCPgPtYfRL+ TjpiB/9Cy2T4g22T5hBdd59kgI5U6puqGtyqrJWwvC1qQwC6UT3euPHjdSI7NnASWlMrwTTbKax EasPtjwVAhk7t1N4tsrlAZik6gqx71y2a0AVeWItAwbNS4PaOEhhzadBCiw8ar+U1ziGI/Ws8LU VjSQqZcsGB78GJyuZS1WMjM8yUv7d03HGjWEjvLBTn4Fi0xtYboaSyDA1d9WK163f4tZrpN/GRe cBX+8JsKXdjTXZeWLEIx8iC9qSlhcmR1zvdUa2NgJSOB8npISrIRZeW7IQhPa02m27GdNFW6xA8 BQGJBbqmilhpTMEFC7TjNNuFdD33HPjJJ8r69mXfmza0d2/Z
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_095719_324797_799AFED2 
X-CRM114-Status: GOOD (  15.40  )
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
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 5 ++---
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 6bf6367853fb..3fdef3ad4ffd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -531,16 +531,15 @@ static int mtk_disp_ovl_adaptor_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
+static void mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
 {
 	component_master_del(&pdev->dev, &mtk_disp_ovl_adaptor_master_ops);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 struct platform_driver mtk_disp_ovl_adaptor_driver = {
 	.probe		= mtk_disp_ovl_adaptor_probe,
-	.remove		= mtk_disp_ovl_adaptor_remove,
+	.remove_new	= mtk_disp_ovl_adaptor_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl-adaptor",
 		.owner	= THIS_MODULE,
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index db7ac666ec5e..6a5d0c345aab 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -346,10 +346,9 @@ static int mtk_ethdr_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_ethdr_remove(struct platform_device *pdev)
+static void mtk_ethdr_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_ethdr_component_ops);
-	return 0;
 }
 
 static const struct of_device_id mtk_ethdr_driver_dt_match[] = {
@@ -361,7 +360,7 @@ MODULE_DEVICE_TABLE(of, mtk_ethdr_driver_dt_match);
 
 struct platform_driver mtk_ethdr_driver = {
 	.probe		= mtk_ethdr_probe,
-	.remove		= mtk_ethdr_remove,
+	.remove_new	= mtk_ethdr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ethdr",
 		.owner	= THIS_MODULE,
-- 
2.42.0


