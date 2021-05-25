Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50829C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 13:42:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B16F61420
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 13:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B16F61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUSY3DEPZGLBuGdf9X5VdA21pbtTH0p5u3X0xkqSxaE=; b=F6E4to9Jdqw+rv
	s7FuzxKfgkVO3TZhqZusjoA3tqw6+heBWlf4MAAEPDwEtLZsq3AYa3IR7w4AEA0MuFsJXdTKQstl2
	bNyk9ub52/x1MAgf3xOErhLHwyYQyyugqz+y9Tf+4tZu1xoe/sx+8qA8C02n2Bq671PMC3V4eINZO
	JmT7CLZUlddf8u5G2sLcwHACSL2wnMBVJU8dU/hvKCscfyxgb8NsZtJTPidjGNPu9IxDisLAZtkrK
	T974TcWf9DZWLxpBPYpPdFn1HSX7JKyM/atA/jmyn4F1ipiRNod7RrJdkZHtOZccNCz6PxcA1YyaT
	7LV3hAJTSRLIfJM5S7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llXKW-005PNQ-MS; Tue, 25 May 2021 13:42:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llXDs-005MoG-LN; Tue, 25 May 2021 13:35:54 +0000
X-UUID: e54b10b3d8a640699fa45448e72c3dbf-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HIIzq1pF87lNHd3yJ+wUwuPiY3MjAvK8HQhswHbgotw=; 
 b=oqVeq4WiKy6VF+hLJLm9Gl/beaJmDdvI9hpUTF0krT1S047/gIXD5Pqy9u0QP5waob7Lv/ds7uCCvq1VQOCcgq0SvHDx0KYCYBBRcWUc1WeyV8IdjFEmYgOuQ6ERZgnJ303Uh5VVog/k1i5gaUs9mVHrp0k50b2cv/MXZMoV9s0=;
X-UUID: e54b10b3d8a640699fa45448e72c3dbf-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 93657002; Tue, 25 May 2021 06:35:50 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 06:25:48 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 21:25:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 May 2021 21:25:46 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, "chun-jie . chen" <chun-jie.chen@mediatek.com>
Subject: [v3 1/2] arm64: dts: mediatek: Add mt8192 clock controllers
Date: Tue, 25 May 2021 21:24:58 +0800
Message-ID: <20210525132459.8741-2-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210525132459.8741-1-chun-jie.chen@mediatek.com>
References: <20210525132459.8741-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_063552_756433_E8955936 
X-CRM114-Status: GOOD (  10.43  )
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

Add clock controller nodes for SoC mt8192

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 163 +++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9757138a8bbd..ffd0fe331bdc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -5,6 +5,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/clock/mt8192-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
@@ -257,6 +258,24 @@
 			};
 		};
 
+		topckgen: syscon@10000000 {
+			compatible = "mediatek,mt8192-topckgen", "syscon";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg: syscon@10001000 {
+			compatible = "mediatek,mt8192-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pericfg: syscon@10003000 {
+			compatible = "mediatek,mt8192-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8192-pinctrl";
 			reg = <0 0x10005000 0 0x1000>,
@@ -282,6 +301,12 @@
 			#interrupt-cells = <2>;
 		};
 
+		apmixedsys: syscon@1000c000 {
+			compatible = "mediatek,mt8192-apmixedsys", "syscon";
+			reg = <0 0x1000c000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		systimer: timer@10017000 {
 			compatible = "mediatek,mt8192-timer",
 				     "mediatek,mt6765-timer";
@@ -291,6 +316,12 @@
 			clock-names = "clk13m";
 		};
 
+		scp_adsp: syscon@10720000 {
+			compatible = "mediatek,mt8192-scp_adsp", "syscon";
+			reg = <0 0x10720000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt8192-uart",
 				     "mediatek,mt6577-uart";
@@ -311,6 +342,12 @@
 			status = "disabled";
 		};
 
+		imp_iic_wrap_c: syscon@11007000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
+			reg = <0 0x11007000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		spi0: spi@1100a000 {
 			compatible = "mediatek,mt8192-spi",
 				     "mediatek,mt6765-spi";
@@ -436,6 +473,12 @@
 			status = "disable";
 		};
 
+		audsys: syscon@11210000 {
+			compatible = "mediatek,mt8192-audsys", "syscon";
+			reg = <0 0x11210000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		i2c3: i2c3@11cb0000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11cb0000 0 0x1000>,
@@ -449,6 +492,12 @@
 			status = "disabled";
 		};
 
+		imp_iic_wrap_e: syscon@11cb1000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_e", "syscon";
+			reg = <0 0x11cb1000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		i2c7: i2c7@11d00000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d00000 0 0x1000>,
@@ -488,6 +537,12 @@
 			status = "disabled";
 		};
 
+		imp_iic_wrap_s: syscon@11d03000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_s", "syscon";
+			reg = <0 0x11d03000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		i2c1: i2c1@11d20000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11d20000 0 0x1000>,
@@ -527,6 +582,12 @@
 			status = "disabled";
 		};
 
+		imp_iic_wrap_ws: syscon@11d23000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_ws", "syscon";
+			reg = <0 0x11d23000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		i2c5: i2c5@11e00000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11e00000 0 0x1000>,
@@ -540,6 +601,12 @@
 			status = "disabled";
 		};
 
+		imp_iic_wrap_w: syscon@11e01000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_w", "syscon";
+			reg = <0 0x11e01000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		i2c0: i2c0@11f00000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11f00000 0 0x1000>,
@@ -565,5 +632,101 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		imp_iic_wrap_n: syscon@11f02000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_n", "syscon";
+			reg = <0 0x11f02000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		msdc_top: syscon@11f10000 {
+			compatible = "mediatek,mt8192-msdc_top", "syscon";
+			reg = <0 0x11f10000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		msdc: syscon@11f60000 {
+			compatible = "mediatek,mt8192-msdc", "syscon";
+			reg = <0 0x11f60000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mfgcfg: syscon@13fbf000 {
+			compatible = "mediatek,mt8192-mfgcfg", "syscon";
+			reg = <0 0x13fbf000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8192-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys: syscon@15020000 {
+			compatible = "mediatek,mt8192-imgsys", "syscon";
+			reg = <0 0x15020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys2: syscon@15820000 {
+			compatible = "mediatek,mt8192-imgsys2", "syscon";
+			reg = <0 0x15820000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys_soc: syscon@1600f000 {
+			compatible = "mediatek,mt8192-vdecsys_soc", "syscon";
+			reg = <0 0x1600f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys: syscon@1602f000 {
+			compatible = "mediatek,mt8192-vdecsys", "syscon";
+			reg = <0 0x1602f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: syscon@17000000 {
+			compatible = "mediatek,mt8192-vencsys", "syscon";
+			reg = <0 0x17000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys: syscon@1a000000 {
+			compatible = "mediatek,mt8192-camsys", "syscon";
+			reg = <0 0x1a000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawa: syscon@1a04f000 {
+			compatible = "mediatek,mt8192-camsys_rawa", "syscon";
+			reg = <0 0x1a04f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawb: syscon@1a06f000 {
+			compatible = "mediatek,mt8192-camsys_rawb", "syscon";
+			reg = <0 0x1a06f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawc: syscon@1a08f000 {
+			compatible = "mediatek,mt8192-camsys_rawc", "syscon";
+			reg = <0 0x1a08f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		ipesys: syscon@1b000000 {
+			compatible = "mediatek,mt8192-ipesys", "syscon";
+			reg = <0 0x1b000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mdpsys: syscon@1f000000 {
+			compatible = "mediatek,mt8192-mdpsys", "syscon";
+			reg = <0 0x1f000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
