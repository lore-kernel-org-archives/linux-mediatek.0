Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC1EF94CA8
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 19:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5JuMO3gPYBlWwt5KKJVpxhIif6wlAgLOW24UJuKGpw=; b=iemQA1nopjXU//EaSRc/eAQe1M
	tTA1q9lOot+1Cu8EQoSYD2L0cDTohDn2csrVgaiVKIVIkd/eElvv1bSZBsDAtjKnf1U0EUu+gRwY7
	MltNdUUCEHXblvrHLxJE3YDlYehrsdMtHC9U6ylOXYKQjzIIbl1Pd4e0PwwzN/TlquzsgIuniX7g/
	DPdXvTWTFF4XMU4WLhUhqS50tU4ZVsj3a7uSWoZnnK39zB7kiqC5rlVBUWN0vZZSRBaBLjgEwYe0k
	VkMVOgPdOJAea21NAaxslKVqur4Vf4hp8Y1R6VwG7wRqtJxZ9Abrz5zuvUPG3HmnumzRx+PQL4Voa
	34GNA7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFGwH-000000095Sh-0nOR;
	Tue, 21 Apr 2026 19:39:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFGwE-000000095Rz-1jqe
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 19:39:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43d70b3e159so2306655f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2026 12:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776800352; x=1777405152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5JuMO3gPYBlWwt5KKJVpxhIif6wlAgLOW24UJuKGpw=;
        b=VR/eVQ2O19l66itAMSRBnA/3nXruOWXxB6xF0GHsVFmkW6/4gM8rqSZyl8J/0l9Tam
         FmpdI6oUihvX2XuoTQGlm2gICPYc2JLp30qKpRPoAEkd2ywE8249/8nhFr7FEBnDhvWt
         eiqWCbjljoCJ1MAI9cvpRh+M+ev/UV2ZfM9+07oRssg4yEgFH+pvabCgePmJMb7StZ5O
         WCiLtqGoY2wCFtYQJDZcD/zS+yhKP/9GhOwhs3e7KfBUtsY6DOtyfy4pFSHgqw7BDUyn
         F0ItbY0EFw4D1C0lfgNA9ZVE/aCTDmc9o495JDFTn3WrRdMG8avoUo5J6CwSvGC/N+5o
         e2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776800352; x=1777405152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5JuMO3gPYBlWwt5KKJVpxhIif6wlAgLOW24UJuKGpw=;
        b=s9qzc70lMoE+YXqofelOSi2QgJSdTsFNqJZDIFQU5sLBvXMW1udhf+OEGpzJOm3Qci
         /EBOKmbY6I2YrFyeGTwdVdvqpgctxlQP6zBNZN6UMRTFkPQTVZmWS5pfx4UT86ow8HjY
         vohpd5aaHwVxYzju0SPLfposs3s3KFoYi44wZ0JD/aMiNzqlDRcKu/DI8DAHgIHtgL24
         msXfjRaOolBy2Ar0/5ew/9KqotoluDycLlyJyx6gs1H8xEI0RyJ7O9zsiEDm5OeXJBTE
         kEFFXB+5F+nW833m21hQfehjdHisBpT9yWMr9IBzXRATJJHOUAvkltzYYX8X2SNTjtRU
         mHYA==
X-Forwarded-Encrypted: i=1; AFNElJ/w5EiJ4ZFw6mVclV0NCMeNJeaNXo9cNwamYReXiCKqGrXJfMVdgftRm5tFP8D3L79Pr6QnwX4wwB0A/kyHQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNrmxLG12P5srmKW9hF9bQaRq/N/1nNW0TvZW526YZthROpMQA
	es53jwY9gyXVWGU8gJHLsVumRJXrGN0eRa9jMF40WOdXMxeA5yNz2RRk
X-Gm-Gg: AeBDies2IBeyI50/M3JOFWKqdb8Gr4wgfSV0YR8EDNEHrp6d7mRCOmni0jql7LHFztd
	li6IV9fdcALvZzlaDEpyE4EqRVB/yO3swcNRKssP8RrH2Zx2nAAawvSVZ9mWrH10JRVqyc77wGA
	JLXYxERQ4nzsfAZPjRsLVwA1bb59tai1AA3KEJc6s01V+EQwPPC4EiT+PJTj+VTyAIpCmKdggLb
	JmMQBm9Ct/ewcgukpfyETDg9ojERSJrmo0Ox+z3IK5uiu6AxkPREjBgVpfyIR7EG1NE6gnJ4cpy
	UICXHU9l0ofMghw7UeHBnU6Xv3Sqi6oBHVZQFg8RJZX6BItS0efeRzTQKI4uo296wxSOtJWQ4ty
	kPYGdbzRkn2WClY05MoHASLTLw9FBIGBHTInzM2EZd41f9Eu9rcN13oS3Ze1Ok40nb98Ulwa444
	eRApN3RhLmqC7N9YaEamxTfVKAoRs7OE9R9BJRFkFe
X-Received: by 2002:a05:6000:2dc8:b0:43d:6fce:3ef with SMTP id ffacd0b85a97d-43fe3dd2b9cmr29894868f8f.21.1776800352013;
        Tue, 21 Apr 2026 12:39:12 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4411c9f4f03sm10443782f8f.1.2026.04.21.12.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 12:39:11 -0700 (PDT)
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
Subject: [PATCH v3] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to DT Schema
Date: Tue, 21 Apr 2026 20:38:35 +0100
Message-ID: <20260421193858.347258-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_123914_504874_0FAC57F7 
X-CRM114-Status: GOOD (  14.36  )
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
Changes in v3:
Sorry about the spam. A second round of dt_binding_check + dtbs_check
led me to additional improvements:

- Use reg-names in place of a non-informative description property
- Simplify the reg property in the example

Changes in v2 [2]:
- Fixed issues from make dt_binding_check
- Set myself as maintainer for the binding

Initial version [1].

[1] https://lore.kernel.org/20260420204514.1640995-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/20260421154619.227039-1-l.scorcia@gmail.com/

 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 66 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 -------
 2 files changed, 66 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..22ba7d0bdac6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC Driver
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+properties:
+  compatible:
+    const: mediatek,mtk-btcvsd-snd
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pkv
+      - const: sram-bank2
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
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Array of register offsets and masks
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
+  - reg-names
+  - interrupts
+  - mediatek,infracfg
+  - mediatek,offset
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mtk-btcvsd-snd@18000000 {
+      compatible = "mediatek,mtk-btcvsd-snd";
+      reg = <0x18000000 0x1000>,
+            <0x18080000 0x8000>;
+      reg-names = "pkv", "sram-bank2";
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


