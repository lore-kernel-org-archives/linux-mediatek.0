Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC250C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 23:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zG7Z079VGzm9fVuMaqkib6Sl09LYXi8uxS0GVydSlL8=; b=0AcnsOFn81El2rnXDVwh1UaTtg
	qrQMWIx78dMZ+CDiY+MsX/fvqVgqNIKdK7C2MiWPPd+IK1cJUJya8gdMNUxpXLoSzvV/uRv7cVq6a
	tJhmplRNZ3NJgKULKXQvXSQjQzl2aF2BeZuOmuH1Dy72PzmvNADtKL8YPYFl2K0r6SSI7c5gdQiu+
	wE1XYiKmooUFd4tdH/XbJMzBmqBQEsfKvBt8Tq0458R4p+A0ApFOYBoW07+Atm460Zw846kdE8Alp
	iqELuv00ts6xfYDzyNHqW3ZhYFEHEfz/Hgwohn43xNSzmcng7BXa7jXwakWd76bkQyEM0JbyNO3mP
	Aag3q7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGOJ-003XIZ-3q; Thu, 09 Feb 2023 23:31:47 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGOG-003XGo-RA; Thu, 09 Feb 2023 23:31:46 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pQGO9-0002F8-3B;
	Fri, 10 Feb 2023 00:31:38 +0100
Date: Thu, 9 Feb 2023 23:30:01 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: [PATCH v3 04/12] dt-bindings: arm: mediatek: sgmiisys: add MT7981 SoC
Message-ID: <28168bb376d1a473eb748a5c1fd70ca6f94d08c9.1675984550.git.daniel@makrotopia.org>
References: <cover.1675984550.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675984550.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_153144_909353_4DBACA00 
X-CRM114-Status: GOOD (  10.46  )
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

Add mediatek,pnswap boolean property as well as an example for the
MediaTek MT7981 SoC making use of that new property.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../arm/mediatek/mediatek,sgmiisys.yaml       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
index 99ceb08ad7c0..97d4ab70e541 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml
@@ -23,6 +23,8 @@ properties:
           - enum:
               - mediatek,mt7622-sgmiisys
               - mediatek,mt7629-sgmiisys
+              - mediatek,mt7981-sgmiisys_0
+              - mediatek,mt7981-sgmiisys_1
               - mediatek,mt7986-sgmiisys_0
               - mediatek,mt7986-sgmiisys_1
           - const: syscon
@@ -33,6 +35,10 @@ properties:
   '#clock-cells':
     const: 1
 
+  mediatek,pnswap:
+    description: Invert polarity of the SGMII data lanes
+    type: boolean
+
 required:
   - compatible
   - reg
@@ -51,3 +57,19 @@ examples:
         #clock-cells = <1>;
       };
     };
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      sgmiisys0: syscon@10060000 {
+        compatible = "mediatek,mt7981-sgmiisys_0", "syscon";
+        reg = <0 0x10060000 0 0x1000>;
+        mediatek,pnswap;
+        #clock-cells = <1>;
+      };
+      sgmiisys1: syscon@10070000 {
+        compatible = "mediatek,mt7981-sgmiisys_1", "syscon";
+        reg = <0 0x10070000 0 0x1000>;
+        #clock-cells = <1>;
+      };
+    };
-- 
2.39.1


