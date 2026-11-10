Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6846606A959
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xf0qE7mD;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XcisTUGC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vvyshln4Nk2oCzJJycPahgRiRb/8nxOl+ecx6GfDDis=; b=Xf0qE7mDNdaNdS
	DpJW5ruLPw9y+Mqe9pibsAoaXHPVrHztSR2mRds/eWI65R8tinGrCedb9SkOnUxuNpLFz0cZitrAP
	vzTqx/A6lGF0yTmUse++MTXpDbdY8TkIOJxdQWo2f9yPW+lACsM3rWb1ijP9OqYZcj0+D7J2iKu+j
	2S5bPZD0bJUC9wj82bVFH6P1+i0XecehH6FJgBz3D1FMW90gTbhNLN1/y3d52t6NqUXYxTy3vhTd4
	HXTozWil+443JQfm+QJllmwmv2bmc9Lx+Tqw4B28fq9aIrsXgxWujYiMsge+V6SUfstaP4+kps01C
	bw5zMKKBkTz8udpcYbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkf1-00000003ku8-0p2e;
	Tue, 10 Nov 2026 12:09:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkeu-00000003kjC-12w6;
	Tue, 10 Nov 2026 12:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794312542;
	bh=9K9sXXoGwZDaQhqpoKp0M6uimXR3twUbTzzWH0p9FYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XcisTUGCiwZfvbySX3RbHtgOBA2e6Q5tl140a990TYroy+GW9BBZbgvo1AorRG7SU
	 AZVsIsynfz/VSWpu48oi52R495bArvJb43D/+PmGgE51lfoOPMRwCJrBCEwnx8h4O6
	 2R+2Be+8g7kO3UXKQpI8CZ5MCKrcEfERF9x9PpiwRZ3jmt4n0JcgMdQxW3phYoEB7p
	 liZ5BJdc369vhK+wnKIf+NLy74Og0BHVOSsDSv7Bo1IttJ1EDTXnWZpPSc9w3jwIpr
	 4hogTd+vyLZuk6XAe1c5fIVmc+vEFCPYvqr0Zru9GX8mJMdbRD0UxkKV6BBwyOhzBR
	 fiGObikkvRMXQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C8E917E0ABE;
	Tue, 10 Nov 2026 13:09:01 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 10 Nov 2026 13:08:50 +0100
Subject: [PATCH net-next v5 03/10] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dwmac-mediatek-mt8189-v5-3-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794312537; l=3310;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=9K9sXXoGwZDaQhqpoKp0M6uimXR3twUbTzzWH0p9FYE=;
 b=4N1c6BCRS++s2LzcxVgCISdnD4Bq72bHumH9b7OBWiQ0y12VLXebgXXa9nYo86hBdutJ9Jbs7
 8mUESiREWbrBerdrQf8mN4i2XGT/BkPuUQfwd87NsptjRY7IAwEPBmP
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040904_468654_52E33B7F 
X-CRM114-Status: GOOD (  13.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add new compatible string and clock definitions for the Ethernet MAC
IP found in MT8189 SoC.

Regarding the required clocks, the MT8189 datasheets list in the
paragraph related to this IP clocks the mac main and ptp reference
clocks as the ones to turn on.

No specific peripheral clock for Ethernet MAC is described in the SoC
clock list.  But at the same time, the Ethernet MAC block diagram,
present in the datasheets, shows this IP is interconnected to the rest
of SoC with AXI and APB interfaces (and in MT8188 datasheet too).
There is no APB related clock, that is specific to the IP in MT8189,
contrary to MT8188 or MT8195 that have one. But since it is on an APB
bus (likely shared between multiple IPs), then there is a bus clock for
peripheral access. Describing the IP having it makes sense, same thing
for AXI too, so the clock lists for this compatible are reflecting
that.

Also, don't allow mediatek,rmii-clk-from-mac property for MT8189
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/net/mediatek-dwmac.yaml    | 42 +++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 956240616638..0fc2eed06646 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -20,13 +20,11 @@ select:
         enum:
           - mediatek,mt2712-gmac
           - mediatek,mt8188-gmac
+          - mediatek,mt8189-gmac
           - mediatek,mt8195-gmac
   required:
     - compatible
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -36,6 +34,7 @@ properties:
           - const: snps,dwmac-4.20a
       - items:
           - enum:
+              - mediatek,mt8189-gmac
               - mediatek,mt8195-gmac
           - const: snps,dwmac-5.10a
       - items:
@@ -45,7 +44,7 @@ properties:
           - const: snps,dwmac-5.10a
 
   clocks:
-    minItems: 5
+    minItems: 4
     items:
       - description: AXI clock
       - description: APB clock
@@ -55,7 +54,7 @@ properties:
       - description: MAC clock gate
 
   clock-names:
-    minItems: 5
+    minItems: 4
     items:
       - const: axi
       - const: apb
@@ -153,6 +152,39 @@ required:
   - phy-mode
   - mediatek,pericfg
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2712-gmac
+              - mediatek,mt8188-gmac
+              - mediatek,mt8195-gmac
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8189-gmac
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+
+        mediatek,rmii-clk-from-mac: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.56.0


