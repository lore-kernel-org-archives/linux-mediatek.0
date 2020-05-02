Return-Path: <SRS0=m7qp=6Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9867EC3A5A9
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 May 2020 16:28:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 650F821974
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 May 2020 16:28:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K6KivOSo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sE9fQZ02"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 650F821974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/nUZs0KqT2wmEjjTutbwVr0FBcU6M7rsFwrF1X8SXM=; b=K6KivOSoEcvzaQ
	Vreza0H6mqVnI7fB0G/Qf1z18fYXkd8ReoekQ4MYxcrqNzpHvkWsqhmtplhAryOXqi6hpZjhJVYt3
	pmo+9JfwV7N1igfAaHRTLh9hUCX6U3PEypd2EsitDwzbD3PF9X4ytPnPLstdOAw3kvO1Eg/QSx/kW
	7/MF8CCsGrARC+xbOJcjNWEoybhaPtsqKeh0KwtAad0t7dW+nkS9E6XAAsL2kW9pijlcKZCLxQ9/d
	5J4ClK8PM2DyTKB57f8E3njKndGgBFPI279L2JcM1xqXF5vojemD+L4kd9nhIF9FQjP0EvxfBXah1
	EN1dYdoqRIWm8812QT5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUv0K-0005Z3-Ay; Sat, 02 May 2020 16:28:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUv0G-0005Xy-Vt; Sat, 02 May 2020 16:28:38 +0000
X-UUID: d1d8161eaaa64840b4697801da47a9cd-20200502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fchvuHLghoAhuDb1n3lVC1u/DWcrET0Dm/xjW9sen3o=; 
 b=sE9fQZ02O56qMR5sEZufs6ahJicIjx9Z86/a4Wn1Wc5uzuI7UYPWZm9UuMYS1nPoPWnycBSFvjfurJno0EVMDojRZAcrvoyxAJp/fNEFQibJub2bW/lAdh2xRAV5nQwjzcC2BkyIpfX3BXhKmnctH24iqHZ4Iih6yIf9vPeLqsU=;
X-UUID: d1d8161eaaa64840b4697801da47a9cd-20200502
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1054471724; Sat, 02 May 2020 08:28:32 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 2 May 2020 09:18:27 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 00:18:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 3 May 2020 00:18:25 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V5, 1/2] media: dt-bindings: media: i2c: Document DW9768 bindings
Date: Sun, 3 May 2020 00:17:26 +0800
Message-ID: <20200502161727.30463-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_092837_035791_4E60A689 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 shengnan.wang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 louis.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add DeviceTree binding documentation for Dongwoon Anatech DW9768 voice
coil actuator.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 .../bindings/media/i2c/dongwoon,dw9768.yaml        | 60 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
new file mode 100644
index 0000000..8dec22d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9768.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9768 Voice Coil Motor (VCM) Lens Device Tree Bindings
+
+maintainers:
+  - Dongchun Zhu <dongchun.zhu@mediatek.com>
+
+description: |-
+  The Dongwoon DW9768 is a single 10-bit digital-to-analog (DAC) converter
+  with 100 mA output current sink capability. VCM current is controlled with
+  a linear mode driver. The DAC is controlled via a 2-wire (I2C-compatible)
+  serial interface that operates at clock rates up to 1MHz. This chip
+  integrates Advanced Actuator Control (AAC) technology and is intended for
+  driving voice coil lenses in camera modules.
+
+properties:
+  compatible:
+    const: dongwoon,dw9768
+
+  reg:
+    maxItems: 1
+
+  vin-supply:
+    description:
+      Definition of the regulator used as I2C I/O interface power supply.
+
+  vdd-supply:
+    description:
+      Definition of the regulator used as VCM chip power supply.
+
+required:
+  - compatible
+  - reg
+  - vin-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dw9768: camera-lens@c {
+            compatible = "dongwoon,dw9768";
+            reg = <0x0c>;
+
+            vin-supply = <&mt6358_vcamio_reg>;
+            vdd-supply = <&mt6358_vcama2_reg>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db..8d72c41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5151,6 +5151,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
 F:	drivers/media/i2c/dw9714.c
 
+DONGWOON DW9768 LENS VOICE COIL DRIVER
+M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
+
 DONGWOON DW9807 LENS VOICE COIL DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
