Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A5EC04FFE
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/kcHq9PisAG8/UoRU68zlecBo1etsQ7a/AZ4KXF+k0=; b=T/BTAnYFYhPJNQ4QFXYjpLNm+z
	KwpTBKUSLKBf5nLoNHZjYSdErYtqac2LN3PDjUM4dyCUVRmFZAc85nkYuhSI0TiPdp8FLf1p7jGm8
	HEJ4biR57Zf3gzYZNqIBcUOk6PmZJ5AdzQC5Dvbr26O5smjXM03zdG98MhmJZwCJYupAZbBMzJN+F
	5d4knAe3o+C5N01/hNRRx13FRpNTZuIrYOY0zuh1Zue+u4X5jSmwW6kfULQTHKttPWWZhC4tLsjdp
	+7LowePS41jM7s0G/jkmAif69KPDxvMMuQDH+w0XkR70BlKH5KIf/i/u219+AkAbm0qx/NoaHBgDx
	dcKS0NFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxN8E-00000001QSs-1uqc;
	Thu, 18 Apr 2024 08:28:34 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxN80-00000001QIs-3zvI;
	Thu, 18 Apr 2024 08:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713428898;
	bh=hXAnEQDzLDk7jyZTMyhyJqlEHGWmSpcvS6neyL4VIL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IE2mycunH+YnqIv0tfL07ZqEX1c/SxSdbGZ9kTL4VWEerfZTCJWn7sA6r4JaMxLZK
	 Pgfdf0e4mrkqBP7coCGQBmxgBjt88Vw4GIrHEQhDDr6lDaxFy1mLU4X9WRnT0CSyja
	 nlEA+1R6lh/xNPukx2pAYQBVWaCRMeOJ4RhnM6QcSReGEbNDSgxYLCWP30oN6BxM+R
	 7bLnI1MZXoTYl7DwKfJlBv40ox1QnS8Fp8Wt9z3aO+ThMUMZ7NfqHvG0bIoERNb5CV
	 AZhG8B4qoLul9vxYMcdBJX2DUbafl/h+Wwp9DleIQa5zNKeBEAUMl+Q3RdM5as/wmY
	 eBEzbbUdhjSPA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 019013782117;
	Thu, 18 Apr 2024 08:28:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: djakov@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	keescook@chromium.org,
	gustavoars@kernel.org,
	henryc.chen@mediatek.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	amergnat@baylibre.com
Subject: [PATCH v3 1/7] dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
Date: Thu, 18 Apr 2024 10:28:06 +0200
Message-ID: <20240418082812.152270-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240418082812.152270-1-angelogioacchino.delregno@collabora.com>
References: <20240418082812.152270-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_012821_164856_AACE3B45 
X-CRM114-Status: GOOD (  11.00  )
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

The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
are controlled with votes to the DVFSRC hardware.

This adds support for the regulators found in MT6873, MT8183, MT8192
and MT8195 SoCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek,mt6873-dvfsrc-regulator.yaml     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
new file mode 100644
index 000000000000..704828687970
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DVFSRC-controlled Regulators
+
+description:
+  The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
+  are controlled with votes to the DVFSRC hardware.
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6873-dvfsrc-regulator
+      - mediatek,mt8183-dvfsrc-regulator
+      - mediatek,mt8192-dvfsrc-regulator
+      - mediatek,mt8195-dvfsrc-regulator
+
+  dvfsrc-vcore:
+    description: DVFSRC-controlled SoC Vcore regulator
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  dvfsrc-vscp:
+    description: DVFSRC-controlled System Control Processor regulator
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+anyOf:
+  - required:
+      - dvfsrc-vcore
+  - required:
+      - dvfsrc-vscp
+
+additionalProperties: false
-- 
2.44.0


