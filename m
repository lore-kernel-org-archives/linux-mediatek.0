Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C7CC44506
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/jD944UIyuOWk9l7jvwFyLAi8etvWVpl+Q1R2YAPVM=; b=bfCeUsCHayTt2qYQcPPmpBwbyB
	azPL+O8Guedem5eCMMD3etob7X1xwlZkOJ/QvI+xlqzdH04ZgjCYVUS446QOczkOGjDqt2BpjuNvS
	CVx+CXzq1jXH6FEW5xNMLpySfwd5KtRSyKaYfhxe1p/m5u2Q6je+vDBb/C5NnYNJkA5rByJLodVa/
	fSxcC2fEXMH1b7G2ixCODcbarQpzC+uimdOMOOhuoWMny0UCdFLxTJvrO5NBXcXsr3mJYA7v5Uz0W
	Ocbm3ooygoUmTX5nvA07clzT2tX2SFDW1SalS9wv0sSGwqJQEHFfQMF0LATalThSliuv0Qkr27CmQ
	wLeAQDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWL-00000001pOL-4BZt;
	Thu, 09 Jul 2026 09:58:18 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWI-00000001pJi-0sbq
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cca24023edso10249625ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591093; x=1784195893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/jD944UIyuOWk9l7jvwFyLAi8etvWVpl+Q1R2YAPVM=;
        b=XAZogMDxY2VOEZLcQQJ55pzKIDBubfXc8fRJIvviyHLV/dmgdK01Z+QVhGcAF8Mb7i
         XQjnonfDOqAHP20zbVjEJZyqD/uQrQdrOWQB2OMj2LbonmZCWsUSIclnvk1zzNL4BVKr
         K6uMqgVI7M8kfO1uamEx1YcG16j3p12GHXUFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591093; x=1784195893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/jD944UIyuOWk9l7jvwFyLAi8etvWVpl+Q1R2YAPVM=;
        b=hvrwd041moO/uCRgNkTZIliCRa2PYX46wLpeJ913VXT+yGX0wv/tN2jq1XineAx0ZN
         /pkxxnczRFayB6gdF36h8Z9+OLQYYXCJ+/Rv/3VFpGNY1X3TaBaMbO5g9F4ZDVIs4ZUM
         f4HKyWy3xrXGOVAbgYqzGzI4eQDETTGfKDJvfl9D9Q6HnDY+LdCThNfzwk7EeorT4k2K
         02SVDKyAJZrmephiGg3IAxINHXoPeOmF1HITKXaK5wb/WuOPYiSkXFqBhmm7btSI9zo9
         VYXEWVAivVKpY1cLeDKhR3TZr3kt8ufJAzP+YzaCqZ1l+zQIxifRs8q3rCVgRcUezLL1
         oujQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro46UNRI88tFPunitHO4rSqT8nvf++SnHgtDicLXqMJHLfCAde2OhI08aiDvAWvVV2uerz93S+WA+gPDJ7INg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2V+AvBsKeKYxs6xM/5AKpScygq1FmaQF36ztZOsGiPL18DI51
	S/G/s6/RfbtdMjCauRpHOIdsXnwt9dls7KoAeOoWf1QpM78GHNdgu9N2YnxSqCsL4Q==
X-Gm-Gg: AfdE7cmGlrpiH9/SN6WDGZO0WT49LTDs84SfksmY8XMyuqVxzODFt81gNCFZTyUKH0y
	5nk7zD+fIfYtlRbliz+6xCmG7H0RITJMz8DErNLBoCikCTJbGXzlGSffcmn9zKfuJBpL3KsN/nf
	3ws4LS0B9U7do8VNqCORFqbTBHZUBhEYIWbJZpI7vRWTw09yo9XxI5hji8c9Ui/ch+K6OipI0zf
	zLVMMaOYN+Y482lqbunNY+MAu93TqJKmUVxRRtmaZBjepBKne8B153ca4Lw0zNoBAFBZEm/X46u
	TQ6t0APVvIxgNjr1MmvQJXriDPiM/iKxz4vnLPy1qpcLSjs1epqCx3zd0mIUj5yo2DHGDbCghsd
	39swZHuHs+vpAYF+vYVSy7Dqau/56A3CTPJNKqotysAu7yOI/Lp4PPPKH0NQNJ2TwwZ9tqApYvW
	sSC+Gf/6aL+syecuc+ycIL/bbF0FLyAFbgQtKK+sjf+9A+kJWRhk2qaWwiL92kshTqlGA+EuIGk
	Fd1r53A
X-Received: by 2002:a17:903:644:b0:2ca:cef2:dea8 with SMTP id d9443c01a7336-2ccea46aea4mr43506135ad.35.1783591093550;
        Thu, 09 Jul 2026 02:58:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 07/14] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Thu,  9 Jul 2026 17:57:12 +0800
Message-ID: <20260709095726.704448-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025814_265767_FB769334 
X-CRM114-Status: GOOD (  18.41  )
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

usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
it to tell if the hub/port is SuperSpeed or not.

In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
state tracking field in |struct usb_port|. Either structure can be used
to identify whether a port/hub is SuperSpeed or not, as the field in
|struct usb_port| is inherited from the hub:

    port->is_superspeed = hub_is_superspeed(hub)

Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
|struct usb_port*| so a subsequent change can use it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Adapted to move of usb_port_is_power_on() to port.c and port.h
---
 drivers/usb/core/hub.c  | 7 ++++---
 drivers/usb/core/port.c | 6 +++---
 drivers/usb/core/port.h | 4 +---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 6f576efa37b1..c7fa73673582 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3290,7 +3290,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3732,12 +3732,13 @@ static int wait_for_connected(struct usb_device *udev,
 		struct usb_hub *hub, int port1,
 		u16 *portchange, u16 *portstatus)
 {
+	struct usb_port *port_dev = hub->ports[port1 - 1];
 	int status = 0, delay_ms = 0;
 
 	while (delay_ms < 2000) {
 		if (status || *portstatus & USB_PORT_STAT_CONNECTION)
 			break;
-		if (!usb_port_is_power_on(hub, *portstatus)) {
+		if (!usb_port_is_power_on(port_dev, *portstatus)) {
 			status = -ENODEV;
 			break;
 		}
@@ -5433,7 +5434,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 206b9f9a5807..f3e4d6a31798 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -23,11 +23,11 @@ static int usb_port_block_power_off;
 static const struct attribute_group *port_dev_group[];
 
 /* Check if a port is power on */
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 {
 	int ret = 0;
 
-	if (hub_is_superspeed(hub->hdev)) {
+	if (port->is_superspeed) {
 		if (portstatus & USB_SS_PORT_STAT_POWER)
 			ret = 1;
 	} else {
@@ -114,7 +114,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
index f43f6b3b6b1f..22f9973638d7 100644
--- a/drivers/usb/core/port.h
+++ b/drivers/usb/core/port.h
@@ -63,6 +63,4 @@ struct usb_port {
 #define to_usb_port(_dev) \
 	container_of(_dev, struct usb_port, dev)
 
-struct usb_hub;
-
-extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+extern int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
-- 
2.55.0.795.g602f6c329a-goog


