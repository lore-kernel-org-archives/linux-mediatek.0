From: Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v6 1/8] dt-bindings: display: panel: Add BOE tv101wum-n16 panel bindings
Date: Wed, 18 Sep 2019 20:24:15 +0800
Message-ID: <20190918122422.17339-2-jitao.shi@mediatek.com>
References: <20190918122422.17339-1-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918122422.17339-1-jitao.shi@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: srv_heupstream@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, cawa.cheng@mediatek.com, bibby.hsieh@mediatek.com, linux-mediatek@lists.infradead.org, ck.hu@mediatek.com, stonea168@163.com, Jitao Shi <jitao.shi@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Add documentation for boe tv101wum-n16 panel.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/boe,tv101wum-nl6.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
new file mode 100644
index 000000000000..31d394054181
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TV101WUM-Nl6 DSI Display Panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+  - Rob Herring <robh+dt@kernel.org>
+ 
+properties:
+  compatible:
+        const: boe,tv101wum-nl6
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  pp1800-supply:
+    description: core voltage supply
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  backlight:
+    description: phandle of the backlight device attached to the panel
+
+required:
+ - compatible
+ - reg
+ - enable-gpios
+ - pp1800-supply
+ - avdd-supply
+ - avee-supply
+ - backlight
+
+additionalProperties: false
+
+examples:
+  - |
+    &dsi {
+        panel@0 {
+            compatible = "boe,tv101wum-nl6";
+            reg = <0>;
+            enable-gpios = <&pio 45 0>;
+            avdd-supply = <&ppvarn_lcd>;
+            avee-supply = <&ppvarp_lcd>;
+            pp1800-supply = <&pp1800_lcd>;
+            backlight = <&backlight_lcd0>;
+            status = "okay";
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
\ No newline at end of file
-- 
2.21.0
