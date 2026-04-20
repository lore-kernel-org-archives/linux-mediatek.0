Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5643CF588F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/Du74EJttRYzocAt0aYwsBrBN+xYnBNbkIiSv+PCto=; b=1wmeQJFsvzyIBncUCrVqboZFUD
	EZNdgq8n8C7jxZ/Ij0UGjcT8F0MFXHBLEX4EbVUkZfF0vWEkCAT9zKNIIrdai6Crct+X1B6Ho4gsj
	pCJ+nk3KUI5BPFCua8uLEqUfTWkae5sJZFKyIJx/JypuLVdbLy3j4+Q1dp2Ifd9ebMIinGKo+eS79
	nktKJTs+jsdLgJpmsselkNr2TG2K7e/47aD2GF5WX8RitVfr43iZwzpgjpeyjwvhwife/zr1nLVfn
	ZfEOGx7uCmTTqYcj6wvuj/F+r10nKluChHID4DalSE1sUPkOYvfXO4Vj5jwu6cmuejdtXzYDIBm2s
	5qGQwOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEraT-00000007RHh-0So2;
	Mon, 20 Apr 2026 16:35:05 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEraP-00000007RGl-3X3r;
	Mon, 20 Apr 2026 16:35:03 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEraC-000000001Bl-1o7A;
	Mon, 20 Apr 2026 16:34:48 +0000
Date: Mon, 20 Apr 2026 17:34:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: rng: mtk-rng: fix style problems in
 example
Message-ID: <912fe579eccf577f3064b69d6c945e2c9087cab8.1776702734.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_093501_886671_B9AB29F8 
X-CRM114-Status: UNSURE (   9.71  )
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

Use 4 spaces for each level indentation, remove unused label, and add
missing empty line between header include and body.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

 Documentation/devicetree/bindings/rng/mtk-rng.yaml | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
index 7e8dc62e5d3a6..8f2f4c32a0cfc 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -47,9 +47,10 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/mt2701-clk.h>
-    rng: rng@1020f000 {
-            compatible = "mediatek,mt7623-rng";
-            reg = <0x1020f000 0x1000>;
-            clocks = <&infracfg CLK_INFRA_TRNG>;
-            clock-names = "rng";
+
+    rng@1020f000 {
+        compatible = "mediatek,mt7623-rng";
+        reg = <0x1020f000 0x1000>;
+        clocks = <&infracfg CLK_INFRA_TRNG>;
+        clock-names = "rng";
     };
-- 
2.53.0

