Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451E5C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:04:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC216514D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFC216514D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4LXAInjAVVD8aZcO+2ITA/qsso+gTjq6edrIORIBD7c=; b=ZZkqu4Eobb8NYxlv6DU58jbXi
	lF6oIw64cHTLVFLITV2uSesyZ+/GJBe98J3bhmjGe3g0Q8SoZafKgZOq2rB5qy/xP01nvRnUPKezr
	XpSQIqhmD0vI+VBCjoJkZdbE8A9FAQX7Q3+QIxdHqT4dx8nzSq+AKgDU4KMLymeg8+S6weBBj4uho
	1+x4oyeLK1ozDhlNRPFSQBI16zVWs2JhXz+yd7ALzdkk5fItu+3UYwBKSq9XJBpqTq0a2+R7QidBb
	monVTZETRAQF157VmYORrsBgMfRrOIj1GePmLTNY+0uxOUgD3ws8c83fPvXcs/7ti1rFLfn0Zec5c
	QfYbrYA1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ6BZ-00EhnD-0i; Mon, 08 Mar 2021 03:03:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ6AS-00Eh6q-3q; Mon, 08 Mar 2021 03:02:50 +0000
X-UUID: e1b8b79bde2d4208b67a3d8781150882-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1ymi1e0wq8oCxU3/iinXdzNViWjScjnYbi7jxtlSE3o=; 
 b=pCr6EaA6u7CfbRbZaEhavwVpr4JRpMXoudd+kXzx8WWPjRa9St7wD00KsKkBPtmGHGIAtycXSdLiZmUq1nCbyYw9RDAbWOR41doN/SyBAL7jYnKYVg/fjIe6z3islH3oYwtqgDrLw0Mo6hUIDvI5MJeD7GPYMWi9A0xZ8APBU6o=;
X-UUID: e1b8b79bde2d4208b67a3d8781150882-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 921135716; Sun, 07 Mar 2021 19:02:24 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:29 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:26 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 16/18] usb: common: add function to get interval expressed
 in us unit
Date: Mon, 8 Mar 2021 10:52:05 +0800
Message-ID: <25c8a09b055f716c1e5bf11fea72c3418f844482.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_030248_936047_5094FFAC 
X-CRM114-Status: GOOD (  18.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a new function to convert bInterval into the time expressed
in 1us unit.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: move kerneldoc next to function's definition suggested by Alan
---
 drivers/usb/common/common.c | 41 +++++++++++++++++++++++++++++++++++++
 drivers/usb/core/devices.c  | 21 ++++---------------
 drivers/usb/core/endpoint.c | 35 ++++---------------------------
 include/linux/usb/ch9.h     |  3 +++
 4 files changed, 52 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index fc21cf2d36f6..675e8a4e683a 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -165,6 +165,47 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_get_dr_mode);
 
+/**
+ * usb_decode_interval - Decode bInterval into the time expressed in 1us unit
+ * @epd: The descriptor of the endpoint
+ * @speed: The speed that the endpoint works as
+ *
+ * Function returns the interval expressed in 1us unit for servicing
+ * endpoint for data transfers.
+ */
+unsigned int usb_decode_interval(const struct usb_endpoint_descriptor *epd,
+				 enum usb_device_speed speed)
+{
+	unsigned int interval = 0;
+
+	switch (usb_endpoint_type(epd)) {
+	case USB_ENDPOINT_XFER_CONTROL:
+		/* uframes per NAK */
+		if (speed == USB_SPEED_HIGH)
+			interval = epd->bInterval;
+		break;
+	case USB_ENDPOINT_XFER_ISOC:
+		interval = 1 << (epd->bInterval - 1);
+		break;
+	case USB_ENDPOINT_XFER_BULK:
+		/* uframes per NAK */
+		if (speed == USB_SPEED_HIGH && usb_endpoint_dir_out(epd))
+			interval = epd->bInterval;
+		break;
+	case USB_ENDPOINT_XFER_INT:
+		if (speed >= USB_SPEED_HIGH)
+			interval = 1 << (epd->bInterval - 1);
+		else
+			interval = epd->bInterval;
+		break;
+	}
+
+	interval *= (speed >= USB_SPEED_HIGH) ? 125 : 1000;
+
+	return interval;
+}
+EXPORT_SYMBOL_GPL(usb_decode_interval);
+
 #ifdef CONFIG_OF
 /**
  * of_usb_get_dr_mode_by_phy - Get dual role mode for the controller device
diff --git a/drivers/usb/core/devices.c b/drivers/usb/core/devices.c
index 1ef2de6e375a..d8b0041de612 100644
--- a/drivers/usb/core/devices.c
+++ b/drivers/usb/core/devices.c
@@ -157,38 +157,25 @@ static char *usb_dump_endpoint_descriptor(int speed, char *start, char *end,
 	switch (usb_endpoint_type(desc)) {
 	case USB_ENDPOINT_XFER_CONTROL:
 		type = "Ctrl";
-		if (speed == USB_SPEED_HIGH)	/* uframes per NAK */
-			interval = desc->bInterval;
-		else
-			interval = 0;
 		dir = 'B';			/* ctrl is bidirectional */
 		break;
 	case USB_ENDPOINT_XFER_ISOC:
 		type = "Isoc";
-		interval = 1 << (desc->bInterval - 1);
 		break;
 	case USB_ENDPOINT_XFER_BULK:
 		type = "Bulk";
-		if (speed == USB_SPEED_HIGH && dir == 'O') /* uframes per NAK */
-			interval = desc->bInterval;
-		else
-			interval = 0;
 		break;
 	case USB_ENDPOINT_XFER_INT:
 		type = "Int.";
-		if (speed == USB_SPEED_HIGH || speed >= USB_SPEED_SUPER)
-			interval = 1 << (desc->bInterval - 1);
-		else
-			interval = desc->bInterval;
 		break;
 	default:	/* "can't happen" */
 		return start;
 	}
-	interval *= (speed == USB_SPEED_HIGH ||
-		     speed >= USB_SPEED_SUPER) ? 125 : 1000;
-	if (interval % 1000)
+
+	interval = usb_decode_interval(desc, speed);
+	if (interval % 1000) {
 		unit = 'u';
-	else {
+	} else {
 		unit = 'm';
 		interval /= 1000;
 	}
diff --git a/drivers/usb/core/endpoint.c b/drivers/usb/core/endpoint.c
index 903426b6d305..a2530811cf7d 100644
--- a/drivers/usb/core/endpoint.c
+++ b/drivers/usb/core/endpoint.c
@@ -84,40 +84,13 @@ static ssize_t interval_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
 	struct ep_device *ep = to_ep_device(dev);
+	unsigned int interval;
 	char unit;
-	unsigned interval = 0;
-	unsigned in;
 
-	in = (ep->desc->bEndpointAddress & USB_DIR_IN);
-
-	switch (usb_endpoint_type(ep->desc)) {
-	case USB_ENDPOINT_XFER_CONTROL:
-		if (ep->udev->speed == USB_SPEED_HIGH)
-			/* uframes per NAK */
-			interval = ep->desc->bInterval;
-		break;
-
-	case USB_ENDPOINT_XFER_ISOC:
-		interval = 1 << (ep->desc->bInterval - 1);
-		break;
-
-	case USB_ENDPOINT_XFER_BULK:
-		if (ep->udev->speed == USB_SPEED_HIGH && !in)
-			/* uframes per NAK */
-			interval = ep->desc->bInterval;
-		break;
-
-	case USB_ENDPOINT_XFER_INT:
-		if (ep->udev->speed == USB_SPEED_HIGH)
-			interval = 1 << (ep->desc->bInterval - 1);
-		else
-			interval = ep->desc->bInterval;
-		break;
-	}
-	interval *= (ep->udev->speed == USB_SPEED_HIGH) ? 125 : 1000;
-	if (interval % 1000)
+	interval = usb_decode_interval(ep->desc, ep->udev->speed);
+	if (interval % 1000) {
 		unit = 'u';
-	else {
+	} else {
 		unit = 'm';
 		interval /= 1000;
 	}
diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index abdd310c77f0..74debc824645 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -90,6 +90,9 @@ extern enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev);
  */
 extern const char *usb_state_string(enum usb_device_state state);
 
+unsigned int usb_decode_interval(const struct usb_endpoint_descriptor *epd,
+				 enum usb_device_speed speed);
+
 #ifdef CONFIG_TRACING
 /**
  * usb_decode_ctrl - Returns human readable representation of control request.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
