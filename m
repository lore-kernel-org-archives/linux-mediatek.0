Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48772C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 18:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZjEuyh2G5sxy6qtccp1RgU2gBOin5GQse31yIdv+F4=; b=G6W0/CTwLD76wJ
	Vdigx4VAu4DgPSHruUNH1UnksYNcsAnpOZ7U33zmueEMwLltYqKfImR1R0Z0P7OlxfK+ZVrT4epH2
	VpIJwzpsmzT3F1M6Rob1eGe6E57QArb4kWEErsylZGYDKIoHLE6tK3fnRbM1mXLfywcWLg6suoKNX
	bgl2XlHANKqcqoPLJZa9hcvnMUX3dBlmxpuF5IPG6O0Rm2idNfteHA+l8HzCxE+qUTsyRVz4z5IAh
	q9CSxF3eebGX962cyPRw0RqbybVlEhv3kFqsTWpnX1fP59xj1UxAbOQHNsswqHjdTMjDtHE28PNQU
	UEFlHlXY909Hn2078+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzZn-00000004HkQ-1c8Z;
	Fri, 16 May 2025 18:14:31 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzNh-00000004FKF-1QfA;
	Fri, 16 May 2025 18:02:04 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 624F1604B8;
	Fri, 16 May 2025 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747418515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZjEuyh2G5sxy6qtccp1RgU2gBOin5GQse31yIdv+F4=;
	b=D+CsnZos9bPYNjbt9hbRg5umCa4SR1ooviOqyn49n3P3sQ4mhbhdqDu+s66lA6dAO46bMF
	mcA6CfQoSDPTH3pJ2ONLqgn5s/ggzmVn+rgWl5UWJ3vA1eO/greO4tk9h16n9mUwCDDUeE
	/bbRhjrh5sMilOeYTFtviElWq4zgyAw=
Received: from frank-u24.. (fttx-pool-157.180.226.139.bambit.de [157.180.226.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 159DA1226F2;
	Fri, 16 May 2025 18:01:55 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 01/14] dt-bindings: net: mediatek,net: update for mt7988
Date: Fri, 16 May 2025 20:01:31 +0200
Message-ID: <20250516180147.10416-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516180147.10416-1-linux@fw-web.de>
References: <20250516180147.10416-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110201_526457_FE00376B 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Update binding for mt7988 which has 3 gmac and 2 reg items.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- change reg to list of items
---
 .../devicetree/bindings/net/mediatek,net.yaml          | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 9e02fd80af83..e5dc35cfe4e4 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -28,7 +28,10 @@ properties:
       - ralink,rt5350-eth
 
   reg:
-    maxItems: 1
+    items:
+      - description: Register for accessing the MACs.
+      - description: SoC internal SRAM used for DMA operations.
+    minItems: 1
 
   clocks:
     minItems: 2
@@ -381,8 +384,11 @@ allOf:
             - const: xgp2
             - const: xgp3
 
+        reg:
+          minItems: 2
+
 patternProperties:
-  "^mac@[0-1]$":
+  "^mac@[0-2]$":
     type: object
     unevaluatedProperties: false
     allOf:
-- 
2.43.0


