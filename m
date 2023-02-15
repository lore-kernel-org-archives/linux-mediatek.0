Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2067CC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSMPkWyjIoGOy2ttBCZV00bjpKccjsu3EX/wfKuDA/g=; b=cPNeAQA5V4NwfxEEEVHziQB4VT
	RWF1caz7WaK5uAc027wSMy06ME45pWKoRSWSAGT5BUTeW7i+vHhPpCjpSfdVF9/wxoNMqvWfAgSMN
	monUkdcpwn6a6tTCm/9u0tnCiXScnW3eECr4NCXmoBxJZhFt5fKv1XwMtFRcsBgkgPwgpxhDV6CR7
	XRIDObeDLMh24+Wyr4VMlHMFoVkzhjtez0H1fn79iLNctHpn4mv/ZvlLhR+6oeJroiTpoI7J4DDmt
	RhbdFxtVVJlLyMpP69nEMVPbcqE+bStEpIMS/nHqUe5eT+ahN/2h3Fkh+dHIlvq3ygroKu8llAiLp
	mKg9GmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHqr-005zz4-FI; Wed, 15 Feb 2023 13:29:37 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHqi-005zv6-Gu; Wed, 15 Feb 2023 13:29:29 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pSHqN-0005qp-0A;
	Wed, 15 Feb 2023 14:29:07 +0100
Date: Wed, 15 Feb 2023 13:27:30 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mingming Su <Mingming.Su@mediatek.com>,
	linux-crypto@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: rng: Add MediaTek MT7981 TRNG
Message-ID: <c750e786ad0f529d2ae63c8f766d3c294808ff53.1676467500.git.daniel@makrotopia.org>
References: <89865515728cb937b6591160ad9c30b4bcc8dd41.1676467500.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89865515728cb937b6591160ad9c30b4bcc8dd41.1676467500.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_052928_575727_CAF32B07 
X-CRM114-Status: GOOD (  15.12  )
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

Add documentation to describe the MediaTek true random number generator
which is provided by ARM TrustedFirmware-A of the MT7981.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../bindings/rng/mediatek,mt7981-rng.yaml     | 39 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml b/Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml
new file mode 100644
index 000000000000..d577d60538d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/mediatek,mt7981-rng.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rng/mediatek,mt7981-rng.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Random number generator (v2/SMC)
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+properties:
+  $nodename:
+    pattern: "^rng$"
+
+  compatible:
+    enum:
+      - mediatek,mt7981-rng
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: rng
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    rng {
+      compatible = "mediatek,mt7981-rng";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 90d82aba6d73..523f1abf00d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13148,6 +13148,7 @@ F:	drivers/leds/leds-mt6323.c
 MEDIATEK RANDOM NUMBER GENERATOR SUPPORT
 M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/rng/mediatek,*
 F:	drivers/char/hw_random/mtk-rng-v2.c
 F:	drivers/char/hw_random/mtk-rng.c
 
-- 
2.39.1


