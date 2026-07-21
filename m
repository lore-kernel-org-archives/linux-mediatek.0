Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C509EC44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6dxJxsZMaq5MqMie89+oo8FKDjS39N0DogpVZXrSfQ=; b=dpKma8M0DCznva
	6QNixOd07hw1zV5z8K20O2jEqrMW1HpcevLE1Ixvo3sC/7THuNEqIBjrnSNo98DDwJArzPMKo0Z4t
	aDAKmw28WL1YZtQdvhdV/U6qPE5BM1mhzP/MFFl0JOGLekHCR6bjlfbiCMMfSTdXhajhRMbgyO/i3
	fl7tpLHYZXiadIAuvZdfvJRqqYBTZGNYAXT2+G6f3cbOwmkvSDejICalXsvjKyk9z6QA/LUKC2EM5
	sw5EBT8xMLxY1dqiulaPWZw1pR2GxG2WuXrVEmn6PcDBYgtymovYgOZIC188Ip7+QFJWjDN3u3h6m
	YdPhFc1/AnvIk+5FZZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm85i-00000009G0I-3E4D;
	Tue, 21 Jul 2026 10:52:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm85a-00000009Ftg-3mWM;
	Tue, 21 Jul 2026 10:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784631159;
	bh=Oxlrm51S+dtXKz86xcMf1a/yzkVrTdj9sQMFUYBwn3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arjKwPl9RtXV2l5kbVZjPsLcknBzzQfmLB/7syXdqSwaFx+SivcI2KS+RQEQy3UxY
	 BUE7iAP3C5IjEF0Lfkm7KorUuuuzdymORbZA9rMR1CYxhXKetdw6BdcT03b9hfN0jn
	 FagXGsGwkE568B2E0LiXsdNTf2YYneIJk4+GpbrOZ29i5lz7SFcHgEGbqciXetqt54
	 jsXr9Ne3RlXxjnXRlI2jk5a3FnLOkHXhJDTpk7FEgCFZYOxzq1cj5mihqaJpMSPIzT
	 WAWD8zQXnYyRGb4H2A8l8WrX5QNsDSeAQAKh7X9lL3XUXBdzSBxq8UpAZm3bwYbx2D
	 dR2WA/+Har/Iw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE62017E0564;
	Tue, 21 Jul 2026 12:52:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Subject: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets optional for MT8196
Date: Tue, 21 Jul 2026 12:52:29 +0200
Message-ID: <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_035243_093550_7D5B0C6C 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, kernel@collabora.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, wenst@chromium.org, linux-kernel@vger.kernel.org, jiapeng.chong@linux.alibaba.com, laura.nao@collabora.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, daniel.lezcano@kernel.org, matthias.bgg@gmail.com, rui.zhang@intel.com, bchihi@baylibre.com, krzk+dt@kernel.org, lukasz.luba@arm.com, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Both LVTS-AP and LVTS-MCU may be shared with SoC-internal MCUs
running some sort of firmware that checks thermals in order to
scale frequency, or to take action for critical SoC thermal
protection - and this is seen on most MT8196 boards.

Make resets optional, as doing a HW reset on such boards will
result in either an immediate thermal protect shutdown or in
a rather important and usually permanent system slowdown.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/thermal/mediatek,lvts-thermal.yaml     | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 975235130670..29f431fcdcd5 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -94,12 +94,23 @@ allOf:
         nvmem-cell-names:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - mediatek,mt8196-lvts-ap
+                - mediatek,mt8196-lvts-mcu
+    then:
+      required:
+        - resets
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
-  - resets
   - nvmem-cells
   - nvmem-cell-names
 
-- 
2.55.0


