Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0DDC44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3MWujHDcAo6N5pm988slASDpmZJoFPb9rC5ReM64M0=; b=BSZ2FuC1HsXi29Qd0wqpcySmrP
	38LFuVC8PCcU+u5LDruw+qWoy29r8ZzwfQeqjLJAtSJnCFKFYoykyJnM/LjNeLMSxwdwYqieuDwqW
	U1slx+3pveT1AjB+/JC8w3dyRteqYugclSzE0SVmJqpkKeVr2o7Vh88hbZ6/ljRkdJ7YxNRuskqxi
	X3zjAMZxS+pQtj5JdhH6QaP3raBMjWDI/q35N395SGimJUc8+BfQfr/UJF6UOLbisZhZVZY3OhHRJ
	yl2jjThLlVgQ+H4rPdEynwZwJ5p5nHSyPHyEUUronglIER8ChOYB6RuaDPTeI+S3cvnWr4Iza0g1u
	Fm+I/zEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOF-0000000EDlO-00Qf;
	Wed, 15 Jul 2026 08:54:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOA-0000000EDgI-2y1T
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-848595b338cso6085084b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105686; x=1784710486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3MWujHDcAo6N5pm988slASDpmZJoFPb9rC5ReM64M0=;
        b=mSVvsjUPRN2KEFaKqSl8GeiMp3Pi5I+T1seuTRvSKL5VrUSqWArC+lKX1zfYetBOzH
         1YUAWQuPFscJXt6HhGyZ+Q9YCZjAgOt0IcQrZxWZzHmpKHIKN4wBQW31fnUuZN3RUdjF
         RdsM5DUFKkqH94pOXftvVkWEMPxDmGvffTiZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105686; x=1784710486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e3MWujHDcAo6N5pm988slASDpmZJoFPb9rC5ReM64M0=;
        b=P34uvUFprxhEYqVEPcD0UIpQx/P4eoIJViLWFPxw5dQV95qavZpFOrOFNcnegwWHHu
         lYQUbfoVihz6Br5WxR6IpsRXe9X/KAmzwKXIpb18eKZ7bifLGg56qUp4rlC6pQb3rC9k
         krI5jW5V/+j0LKOER+cxG3ww8ajbJH5byvGwjhiDDAZNkA5EVrvMdcB9tLtPksQjihht
         C2huJ5EBVd6PMZZ1lTtb7itxgNhjauUGteKY79T9ses8tSsSJjzeJnXvk65KYpfzE7bs
         KVOMerd320tMIhDfwNt92zJ7A5opcaWOL+keh2IvPNko9dqIY73fnyMj3/NVzkD4lDjz
         cF+g==
X-Forwarded-Encrypted: i=1; AHgh+Rr6eSgkpKFlEzXQx7ZjIuCWF/lxINtd9bwxccP7c4YLVfCqXJ6vnrmQjWhUtSyqm0zKCNQVTBNm5q1pBhXRdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWQM6hGRDg8PoJaOiW3zA69qxBnI01ku59poLgjLFmC4dJ+GQX
	jFzAplHmPwHy/UjF08t8xGz1wLvSZ6mCDplRgHOVHFNxTpEz+Vj9ihDOGa9pvhTBQg==
X-Gm-Gg: AfdE7cmDdmQ+TiUn1HvwteINkuBTNMiYJ7GiiNGOfX7UTR4PsHYZBFDcC0I7756OkU3
	x2UcM53CG6Zofi8xFuARqQ6DOQKzpuzPXxeenuuvvEd9uxohUQuPIrQU9kIBqTmG2EE5utr0vwS
	/1LE6l5EYRGkk0w95r4bfLsPh/Gave6PaKR0Teu4/4IikONC8Vv+jtMWMOu8il4QkxCTzyaS9EU
	L6puVU3+4Q/JZVJk9d32VvR2V/CuwwndRejyr+5O/kBTtEsf+bGPm/x8TQZ3YswgQqvPzhS9yOl
	cu/K+XDfX4zRFHtyTEKbu6pId3hVxaIzulwjhUBijPA23oTwIQxrmUPf+Bwivm91uCDF+9rIfdX
	pyun6l7twHiOwOGcl4iEnGNBImu3s4NttpzfJYE9T1ZNePmXD8xwWjSjvovp+/l8SxcA8N5Ng2l
	/mx42MGw3r3WSCymUxcVQfyAZn1hjyMZ5hVXpdIzYUNQPIJeTyO0G6zCMBtxs1hY4CHnKXRA==
X-Received: by 2002:a05:6a00:94d8:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84a554fa4e8mr5539619b3a.11.1784105685669;
        Wed, 15 Jul 2026 01:54:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:45 -0700 (PDT)
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
Subject: [PATCH v5 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 15 Jul 2026 16:53:36 +0800
Message-ID: <20260715085348.3457359-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015446_873243_BC037158 
X-CRM114-Status: GOOD (  15.74  )
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
 drivers/usb/core/port.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..4fd0a4745741 100644
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
@@ -780,6 +786,14 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
+		device_set_node(&port_dev->dev,
+				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1,
+							    FWNODE_GRAPH_DEVICE_DISABLED));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.795.g602f6c329a-goog


