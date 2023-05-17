Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F269AC7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 23:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZhHs5IBSnF7twGtCiE4/1bbJLTiTIs9dYau51NH/W8=; b=3JeJi4Vac26UHC0IgpdtbFDnkb
	Y7LoKv/ZcURCbGx/Rg5peg+o92oEukjSmb+g58WBPoedGjS4ACTpU0ICQvfGoJ2wNLC/Q+Gy+g/mV
	KSgMAolJIUNyMeBNWob6xBR/SQBkTCO2qFfq0W8V2j8NCC2++lWIqsN7WvrlNkWsMwSYO9zJBJ0Br
	u9GZm9iCVYBtrZyp1rVjP0NlK+9Fxslz0UW9aDdHEVMUK3hmEuIV9P2BIIpwOJmuASO37bT1B2XAW
	H/RzShBCFb9/mRI3+wJtxHLS9ovCHgN4pSDYk1klWF4NgXQiUiB2u43m1FgKNb+k+4G88rGfVRzrm
	VH3Pvpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQC7-00BJFu-2D;
	Wed, 17 May 2023 23:04:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQB3-00BILC-37
	for linux-mediatek@bombadil.infradead.org;
	Wed, 17 May 2023 23:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rZhHs5IBSnF7twGtCiE4/1bbJLTiTIs9dYau51NH/W8=; b=RhcyI85UxDYJ+DYC6yhNTnWZ/X
	SlhUmZMxWTrcJd0VKLWvHQvGGTD2ZfYxfw3lqwBl/9kRSPH8tyWzFaKLEo9LlWT0qUT3tTd+YoFKG
	QypHWgJGohkZGMPi8bMsAafSuR1EIC2qNskGsYgAV/ilJlcVSZD5yKL32ZKqwK+ywObc4i2+ATkfZ
	ptMz9WjPSHxWS7xXJWP7C2nYptF7ZNuFYORJq+QVNTii2Ex4fC206UQSgjhDGslXJq43fGN4Odqxk
	e+k66IXkEwocprZSg1qLhWgV6S7iPd823uLOWdYbgTwv3dzQZ+K5kZuf+WBpRKu+3i5A0A9+0mf2a
	XuEvwCWA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQB0-00DMdh-2C
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 23:03:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAj-0000K3-P3; Thu, 18 May 2023 01:03:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAi-000wvB-PP; Thu, 18 May 2023 01:03:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAh-005UbK-Lz; Thu, 18 May 2023 01:03:03 +0200
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
Subject: [PATCH 93/97] usb: typec: tcpci_mt6360: Convert to platform remove callback returning void
Date: Thu, 18 May 2023 01:02:35 +0200
Message-Id: <20230517230239.187727-94-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bEdst6MD6puVUki4whk5sb3nOk+/3DbRlQ9P2NLa0vI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVz4VYtPTKBqZJpxoZlbuUh64Qn01uJ/nTzuO vqgpIvQ7v6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc+AAKCRCPgPtYfRL+ TpHLB/48dbh7ghFa8RD1QJmXpnHzZgodSzLEhfR1gkVzCpzopPARENWaxJMDXY1ifb5ovC7G/8r ycWPAnynUGtCxBy2K5g339EMm9un3b9xIgEfgUla4DJ+UJNiKm7uE6I5xkDhkQiP5cUtAfwMart WVjV6680jdQYF4MhMOApZsDeT3FlIiy2sAX79G4E4/IXfXm17J6xUdiCxfmpQ/JRgI21+zLoFTV Y0hTt5HxormOp5Erhpwl1sRg06pvJejI4KS6hxL4h63c9SWBEwyTWwisUiLgxymIZqZVyVWUYko 6+isnRPorzPN5LHRLQhruTYlUFLBqKiCSeyGtrNgsn/VrY/I
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_000323_059432_22B934DB 
X-CRM114-Status: GOOD (  15.61  )
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
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index 6fa8fd5c8041..02b7fd302265 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -178,13 +178,12 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mt6360_tcpc_remove(struct platform_device *pdev)
+static void mt6360_tcpc_remove(struct platform_device *pdev)
 {
 	struct mt6360_tcpc_info *mti = platform_get_drvdata(pdev);
 
 	disable_irq(mti->irq);
 	tcpci_unregister_port(mti->tcpci);
-	return 0;
 }
 
 static int __maybe_unused mt6360_tcpc_suspend(struct device *dev)
@@ -222,7 +221,7 @@ static struct platform_driver mt6360_tcpc_driver = {
 		.of_match_table = mt6360_tcpc_of_id,
 	},
 	.probe = mt6360_tcpc_probe,
-	.remove = mt6360_tcpc_remove,
+	.remove_new = mt6360_tcpc_remove,
 };
 module_platform_driver(mt6360_tcpc_driver);
 
-- 
2.39.2


