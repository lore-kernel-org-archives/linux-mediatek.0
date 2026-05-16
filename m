Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F9ACD4851
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2026 05:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDq1lxd40SQnlNGEG24mxnUaosIe+aC2Wxmmk0QT9sc=; b=ySb5yDTSsOdYt0NC2OEFHQU14T
	BVGWqyT0FMBcCvvo7r2TGhKbgd9BExNhb8Bg9I3rnJ1a/bj48BWmxdB45jlyV9TSNmKyM/QV9+spq
	h13BOoc5m0ByDDHbFaDJiMuT65iG3V6iZJkH4OZe66vS6xOiRpAPMX5L4mpnYLg4adQOJjq640JSu
	NZizxYCte4tnnKqCsDmeidoC0goZzzTWw2oEIhrWkT3IWtfLibaDtS2y8qe5RsMgu0k13F3tlvPe3
	vbzSdPbTomfMztFoH/ps9jmwUZDuXClwtdk2aPwNfSn78Zr4CgqDbxeE74iQx5tSJBqwOVwug2oAU
	BJxvcwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO81o-0000000ADNo-0lyI;
	Sat, 16 May 2026 05:57:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO81j-0000000ADL1-1hB7;
	Sat, 16 May 2026 05:57:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 214E843619;
	Sat, 16 May 2026 05:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FF6C19425;
	Sat, 16 May 2026 05:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778911051;
	bh=wt/iUT/srJA3YrQOY0ISD48p7R6W/7WcnFf24KbsVTo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G5ugvjTRXZZY+7DEVwEk70pafiQYQ3dozOokfWHulTqiUoSPR3rlBkbpfGQSSB664
	 5J+hoOIKgn+nYHULsDfA3abQKM2WJRPcW1fXp9ai+E71I/59kg1c2zInvcQUfhAsHq
	 ScZvltyRHfnx2owfgUh2ftO7RIz4i3aY8iyCUjeuWvqThaX5mW5jwvd7gyMvy+qI5R
	 Hm7/DgX3GjMUwAZDOx5+877sT4Zq+slGSofMaJqDdDRghfpyNeJ/7qM+7mvNqE+sAc
	 XT+y/g5UM3/wTKg1Y3xp+ru7XMFJYodM/CTumiL5kVWq+XqjPOTpc/es7wUH/gxuNg
	 dRnPaSA2fDtag==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 16 May 2026 07:57:03 +0200
Subject: [PATCH net-next v7 01/10] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-airoha-eth-multi-serdes-v7-1-99e0093303e2@kernel.org>
References: <20260516-airoha-eth-multi-serdes-v7-0-99e0093303e2@kernel.org>
In-Reply-To: <20260516-airoha-eth-multi-serdes-v7-0-99e0093303e2@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_225731_487381_E11B5570 
X-CRM114-Status: GOOD (  11.92  )
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

EN7581 and AN7583 SoCs support connecting multiple external SerDes to GDM3
or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner.
As a result multiple net_devices can connect to the same GDM{3,4} port
and there is a theoretical "1:n" relation between GDM ports and
net_devices.
Introduce the ethernet-port property in order to model a given net_device
that is connected via the external arbiter to the GDM{3,4} port (that
is represented by the ethernet property. Please note GDM1 or GDM2 does not
support the connection with the external arbiter and are represented
by ethernet property.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-eth.yaml | 60 +++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index fbe2ddcdd909..7144d6da7394 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
@@ -130,6 +130,46 @@ patternProperties:
         maximum: 4
         description: GMAC port identifier
 
+    allOf:
+      - if:
+          properties:
+            reg:
+              contains:
+                items:
+                  - enum:
+                      - 3
+                      - 4
+        then:
+          properties:
+            '#address-cells':
+              const: 1
+
+            '#size-cells':
+              const: 0
+
+          patternProperties:
+            "^ethernet@[0-5]$":
+              type: object
+              unevaluatedProperties: false
+              $ref: ethernet-controller.yaml#
+              description: External ethernet port ID available on the GDM port
+
+              properties:
+                compatible:
+                  const: airoha,eth-port
+
+                reg:
+                  maxItems: 5
+                  description: External ethernet port identifier
+
+              required:
+                - reg
+                - compatible
+
+          required:
+            - "#address-cells"
+            - "#size-cells"
+
     required:
       - reg
       - compatible
@@ -191,9 +231,27 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        mac: ethernet@1 {
+        ethernet@1 {
           compatible = "airoha,eth-mac";
           reg = <1>;
         };
+
+        ethernet@4 {
+          compatible = "airoha,eth-mac";
+          reg = <4>;
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          ethernet@0 {
+            compatible = "airoha,eth-port";
+            reg = <0>;
+          };
+
+          ethernet@1 {
+            compatible = "airoha,eth-port";
+            reg = <1>;
+          };
+        };
       };
     };

-- 
2.54.0


