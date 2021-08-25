Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A3FC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6275961206
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6275961206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTk64VieVIiZEYSj1UJFNGx5yw1bWHqMruIBZl7y2yo=; b=ccd8tPWN484SZN
	r55X78BKtZ3K9WjP2tMdgIHsV78WxtB27h/AICY0LY9OijZozMA0GpEBgG5dx0CU7X31Lsbj+9YT5
	rKQCLJaTpi7urQwMkfftpTcWpF+Hv1gJwY6jH7v0oWhS6mmr4EoVxzuIHD3UMtLY97KuKmFlh5ivP
	2QI99wS0u9RpKzBBKHBOPpuBp/Mvv7Ve4b2T57tqanyFRD9lUoicCeCPyepIVhqgz6q0Hflvr9FWA
	t0QpaearyXb2vbQqoQ4gL9Mb6PBFzxCCkhgbYOXXFRW+Vy+HDmfCOl5xFP75HPmPO09933S0PJ11q
	9DF4SumqE9NLpa3ns8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIhTT-0052h3-2D; Wed, 25 Aug 2021 01:13:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIhSQ-00528v-UD; Wed, 25 Aug 2021 01:12:00 +0000
X-UUID: 8e702da7e323410e8cf4c89b0a2006a0-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GyBC5dX6ZaSwRkhyf+LS/jwlWkBMyQwsFP15bR2dBSY=; 
 b=TyQvNqK4JwuY1+GS9o98cNLVS+hooDrezCLSnsEI0gXtJDFMiYIHVoryrqc2csPah0goC3+18DPz2zwDfYqPhtjGIvKFoLNOzGXjt/K84XORVsSGIClsao/g9Woh7xNGOskq279BBWC+DRXhawLw7ajNr2o5m4/D8KkKDzFcX7I=;
X-UUID: 8e702da7e323410e8cf4c89b0a2006a0-20210824
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 392707835; Tue, 24 Aug 2021 18:11:57 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:11:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 09:11:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 09:11:53 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v1 5/5] arm64: dts: mediatek: Correct I2C clock of MT8192
Date: Wed, 25 Aug 2021 09:11:20 +0800
Message-ID: <20210825011120.30481-6-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
References: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_181159_028492_490C8C0D 
X-CRM114-Status: GOOD (  10.12  )
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

update i2c 0 ~ 9 clocks to the real ones.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 30 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index db6f4c6dc404..866b04e78690 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -484,7 +484,8 @@
 			reg = <0 0x11cb0000 0 0x1000>,
 			      <0 0x10217300 0 0x80>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_e CLK_IMP_IIC_WRAP_E_I2C3>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -503,7 +504,8 @@
 			reg = <0 0x11d00000 0 0x1000>,
 			      <0 0x10217600 0 0x180>;
 			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C7>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -516,7 +518,8 @@
 			reg = <0 0x11d01000 0 0x1000>,
 			      <0 0x10217780 0 0x180>;
 			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C8>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -529,7 +532,8 @@
 			reg = <0 0x11d02000 0 0x1000>,
 			      <0 0x10217900 0 0x180>;
 			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C9>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -548,7 +552,8 @@
 			reg = <0 0x11d20000 0 0x1000>,
 			      <0 0x10217100 0 0x80>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C1>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -561,7 +566,8 @@
 			reg = <0 0x11d21000 0 0x1000>,
 			      <0 0x10217180 0 0x180>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C2>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -574,7 +580,8 @@
 			reg = <0 0x11d22000 0 0x1000>,
 			      <0 0x10217380 0 0x180>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C4>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -593,7 +600,8 @@
 			reg = <0 0x11e00000 0 0x1000>,
 			      <0 0x10217500 0 0x80>;
 			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C5>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -612,7 +620,8 @@
 			reg = <0 0x11f00000 0 0x1000>,
 			      <0 0x10217080 0 0x80>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_n CLK_IMP_IIC_WRAP_N_I2C0>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -625,7 +634,8 @@
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
