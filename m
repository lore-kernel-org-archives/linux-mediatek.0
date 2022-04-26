Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+Ya2DGOeqz96mBjpv9ygwc7PK8x59MsHNCaLUVx5BE=; b=OTd7oP39AVR9kq
	GcCEY2NN8SCukuuW1CRvvev+HT9vwJvBcidRLTEzCl7RVdYHOSNdXsNdBdVfU+LhLvi1I00l/Fr/j
	GukmNAYgIcptEu/oAIg5nqr2rCCn+AZ/O7NP1qtVZSV47PTjVFnu+MickOY6hvEAxSKEpdPnqal3n
	zJDMXtmMvSQRXjLHQprYNZPFI/UPjNlG1Xmgo9qMf8G7q9id+isOujOiT2PINnCC2JDRL1PJAh7xg
	8S/58CTqI+d2avei2+XkDxLvPdk4v+Oi2QZ9re/pUmM9X/S9uVvjhgzLn00WR3ZBm8T9T9G8isy0b
	B02upfR0hQ4a1OprALOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLcZ-00ElPt-UJ; Tue, 26 Apr 2022 13:52:51 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLZS-00Ek6c-IC; Tue, 26 Apr 2022 13:49:47 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id 8B1DB41AB6;
 Tue, 26 Apr 2022 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1650980976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9YFDeB1vAOyE3A+Y0JZmaaZXSj1AvnNU8FrNEZ0qvQ=;
 b=X/Bt3gWM8t1Rvbuq6JHlOPd0TqwdQfkqFU9yKtQQq0BYZMx6RtKGH9dCOqJoRhek1953UM
 ld9OLTddA5AjlzSC3wVQl8CVry7J3alRuLTGSJ3Dqy63eLVKFy2Gahz19eGbcdPxTVwOjE
 9OaJZoboADC0+5erTRonl6OuD+PUmQw=
Received: from localhost.localdomain (fttx-pool-80.245.77.37.bambit.de
 [80.245.77.37])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 6D1293602E7;
 Tue, 26 Apr 2022 13:49:35 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [RFC v1 3/3] arm64: dts: rockchip: Add mt7531 dsa node to BPI-R2-Pro
 board
Date: Tue, 26 Apr 2022 15:49:24 +0200
Message-Id: <20220426134924.30372-4-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426134924.30372-1-linux@fw-web.de>
References: <20220426134924.30372-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mail-ID: 1e443bb6-0a05-4b43-a42b-1ffe031028fa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064938_807995_6E424B3C 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add Device Tree node for mt7531 switch connected to gmac0.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index e091f0407460..ea5b01a90ee0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -437,6 +437,55 @@ &i2c5 {
 	status = "disabled";
 };
 
+&mdio0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	switch@0 {
+		compatible = "mediatek,mt7531";
+		reg = <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+				label = "lan0";
+			};
+
+			port@2 {
+				reg = <2>;
+				label = "lan1";
+			};
+
+			port@3 {
+				reg = <3>;
+				label = "lan2";
+			};
+
+			port@4 {
+				reg = <4>;
+				label = "lan3";
+			};
+
+			port@5 {
+				reg = <5>;
+				label = "cpu";
+				ethernet = <&gmac0>;
+				phy-mode = "rgmii";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+					pause;
+				};
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy1: ethernet-phy@0 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
