Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1D3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 12:27:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61AD5216FD
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 12:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61AD5216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m0Ue7odGOms1JH8HV4Hj3GkkDflMPxCwmX9Z5mEXaqM=; b=N1U8d0DKhh1HJ8bKA0HjGmuVDx
	Ufmnd+Lf3mS+JHRxnUSgCX1YN/PberH07RuxExI4qVUOCiUVFZelDzuRfnKMcd+JBa4kcQYiBJTY8
	Mu+jyU9kBc/qJkmiAd8DKsCcYE9WFyRm7ywOfSD9HKIV6O/X81PRcZVY5Wnys5rp0aBMT8MgwyQAO
	Tymcp/U+tVBkQol1VzGB4GD643aX2F8N9LMiajic+4vH9qRDeV0wL9nTe+x1yNWqGIAUuIrQ/6Xrl
	w7yRBOaj/kl0XC3VyAyHEHZnRD9DiIwxnaXeXMY6CbHGzGRkDQWNLOJ0+kCvJ8Vtt9hWfSYuKmUHv
	vaR8MyNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krKH8-0004Ua-74; Mon, 21 Dec 2020 12:26:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krKH3-0004Tc-37; Mon, 21 Dec 2020 12:26:50 +0000
X-UUID: 7207f3c676634789a5c1fae1bb045cfe-20201221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cFqLngaxRBy4C0jgEc0ZPadN/J2gtYyip0VvgRY9bPw=; 
 b=kZrHhHiNWjFT50MrFy/Tdc8fpfdLu9jV2XJiG2OyB99cSy6RopOnTwb+SXHzunCtbuw2/6YKnpd73lZ8Vzsq2nSNKyxrvyIe/k9W1MTmJM0hIAav38bwZ+G7C3uVbQBtR/qxFHHr9skkuxP0BSEYtC9g7mkzIHQ3hft5+H2+JjM=;
X-UUID: 7207f3c676634789a5c1fae1bb045cfe-20201221
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 571030527; Mon, 21 Dec 2020 04:26:41 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 04:26:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 20:26:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Dec 2020 20:26:35 +0800
From: <qii.wang@mediatek.com>
To: <robh+dt@kernel.org>
Subject: [PATCH] arm64: dts: mediatek: Correct i2c clock of MT8192
Date: Mon, 21 Dec 2020 20:26:30 +0800
Message-ID: <1608553590-26459-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_072649_329863_DACFD496 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qii Wang <qii.wang@mediatek.com>

imp wrapper clock is the i2c source clock of MT8192

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 43 ++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index faea0d9..9c194a8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -17,6 +17,19 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+	};
+
 	clk26m: oscillator0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -593,7 +606,8 @@
 			reg = <0 0x11cb0000 0 0x1000>,
 			      <0 0x10217300 0 0x80>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_e CLK_IMP_IIC_WRAP_E_I2C3>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -612,7 +626,8 @@
 			reg = <0 0x11d00000 0 0x1000>,
 			      <0 0x10217600 0 0x180>;
 			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C7>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -625,7 +640,8 @@
 			reg = <0 0x11d01000 0 0x1000>,
 			      <0 0x10217780 0 0x180>;
 			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C8>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -638,7 +654,8 @@
 			reg = <0 0x11d02000 0 0x1000>,
 			      <0 0x10217900 0 0x180>;
 			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C9>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -657,7 +674,8 @@
 			reg = <0 0x11d20000 0 0x1000>,
 			      <0 0x10217100 0 0x80>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C1>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -670,7 +688,8 @@
 			reg = <0 0x11d21000 0 0x1000>,
 			      <0 0x10217180 0 0x180>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C2>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -683,7 +702,8 @@
 			reg = <0 0x11d22000 0 0x1000>,
 			      <0 0x10217380 0 0x180>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C4>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -702,7 +722,8 @@
 			reg = <0 0x11e00000 0 0x1000>,
 			      <0 0x10217500 0 0x80>;
 			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C5>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -721,7 +742,8 @@
 			reg = <0 0x11f00000 0 0x1000>,
 			      <0 0x10217080 0 0x80>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_n CLK_IMP_IIC_WRAP_N_I2C0>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -734,7 +756,8 @@
 			reg = <0 0x11f01000 0 0x1000>,
 			      <0 0x10217580 0 0x80>;
 			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_n CLK_IMP_IIC_WRAP_N_I2C6>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
