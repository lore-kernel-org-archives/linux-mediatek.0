Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE2606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 18:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jn+DGflN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RuOqo+RKreVqcu1zPpVQn0t7Bqx2kGH6ClqRja+E9Hw=; b=Jn+DGflN3u/xrz
	p7CnUbR2J+Z6gEEHL6bPH53qbP+obcAt11+Y2k3Cf4Ni63jDRHuzjma3p/A6ws5n8KWZY09Tsi+Dt
	7bPAfaEfkOL+7lyj9uhlHAqQvIfvBVel43FplZuEU0CCA9tM6yuAsHg4Z8oKkOn1nBQSescrwDx53
	b8YUO7X0tVj01zxPh/UmyZuKlZDo2CL/m1J72xuEu/Kn8Q+rZW30BEWb5bjP6CnawZmz0z15vwA3M
	TbyUfUimJWhxOsHB/9oh+oJzpp8T3StXf96QimSSkBEYRDjWaenWwZ3HdoowebXcfyqtwVqRHfMmM
	C8fYxlV/ROy442kcufiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa0g-0000000AuC8-1UEE;
	Thu, 12 Nov 2026 18:58:58 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa0L-0000000Au3k-1Ff5;
	Thu, 12 Nov 2026 18:58:39 +0000
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRa0B-002Xe4-1j;
	Thu, 12 Nov 2026 19:58:27 +0100
From: John Crispin <john@phrozen.org>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v2 2/3] dt-bindings: i2c: mt7621: add Airoha AN7589
Date: Thu, 12 Nov 2026 19:58:19 +0100
Message-Id: <20261112185820.1315718-3-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112185820.1315718-1-john@phrozen.org>
References: <20261112185820.1315718-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105837_382752_454B3F31 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Airoha AN7589 carries the MT7621 I2C controller with a second
control register holding a wider clock divider. Out of reset the
controller uses the MT7621 divider, so the MT7621 programming works
and mediatek,mt7621-i2c serves as the fallback. Give the AN7589 a
compatible of its own so the driver can use the wider divider.

Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v2:
- Add mediatek,mt7621-i2c as the fallback compatible (Conor).

 .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..ec42e72e267f 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -9,12 +9,20 @@ maintainers:
 
 title: Mediatek MT7621/MT7628 I2C master controller
 
+description:
+  The same controller is used on Airoha SoCs. The AN7589 variant adds a
+  second control register with a wider clock divider.
+
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    oneOf:
+      - const: mediatek,mt7621-i2c
+      - items:
+          - const: airoha,an7589-i2c
+          - const: mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
-- 
2.34.1


