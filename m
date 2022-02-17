Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328BBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrV3sZtcmBwMQYWt4Den3LKhck+TUDV/DwFJ7+6VY8I=; b=Nx4O655F/I7JaO
	lxpn4iJPnEozteqUlLoB4HtXAApGhs+Hv6o9A111E7hxzwaGhzrDf0XlgR5+OZe6hxLA29t1rmb6R
	EnpdQGYTLDnFaLJIwSfLrQdONGd0RGxuzXFi1leBEzd29hAM8HMzLzJhI3S/zLlwGXcz31zOZt/rW
	PtFnRxe9mhWN4FaktI8Bk8NH5DOHudYkoTepc47JLViV86osiQf+yR0R09WTvAmqkCDjR5zO8n67C
	xwq0OC7W+EPQJlmSKhV6+wCDuxxC5+QI5vRbEL+Yl+F33vC8ommvdqZtqqYR0ANu/xnMDihII7xwp
	LwNRscyIVCR0v1jMFTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKhBP-00AkWy-0a; Thu, 17 Feb 2022 13:50:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKhBK-00AkUo-Jx; Thu, 17 Feb 2022 13:50:52 +0000
X-UUID: 1c2c99cb2bba41498ec29cac92f6fbb7-20220217
X-UUID: 1c2c99cb2bba41498ec29cac92f6fbb7-20220217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1745455608; Thu, 17 Feb 2022 06:50:47 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 05:40:44 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Feb 2022 21:40:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Feb 2022 21:40:42 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 08/17] arm64: dts: mt8192: Add PCIe node
Date: Thu, 17 Feb 2022 21:40:26 +0800
Message-ID: <20220217134027.508-9-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220217134027.508-1-allen-kh.cheng@mediatek.com>
References: <20220217134027.508-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_055050_689022_FEA5935A 
X-CRM114-Status: GOOD (  10.41  )
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

Add PCIe node for mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 92262a67ef68..723bfdc3a1aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -870,6 +870,44 @@
 			};
 		};
 
+		pcie: pcie@11230000 {
+			compatible = "mediatek,mt8192-pcie";
+			device_type = "pci";
+			reg = <0 0x11230000 0 0x2000>;
+			reg-names = "pcie-mac";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			clocks = <&infracfg CLK_INFRA_PCIE_TL_26M>,
+				<&infracfg CLK_INFRA_PCIE_TL_96M>,
+				<&infracfg CLK_INFRA_PCIE_TL_32K>,
+				<&infracfg CLK_INFRA_PCIE_PERI_26M>,
+				<&infracfg CLK_INFRA_PCIE_TOP_H_133M>,
+				<&infracfg CLK_INFRA_PCIE_PL_P_250M>;
+			clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
+				 "obff_ck0", "axi_ck0", "pipe_ck0";
+			assigned-clocks = <&topckgen CLK_TOP_TL_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D6_D4>;
+			resets = <&infracfg_rst 2>,
+				 <&infracfg_rst 3>;
+			reset-names = "phy", "mac";
+			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+			bus-range = <0x00 0xff>;
+			ranges = <0x82000000 0 0x12000000 0x0 0x12000000 0 0x0800000>,
+				 <0x81000000 0 0x12800000 0x0 0x12800000 0 0x0800000>;
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+				   <0 0 0 2 &pcie_intc0 1>,
+				   <0 0 0 3 &pcie_intc0 2>,
+				   <0 0 0 4 &pcie_intc0 3>;
+			pcie_intc0: interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+
 		nor_flash: spi@11234000 {
 			compatible = "mediatek,mt8192-nor";
 			reg = <0 0x11234000 0 0xe0>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
