Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D6FC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:05:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C7E61220
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32C7E61220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=43KnQsGWOD8cyhedBuW8bj9C9+Lr33uH4/zGlnAw1DI=; b=n8g6h4C6UTLP58
	kfP7GsJENyZ7rOf8ApowskcUWrwgYX6Zl2C4SVFK1gJrtdaoi7FuhZC/PivqjmIvske4MV808ccMt
	oxbpAJI9pDsHwNbbh071BYTB3faTARcimVHEl0Sz0pZ6RN8k38xtbTouPfcEryyymbQfxfI2G2RbJ
	i+NtGG+RPAE/Rn39YggRuqHDxdZ+54gSnVouLa+fz9JWt/zzBFweyWDubfvAeZOL/jcMFj83Fd3Dh
	Wk+0T8I336CVFHPrK5hHApOCM88FrdZHyW3vFscdhzpMuAWZZQ0WcBHwlVWpYMCh2/jc62UekuHHl
	lR8gmheECOu+7NDYXuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIhLn-0050xF-BK; Wed, 25 Aug 2021 01:05:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIhLg-0050uO-2F; Wed, 25 Aug 2021 01:05:05 +0000
X-UUID: dbe175f083c942d2ae4d73320448f634-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=d9z738sNODWYTaut0a+FM/MBAETyFR2JTfI+JCJw8tU=; 
 b=LhSpmr+HgdJzBWaPN4rGedqDyXL0tiMOb/pNTiIP6CGPQDCPOQR72UK2swOKtstF4fGYp35/Qk09PbPla/zyY8skgiH8huXO/ySw9otbnE5Et3q2UVV8TYuiMjIr2h4/saBZh6uTwYTPkXNm3diPBbc9U0oXTiArOH5vkDzwDzc=;
X-UUID: dbe175f083c942d2ae4d73320448f634-20210824
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1624565760; Tue, 24 Aug 2021 18:04:55 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:04:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 09:04:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 09:04:51 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [v5] arm64: dts: mediatek: Add mt8192 power domains controller
Date: Wed, 25 Aug 2021 09:04:26 +0800
Message-ID: <20210825010426.30303-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_180501_568059_4DE99CB1 
X-CRM114-Status: GOOD (  12.43  )
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

Add power domains controller node for SoC mt8192

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
This patch is base on v5.14-rc1,
series "Mediatek MT8192 clock support"[1] and [2].
No changes compare v4

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521127
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210727023205.20319-2-chun-jie.chen@mediatek.com/
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 201 +++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index c7c7d4e017ae..a0084a7a5bcd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
+#include <dt-bindings/power/mt8192-power.h>
 
 / {
 	compatible = "mediatek,mt8192";
@@ -301,6 +302,206 @@
 			#interrupt-cells = <2>;
 		};
 
+		scpsys: syscon@10006000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x10006000 0 0x1000>;
+			#power-domain-cells = <1>;
+
+			/* System Power Manager */
+			spm: power-controller {
+				compatible = "mediatek,mt8192-power-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#power-domain-cells = <1>;
+
+				/* power domain of the SoC */
+				power-domain@MT8192_POWER_DOMAIN_AUDIO {
+					reg = <MT8192_POWER_DOMAIN_AUDIO>;
+					clocks = <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+						 <&infracfg CLK_INFRA_AUDIO_26M_B>,
+						 <&infracfg CLK_INFRA_AUDIO>;
+					clock-names = "audio", "audio1", "audio2";
+					mediatek,infracfg = <&infracfg>;
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8192_POWER_DOMAIN_CONN {
+					reg = <MT8192_POWER_DOMAIN_CONN>;
+					clocks = <&infracfg CLK_INFRA_PMIC_CONN>;
+					clock-names = "conn";
+					mediatek,infracfg = <&infracfg>;
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8192_POWER_DOMAIN_MFG0 {
+					reg = <MT8192_POWER_DOMAIN_MFG0>;
+					clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>;
+					clock-names = "mfg";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					power-domain@MT8192_POWER_DOMAIN_MFG1 {
+						reg = <MT8192_POWER_DOMAIN_MFG1>;
+						mediatek,infracfg = <&infracfg>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#power-domain-cells = <1>;
+
+						power-domain@MT8192_POWER_DOMAIN_MFG2 {
+							reg = <MT8192_POWER_DOMAIN_MFG2>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8192_POWER_DOMAIN_MFG3 {
+							reg = <MT8192_POWER_DOMAIN_MFG3>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8192_POWER_DOMAIN_MFG4 {
+							reg = <MT8192_POWER_DOMAIN_MFG4>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8192_POWER_DOMAIN_MFG5 {
+							reg = <MT8192_POWER_DOMAIN_MFG5>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8192_POWER_DOMAIN_MFG6 {
+							reg = <MT8192_POWER_DOMAIN_MFG6>;
+							#power-domain-cells = <0>;
+						};
+					};
+				};
+
+				power-domain@MT8192_POWER_DOMAIN_DISP {
+					reg = <MT8192_POWER_DOMAIN_DISP>;
+					clocks = <&topckgen CLK_TOP_DISP_SEL>,
+						 <&mmsys CLK_MM_SMI_INFRA>,
+						 <&mmsys CLK_MM_SMI_COMMON>,
+						 <&mmsys CLK_MM_SMI_GALS>,
+						 <&mmsys CLK_MM_SMI_IOMMU>;
+					clock-names = "disp", "disp-0", "disp-1", "disp-2",
+						      "disp-3";
+					mediatek,infracfg = <&infracfg>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					power-domain@MT8192_POWER_DOMAIN_IPE {
+						reg = <MT8192_POWER_DOMAIN_IPE>;
+						clocks = <&topckgen CLK_TOP_IPE_SEL>,
+							 <&ipesys CLK_IPE_LARB19>,
+							 <&ipesys CLK_IPE_LARB20>,
+							 <&ipesys CLK_IPE_SMI_SUBCOM>,
+							 <&ipesys CLK_IPE_GALS>;
+						clock-names = "ipe", "ipe-0", "ipe-1", "ipe-2",
+							      "ipe-3";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8192_POWER_DOMAIN_ISP {
+						reg = <MT8192_POWER_DOMAIN_ISP>;
+						clocks = <&topckgen CLK_TOP_IMG1_SEL>,
+							 <&imgsys CLK_IMG_LARB9>,
+							 <&imgsys CLK_IMG_GALS>;
+						clock-names = "isp", "isp-0", "isp-1";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8192_POWER_DOMAIN_ISP2 {
+						reg = <MT8192_POWER_DOMAIN_ISP2>;
+						clocks = <&topckgen CLK_TOP_IMG2_SEL>,
+							 <&imgsys2 CLK_IMG2_LARB11>,
+							 <&imgsys2 CLK_IMG2_GALS>;
+						clock-names = "isp2", "isp2-0", "isp2-1";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8192_POWER_DOMAIN_MDP {
+						reg = <MT8192_POWER_DOMAIN_MDP>;
+						clocks = <&topckgen CLK_TOP_MDP_SEL>,
+							 <&mdpsys CLK_MDP_SMI0>;
+						clock-names = "mdp", "mdp-0";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8192_POWER_DOMAIN_VENC {
+						reg = <MT8192_POWER_DOMAIN_VENC>;
+						clocks = <&topckgen CLK_TOP_VENC_SEL>,
+							 <&vencsys CLK_VENC_SET1_VENC>;
+						clock-names = "venc", "venc-0";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8192_POWER_DOMAIN_VDEC {
+						reg = <MT8192_POWER_DOMAIN_VDEC>;
+						clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+							 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+							 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+							 <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
+						clock-names = "vdec", "vdec-0", "vdec-1", "vdec-2";
+						mediatek,infracfg = <&infracfg>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#power-domain-cells = <1>;
+
+						power-domain@MT8192_POWER_DOMAIN_VDEC2 {
+							reg = <MT8192_POWER_DOMAIN_VDEC2>;
+							clocks = <&vdecsys CLK_VDEC_VDEC>,
+								 <&vdecsys CLK_VDEC_LAT>,
+								 <&vdecsys CLK_VDEC_LARB1>;
+							clock-names = "vdec2-0", "vdec2-1",
+								      "vdec2-2";
+							#power-domain-cells = <0>;
+						};
+					};
+
+					power-domain@MT8192_POWER_DOMAIN_CAM {
+						reg = <MT8192_POWER_DOMAIN_CAM>;
+						clocks = <&topckgen CLK_TOP_CAM_SEL>,
+							 <&camsys CLK_CAM_LARB13>,
+							 <&camsys CLK_CAM_LARB14>,
+							 <&camsys CLK_CAM_CCU_GALS>,
+							 <&camsys CLK_CAM_CAM2MM_GALS>;
+						clock-names = "cam", "cam-0", "cam-1", "cam-2",
+							      "cam-3";
+						mediatek,infracfg = <&infracfg>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#power-domain-cells = <1>;
+
+						power-domain@MT8192_POWER_DOMAIN_CAM_RAWA {
+							reg = <MT8192_POWER_DOMAIN_CAM_RAWA>;
+							clocks = <&camsys_rawa CLK_CAM_RAWA_LARBX>;
+							clock-names = "cam_rawa-0";
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8192_POWER_DOMAIN_CAM_RAWB {
+							reg = <MT8192_POWER_DOMAIN_CAM_RAWB>;
+							clocks = <&camsys_rawb CLK_CAM_RAWB_LARBX>;
+							clock-names = "cam_rawb-0";
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8192_POWER_DOMAIN_CAM_RAWC {
+							reg = <MT8192_POWER_DOMAIN_CAM_RAWC>;
+							clocks = <&camsys_rawc CLK_CAM_RAWC_LARBX>;
+							clock-names = "cam_rawc-0";
+							#power-domain-cells = <0>;
+						};
+					};
+				};
+			};
+		};
+
 		apmixedsys: syscon@1000c000 {
 			compatible = "mediatek,mt8192-apmixedsys", "syscon";
 			reg = <0 0x1000c000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
