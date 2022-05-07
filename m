Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EFEC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 17:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPNOAbXHKz302fEfzYi6OV/q+9uC9MN4YOduZeDqLR0=; b=taR9wzEeciqErm
	FW+H/ud8KmOJIJOI8QLE8qSQyU5dMqKXpsHbMIeozui5Z0OTTHdeO8iIxbsKmHuyRasaZHNfM/ZJm
	7VRBGnJgVlRORwNkoIPiHW0xbZXanbO88wIO9Qvh7JbiviLjix3/gi8uNu8VUgRN7Jv7ZpBiqNvyE
	An6gORugyWlAm/26dKBTg4cCxY/oOVAxDeBvHdhQnzxK3L+HH05Dxp1dmug7KdAnmGQ2ddR+44VId
	6tcPvI1t/6NvRvHLIRzoc3Wo1OoXvdG8PGMgiroXNCVqmRIyIoHIW51/xocWskvjZKMlt4d6DVANX
	WqvyaEahAKCj+33svnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnNsT-007lFN-Kd; Sat, 07 May 2022 17:05:57 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnNrW-007klk-UB; Sat, 07 May 2022 17:05:01 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout4.routing.net (Postfix) with ESMTP id 588691004CD;
 Sat,  7 May 2022 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1651943096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztXbd80xozaI47bUw9fR7hUTHlVlOWP8CEepv0mY5ag=;
 b=hjvBnIMgtNv5Y0TtmliGNJFJJyvdDsncrvJxS5hh75rBbCmxjMTKkmF5kSJ/IZJIhIVBxu
 KAcTaTa1v55y4ouhZLrtwSouLWL7hwn4+7s6xDyx6APX46UEv5ziI2TFDLH7xmHpa0A80f
 uyeMuJIlnOxrQ/cPrv/C1mg3oJMlAzE=
Received: from localhost.localdomain (fttx-pool-80.245.74.2.bambit.de
 [80.245.74.2])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 415B1800AB;
 Sat,  7 May 2022 17:04:55 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 6/6] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
Date: Sat,  7 May 2022 19:04:40 +0200
Message-Id: <20220507170440.64005-7-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220507170440.64005-1-linux@fw-web.de>
References: <20220507170440.64005-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mail-ID: 744a8d14-3188-4f88-af20-b041c28fd74e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_100459_154807_76CD2666 
X-CRM114-Status: UNSURE (   9.69  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add Device Tree node for mt7531 switch connected to gmac0.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- drop status=disabled
---
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index 235cb7405d9b..e517712f5d8d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -454,6 +454,54 @@ &i2c5 {
 	status = "disabled";
 };
 
+&mdio0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	switch@0 {
+		compatible = "mediatek,mt7531";
+		reg = <0>;
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
