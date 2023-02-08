Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678DEC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzjBF2E75w1L7hmKJRlyRtNS2bCPZJqCosU6lkNkeOE=; b=pkFrZUeAmu6cCV7PHXUW08WU3d
	0MZ/cMscddgT3hFeV/MbO93DAO9fgJWBmmi/cM3Df5dUYu5TrKlebTy/hqpOD1nkXuzUidJrFViUv
	2dotYdKf20vGVmrTG6kLjpfNoiT2koP9rXbYLNwDDMgINnAuGOWCzGwHzuTte1a5Izp6lqj8zHF0o
	Taan+nd9/mqmduLrV6V1/NHtJUsz9eOl5JHYtVfI+1ZIX7mgwhdyftoYJ8yQexDFDWUvdCPmzeNR6
	Ac5qWlovn7QiPi9CHm8THJN2prt9eJsJyAub7F95FERQqNZ5TeKVAJ7UE9kZZASNu07CcawQabULo
	kGuRvOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhqD-00FE6v-R0; Wed, 08 Feb 2023 10:38:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhpR-00FDbq-Ce; Wed, 08 Feb 2023 10:37:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 619EE6602096;
	Wed,  8 Feb 2023 10:37:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675852647;
	bh=c4XKOxPhUZU76+HjvxTFR5jXrHZr0pBaargwTPOI/Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2o9AxfFJM6QmX5gwpY5DMnWxdAumOp5mbUr7Q7fvp4LtZcJo7ZeSLuv3mLd+C4s+
	 EhMyG5FTLJ0P/FzFbX4poNJLZ+aY9NKBZMrJOHw75Q7x8XCivHX5+i80gyBugOvUCo
	 q1TfBGxcCMw7gD1XY0KVA8cMaPloi4d/EbUrZt6Bh3f+ggW1Bc9fsbug+FUAKJ+gCB
	 ygg8qpkprBgyPpuNvYgm4G1uoc6IdlR8QM6iPieOjQNsI7bGHCenL8FzdfKbEtcyph
	 lvwJ6MJthlfGqmtCrwpJraxp/g2qqQytxAD8GYFwj5KwMCyJQocKzv1kehB9ReTsrf
	 AP5SAdEdzR9oA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/9] dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
Date: Wed,  8 Feb 2023 11:37:02 +0100
Message-Id: <20230208103709.116896-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_023729_613113_61FF4C27 
X-CRM114-Status: UNSURE (   9.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek MT8192 (and similar) needs five power domains for the
Mali GPU and no sram-supply: change the binding to allow so.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 69212f3b1328..e7aba66ddb8f 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -61,7 +61,7 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   resets:
     minItems: 1
@@ -141,6 +141,18 @@ allOf:
         - power-domains
         - resets
         - reset-names
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt8183-mali
+                - mediatek,mt8192-mali
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
   - if:
       properties:
         compatible:
@@ -161,10 +173,26 @@ allOf:
         - sram-supply
         - power-domains
         - power-domain-names
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-mali
+    then:
       properties:
         power-domains:
-          maxItems: 1
+          minItems: 5
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+            - const: core3
+            - const: core4
+
+      required:
+        - power-domains
+        - power-domain-names
   - if:
       properties:
         compatible:
-- 
2.39.1


