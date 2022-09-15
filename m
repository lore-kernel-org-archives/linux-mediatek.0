Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ED5ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 06:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mv8wnCQI8K+FkvB2ZahCjYMMUvp+WpG/VEtG06Ocnio=; b=TZCPN93eBPx9QJL882hACPI7yK
	SEcLjzSHOkEZFX04c8oc5gQTBIF2EhKWlN9nzk4HWkId1vSAR4Vky5oYX+nwyse87F9ILBcKBK2Mr
	pD7N7UWvnoLc1FcvuuNIefvQKsUmJfrsGe11Ie9ZbMIuSeUcmSpaUAPRRMjaNuf8DKFfrVSjVHtBi
	v9X9BZc4S+u8YgQm9ALYnFGO7/kBOn5jwRfJ2knv2owdWHmDb+Vkv7m8lYU987v2tXlRMac+edTvT
	5Zb9PkIQ4MdGqFK/AiqRND85EPdAenFE8PPdVXcGBzsvRlq7WNaKnTOkdqBriS1DKyo2d3bvHbLCw
	PpTVg4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYiq8-002LvE-GZ; Thu, 15 Sep 2022 06:59:12 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYinj-002K0S-FM; Thu, 15 Sep 2022 06:56:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663224976; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lmVH3MHzUFx3hmWfHOG3JTjPnXejGHWQzBS8HbgvFs6BB5iitXRgjjZpdkPP1Hj8m+E5wVIutC22QMvbXL1mvoxWhg1GAevnjYko5QKQc5IjC+VfFnAVvMchIugqPiDH+kAMfRl90fWq+AB0cDWpdPy+sHsz57lGifTNd8V2Aho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663224976; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=mv8wnCQI8K+FkvB2ZahCjYMMUvp+WpG/VEtG06Ocnio=; 
	b=Dkoy5QQBL8mofBomNSpbWWan0i1Yb7iJfP7i6OCgTWj6Mxqiz+jWRaYFLIF+2K6+ED26NJnFxRQ1oj9oF19polLj4xz4yBOIXXgPQJ9JovDAsZopX150+htGeW9YBmdWcXu4IUsy17m0krEjKppeB3xXU31WJAwB8SE5OQKTdi4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663224976;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=mv8wnCQI8K+FkvB2ZahCjYMMUvp+WpG/VEtG06Ocnio=;
	b=UHdQSE2yvWww0kqVUZt1ddrBkdtv5ahRT+DZNhqEmPfa7AnjE7cuS8qDRnv7DaTv
	e7rviHdl15eAJHm3lEm8eO46Evginm+B30ejwnUaxy3DW6qOMYzG3AAwCMB/bS+hHFC
	qiFVH5iYtuQCyzOw9ck9xcsP6NoJnTG+2oPrnvG8=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663224973944582.5029729294455; Wed, 14 Sep 2022 23:56:13 -0700 (PDT)
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
Subject: [PATCH v2 net-next 02/10] dt-bindings: net: dsa: mediatek,mt7530: change mt7530 switch address
Date: Thu, 15 Sep 2022 09:55:34 +0300
Message-Id: <20220915065542.13150-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915065542.13150-1-arinc.unal@arinc9.com>
References: <20220915065542.13150-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_235643_578313_56FDB8D2 
X-CRM114-Status: GOOD (  11.30  )
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


