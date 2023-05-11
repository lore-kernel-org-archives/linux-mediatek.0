Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEC0C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSedURZCH4O9rUDcwf0+7htNhZ8IPJW3gu96SwEEe38=; b=WsfGgnypPqYD81E9lKF5HDLgc8
	0+6cFWlwM4sj5H0fsp2ktoVDUUgZ2TSbCD5wOpv5rwr8gobBTLrLg2s7LJVXZ9A/B+sSXoEx4YO/7
	qUakEDyCaDxSj8vWCO7TQu67yjp+FOsqPbepyMAJfo8K3VgqEHlHmGcEN3I6JUyit8njB9OVIcSN9
	6RQd6fgFS99ZpmbwshXpUvAdEbfYVAaN0S1VuhhoC411E3pMDdQem2qOyzvGTrdtk6PSbR4nJaqve
	HL7KfZGkHuaku1UCYQCYe5oEkAdZaSeQS0JD1/GU6XlU7XkOifl9Sa4oWMaFXCLISPmryanyKxM2d
	3bi4YFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px71n-008zjG-25;
	Thu, 11 May 2023 14:12:19 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px71h-008zfb-36;
	Thu, 11 May 2023 14:12:18 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1px71g-0000mM-2M;
	Thu, 11 May 2023 14:12:12 +0000
Date: Thu, 11 May 2023 16:10:20 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Simon Horman <simon.horman@corigine.com>
Subject: [PATCH net-next v4 1/2] dt-bindings: arm: mediatek: add
 mediatek,boottrap binding
Message-ID: <f2d447d8b836cf9584762465a784185e8fcf651f.1683813687.git.daniel@makrotopia.org>
References: <cover.1683813687.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683813687.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_071214_008631_0076735B 
X-CRM114-Status: GOOD (  13.18  )
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

The boottrap is used to read implementation details from the SoC, such
as the polarity of LED pins. Add bindings for it as we are going to use
it for the LEDs connected to MediaTek built-in 1GE PHYs.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../arm/mediatek/mediatek,boottrap.yaml       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.yaml
new file mode 100644
index 000000000000..460e375320a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,boottrap.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,boottrap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek boottrap
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+description:
+  The boottrap found in some MediaTek SoCs is used to read SoC implementation
+  details such as LED polarities.
+
+properties:
+  $nodename:
+    const: boottrap
+
+  compatible:
+    const: mediatek,boottrap
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    boottrap: boottrap@1001f6f0 {
+      compatible = "mediatek,boottrap";
+      reg = <0 0x1001f6f0 0 0x20>;
+    };
-- 
2.40.0


