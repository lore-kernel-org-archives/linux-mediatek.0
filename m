Return-Path: <SRS0=Fjxk=5P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75F3C2D0ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 12:46:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C3CC206F6
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 12:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zm3FZ0K5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FoFQfCFX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C3CC206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DRb1XTWs4n9H7HLNmzevlHI0mIs3sc1CRPhF69aEmQ=; b=Zm3FZ0K52NTkCl
	wBle7ETKS3Ohv8YhLBao0WnI1xc0faxAC7i8zvZpqj/gV+wNsa8/clSmmyEfM5hRxVkL7zQP2vNA7
	Kw3HOZyOxB0kAy8aah9orQ0YoJtcagWPNVYTnnlYdsAB94d9R11pJnb5icGet8/cCiyPaN/VFlRwT
	jIZtFVhdKxiXMJnR2/Kp9rAPvlEHc4RkNjpjEx/7qH/o/I1QoDtcedn/4CHslivw2Ae/V6sQdqTuD
	SeIY+XN1A4xRwfSFFRSJ44EEpTranjTQmwR4ANooL+6asdjOqyg4c2ko1hNhFrGkmig4iTmuqF1EA
	CVpEhPto/WC6ym7aTNdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jItoS-0001Xl-Kn; Mon, 30 Mar 2020 12:46:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jItoO-0001WP-Sx; Mon, 30 Mar 2020 12:46:42 +0000
X-UUID: b35fe6af75e14a1a9187e741f8ec6aa7-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vKZ2EjPZ/y2qtamzYyVm0qfJ+kD0edNKbJeAfcXDOkc=; 
 b=FoFQfCFX0Hk9vbVF3R5KgSroaT9HK9c7B0vUUpJXUZc5dRmRI4ulost6hQeXUughmH7lR8r9VOOa/XUuUZgUAlbxrdhDjniKwDOtNLaKtj2LiYxCx83mGxfqky6OE1atCBuu2vo6xm81MMU068sI6UdQcnDI4NtUAYI+Pemxz18=;
X-UUID: b35fe6af75e14a1a9187e741f8ec6aa7-20200330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1045664949; Mon, 30 Mar 2020 04:46:41 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 05:36:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 20:36:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Mar 2020 20:36:27 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V4, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS entry
Date: Mon, 30 Mar 2020 20:36:33 +0800
Message-ID: <20200330123634.363-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200330123634.363-1-dongchun.zhu@mediatek.com>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D4B238AFE7EE4988C1108ED15035833D549164685550A449E551F0E1740931472000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_054640_950516_51893D6E 
X-CRM114-Status: GOOD (  10.85  )
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

This patch is to add the Devicetreee binding documentation and
MAINTAINERS entry for dw9768 actuator.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 .../bindings/media/i2c/dongwoon,dw9768.yaml        | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
new file mode 100644
index 0000000..8a353dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9768.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9768 Voice Coil Motor (VCM) Device Tree Bindings
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
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Definition of the regulator used as VCM chip power supply.
+    maxItems: 1
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
+    i2c2: i2c@11009000 {
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
index 38fe2f3..5e124d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5134,6 +5134,13 @@ S:	Maintained
 F:	drivers/media/i2c/dw9714.c
 F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
 
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
