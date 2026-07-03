Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92E5C44500
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOb8vZkypDhiCK5oWGkMlPDQ0lYXQ1vc7Yfl2MuBtSo=; b=QF6LZ3w7gp/rVY/xsTwgQbdj1h
	/w8OSEniwvkSbWT4pHeffTBtXXzpr3Upx2NE5xiM4DrCAewkmqceMbHfWZGxu6b0EdCuwfZ7LY5AP
	YCrnI72jC+i7hMPeSjvcBY0GdSKcR4vJkcnDxWAPKQgCTJjVbz+ewE+cMoMeKAdBoMImvq6gk7UU/
	osJr5+tQyD9z2q/g27F08kb+Zwck6J84QV+FNVeCewtIaiNilm7SOx+uMvewOe7vtXqhBFxacKeOe
	K6BI9qVFEyPjwhc5OwpKPzh6z/VsgpzZpGetbVtDdUfoh7T/3xW9fYt4RSKQYoYfe1pzi+I1XM1J4
	ZN1TlsBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgu-00000006lan-2wa0;
	Fri, 03 Jul 2026 11:04:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgq-00000006lTf-0Agh
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so4267905ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076651; x=1783681451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOb8vZkypDhiCK5oWGkMlPDQ0lYXQ1vc7Yfl2MuBtSo=;
        b=gplUxZFmSIUyJbjgL5meEgZ2nenIXYcF3zpYRQCu/Vpo4hDSeIi6YP0qX8VgTMwNli
         fQ8tHdrncpMLv4A0zAXcq1PB03QEZfIBt47T3ag/R8mP9tkvHNYtRcYM5wDZKPkuEurT
         UpPqyAtZ+njPL2fT9uWbKl8Af5uM08Ckl2k4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076651; x=1783681451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yOb8vZkypDhiCK5oWGkMlPDQ0lYXQ1vc7Yfl2MuBtSo=;
        b=N8J6uHAvQ7Q6Yre3iI1FmPI4aK22T2di4GzJ5EP9eIOO25Ns55CG0vGwYTcy4UaRr/
         0QKWPHZVDeNww3vpYMMMoK+mT4aNhfTqdbhJkoKmMs3eJb2jIqPGsPU3e72SQRehuQ3G
         YasZqL9iLpmNlaFm6qkVD0Fd/3RYtNJZ9/nmyIPlKotjZPchZvVGl0wkK8fBaRUyfeNR
         Y4phF1faKE6Gn4ftvYBMaUbYj+TPF8x1cmqTOVUIu/WHpdh97/ROeBxeQ8JCu11ECVbB
         HffvccY+E6sd/qRld5K6KsyIbrMTgjUWnbVbq/tvL00exQFqBr/RC4P8gD4EM30NGy33
         Dbpg==
X-Forwarded-Encrypted: i=1; AHgh+RriuNOFCwaZP57LmuNJ/dq6SxisAFQJTSNkEMe/uapuEziFVaf1d1UBn9/maXivwdeBAxJu6i+GtXGhLsUfLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1ssdAXsj5nbahrhjtN2sNDcD3nT0aXlyfx3PQmchnY9izOpAp
	CtCgxaNa0FD6bh4SWG2QVNw3jrnDbkz8z+oq6CLT9b6bBHBVDbJ8XdbbJmS+p1wiAg==
X-Gm-Gg: AfdE7clu2vgARGwu2nW1avOH5gCCvYAkwKj978/Rwr0m5E6Uorm2G2lwYMOm/3vKf02
	ZBwv0Nw7VFBH+vr7Rk9vtroVpgbH3QD7wJtOCWdSMs/JYIwwa/X4nXlY/f+uuhXq8gwbRgFImCv
	4yEyQH0k55iU38xL8fIeT4oKOg9sAJEe1qzSRFMZ3ZuqdWdz79e0jyY391BWS8myM/dxGNkN6lf
	fshlh2/PMi713wHLh7KCzNj7YkJ20E572XogD9Z0oEI8KYMaBGb+a/sOuqZw6SWarna8Ku3wN4K
	m62jXMLIKZMSN2+KGB0/4dqX0jGH8/i3p59LA2xUlIhw6foOJJiK3QcgiRuxNU2tPf5yBrfoPWQ
	8Mk+RKXdnvreeUZwDoaoETPLjYFotm9kMnHLD6WQhgLb9uBRfAaeflIIQIgqHZlZgaLaVZLPQQL
	Gmt1XnFXqxUwhFtlwOUkQKzFy7Mb7V2e6ZrJIqQknfepBSVM5qy/kDzMyC9oHnYzHiQTsEBw==
X-Received: by 2002:a17:902:f711:b0:2ca:10c6:f69b with SMTP id d9443c01a7336-2ca7e654868mr112077965ad.5.1783076651250;
        Fri, 03 Jul 2026 04:04:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:10 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key connectors with power sequencing API
Date: Fri,  3 Jul 2026 19:03:09 +0800
Message-ID: <20260703110317.1283411-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040412_817739_EBB0F03D 
X-CRM114-Status: GOOD (  37.93  )
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

The new M.2 E-key connector can have a USB connection. For the USB device
on this connector to work, its power must be enabled and the W_DISABLE2#
signal deasserted. The connector driver handles this and provides a
toggle over the power sequencing API.

This feature currently only supports a directly connected (no mux in
between) M.2 E-key connector. Existing USB connector types are not
covered. The USB A connector was recently added to the onboard devices
driver. USB B connectors have historically been managed by the USB
gadget or dual-role device controller drivers. USB C connectors are
handled by TCPM drivers.

The power sequencing API does not know whether a power sequence provider
is not needed or not available yet, so we only request it for connectors
that we know need it, which at this time is just the E-key connector.

On the USB side, the port firmware node (if present) is tied to the
usb_port device. This device is used to acquire the power sequencing
descriptor. This allows the provider to tell the different ports on one
hub apart.

This feature is not implemented in the onboard USB devices driver. The
power sequencing API expects the consumer device to make the request,
but there is no device node to instantiate a platform device to tie
the driver to. The connector is not a child node of the USB host or
hub, and the graph connection is from a USB port to the connector.
And the connector itself already has a driver.

Power sequencing is not directly enabled in the connector driver as
that would completely decouple the timing of it from the USB subsystem.
It would not be possible for the USB subsystem to toggle the power
for a power cycle or to disable the port.

Also rewrite the existing set_bit() and clear_bit() branches with
assign_bit() to make it cleaner.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expanded subject to mention power sequencing API
- Dropped commit message bit about power sequencing Kconfig symbol change
  to bool
- Added optional dependency on POWER_SEQUENCING to USB
- Split out pwrseq_power_*() calls into separate helpers
- Rewrote set_bit() and clear_bit() branches with assign_bit()
- Dropped the pwrseq_power_off() before pwrseq_put(): pwrseq_put() does it
  automatically.
- Removed pwrseq_power_on() from usb_hub_create_port_device(); it will
  get called through usb_hub_set_port_power() in hub_activate().
- Added checks for port->pwrseq in hub_is_port_power_switchable()

- Use separate pwrseq descriptors for HighSpeed and SuperSpeed ports.
  This makes things simpler. On the other hand to power cycle a port
  userspace needs to toggle it on both the HS and SS ports together.
- Dropped pwrseq state tracking again
  The power sequencing consumer API already tracks the state internally;
  doing it again in |struct usb_port| is not necessary especially now
  that the descriptors aren't shared.

It's unclear to me how actual hubs reconcile USB_PORT_FEAT_POWER settings
from the HS side and SS side. One hub chip vendor said that VBUS_EN for
a port is on if the flag is set on either side; however actually testing
on one of their hubs showed that VBUS was cut as soon as the flag is
cleared on the HS port. Maybe it could be different if a SS device was
connected? That scenario was not tested. Testing on another retail
bought hub seemed to work exactly as described though: USB_PORT_FEAT_POWER
needed to be clear on both HS and SS ports to turn off VBUS.

Under this scheme, I'm not sure how the power cycle in hub_port_connect()
would work correctly.

- Link to v2:
  https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromium.org/

Changes since v1:
- Switch to fwnode instead of OF
- Tie port@ fwnode to usb_port device
- Move remote node compatible checking to separate helper
- Use usb_port device to request power sequencing descriptor
- Drop "index" parameter from pwrseq_get()
- Do not get pwrseq descriptor for SuperSpeed port; share one for one
  physical port
- Add pwrseq state tracking
- Link to v1:
  https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromium.org/
---
 drivers/usb/Kconfig     |  1 +
 drivers/usb/core/hub.c  | 44 +++++++++++++++++++++++++++++-----
 drivers/usb/core/hub.h  | 10 +++++++-
 drivers/usb/core/port.c | 52 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 99 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index abf8c6cdea9e..ef1959363fb1 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -44,6 +44,7 @@ config USB_ARCH_HAS_HCD
 config USB
 	tristate "Support for Host-side USB"
 	depends on USB_ARCH_HAS_HCD
+	depends on POWER_SEQUENCING if POWER_SEQUENCING
 	select GENERIC_ALLOCATOR
 	select USB_COMMON
 	select NLS  # for UTF-8 strings
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 8ae97e8c26aa..dfa0f5dd75e8 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -32,6 +32,7 @@
 #include <linux/mutex.h>
 #include <linux/random.h>
 #include <linux/pm_qos.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/kobject.h>
 
 #include <linux/bitfield.h>
@@ -871,6 +872,30 @@ static void hub_tt_work(struct work_struct *work)
 	spin_unlock_irqrestore(&hub->tt.lock, flags);
 }
 
+static int usb_hub_set_port_pwrseq(struct usb_port *port, bool set)
+{
+	int ret = 0;
+
+	if (set)
+		ret = pwrseq_power_on(port->pwrseq);
+	else
+		ret = pwrseq_power_off(port->pwrseq);
+
+	return ret;
+}
+
+static int usb_hub_restore_port_pwrseq(struct usb_port *port, bool set)
+{
+	int ret = 0;
+
+	if (set)
+		ret = pwrseq_power_off(port->pwrseq);
+	else
+		ret = pwrseq_power_on(port->pwrseq);
+
+	return ret;
+}
+
 /**
  * usb_hub_set_port_power - control hub port's power state
  * @hdev: USB device belonging to the usb hub
@@ -886,20 +911,24 @@ static void hub_tt_work(struct work_struct *work)
 int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 			   int port1, bool set)
 {
+	struct usb_port *pwrseq_port = hub->ports[port1 - 1];
 	int ret;
 
+	ret = usb_hub_set_port_pwrseq(pwrseq_port, set);
+	if (ret)
+		return ret;
+
 	if (set)
 		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 	else
 		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
-	if (ret)
+	if (ret) {
+		usb_hub_restore_port_pwrseq(pwrseq_port, set);
 		return ret;
+	}
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
@@ -3249,7 +3278,10 @@ int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 			ret = 1;
 	}
 
-	return ret;
+	if (!port->pwrseq)
+		return ret;
+
+	return ret && pwrseq_power_is_on(port->pwrseq);
 }
 
 static void usb_lock_port(struct usb_port *port_dev)
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index b65d9192379d..99bae6ace4da 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -85,6 +85,7 @@ struct usb_hub {
  * @port_owner: port's owner
  * @peer: related usb2 and usb3 ports (share the same connector)
  * @connector: USB Type-C connector
+ * @pwrseq: power sequencing descriptor for the port
  * @req: default pm qos request for hubs without port power control
  * @connect_type: port's connect type
  * @state: device state of the usb device attached to the port
@@ -104,6 +105,7 @@ struct usb_port {
 	struct usb_dev_state *port_owner;
 	struct usb_port *peer;
 	struct typec_connector *connector;
+	struct pwrseq_desc *pwrseq;
 	struct dev_pm_qos_request *req;
 	enum usb_port_connect_type connect_type;
 	enum usb_device_state state;
@@ -147,7 +149,13 @@ static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
 	if (!hub)
 		return false;
 	hcs = hub->descriptor->wHubCharacteristics;
-	return (le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM;
+	if ((le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM)
+		return true;
+	/* check for controllable external power sequencers */
+	for (unsigned int i = 1; i <= hub->hdev->maxchild; i++)
+		if (hub->ports[i] && hub->ports[i]->pwrseq)
+			return true;
+	return false;
 }
 
 static inline int hub_is_superspeed(struct usb_device *hdev)
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 77dbf51f1760..87b8e4f90be6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -8,11 +8,14 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/pm_qos.h>
+#include <linux/property.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/component.h>
 #include <linux/usb/of.h>
 
@@ -29,6 +32,9 @@ static bool usb_port_allow_power_off(struct usb_device *hdev,
 	if (hub_is_port_power_switchable(hub))
 		return true;
 
+	if (port_dev->pwrseq)
+		return true;
+
 	if (!IS_ENABLED(CONFIG_ACPI))
 		return false;
 
@@ -749,6 +755,39 @@ static const struct component_ops connector_ops = {
 	.unbind = connector_unbind,
 };
 
+static bool port_pwrseq_is_supported(struct usb_port *port_dev)
+{
+	struct device *dev = &port_dev->dev;
+	struct fwnode_handle *port = dev->fwnode;
+	struct fwnode_handle *ep __free(fwnode_handle) =
+			fwnode_graph_get_next_port_endpoint(port, NULL);
+	if (!ep)
+		return false;
+
+	struct fwnode_handle *remote __free(fwnode_handle) =
+			fwnode_graph_get_remote_port_parent(ep);
+	if (!remote)
+		return false;
+
+	if (!fwnode_device_is_compatible(remote, "pcie-m2-e-connector")) {
+		dev_dbg(dev, "remote endpoint %pfw is not a supported connector", remote);
+		return false;
+	}
+
+	return true;
+}
+
+static struct pwrseq_desc *usb_hub_port_pwrseq_get(struct usb_port *port_dev)
+{
+	if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
+		return NULL;
+
+	if (!port_pwrseq_is_supported(port_dev))
+		return NULL;
+
+	return pwrseq_get(&port_dev->dev, "usb");
+}
+
 int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
@@ -809,10 +848,18 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 		goto err_put_kn;
 	}
 
+	port_dev->pwrseq = usb_hub_port_pwrseq_get(port_dev);
+	if (IS_ERR(port_dev->pwrseq)) {
+		retval = PTR_ERR(port_dev->pwrseq);
+		dev_err_probe(&port_dev->dev, retval,
+			      "failed to get power sequencing descriptor\n");
+		goto err_put_kn;
+	}
+
 	retval = component_add(&port_dev->dev, &connector_ops);
 	if (retval) {
 		dev_warn(&port_dev->dev, "failed to add component\n");
-		goto err_put_kn;
+		goto err_put_pwrseq;
 	}
 
 	find_and_link_peer(hub, port1);
@@ -850,6 +897,8 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	}
 	return 0;
 
+err_put_pwrseq:
+	pwrseq_put(port_dev->pwrseq);
 err_put_kn:
 	sysfs_put(port_dev->state_kn);
 err_unregister:
@@ -866,6 +915,7 @@ void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
 	peer = port_dev->peer;
 	if (peer)
 		unlink_peers(port_dev, peer);
+	pwrseq_put(port_dev->pwrseq);
 	component_del(&port_dev->dev, &connector_ops);
 	sysfs_put(port_dev->state_kn);
 	device_unregister(&port_dev->dev);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


