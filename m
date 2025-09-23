Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792F5CAC5B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFDG+wvs2WG93zhT44NWUOfN2GowDDjPuUl1CMypSmk=; b=a9gNReJCFHBDN2x780WhauyUlk
	XYuQvjrGgCG2gyNqGrVEmYewQs9f+9QGF9jY8oBO8e2N9sA6sdJKJSYKB672KgTaF2G/lO/Er/xno
	o5juP/tCIRuXuBbdnI1yeFubPf554RvC7Gx4NLDtkNIecG3h20/Kz7GBNQpPrg6pFC2Gc69D8e43h
	llrmnqHzYLTxBgZi4EmjRP1rrorkZXfikSRxoadlzhsuTwa7VGtFaSCxRN4k2qrDPEFaFStTeXsL2
	fhDFr5D2Zw2xmBtqCKdUeRlc9V9OHeiaZwRq5nDdFSu/czNoyWS73H5g5BHTEqTtjRHW+OoXQUzcV
	indKdd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11OK-0000000DD9c-1bMl;
	Tue, 23 Sep 2025 11:41:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11OI-0000000DD7s-0zuD;
	Tue, 23 Sep 2025 11:41:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758627648; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KWnyYstbYsqu77K0d6sbxLmGRGRAIaUQsQqMFjBgzeyqmWN2geANGC23t15HjFjgupdKgkZzzb3b/EX5HPQlekzjQGYq7oEprZTpoNW70u2WalKmoa4u1DoNHrzPI67qItMM5zEzDv1s00NyuGvAIZqvPyZM9/L6gl/+2sareHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758627648; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZFDG+wvs2WG93zhT44NWUOfN2GowDDjPuUl1CMypSmk=; 
	b=Lw5xSCfPH3ZqD+AR9NKK1N13JOiGO4QYs5gjfBEF1O4JZUEiXai2QhAmYbObi3VT8z1w/k0aDAngJcbzbs2FZwoOk6HTv5Qd38cyKQNRNXglSBEjypDRb8S1s+LMoLtHrYASPqbp1HlrVVQKSUAiPkpKfvCQMIay0q68bnjuZs0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758627648;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ZFDG+wvs2WG93zhT44NWUOfN2GowDDjPuUl1CMypSmk=;
	b=AD6C5rBCb111C5q6cIOOqoSnnFCKHixwxfdqLbn/jSVTfCqY0Kw4/fMqIrCzW4pP
	ZHO9i+ofc3uI+YR+cOfnveSw6TL47Km5Qul1R+gMxX3UDCPB/hMbOU6LMXTC9+f7i4w
	YffG3l4P7cvp2uEw5PsXV+KlgXqdRLC3x2ca5aBI=
Received: by mx.zohomail.com with SMTPS id 1758627645320914.7659430893929;
	Tue, 23 Sep 2025 04:40:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 23 Sep 2025 13:39:57 +0200
Subject: [PATCH v4 4/8] dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-mt8196-gpufreq-v4-4-6cd63ade73d6@collabora.com>
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
In-Reply-To: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_044102_341284_8388D38F 
X-CRM114-Status: GOOD (  13.32  )
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

The MediaTek MT8196 SoC includes an embedded MCU referred to as "GPUEB",
acting as glue logic to control power and frequency of the Mali GPU.
This MCU runs special-purpose firmware for this use, and the main
application processor communicates with it through a mailbox.

Add a binding that describes this mailbox.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ab5b780cb83a708a3897ca1a440131d97b56c3a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,mt8196-gpueb-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MFlexGraphics GPUEB Mailbox Controller
+
+maintainers:
+  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-gpueb-mbox
+
+  reg:
+    items:
+      - description: mailbox data registers
+      - description: mailbox control registers
+
+  reg-names:
+    items:
+      - const: data
+      - const: ctl
+
+  clocks:
+    items:
+      - description: main clock of the GPUEB MCU
+
+  interrupts:
+    items:
+      - description: fires when a new message is received
+
+  "#mbox-cells":
+    const: 1
+    description:
+      The number of the mailbox channel.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mailbox@4b09fd80 {
+        compatible = "mediatek,mt8196-gpueb-mbox";
+        reg = <0x4b09fd80 0x280>,
+              <0x4b170000 0x7c>;
+        reg-names = "data", "ctl";
+        clocks = <&topckgen CLK_TOP_MFG_EB>;
+        interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
+        #mbox-cells = <1>;
+    };

-- 
2.51.0


