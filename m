Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB98C54ED1
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jun 2025 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/pxDHLdKM59vQwtrSmRPlY+HDheivtQ/80IDfz7MYk=; b=FaiLsw+ct8YXxC
	1XnudE/8h4Iq+N2WmaRrQjPdM2XJA4Ix0Mp0RnLaE/tzYTpS7z27f13SJJ6/oo8tljG198Gz+aKIX
	d3Zw0G3ixsFbCQMuVkH0DrOLs9L23MyViL9A9ZI6DK6gnJsiuI8UcyRROINIovfzW64A4bQUZzH3+
	AxpPEjcCZ6NBm9vByQ6a4KSaFGblgv6tkBZD8RJYu8QA0g8cMuMOqwQDjI9n6kMHw+spMhc3YRf5U
	3KqhSsWnVmQ221iTySzZOSCofOs82ihPGVIBSbs+TxqWp8QuDrA5zKSPc5W+kmKn4zW7FWHki4Kt9
	jeQZ6ht+f3S93Q78ZgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRVe-0000000Gash-42Dm;
	Sat, 28 Jun 2025 09:06:06 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRTL-0000000GaSv-0rVH
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Jun 2025 09:03:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751101421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/pxDHLdKM59vQwtrSmRPlY+HDheivtQ/80IDfz7MYk=;
	b=uiKRNm9qcS9nl7TbUPDs9XyqHBP69P8tY6XgbwKXzAUcPGRByiDW8nx7bXlciNWa5y9ezr
	WcLoIo8Uki7XCiPD39P4KrMxBrLxf/sXRstzT4ASxIH7tMp8XKoUGvol+Q2KW26wgJV7oO
	0AOmwxC/N0AIsR0Us1hSjEcwDwzjp6k=
From: Frank Wunderlich <frank.wunderlich@linux.dev>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 02/15] dt-bindings: net: mediatek,net: allow irq names
Date: Sat, 28 Jun 2025 11:03:13 +0200
Message-ID: <20250628090330.57264-3-frank.wunderlich@linux.dev>
In-Reply-To: <20250628090330.57264-1-frank.wunderlich@linux.dev>
References: <20250628090330.57264-1-frank.wunderlich@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_020343_388552_B5A9FD50 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-pm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

In preparation for MT7988 and RSS/LRO allow the interrupt-names
property. Also increase the maximum IRQ count to 8 (4 FE + 4 RSS),
but set boundaries for all compatibles same as irq count.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v6: new patch splitted from the mt7988 changes
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 74a139000f60..6672db206b38 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -28,8 +28,7 @@ properties:
       - ralink,rt5350-eth
 
   reg:
-    items:
-      - description: Register for accessing the MACs.
+    maxItems: 1
 
   clocks:
     minItems: 2
@@ -67,10 +66,6 @@ properties:
       - const: gmac
       - const: ppe
 
-  sram:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: phandle to mmio SRAM
-
   mediatek,ethsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -423,7 +418,7 @@ allOf:
             - const: xgp3
 
 patternProperties:
-  "^mac@[0-2]$":
+  "^mac@[0-1]$":
     type: object
     unevaluatedProperties: false
     allOf:
-- 
2.43.0


