Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B3EFA3728
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pRXKKDZvWwJE0OYBlGbJ1CNY/8nw7dOoKs0YtDMUS1E=; b=RAdbv81+FYVRynAxHfTGpqZt8g
	aFjHIOauATuiUfGE0PElyOHIgOVzhXpfoo+yyE1ZpZzrYOcSJ6P6CLQB9CuxBT+YtioMa7UEkM6vJ
	gAjJQ5C1hf3TS6MA51I3Zx/BAirgo69/3Q5rifeYo5OloB8xpKoR4UIGh76kZdXN9ESbpgZY1W0gU
	CS4QsSBjL5jZe9H9iIbg0A685enca5ymP6L/NpClmjiEOPINFLJYhQCFiUHjnjPqKuGW1WiPE2zcc
	8W5h4vbKunamYs0pEo+M6IETXIuJUztsvVhuM7CKwB3ir++MpH4XnOcpv9wPi6ISyo8p1rp7uY5oy
	T4CX77Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhTP-00000008SQt-2Ib3;
	Fri, 02 Jan 2026 15:53:55 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhTK-00000008SO0-0gO8
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 15:53:53 +0000
Received: (wp-smtpd smtp.wp.pl 27487 invoked from network); 2 Jan 2026 16:53:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767369222; bh=pRXKKDZvWwJE0OYBlGbJ1CNY/8nw7dOoKs0YtDMUS1E=;
          h=From:To:Cc:Subject;
          b=wsnC3jaCLgQp/yVY5DchfJcu6eLbbhhuaB0l20xYlHBuuYH61frnWYuQZQV5ElqZq
           FOAVPof4sWOtNrK/oUsgfGusJb6XX1EBj4HQ4qhSevIGN9WmPrHTP+bOc6s9RWsFw4
           PBDuGRGhrusKNkfawrjlLbCJZ0/pGyvBMXIrYO01xXVjhoCHCpo1GfIjc4AKTh+esn
           jWIo10vHmF0hyOcZiKWUnwuDy2BRevOs4T6RVVcpNoAVXGOsILqKV8dWQ9FfAHCOxF
           aSdJj00AN5qhaNkLyem0LcgmAG6siuSH2x+IjDT2jKU74ViI25PDA1QEIQMAE67Yww
           qPlBC9AHLjwCg==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <benjamin.larsson@genexis.eu>; 2 Jan 2026 16:53:42 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: benjamin.larsson@genexis.eu,
	chester.a.unal@arinc9.com,
	davem@davemloft.net,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	conor+dt@kernel.org,
	herbert@gondor.apana.org.au,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	sergio.paracuellos@gmail.com,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v3 1/3] dt-bindings: crypto: eip93: add clock gate and reset line
Date: Fri,  2 Jan 2026 16:47:33 +0100
Message-ID: <20260102155341.3682013-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: df5d0ea41a222bf13e7a762f03b71f91
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000007 [8RRh]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_075350_681503_AC5F12D4 
X-CRM114-Status: UNSURE (   7.09  )
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

Add the clock gate and reset line, both of which are available
on the Airoha AN7581.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v3:
- introduce patch
---
 .../crypto/inside-secure,safexcel-eip93.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..c6c99c08dc68 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -48,20 +48,34 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
+  - clocks
+  - resets
 
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/en7523-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
 
     crypto@1e004000 {
       compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
       reg = <0x1fb70000 0x1000>;
 
+      clocks = <&scuclk EN7523_CLK_CRYPTO>;
+
       interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+
+      resets = <&scuclk EN7581_CRYPTO_RST>;
     };
-- 
2.47.3


