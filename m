Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C503CF6C0B
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvXbwaun67dFijynLbfzsk3OixqgZon8ckP4jqJdfA8=; b=1PMn1Vyt3ZWMGMEywS2Q8EbEE7
	EIuFDO75M5doOnjznaw7LeUawgeDcoZkq4+L8UQu8bKXN+t3n5EiPrJA2UKMc9lEvX2QLEMxlQ9aJ
	9q756l6iQn17qQhxKz9q5jaDxXj/HfCscnAb0R2zgB5dv38SDbiqTmnI/XTbQPLddtxLR2BNwF566
	t69EYfQdRshd6Ec/BAelZpV4bQzIUmcrW48IjY2tCHksB2ABygXGWY4OLeqQyKe1usz7H5//htg0y
	/eMn98lHgZAOtrAfse0tXQ6DNR3WftEm72QmYqKJUJi5zoJ5S+biCBAmirS35rAd5+CHWS/2FLhee
	8u+kyoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOvW-0000000EPg1-1Wsz;
	Wed, 07 Jan 2026 08:29:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOvU-0000000EPdg-0vkn;
	Wed, 07 Jan 2026 08:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF4AA42AF2;
	Wed,  7 Jan 2026 08:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3DFC4CEF7;
	Wed,  7 Jan 2026 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767774594;
	bh=n+LKP/wqSqSKvHYOmUR2ubNx5hlSjKfruKRqomCUXjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QoP9HRdQ9CHAVwXWQA8q6+TPNmmOoxhwGHkeD542cJc5aI8abziiVHfUpFOsekw0i
	 zDANXDZkQ1XAkXgDzZqMtcL1zmlRfKWZIMJIYJ3wnYYeaOS5bCngWlEMRs3Sg3loWM
	 J6HiNptjY8m1r68dRcozDN1JtOn20zUnX/kk8xpCm9k2ojUeAAaRKWZngMNAtVNHDk
	 o9fvkFB64LalALfoleC+/xohpNR1g+JWau37dbTRx3nlCOkJMgpM4wTHcb7/59u+48
	 MxLm931iI3wlvMgIL3bFNJs6aynle027n7SEBzASV0gh9/uXihhwOt6rPyaq0gz9qu
	 +spqJfXZa/orw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 07 Jan 2026 09:29:34 +0100
Subject: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add BA
 memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-airoha-ba-memory-region-v2-1-d8195fc66731@kernel.org>
References: <20260107-airoha-ba-memory-region-v2-0-d8195fc66731@kernel.org>
In-Reply-To: <20260107-airoha-ba-memory-region-v2-0-d8195fc66731@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_002956_293119_3AFC72D3 
X-CRM114-Status: UNSURE (   7.83  )
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

Introduce Block Ack memory region used by NPU MT7996 (Eagle) offloading.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-npu.yaml   | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..42bc0f2a42a91236c858241ca76aa0b0ddac8d54 100644
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
@@ -57,6 +56,7 @@ properties:
       - const: pkt
       - const: tx-pkt
       - const: tx-bufid
+      - const: ba
 
 required:
   - compatible
@@ -93,7 +93,7 @@ examples:
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


