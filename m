Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513C9C531FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=; b=NjqO5Zv5TthgY2+MXk5NQeT+I5
	eJfTjNDCkgdz2iNrGjM8nClRJsfV1/tzKmtqVpmc5R5Qtm93JjOCcC0BA0I/fSdvGkv0vtftDnMrx
	qukInd3W6tn3bX34rAd0eoXj7R9IT7lXgKpjfcKagd+o6SL+9D07qPkJSvBJRqVPFRghzOlvjQFr+
	qcFn2m3fypH7DBCzIJNiU+VvLOgLs3MrUPa+A46FGwK2+AmXRiDUrhY5i0w9mX3YUWX/h5xLMs+xB
	heB+pUGTwHWYa+FYkvUlEeRnI5giSDvIWLjJV9bfR7g5IqvUrpjjlKyQH7tTJ85ZWbp/d7GbQ23nq
	nxfWLs3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWO-0000000Fqpn-0PQb;
	Fri, 24 Jul 2026 08:44:44 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWF-0000000Fqiq-11WX
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso134437a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882674; x=1785487474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=;
        b=H/b92TFwxUHLafOMvxys1EQPBCAGk5DdUJRSHYBbnkGJ4YoXF1OWzYj6kkdxQ+BzMo
         3tJEg30G3bm3vJzmLpeqOgvkmGK9dWpmN78VQ95GaiCjrO5BYhZi+pKkWubjvlRB7j1T
         9KjZIoZIz9Pmy6vmL3BwUoaanIsXgp27JfWgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882674; x=1785487474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=;
        b=TvYbO4cQxEeo1aerI8e8nlFmiS3aLzOvy3VvtMVZmrj7LSnvCbjI0sBO5lz8zrAnxd
         A0p2C4bu/gETKMcfB9IKyk2RYbtj2TypmBrOVUAyifShPbvA0p8TB/9RnPl+yaxvMOws
         gE5oAB8dCJCWg5Gtq0py4rgSZBnTVGCy4+Sen5MFsOMfhEQldzAxeUT85txGeb/nlDf+
         UfdtrK66pTOjdQpsSv1ZMHsUjnVyTz6rwKlzjy9raNrsXKZeMO3DyBPdcYwj9RLfqKuE
         9Q83qAIv2oWkVT0UOwP68UkQXIky0oWIhfbyJ89SdcaB6Hj2QojQGR+YAmsXy14G6ORp
         PDwg==
X-Forwarded-Encrypted: i=1; AHgh+Rqyw8vciLaJExyASZGdeNnWj36MInrLhBYlrvvn7k46teZo5WrOj9q3VVlURWiKxE7rK+CkM7RV8fdOAB0fHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL9mjoj06xvrUgdbr/wcY7elFOYaEABsZlvH6NgeieVQB1oYzr
	jkVgxaZgL1jf6fTu1qLFI82tlsjy137p7XWmweTBuZmFuLlGWCAFAVJIVQ/ftO0JDQ==
X-Gm-Gg: AR+sD11IdF29b+7vDR6UJ66WrzG8KpXeLaAX+vsKWlrCWP4fG5hjVgD/VrkYLtV+P+t
	yVNul5jNQVyY/LZXyjyXYq1TsdaYx3xbIyxd+kGeCH66PqFo7RciOaBwbjcDB5+w2LZr27P11At
	fVYruUpXcVOQN0XzPg/olwHe8kj/uPKjPxl/3IVoLGVs1f/lcERCgnKuq2Tk+mfcLgeQWf2Vvvw
	3w0uU6i9+pNzpwAJK24uzhVTSfFBkrgTMUkctzvWhQG5++4zATwsPd5szeZW7f7RAmHQMaLrVNB
	vqB8M7vDpf4q7tRuVFFxSppcBNMKrKG+8Zb9xqFSS4FtPD7zv5+ENQRTM/Nfod4WN/S+aw2CBY8
	kOu9OfMOh5hRJ2njb6mv+H8DdELI7Z1w2Gm1ZqxIRYCNU6UgcrAO/TlkUT2R2UZDlqnykzGERSf
	qMKojdwc9VDoIwJ8OS9ys7TbA+2yIu9GNgR3I/cQlV7DmThIlnleVndnps2lQ=
X-Received: by 2002:a17:90b:5407:b0:38e:64b0:8bce with SMTP id 98e67ed59e1d1-38ec6650435mr6482024a91.20.1784882674612;
        Fri, 24 Jul 2026 01:44:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:33 -0700 (PDT)
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
Subject: [PATCH v7 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Fri, 24 Jul 2026 16:43:15 +0800
Message-ID: <20260724084328.3943997-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014435_301123_C3D18FE5 
X-CRM114-Status: GOOD (  17.74  )
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

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

To avoid potential conflicts with ACPI firmware nodes and then causing
power management issues, only assign the firmware node if the hub's
firmware node is not an ACPI firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added extra |struct fwnode_handle *| local variables to shorten lines
  (Andy)
- Added comment about passing fwnode_graph_get_port_by_id() return value
  directly to device_set_node() (Andy)

Changes since v4:
- Dropped unused |hdev| variable
- Added flags for fwnode_graph_get_port_by_id() with
  FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
  ports can be connected

Changes since v3:
- Added missing fwnode_handle_put()

Changes since v2:
- Skip assignment if hub firmware node is ACPI node
---
 drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..c0a51d9b06a6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *dev)
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
+	/*
+	 * At this point ACPI nodes and swnodes have been removed by
+	 * device_platform_notify_remove() in device_del().
+	 */
+	fwnode_handle_put(dev_fwnode(dev));
 	kfree(port_dev->req);
 	kfree(port_dev);
 }
@@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
+	struct fwnode_handle *fwnode = dev_fwnode(&hdev->dev);
 	int retval;
 
 	port_dev = kzalloc_obj(*port_dev);
@@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(fwnode)) {
+		struct fwnode_handle *port;
+
+		/*
+		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
+		 * or NULL. Passing NULL to device_set_node() clears any associated
+		 * fwnode. It is effectively a no-op here, since no fwnode has been
+		 * assigned to the newly created device yet.
+		 */
+		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);
+		device_set_node(&port_dev->dev, port);
+	}
+
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.229.g6434b31f56-goog


