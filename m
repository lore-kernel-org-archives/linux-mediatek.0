Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F222C25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUPXDCTkwC2zhPMuq078yFzwDdf8nbUXFo0CgcNnnAg=; b=UEGXf01Cjicbsqn5fWCIUVDjd/
	PJW6FgJL1qogJX5oqo0vO+4feJnsoE9p0dnFJApqY2jSgGeIIW3a+VmGXiJHHNhL4jN15D04JFDZ3
	YD+1cRe9jOq0bawbRRbp9Ki/0BjkAa+ycCHVHEAv+fikSroRcCPJNACsZ8zHvH5VWJnziBK/7H6Pi
	inQtYQY/137rwc0mn+VJ9d2p7j5GvQI/qZGAz9J6f4/o1/5YB/EooV4geuaAV0QDPNi84NGs6N/xo
	ZzPW2cytWjq6EHvf1LBM0W+RLSUTy2w1Bj9Yw7BfW7+ZXWgLJ0FIiAE3DqhFnjT/y1gt+rywgs38V
	X4P6VeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJXp-004eOi-GK; Sat, 20 Aug 2022 08:09:25 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJXA-004dte-Ne; Sat, 20 Aug 2022 08:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660982902; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mZwnCnw/I9j9729ntS6rn8mobpC+O5bS/R5GDikNlEz7Ko2wqnXZ9O+kFVGJfpUSgcMh7km2cmZ0zZ4YtmyrXJv3QjHCoHL9TSlryIqeW6knezOvGLUdmO7XIrO4dWV5r5NrzXYM6DHHvZNm8Q7xqhNWRZPtOT3cw7vOMXPGXmE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660982902; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=tUPXDCTkwC2zhPMuq078yFzwDdf8nbUXFo0CgcNnnAg=; 
	b=YbxZtEiS7jwHD/oY1oJ1PaCiALs6LmTztXAo9IHUYZl4VIVTJqk880Q6eSW+Fg9PMfvYq+7kR2EVb6JATAwK63caZLqsZdgfO/EKzQpZj567HbA0xpPO4JEZjrJcYCS1kgeQ6QgwIHaG4httWhJmYhsGZ2n0QUvaV62KAXypVsY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660982902;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=tUPXDCTkwC2zhPMuq078yFzwDdf8nbUXFo0CgcNnnAg=;
	b=ZsyKWtpwLDIsS8+gp+14ph2uuQ+7XN319c/hs19p60cvDP1yKBqzTQNK04iPT+LD
	negUduhs/h8F3M5EzQ2FxVss0b9SNW9ZQGV7WxPPrpJdcNqVXJoqMvfM/XGBY8v/O6C
	pjhmIQR5BAIn3DFyZp5zEgLVeg+XiMY2FBSqfTcI=
Received: from arinc9-PC.lan (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1660982899965135.9434403903507; Sat, 20 Aug 2022 01:08:19 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v4 2/6] dt-bindings: net: dsa: mediatek,mt7530: fix reset lines
Date: Sat, 20 Aug 2022 11:07:54 +0300
Message-Id: <20220820080758.9829-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220820080758.9829-1-arinc.unal@arinc9.com>
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_010844_913341_84E4180E 
X-CRM114-Status: GOOD (  14.57  )
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

- Fix description of mediatek,mcm. mediatek,mcm is not used on MT7623NI.
- Add description for reset-gpios.
- Invalidate reset-gpios if mediatek,mcm is used. We cannot use multiple
reset lines at the same time.
- Invalidate mediatek,mcm if the compatible device is mediatek,mt7531.
There is no multi-chip module version of mediatek,mt7531.
- Require mediatek,mcm for mediatek,mt7621 as the compatible string is only
used for the multi-chip module version of MT7530.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 31 +++++++++++++++++--
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index edf48e917173..4c99266ce82a 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -110,11 +110,15 @@ properties:
   mediatek,mcm:
     type: boolean
     description:
-      if defined, indicates that either MT7530 is the part on multi-chip
-      module belong to MT7623A has or the remotely standalone chip as the
-      function MT7623N reference board provided for.
+      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
+      switch is a part of the multi-chip module.
 
   reset-gpios:
+    description:
+      GPIO to reset the switch. Use this if mediatek,mcm is not used.
+      This property is optional because some boards share the reset line with
+      other components which makes it impossible to probe the switch if the
+      reset line is used.
     maxItems: 1
 
   reset-names:
@@ -165,6 +169,9 @@ allOf:
       required:
         - mediatek,mcm
     then:
+      properties:
+        reset-gpios: false
+
       required:
         - resets
         - reset-names
@@ -182,6 +189,24 @@ allOf:
         - core-supply
         - io-supply
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - const: mediatek,mt7531
+    then:
+      properties:
+        mediatek,mcm: false
+
+  - if:
+      properties:
+        compatible:
+          items:
+            - const: mediatek,mt7621
+    then:
+      required:
+        - mediatek,mcm
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


