Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FABCD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 22:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIqg8NfF8dEjK6PuGmtFIyuJOGRZ9y2mMzqcfzBkbRs=; b=TGvysv0J9j/RqKiDqKWOdBMWG7
	C1o02rQ0HZdcA1lnIeYbPksG8lPIGmKrh4sSD7T0es8aG5wkioxusAOWlRKvCbp6ajEJUHl1xwmGS
	581RWR+8XliloKeO/b7j6AKyHMMZ0V14x56tIKMibw5U7r6Qm/wf7d0CEjihHpLtKqyJt3acpy6WI
	Z92XKRfAU9cmEfqoh8UIdtKY14IPJALyC/q0yi8OCnhtz5xlOCP1Z9aYmP9mlYkgfxl2GREi8p0G3
	05uDA5BXReagx4zy+G5keNnqt5BhDicM7iXkZwLeqNZBMleuUiAjR59bnj8UbPiamyA/utRzZfL8t
	DIKcpL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiMhj-00GRhw-2J;
	Mon, 18 Sep 2023 22:26:55 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiMhh-00GRgz-05;
	Mon, 18 Sep 2023 22:26:54 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qiMhX-0002wi-01;
	Mon, 18 Sep 2023 22:26:43 +0000
Date: Mon, 18 Sep 2023 23:26:34 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 1/2] dt-bindings: net: mediatek,net: add phandles
 for SerDes on MT7988
Message-ID: <35c12a115893d324db16ec6983afb5f1951fd4c9.1695058909.git.daniel@makrotopia.org>
References: <cover.1695058909.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1695058909.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_152653_067195_5797FAFC 
X-CRM114-Status: GOOD (  10.29  )
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

Add several phandles needed for Ethernet SerDes interfaces on the
MediaTek MT7988 SoC.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/mediatek,net.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index e74502a0afe86..78219158b96af 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -385,6 +385,34 @@ allOf:
           minItems: 2
           maxItems: 2
 
+        mediatek,toprgu:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description:
+            Phandle to the syscon representing the reset controller.
+
+        mediatek,usxgmiisys:
+          $ref: /schemas/types.yaml#/definitions/phandle-array
+          minItems: 2
+          maxItems: 2
+          items:
+            maxItems: 1
+          description:
+            A list of phandle to the syscon node referencing the USXGMII PCS.
+
+        mediatek,xfi-pextp:
+          $ref: /schemas/types.yaml#/definitions/phandle-array
+          minItems: 2
+          maxItems: 2
+          items:
+            maxItems: 1
+          description:
+            A list of phandle to the syscon node that handles the 10GE SerDes PHY.
+
+        mediatek,xfi-pll:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description:
+            Phandle to the syscon node handling the 10GE SerDes clock setup.
+
 patternProperties:
   "^mac@[0-1]$":
     type: object
-- 
2.42.0

