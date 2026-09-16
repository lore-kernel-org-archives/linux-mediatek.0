Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D061C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWq5hvO3hBRGVn3uOxsC9S/weGAcU55UsXVnM8MhFFA=; b=o0v0Bhqz4K8jGDFcQ7UatzGk0m
	LFAdYPgsQpgoM+VvRaNjz6nqjl4Me850cnHbW2N7XibL8XjTPOToZOOqL18RWic2ZCb64VDqoH+fU
	YnMIB6ElJsadf0aUUjIqGOCjstVRHaW72vkcO1uBFZ6J22RfJ1eligR6Hjyee1OJASrbCtFczbvfa
	BqX2yo0mUJoFM8jEIsDik96PgQgWXdUIi7x9y5PNvPKD4e0Jw6nBZELtwEq+L28CjOWgy56HSfkys
	2Lz/wshFGD+Mk7vh5109bKLpO6e7ig86qfmSQuscQTJq8KcXjqMocU7wuLPBnLrsa2dNiMEdxfg15
	j9ogWF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYB-00000008eC4-1hWV;
	Wed, 16 Sep 2026 07:59:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXj-00000008dyd-3p4R
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FWq5hvO3hBRGVn3uOxsC9S/weGAcU55UsXVnM8MhFFA=; b=K6Z7emlDNcfx44C+yEq9kyG51T
	SZPc8ifBd7Slpi4gDtd7cUOXkyaGEO/LUMmK4ofqZd99AdWu+H1EX3GZwSdNCx9Vh0EWuE8AowpIC
	oRUMmIBMCaBbft87/ETjDDhX0D5voDzIedO/bFeysfnFbJDFYtMNtci6yiiDrqaBmFWl5fKEXvyzb
	Wk0OHw8DqCd4Va8IM/iOh3NmCDVL47fMApA7xGr41evudpOAXB1FZRyd+DabIyREGGUyF1gw8zqx5
	CZJE3TogVRymvH7VkmJ+v6N5wR2yuTvzn5ifEuUcQTK0KDetuwOREwUvv68Dj/evSv5GFmHbUWU1e
	aLIecQrg==;
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXf-00000007bYd-46OF
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:58:58 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4d2fe205dso375383a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545534; x=1790150334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWq5hvO3hBRGVn3uOxsC9S/weGAcU55UsXVnM8MhFFA=;
        b=jeol9FzlkZGGnLENhvLTMhDam5N5czbwxMSeDMnb7RHGHePshkq1b/Bp2pXobZuftf
         7SbnIShP/1QziuOJJ6Kv4CzDC7m2yaxAX5YkCCZU5Sntx99xXmhQiRda/khprGswvSlV
         //cXcxbK3sUZojlof21HEqecI/qV1baFC6R6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545534; x=1790150334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWq5hvO3hBRGVn3uOxsC9S/weGAcU55UsXVnM8MhFFA=;
        b=L46lOs2KosN27uUpQivAIGUHcWiDp/o04a6Vj5iZ2bWWk0RXg6zJ9zFYLXAxz4lpKh
         XLeHP0lGjueLa2b666uahoE2nS/Z3pgdAvyIAO51QDN1NoUcXL29voCCtylJEEmcXnYp
         8f+jq/KQKR+OO9KPfojwBQFGi3dp7kZGjV1jOFdcdb9Ur620bLHTAMy7+bGBn5I/S6C5
         jnXZgBr95zxpSpcrW23DwpDuWDmzt7fwe8ig4Joc2FtQdLCFCq3NNbAeUuUW14IYQ753
         ngefv3weKnp+UFq4EiOljdnccDJcs9Bj3KXJ1LZdLP2izGd8ouDShNFtXfag05TbUnIl
         YCdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZoKPngTnl59+bXlXfp6lHAPBKLcMu7qczOaSKUaHXyKs63WO7ohV5+N7Q5lO5ypHmIOVOZzY2lc3/lV+r3w==@lists.infradead.org
X-Gm-Message-State: AFuF++mPLDqqKmeEQNwxMQppSlXu08eXyD2ow/X2g4D4uCugGUiR3kMf
	P+HRAIWDqF6g1rkZj/GekHo1dvwiz6+G/mazmPeisS7cKP9yzIERe8U4Vrx53Qqqrw==
X-Gm-Gg: AYBFou1undS4VG4BLK8/VFqfo7rd9xY8nFQ+mrF4/3AvvJcKYeaDF4GQ3e+Em1V9ZKx
	toV64vbbNqIgQjAgobciX9LrLQdl+xOm2jKZ1UE9WvjzE6kfXZ2pL714CQO/Ejyxd2sBAwyaepY
	epFPOwY99UOAzIPHTOrSgqcthPSXrBSoAjJC5Fo2qOd8ZcRfqAhe+QhCOEKqOeQw+CrzIU5SHsR
	Egor0+lIdVnP4eqcL29T8ZCQ9IxHtJbYKzlax4/az3Og7F8afbUGXfynj9rijvtnTBpCdZGszYA
	rri9zNIcvakumc969uOiImzBdej0yJ7vJqE74/WZ2xC+BziNgHwjJfGVYg8KdE7XaqyrMJtSf9I
	0xnsvKiYfNkCxVIPSerWYQWSQyd77Dp5dztQb/oLZbcmLCmyv64Dq7dDwBNUdqTf8YGeanHTvQH
	KUTYIL/FXbJoFWnx15+9uE7zsS2wpNi9oDNUZz2+ITaHnYKjLhhlA2qL5mLza7R2vv2ntRmbv3R
	zG8xT3cBOjREvq43ug4rf1vZ4WxOWfUO6QKYuui+ANt2UABAkYH74yP6CPBM9py/uun
X-Received: by 2002:a17:90b:2d4f:b0:39e:1b0c:4773 with SMTP id 98e67ed59e1d1-39e1df86c10mr4199444a91.0.1789545534152;
        Wed, 16 Sep 2026 00:58:54 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:53 -0700 (PDT)
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
Subject: [PATCH v9 06/15] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 16 Sep 2026 15:57:32 +0800
Message-ID: <20260916075745.3549953-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085857_243070_DD7C0201 
X-CRM114-Status: GOOD (  18.30  )
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
2.55.0.1032.g73a4cd73de-goog


