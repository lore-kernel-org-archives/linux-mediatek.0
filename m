Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC5AC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 23:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9xgshEJtW6bjuO9yE8z4GpA4Hfw411DYsKAZSnJX9Q=; b=uqhhoFibI5ze4s9oENHUSO0kaG
	RiZ2tk+Ngq/r4TBP0Wf4LeUyUyOkka9RuSr1ulkmglsicF/YaybMnFTSPNXgquOCUobS0Cx/QD6D4
	SoKTJF/3MXDCcuv20rQ+/Yy3J49c67QMc8ePfqf4tPX2n5y+/fLsQA3ixkeJvA3KsGWBfIuilunLe
	660EeljNItdIq2/cV6EFtiBqzzKWZdrIh7sSlPUODmFaHngNuG57VmLEle5hQLeuIYKLBTtAUYacT
	dJJYBEbzSLnghHnxdrauKf13hweOaW7UW/qaPsetpUItxC4qQGEYV73A1gXK3/lr+8kvPiWTnvIB1
	wB1WIwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQC8-00BJH9-2G;
	Wed, 17 May 2023 23:04:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQB4-00BIMC-2a
	for linux-mediatek@bombadil.infradead.org;
	Wed, 17 May 2023 23:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C9xgshEJtW6bjuO9yE8z4GpA4Hfw411DYsKAZSnJX9Q=; b=iFsa3DhdjB0WU2DlR7zJW1a6Nk
	06gxRy4NhXv8fe58mxcxm+E+AL2Nx2MCr5Azg8RGeGt2SSeS8NAIwaZfnlPlGZii26UwTUPtqMH6W
	qScfgDw4GEra3D+kRRtJkIDL7FUusl1RjrZ82Y/zW1z11O6BgNEmFui7w2TiX/K5GSmXp5GlUvmaA
	kS4D5JkWGraCq3SLlzJWk6o7uZmrbgjs2cdGbmGAk9WRgLodLDPDGQ/HVsCJ3bO7wlMsAP8TGZcsI
	yGUXQx6GW3ZmQvATUcvM2Ix0BZ+zW5UjWo7Zw/qTwM27oUemSD1hpKTdVS59UeCb47IqGkYT70lNh
	rSvLCIcA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQB1-00DMdk-05
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 23:03:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAj-0000Ji-P5; Thu, 18 May 2023 01:03:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAi-000wv7-Jy; Thu, 18 May 2023 01:03:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAh-005UbN-Ti; Thu, 18 May 2023 01:03:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 94/97] usb: typec: tcpci_mt6360: Convert to platform remove callback returning void
Date: Thu, 18 May 2023 01:02:36 +0200
Message-Id: <20230517230239.187727-95-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ySuLhF08/2hdk62A9ACfiAgi7gCczjq8XSfTGIJpywg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVz+8PYwX2lrDs+Qf8KByZmrjGyD10wS7UFA1 Oh8O9pZRfqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc/gAKCRCPgPtYfRL+ TlJ8CAC2GJLqxGYleQ1mGLAx+k6RSWPZXL4n2QpFoJZITUa1mqFClasT5/I22TKMcbAQ7Q83gH3 HPfCNNri+Jnu/mBrTLOaJFO3EY1bewAauiyKsLIgUoIjNlT/dg18VISgnTTFEy8NLHhYzjIL6xI jFcws8gdn/kwxMrqb+CSC/u3k1QNAdgYMdlSX9SLIyAmBuwPjBT+BL78VLNNEOAwRJTHT+tLT7G ME9+jO4hkRFx5L65OkRD0f4av0MXwtf+qFHcLreFu9TAPtiwpR8PALIe4tcsYVR5vRKesUyvVCy q3mThNI9igqVmFFgkT5EZL8uZGgesbhsYI3qqYpGc8zDQtgs
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_000323_656550_32C9F964 
X-CRM114-Status: GOOD (  15.56  )
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
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/typec/tcpm/tcpci_mt6370.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
index c5bb201a5163..2a079464b398 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -178,12 +178,10 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mt6370_tcpc_remove(struct platform_device *pdev)
+static void mt6370_tcpc_remove(struct platform_device *pdev)
 {
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-
-	return 0;
 }
 
 static const struct of_device_id mt6370_tcpc_devid_table[] = {
@@ -198,7 +196,7 @@ static struct platform_driver mt6370_tcpc_driver = {
 		.of_match_table = mt6370_tcpc_devid_table,
 	},
 	.probe = mt6370_tcpc_probe,
-	.remove = mt6370_tcpc_remove,
+	.remove_new = mt6370_tcpc_remove,
 };
 module_platform_driver(mt6370_tcpc_driver);
 
-- 
2.39.2


