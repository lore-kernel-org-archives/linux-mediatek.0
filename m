Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0481DC4452B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=; b=27Ll2Ylafv8Dic5/l2ZhJqeaFZ
	yRxLYkpsBs7LXsOyfnI5ohpWoQtLpg5GG7iFUDygLYzZtNPa44RqGcg+qIVC7YMvTO0OBaXC6S8P8
	S9wZc9prZuMy6Vemw0vGDcUzSmJKE98r0HBx/Ohq9SJeqMuU+jVPaOyyvtl8l9Y8bzpf1jrXlhi0g
	yiBHDHP38EPx8acRTfmRfNi1lD1CD7Twd6KHDLO008aDrnlG7qooiAPqRJ1JgnD9yMkuoWQ9bemgr
	+Gb5ZYYrNepWomsSnp/VCH23XVjjbYq7sUcQZGS8Uo2hZv7ALJQwIQG+qik9OeVI4pIUIcbacF48/
	sAEsDtbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Ns-00000008aZ0-47og;
	Tue, 21 Jul 2026 06:55:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Nm-00000008aRk-1aq1
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso81984715ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616914; x=1785221714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=WM0MUYxmg+E4pe7knx4zYyUrLKhKjMeTbrbuVWgIWYrzjwZsAq8wkwZDeYgd0qrMyf
         JdqEkOT3l1oZpjgowHBjmJDGxW1EFXp1iZ4EUdrQI40+TsAURPYXhtDRew9XiRXxM+Cz
         eiPwMvTl0CDxaXVYpCwaGtLLS/K/mKFvR6ahU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616914; x=1785221714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=ZiS7IvdQmuak+Yp3E1qDuDSNqBx5KViTBaJP1/vXLHfH0oEfAbzKEKXT8s/mlMDS00
         qnQGSfO+VV9K8UPayt79xGRnna6e1XWscv+W7THGYgARfXSb1vdyGh8p+kXBOwBTRcCN
         0P8xRSTcgwBhr8ulRRz5Tox1023zcCPLKmcikOd+REeiK4IxQiwydOlQ+oLp0uVhrvIq
         z3hm+Nrt7KGzVRxpVPQ5t+uqO9zsYBjGzKIVUZzsRJVj4HBwcz7aVjmV8dmHaD24pdp4
         ciwUfP19fig3TDwDYyfDpGumMfca6HSRVD3ER8yHr0wel2/bQjOygDyXBlhBdOG+Eg7g
         giZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7k9diQzKE9wV77ZUO+zJ/WuAzc5EXvLYZ+o5sfHhs3l2BPeeM+bgXeMp+EJ94a+gPK/0N8exNuBnqw9QmDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2wtyw6dk6DKizIzJwItyIaoby/7C3/6FB6jHf8H8l/hm3hNxy
	L7Vr+uIFemRg4jwAq+OGBAnLKnP0e9DNC2NYa5aXnVUL/TG8CqYA0ZXyEh0eJvn2Tg==
X-Gm-Gg: AR+sD109HSnf3X70Lciv3X8BWHqx0/PlhG7qiWxfgsDhLR/TUgDyvESbK0hcD3oXz4p
	l+J9IaTWPpq2+yXDs0G4c7E0+tKiWgvnHLEP/ZyE1oI4ws0UjK8ov4XzSWbKuy6JM0Bzvb9P/M6
	/lmhGor+op3RP1azXKVhyudZDz8cMBB/fMj26n4e/+DctKQro18ADWbU45kNONPYdX+sIdOOp1C
	purl9J5dcHdXPKgWAWyu/W+8ud3axwTegifeIVvGHYYd6vrGko3oF1Ek+e9FUelIJRID3qgK1Ix
	Lec7O+k8+zBjGpZP/Ns3b4OzqwD0M5YO+YlUQgA0OUsa1HO9tZnu3zHwaoR9++Fty5dSCuEs4Sg
	BU/ab0Dw4i/urb3GiiW+auA+2gu3CZ7ps8xVofL/FHmIbiZ+fgsbzAcKnNhL/oAquJ+VwuZ3gC2
	KDCsyvuHH0Jol+Ff/uu+j2LbkuLUPAB5EKhFlo7oKEWAffI4x47pT3iL4Br6c+BTdhjtHUdQ==
X-Received: by 2002:a17:903:2383:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2cf34a18cefmr188566915ad.42.1784616913792;
        Mon, 20 Jul 2026 23:55:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:13 -0700 (PDT)
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
Subject: [PATCH v6 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Tue, 21 Jul 2026 14:54:03 +0800
Message-ID: <20260721065413.2306137-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235514_432084_B0EEDD8E 
X-CRM114-Status: GOOD (  18.76  )
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
index a6c4e4c0368a..6671b5e45191 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3291,7 +3291,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3733,12 +3733,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5434,7 +5435,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b2e953f137f8..8d686d43e996 100644
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
index 00f7500af336..2f4349b3ce6b 100644
--- a/drivers/usb/core/port.h
+++ b/drivers/usb/core/port.h
@@ -63,6 +63,4 @@ struct usb_port {
 #define to_usb_port(_dev) \
 	container_of(_dev, struct usb_port, dev)
 
-struct usb_hub;
-
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
-- 
2.55.0.229.g6434b31f56-goog


