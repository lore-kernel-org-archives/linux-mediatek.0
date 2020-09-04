Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C76C28E83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:45:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFD7206B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:45:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zNCgGGZn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Axx6EAVB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFD7206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B+XMc0CjKSiOChrKEaYR/CVFHkdL0hmKYLIS1Hre7TA=; b=zNCgGGZnhe/lwI7Jjv2KRurB3
	s+Mmw/dl4c7nC7GkxBIuLXCijjmDvgRjBiVXtJOTaijK95R24EJHEXx3qX/9sSoO48xBCi2YHLDjE
	HEfavNaau8sMeI2+4sHa1IXrMpzBuCh9tFoZiq2nigGTby9rOHt00KKrkOlK9FMaKG3hUPTR40bBD
	Czc7fyZECLaTXrPaWXhYGyn5vUTdMbEhgf8TE3fkvRTiX0H9C2no9DF8t+6868wqVXVwIw5s8EZUi
	YCGVKPoS2tKeu1m0iQ6iICHdBp6N1pQnmVPt3sCKgOssXlG3KtctDXsgVLaMRcPLi0KmDJSaCalel
	A/hjfwXeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE5TS-00033F-N5; Fri, 04 Sep 2020 06:45:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE5TB-0002w6-L4; Fri, 04 Sep 2020 06:45:11 +0000
X-UUID: 94e208e875484f0eac2a1aa504a9b09b-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZdGMDv5zUYGYyGcwMpbNr1XEOrUasDU8u/ZAe2/IJL4=; 
 b=Axx6EAVBmO1AM8mrH68PBSkVDb7n/BBmjascqOFdJN9qHCozIDplTxXuecOJuOvsOmjkR8QERUDcoXRA1UF5rh+bhUWTNAelMNRP+5M7kOHuHpqN9I5cexQEGDiRD8NDsWZZtujRn+dXmkoNRWRgbszUritcxPBwl1Js2LQQI3s=;
X-UUID: 94e208e875484f0eac2a1aa504a9b09b-20200903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2076919662; Thu, 03 Sep 2020 22:44:59 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 23:44:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 14:44:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Sep 2020 14:44:55 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH 3/3] arm64: dts: Add power controller device node of MT8192
Date: Fri, 4 Sep 2020 14:44:55 +0800
Message-ID: <1599201895-11013-4-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
References: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_024509_853846_F133536A 
X-CRM114-Status: GOOD (  12.74  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power controller node for MT8192.
In scpsys node, it contains clocks and regmapping of
infracfg for bus protection.
And list all the power domains of MT8192 under scpsys node
to show the dependency between each other through hierarchical
structure.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 148 +++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index b3fab4f..be90137 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
+#include <dt-bindings/power/mt8192-power.h>
 
 / {
 	compatible = "mediatek,mt8192";
@@ -257,6 +258,153 @@
 			#interrupt-cells = <2>;
 		};
 
+		scpsys: power-controller@10006000 {
+			compatible = "mediatek,mt8192-scpsys", "syscon";
+			reg = <0 0x10006000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+				 <&infracfg CLK_INFRA_AUDIO_26M_B>,
+				 <&infracfg CLK_INFRA_AUDIO>,
+				 <&infracfg CLK_INFRA_PMIC_CONN>,
+				 <&topckgen CLK_TOP_MFG_PLL_SEL>,
+				 <&topckgen CLK_TOP_DISP_SEL>,
+				 <&infracfg CLK_INFRA_DEVICE_APC_SYNC>,
+				 <&topckgen CLK_TOP_IPE_SEL>,
+				 <&topckgen CLK_TOP_IMG1_SEL>,
+				 <&topckgen CLK_TOP_IMG2_SEL>,
+				 <&topckgen CLK_TOP_MDP_SEL>,
+				 <&topckgen CLK_TOP_VENC_SEL>,
+				 <&topckgen CLK_TOP_VDEC_SEL>,
+				 <&topckgen CLK_TOP_CAM_SEL>;
+			clock-names = "audio", "audio1", "audio2", "conn", "mfg",
+				      "disp", "disp1", "ipe", "isp", "isp1",
+				      "mdp", "venc", "vdec", "cam";
+			infracfg = <&infracfg>;
+			#power-domain-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			audio@MT8192_POWER_DOMAIN_AUDIO {
+				reg = <MT8192_POWER_DOMAIN_AUDIO>;
+			};
+
+			conn@MT8192_POWER_DOMAIN_CONN {
+				reg = <MT8192_POWER_DOMAIN_CONN>;
+			};
+
+			mfg@MT8192_POWER_DOMAIN_MFG0 {
+				reg = <MT8192_POWER_DOMAIN_MFG0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mfg1@MT8192_POWER_DOMAIN_MFG1 {
+					reg = <MT8192_POWER_DOMAIN_MFG1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mfg2@MT8192_POWER_DOMAIN_MFG2 {
+						reg = <MT8192_POWER_DOMAIN_MFG2>;
+					};
+
+					mfg3@MT8192_POWER_DOMAIN_MFG3 {
+						reg = <MT8192_POWER_DOMAIN_MFG3>;
+					};
+
+					mfg4@MT8192_POWER_DOMAIN_MFG4 {
+						reg = <MT8192_POWER_DOMAIN_MFG4>;
+					};
+
+					mfg5@MT8192_POWER_DOMAIN_MFG5 {
+						reg = <MT8192_POWER_DOMAIN_MFG5>;
+					};
+
+					mfg6@MT8192_POWER_DOMAIN_MFG6 {
+						reg = <MT8192_POWER_DOMAIN_MFG6>;
+					};
+				};
+			};
+
+			disp@MT8192_POWER_DOMAIN_DISP {
+				reg = <MT8192_POWER_DOMAIN_DISP>;
+				clocks = <&mmsys CLK_MM_SMI_INFRA>,
+					 <&mmsys CLK_MM_SMI_COMMON>,
+					 <&mmsys CLK_MM_SMI_GALS>,
+					 <&mmsys CLK_MM_SMI_IOMMU>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ipe@MT8192_POWER_DOMAIN_IPE {
+					reg = <MT8192_POWER_DOMAIN_IPE>;
+					clocks = <&ipesys CLK_IPE_LARB19>,
+						 <&ipesys CLK_IPE_LARB20>,
+						 <&ipesys CLK_IPE_SMI_SUBCOM>,
+						 <&ipesys CLK_IPE_GALS>;
+				};
+
+				isp@MT8192_POWER_DOMAIN_ISP {
+					reg = <MT8192_POWER_DOMAIN_ISP>;
+					clocks = <&imgsys CLK_IMG_LARB9>,
+						 <&imgsys CLK_IMG_GALS>;
+				};
+
+				isp2@MT8192_POWER_DOMAIN_ISP2 {
+					reg = <MT8192_POWER_DOMAIN_ISP2>;
+					clocks = <&imgsys2 CLK_IMG2_LARB11>,
+						 <&imgsys2 CLK_IMG2_GALS>;
+				};
+
+				mdp@MT8192_POWER_DOMAIN_MDP {
+					reg = <MT8192_POWER_DOMAIN_MDP>;
+					clocks = <&mdpsys CLK_MDP_SMI0>;
+				};
+
+				venc@MT8192_POWER_DOMAIN_VENC {
+					reg = <MT8192_POWER_DOMAIN_VENC>;
+					clocks = <&vencsys CLK_VENC_SET1_VENC>;
+				};
+
+				vdec@MT8192_POWER_DOMAIN_VDEC {
+					reg = <MT8192_POWER_DOMAIN_VDEC>;
+					clocks = <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+						 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+						 <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					vdec2@MT8192_POWER_DOMAIN_VDEC2 {
+						reg = <MT8192_POWER_DOMAIN_VDEC2>;
+						clocks = <&vdecsys CLK_VDEC_VDEC>,
+							 <&vdecsys CLK_VDEC_LAT>,
+							 <&vdecsys CLK_VDEC_LARB1>;
+					};
+				};
+
+				cam@MT8192_POWER_DOMAIN_CAM {
+					reg = <MT8192_POWER_DOMAIN_CAM>;
+					clocks = <&camsys CLK_CAM_LARB13>,
+						 <&camsys CLK_CAM_LARB14>,
+						 <&camsys CLK_CAM_CCU_GALS>,
+						 <&camsys CLK_CAM_CAM2MM_GALS>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cam_rawa@MT8192_POWER_DOMAIN_CAM_RAWA {
+						reg = <MT8192_POWER_DOMAIN_CAM_RAWA>;
+						clocks = <&camsys_rawa CLK_CAM_RAWA_LARBX>;
+					};
+
+					cam_rawb@MT8192_POWER_DOMAIN_CAM_RAWB {
+						reg = <MT8192_POWER_DOMAIN_CAM_RAWB>;
+						clocks = <&camsys_rawb CLK_CAM_RAWB_LARBX>;
+					};
+
+					cam_rawc@MT8192_POWER_DOMAIN_CAM_RAWC {
+						reg = <MT8192_POWER_DOMAIN_CAM_RAWC>;
+						clocks = <&camsys_rawc CLK_CAM_RAWC_LARBX>;
+					};
+				};
+			};
+		};
+
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8192-wdt";
 			reg = <0 0x10007000 0 0x100>;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
