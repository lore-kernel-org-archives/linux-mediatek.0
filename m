Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F71BC77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKP39/U4XTctXDVql5W+xKhlwCkWJJYfYnnN56FY6aY=; b=12jdMhjxbD9ZQb
	J5PQUv1YkENv008cFJG30DTyqSON/woMH7kC6DWVVC2QEKM+XxDET7Ab1FFqH/di8OofKYZDuT9nC
	HRTDfmoYa05KJ4Z/msmMOAXQlA8rZXTsCAEu5sQhUHKI4tbKLsift4wj2j88BX2J68Znn3Mvg76iQ
	YGGHKkWCPzI4pWnTlUVrsE+WiEVYr401Tz7bjRKhGvh4oZHW5rEaIf0OEz8X2lhdUDL+GqkgdwJLb
	CAXkX101qd3dDHdnM24I3WWH7VfPnKffU/R1++3UireuQJU+HgLCinK7Ce8zhRZpFiX92Sm6wJ3zk
	3GZRwgC72tq/HXRLEigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXInt-0000000BHOo-36B6;
	Thu, 03 Jul 2025 12:12:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHiP-0000000B5sW-1czV;
	Thu, 03 Jul 2025 11:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751540571;
	bh=idYJiFGibqM6lxG/y187gCKeyxMBI1SWWRI1kD+0Uu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UzlvJQhpmfcuCLEv0Qd8fN0ZG5D95CxPRPyekj6eZnTgU+rUhr/EZZrUCya+K3PKk
	 aClmxwWPGnwFh1jP3ukEJpVCzaonsUO3IZe6B+BteO3HcD0lI9ypr6ti9t676eVqqU
	 q0GX3zuGpc16ypNblJSh0cqh+REHZ5OOSSoO284HONwoQQRjDLWmImPlMupjTxTJI3
	 8Y9ZTU75XYsRaRDgbLL3dcYxIn6W8tuKrdF2hkp5C3rKI8t3j+KxfT+VC7nFKszqAc
	 fcz0YXM8gOR7rriISWRstgGPaSnADJela19pLpP5YBGIQKLx3kRPl1iDrKLw3p7kfS
	 DqbkqmGN6c9zw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C245217E059B;
	Thu,  3 Jul 2025 13:02:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 01/10] dt-bindings: memory: mtk-smi: Document #access-controller-cells
Date: Thu,  3 Jul 2025 13:02:38 +0200
Message-ID: <20250703110247.99927-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703110247.99927-1-angelogioacchino.delregno@collabora.com>
References: <20250703110247.99927-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_040253_570087_E656CC70 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, linux-pm@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some of the SMI Common HW provides access control to at least
the power controller: document the #access-controller-cells
property and allow specifying it only for MT8183 and MT8365
as those are the only known SoCs with an SMI acting as access
controller.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../memory-controllers/mediatek,smi-common.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..74b355a08493 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -74,6 +74,9 @@ properties:
     minItems: 2
     maxItems: 4
 
+  '#access-controller-cells':
+    const: 0
+
   mediatek,smi:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: a phandle to the smi-common node above. Only for sub-common.
@@ -168,6 +171,19 @@ allOf:
             - const: apb
             - const: smi
 
+  - if:  # for SMI providing access control
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8183-smi-common
+            - mediatek,mt8365-smi-common
+    then:
+      properties:
+        '#access-controller-cells': true
+    else:
+      properties:
+        '#access-controller-cells': false
+
 additionalProperties: false
 
 examples:
-- 
2.49.0


