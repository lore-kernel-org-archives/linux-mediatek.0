Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A98EEAA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 20:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UN27t1XJqEjNX/Z0RGPHkx9IFCcWKt1UFqYKdyuhjRc=; b=TT+SBWrZXm7EQ/7h8ykOV13E+D
	IOUft2KWLjusDThJjDiN8yKeZ71S1+SiI+MM9RBsO5nxon47OQH5qG0My06QZ7jIe0jN2FNLJbLGM
	KsZWW3DzqlxXzKuKajrMI8n4VLLDC+eEASqZba0c+D57Nx1dawkHTTr++oHQ89jnlW+udTRNQbf0z
	Mwm6g4N/jmRc/9mvTNF7V4Ub+GzsSiXfI7sSilrEIBuPYMJTIXmnjkLWip7mXdZjQJUgELSxQcG28
	9F5oeDwg/VKq4epvVx0Z28Vs0E9uK4/O2B/lTWuZR9cGXjvKMF1yM8Pa8tMNMBTm5b2JpKkhgsVJW
	IJW/KUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgsYL-009CMl-30;
	Thu, 14 Sep 2023 20:03:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgsYI-009CM7-2K
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 20:03:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qgsYE-00006F-4T; Thu, 14 Sep 2023 22:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qgsYB-006NGb-4l; Thu, 14 Sep 2023 22:02:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qgsYA-001fbf-Rc; Thu, 14 Sep 2023 22:02:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH v2] usb: mtu3: Convert to platform remove callback returning void
Date: Thu, 14 Sep 2023 22:02:51 +0200
Message-Id: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3339; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vg8gEBT4C1SlsEfqTCxI/0BtXyuADwBrBVPRdO7Vs3E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlA2bqdPimOIqh+KW+CD5TPCoIzjtlCjSSxLwRz A0PiPugYVSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQNm6gAKCRCPgPtYfRL+ TrtTB/9aRs+Bmk4Iy2g0xqVRF748Mi7m3xP001hO9GGYUzB8srUWVD3CbRdqeErI3UddogWFVWS kXAYTYqdBImIEwxovEjO2Ce6dcP7JXx57TWaJWXKv+Q3fGjGAYe070+erxZYSrIXvMLmg4DmCbe esCjIfAieiHo632Nk+6tNEHkZtOdHYDo0aGt1cFBFGboxcI6x2iBgRWK++Q0LSTUito6lO+87am PEpJeylyVIARPY8CDGd9S+Gq1MCmDcJm83BlThsXreDj3vDYTLRwi4+7qUkniFRA+UVCUdtAZVB Lz4AH+Hw9GpYKf3K4YXfo6+r5iT4T/FFk59suToL8aMIDycm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_130302_757909_5BBFF36E 
X-CRM114-Status: GOOD (  21.04  )
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

The function mtu3_remove() can only return a non-zero value if
ssusb->dr_mode is neiter USB_DR_MODE_PERIPHERAL nor USB_DR_MODE_HOST nor
USB_DR_MODE_OTG. In this case however the probe callback doesn't succeed
and so the remove callback isn't called at all. So the code branch
resulting in this error path could just be dropped were it not for the
compiler choking on "enumeration value 'USB_DR_MODE_UNKNOWN' not handled
in switch [-Werror=switch]". So instead replace this code path by a
WARN_ON and then mtu3_remove() be converted to return void trivially.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1 sent with Message-Id:
20230709163335.3458886-1-u.kleine-koenig@pengutronix.de:

 - Keep case USB_DR_MODE_UNKNOWN to cope for the compiler being called
   with -Werror=switch.
 - Rebase to a newer tree

Just to evaluate the options, I tried with a BUG_ON(ssusb->dr_mode ==
USB_DR_MODE_UNKNOWN) before the switch, but even then gcc insists on the
case label for this value.

Best regards
Uwe

 drivers/usb/mtu3/mtu3_plat.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 6f264b129243..18c6cf9a2d71 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -451,7 +451,7 @@ static int mtu3_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtu3_remove(struct platform_device *pdev)
+static void mtu3_remove(struct platform_device *pdev)
 {
 	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
 
@@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pdev)
 		ssusb_gadget_exit(ssusb);
 		ssusb_host_exit(ssusb);
 		break;
-	default:
-		return -EINVAL;
+	case USB_DR_MODE_UNKNOWN:
+		/*
+		 * This cannot happen because with dr_mode ==
+		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
+		 * .remove() wouldn't be called at all. However (little
+		 * surprising) the compiler isn't smart enough to see that, so
+		 * we explicitly have this case item to not make the compiler
+		 * wail about an unhandled enumeration value.
+		 */
+		WARN_ON(1);
+		break;
 	}
 
 	ssusb_rscs_exit(ssusb);
@@ -478,8 +487,6 @@ static int mtu3_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-
-	return 0;
 }
 
 static int resume_ip_and_ports(struct ssusb_mtk *ssusb, pm_message_t msg)
@@ -615,7 +622,7 @@ MODULE_DEVICE_TABLE(of, mtu3_of_match);
 
 static struct platform_driver mtu3_driver = {
 	.probe = mtu3_probe,
-	.remove = mtu3_remove,
+	.remove_new = mtu3_remove,
 	.driver = {
 		.name = MTU3_DRIVER_NAME,
 		.pm = DEV_PM_OPS,

base-commit: 98897dc735cf6635f0966f76eb0108354168fb15
-- 
2.40.1


