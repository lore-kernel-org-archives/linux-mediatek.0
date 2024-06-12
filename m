Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C71C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 06:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTyzVNN0a9wJpEUGdMGGHJDBc5xP4YjsHrSbuQqnrQg=; b=kEnHWC/cpOBRMHAXsUsBrDIl9A
	T4QXqBVn/LM6aoeVjC2BF1qo2vIrfd8szCadVcsLQhRKoleriRMGbfoRBuHc0jPC0Xe74L1k6gMye
	Js/rZqGfAmWZdpWdgpbTHoaIOpwMcd3zMcbTngkO/5i/U4Pjm1u1HcyQsU8kD+XEgAN7mjyC4kPDi
	yCfHoMNeoB8SSw57l/KSFy5r140U+7GoEsO2eq/J9YLNunpaWCTSEJ2rnQL7+ReNyoKDizx7LHFnJ
	1QsbcIZVQ8fpY0OLSGkbxC8HhMW3G7KvyZp5mypzuw4KajnRxUrYPxUNJyePu6EyL0A8O280O+Edt
	XTH7qvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHHuZ-0000000BKAX-18Nm;
	Wed, 12 Jun 2024 06:56:47 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHHuU-0000000BK7u-3rAT;
	Wed, 12 Jun 2024 06:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718175401;
	bh=Uin4HL8p/uMYwcu6R0/lMaoEXvWDsF3aIDdkjKb66fE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AY/7nGx7wkK2jYJ0mJYD5A6YkIRK1G5F71gwaDQOpqhIXr/b7e3fth+FWRGwGd+le
	 B2LFG0p0Dftz/ISo4PoQIQoMOnVS6qM5s0g422UqFrUpprXY2ZEDPBUIUhyRAISBqT
	 S6cx3rX05CcQXN+shH432aTfRkGXhQ74Rku8tiCSKVPVKc9kqvpdNDq++sX0gtc/HL
	 AWK0M9+42szMMVedJs0NPCd4ZtVSAzIj8hIhkHY/QN09XiRZtmiYaSJEi02WOiCrT8
	 YVKwcn2Hui7LYNsoPEu4oW0qEAzsqCySIyIB6y0QnHRIqPwDry0D2DveWMC4Rrpwn6
	 MEV4y3rcM4pHg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B452378219A;
	Wed, 12 Jun 2024 06:56:40 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	shawn.sung@mediatek.com,
	yu-chang.lee@mediatek.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com,
	sui.jinfeng@linux.dev,
	michael@walle.cc,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v7 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
Date: Wed, 12 Jun 2024 08:56:33 +0200
Message-ID: <20240612065634.26569-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612065634.26569-1-angelogioacchino.delregno@collabora.com>
References: <20240612065634.26569-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_235643_093242_24C8C9C3 
X-CRM114-Status: GOOD (  10.83  )
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

Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
per HW instance (so potentially up to six displays for multi-vdo SoCs).

The MMSYS or VDOSYS is always the first component in the DDP pipeline,
so it only supports an output port with multiple endpoints - where each
endpoint defines the starting point for one of the (currently three)
possible hardware paths.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index b3c6888c1457..3f4262e93c78 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -93,6 +93,34 @@ properties:
   '#reset-cells':
     const: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port node. This port connects the MMSYS/VDOSYS output to
+      the first component of one display pipeline, for example one of
+      the available OVL or RDMA blocks.
+      Some MediaTek SoCs support multiple display outputs per MMSYS.
+    properties:
+      endpoint@0:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the primary display pipeline
+
+      endpoint@1:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the secondary display pipeline
+
+      endpoint@2:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+        description: Output to the tertiary display pipeline
+
+    anyOf:
+      - required:
+          - endpoint@0
+      - required:
+          - endpoint@1
+      - required:
+          - endpoint@2
+
 required:
   - compatible
   - reg
-- 
2.45.2


