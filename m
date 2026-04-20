Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFD5F5A8C6
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NFxnKBIb4rP9HCGv24zgq2DmExS0pP68iWUHvrzRj3k=; b=clPdvHvv3Kh+kFSSNsi2PCNy0t
	m6YJ5GgT9d45uGZRRCyl6dNFKgT/ibQ6+rTX5Q0MMl8A5IcYsatYXjuCrvsog9tqGiGsCjYO8CvIr
	zwzWhx3hIWaBJq+ot+nx+ewVaIbGcrUTyo2lh145eB+S0BczZPxj5I8esjusXsC+J8z4D4lAnrgrc
	sJQc+FfzFci/6gCeYDwBTkB6E4IElJx85KWmXnZthkuYHgi3QbzRMJtMM0eHJZAJQs3YvXO+JMbEt
	IfqjTJOi5FXCXA3zYFvh86fBdfp4yz3fDniGkoFOQlhtiLEThDIvgQKzWiu6g+o2w0acHwpV2JjEg
	f4YbUiBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvUw-00000007dts-18ai;
	Mon, 20 Apr 2026 20:45:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvUu-00000007dsl-1E9Y
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 20:45:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488ba840146so33334865e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 13:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776717934; x=1777322734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFxnKBIb4rP9HCGv24zgq2DmExS0pP68iWUHvrzRj3k=;
        b=D6KBscg0TPl7AywJz5OWmv8ZShTf7c1fZuDQMVo4EVU3hBbeELYJeFloaSqxjURj8H
         oEGZ4xmXmfYz3a1WHI8DAXgHI5RrLkDNQmoZoB5s4S+i0F1vX2x3HC1C39e7T0Qu9QNu
         k85IZmOvGaW1ARhCC0OdTNDy5dCpTGpkD+PB0Os0FkC+H5TsoMnUBjCWm0SE+Hf2/Dvq
         0TmHSkaOAlVs6uqEo0r7cUb1ya7+/jFBzfrNylL44Uv3SJXkOXX7tXPDqn1aE38SBeZm
         Ag701jmuGHeSjNa3CRaceAht7fdRQDTlPSUaJsLDe5sAxhoDuUsQE7m3pkdUbDtkSDvg
         rV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717934; x=1777322734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFxnKBIb4rP9HCGv24zgq2DmExS0pP68iWUHvrzRj3k=;
        b=CkPKtdf0C8iZ8tL7Q6KQQ60wGrfBeJWfmAR1047Fj7YaxwQx6MGoWty/THkKb+d1Nx
         Vn8d4yG32/R0I680U5YgRh/ci0AscySX/YJtpn/qlRGC7kMexxF5/K3Lxnor62smbFhY
         5fJEiDcieyW53DELZRGHZyq3aPpozMP3i3owdSnmIL5yJ6kBLmknJUk3qfkcp1eYNqUZ
         MO70Qb/GwnXSiKmxpHBY7V66Lq/w2ZMNwelgYKEx6zFzZya4drq59ocl38o6qkMg27ih
         TrPxHu7VMBrS6CkIB/XODYOws+F458MVhoZ9U1MPyDIHZnKrd7PWq2c1dURnnDDMUsgd
         dDYA==
X-Forwarded-Encrypted: i=1; AFNElJ+h0+dd6ZE+nRFNYWcBssIGjxJBiUbefoQI/65gjP+0h2kxs1yt/ywFSrSZt0HcdrR2dbMeI0le+0JfwdZC5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk3+AZ5n4Mli64m98RL/TpKGTeGMEZWIF5TUan8GlsIkvg5l0d
	zhzui7sOZnaQbD0AaW9ne+YGsbSd7zfMPG2kcbItvnJkq5sQZ9u0cw8a
X-Gm-Gg: AeBDieuILtsEcBI2Tt0hkYTkFtnwk3RDb/oRiT7w5VMnaDkrZiATdlaC257cGLZLIh+
	jOg4Mx+gxZgNeYsbY0zrOaW5mhGIqDMv3itqIMT/qQV0cAcT5dIisM1XUxdFe08/4O5KUk4dBwa
	iSdiTDUvg0JOBm3J31b8oSjlJSvyXQ8CPAqGmr2XzYh/Gg6JyqeS9ET9TqRCO8VJxUzHVkLM6WG
	/IKHrYP4WDg9fMcd/Fua5QrMdSAT7JjsBzSAF8+s7rTP+Sen61OyiTwh4GkEa6eZkc5R0GfihEO
	ou4HtHWHuXX9AoknstbiCCLdDFu+0eT54iYwG50dViKpeBfvo44w5FkbDHKsyk3og0mA5Ypb8xt
	CGIDwd9vyD7B2t0jxQtHQzbUfPGwbcSFMyH8r6jFKK8PD5ZRJPb3lE2zvOD7qZH/qJ9T78w59+h
	K0Uygs6ahJHTSv0iRcRAIo431ncZ2OVQ==
X-Received: by 2002:a05:600c:8115:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-488fb77d7d3mr176918155e9.21.1776717933714;
        Mon, 20 Apr 2026 13:45:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c320084sm170344535e9.2.2026.04.20.13.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:45:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to DT Schema
Date: Mon, 20 Apr 2026 21:44:30 +0100
Message-ID: <20260420204514.1640995-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_134536_367018_B8A41C48 
X-CRM114-Status: GOOD (  13.61  )
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

Convert the mtk-btcvsd-snd.txt DT binding to DT Schema format.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 54 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 ---------
 2 files changed, 54 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..f423e3a02997
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC Driver
+
+properties:
+  compatible:
+    const: mediatek,mtk-btcvsd-snd
+
+  reg:
+    items:
+      - description: Register location and size of PKV
+      - description: Register location and size of SRAM_BANK2
+
+  interrupts:
+    items:
+      - description: BT-SCO interrupt
+
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the infracfg controller
+
+  mediatek,offset:
+    description: Array of register offsets and masks
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: infra_misc_offset
+      - description: infra_conn_bt_cvsd_mask
+      - description: cvsd_mcu_read_offset
+      - description: cvsd_mcu_write_offset
+      - description: cvsd_packet_indicator_offset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mediatek,infracfg
+  - mediatek,offset
+
+additionalProperties: false
+
+examples:
+  - |
+    mtk-btcvsd-snd@18000000 {
+      compatible = "mediatek,mtk-btcvsd-snd";
+      reg = <0 0x18000000 0 0x1000>,
+            <0 0x18080000 0 0x8000>;
+      interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
+      mediatek,infracfg = <&infrasys>;
+      mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt b/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
deleted file mode 100644
index 679e44839b48..000000000000
--- a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Mediatek ALSA BT SCO CVSD/MSBC Driver
-
-Required properties:
-- compatible = "mediatek,mtk-btcvsd-snd";
-- reg: register location and size of PKV and SRAM_BANK2
-- interrupts: should contain BTSCO interrupt
-- mediatek,infracfg: the phandles of INFRASYS
-- mediatek,offset: Array contains of register offset and mask
-    infra_misc_offset,
-    infra_conn_bt_cvsd_mask,
-    cvsd_mcu_read_offset,
-    cvsd_mcu_write_offset,
-    cvsd_packet_indicator_offset
-
-Example:
-
-	mtk-btcvsd-snd@18000000 {
-		compatible = "mediatek,mtk-btcvsd-snd";
-		reg=<0 0x18000000 0 0x1000>,
-		    <0 0x18080000 0 0x8000>;
-		interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
-		mediatek,infracfg = <&infrasys>;
-		mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
-	};
-- 
2.43.0


