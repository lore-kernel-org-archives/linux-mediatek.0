Return-Path: <SRS0=AZ7y=DR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79DAC43467
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 08:54:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A8BF207CD
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 08:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxZOiIJv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fPkFkMAf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A8BF207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FVdOWcvRW/OZ6ZatXK0S1dh9MSPdXAqx5NsAkwwgwnY=; b=YxZOiIJvv0pwagbcBBbWM+TcFn
	2A6ZIhvhyHFQFaI2T8ZpJG4mkXZFpU1MpMeldS5Jdt5tvRZGHhCY7Sg06ir0DJsljps2NFEVhnCBk
	JgskcYmGP8IXf1IGjAx9u8xiijzmY9RN9HottXJpvkSLigVbFRECTOInSqR7Dt+y2z/ndAtZE2627
	Ni/JJu7LqNqQ4cS65JrUvq74pq0C6j8z7PxeZeOflkVMG8sQWdcvRvnrMyj8aj/9J4FNJolZW0T2i
	kMqV25zsYPKOCOhSjMSlfYGku3FlHXa9FVHpiEAKLirtrC9ndFPHq8W26fm16n0WCW8+96E40ed/v
	ygzTGh/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRAdW-00082A-Vr; Sat, 10 Oct 2020 08:53:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRAdO-0007z9-MJ; Sat, 10 Oct 2020 08:53:47 +0000
X-UUID: 1e370997993a42b2b8f78310c9e09ca9-20201010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=iSQ1hpnMnLh8W1/4JrBxCauTivhg/FEQi1Z9TFxO7/E=; 
 b=fPkFkMAfD/1MmXpwItnv99wbs0ZaZH68+nLIm1AdIPT+/LSyrfZKvZnZpLRBb+pUUJAvM7qpVWjasAf2C6P8STj7tdc4WOnZ3WW2qZbZiqHRfl64Mfd/uqAOmTMKLPTROAQeBGmeJqcx2JTjbJX3iY6H7cqMbfiU+Zq+Q4UxrQI=;
X-UUID: 1e370997993a42b2b8f78310c9e09ca9-20201010
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 223628432; Sat, 10 Oct 2020 00:53:22 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Oct 2020 01:43:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Oct 2020 16:43:14 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 10 Oct 2020 16:43:14 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: usb: convert usb-device.txt to YAML schema
Date: Sat, 10 Oct 2020 16:43:11 +0800
Message-ID: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: F28444144C45D7059AEFFB31F2699552160DF9233AEA5309A055B8E77F362FF62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_045346_927735_B531A4F8 
X-CRM114-Status: GOOD (  22.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert usb-device.txt to YAML schema usb-device.yaml

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch suggested by Rob
---
 .../devicetree/bindings/usb/usb-device.txt    | 102 --------------
 .../devicetree/bindings/usb/usb-device.yaml   | 129 ++++++++++++++++++
 2 files changed, 129 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-device.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
deleted file mode 100644
index 036be172b1ae..000000000000
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-Generic USB Device Properties
-
-Usually, we only use device tree for hard wired USB device.
-The reference binding doc is from:
-http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
-
-Four types of device-tree nodes are defined: "host-controller nodes"
-representing USB host controllers, "device nodes" representing USB devices,
-"interface nodes" representing USB interfaces and "combined nodes"
-representing simple USB devices.
-
-A combined node shall be used instead of a device node and an interface node
-for devices of class 0 or 9 (hub) with a single configuration and a single
-interface.
-
-A "hub node" is a combined node or an interface node that represents a USB
-hub.
-
-
-Required properties for device nodes:
-- compatible: "usbVID,PID", where VID is the vendor id and PID the product id.
-  The textual representation of VID and PID shall be in lower case hexadecimal
-  with leading zeroes suppressed. The other compatible strings from the above
-  standard binding could also be used, but a device adhering to this binding
-  may leave out all except for "usbVID,PID".
-- reg: the number of the USB hub port or the USB host-controller port to which
-  this device is attached. The range is 1-255.
-
-
-Required properties for device nodes with interface nodes:
-- #address-cells: shall be 2
-- #size-cells: shall be 0
-
-
-Required properties for interface nodes:
-- compatible: "usbifVID,PID.configCN.IN", where VID is the vendor id, PID is
-  the product id, CN is the configuration value and IN is the interface
-  number. The textual representation of VID, PID, CN and IN shall be in lower
-  case hexadecimal with leading zeroes suppressed. The other compatible
-  strings from the above standard binding could also be used, but a device
-  adhering to this binding may leave out all except for
-  "usbifVID,PID.configCN.IN".
-- reg: the interface number and configuration value
-
-The configuration component is not included in the textual representation of
-an interface-node unit address for configuration 1.
-
-
-Required properties for combined nodes:
-- compatible: "usbVID,PID", where VID is the vendor id and PID the product id.
-  The textual representation of VID and PID shall be in lower case hexadecimal
-  with leading zeroes suppressed. The other compatible strings from the above
-  standard binding could also be used, but a device adhering to this binding
-  may leave out all except for "usbVID,PID".
-- reg: the number of the USB hub port or the USB host-controller port to which
-  this device is attached. The range is 1-255.
-
-
-Required properties for hub nodes with device nodes:
-- #address-cells: shall be 1
-- #size-cells: shall be 0
-
-
-Required properties for host-controller nodes with device nodes:
-- #address-cells: shall be 1
-- #size-cells: shall be 0
-
-
-Example:
-
-&usb1 {	/* host controller */
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	hub@1 {		/* hub connected to port 1 */
-		compatible = "usb5e3,608";
-		reg = <1>;
-	};
-
-	device@2 {	/* device connected to port 2 */
-		compatible = "usb123,4567";
-		reg = <2>;
-	};
-
-	device@3 { 	/* device connected to port 3 */
-		compatible = "usb123,abcd";
-		reg = <3>;
-
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		interface@0 {	/* interface 0 of configuration 1 */
-			compatible = "usbif123,abcd.config1.0";
-			reg = <0 1>;
-		};
-
-		interface@0,2 {	/* interface 0 of configuration 2 */
-			compatible = "usbif123,abcd.config2.0";
-			reg = <0 2>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
new file mode 100644
index 000000000000..57e716b8cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-device.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The device tree bindings for the Generic USB Device
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+description: |
+  Usually, we only use device tree for hard wired USB device.
+  The reference binding doc is from:
+  http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
+
+  Four types of device-tree nodes are defined: "host-controller nodes"
+  representing USB host controllers, "device nodes" representing USB devices,
+  "interface nodes" representing USB interfaces and "combined nodes"
+  representing simple USB devices.
+
+  A combined node shall be used instead of a device node and an interface node
+  for devices of class 0 or 9 (hub) with a single configuration and a single
+  interface.
+
+  A "hub node" is a combined node or an interface node that represents a USB
+  hub.
+
+properties:
+  $nodename:
+    description: Usually includes "hub" or the standard node name for
+      USB class of device, for example, "ethernet" for the USB ethernet
+      adapter, "bt" for btusb, "camera" for the USB image sensor etc.
+    pattern: "^[a-f]+@[0-9a-f]+$"
+
+  compatible:
+    description: Device nodes or combined nodes.
+      "usbVID,PID", where VID is the vendor id and PID the product id.
+      The textual representation of VID and PID shall be in lower case
+      hexadecimal with leading zeroes suppressed. The other compatible
+      strings from the above standard binding could also be used,
+      but a device adhering to this binding may leave out all except
+      for "usbVID,PID".
+    items:
+      - pattern: "^usb[0-9a-f]+,[0-9a-f]+$"
+
+  reg:
+    description: the number of the USB hub port or the USB host-controller
+      port to which this device is attached. The range is 1-255.
+    maxItems: 1
+
+  "#address-cells":
+    description: should be 1 for hub nodes with device nodes,
+      should be 2 for device nodes with interface nodes.
+    enum: [1, 2]
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^interface@[0-9]+(,[0-9]+)$":
+    type: object
+    description: USB interface nodes.
+      The configuration component is not included in the textual
+      representation of an interface-node unit address for configuration 1.
+
+    properties:
+      compatible:
+        description: |
+          "usbifVID,PID.configCN.IN", where VID is the vendor id, PID is
+          the product id, CN is the configuration value and IN is the interface
+          number. The textual representation of VID, PID, CN and IN shall be
+          in lower case hexadecimal with leading zeroes suppressed.
+          The other compatible strings from the above standard binding could
+          also be used, but a device adhering to this binding may leave out
+          all except for "usbifVID,PID.configCN.IN".
+        items:
+          - pattern: "^usbif[0-9a-f]+,[0-9a-f]+.config[0-9a-f]+.[0-9a-f]+$"
+
+      reg:
+        description: should be 2 cells long, the first cell represents
+          the interface number and the second cell represents the
+          configuration value.
+        maxItems: 1
+
+required:
+  - compatile
+  - reg
+
+examples:
+  #hub connected to port 1
+  #device connected to port 2
+  #device connected to port 3
+  #    interface 0 of configuration 1
+  #    interface 0 of configuration 2
+  - |
+    usb@11270000 {
+        reg = <0x11270000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@1 {
+            compatible = "usb5e3,608";
+            reg = <1>;
+        };
+
+        device@2 {
+            compatible = "usb123,4567";
+            reg = <2>;
+        };
+
+        device@3 {
+            compatible = "usb123,abcd";
+            reg = <3>;
+
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            interface@0 {
+                compatible = "usbif123,abcd.config1.0";
+                reg = <0 1>;
+            };
+
+            interface@0,2 {
+                compatible = "usbif123,abcd.config2.0";
+                reg = <0 2>;
+            };
+        };
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
