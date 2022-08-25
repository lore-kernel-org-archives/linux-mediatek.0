Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8CDC04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 08:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iatfibaEkRjc+jLuqjlHdBTrArLyKAAD70kGaPgXv8=; b=lSh5ZdYDo1vigSRyhsz+4yd8co
	eYyYFQQ0jmFJtxAs8mSqa0rAfp1mJT8hk6wOYSWEYlAhLEsD9fClN0ucix2diY3g+thD+rgx/2/s3
	BCCsdDGw5sFDtkrk0HJvw4Y+b7nlOnOvuhfofU8bnyMMtKZpcAQwi0MKCRraObD1u+F62uSIWImIE
	Xy/J6VES1GkMTdymBX219HJMT3FWFW6PAQrSBXHsH91JyqQZtR+mrqmmQiLcIyHwfCI3P1PZuzo9K
	IDLM0fPd4n3sRbnTCOzxqA69/vY3PIEUh32euF665iharaXU+G0ksFFSz10qbt0V809mXbphF6Tn7
	XUrDbXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR8Ci-00A3F9-Ql; Thu, 25 Aug 2022 08:27:08 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR89z-00A0vu-JN; Thu, 25 Aug 2022 08:24:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661415833; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HnRx4Bkx6TCRsv/FgLgZBpYA9bs1BqDUM+YPR7AvsbVOHjy+kdDfkoTmM87eqt41lO8ALhGmeyikh+RCXmsCsGTZls9305O7uvaqBcStUj7DhQnAbdlixyQhsb/HhrPqQXG5zpOUmRgjgSsIU3cmNsF6xh4wsCzM4tD2s3rHXw4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661415833; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=4iatfibaEkRjc+jLuqjlHdBTrArLyKAAD70kGaPgXv8=; 
	b=hZifc1bBl3vpVa5KYYky7lyUe5hoBsI2riI9HbDrlbLlrco9zRuZB5KouaXckYNNWq3Y1T5bfI3z+eADbuV1MKb7S9408GR7mw297vQtiOBW8JTJP6+j7FwzziFAGCnmLmwi+gE53/BqC6YLd+YM6Uq+VgsH09Clor9bstW2ve4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661415833;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=4iatfibaEkRjc+jLuqjlHdBTrArLyKAAD70kGaPgXv8=;
	b=FLt744MEU/IoMd97w4eXxByxmfH2ZqisXGRT71jke8n8Tq3gmlS+rZTHBZN4JZkt
	UZQ9zQdzl1QfVCG0h7DrcsgeMqlJIqL6WXMl+pp+aew1jDdZeVSUtcaCpcmyLLa7z9r
	nQTSk6F0nha98+megiwU5mMHl401AneUzDfpl3N8=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661415830692840.2140356682969; Thu, 25 Aug 2022 01:23:50 -0700 (PDT)
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
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 6/6] dt-bindings: net: dsa: mediatek,mt7530: update binding description
Date: Thu, 25 Aug 2022 11:23:01 +0300
Message-Id: <20220825082301.409450-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825082301.409450-1-arinc.unal@arinc9.com>
References: <20220825082301.409450-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_012419_701824_922DC8CE 
X-CRM114-Status: GOOD (  22.12  )
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

Update the description of the binding.

- Describe the switches, which SoCs they are in, or if they are standalone.
- Explain the various ways of configuring MT7530's port 5.
- Remove phy-mode = "rgmii-txid" from description. Same code path is
followed for delayed rgmii and rgmii phy-mode on mtk_eth_soc.c.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 97 ++++++++++++-------
 1 file changed, 62 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index fe8ecaf60240..f9e7b6e20b35 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -13,41 +13,68 @@ maintainers:
   - Sean Wang <sean.wang@mediatek.com>
 
 description: |
-  Port 5 of mt7530 and mt7621 switch is muxed between:
-  1. GMAC5: GMAC5 can interface with another external MAC or PHY.
-  2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
-     of the SOC. Used in many setups where port 0/4 becomes the WAN port.
-     Note: On a MT7621 SOC with integrated switch: 2nd GMAC can only connected to
-       GMAC5 when the gpios for RGMII2 (GPIO 22-33) are not used and not
-       connected to external component!
-
-  Port 5 modes/configurations:
-  1. Port 5 is disabled and isolated: An external phy can interface to the 2nd
-     GMAC of the SOC.
-     In the case of a build-in MT7530 switch, port 5 shares the RGMII bus with 2nd
-     GMAC and an optional external phy. Mind the GPIO/pinctl settings of the SOC!
-  2. Port 5 is muxed to PHY of port 0/4: Port 0/4 interfaces with 2nd GMAC.
-     It is a simple MAC to PHY interface, port 5 needs to be setup for xMII mode
-     and RGMII delay.
-  3. Port 5 is muxed to GMAC5 and can interface to an external phy.
-     Port 5 becomes an extra switch port.
-     Only works on platform where external phy TX<->RX lines are swapped.
-     Like in the Ubiquiti ER-X-SFP.
-  4. Port 5 is muxed to GMAC5 and interfaces with the 2nd GAMC as 2nd CPU port.
-     Currently a 2nd CPU port is not supported by DSA code.
-
-  Depending on how the external PHY is wired:
-  1. normal: The PHY can only connect to 2nd GMAC but not to the switch
-  2. swapped: RGMII TX, RX are swapped; external phy interface with the switch as
-     a ethernet port. But can't interface to the 2nd GMAC.
-
-    Based on the DT the port 5 mode is configured.
-
-  Driver tries to lookup the phy-handle of the 2nd GMAC of the master device.
-  When phy-handle matches PHY of port 0 or 4 then port 5 set-up as mode 2.
-  phy-mode must be set, see also example 2 below!
-  * mt7621: phy-mode = "rgmii-txid";
-  * mt7623: phy-mode = "rgmii";
+  There are two versions of MT7530, standalone and in a multi-chip module.
+
+  MT7530 is a part of the multi-chip module in MT7620AN, MT7620DA, MT7620DAN,
+  MT7620NN, MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs.
+
+  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10/100 PHYs
+  and the switch registers are directly mapped into SoC's memory map rather than
+  using MDIO. The DSA driver currently doesn't support this.
+
+  There is only the standalone version of MT7531.
+
+  Port 5 on MT7530 has got various ways of configuration.
+
+  For standalone MT7530:
+
+    - Port 5 can be used as a CPU port.
+
+    - PHY 0 or 4 of the switch can be muxed to connect to the gmac of the SoC
+      which port 5 is wired to. Usually used for connecting the wan port
+      directly to the CPU to achieve 2 Gbps routing in total.
+
+      The driver looks up the reg on the ethernet-phy node which the phy-handle
+      property refers to on the gmac node to mux the specified phy.
+
+      The driver requires the gmac of the SoC to have "mediatek,eth-mac" as the
+      compatible string and the reg must be 1. So, for now, only gmac1 of an
+      MediaTek SoC can benefit this. Banana Pi BPI-R2 suits this.
+      Check out example 5 for a similar configuration.
+
+    - Port 5 can be wired to an external phy. Port 5 becomes a DSA slave.
+      Check out example 7 for a similar configuration.
+
+  For multi-chip module MT7530:
+
+    - Port 5 can be used as a CPU port.
+
+    - PHY 0 or 4 of the switch can be muxed to connect to gmac1 of the SoC.
+      Usually used for connecting the wan port directly to the CPU to achieve 2
+      Gbps routing in total.
+
+      The driver looks up the reg on the ethernet-phy node which the phy-handle
+      property refers to on the gmac node to mux the specified phy.
+
+      For the MT7621 SoCs, rgmii2 group must be claimed with rgmii2 function.
+      Check out example 5.
+
+    - In case of an external phy wired to gmac1 of the SoC, port 5 must not be
+      enabled.
+
+      In case of muxing PHY 0 or 4, the external phy must not be enabled.
+
+      For the MT7621 SoCs, rgmii2 group must be claimed with rgmii2 function.
+      Check out example 6.
+
+    - Port 5 can be muxed to an external phy. Port 5 becomes a DSA slave.
+      The external phy must be wired TX to TX to gmac1 of the SoC for this to
+      work. Ubiquiti EdgeRouter X SFP is wired this way.
+
+      Muxing PHY 0 or 4 won't work when the external phy is connected TX to TX.
+
+      For the MT7621 SoCs, rgmii2 group must be claimed with gpio function.
+      Check out example 7.
 
 properties:
   compatible:
-- 
2.34.1


