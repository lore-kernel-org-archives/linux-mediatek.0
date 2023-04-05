Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33A0C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 14:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTB+VXYzTgQEIGOhyqnSkwBbLO+Sotxz246Tuy3vmD8=; b=GYI4iblw6odHMwm6BLIqMZ8VXp
	UVBjVGNifOzlcW73KnVFhgotnUswJlAZEAqbivETfcgSKZab1BL0LAkFCiE4abIU7ntUbtjpZ/G++
	2TzpikX9KAHCMcxw5Nf+63Bm/0LGapKNk+FSY6iBQL8I8b9ApYewnqF+2gZ35V0V2RrF2/3DlENRm
	YH1/S0y88gEemUjSPTj8H+sdBLcDzW4QfZ/Z1BkwZQ7+d4Hoo+SHVO2NcbZTMm4GSSnQsh7gRWWfw
	eh1+mCxEznyY3xP1i2XbKwB/9ulMHP+80ex2uYL9q8QTzIvDb5OF1pLDqiE6hlo+CB+1Me4RWZj6f
	cefXtkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3qH-004cSm-03;
	Wed, 05 Apr 2023 14:10:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3qD-004cRO-2X
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 14:10:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q5-0003FL-CT; Wed, 05 Apr 2023 16:10:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q4-009Abi-22; Wed, 05 Apr 2023 16:10:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q3-00AmTs-6L; Wed, 05 Apr 2023 16:10:15 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 03/10] usb: musb: mediatek: Convert to platform remove callback returning void
Date: Wed,  5 Apr 2023 16:10:02 +0200
Message-Id: <20230405141009.3400693-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
References: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RpBOv6m49AgJI769GPZjDwdUzESQIC9qonvn+da5A/s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkLYEzpMOGbs9KBOBr5kn2pH+FguaJosWzOto9s jr3Tlrrw82JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZC2BMwAKCRCPgPtYfRL+ Tq41B/9KraWDsU5Ja74j/Vj8MPqnoaFBhUlN41PKb5uH5F7L1YWuy5Mqk+NkwkVuZpmDfgUpM1N QwCjdvjsLK/FI9L2ogBFtKOTz0XplT5UswbDjI4Z4L/MMtlaA2/OOc2VsmesPLEpaXw6upuATqw wM2wuoXT5rTYBYd+5Jw59ybXkRTfiSv7mOP3Ny6417pva1zb9haYU1Z6Br6PxKOHxfBQb2trssk QPLG3oG4OpAkq6x67Hz/FiYdfE/Hg3vNAAKQQ0W6r9BeAr7Gz2t3xBbVWu5z6FaFdEFD5iRRRGs xFs+bQ1QK/MDmBbdDy0nJA0svEtSdmpy39p9HtjdxtuKXv7B
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_071025_819061_28E3399B 
X-CRM114-Status: GOOD (  16.04  )
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
 drivers/usb/musb/mediatek.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index 27b9bd258340..598ee5c0bf34 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -508,15 +508,13 @@ static int mtk_musb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_musb_remove(struct platform_device *pdev)
+static void mtk_musb_remove(struct platform_device *pdev)
 {
 	struct mtk_glue *glue = platform_get_drvdata(pdev);
 	struct platform_device *usb_phy = glue->usb_phy;
 
 	platform_device_unregister(glue->musb_pdev);
 	usb_phy_generic_unregister(usb_phy);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -529,7 +527,7 @@ MODULE_DEVICE_TABLE(of, mtk_musb_match);
 
 static struct platform_driver mtk_musb_driver = {
 	.probe = mtk_musb_probe,
-	.remove = mtk_musb_remove,
+	.remove_new = mtk_musb_remove,
 	.driver = {
 		   .name = "musb-mtk",
 		   .of_match_table = of_match_ptr(mtk_musb_match),
-- 
2.39.2


