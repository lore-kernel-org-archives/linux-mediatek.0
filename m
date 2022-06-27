Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDE1C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjJWG28h+cA9PMNttxXgSrYSRFSjnBl3+2XWfooEnUo=; b=ty5t0O6+xWSAdUZzMOnrmsXkDU
	cyQiX03E/JxL4EugW70z3k78mZdWxK+ExvOp25K7H92IJr8D++P2xL3KBQseTiHG5hBr0OF0jCC+N
	x3iC/PyrwH2HuI7nr9JMU20OL3bk9FsYKyrSvgafwntejSZ4lsRoASNqZJ392QqDzfOyg2NHCpfNW
	+ntp0jYkSSexCiCOBamZlAf2KVVQSov+OjvlRYSsbzEy4Gd1Y5RrLvtvecKHTr73qQIJm+kuhXl82
	a2lqmLUC+RWnmHVn8G7qacsaDFrYHED0rp01Bi4SRizXqFXMj4ruPl9totAGTL9pSvxPSFEar/tqJ
	wr2wrGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kZq-00H3uN-He; Mon, 27 Jun 2022 08:58:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kY4-00H2lx-5a; Mon, 27 Jun 2022 08:56:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A1D1660182A;
	Mon, 27 Jun 2022 09:56:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656320206;
	bh=RoQA5gkCw09CgkpEIeYkpojdGgYBObH2GQWkGs2+xaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M4zzcmRau2+V/n/EWDPTqcJJZzv6WYUQmakrebglR+GfjQtJolgutJtp6kxGXwb0/
	 YBGTa8dHiRZyvDU4Y19r4zbnhOV/i3JJdwh8Rm8udfXoJY1SNAOP/SCOGeUXGyDmmG
	 rMrQEhIvz/cJ+QzmS/vHngB4+K7setLuX7KdBXX3y+Cn9h/cXhN40rxeke3dUkNblE
	 mlz0fwxgmAhvWZeB9TKQZXvFtRPoGzothVMsMTRWF/nlLt7hvdW6MRgLCp79cHN8hE
	 9fMGcpLkG6Rm6FGx/VjLXTCzbCcsNKZmGZJGsPEu2aVXSXSmd/O/2qtCfFI0wVWBbm
	 6Misa9e6VDdrw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	y.oudjana@protonmail.com,
	angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	ck.hu@mediatek.com,
	fparent@baylibre.com,
	rex-bc.chen@mediatek.com,
	tinghan.shen@mediatek.com,
	chun-jie.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	miles.chen@mediatek.com,
	sam.shih@mediatek.com,
	wenst@chromium.org,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com
Subject: [PATCH v4 4/7] dt-bindings: clock: mediatek: Add clock driver bindings for MT6795
Date: Mon, 27 Jun 2022 10:56:29 +0200
Message-Id: <20220627085632.23797-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
References: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_015648_682744_2A32F0E1 
X-CRM114-Status: GOOD (  12.89  )
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

Add the bindings for the clock drivers of the MediaTek Helio X10
MT6795 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++++
 .../clock/mediatek,mt6795-sys-clock.yaml      | 54 +++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
new file mode 100644
index 000000000000..795fb18721c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/mediatek,mt6795-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Functional Clock Controller for MT6795
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description: |
+  The clock architecture in MediaTek like below
+  PLLs -->
+          dividers -->
+                      muxes
+                           -->
+                              clock gate
+
+  The devices provide clock gate control in different IP blocks.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6795-mfgcfg
+      - mediatek,mt6795-vdecsys
+      - mediatek,mt6795-vencsys
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mfgcfg: clock-controller@13000000 {
+            compatible = "mediatek,mt6795-mfgcfg";
+            reg = <0 0x13000000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+
+        vdecsys: clock-controller@16000000 {
+            compatible = "mediatek,mt6795-vdecsys";
+            reg = <0 0x16000000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+
+        vencsys: clock-controller@18000000 {
+            compatible = "mediatek,mt6795-vencsys";
+            reg = <0 0x18000000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
new file mode 100644
index 000000000000..629e0cc7c916
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek System Clock Controller for MT6795
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The Mediatek system clock controller provides various clocks and system
+  configuration like reset and bus protection on MT6795.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt6795-apmixedsys
+          - mediatek,mt6795-infracfg
+          - mediatek,mt6795-pericfg
+          - mediatek,mt6795-topckgen
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        topckgen: clock-controller@10000000 {
+            compatible = "mediatek,mt6795-topckgen", "syscon";
+            reg = <0 0x10000000 0 0x1000>;
+            #clock-cells = <1>;
+        };
+    };
-- 
2.35.1


