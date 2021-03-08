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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EF4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:54:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD706514C
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 02:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD706514C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WSfo3wm8vPIDH8VBSpQnqLD3wRZ5gRXWoMGwBh0jJlU=; b=IcazsFAdr9DCLraew+CDU5Ssr
	2D61ZOTzCBV8zIwfm8SJ1HMSuh0bu/zLzSHYIU7X993t6jy2zyT78LQ0Vv7/wvyM7+eq0eSp/Rto2
	2dnMRrgrIYFiMfJbZG/Z3HMtPKaCm0cSB45cxeyUDXz3GJgA1oOg8mNwn+gnWZPQfGq0lzmczotNx
	nRCe6b9QyKsUMVCHgTrtmoA/DNLC7xpgPNQJHA7sfOPc7LSNzznDKjw7dyy8aHCdbBKWSqHShyWZp
	RJZ6G26VL+u6m+oxhhkqL230qjdzQw/HI0T49dp/UhZLOUFvjZRDQG0c2YA6OMKg/r3Um9d85MN8U
	F5bmRkvmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ62Y-00EeC7-8j; Mon, 08 Mar 2021 02:54:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ60v-00Ed9c-0h; Mon, 08 Mar 2021 02:53:02 +0000
X-UUID: 22db1003f919432e95cf1510b24b7f95-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Z5DOGHi0bHgIGivfgGsUeP6G0VDKjtTxhe0brSnEQas=; 
 b=PE4OyY95DjRl0gQGBq9f8cLvkjvZIAOWdTeqGsLgGnj84QC0iUsDug97dinACv9IlSjCZSWr9xgoqW8KV4lNJcBalJWykO/3Nly9/WDwK3UoTNzg6istpwqDa0MawwwXAw4MpcQXK+4m168f3kG4ay+GnoeJMZjcDlr3hXhWtnI=;
X-UUID: 22db1003f919432e95cf1510b24b7f95-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 364789039; Sun, 07 Mar 2021 18:52:35 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:31 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:29 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:28 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 18/18] usb: common: move function's kerneldoc next to its
 definition
Date: Mon, 8 Mar 2021 10:52:07 +0800
Message-ID: <c4d2e010ae2bf67cdfa0b55e6d1deb9339d9d3dc.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 295B076C86783B6D5C9C099F862ED377CF98F0332CAA103A0B377829A1BD079C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_025300_743742_691159FE 
X-CRM114-Status: GOOD (  20.08  )
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

Following a general rule, add the kerneldoc for a function next
to it's definition, but not next to its declaration in a header
file.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch
---
 drivers/usb/common/common.c | 35 +++++++++++++++++++++
 drivers/usb/common/debug.c  | 22 +++++++++++--
 include/linux/usb/ch9.h     | 61 -------------------------------------
 3 files changed, 55 insertions(+), 63 deletions(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 675e8a4e683a..347fb3d3894a 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -25,6 +25,12 @@ static const char *const ep_type_names[] = {
 	[USB_ENDPOINT_XFER_INT] = "intr",
 };
 
+/**
+ * usb_ep_type_string() - Returns human readable-name of the endpoint type.
+ * @ep_type: The endpoint type to return human-readable name for.  If it's not
+ *   any of the types: USB_ENDPOINT_XFER_{CONTROL, ISOC, BULK, INT},
+ *   usually got by usb_endpoint_type(), the string 'unknown' will be returned.
+ */
 const char *usb_ep_type_string(int ep_type)
 {
 	if (ep_type < 0 || ep_type >= ARRAY_SIZE(ep_type_names))
@@ -76,6 +82,12 @@ static const char *const ssp_rate[] = {
 	[USB_SSP_GEN_2x2] = "super-speed-plus-gen2x2",
 };
 
+/**
+ * usb_speed_string() - Returns human readable-name of the speed.
+ * @speed: The speed to return human-readable name for.  If it's not
+ *   any of the speeds defined in usb_device_speed enum, string for
+ *   USB_SPEED_UNKNOWN will be returned.
+ */
 const char *usb_speed_string(enum usb_device_speed speed)
 {
 	if (speed < 0 || speed >= ARRAY_SIZE(speed_names))
@@ -84,6 +96,14 @@ const char *usb_speed_string(enum usb_device_speed speed)
 }
 EXPORT_SYMBOL_GPL(usb_speed_string);
 
+/**
+ * usb_get_maximum_speed - Get maximum requested speed for a given USB
+ * controller.
+ * @dev: Pointer to the given USB controller device
+ *
+ * The function gets the maximum speed string from property "maximum-speed",
+ * and returns the corresponding enum usb_device_speed.
+ */
 enum usb_device_speed usb_get_maximum_speed(struct device *dev)
 {
 	const char *maximum_speed;
@@ -102,6 +122,15 @@ enum usb_device_speed usb_get_maximum_speed(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_get_maximum_speed);
 
+/**
+ * usb_get_maximum_ssp_rate - Get the signaling rate generation and lane count
+ *	of a SuperSpeed Plus capable device.
+ * @dev: Pointer to the given USB controller device
+ *
+ * If the string from "maximum-speed" property is super-speed-plus-genXxY where
+ * 'X' is the generation number and 'Y' is the number of lanes, then this
+ * function returns the corresponding enum usb_ssp_rate.
+ */
 enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev)
 {
 	const char *maximum_speed;
@@ -116,6 +145,12 @@ enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_get_maximum_ssp_rate);
 
+/**
+ * usb_state_string - Returns human readable name for the state.
+ * @state: The state to return a human-readable name for. If it's not
+ *	any of the states devices in usb_device_state_string enum,
+ *	the string UNKNOWN will be returned.
+ */
 const char *usb_state_string(enum usb_device_state state)
 {
 	static const char *const names[] = {
diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
index ba849c7bc5c7..a76a086b9c54 100644
--- a/drivers/usb/common/debug.c
+++ b/drivers/usb/common/debug.c
@@ -207,8 +207,26 @@ static void usb_decode_set_isoch_delay(__u8 wValue, char *str, size_t size)
 	snprintf(str, size, "Set Isochronous Delay(Delay = %d ns)", wValue);
 }
 
-/*
- * usb_decode_ctrl - returns a string representation of ctrl request
+/**
+ * usb_decode_ctrl - Returns human readable representation of control request.
+ * @str: buffer to return a human-readable representation of control request.
+ *       This buffer should have about 200 bytes.
+ * @size: size of str buffer.
+ * @bRequestType: matches the USB bmRequestType field
+ * @bRequest: matches the USB bRequest field
+ * @wValue: matches the USB wValue field (CPU byte order)
+ * @wIndex: matches the USB wIndex field (CPU byte order)
+ * @wLength: matches the USB wLength field (CPU byte order)
+ *
+ * Function returns decoded, formatted and human-readable description of
+ * control request packet.
+ *
+ * The usage scenario for this is for tracepoints, so function as a return
+ * use the same value as in parameters. This approach allows to use this
+ * function in TP_printk
+ *
+ * Important: wValue, wIndex, wLength parameters before invoking this function
+ * should be processed by le16_to_cpu macro.
  */
 const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
 			    __u8 bRequest, __u16 wValue, __u16 wIndex,
diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
index 74debc824645..1cffa34740b0 100644
--- a/include/linux/usb/ch9.h
+++ b/include/linux/usb/ch9.h
@@ -45,76 +45,15 @@ enum usb_ssp_rate {
 	USB_SSP_GEN_2x2,
 };
 
-/**
- * usb_ep_type_string() - Returns human readable-name of the endpoint type.
- * @ep_type: The endpoint type to return human-readable name for.  If it's not
- *   any of the types: USB_ENDPOINT_XFER_{CONTROL, ISOC, BULK, INT},
- *   usually got by usb_endpoint_type(), the string 'unknown' will be returned.
- */
 extern const char *usb_ep_type_string(int ep_type);
-
-/**
- * usb_speed_string() - Returns human readable-name of the speed.
- * @speed: The speed to return human-readable name for.  If it's not
- *   any of the speeds defined in usb_device_speed enum, string for
- *   USB_SPEED_UNKNOWN will be returned.
- */
 extern const char *usb_speed_string(enum usb_device_speed speed);
-
-/**
- * usb_get_maximum_speed - Get maximum requested speed for a given USB
- * controller.
- * @dev: Pointer to the given USB controller device
- *
- * The function gets the maximum speed string from property "maximum-speed",
- * and returns the corresponding enum usb_device_speed.
- */
 extern enum usb_device_speed usb_get_maximum_speed(struct device *dev);
-
-/**
- * usb_get_maximum_ssp_rate - Get the signaling rate generation and lane count
- *	of a SuperSpeed Plus capable device.
- * @dev: Pointer to the given USB controller device
- *
- * If the string from "maximum-speed" property is super-speed-plus-genXxY where
- * 'X' is the generation number and 'Y' is the number of lanes, then this
- * function returns the corresponding enum usb_ssp_rate.
- */
 extern enum usb_ssp_rate usb_get_maximum_ssp_rate(struct device *dev);
-
-/**
- * usb_state_string - Returns human readable name for the state.
- * @state: The state to return a human-readable name for. If it's not
- *	any of the states devices in usb_device_state_string enum,
- *	the string UNKNOWN will be returned.
- */
 extern const char *usb_state_string(enum usb_device_state state);
-
 unsigned int usb_decode_interval(const struct usb_endpoint_descriptor *epd,
 				 enum usb_device_speed speed);
 
 #ifdef CONFIG_TRACING
-/**
- * usb_decode_ctrl - Returns human readable representation of control request.
- * @str: buffer to return a human-readable representation of control request.
- *       This buffer should have about 200 bytes.
- * @size: size of str buffer.
- * @bRequestType: matches the USB bmRequestType field
- * @bRequest: matches the USB bRequest field
- * @wValue: matches the USB wValue field (CPU byte order)
- * @wIndex: matches the USB wIndex field (CPU byte order)
- * @wLength: matches the USB wLength field (CPU byte order)
- *
- * Function returns decoded, formatted and human-readable description of
- * control request packet.
- *
- * The usage scenario for this is for tracepoints, so function as a return
- * use the same value as in parameters. This approach allows to use this
- * function in TP_printk
- *
- * Important: wValue, wIndex, wLength parameters before invoking this function
- * should be processed by le16_to_cpu macro.
- */
 extern const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
 				   __u8 bRequest, __u16 wValue, __u16 wIndex,
 				   __u16 wLength);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
