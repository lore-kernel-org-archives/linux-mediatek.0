Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FF8C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:15:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D79764F45
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D79764F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dzYmqmz0YmxmMdRqtOqocG6yWHfdig0nVDzgk8RxgbE=; b=DyRU36YaGjDgX7rGAEKcVD3eI
	mX7jetkTAufe2KmV7lggzGoKU9sGt0psT9EtX1U4wnW2jn9Fsdz1jUrskmHLnK9NLSIscGip2geTN
	Mgn+L6p61c5K7kr9r2n7koe3I5KS8ECWZXlep+JLcVxxKWmgcdTqVRMJ9Tt7l9NxwF0uS9YVMo8ES
	zPl3cIh2dpoFP3fuaybMBQi7unYZhkaqhjyVJwmwSp8D/BNJYS3DHWwAbh5Moflg4DMSazE9SLEVg
	j+YUiIFYfycoCNrcdSt4q0BaHhUCI+wmfABFmd5cRZMFNU39MmmQBCegX5HRyL1M7VWaL+GGYqeGm
	6YAAtR4IA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6YD-00ECf2-NV; Fri, 05 Mar 2021 09:15:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6Wi-00EBgM-7Q; Fri, 05 Mar 2021 09:13:42 +0000
X-UUID: 73c2496af46640f790bae00d940cf4a1-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=W0P3tVZoeAMk61wgF8w5wxEA/iy3GqFVNHw9XrWMjPo=; 
 b=udUaHeHmoqFXHU+J0Xx4LmLYlyC1JQtTd1A2h0D6Tiq1jA7wjUoSKROEkul2Ifc+DKKkXPS7+IIfPp3AeiUsRy6O5fKAZqnxvr4SEWYhqjLtXflaDkowSDH/mvNNjcf9CNaPp1aZ3hTa9ojhyJwaul7V/uvbu2iHz1O5SgUndCY=;
X-UUID: 73c2496af46640f790bae00d940cf4a1-20210305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1448790238; Fri, 05 Mar 2021 01:13:30 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:28 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:26 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:25 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 16/17] usb: common: add function to get interval expressed in
 us unit
Date: Fri, 5 Mar 2021 17:02:54 +0800
Message-ID: <1614934975-15188-16-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBAAFA9C7D6D17BB8060C81C749F79CEF4C06FE8B7F31DDF103494CE2D0D7A542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_091340_798683_AC115D61 
X-CRM114-Status: GOOD (  16.20  )
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
 drivers/usb/common/common.c | 33 +++++++++++++++++++++++++++++++++
 drivers/usb/core/devices.c  | 21 ++++-----------------
 drivers/usb/core/endpoint.c | 35 ++++-------------------------------
 include/linux/usb/ch9.h     | 11 +++++++++++
 4 files changed, 52 insertions(+), 48 deletions(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index fc21cf2d36f6..5dd7e657e369 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -165,6 +165,39 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_get_dr_mode);
 
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
index abdd310c77f0..1a6d44ae707b 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -90,6 +90,17 @@ extern enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev);
  */
 extern const char *usb_state_string(enum usb_device_state state);
 
+/**
+ * usb_decode_interval - Decode bInterval into the time expressed in 1us unit
+ * @epd: The descriptor of the endpoint
+ * @speed: The speed that the endpoint works as
+ *
+ * Function returns the interval expressed in 1us unit for servicing
+ * endpoint for data transfers.
+ */
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
