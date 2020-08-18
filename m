Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1A8C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:24:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A493205CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZpRXy/8b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WZ5H26PH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A493205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7WGer81eMpomw+OeOsli87JHvWx7cXiXbavinyH0sgo=; b=ZpRXy/8bqMdamUraxcmGbiZmW
	lDs843AWXQAmejoSMYKe+ZPFZUkTWB/4kdtdaUq75OSFcS7ILHx9rwfb8DD2CxBLANmKnXDw21WbD
	tibb7eKxB/f7sd/6YWyWU15Cob69a96TTQT5+E+v8x4Qr468JupR/uEGG8CDzp3pWTtKhCO2XyD3u
	ka2slVx/ePspb+v/CtCBu0q0VP6Kcvwszun7bdk6vqH8taHSHLBwjrxbVAX9DXDVkfQhNHC4HgRa7
	l7f0QvFfuvZ8+iJ18YAscr3P4Ef5XtPQAEfpA0wWXXwLL8Mls3nvc23KCFRna3jYKN/Y3B8jaBa/j
	pV4pX8I2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7vzG-0005KO-Fp; Tue, 18 Aug 2020 07:24:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7vzD-0005Ir-3n
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 07:24:48 +0000
X-UUID: e16d0cebb2414e80ae9ae287f75ba27e-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=l8c959ZS0LpVJQ/d/MvvSj2ryOh4fCinGK68xeDTNG0=; 
 b=WZ5H26PHRgjqagkm6U63ChVotgwt/24qyRkF9kCkBAy8SfPgVVkTtsMSsnsOQfa9EJ5qCsMaTRwFKShfNskln0HEODVkONFnrIVxYpC2HpRSun+a6nedIEaU7F3rhi4EQT1zm2cEMHHOLFgaUYpAdA2JrSz2rVUpDjALic05JEE=;
X-UUID: e16d0cebb2414e80ae9ae287f75ba27e-20200817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 934266027; Mon, 17 Aug 2020 23:20:37 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 00:14:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 15:14:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Aug 2020 15:14:37 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH net-next v2 4/7] dt-bindings: net: dsa: add new MT7531 binding
 to support MT7531
Date: Tue, 18 Aug 2020 15:14:09 +0800
Message-ID: <1ec38b68deec6f1c23e1236d38035b1823ea2ebf.1597729692.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1597729692.git.landen.chao@mediatek.com>
References: <cover.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_032447_368086_419AA117 
X-CRM114-Status: GOOD (  12.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, dqfext@gmail.com, frank-w@public-files.de,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, linux-mediatek@lists.infradead.org,
 Landen Chao <landen.chao@mediatek.com>, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add devicetree binding to support the compatible mt7531 switch as used
in the MediaTek MT7531 switch.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Landen Chao <landen.chao@mediatek.com>
---
 .../devicetree/bindings/net/dsa/mt7530.txt    | 71 ++++++++++++++++++-
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index c5ed5d25f642..50eaf40fb612 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -5,6 +5,7 @@ Required properties:
 
 - compatible: may be compatible = "mediatek,mt7530"
 	or compatible = "mediatek,mt7621"
+	or compatible = "mediatek,mt7531"
 - #address-cells: Must be 1.
 - #size-cells: Must be 0.
 - mediatek,mcm: Boolean; if defined, indicates that either MT7530 is the part
@@ -32,10 +33,13 @@ Required properties for the child nodes within ports container:
 
 - reg: Port address described must be 6 for CPU port and from 0 to 5 for
 	user ports.
-- phy-mode: String, must be either "trgmii" or "rgmii" for port labeled
-	 "cpu".
+- phy-mode: String, the follow value would be acceptable for port labeled "cpu"
+	If compatible mediatek,mt7530 or mediatek,mt7621 is set,
+	must be either "trgmii" or "rgmii"
+	If compatible mediatek,mt7531 is set,
+	must be either "sgmii", "1000base-x" or "2500base-x"
 
-Port 5 of the switch is muxed between:
+Port 5 of mt7530 and mt7621 switch is muxed between:
 1. GMAC5: GMAC5 can interface with another external MAC or PHY.
 2. PHY of port 0 or port 4: PHY interfaces with an external MAC like 2nd GMAC
    of the SOC. Used in many setups where port 0/4 becomes the WAN port.
@@ -308,3 +312,64 @@ Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
 		};
 	};
 };
+
+Example 4: MT7531BE port6 -- up-clocked 2.5Gbps SGMII -- MT7622 CPU 1st GMAC
+
+&eth {
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		phy-mode = "2500base-x";
+
+		fixed-link {
+			speed = <2500>;
+			full-duplex;
+			pause;
+		};
+	};
+
+	&mdio0 {
+		switch@0 {
+			compatible = "mediatek,mt7531";
+			reg = <0>;
+			reset-gpios = <&pio 54 0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				port@0 {
+					reg = <0>;
+					label = "lan0";
+				};
+
+				port@1 {
+					reg = <1>;
+					label = "lan1";
+				};
+
+				port@2 {
+					reg = <2>;
+					label = "lan2";
+				};
+
+				port@3 {
+					reg = <3>;
+					label = "lan3";
+				};
+
+				port@4 {
+					reg = <4>;
+					label = "wan";
+				};
+
+				port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "2500base-x";
+				};
+			};
+		};
+	};
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
