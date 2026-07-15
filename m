Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7130DC44507
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xsqWCH9ZpOgskGGTXJEdoztx/tMXd/WwKbk5g0tHRc=; b=tBeavbJjzKypBBj+Y+bmg3xWLp
	I5NCJPykp+RDnQzkK5+9TH8TwWgMhAQthjgDCdEOcQZDczaq8/3D3pMZ5Aesn+7pPKm0pXSycl0eY
	/KgcAvLt971baBwuhqsJdvIDPnCiJy2epIJqW216dIsskqTm70yRxGaEDVqYffzdQzj4hemsj4AD0
	KTpCLJSNJ/g0JQdylyu2R1ZLP9m2XJKQ+rScNBB2OXIIkwK09+Pqc6crelNaVPxRf3jx7dg/B0BCY
	x394vL82WSg2W+NsBbRCt4BXSjTQgvJTav11LJb/5yg5OXBQJ1KInNq0plPJphONcgZhgpFSa5zuW
	pGCUji/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOR-0000000EDxv-2eq9;
	Wed, 15 Jul 2026 08:55:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOK-0000000EDqM-0cAJ
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:58 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84864086bfeso5445057b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105695; x=1784710495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xsqWCH9ZpOgskGGTXJEdoztx/tMXd/WwKbk5g0tHRc=;
        b=U5nD3zmQjwmEqrJ3VtPzX1lY6fB5rXHtnrv04ULfLMLg0or/VHu+no8uksgOZFc21k
         SqApXadGHOWdmuddQR12MA4xNbjkZiJyFiMqUcJuT7xMmN/2RQh37hLnCGpUc/9GD+Mn
         njVqgd+YjkACQrZFj2THJlRn9KwsZczjkR5sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105695; x=1784710495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xsqWCH9ZpOgskGGTXJEdoztx/tMXd/WwKbk5g0tHRc=;
        b=oZho8zBhQxdDf+KDPU0ztMvDbQJYCTzHXnPj4h81nNC06HBj5/tZU+/PTT112lII7E
         gaicL77N2ftJ/WQ2D8+G0OhfY4Ufr1HEcEpqGLmk6nyNp90xo5Sgb11ewynkq0OrVuRE
         cP5l7eCc/kQYdCKzqGMhjLmdxdR7V1kaa29OxoEPLjLo04vXAEsvW14rpFNpex6ScrVO
         c0fE7uPBU9cDMDnsH3Z5buZ/scfHqhjqIWwifdh3B55JdzHUJU4hfPoOzaJ0ORxc0rZJ
         HFgGO8bDFdg6RlfQFIMb5RWg7vNr/jCNQwArfxeXa5KHLuE6luTCyElEgDMk6+G59Vwg
         Ys2A==
X-Forwarded-Encrypted: i=1; AHgh+RpVbbyiY6Mon1yiJ/yRRKwqFxRTN9UtVtsMoNW7JT4tu/xg7CcPPAVCo/UdUsAEC9P7CDHM88lKSg2KD71Caw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiKkXWQFjgRNH3I1K15KZ0PVeDNXb36DeuHjvgYoVW3mNR5ur8
	c7ZEm+6ieIMFdq/g5jnE3DUtlgPocLnyc7sn03RX5q1S9DaocFaJwiLBXrrnUaqMLw==
X-Gm-Gg: AfdE7cmCcSuRAx8XmXDnPGEGeKlL4PvLqnIvoz0IuKIRn9Nb3rtZQxhJfxPE94B+zDS
	uA+/b6ZEZzIZQrj7fhgiI2AUh72V72Y/NUW0NXvQkyNXqVpqEokjxuF2hr4Q8T2zFKwTaSqO81H
	EECoMUM6Dktp2Qz9DL48pjGILl3d5Ra0YV+8wBXjf+ynAIC3las9boyttDefI3D+juU3smVm2wQ
	CABvBVXslWeg07UASqStNXfr8Xa0xxDd1875be6QAd9Dsi9u6YkBCMBjf6gxN6dZqIOEWfWh9Fo
	Im97gX4BuGZY6h2bAscmz9v1Ldb3TrRdxyn2w34EUuATex5I1VWBnPhkHs9JV5Zcy8VdXWmXpZY
	nzWzsTZIll9U/YPJ280+DqtJuQy+/rp5w2eKjOJiACIhoJIVktl29mHmfUkUOgI+36x9FtbzNlq
	7Rl6xErNZ/5Guiokx5mNtjMXxrtfZCok9S/mI10GI27aZoYeWR7ebK3fv9DBGIZAmr+hkDbg==
X-Received: by 2002:a05:6a00:138b:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-84a5576f784mr6047283b3a.7.1784105695546;
        Wed, 15 Jul 2026 01:54:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:55 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Wed, 15 Jul 2026 16:53:38 +0800
Message-ID: <20260715085348.3457359-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015456_206342_01C5E7B8 
X-CRM114-Status: GOOD (  18.20  )
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
index e5a726dbebd0..40cdb63b5333 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3288,7 +3288,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3730,12 +3730,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5431,7 +5432,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 8f99bce074fc..19913ad3598b 100644
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
2.55.0.795.g602f6c329a-goog


