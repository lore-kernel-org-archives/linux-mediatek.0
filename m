Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216CBC48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D728A610C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D728A610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2JvDxGFfK1q9Zd2HTL6JNRun3kD734rpzA2YiX5dKo=; b=Y8IY2C7t74HHup
	t943gSb11khUAnx+t4Dl8or8WhwRsuVqXFe0QTU3eQlc1lVDwyfjrXs/WNySL7Bh61SIhIi41m1ns
	dUsk95za+1RrcPhHYbdVTQ18N8zF3sartMgWSIxe6D7Wmz+5bChZr7VR6YH3KeYC98OqdcRlJJay9
	jxSuZSO0H59qVc0WgkAJ6da/yUqNt9+Z1oe8WuhtEYFa7ie9iwq8cSjhodkpiIKHUf6EQwdQLJytg
	pluS55jzzkXgBZoeY0ZVgvEIM+m2OMb6zFESumP0KUuz/KIROpRPRqoT0D9fj7koiZUGpKPm2kBSF
	/v2S36f68upE75KSjqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGeT-003AZO-Hh; Tue, 15 Jun 2021 21:31:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvv-001lPz-J9; Tue, 15 Jun 2021 17:33:05 +0000
X-UUID: 15ac9ae8bb854b0b99a861512cb7b9af-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kfc7u0FGaZ78x7zc6mqWVuZqh0UXEbSQgeL6fxCvljY=; 
 b=AUgLzAaWyB5yJ409HSzqi9AqJd8fsLZapkn7bWf7Od9Tpm90mTxPHyy1SXvruCcb9zp3ZLROJaYgDrQAmv8JD+/6gplmG2JoEaVR70h5vok4s+dKYTN+JWlTaCxFhoAnlZurKVJC3JKZ1o3t2VEkMtKIQzxvaAiL56zdQaSO96k=;
X-UUID: 15ac9ae8bb854b0b99a861512cb7b9af-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2133331265; Tue, 15 Jun 2021 10:32:52 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:43 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>
Subject: [PATCH 06/27] arm64: dts: mt8195: add clock controllers
Date: Wed, 16 Jun 2021 01:32:12 +0800
Message-ID: <20210615173233.26682-6-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103303_757175_BDDF1850 
X-CRM114-Status: GOOD (  11.11  )
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

From: Weiyi Lu <weiyi.lu@mediatek.com>

Add clock controller nodes for SoC mt8195

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 215 ++++++++++++++++++++++-
 1 file changed, 213 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 965445d07e92..7946a13fcbc3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/clock/mt8195-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
@@ -275,8 +276,14 @@
 			};
 		};
 
-		infracfg: syscon@10001000 {
-			compatible = "mediatek,mt8195-infracfg", "syscon", "simple-mfd";
+		topckgen: syscon@10000000 {
+			compatible = "mediatek,mt8195-topckgen", "syscon";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg_ao: infracfg_ao@10001000 {
+			compatible = "mediatek,mt8195-infracfg_ao", "syscon", "simple-mfd";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
 
@@ -315,6 +322,12 @@
 			reg = <0 0x10007000 0 0x100>;
 		};
 
+		apmixedsys: syscon@1000c000 {
+			compatible = "mediatek,mt8195-apmixedsys", "syscon";
+			reg = <0 0x1000c000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		systimer: timer@10017000 {
 			compatible = "mediatek,mt8195-timer", "mediatek,mt6765-timer";
 			reg = <0 0x10017000 0 0x1000>;
@@ -349,6 +362,30 @@
 			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC_D10>;
 		};
 
+		nnasys: syscon@10211000 {
+			compatible = "mediatek,mt8195-nnasys", "syscon";
+			reg = <0 0x10211000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		scp_adsp: syscon@10720000 {
+			compatible = "mediatek,mt8195-scp_adsp", "syscon";
+			reg = <0 0x10720000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		audsys: syscon@10890000 {
+			compatible = "mediatek,mt8195-audsys", "syscon";
+			reg = <0 0x10890000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		audsys_src: syscon@108a0000 {
+			compatible = "mediatek,mt8195-audsys_src", "syscon";
+			reg = <0 0x108a0000 0 0x2000>;
+			#clock-cells = <1>;
+		};
+
 		uart0: serial@11001100 {
 			compatible = "mediatek,mt8195-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11001100 0 0x100>;
@@ -411,6 +448,12 @@
 			status = "disabled";
 		};
 
+		pericfg_ao: syscon@11003000 {
+			compatible = "mediatek,mt8195-pericfg_ao", "syscon";
+			reg = <0 0x11003000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
 			reg = <0 0x11230000 0 0x10000>,
@@ -472,6 +515,18 @@
 			};
 		};
 
+		imp_iic_wrap_s: syscon@11d03000 {
+			compatible = "mediatek,mt8195-imp_iic_wrap_s", "syscon";
+			reg = <0 0x11d03000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imp_iic_wrap_w: syscon@11e05000 {
+			compatible = "mediatek,mt8195-imp_iic_wrap_w", "syscon";
+			reg = <0 0x11e05000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		u3phy1: t-phy@11e30000 {
 			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
@@ -524,5 +579,161 @@
 			#phy-cells = <0>;
 			status = "disabled";
 		};
+
+		mfgcfg: syscon@13fbf000 {
+			compatible = "mediatek,mt8195-mfgcfg", "syscon";
+			reg = <0 0x13fbf000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vppsys0: syscon@14000000 {
+			compatible = "mediatek,mt8195-vppsys0", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		wpesys: syscon@14e00000 {
+			compatible = "mediatek,mt8195-wpesys", "syscon";
+			reg = <0 0x14e00000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		wpesys_vpp0: syscon@14e02000 {
+			compatible = "mediatek,mt8195-wpesys_vpp0", "syscon";
+			reg = <0 0x14e02000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		wpesys_vpp1: syscon@14e03000 {
+			compatible = "mediatek,mt8195-wpesys_vpp1", "syscon";
+			reg = <0 0x14e03000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vppsys1: syscon@14f00000 {
+			compatible = "mediatek,mt8195-vppsys1", "syscon";
+			reg = <0 0x14f00000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys: syscon@15000000 {
+			compatible = "mediatek,mt8195-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys1_dip_top: syscon@15110000 {
+			compatible = "mediatek,mt8195-imgsys1_dip_top", "syscon";
+			reg = <0 0x15110000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys1_dip_nr: syscon@15130000 {
+			compatible = "mediatek,mt8195-imgsys1_dip_nr", "syscon";
+			reg = <0 0x15130000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys1_wpe: syscon@15220000 {
+			compatible = "mediatek,mt8195-imgsys1_wpe", "syscon";
+			reg = <0 0x15220000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		ipesys: syscon@15330000 {
+			compatible = "mediatek,mt8195-ipesys", "syscon";
+			reg = <0 0x15330000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys: syscon@16000000 {
+			compatible = "mediatek,mt8195-camsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawa: syscon@1604f000 {
+			compatible = "mediatek,mt8195-camsys_rawa", "syscon";
+			reg = <0 0x1604f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_yuva: syscon@1606f000 {
+			compatible = "mediatek,mt8195-camsys_yuva", "syscon";
+			reg = <0 0x1606f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawb: syscon@1608f000 {
+			compatible = "mediatek,mt8195-camsys_rawb", "syscon";
+			reg = <0 0x1608f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_yuvb: syscon@160af000 {
+			compatible = "mediatek,mt8195-camsys_yuvb", "syscon";
+			reg = <0 0x160af000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_mraw: syscon@16140000 {
+			compatible = "mediatek,mt8195-camsys_mraw", "syscon";
+			reg = <0 0x16140000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		ccusys: syscon@17200000 {
+			compatible = "mediatek,mt8195-ccusys", "syscon";
+			reg = <0 0x17200000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys_soc: syscon@1800f000 {
+			compatible = "mediatek,mt8195-vdecsys_soc", "syscon";
+			reg = <0 0x1800f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys: syscon@1802f000 {
+			compatible = "mediatek,mt8195-vdecsys", "syscon";
+			reg = <0 0x1802f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys_core1: syscon@1803f000 {
+			compatible = "mediatek,mt8195-vdecsys_core1", "syscon";
+			reg = <0 0x1803f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		apusys_pll: syscon@190f3000 {
+			compatible = "mediatek,mt8195-apusys_pll", "syscon";
+			reg = <0 0x190f3000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: syscon@1a000000 {
+			compatible = "mediatek,mt8195-vencsys", "syscon";
+			reg = <0 0x1a000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys_core1: syscon@1b000000 {
+			compatible = "mediatek,mt8195-vencsys_core1", "syscon";
+			reg = <0 0x1b000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdosys0: syscon@1c01a000 {
+			compatible = "mediatek,mt8195-vdosys0", "syscon";
+			reg = <0 0x1c01a000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdosys1: syscon@1c100000 {
+			compatible = "mediatek,mt8195-vdosys1", "syscon";
+			reg = <0 0x1c100000 0 0x1000>;
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
