Return-Path: <SRS0=P7oD=P2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30155C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Nov 2021 08:05:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40C46108E
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Nov 2021 08:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C40C46108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmpryGS+yW5b1qeAkI23VD+pVNnhGKpH/78PuqwOXUk=; b=ldSj+wyFEKSiJv
	2TKOVfKkHGm8BmqDS3d0u2PfULg33oLw4C7TpPKVOi4GEKzhqDI7YP7e0dZRr2JXoJQUu3mmeq0aY
	h+A5202WWVeRAeb58MPNuCA7PUNyc7J1DW8ZrXUGn4V9cov79Bji/9lAAxqP8Vw+0BWeBEZEzSbwQ
	3W7I8qgxPPDt1U+eYW5vK4DuWv8/XMbG+ZoANW2HJXkToY5yYlRNoId9ZDvZkufdCmCeK4rjkK3T/
	5mWrHH6LdFBkWouYUmygsSJ+/d6g10uNxWElCAJgpi2i2ubYK8U1zxdsCkcN8RTBoHliettMNTd6d
	Pj1G5tAfSLvIIRspKA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjdB8-00E7j7-B6; Sun, 07 Nov 2021 08:05:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjdB5-00E7iL-J8; Sun, 07 Nov 2021 08:05:25 +0000
X-UUID: 815610e35a3945979be53a8431570c95-20211107
X-UUID: 815610e35a3945979be53a8431570c95-20211107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 455312256; Sun, 07 Nov 2021 01:05:20 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Nov 2021 00:57:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Nov 2021 15:56:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sun, 7 Nov 2021 15:56:52 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yz Wu <yz.wu@mediatek.com>
Subject: [PATCH 6/6] arm64: dts: mediatek: mt8195: add efuse node and cells
Date: Sun, 7 Nov 2021 15:56:46 +0800
Message-ID: <20211107075646.4366-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_010523_656942_D278DBAC 
X-CRM114-Status: UNSURE (   9.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add efuse node and cells used by t-phy to fix the bit shift issue

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
Depend on:

  [v4,1/1] arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makefile
  https://patchwork.kernel.org/patch/12509911
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 263eebfd2ea1..7fb23c1cb8cc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -933,6 +933,55 @@
 			status = "disabled";
 		};
 
+		efuse: efuse@11c10000 {
+			compatible = "mediatek,mt8195-efuse", "mediatek,efuse";
+			reg = <0 0x11c10000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			u3_tx_imp_p0: usb3-tx-imp@184 {
+				reg = <0x184 0x1>;
+				bits = <0 5>;
+			};
+			u3_rx_imp_p0: usb3-rx-imp@184 {
+				reg = <0x184 0x2>;
+				bits = <5 5>;
+			};
+			u3_intr_p0: usb3-intr@185 {
+				reg = <0x185 0x1>;
+				bits = <2 6>;
+			};
+			comb_tx_imp_p1: usb3-tx-imp@186 {
+				reg = <0x186 0x1>;
+				bits = <0 5>;
+			};
+			comb_rx_imp_p1: usb3-rx-imp@186 {
+				reg = <0x186 0x2>;
+				bits = <5 5>;
+			};
+			comb_intr_p1: usb3-intr@187 {
+				reg = <0x187 0x1>;
+				bits = <2 6>;
+			};
+			u2_intr_p0: usb2-intr-p0@188 {
+				reg = <0x188 0x1>;
+				bits = <0 5>;
+			};
+			u2_intr_p1: usb2-intr-p1@188 {
+				reg = <0x188 0x2>;
+				bits = <5 5>;
+			};
+			u2_intr_p2: usb2-intr-p2@189 {
+				reg = <0x189 0x1>;
+				bits = <2 5>;
+			};
+			u2_intr_p3: usb2-intr-p3@189 {
+				reg = <0x189 0x2>;
+				bits = <7 5>;
+			};
+		};
+
 		u3phy2: t-phy@11c40000 {
 			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
@@ -986,6 +1035,8 @@
 				reg = <0x0 0x700>;
 				clocks = <&clk26m>;
 				clock-names = "ref";
+				nvmem-cells = <&u2_intr_p1>;
+				nvmem-cell-names = "intr";
 				#phy-cells = <1>;
 			};
 
@@ -993,6 +1044,10 @@
 				reg = <0x700 0x700>;
 				clocks = <&clk26m>;
 				clock-names = "ref";
+				nvmem-cells = <&comb_intr_p1>,
+					      <&comb_rx_imp_p1>,
+					      <&comb_tx_imp_p1>;
+				nvmem-cell-names = "intr", "rx_imp", "tx_imp";
 				#phy-cells = <1>;
 			};
 		};
@@ -1008,6 +1063,8 @@
 				reg = <0x0 0x700>;
 				clocks = <&clk26m>;
 				clock-names = "ref";
+				nvmem-cells = <&u2_intr_p0>;
+				nvmem-cell-names = "intr";
 				#phy-cells = <1>;
 			};
 
@@ -1015,6 +1072,10 @@
 				reg = <0x700 0x700>;
 				clocks = <&clk26m>;
 				clock-names = "ref";
+				nvmem-cells = <&u3_intr_p0>,
+					      <&u3_rx_imp_p0>,
+					      <&u3_tx_imp_p0>;
+				nvmem-cell-names = "intr", "rx_imp", "tx_imp";
 				#phy-cells = <1>;
 			};
 		};
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
