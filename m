Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F655C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 07:21:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F30220753
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 07:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTBgvTrn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IVtYDc3k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F30220753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSNSfYLZzJ8rQ+unK2AGZa/YSLyMIeybNe1PJfH+mQc=; b=dTBgvTrnEhv0I5
	lvYUEjCKDYYTd1gGz9YmVfiv4OcPovatqo4LFTTUK38Bb8Wu4QHaXYUmyNiKARbdNW9HLfRBAxi6W
	clGTkdYsHfJ6Z76MlYarbxbNB/6TuIKYprnqiVRAN8IMpFu5g1BUhg66mL7t0ODO+bhsL+/+1f5l/
	l0xoC0bPRKSpfe71Gm23y1WuDKw1xMMzvS2zq2jgzsD6wnq/fYXE/etTIeGru5DNGZONymQK7ABBI
	kyylQppp0h066WkStskgbrrmQd0gPG5XnZbsLLHNi0sDrDLo81iQW9GhdtutA4WWNQh9IJhNC5Qma
	ZEasBjD0qj3Fdfnjd/pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMnyB-00078V-Bi; Fri, 10 Apr 2020 07:20:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMnxn-0006go-KF; Fri, 10 Apr 2020 07:20:33 +0000
X-UUID: 1694f905be944b5ab5a27f54b5364077-20200409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kSc1VSUFMhS93AZxKPxNBlcYGw6yPmLBY8gUjRDuIcg=; 
 b=IVtYDc3kg9Cp0KsptcASnXMZhuUYgq5sb0cXEcccQ777kllcmwauRdtPmcS9rflxDzJ0YriHQzW7MOlKPmNc5Ig6IwFftgFdu35jC/Z3qA55Eo6Qoy//n4YAI2wzelA56cDy6tJDBSU2rxXqaPqk5ZCfH8fsspctpWtlyOuNbew=;
X-UUID: 1694f905be944b5ab5a27f54b5364077-20200409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1181888470; Thu, 09 Apr 2020 23:20:22 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 00:17:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:17:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Apr 2020 15:17:30 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>
Subject: [RFC PATCH V6 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Date: Fri, 10 Apr 2020 15:17:22 +0800
Message-ID: <20200410071723.19720-3-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200410071723.19720-1-louis.kuo@mediatek.com>
References: <20200410071723.19720-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_002031_694627_4539B217 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 louis.kuo@mediatek.com, christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds the DT binding documentation for the sensor interface
module in Mediatek SoCs.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 .../bindings/media/mediatek-seninf.yaml       | 219 ++++++++++++++++++
 1 file changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
new file mode 100644
index 000000000000..c9e5776a2bd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
@@ -0,0 +1,219 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek-seninf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek seninf MIPI-CSI2 host driver
+
+maintainers:
+  - Louis Kuo <louis.kuo@mediatek.com>
+
+description: |
+  Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support
+  a widely adopted, simple, high-speed protocol primarily intended for
+  point-to-point image and video transmission between cameras and host devices.
+
+properties:
+  compatible:
+    const: mediatek,mt8183-seninf
+
+  reg:
+    minItems: 2
+    items:
+      - description: The Seninf main register region
+      - description: The RX register region
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: base
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Seninf camsys clock
+      - description: Seninf top mux clock
+
+  clock-names:
+    items:
+      - const: clk_cam_seninf
+      - const: clk_top_mux_seninf
+
+  # See ./video-interfaces.txt for details
+  ports:
+    type: object
+    additionalProperties: false
+
+    properties: 
+      port@0:
+        type: object
+        description: connection point for sensor at port 0
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 0
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              remote-endpoint: true
+
+      port@1:
+        type: object
+        description: connection point for sensor at port 1
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 1
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              remote-endpoint: true
+
+      port@4:
+        type: object
+        description: connection point for camsys
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 4
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+    required:
+      - port@0
+      - port@1
+      - port@4
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8183-power.h>
+
+    parent0: parent@0 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        seninf: seninf@1a040000 {
+            compatible = "mediatek,mt8183-seninf";
+            reg = <0 0x1a040000 0 0x8000>,
+                  <0 0x11c80000 0 0x6000>;
+            reg-names = "base", "rx";
+            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+            clocks = <&camsys CLK_CAM_SENINF>,
+                <&topckgen CLK_TOP_MUX_SENINF>;
+            clock-names = "clk_cam_seninf", "clk_top_mux_seninf";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mipi_in_bcam: endpoint {
+                        data-lanes = <0 1 3 4>;
+                        remote-endpoint = <&bcam_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mipi_in_fcam: endpoint {
+                        data-lanes = <1>;
+                        remote-endpoint = <&fcam_out>;
+                    };
+                };
+
+                port@4 {
+                    reg = <4>;
+
+                    seninf_camisp_endpoint: endpoint {
+                        remote-endpoint = <&camisp_endpoint>;
+                    };
+                };
+            };
+        };
+
+        i2c2: i2c@11009000 {
+            clock-frequency = <400000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            wcam: camera@36 {
+                compatible = "ovti,ov5695";
+                reg = <0x36>;
+
+                port {
+                    bcam_out: endpoint {
+                        remote-endpoint = <&mipi_in_bcam>;
+                        data-lanes = <0 1 3 4>;
+                    };
+                };
+            };
+        };
+
+        i2c4: i2c@11008000 {
+            clock-frequency = <400000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            
+            ucam: camera@3c {
+                compatible = "ovti,ov2685";
+                reg = <0x3c>;
+
+                port {
+                    fcam_out: endpoint {
+                        remote-endpoint = <&mipi_in_fcam>;
+                        data-lanes = <1>;
+                    };
+                };
+            };
+        };
+    };
\ No newline at end of file
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
