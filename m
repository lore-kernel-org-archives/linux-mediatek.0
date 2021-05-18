Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EEFC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:22:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D6D60E09
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D6D60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjGmL0Ia2+AParz5TywnohGMkdZbqMU/g+GIiQ7YfSY=; b=AF7pbqUvUh0hnQxk0eNANSZKRZ
	g8guudjA1vuvBVi59rZTtsXpw9Yb4cQghbNmhvi4WOFHh6bTK1ASC9OsOBOaa6F+wB7uGWcVZWAQu
	vl5dFu7XeJZpyeLQ0jSdV43nPmZeIq/9rAqQ9grDAB+bHhAltvtcqI1xrM9BO6SjZYEFrZjjrGQvk
	pGEqxDzoKQ8aY0Iet3BSxRJ5AaDLoi1A+v/WnMjDsjfVU8UB59jexp2d/k0WAFrcoOxHSLO9CM5IQ
	GJ8rlJ5poHgOpA2q5htCDDJg7Itzkt7Eszhd0c1ZGocWnAyq1xYbWrMTtFRZZSzayFiXQIq9SUT35
	P6hSxTDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj0bR-0010VG-GV; Tue, 18 May 2021 14:21:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0ZY-000zsb-13
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 14:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zhZtq+kdkuCOXRKwIIg+qLWoZP1fwM8AaZ2Tu/ZhWdQ=; b=VRDEAeW8p3ssQWG8k+D7xKQRT9
 EuMipfFsHfeoClGs34gG4u20tIoHRZm3ztwy2fy/cvT3AEb1u9T3m2Jp1C7mWmMrQ/Pt5JAGyu/Pa
 xngV/Fl4MFFiaOdUcbG2d9ItESUqW9IuXKR2uqY0N/NT7cpXfdpWDtKEf04xlLoctqTu8oiBoKiVZ
 /xuQo456KuMgWaGrhSvo/IJ539c64Kr+gN6SrC+uSBhwWp0j+vQie4sSUyG66bDuVMUteC1vq7VeK
 njadoqNxI29nmwAKJ6RGEd7TjkWwfTzazaCSiVdaw+NgRrdRt4wmFpqmeJFR+HaPcXgMC1dsVLMyB
 yQT3beQw==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj0ZU-00Eiks-C8
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 14:19:46 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:8085:99d1:d3e8:47cc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 72A291F42B08;
 Tue, 18 May 2021 15:19:40 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: megous@megous.com, linux-usb@vger.kernel.org, a.hajda@samsung.com,
 narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie,
 daniel@ffwll.ch, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 enric.balletbo@collabora.com, drinkcat@chromium.org, hsinyi@chromium.org,
 kernel@collabora.com, dafna3@gmail.com, dafna.hirschfeld@collabora.com,
 robh+dt@kernel.org
Subject: [PATCH v6 RESEND 1/2] dt-bindings: display: add google,
 cros-ec-anx7688.yaml
Date: Tue, 18 May 2021 16:19:26 +0200
Message-Id: <20210518141927.24795-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518141927.24795-1-dafna.hirschfeld@collabora.com>
References: <20210518141927.24795-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_071944_583131_52F3AF69 
X-CRM114-Status: GOOD (  13.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
which is connected to and operated by the ChromeOS Embedded Controller
(See google,cros-ec.yaml). It is accessed using I2C tunneling through
the EC and therefore its node should be a child of an EC I2C tunnel node
(See google,cros-ec-i2c-tunnel.yaml).

ChromOS EC ANX7688 is found on Acer Chromebook R13 (elm)

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bridge/google,cros-ec-anx7688.yaml        | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
new file mode 100644
index 000000000000..9f7cc6b757cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/google,cros-ec-anx7688.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS EC ANX7688 HDMI to DP Converter through Type-C Port
+
+maintainers:
+  - Nicolas Boichat <drinkcat@chromium.org>
+  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
+
+description: |
+  ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
+  DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
+  which is connected to and operated by the ChromeOS Embedded Controller
+  (See google,cros-ec.yaml). It is accessed using I2C tunneling through
+  the EC and therefore its node should be a child of an EC I2C tunnel node
+  (See google,cros-ec-i2c-tunnel.yaml).
+
+properties:
+  compatible:
+    const: google,cros-ec-anx7688
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for HDMI input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: USB Type-c connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c_tunnel_b: i2c-tunnel1 {
+        compatible = "google,cros-ec-i2c-tunnel";
+        google,remote-bus = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        anx7688: anx7688@2c {
+            compatible = "google,cros-ec-anx7688";
+            reg = <0x2c>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    anx7688_in: endpoint {
+                        remote-endpoint = <&hdmi0_out>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    anx7688_out: endpoint {
+                        remote-endpoint = <&typec_connector>;
+                    };
+                };
+            };
+        };
+    };
+
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
