Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0830C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCkxsMZ02pM0gt8ja/LXdDvJSoRo6F9mq7WcqGHKTOg=; b=VqF1y9jT1rT7wXcU8GVFy/pSrn
	jtByFoyqTYX6T0aHEIBHxWZkpH3+cmo2xxPYogOtjP2NJYqpMudu6VHtZi8UY5oyEN+B4lAFlTGil
	nlPJBZtnwup6xqmzne2AiuUZ+SY5W8BOvur0or7oe5YCxeEjRfAyDQHqrCUNDS0XPUf3B92IHNTZD
	3FnuRXaC4jJYfp3tc3XqcD9+xorT8av+/gNXG2hF1X/sL8C6q2pJfVooV2kS5FWCiHBkD8XKglQZ1
	KdnwypZHynPs+26+L9UnRJL/bndZaRmxwl6WZiyEJV2CGEPVJ6DXY0ZgVc1bDiD4vz3yTaQKdhPnQ
	maxA26TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoPV-003p8Z-3u; Wed, 08 Mar 2023 07:40:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoPB-003owL-Bo
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 07:40:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZoOv-0007RO-EF; Wed, 08 Mar 2023 08:39:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZoOu-002fIe-4W; Wed, 08 Mar 2023 08:39:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZoOt-003EMM-CS; Wed, 08 Mar 2023 08:39:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 09/13] backlight: mt6370-backlight: Convert to platform remove callback returning void
Date: Wed,  8 Mar 2023 08:39:41 +0100
Message-Id: <20230308073945.2336302-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=izMl9qYZIjLfU5gY6yLq3ubZeeyc6JGvz++8GSEQJW0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCDuuUSpDDhEM7P5ntBvd6sGNC7ioJLTDFxq90 V60T6nzE3SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAg7rgAKCRDB/BR4rcrs Cc6oB/9WVJQFnIaDmnFEvpsCEp0G6K57Xf6TiCfAC7Jd+ERnAtUpHicrWrRBgZUNtxQL5wfepUv n+fEoQ3U8C5H3J/GsRo/Vvtvh8oe8F35YNtbwTKV6zUCLK/nCa5nGkkM1aHhDNCMty0reJxulh2 wTu6Kh9FqHqjUUN73Asvf1u3anMDk4fcmwYDLC3tDPcED9D/xwx+A0rE9A2arGu9J6y0bBmqZ/P 1AlmcACUajW1dL5NqPTch8fsxeRczOkX3719pRpStb4dmE0u96AoT0T1So38TH6E2CwCkE7qkxS OwC84dvY7InkTwU1CTclS7SlTp2h8HkMn2OC9mupMeJCrce4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_234009_419465_073CE360 
X-CRM114-Status: GOOD (  16.06  )
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
 drivers/video/backlight/mt6370-backlight.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
index 623d4f2baca2..94422c956453 100644
--- a/drivers/video/backlight/mt6370-backlight.c
+++ b/drivers/video/backlight/mt6370-backlight.c
@@ -318,15 +318,13 @@ static int mt6370_bl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mt6370_bl_remove(struct platform_device *pdev)
+static void mt6370_bl_remove(struct platform_device *pdev)
 {
 	struct mt6370_priv *priv = platform_get_drvdata(pdev);
 	struct backlight_device *bl_dev = priv->bl;
 
 	bl_dev->props.brightness = 0;
 	backlight_update_status(priv->bl);
-
-	return 0;
 }
 
 static const struct of_device_id mt6370_bl_of_match[] = {
@@ -342,7 +340,7 @@ static struct platform_driver mt6370_bl_driver = {
 		.of_match_table = mt6370_bl_of_match,
 	},
 	.probe = mt6370_bl_probe,
-	.remove = mt6370_bl_remove,
+	.remove_new = mt6370_bl_remove,
 };
 module_platform_driver(mt6370_bl_driver);
 
-- 
2.39.1


