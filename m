Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0DEC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=; b=rach08CMuahJg72sv/m079SyqZ
	3YGK27G9Onm3eEOH3hSHbmNnVQCTD56+oZ2UtwoR6YNooG8oXfH0WY+nf3r7y1wMeC1WsQgwFJ7cG
	Zh5mBHRSJdmiSUDr1zPmpEtyyE3F0PT3NtB10bGeLOCseMdrvxi/6qS8A1o5PMV/Mww2kkN8hIsoz
	uraFqxxAViPhq8+rwGmdX2PE4i7yvlgwC5S9lXyPqF+y6clvMg0v0lWlk4KCZbLREwpptDf225jca
	/7lgI1AucEPq2ELw9xlg8FTDK9L/20OL3uqEzkvpuogxkXe9jVLeBvmVkbSUTwhrtHvRoCslQxrW8
	AH6sE+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgh-00000006lHx-30fZ;
	Fri, 03 Jul 2026 11:04:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbge-00000006lDI-03WH
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c99672293cso5075585ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076639; x=1783681439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=kBipA2lEiZXvszz5momEirlRn35fnGj5U0qI/iYRNVBq7gFLZTf7CvGdKvPno3qbbK
         urVyuvfINXae7m6AaSOhhzmFr9cQLM9V/xrbkfXXumiHuNTCvBPLW3PL/9Yr/Iq90AH5
         OVZ/LKGjVNW7eTyoRr7J/Bg5VPqWas0+JzKXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076639; x=1783681439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=IPbNMfCgsAqJYnRNf8QcaL/z54EQY7uXclw8fLrUt4WujRf0fKpjQK8OvS/c1y68tW
         LjMhyddXS6tkZSdG4S1ixtEeXbX1TZBRQiEPQ4Z/zfza11orac0gObliiB1SfL6Iaqec
         DdkpitJ0blgtjQPUXJyCIP9Otfy9j5XWInXkZ+qC8GpJ/2MZqTgh4mnTs6x8S8iY6+Ax
         5Em5lyuI4lWaMng+GwMJZsNlN+yZ+1pkf91JxJKAh/9V/mVYUQdENAT1DQgtFEEiFG67
         eRVAqJigHPodpGd+T6mR7Wdzf98t3A6JyJIq5LfncP8GKnElHCVQJOqNFXR/C6qtldz+
         fMCA==
X-Forwarded-Encrypted: i=1; AHgh+Rqh2TwV5nK7mrOQUR39uDAyNNWQknx5Vt2/o+G6LfOVJbJQheuE5C2jHJerStzaWr5EKQtC2/OaKIACE1EeEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7PzuIB4T2zsgEcqVMn3YyHgmJcqV4WJubZxlsNrEXG1uTMBBJ
	6EfETEw7Zis3seHF/cuGbVNrNPDcizlJHT56ddtL95V2z+cfbEQgwlml/JZs2eGMhQ==
X-Gm-Gg: AfdE7cn1z2BKLT1z5Wjw7RX9jNrzuU7nrW1+QcArnQ6VdCytK/fj8sRkSetVQb/zLO0
	EJlRHqvwyBmIdDj8gJJato55OZnpjKzqUHTPIZEgyYjuN4aOflUbAIVKvpx7j96ted5ZISKFw7P
	rzaJ/S/fL+wU0gd1oYAxW9NoiD7eXenTc944ZpDiT1u37LtaPEKrAfTFkXWhZbCZdjGfeLduioC
	fMk2w9xk1kUGlHd5+Lm2rtcsZVOx3PGrk5tKjZItasoUTFAPaLp+I+Es0YzYsZW26Kd4T80AuP4
	z2nc3iRUpL2zA+tfWzlgXV8ExoYJTmZAA6qU0OHB2Yl/SHjLktjDAT7O8o0XL93NfqKbCO5kVCw
	dEyYtCKQFv126eymWL7gRqzpkUgdL/yGPcNDrNo2JanG21wfVdPv9tA7xr9fWn/ZXBAPuEjJRoH
	n8p4bquUhCfdFjR3iiEWKxGHmi/Rns653/L/644IcSX8ps37WOxY767PXeZi0RBKyzinaDiQ==
X-Received: by 2002:a17:902:e5c4:b0:2ca:d874:c6de with SMTP id d9443c01a7336-2cad874c884mr19763035ad.26.1783076639217;
        Fri, 03 Jul 2026 04:03:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:58 -0700 (PDT)
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
Subject: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
Date: Fri,  3 Jul 2026 19:03:06 +0800
Message-ID: <20260703110317.1283411-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040400_067291_55EA6D8D 
X-CRM114-Status: GOOD (  13.93  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Skip assignment if hub firmware node is ACPI node

 drivers/usb/core/port.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1088776ef750 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -780,6 +781,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
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
-- 
2.55.0.rc0.799.gd6f94ed593-goog


