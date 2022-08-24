Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9367C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4a6yR0j8dGKM4ne0vdVBY0NNjAAWFNbYDluSL0Atn+M=; b=OBo9ulCdxohW75Hd/g/dmmMTKZ
	iO8SLiGXzZATu2T0Xk8kuaM9klmEGa3N0EDekKhHH0WqJMRQIALMTD8vSR4bYkPToUkWoniymKua+
	kMV4wH2Ve0YKJZtV6XAgYWqft8Nd7lodNYlox/mKbybNVsmtkfe7pC8cg4A/IgWJcAE10yxbx3Idi
	XYXBLNDZeNy7dbNCVphVQ4dkR7RMw/3+5t0gk0DhHac4StjvAmb6pwh+mHB2OiT5BtdgZrjx0XC+j
	Nrqk6eeLWXVJe2oSxT0tpJ2LlCyZS+YDgjrfg9IOgWjpEMShKtg3qnlLmuAt99jCZ1HdqB3iASTKr
	Hhl1WEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQnsR-00CAb3-Eq; Wed, 24 Aug 2022 10:44:51 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQnrY-00CA6l-KN; Wed, 24 Aug 2022 10:43:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661337815; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C2CrcDGvGGlbmQM8noVex9DxH+AHfpv0U2g32Yq87be/wEudGSLwOXW4mP5BpbA/rRdq7AkSY74V2EXninZ164StQTplJQiPBlx19TjkfjilBoZgxVzzJ5d/g23j4D9yUGNF9iB62X9d1h10YwQYND86IiTpoO3v7u4zfhk0Fu4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661337815; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=4a6yR0j8dGKM4ne0vdVBY0NNjAAWFNbYDluSL0Atn+M=; 
	b=GUc6zWurw6HN7sx50nE4MmGN5w3EjEXqj+PYk2RfhyZ/oHWWQwaAhqEE9lc4stGIk96/8GAouwX+hSPg5unCvhQwQRNMzhWudx9fhHkPoTRQgu81XYQDAVX4sZRj9NF7F9fMAySmp30K61Zn0PTX+ai4/s8Gww35D2stRVuEMk8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661337815;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=4a6yR0j8dGKM4ne0vdVBY0NNjAAWFNbYDluSL0Atn+M=;
	b=XHhowVbg9tMtLL2IW7VlCHk3tFN20Z+mDiZlDXUD4Dq3m7iauGzwnNIrSEyGfQog
	5UVpR1bUWjrCEtgF4ytPle80zAK/cC+AjfJQP0P5qLz6uGnxbgkSzhJdOUuXY+3WNil
	RpSczgsb77AnHN3F7RZLGVuCRBaDhYGWUI+ZUUII=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661337813774297.5497052009075; Wed, 24 Aug 2022 03:43:33 -0700 (PDT)
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
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v5 3/7] dt-bindings: net: dsa: mediatek,mt7530: fix reset lines
Date: Wed, 24 Aug 2022 13:40:36 +0300
Message-Id: <20220824104040.17527-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824104040.17527-1-arinc.unal@arinc9.com>
References: <20220824104040.17527-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_034356_761382_3E24535B 
X-CRM114-Status: GOOD (  12.75  )
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

- Add description for reset-gpios.
- Invalidate reset-gpios if mediatek,mcm is used. We cannot use multiple
reset lines at the same time.
- Invalidate mediatek,mcm if the compatible device is mediatek,mt7531.
There is no multi-chip module version of mediatek,mt7531.
- Require mediatek,mcm for mediatek,mt7621 as the compatible string is only
used for the multi-chip module version of MT7530.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index d5f167e6c990..13f54d402e06 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -111,6 +111,11 @@ properties:
       switch is a part of the multi-chip module.
 
   reset-gpios:
+    description:
+      GPIO to reset the switch. Use this if mediatek,mcm is not used.
+      This property is optional because some boards share the reset line with
+      other components which makes it impossible to probe the switch if the
+      reset line is used.
     maxItems: 1
 
   reset-names:
@@ -160,6 +165,9 @@ allOf:
       required:
         - mediatek,mcm
     then:
+      properties:
+        reset-gpios: false
+
       required:
         - resets
         - reset-names
@@ -176,6 +184,22 @@ allOf:
         - core-supply
         - io-supply
 
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt7531
+    then:
+      properties:
+        mediatek,mcm: false
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt7621
+    then:
+      required:
+        - mediatek,mcm
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


