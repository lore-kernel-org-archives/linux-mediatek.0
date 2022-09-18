Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1061C32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mv8wnCQI8K+FkvB2ZahCjYMMUvp+WpG/VEtG06Ocnio=; b=m1Xl/oBkwGrZzsIPjcxcV/J3C6
	EK0eXvYFIsfjhvpjSKV84p+RgCnumdr8Z5DmcqICqAF/dtqKs4Kj1yv41TWHt5Ag9fsaDYm5R+W2y
	6f4XoZD9amOBNShZZDEpP5Xjw0FBNiUQDLbNiNsDzLX0jqxbHLR2ODz335W6TN/46p0KvNrZD5wKv
	LKqKRL1uggGnRYCG0CCQdLSbTwmp9zYXNTJm9hkn687RWJ4KyVVCynkZXemhoLN4Wmp/dJzBEALmP
	DP+KukPFbcF9ossknEXA42TNebF1zPOatztYdd1lLG57RFjSabmCAPNSmVMAQ48W8USM75booQZli
	cCPpEGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZua5-00Ga29-2f; Sun, 18 Sep 2022 13:43:33 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZuYl-00GYsH-2v; Sun, 18 Sep 2022 13:42:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663508502; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OItcQHojLQt8Xpk2H4OgBvas5Hmz21To2oy5fjVvrnkzlN3eiGBl5paxagC+Y0DWL/9/e1WK/R/XiMuFB4THFu6CvEqnny+xyLXsrVo/D0Ckq/qRGDKhXjXLeGyKsgThZ0qiUZYBQGTgBlyBH4TAH+1kssD52SVmui526gsA8Bg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663508502; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=mv8wnCQI8K+FkvB2ZahCjYMMUvp+WpG/VEtG06Ocnio=; 
	b=FpQdu0FgeDMcw3wK0DZrLL8gSF4hPghgUdr2rGQS3ekXvVbRHMllHMuZwwoMRj8h437T9ZUnQ450stVZ6MHC4t+82+5TxVTgImpnDBGqqjzlkNgMQ91tGdZIk5PrPOV0dVky76nBLpQo0QfbdV4GJp/Z2DUeuVaK3fvKql0vtC4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663508502;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=mv8wnCQI8K+FkvB2ZahCjYMMUvp+WpG/VEtG06Ocnio=;
	b=Z/lZ7EVWbrFILGt5R6plaSvE+fsP6gxGgxfCo0dxnwh00EdMfCHKKRZ+gISGjot+
	3uINCWoixO6lM/l7BhoyAUYWLoGQTM3alwZa3Jz7uGOZwVVDiYJixKWFq5NHyyaUOuz
	HCsCv3tLDNy3l0U9vNywkKCgM8tT9jp+kZJQWyhY=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 166350850131962.28244589605106; Sun, 18 Sep 2022 06:41:41 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sungbo Eo <mans0n@gorani.run>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 net-next 02/10] dt-bindings: net: dsa: mediatek,mt7530: change mt7530 switch address
Date: Sun, 18 Sep 2022 16:41:10 +0300
Message-Id: <20220918134118.554813-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220918134118.554813-1-arinc.unal@arinc9.com>
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_064211_179407_3231DDC0 
X-CRM114-Status: GOOD (  11.07  )
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

In the case of muxing phy0 of the MT7530 switch, the switch and the phy
will have the same address on the mdio bus, 0. This causes the ethernet
driver to fail since devices on the mdio bus cannot share an address.

Any address can be used for the switch, therefore, change the switch
address to 0x1f.

Suggested-by: Sungbo Eo <mans0n@gorani.run>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index f9e7b6e20b35..2c73d13adf14 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -294,9 +294,9 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        switch@0 {
+        switch@1f {
             compatible = "mediatek,mt7530";
-            reg = <0>;
+            reg = <0x1f>;
 
             reset-gpios = <&pio 33 0>;
 
@@ -356,9 +356,9 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        switch@0 {
+        switch@1f {
             compatible = "mediatek,mt7530";
-            reg = <0>;
+            reg = <0x1f>;
 
             mediatek,mcm;
             resets = <&ethsys MT2701_ETHSYS_MCM_RST>;
@@ -486,9 +486,9 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        switch@0 {
+        switch@1f {
             compatible = "mediatek,mt7621";
-            reg = <0>;
+            reg = <0x1f>;
 
             mediatek,mcm;
             resets = <&sysc MT7621_RST_MCM>;
@@ -573,9 +573,9 @@ examples:
                 reg = <4>;
             };
 
-            switch@0 {
+            switch@1f {
                 compatible = "mediatek,mt7621";
-                reg = <0>;
+                reg = <0x1f>;
 
                 mediatek,mcm;
                 resets = <&sysc MT7621_RST_MCM>;
@@ -664,9 +664,9 @@ examples:
                 phy-mode = "rgmii";
             };
 
-            switch@0 {
+            switch@1f {
                 compatible = "mediatek,mt7621";
-                reg = <0>;
+                reg = <0x1f>;
 
                 mediatek,mcm;
                 resets = <&sysc MT7621_RST_MCM>;
@@ -745,9 +745,9 @@ examples:
                 phy-mode = "rgmii";
             };
 
-            switch@0 {
+            switch@1f {
                 compatible = "mediatek,mt7621";
-                reg = <0>;
+                reg = <0x1f>;
 
                 mediatek,mcm;
                 resets = <&sysc MT7621_RST_MCM>;
-- 
2.34.1


