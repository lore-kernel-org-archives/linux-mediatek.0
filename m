Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF3AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 02:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uP38N4edhYc6jbyZJhb19nVnp21geTftrXEV8gLQfM=; b=X3mNRse4DsnK/EeAPnuF2RgYlC
	oUYfBhabbXv9d0FSmDaoCo+2/BttzZxd6TpVJ2bEh9dnb5bodqOL/9Lr8O4FsWuLK8sLg9bWYYfQY
	QiQVKjxkz+MaI3xBEzGwBP4JN9lE52mAYaEpm0wmeX48kfs3amOjpvCpufX0QD3Ql88yZBnF9EP8Z
	uPw3nREdO3oyszs+V5KZHFPW9Zj3Yz82ulKUlQ1p6HbsBA7e5GOCxnQsSHrbzJhgJQK58ZqqMt+X9
	7P/XtCxlV1R+dd1VYBo2z/RFEaVBFaOsKu343vM/WI466cRZXS1klrtdKlrwMDjjAICQG6g0o7URH
	scp7KDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJltl-001hnN-22;
	Thu, 13 Jul 2023 02:17:41 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJltj-001hla-07;
	Thu, 13 Jul 2023 02:17:40 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qJlth-0005VH-1B;
	Thu, 13 Jul 2023 02:17:37 +0000
Date: Thu, 13 Jul 2023 03:17:24 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
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
	Russell King <linux@armlinux.org.uk>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>
Subject: [PATCH v2 net-next 1/9] dt-bindings: net: mediatek,net: add missing
 mediatek,mt7621-eth
Message-ID: <c472c5611c9c7133978b312a766295a975a0e91a.1689012506.git.daniel@makrotopia.org>
References: <cover.1689012506.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689012506.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_191739_067399_29FFB4D9 
X-CRM114-Status: GOOD (  11.29  )
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

Document the Ethernet controller found in the MediaTek MT7621 MIPS SoC
family which is supported by the mtk_eth_soc driver.

Fixes: 889bcbdeee57 ("net: ethernet: mediatek: support MT7621 SoC ethernet hardware")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/mediatek,net.yaml | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index acb2b2ac4fe1e..38aa3d97ee234 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - mediatek,mt2701-eth
       - mediatek,mt7623-eth
+      - mediatek,mt7621-eth
       - mediatek,mt7622-eth
       - mediatek,mt7629-eth
       - mediatek,mt7981-eth
@@ -32,7 +33,7 @@ properties:
   clock-names: true
 
   interrupts:
-    minItems: 3
+    minItems: 1
     maxItems: 4
 
   power-domains:
@@ -131,6 +132,30 @@ allOf:
 
         mediatek,wed-pcie: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7621-eth
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: ethif
+            - const: fe
+
+        mediatek,wed: false
+
+        mediatek,wed-pcie: false
+
   - if:
       properties:
         compatible:
-- 
2.41.0

