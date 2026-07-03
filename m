Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C80FC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmjAmBgdOsKJbX+6/19rw/i6brSOy5m1SV+UDGvM0u0=; b=nV2yUQ63ROB1dKv//Z0m9c+uIY
	wm87hSjAsUT6ZRF4PtP7RuCasRNSQWDBJpAqoXTPthTJ7fm2fe4h0XGX3MLcsPJMpHiBIEFYmkXtk
	9XhyS34kRjOv/4tpxnUy70ceTKNtCQGELdGdGl4OQ6mWKkrlAMBMzKxZei+3HFj3UyFZji4Z/vsnU
	QUV4W1uyVdMcOwNRXa9vlmRQaU6qEMjr4LPEmXAcf7+paa4nqzkTyW23fEidVAKHduX6KYQX+RKbf
	8UeNWiNzIzjptCO4eOQkPzd74kAh921HtHjaJhdkPgc9RlwqnBz2yDjBYRKGOI0JrEphl0LTkDgOd
	YR4zW4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgl-00000006lN5-0Dmk;
	Fri, 03 Jul 2026 11:04:07 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgi-00000006lIJ-1Xzu
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ca265d6ca1so4871555ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076643; x=1783681443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmjAmBgdOsKJbX+6/19rw/i6brSOy5m1SV+UDGvM0u0=;
        b=VkayGD6WBFLQrulcuFCEb0Mh1OhGplaQ+4veh+zTtpeCEb3NW5qUx2r8x955Pq9xR/
         ZeEJDuyhFsAAsT6VGt+trxZ6++RQBIG6D3Ts9GtnOfOXTar7hYVuIkFTubYvGlZZaNNa
         Ep7Lpvb4XvoaWvN/we1IrKqssOy9azKheBRCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076643; x=1783681443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmjAmBgdOsKJbX+6/19rw/i6brSOy5m1SV+UDGvM0u0=;
        b=FC8pAHTHMSVON2evHtHDsqtj3roVnDYG46JB7Ni+Qsg7n+bekw6akLkEbBR8bb9Ww7
         WuvBxiz4ZO8mPm785EWPy1QtUoTuWBcEUEid1xIUOA7AtXUQqeXYlP79j7EPXgwOVNrm
         KY89TY2tDb1rvQvg77Uo/+BkbrmqS61P/VOCEyo6xjfzLNGyF877XkshWiR6EyKC/s7/
         N24v11Y31VVSi8PFV3Kx8l3iyULdARd/tQluS2dxgK7WGIDRnpJV65QS1zgwJn7ouu0u
         qPR4Wv45/X2zHyKL1FEL0SCysj1Mz4E0rRnvdHrxCdYn8NnfscXotW2Xp/QkVHlO79JD
         kMrA==
X-Forwarded-Encrypted: i=1; AHgh+RrRyaun/8ixhBSHyZ8O6wmr7nbw16zf5hQOwANrNGPDjtfPXPjOMvNguQqEsCHEjETJckaVuFLip8ZIrVqlpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiyOp4PXv5OuOXE3ATWavYn+RzfkskDVPZlqWE83XMIPH8xps+
	cmNaEHYnbe1u84l0VbGFDO75UEp8KXgBM96y2Y5Xzrg1JbL5u4QhXEfIgSmMQJk/rg==
X-Gm-Gg: AfdE7cmFtaHxDB+fWGwHsZihqlE+RnXueLSa5qHZKbKMeMK/BlPOeVtIpXOou6ApevJ
	H47gRJ9DJZbDYIJV67PvGfbVivbpFpS5dGTpAJ13Kv4PTNCjAaGy1d2HYT3Iu3ldfy7aVdRkV12
	cZmp/Qe2DQKaqg84grPF5KMMCrGn5uZGsofwpwbS21Sf1dViNBIBMxDvRn8YUC9JVSc1ugBRqnX
	OkY2H2zBlnQt2ehR04BBfYXfi8YzzmQ4Ey+6AVDr9Pr5NRzpFdNw/Yd+CHc/B1Edxq2+Ha4ATMc
	+42mC/CracygHQ8Ix+IZQgqFwb9MkYiLKnT53JFR69RTzpTXZhI4on/dwnnN6/FyyeoxFZGLf1i
	HfUHkqeYvDi3C2Uzzjp9I+DJzHvmn50aO3NS4efW8MyhRUqHtJ96YsVA0JhGu+nYb5wR9gmpWiO
	/yQMNo0QraEO0m95urGabzN5PPwdxJktxwszEyofDRFbL3NxQ3Mo1CLUzzxKGk9J0Kcc2khg==
X-Received: by 2002:a17:902:dac9:b0:2c9:b90b:8448 with SMTP id d9443c01a7336-2cacb1c1486mr42131975ad.27.1783076643387;
        Fri, 03 Jul 2026 04:04:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:02 -0700 (PDT)
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
Subject: [PATCH v3 06/13] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Fri,  3 Jul 2026 19:03:07 +0800
Message-ID: <20260703110317.1283411-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040404_428612_4F780C1C 
X-CRM114-Status: GOOD (  17.89  )
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
 drivers/usb/core/hub.c  | 11 ++++++-----
 drivers/usb/core/hub.h  |  2 +-
 drivers/usb/core/port.c |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index fe10d72ef39d..da0a4cc8e15a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3240,11 +3240,11 @@ static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
 }
 
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
@@ -3306,7 +3306,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3748,12 +3748,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5449,7 +5450,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a32..b65d9192379d 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -138,7 +138,7 @@ extern int usb_clear_port_feature(struct usb_device *hdev,
 		int port1, int feature);
 extern int usb_hub_port_status(struct usb_hub *hub, int port1,
 		u16 *status, u16 *change);
-extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+extern int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
 
 static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
 {
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 1088776ef750..77dbf51f1760 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -98,7 +98,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


