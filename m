Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39382C3ABC0
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 18:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cl4vY9wWRhP9MQQ22uXEf+JbsC4WKOVLQ0Ge41ErRtY=; b=IpsyMa3Nb4PVkblCvA63Zm2xC+
	fzzHrNK5OljNCAd+hOkeU9QeJF4MlXizn3KoryfSzfg88nYEyNPRFnaudaD+wi7soz0swZOQnQe/O
	MDJp2crvL37kOrSgePiP8U1aBfVgF1nFgE8t5a86b/aAKoGtXPH5CjfIMpt2OflgQ2nr4YUvcSmrV
	jh52sO07L2tIV/QmBximU4AZJ83GLgjLJ+wMp6t7nQ8J844LCWpmIkE7/EjKcFkKio6tniRHzudFL
	vuAuoYo+3r1y5y5ZfyZprAB5OoVcJucHEdgyDxJLj10C0ht3XcKjF5pNakc05O+fjTw24/i9/K2Et
	uAuZZQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCj5T-0000000GQ5t-0nmq;
	Wed, 07 May 2025 18:01:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCitI-0000000GOTk-0z9O;
	Wed, 07 May 2025 17:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87D0349C8D;
	Wed,  7 May 2025 17:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1685DC4CEE2;
	Wed,  7 May 2025 17:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640147;
	bh=uR0aozr2O/tJXppiXBBx5w2+BaypfkdKR5QW5BGZkGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CxNfAM85W5HvgSZnqjlmTl1LycieW3MBV4Y4866cnVPIN6mLCgmHBq/BkADebZRRr
	 2xQuh/AkK6YyVIo0gCXrSV16iuix174HJTEjERlzaym/Aj4caFmdWmgXqlFu+AYiHo
	 ctjQzPy/93C3RoYOR7eDI2tck8LUSUvMooTkWp96Lh/qQP9ALjVGHsReyi7JP4umO5
	 hoX4zMhcDa3l8LRpZ9XB7IjUYqCbFJTJ9G5KZVDoqwXhlwBJNlvxq5Ax2s4Mh9jq7U
	 k1LCFhmgArDckWOY8FdYKHFCcMEBAvyg8utyyHEU5q5vQ4t6AUE8sZjWVvydZ9oBK6
	 HgFi1INKIGlZg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 07 May 2025 19:48:45 +0200
Subject: [PATCH net-next 1/2] dt-bindings: net: airoha: Add EN7581
 memory-region property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-airopha-desc-sram-v1-1-d42037431bfa@kernel.org>
References: <20250507-airopha-desc-sram-v1-0-d42037431bfa@kernel.org>
In-Reply-To: <20250507-airopha-desc-sram-v1-0-d42037431bfa@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_104908_303600_696D5D36 
X-CRM114-Status: UNSURE (   8.93  )
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

Introduce the memory-region and memory-region-names properties for the
ethernet node available on EN7581 SoC. In order to improve performances,
EN7581 SoC supports allocating buffers for hw forwarding queues in SRAM
instead of DRAM if available on the system.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-eth.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index 0fdd1126541774acacc783d98e4c089b2d2b85e2..6d22131ac2f9e28390b9e785ce33e8d983eafd0f 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
@@ -57,6 +57,16 @@ properties:
       - const: hsi-mac
       - const: xfp-mac
 
+  memory-region:
+    items:
+      - description: QDMA0 buffer memory
+      - description: QDMA1 buffer memory
+
+  memory-region-names:
+    items:
+      - const: qdma0-buf
+      - const: qdma1-buf
+
   "#address-cells":
     const: 1
 
@@ -140,6 +150,9 @@ examples:
                      <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 
+        memory-region = <&qdma0_buf>, <&qdma1_buf>;
+        memory-region-names = "qdma0-buf", "qdma1-buf";
+
         airoha,npu = <&npu>;
 
         #address-cells = <1>;

-- 
2.49.0


