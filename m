Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F62CE7A81
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gic6o4fnHHUyYlOXD1DQmylEvAqJoxgDXYp9MkjlfNE=; b=N96qGKsmWCig3In+sBrqs22y5U
	0n6v+WVna3DnHQ01CkV6KixlQiyWG7P7qVvc23DPtnQvElt6YcKUMBABV+UT1LmhVeg+4jpcUqesv
	Occ2bAq+/++vmZ2ccJb3cY7U4LP+SLhfHiFoT7GVjwZZ1wh2joEQxSamw8v2qA9TBdRWhIyhIVJA1
	ubgsjomysfWzp7REvHI4tNyb94upp1qWpi3Fut68tExNAy1eRHioiM2iiMRzCH9UrCLfwx4kph9vi
	4kuYIo4vzQk/APeF8Ks0mJIJ1YbzcYS2xhhMhtfFtjdCvyYfjNP8igTqrmKkZEaQl5WybsV0aZ3bv
	5oWVxt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiJs-00Dtqw-18;
	Mon, 25 Sep 2023 09:56:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiJc-00DtfA-2P
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 09:55:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJY-0007uc-0l; Mon, 25 Sep 2023 11:55:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJX-008pzW-0R; Mon, 25 Sep 2023 11:55:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkiJW-004dlK-NK; Mon, 25 Sep 2023 11:55:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 15/40] soc/mediatek: mtk-mmsys: Convert to platform remove callback returning void
Date: Mon, 25 Sep 2023 11:55:06 +0200
Message-Id: <20230925095532.1984344-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rYYt3hWOxp/rSaZB3hC7bdPjy5E0f9rqT7YB73IPNG0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlEVhQ2N8vDR9nD2Ao5MCsYTZ3vLvCyUvVxxx0T Vt0oDCqWlOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRFYUAAKCRCPgPtYfRL+ TvwPB/4trVp3+XeXDsOKsLF2pIYXJVUcGZyiBWvSwTKMJdMg2bZm1HT6OPeQkvwpWBIZDWFKS6C W/+hvBOySWnKaGM4sIsj/Ic6J8bPxDPemgM4B7GyraS05WHPkSlyQ4vRNCMkszEoDvjWyeqqJYM jqnPDusWzeLnNmWDEKiraDEdLn17SzAMDrmUNO0DUBZzx307ekkEX9up7dTOvLZZQyKVfbH+ehr 0KkVd/fgWvTUep5mW56l4lBIMLN8nEZVxK+/E2mqxDl/mpVljsDo5NH37AvPqKPJzFfv9JSQSKM h907gt6rOgQF+DeanqWrrgnWcMujwdRHw+OLnuTmgoh4D4AM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_025544_781106_5A5135E4 
X-CRM114-Status: GOOD (  15.46  )
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
 drivers/soc/mediatek/mtk-mmsys.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index ffb75711a1da..88209102ff3b 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -410,14 +410,12 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mtk_mmsys_remove(struct platform_device *pdev)
+static void mtk_mmsys_remove(struct platform_device *pdev)
 {
 	struct mtk_mmsys *mmsys = platform_get_drvdata(pdev);
 
 	platform_device_unregister(mmsys->drm_pdev);
 	platform_device_unregister(mmsys->clks_pdev);
-
-	return 0;
 }
 
 static const struct of_device_id of_match_mtk_mmsys[] = {
@@ -449,7 +447,7 @@ static struct platform_driver mtk_mmsys_drv = {
 		.of_match_table = of_match_mtk_mmsys,
 	},
 	.probe = mtk_mmsys_probe,
-	.remove = mtk_mmsys_remove,
+	.remove_new = mtk_mmsys_remove,
 };
 module_platform_driver(mtk_mmsys_drv);
 
-- 
2.40.1


