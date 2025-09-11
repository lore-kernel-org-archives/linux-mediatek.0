Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE49CAC58E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwI6O/WXblkdUdWGMzGXua++ChKTIy0ESW8V5yK5Bqk=; b=nsMWVeywBPVG5jiOubz/gtgiFN
	iwG+AcryFcjBn0Ku4QbTtEHCuk9ZLrXoCDHvXNO4q49WpU1vXhtRU9bWaQSncDCpQh15NuioQUgBd
	y96XQwTBB5nt6cOLOEw/BfJIw1fEH2AVt44Dzoh1D4/9HJs+RBuh0L3HA25HyLUU+8Cmx4nwUF0uw
	y/bgl0KdrvUXeRRLmX6GqKF2oyBB7JHTtUi7c4ADKILxQjSSvQyX9I7HqomVEglQxQcRGAy8tPafH
	Z9rWgsi8P5mGtqp4vi2WGItuO7HGVOeCmaS1H7TrZvRcjtqX+Lz9pSkTbYdmaoVTzifpLzILKhu+Q
	OINp1ExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwizk-00000003nkN-0VY0;
	Thu, 11 Sep 2025 15:13:56 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwizh-00000003nih-2wy1;
	Thu, 11 Sep 2025 15:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757603594; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mdjWt7nyj74cmTLvZxHNf5quigxZTGjyWQhEsOqsfpO9IsuIwPN2R6B5cirWvOmO3tBLa6xTqasTmqyFW22WMak9buE72qISzjWi1iYxqyx18PNkaemon3IexGnUJR18Oh9etb+BEU7sIup1ptL7Bcy7KDA7j4USwYFGSqhzsxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603594; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xwI6O/WXblkdUdWGMzGXua++ChKTIy0ESW8V5yK5Bqk=; 
	b=J0VqKd2uVLWWBDszY9jpswJyd5zmMVYGKV81bg9ebHU8ZN7h3B0MORQlmhIqIIoNlAZWX3v3gC9lSG37LOT5iolpYDOwGQGeIhXbdoHfyBMNguHJrwO+2Ki4lLLNrE4pNlc/FnZP7x/GwWxeyVhuTQfXEHwzhH2vhD/npmYO1Fk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603594;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xwI6O/WXblkdUdWGMzGXua++ChKTIy0ESW8V5yK5Bqk=;
	b=NGpDJR9NDHHbAFM/MyRFPmjj32pMYRAfY4WXhLdwfOsOLdOD2BSLRdPDKFx1WFBU
	6bF3PicbVnvt19tqkHcbBo2hweLnnw2zUi1lERYsIgasBKepXViMRFWpH0ciIQ5QUhc
	QEP4kGltcyZaeQa709EUvTQRqx/fSyTOTVV5wFvo=
Received: by mx.zohomail.com with SMTPS id 1757603593542824.0268357438556;
	Thu, 11 Sep 2025 08:13:13 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 04/12] dt-bindings: ASoC: Convert MediaTek RT5650 codecs bindings to DT schema
Date: Thu, 11 Sep 2025 12:09:53 -0300
Message-ID: <20250911151001.108744-5-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_081353_796524_01D6B14D 
X-CRM114-Status: GOOD (  13.71  )
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

Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
codecs to a DT schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650.txt          | 31 --------
 2 files changed, 73 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
new file mode 100644
index 0000000000000..a3166cc40a206
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 codecs and HDMI via I2S
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-rt5650
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The phandles of rt5650 codecs and of the HDMI encoder node.
+    minItems: 2
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of MT8173 ASoC platform.
+
+  mediatek,mclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The MCLK source.
+      0: external oscillator, MCLK = 12.288M
+      1: internal source from mt8173, MCLK = sampling rate * 256
+
+  codec-capture:
+    description: Subnode of rt5650 codec capture.
+    type: object
+
+    properties:
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8173-rt5650";
+        mediatek,audio-codec = <&rt5650 &hdmi0>;
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_i2s2>;
+
+        mediatek,mclk = <1>;
+        codec-capture {
+            sound-dai = <&rt5650 1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
deleted file mode 100644
index 29dce2ac8773a..0000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-MT8173 with RT5650 CODECS and HDMI via I2S
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650"
-- mediatek,audio-codec: the phandles of rt5650 codecs
-                        and of the hdmi encoder node
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Optional subnodes:
-- codec-capture : the subnode of rt5650 codec capture
-Required codec-capture subnode properties:
-- sound-dai: audio codec dai name on capture path
-  <&rt5650 0> : Default setting. Connect rt5650 I2S1 for capture. (dai_name = rt5645-aif1)
-  <&rt5650 1> : Connect rt5650 I2S2 for capture. (dai_name = rt5645-aif2)
-
-- mediatek,mclk: the MCLK source
-  0 : external oscillator, MCLK = 12.288M
-  1 : internal source from mt8173, MCLK = sampling rate*256
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650";
-		mediatek,audio-codec = <&rt5650 &hdmi0>;
-		mediatek,platform = <&afe>;
-		mediatek,mclk = <0>;
-		codec-capture {
-			sound-dai = <&rt5650 1>;
-		};
-	};
-
-- 
2.50.1


