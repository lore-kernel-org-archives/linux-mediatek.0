Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FE8C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 13:39:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8257207E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 13:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B2oWb0OX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D6ZPgGvt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8257207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WccAcsNsxdHu+ICYWKg/xYH6+RdFA4W8/lm/RQ0m1d4=; b=B2oWb0OXAJqdh8
	Kjkg80G9KUzk7SWusjCFT6IlURvOab8jS4RbCO5Et9cA6Wr2mJ99Vt6BsvVcfJjpASzf6vQWTuuA8
	7xFRoWFRsbtmsKcfPHL6D6tU8qWRFchuRmsJyviDFAveo8Cg/YHO31g1aXQpoxN588vfddmllsgkP
	bfh5sajxiv7e/nrutliM9XYDelye3GK426ncaFZAcjpOxzLZh3bHFyoQdvWHyHbqSus5Gk0rStj9C
	vfb6s2Iw2Szv3815m1AxXpCeC6JQWs1Y2VVOkPhKYvuqxTRwd7Wb73LacQJKIZvBktceQ8ULQ+e+T
	MiyujQeXjYwbgYCuHK8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jafz8-0002TG-Fd; Mon, 18 May 2020 13:39:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jafz4-0002RS-3E; Mon, 18 May 2020 13:39:11 +0000
X-UUID: 4efc1af2a2f049d4a0b02427ee223a4d-20200518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=g15FnE7ziSkrJN0su29GRKgyMZyJ0r3PsMCp1097sRU=; 
 b=D6ZPgGvtu0gDmyYZaSBiQ0LHw0vefDmvczo14vrXKBXf5r8MpZJyNh+wGZkow34axBMRFG4PNApKJNu8X59fl6CJg5nar/4cmJ7PTZBiHsIbFv8HKfZEApGc78SkAbG261fepTJibsX5BeXUjo3bC+d1Q31YMJKeCn6y2ycAq9w=;
X-UUID: 4efc1af2a2f049d4a0b02427ee223a4d-20200518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 277159983; Mon, 18 May 2020 05:38:54 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 06:29:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 21:29:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 May 2020 21:29:01 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V6, 1/2] media: dt-bindings: media: i2c: Document DW9768 bindings
Date: Mon, 18 May 2020 21:27:30 +0800
Message-ID: <20200518132731.20855-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_063910_148682_A79978E4 
X-CRM114-Status: UNSURE (   9.15  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/i2c/dongwoon,dw9768.yaml        | 105 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
new file mode 100644
index 0000000..b909e83
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -0,0 +1,105 @@
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
+    enum:
+      # for DW9768 VCM
+      - dongwoon,dw9768
+      # for GT9769 VCM
+      - giantec,gt9769
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
+  dongwoon,aac-mode:
+    description:
+      Indication of AAC mode select.
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+      - enum:
+          - 0    #  Direct (default)
+          - 1    #  AAC2 (operation time# 0.48 x Tvib)
+          - 2    #  AAC3 (operation time# 0.70 x Tvib)
+          - 3    #  AAC4 (operation time# 0.75 x Tvib)
+          - 4    #  Reserved
+          - 5    #  AAC8 (operation time# 1.13 x Tvib)
+          - 6    #  Reserved
+          - 7    #  Reserved
+
+  dongwoon,aac-timing:
+    description:
+      Indication of AAC Timing count, unit of 0.1 milliseconds.
+      Valid values vary from 0 to 63 (default 32).
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  dongwoon,clock-dividing-rate:
+    description:
+      Indication of VCM internal clock dividing rate select, as one multiple
+      factor to calculate VCM ring periodic time Tvib.
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+      - enum:
+          - 0    #  Dividing Rate -  2
+          - 1    #  Dividing Rate -  1 (default)
+          - 2    #  Dividing Rate -  1/2
+          - 3    #  Dividing Rate -  1/4
+          - 4    #  Dividing Rate -  8
+          - 5    #  Dividing Rate -  4
+          - 6    #  Dividing Rate -  Reserved
+          - 7    #  Dividing Rate -  Reserved
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
+
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
+            dongwoon,aac-mode = <2>;
+            dongwoon,aac-timing = <57>;
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
