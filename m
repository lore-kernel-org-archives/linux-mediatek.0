Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405E7D1D46D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EwXZJMksVIzhINWOp3QfJncpePrsSVbE9EKBoAo2B8=; b=rMP7gd7QtG+XilvOXzSwpli3fj
	msR6LDxPjIvrxGNr2EROoOlEX6/uGLBoTS+AgKSPqWCVM0x8q3szLLGg8oz/4e1R3ns/HFo9Gy1xU
	txPfhKRzQ6QwcmhFz7yoTvXXaPaB+CTUZmWYru6LUje5nv3uIL/aw2sD1yZKxkLqjzeqLFIdT9nhK
	RIYDQlQ3h2h6+CLPUb2GkuxZe6Bp+7hJJZaWJLyxN2VdtykYNW8VlodojpF6XbehueYsvxZ3w2gd1
	8pp5oq2NVefAuAQ0Qhm6xyIqeXQFNY09ZKjRjgrA2psw65j9SYCBf5Ma8U4oRYaOQzfBSRN43lDbZ
	AXr9acOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdra0-0000000HS5R-2fJE;
	Thu, 08 Jan 2026 15:05:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrZz-0000000HS42-14rX;
	Thu, 08 Jan 2026 15:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD18F60130;
	Thu,  8 Jan 2026 15:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107E7C116C6;
	Thu,  8 Jan 2026 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767884738;
	bh=DGdHkFD+3L5QgZmRMdpdwL9Bm9MC+Wi93ePEIeYNCWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g2JcxrpUi7AaJtDoYHHgWuhyywj4wX46R1n4CFdMSn60n61tfDxML2xWNe/uaqIy+
	 v+5TC+FJT4WMbPcOITX9hjemBnAWhXcZuGGxnNmGpz6Dg93FHdJKmYE9agm8E94Ybo
	 /whcHcWTofRl2drZLs8KOYE0LtAHCduYAiEr90PApPeLu9DuajqEfQQHaIpZxZTEwO
	 rsajtsZRLsEwmQHnaUrcIr8C23LKt+GjXSD0ueoyf527rbUnvOkv1EWQc/DHWe2LAp
	 pHXHVUH/mVJQKFn6ytYom72q1F6PYT8KoTwACa+thpLXKyT5gNkLvE4U83noI84Y5a
	 eg1qDLGB6p7aQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 08 Jan 2026 16:05:07 +0100
Subject: [PATCH net-next v3 1/2] dt-bindings: net: airoha: npu: Add BA
 memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-airoha-ba-memory-region-v3-1-bf1814e5dcc4@kernel.org>
References: <20260108-airoha-ba-memory-region-v3-0-bf1814e5dcc4@kernel.org>
In-Reply-To: <20260108-airoha-ba-memory-region-v3-0-bf1814e5dcc4@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Introduce Block Ack memory region used by NPU MT7996 (Eagle) offloading.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-npu.yaml  | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..19860b41286fd42f2a5ed15d5dc75ee0eb00a639 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -42,14 +42,13 @@ properties:
       - description: wlan irq line5
 
   memory-region:
-    oneOf:
-      - items:
-          - description: NPU firmware binary region
-      - items:
-          - description: NPU firmware binary region
-          - description: NPU wlan offload RX buffers region
-          - description: NPU wlan offload TX buffers region
-          - description: NPU wlan offload TX packet identifiers region
+    items:
+      - description: NPU firmware binary region
+      - description: NPU wlan offload RX buffers region
+      - description: NPU wlan offload TX buffers region
+      - description: NPU wlan offload TX packet identifiers region
+      - description: NPU wlan Block Ack buffers region
+    minItems: 1
 
   memory-region-names:
     items:
@@ -57,6 +56,8 @@ properties:
       - const: pkt
       - const: tx-pkt
       - const: tx-bufid
+      - const: ba
+    minItems: 1
 
 required:
   - compatible
@@ -93,7 +94,7 @@ examples:
                      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
         memory-region = <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
-                        <&npu_txbufid>;
-        memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid";
+                        <&npu_txbufid>, <&npu_ba>;
+        memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid", "ba";
       };
     };

-- 
2.52.0


