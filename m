Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EE2C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 23:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUXHxiMvWdZrg8hXYE2+a9C6830cTM7CZ78oTB/srPI=; b=XXDfH/jNy+nxsi5YWZ5cy0Ggc7
	SRHT3oDUfP6rU/hEun03KusjLQclMDAEUXRQyMjpIg04enZXt6EWIGp79j5IcGCbNzjiZkMk3AxPv
	fobzEcfMh5lSXa3859YFv1bnpsEH5Vk6Mv7UJYv+vrya0W+MneEd0vwtA7z5HbI+k4PyYH5kGTm+D
	bDjCAjYn21hGkPIWJ+/uNWJaObStPR0dEpUcUJ50oqFY2gpTcanktmVBlNK5A7y5+bPBTErNj6NUG
	O/RxKyFQ2SIUNIDd+29vwoEm3HoUiwwZTi2YI1TLb5RlJSOglgZhcRPJMuxPa1AHjdYJ9RP5ZCnns
	g/BgA0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQBj-00BInN-2N;
	Wed, 17 May 2023 23:04:07 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzQAn-00BIAe-2k
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 23:03:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAe-0008TN-QY; Thu, 18 May 2023 01:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAd-000wu6-Kp; Thu, 18 May 2023 01:02:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzQAc-005UaW-Jk; Thu, 18 May 2023 01:02:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 82/97] usb: xhci-mtk: Convert to platform remove callback returning void
Date: Thu, 18 May 2023 01:02:24 +0200
Message-Id: <20230517230239.187727-83-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IWOiTw+ADVbwJ5rlc3EcBNPlmG8kb/fjXta3x5EI4Rw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVzXNaMSHdEtEKzzkk7w5YQwFiIbWHuqlshQu nviguL8UOyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVc1wAKCRCPgPtYfRL+ TnUqB/9BjFkMWnUO3mbVr1gawKFsFbBa5GW+4ZsmVAoidMHlv3ANo36hWRe07WCL+I9GnPCV3ps saEbyk+f28aVcnSXBOS6yCIMwcZJjGHJRvKKDebT402O+9ypyOfQdf2XbmmunPKXPgJ7Q/8IHFy uJUZmQbbJNMRqOvjdjtlvRuU3qKU+phMWrWdt3AawKBhhmQqmzeky7ekTODZ49sc1nAUkW+cGyv T4uqWotn9Yl1Qhy0seO1FT8pRKAdrozLK64FnCEJwONY4s3N/e2vlNi2L0wCeHC/IeDrjbYsoMa wGzu00nORwTWjj/GQCAFD7HulTf92L9YyxtRscoqCcLL9ExD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_160309_884428_6D8C2104 
X-CRM114-Status: GOOD (  15.80  )
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
 drivers/usb/host/xhci-mtk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 90cf40d6d0c3..8d9a55b0281b 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -673,7 +673,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int xhci_mtk_remove(struct platform_device *pdev)
+static void xhci_mtk_remove(struct platform_device *pdev)
 {
 	struct xhci_hcd_mtk *mtk = platform_get_drvdata(pdev);
 	struct usb_hcd	*hcd = mtk->hcd;
@@ -703,8 +703,6 @@ static int xhci_mtk_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
-
-	return 0;
 }
 
 static int __maybe_unused xhci_mtk_suspend(struct device *dev)
@@ -824,7 +822,7 @@ MODULE_DEVICE_TABLE(of, mtk_xhci_of_match);
 
 static struct platform_driver mtk_xhci_driver = {
 	.probe	= xhci_mtk_probe,
-	.remove	= xhci_mtk_remove,
+	.remove_new = xhci_mtk_remove,
 	.driver	= {
 		.name = "xhci-mtk",
 		.pm = DEV_PM_OPS,
-- 
2.39.2


