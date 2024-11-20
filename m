Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA86CD63935
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2024 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKZge4RRu+GgoebIHrD6wyvJ9WVOA5KrGkA3uhdpGnk=; b=PoxI5KY2VbDvvwPTS3riiX08Yy
	4ctbeko3RA+yowiXU54Y7a2oPyUrU4H2MpnlxyE0bXMWTDu8iFpr8KXhylsvSQ0eb7sYQl03gwTPn
	CpHof3bHNQtrCeoOT2dPWDU15kG32xDtkwimzNSlUzQnpcIq47wDYU8173KE916U1aKKUTr9B2Km0
	nNI0wWDv82ZoXAnM8Vd4R4jtbfri8425V6wPDMZ4u40Of8oOhNs0bjYYn9D9EQZgIx+hKHYd3k6JU
	hA7piRGqDqrqRJRpbyZpexLZkEtF0xtp58BldWzZ1/pLyLadW4cDaphbvueM9+W63jIneZ6xn9X4h
	3DKz3ZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkCq-0000000FLh7-40c4;
	Wed, 20 Nov 2024 12:53:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk5I-0000000FK5A-2tk0;
	Wed, 20 Nov 2024 12:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732106727;
	bh=UyJFg0KvktCszyds8d+I13c8+erp0r61a3XVIvkerjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AR7BdQV6AP9JY6YRfGI7IZL3eXmVVfbvQANOtdWchno5bGd98hQH8H0Wic2mxWVj6
	 pjvXisJd7N1LCouosLyZsCVh+54HyZmW0lDEZe5pEtJYDB4yq4GI3WHJimmQxEfUIY
	 L65UNtsvtXRUUWCEruu5upb+QCKUeYq42hrLJTMGg664BwS6TB+1wM6rGKgi7E+eTA
	 jOZZmDFK+GqpXpPkcpg8Knnnl80zsgobJTyWrxEKOd38VaNLEKWFRo+wurd8uwK5IZ
	 Bm7r6Nm9QRj6fSlrz2ig0YvEZqXMH0iFID+56CDnTkZy6B5kyfOMmb+lTVJ3kJxFP6
	 Do69uLYBTEEVA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60DEB17E3663;
	Wed, 20 Nov 2024 13:45:26 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/7] dt-bindings: display: mediatek: Add binding for HDMIv2 DDC
Date: Wed, 20 Nov 2024 13:45:06 +0100
Message-ID: <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_044528_877461_8D0C1617 
X-CRM114-Status: GOOD (  11.54  )
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

Add a binding for the Display Data Channel (DDC) IP in MediaTek
SoCs with version 2 HDMI TX IP.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 000000000000..d85e8ed2ffa7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek HDMI Display Data Channel (DDC) v2
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - CK Hu <ck.hu@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt8195-hdmi-ddc
+      - items:
+          - const: mediatek,mt8188-hdmi-ddc
+          - const: mediatek,mt8195-hdmi-ddc
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi {
+        hdmi_ddc: i2c {
+            compatible = "mediatek,mt8195-hdmi-ddc";
+            clocks = <&clk26m>;
+        };
+    };
+...
-- 
2.47.0


