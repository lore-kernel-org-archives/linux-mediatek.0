Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD68C11F68
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 10:03:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32FF619A2
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 10:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E32FF619A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKTG+RxKyT6fY9uh+gD8Uk2Qo6rHhnQrVuoS4pGl4OY=; b=mpbxLIurk9XuX1
	JEWXI+WwOU1S4c83QnszLykff15mI3Nk91ql7aCOTOXixDBo2/QzZxk4hrYF5gb9NfyqAhd/09vFh
	lXPauGNWArIMbjQTcEwCzz0joCuZ747G0tk/uuAN67l75VnE5laIHFbRqbl5U1AwLst8wAROpLrQK
	/iVFzMMQE5WQ7wcw/qh1YWGcGQccdIpg8/esMj2SyQpHHnhGqz6+mxisAdzWLg3OK3Ky9e3z6UGBd
	HhI60LYu2yZGj2oFtdf2e7ehyPzJ7lnl22EbqzABAghivxnIUS1/w2qDe136GHN53Yk1JbuNgmgAc
	JyP1g1nAeZxcNJaPt9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0hvb-00Az27-0C; Tue, 06 Jul 2021 10:03:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0hvX-00Az0k-QT; Tue, 06 Jul 2021 10:03:41 +0000
X-UUID: 261d6063eb2e4e4898bcad23ea00fee9-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TafH/hLCTcHfip7DDQgLdja/2FizC5+U+dJJcYkk55o=; 
 b=YgnBL8yFmzIL/uReFZ2CQOEHScRFnrix1x2iLY5gygsoma1X1X/x9/ldV3/tYCxOHmQVvmrdk0Hvo1BreEwtdcbBvDPiLT6wocQH4ZdLv/vGi+otbxh2O7jpq7OjibdKsqd+EkJmRjknX6meifjurWszs/JjjE3RN/wPz2BsQow=;
X-UUID: 261d6063eb2e4e4898bcad23ea00fee9-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 637734837; Tue, 06 Jul 2021 03:03:31 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 02:56:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 17:56:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 6 Jul 2021 17:56:42 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Nicolas Boichat <drinkcat@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [v5 1/2] arm64: dts: mediatek: Add mt8192 clock controllers
Date: Tue, 6 Jul 2021 17:56:13 +0800
Message-ID: <20210706095614.25603-2-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210706095614.25603-1-chun-jie.chen@mediatek.com>
References: <20210706095614.25603-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_030339_917622_DD53C875 
X-CRM114-Status: GOOD (  10.54  )
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
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
Due to mmsys and audsys device not only a clock controller but also
trigger the mm and audio subsystem to initialize, so modify these
to "syscon" node
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 163 +++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9757138a8bbd..c7c7d4e017ae 100644
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
 
+		scp_adsp: clock-controller@10720000 {
+			compatible = "mediatek,mt8192-scp_adsp";
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
 
+		imp_iic_wrap_c: clock-controller@11007000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_c";
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
 
+		audsys: clock-controller@11210000 {
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
 
+		imp_iic_wrap_e: clock-controller@11cb1000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_e";
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
 
+		imp_iic_wrap_s: clock-controller@11d03000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_s";
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
 
+		imp_iic_wrap_ws: clock-controller@11d23000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_ws";
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
 
+		imp_iic_wrap_w: clock-controller@11e01000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_w";
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
+		imp_iic_wrap_n: clock-controller@11f02000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_n";
+			reg = <0 0x11f02000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		msdc_top: clock-controller@11f10000 {
+			compatible = "mediatek,mt8192-msdc_top";
+			reg = <0 0x11f10000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		msdc: clock-controller@11f60000 {
+			compatible = "mediatek,mt8192-msdc";
+			reg = <0 0x11f60000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mfgcfg: clock-controller@13fbf000 {
+			compatible = "mediatek,mt8192-mfgcfg";
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
+		imgsys: clock-controller@15020000 {
+			compatible = "mediatek,mt8192-imgsys";
+			reg = <0 0x15020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys2: clock-controller@15820000 {
+			compatible = "mediatek,mt8192-imgsys2";
+			reg = <0 0x15820000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys_soc: clock-controller@1600f000 {
+			compatible = "mediatek,mt8192-vdecsys_soc";
+			reg = <0 0x1600f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys: clock-controller@1602f000 {
+			compatible = "mediatek,mt8192-vdecsys";
+			reg = <0 0x1602f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: clock-controller@17000000 {
+			compatible = "mediatek,mt8192-vencsys";
+			reg = <0 0x17000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys: clock-controller@1a000000 {
+			compatible = "mediatek,mt8192-camsys";
+			reg = <0 0x1a000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawa: clock-controller@1a04f000 {
+			compatible = "mediatek,mt8192-camsys_rawa";
+			reg = <0 0x1a04f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawb: clock-controller@1a06f000 {
+			compatible = "mediatek,mt8192-camsys_rawb";
+			reg = <0 0x1a06f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawc: clock-controller@1a08f000 {
+			compatible = "mediatek,mt8192-camsys_rawc";
+			reg = <0 0x1a08f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		ipesys: clock-controller@1b000000 {
+			compatible = "mediatek,mt8192-ipesys";
+			reg = <0 0x1b000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mdpsys: clock-controller@1f000000 {
+			compatible = "mediatek,mt8192-mdpsys";
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
