Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9D1C6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxq9y3bsFrsASdnzwwwd9DFyyq4MC9dAYxIHLkGs7pw=; b=fDhIrDsUOVzT/2oAlqekYBRWhO
	KBVEssQr1B0UyzrOMUjuzCOoeoeIlmgS8IiC+F49KY/qguaTbuEi2J/2+mZLzHp4gQTfj0z4/8MKQ
	dn6OVe/G4vBaPRle4KLjL7laxUbkkCmeGPX0ztRVc+v7xBwljvnzYSDy/b4qLlaUbPr5sCffnuFQ9
	lhoJ1MJaGkyMKHeSUpX2YLsceTgrOvqAbYYJtteTKjLeyVpORZwKkKBMVjbLwxAu812gNV/3GOD25
	bYtP2k3Kv3oo+iE2HlyOE3LYOyacRfhooCDllyuHcg3Zamu7GvDl/QQSGTG+qJ02GPzW10+1ptOge
	tdI8Q/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYiqi-002Mf9-66; Thu, 15 Sep 2022 06:59:48 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYinn-002K3m-Ak; Thu, 15 Sep 2022 06:56:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663224988; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DtkLVanyqdqnMijdcJ8E8I+HH26K+7kPnzMjhzUt9BgtGLE+7vvxo2MqXLjtly+TtwJk6j2BRSG9Pez7mX2ctKDQSIXNhrBBFGruf+L1V/WkGZYR+Yk+dg/qZkClIEsoc+5eiRXHkoaCKotaAZbd8DoVx3B8yvWrTO8zx4g4YeA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663224988; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=uxq9y3bsFrsASdnzwwwd9DFyyq4MC9dAYxIHLkGs7pw=; 
	b=lto9vRj1jqIxv5q2LfGU8F6FD448a8B9TRgER/47a7KMwCga4fx8kiilDj+y1j3Xy3jpieGPD5dqLM3hlKr+rgpTyf5gFyTzeZAAvao/yFEF04U+aAW7FbWNH7Lo6f8Y3yFAmNx86HIrxApgITnzFHNAOMUIXHyiSsqmfznpvdI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663224988;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=uxq9y3bsFrsASdnzwwwd9DFyyq4MC9dAYxIHLkGs7pw=;
	b=LzA02yfItoiCAOQbFbdQKT0Gc3NzlVR5uGf+TpnWu2KorA8b10yITZWPCdwHsoAz
	VIegVrRkuCfWMDF/0SePWLb2jPtq1DofPadzRga3ORM4uzTzglr28+dGR2DNh/E0/zl
	R+mUBC0imljpNEqn9T2mqHBhfdI04KVnWGQA98Jo=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663224985900288.02172322388776; Wed, 14 Sep 2022 23:56:25 -0700 (PDT)
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
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v2 net-next 04/10] dt-bindings: memory: mt7621: add syscon as compatible string
Date: Thu, 15 Sep 2022 09:55:36 +0300
Message-Id: <20220915065542.13150-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915065542.13150-1-arinc.unal@arinc9.com>
References: <20220915065542.13150-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_235647_478879_5A367F11 
X-CRM114-Status: GOOD (  10.74  )
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

Add syscon as a constant string on the compatible property as it's required
for the SoC to work. Update the example accordingly.

Fixes: 5278e4a181ff ("dt-bindings: memory: add binding for Mediatek's MT7621 SDRAM memory controller")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/memory-controllers/mediatek,mt7621-memc.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
index 85e02854f083..ba8cd6d81d08 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: mediatek,mt7621-memc
+    items:
+      - const: mediatek,mt7621-memc
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -24,7 +26,7 @@ additionalProperties: false
 
 examples:
   - |
-    memory-controller@5000 {
-        compatible = "mediatek,mt7621-memc";
+    syscon@5000 {
+        compatible = "mediatek,mt7621-memc", "syscon";
         reg = <0x5000 0x1000>;
     };
-- 
2.34.1


