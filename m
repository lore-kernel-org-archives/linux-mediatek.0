Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2353C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/uvU7sUOw7sHC5RCl/6W+zWHmjzyCxjd+jlaUCTE/Y=; b=Vo7ib/k3M9hOfX4CX/8C1ryUC9
	M6RZ3FkYreoGBH+ACxaz12hnCtQUe8m1xyWLJe/k4J64ytss26k80M+1zFVx0iUl7qIA/+7RfMWN5
	i6O79tSAEvr0hnCwrNEAg3fKKmGvwPO5vADF5a8Rc24gjz047YI5Blm7/IC/VZCu7A1i7kjGb4JEr
	fnnI4CdDqU86NPUP7hTJ8Ud3f+1y2v1pjDNeiHktCFxS7bfBWS5btgBh7n2m0Klkbk5GkzaamlAO7
	dnqcjP/Po7ikyDvTYIfZIaIBVV0fw/l3z3ZR8eWF6t/XpPssRv/0IrkQ5Ph2YQdwWvTfdeHE4Nsyt
	plH3RRkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWA-00000001p9Y-1wTE;
	Thu, 09 Jul 2026 09:58:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlW7-00000001p5R-3rmm
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:06 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so22790515ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591083; x=1784195883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/uvU7sUOw7sHC5RCl/6W+zWHmjzyCxjd+jlaUCTE/Y=;
        b=LPi6RWHXkSLblTOY+5KDkfb5TAUo4o2DxQkUILcO2nCbGQbJcYJD2zM8us2hCoucgp
         kUp24m5HXBrxk/bY5q3w9u3lVI8iJuB4mgGdoiCyPypEguC0MZpHBUC71IBf4NRME8tZ
         tHN2UtGvj/DwxVhKqUW1QdbeM+nZTt8iZfBUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591083; x=1784195883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/uvU7sUOw7sHC5RCl/6W+zWHmjzyCxjd+jlaUCTE/Y=;
        b=iwZfGSb9NiD/SG2pXAVNHzsBTRRjQQLbYBsCEyyWm8yaFZm/zMjAvw6Fp5vRpEq65g
         5xWpnQ2+AG4MTMzS7Ek40BJK0zc3c4j3nGwxAUhFzSnwdkCvwKwRedGI3406DUtMWmMe
         h4Mem9/1GbeMW7/EkHgrCcJxOSP/y2GPY5DyMgVzd90abJPVzbhDop+c1poKAAmehTKZ
         4XtS3g7pSVsS8e+Jk/ld5P1q6h/RfEvg5SZkRYGhe8gs6AXp/N+CqqVSuXEnrcI12Cvl
         ymd6uUFnjBpUulKXDIKadDgC+w2TX0fgfdqimWaoHemCa3ZmmHAvX+1YFA8pjNVpC1Uk
         XaFg==
X-Forwarded-Encrypted: i=1; AHgh+RoeUhz/TNN7Q/fYxe/eQjw3PP9EkMt6nRFZCJ52Zhq1vYQArQKohM0GfnO3SDrHJ7IYCUkPrKy+wP5I/6N9YA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj2Q/p4rpQHphEK9lKWlmiO7RZ6LiMrfEGuQnyb7pd1ErP1Y66
	99LzttM3b6ZWIhBC2BY2HsMH7wPnPQNxXlVRqVfmB6nFniH2RtsxpfFGnn3Pl9LGfA==
X-Gm-Gg: AfdE7cmRv6sxJhyT7PZffehLFvgwu9hF99yLOWyigW/BYJ6daT8KoqWkXenQV9JFmi0
	zfYpNR3vO3JUmtmXbko24at6Ll8AMSQHzK7mDJJ/ap+llhbqvDT1BgciSS8SR5QwNRz7OQLK9E/
	256puerSDFYYnDQIlF51jrvF4bANG0oASMmUVF6WQLw5IJWL514zZSq8OQ1PJFoHY90S2ronCYm
	SzuroxuDkJWZC/btBGSImlOOlfLhD/hYdsmQA5h2SaPETtnrFjnyxxW+2ynCDDj7UPsM4+ilbLN
	bDlPIJgCSUHFs7hnFgOyRZaCiXwocIkIMeZTpBwT+giyAeUY7zfh7S4HrAubVoI3kYgiUlH+Zuv
	WW2KuLL6vcvkJg3ki0Hne8JYNUKxF0pBZAUBS+mGK0RlCanzY3O1NYJ701WClTmEH326E8GICj+
	EGgfv9FuXCdN02XzkHKnhcc4BNzlX8SAy+c8ZPkVIuCANeGdvVtP8nVkEv/dGqZnEFZr2L6w==
X-Received: by 2002:a17:902:c402:b0:2cc:df15:91de with SMTP id d9443c01a7336-2ccea47c1eamr75805365ad.42.1783591082919;
        Thu, 09 Jul 2026 02:58:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:02 -0700 (PDT)
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
Subject: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB port device
Date: Thu,  9 Jul 2026 17:57:10 +0800
Message-ID: <20260709095726.704448-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025804_015611_9AB41252 
X-CRM114-Status: GOOD (  16.33  )
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
Changes since v3:
- Added missing fwnode_handle_put()

Changes since v2:
- Skip assignment if hub firmware node is ACPI node
---
 drivers/usb/core/port.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..e8fb2acd77be 100644
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
@@ -780,6 +786,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
+		device_set_node(&port_dev->dev,
+				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
@@ -852,6 +865,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 
 void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
 {
+	struct usb_device *hdev = hub->hdev;
 	struct usb_port *port_dev = hub->ports[port1 - 1];
 	struct usb_port *peer;
 
-- 
2.55.0.795.g602f6c329a-goog


