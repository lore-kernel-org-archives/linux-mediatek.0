Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52657C25B0F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Aug 2022 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zy98iC9XC2eVhC07Cr4RMR8a0qJzk56OXu8sNv2CeM4=; b=AKuGF0DIFxZkKifScnTCP6nYh1
	wnhzQAsjqIGx16qADAQGeTkXWu0lzURHFYljx8DmULSNJO5XltC+DWUnFUdaifxymFBjkLgmf509D
	EunTZ5+/CgmxeIy9QaXoUVaxTNi/F+3aodJnKqMW2MLOLPbR6tlLD0Cw734Sa6mGZkSK1D6r293dV
	CLT82/26Py5K5GsHGS672K/R/CKCQfLRN/zwXjzoYL7Adl8mAKQa0vJ4XqSUA6NKnGEocg6hpyEse
	TIhjE3Tr5RrxmBnq2XZPTHA40UMHdd+LKoS6y8M5frhBWugSwAGLk17cdqU7HEtuunRB+EOW14Mr5
	NkgwwA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtMZ-00FZfx-8i; Sat, 13 Aug 2022 15:47:47 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtKT-00FYJD-JH; Sat, 13 Aug 2022 15:45:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660405515; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LHguKks0lv7vA3ueibE2h19pXiUvWhpnLecebJ4kCqKf2zVTSqc/EHbKKjX5JkIZ4uyQVRICg94O19OOVjtZ2PVvKU0d6PbQMMMyTaW7//Iz2TJCRKAlEvPRsAbv3/1OxRAFY5QmzbEkHbNhJYMLoYE1foUj4bJ1s7jlkpaR1O8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660405515; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=zy98iC9XC2eVhC07Cr4RMR8a0qJzk56OXu8sNv2CeM4=; 
	b=fWIYkNz00lm8ELkSMUHDxH9I2bix0PwYEFNozFALqewJ1pa/gAwh32H5lhjyJKkqMIOrcBqlcTZvbci4JVtB55uOuNrdlQaD+lv0zzThsl9SZIwQOZHGfy9nOpiaZ/xqlNYbv+g5+tovavL1aQP5EZwXeqUJTJvMZj5L/jh09R8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660405515;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=zy98iC9XC2eVhC07Cr4RMR8a0qJzk56OXu8sNv2CeM4=;
	b=Nv6cdOYAB97QZBR9N8itpcTzpPm/s3tG9Vy6oynKxXEs9XrJ92P9RBLpPspqNqvv
	0IvCWV8eK1SFVihhPhCnHsrAHC3rp862bJM96iWbXKrgkPXfRUh/PL/77KRyfyPWWWl
	9EfbgNjs3GhvEfq3eH8bpriH26tLjTYDwLVsip0I=
Received: from arinc9-PC.lan (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 166040551423871.94615740500126; Sat, 13 Aug 2022 08:45:14 -0700 (PDT)
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
Subject: [PATCH v2 6/7] dt-bindings: net: dsa: mediatek,mt7530: define phy-mode for each compatible
Date: Sat, 13 Aug 2022 18:44:14 +0300
Message-Id: <20220813154415.349091-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220813154415.349091-1-arinc.unal@arinc9.com>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_084537_795774_620358D5 
X-CRM114-Status: UNSURE (   8.33  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Define acceptable phy-mode values for CPU port of each compatible device.
Remove relevant information from the description of the binding.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 103 ++++++++++++++++--
 1 file changed, 92 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index a27cb4fa490f..530ef5a75a2f 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -49,17 +49,6 @@ description: |
   * mt7621: phy-mode = "rgmii-txid";
   * mt7623: phy-mode = "rgmii";
 
-  CPU-Ports need a phy-mode property:
-    Allowed values on mt7530 and mt7621:
-      - "rgmii"
-      - "trgmii"
-    On mt7531:
-      - "1000base-x"
-      - "2500base-x"
-      - "rgmii"
-      - "sgmii"
-
-
 properties:
   compatible:
     oneOf:
@@ -177,6 +166,36 @@ allOf:
                         items:
                           - const: cpu
                   then:
+                    allOf:
+                      - if:
+                          properties:
+                            reg:
+                              const: 5
+                        then:
+                          properties:
+                            phy-mode:
+                              enum:
+                                - gmii
+                                - mii
+                                - rgmii
+
+                      - if:
+                          properties:
+                            reg:
+                              const: 6
+                        then:
+                          properties:
+                            phy-mode:
+                              enum:
+                                - rgmii
+                                - trgmii
+
+                    properties:
+                      reg:
+                        enum:
+                          - 5
+                          - 6
+
                     required:
                       - phy-mode
 
@@ -206,6 +225,38 @@ allOf:
                         items:
                           - const: cpu
                   then:
+                    allOf:
+                      - if:
+                          properties:
+                            reg:
+                              const: 5
+                        then:
+                          properties:
+                            phy-mode:
+                              enum:
+                                - 1000base-x
+                                - 2500base-x
+                                - rgmii
+                                - sgmii
+
+                      - if:
+                          properties:
+                            reg:
+                              const: 6
+                        then:
+                          properties:
+                            phy-mode:
+                              enum:
+                                - 1000base-x
+                                - 2500base-x
+                                - sgmii
+
+                    properties:
+                      reg:
+                        enum:
+                          - 5
+                          - 6
+
                     required:
                       - phy-mode
 
@@ -235,6 +286,36 @@ allOf:
                         items:
                           - const: cpu
                   then:
+                    allOf:
+                      - if:
+                          properties:
+                            reg:
+                              const: 5
+                        then:
+                          properties:
+                            phy-mode:
+                              enum:
+                                - gmii
+                                - mii
+                                - rgmii
+
+                      - if:
+                          properties:
+                            reg:
+                              const: 6
+                        then:
+                          properties:
+                            phy-mode:
+                              enum:
+                                - rgmii
+                                - trgmii
+
+                    properties:
+                      reg:
+                        enum:
+                          - 5
+                          - 6
+
                     required:
                       - phy-mode
 
-- 
2.34.1


