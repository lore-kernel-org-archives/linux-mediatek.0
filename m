Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41A6C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 07:26:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93ED524679
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 07:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PYVuTf5t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WrxN47Ko"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93ED524679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TeQOLm1hHhOvKUCuPlfrECBGdcgySKZg+834yfrFyfU=; b=PYVuTf5tQMjVBk
	U+xqrhgh1w5cQa2VNCmJrOkVb1IBLgwWD5Komn7D4Y4f0DyC+2JBwWk5dak4O4N8TGWS3UAABncRI
	zwMbCiEqVHHmFVWsAoaFx++Q1f6IzAPiIrS5XWjzzd2yk9o2nfwx+/9ay9pd8D53sjaK8Gir7Con+
	s0l3QcNtagqOSeCaBU9wSkHcxIrN+2uTPIRRvcQzW4z4zibCeDYdQ3oZDw/cG3JEiPwf1+KzPzZhp
	vhnRbQSkRsxkFUOtICq4Tz4y7wMW5t5gxTMlSSzmxeL7QnegoELR+l0PQSFKPAfH/mEOtqBmHoQEx
	CN+FR76XLhEJYVO/NWiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiCgR-0006hf-Hy; Fri, 20 Dec 2019 07:26:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiCgI-0006Zf-4a; Fri, 20 Dec 2019 07:26:39 +0000
X-UUID: b4d7ae54febb4bad9e3e40f08f081e11-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Tc6KipBfJ83kRG9vAwXIxq6v7tqQRuJjm3Rc3+f5bAY=; 
 b=WrxN47KoIVYvE9httmU/8REvCIw3iGxjJDnxoR1tn7bP2NmGQzGhMsyjxJcoCRHIkNzuZCXkpUk26VdIAWPDFHW6pPAxAQHO03YAdc2ez2yGWmH0bibw1Pt/BwCzuWZbmPGo6Xc56riOXGdijW8IKZaqj9FytKXTQhFs9WXNWT0=;
X-UUID: b4d7ae54febb4bad9e3e40f08f081e11-20191219
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 319296074; Thu, 19 Dec 2019 23:26:32 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 23:26:52 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 15:26:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Dec 2019 15:25:51 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>
Subject: [PATCH V3] arm64: dts: mediatek: add cpufreq and cci devfreq nodes
 for mt8183
Date: Fri, 20 Dec 2019 15:26:25 +0800
Message-ID: <1576826785-3867-1-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_232638_193026_DEFAB0A4 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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
Cc: srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

add cpufreq and cci devfreq nodes for mt8183

Depend on regulator node patch:
https://patchwork.kernel.org/patch/11284617/

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts |  36 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 245 ++++++++++++++++++++++++++++
 2 files changed, 281 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 1fb195c..ca5c0b2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -231,6 +231,42 @@
 
 };
 
+&cci {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu0 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu4 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
+&cpu5 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
+&cpu6 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
+&cpu7 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 10b3247..d260a5a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -31,6 +31,219 @@
 		i2c11 = &i2c11;
 	};
 
+	cluster0_opp: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp00 {
+			opp-hz = /bits/ 64 <793000000>;
+			opp-microvolt = <650000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <687500>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-microvolt = <718750>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <1131000000>;
+			opp-microvolt = <756250>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <800000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1326000000>;
+			opp-microvolt = <818750>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1417000000>;
+			opp-microvolt = <850000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1508000000>;
+			opp-microvolt = <868750>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <893750>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <1625000000>;
+			opp-microvolt = <906250>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <1677000000>;
+			opp-microvolt = <931250>;
+		};
+		opp11 {
+			opp-hz = /bits/ 64 <1716000000>;
+			opp-microvolt = <943750>;
+		};
+		opp12 {
+			opp-hz = /bits/ 64 <1781000000>;
+			opp-microvolt = <975000>;
+		};
+		opp13 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <1000000>;
+		};
+		opp14 {
+			opp-hz = /bits/ 64 <1924000000>;
+			opp-microvolt = <1025000>;
+		};
+		opp15 {
+			opp-hz = /bits/ 64 <1989000000>;
+			opp-microvolt = <1050000>;
+		};	};
+
+	cluster1_opp: opp_table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp00 {
+			opp-hz = /bits/ 64 <793000000>;
+			opp-microvolt = <700000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <725000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-microvolt = <750000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <1131000000>;
+			opp-microvolt = <775000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <800000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1326000000>;
+			opp-microvolt = <825000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1417000000>;
+			opp-microvolt = <850000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1508000000>;
+			opp-microvolt = <875000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <900000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <1625000000>;
+			opp-microvolt = <912500>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <1677000000>;
+			opp-microvolt = <931250>;
+		};
+		opp11 {
+			opp-hz = /bits/ 64 <1716000000>;
+			opp-microvolt = <950000>;
+		};
+		opp12 {
+			opp-hz = /bits/ 64 <1781000000>;
+			opp-microvolt = <975000>;
+		};
+		opp13 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <1000000>;
+		};
+		opp14 {
+			opp-hz = /bits/ 64 <1924000000>;
+			opp-microvolt = <1025000>;
+		};
+		opp15 {
+			opp-hz = /bits/ 64 <1989000000>;
+			opp-microvolt = <1050000>;
+		};
+	};
+
+	cci_opp: opp_table2 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp00 {
+			opp-hz = /bits/ 64 <273000000>;
+			opp-microvolt = <650000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <338000000>;
+			opp-microvolt = <687500>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <403000000>;
+			opp-microvolt = <718750>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <463000000>;
+			opp-microvolt = <756250>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <546000000>;
+			opp-microvolt = <800000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <624000000>;
+			opp-microvolt = <818750>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <689000000>;
+			opp-microvolt = <850000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <767000000>;
+			opp-microvolt = <868750>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <845000000>;
+			opp-microvolt = <893750>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <871000000>;
+			opp-microvolt = <906250>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <923000000>;
+			opp-microvolt = <931250>;
+		};
+		opp11 {
+			opp-hz = /bits/ 64 <962000000>;
+			opp-microvolt = <943750>;
+		};
+		opp12 {
+			opp-hz = /bits/ 64 <1027000000>;
+			opp-microvolt = <975000>;
+		};
+		opp13 {
+			opp-hz = /bits/ 64 <1092000000>;
+			opp-microvolt = <1000000>;
+		};
+		opp14 {
+			opp-hz = /bits/ 64 <1144000000>;
+			opp-microvolt = <1025000>;
+		};
+		opp15 {
+			opp-hz = /bits/ 64 <1196000000>;
+			opp-microvolt = <1050000>;
+		};
+	};
+
+	cci: cci {
+		compatible = "mediatek,mt8183-cci";
+		clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
+		clock-names = "cci_clock";
+		operating-points-v2 = <&cci_opp>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -73,6 +286,10 @@
 			reg = <0x000>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@1 {
@@ -81,6 +298,10 @@
 			reg = <0x001>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@2 {
@@ -89,6 +310,10 @@
 			reg = <0x002>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@3 {
@@ -97,6 +322,10 @@
 			reg = <0x003>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu4: cpu@100 {
@@ -105,6 +334,10 @@
 			reg = <0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		cpu5: cpu@101 {
@@ -113,6 +346,10 @@
 			reg = <0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		cpu6: cpu@102 {
@@ -121,6 +358,10 @@
 			reg = <0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		cpu7: cpu@103 {
@@ -129,6 +370,10 @@
 			reg = <0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				 <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 		};
 	};
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
