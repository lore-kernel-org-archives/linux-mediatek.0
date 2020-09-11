Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61340C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:10:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4CB622285
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 13:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qam2yjhU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="goYKmOsq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4CB622285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ZCp2NMfqIBw1zPySJUzBoe9nv+0o/58jRKDJI4NmjA=; b=Qam2yjhUUijvmmR4FyNFs1UfY
	MOb5cSVYEVG8ENkp8/5yb6xZOg++kyx6rmqYG+E6+B6Pybwot65ZT1ECvvTbs1hDHHLx8P9TO6e3z
	OCeryOiF//8Qg8lFN3X2BDAPCIio5L6LHtIljIiJB+yZSyqk8P6IiO2eAPz39AYtk0uPbQ/FO+QtC
	LIaUTY9ILyr0xKktRsq/QwzYIyHpQggGJxiRce7OaDCZCG8LPWt45GyQkgU7Yo2z0SdPOejii14ft
	7DqBYqLptt4cXBH4iRjnOd194iWKM7ifF3NtDlKgCvG6/8JX8X3xHHWc64k5+LF87+jE3SnpUqbKI
	3Ke5lJwyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGioj-0000P1-V4; Fri, 11 Sep 2020 13:10:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGioP-0000FW-Ns; Fri, 11 Sep 2020 13:09:59 +0000
X-UUID: 6185f514cca24e28928fa94b060576d4-20200911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yhMeXMSBNUBRDeycZh1L4Fz1F/RTkmYS9WTwdpA+DVs=; 
 b=goYKmOsqo3vhMxR+/wE52oMlOCqqr8gQwRtCVzmq2djzOLDy9H/1R3N1OwLq3Z0Bo/3VPB9yZc07bNkbR9T/r8UwHU7eAKiVmAqnxZybvFn+eYR7zsNKQlOX6jXph9GMGYcPsirVTPsbQvGkxvO5mM/lGV4jObX4RJHIOc07gHM=;
X-UUID: 6185f514cca24e28928fa94b060576d4-20200911
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 285005266; Fri, 11 Sep 2020 05:07:53 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 05:57:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 20:57:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 20:57:47 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Russell
 King" <linux@armlinux.org.uk>
Subject: [PATCH net-next v4 5/6] arm64: dts: mt7622: add mt7531 dsa to
 mt7622-rfb1 board
Date: Fri, 11 Sep 2020 20:56:27 +0800
Message-ID: <20737f93e19a1fd79c9cf4dc7684b14d293c117c.1599825966.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1599825966.git.landen.chao@mediatek.com>
References: <cover.1599825966.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_090957_932412_978C41C8 
X-CRM114-Status: GOOD (  12.19  )
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
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, Landen Chao <landen.chao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt7531 dsa to mt7622-rfb1 board for 5 giga Ethernet ports support.
mt7622 only supports 1 sgmii interface, so either gmac0 or gmac1 can be
configured as sgmii interface. In this patch, change to connect mt7622
gmac0 and mt7531 port6 through sgmii interface.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 57 +++++++++++++++++---
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 0b4de627f96e..3fd948fb7f7a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -105,20 +105,65 @@
 	pinctrl-0 = <&eth_pins>;
 	status = "okay";
 
-	gmac1: mac@1 {
+	gmac0: mac@0 {
 		compatible = "mediatek,eth-mac";
-		reg = <1>;
-		phy-handle = <&phy5>;
+		reg = <0>;
+		phy-mode = "2500base-x";
+
+		fixed-link {
+			speed = <2500>;
+			full-duplex;
+			pause;
+		};
 	};
 
 	mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		phy5: ethernet-phy@5 {
-			reg = <5>;
-			phy-mode = "sgmii";
+		switch@0 {
+			compatible = "mediatek,mt7531";
+			reg = <0>;
+			reset-gpios = <&pio 54 0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
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
 		};
+
 	};
 };
 
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
