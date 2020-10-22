Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112FAC388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:00:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81E9F22267
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:00:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="snKLNoLu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jUyadu7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81E9F22267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KGEFbQUjXlhtmHFlhgVV5NKfAV12mx5vNaLUxuecTxc=; b=snKLNoLuBOj6xs0akFkDbtV1J
	nU1yjIQVJ6B4EqqJlChMfuxB3wvwwCeVi/2c0u61PJW8cK5SniEugbFL6AFggGXS5A5qIUymde9Au
	YVPzp4t3tEYsZ5Epq6tP4wbhTtG5xX5y5YaRIndiFZzoJIb4u8ZQO0yIvg8RIgFJpuAA7KEaWdnct
	1UpFkK6JFqpMqe0PS47cF575IGnIuXeqNvS51ShgHXC6FTL0plMGgiQJ1mjIPv1qK/lIga3fwth+w
	n0Kcop0XWEMuNf+M/lSpSpCYr9WvrWKRb23mhWqnynEjWQ3zS2SlxGj9b7mQUdTQW9Qp82j9dVzJK
	OatJqJO6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVaCo-0004xM-D9; Thu, 22 Oct 2020 13:00:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa18-0007Bs-DL; Thu, 22 Oct 2020 12:48:35 +0000
X-UUID: 9e33e43761104e81b50d048c97b5e356-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zep8uRbT1L/oiPe6922B3UtXjZQyXXFtOLpv/9MLMQw=; 
 b=jUyadu7dCI9hOEpk2r9haPP/EbwK4stjcORGxy+q4iDKzNgU/yh0uB00gRTj6VL0s9HG2N8ZTEqP12YoPULWPtnJbme5CJob/ZoX+Gkq8vyvYxp7bDQcgTlEbbAZBT+o2+oAr7i3cwg6gozaNTnXSIJEGQGsa7gp3vgT3cn4SIc=;
X-UUID: 9e33e43761104e81b50d048c97b5e356-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2139912205; Thu, 22 Oct 2020 04:47:57 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:47:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:47:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:47:39 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH v2 4/4] arm64: dts: mediatek: Add mt8192 power domains
 controller
Date: Thu, 22 Oct 2020 20:47:37 +0800
Message-ID: <1603370857-30646-5-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084830_620750_B44D39F2 
X-CRM114-Status: GOOD (  12.43  )
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

Add power domains controller node for SoC mt8192

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 201 +++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index b3fab4f..9274291 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
+#include <dt-bindings/power/mt8192-power.h>
 
 / {
 	compatible = "mediatek,mt8192";
@@ -257,6 +258,206 @@
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
+				audio@MT8192_POWER_DOMAIN_AUDIO {
+					reg = <MT8192_POWER_DOMAIN_AUDIO>;
+					clocks = <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+						 <&infracfg CLK_INFRA_AUDIO_26M_B>,
+						 <&infracfg CLK_INFRA_AUDIO>;
+					clock-names = "audio", "audio1", "audio2";
+					mediatek,infracfg = <&infracfg>;
+					#power-domain-cells = <0>;
+				};
+
+				conn@MT8192_POWER_DOMAIN_CONN {
+					reg = <MT8192_POWER_DOMAIN_CONN>;
+					clocks = <&infracfg CLK_INFRA_PMIC_CONN>;
+					clock-names = "conn";
+					mediatek,infracfg = <&infracfg>;
+					#power-domain-cells = <0>;
+				};
+
+				mfg@MT8192_POWER_DOMAIN_MFG0 {
+					reg = <MT8192_POWER_DOMAIN_MFG0>;
+					clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>;
+					clock-names = "mfg";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					mfg1@MT8192_POWER_DOMAIN_MFG1 {
+						reg = <MT8192_POWER_DOMAIN_MFG1>;
+						mediatek,infracfg = <&infracfg>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#power-domain-cells = <1>;
+
+						mfg2@MT8192_POWER_DOMAIN_MFG2 {
+							reg = <MT8192_POWER_DOMAIN_MFG2>;
+							#power-domain-cells = <0>;
+						};
+
+						mfg3@MT8192_POWER_DOMAIN_MFG3 {
+							reg = <MT8192_POWER_DOMAIN_MFG3>;
+							#power-domain-cells = <0>;
+						};
+
+						mfg4@MT8192_POWER_DOMAIN_MFG4 {
+							reg = <MT8192_POWER_DOMAIN_MFG4>;
+							#power-domain-cells = <0>;
+						};
+
+						mfg5@MT8192_POWER_DOMAIN_MFG5 {
+							reg = <MT8192_POWER_DOMAIN_MFG5>;
+							#power-domain-cells = <0>;
+						};
+
+						mfg6@MT8192_POWER_DOMAIN_MFG6 {
+							reg = <MT8192_POWER_DOMAIN_MFG6>;
+							#power-domain-cells = <0>;
+						};
+					};
+				};
+
+				disp@MT8192_POWER_DOMAIN_DISP {
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
+					ipe@MT8192_POWER_DOMAIN_IPE {
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
+					isp@MT8192_POWER_DOMAIN_ISP {
+						reg = <MT8192_POWER_DOMAIN_ISP>;
+						clocks = <&topckgen CLK_TOP_IMG1_SEL>,
+							 <&imgsys CLK_IMG_LARB9>,
+							 <&imgsys CLK_IMG_GALS>;
+						clock-names = "isp", "isp-0", "isp-1";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					isp2@MT8192_POWER_DOMAIN_ISP2 {
+						reg = <MT8192_POWER_DOMAIN_ISP2>;
+						clocks = <&topckgen CLK_TOP_IMG2_SEL>,
+							 <&imgsys2 CLK_IMG2_LARB11>,
+							 <&imgsys2 CLK_IMG2_GALS>;
+						clock-names = "isp2", "isp2-0", "isp2-1";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					mdp@MT8192_POWER_DOMAIN_MDP {
+						reg = <MT8192_POWER_DOMAIN_MDP>;
+						clocks = <&topckgen CLK_TOP_MDP_SEL>,
+							 <&mdpsys CLK_MDP_SMI0>;
+						clock-names = "mdp", "mdp-0";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					venc@MT8192_POWER_DOMAIN_VENC {
+						reg = <MT8192_POWER_DOMAIN_VENC>;
+						clocks = <&topckgen CLK_TOP_VENC_SEL>,
+							 <&vencsys CLK_VENC_SET1_VENC>;
+						clock-names = "venc", "venc-0";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					vdec@MT8192_POWER_DOMAIN_VDEC {
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
+						vdec2@MT8192_POWER_DOMAIN_VDEC2 {
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
+					cam@MT8192_POWER_DOMAIN_CAM {
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
+						cam_rawa@MT8192_POWER_DOMAIN_CAM_RAWA {
+							reg = <MT8192_POWER_DOMAIN_CAM_RAWA>;
+							clocks = <&camsys_rawa CLK_CAM_RAWA_LARBX>;
+							clock-names = "cam_rawa-0";
+							#power-domain-cells = <0>;
+						};
+
+						cam_rawb@MT8192_POWER_DOMAIN_CAM_RAWB {
+							reg = <MT8192_POWER_DOMAIN_CAM_RAWB>;
+							clocks = <&camsys_rawb CLK_CAM_RAWB_LARBX>;
+							clock-names = "cam_rawb-0";
+							#power-domain-cells = <0>;
+						};
+
+						cam_rawc@MT8192_POWER_DOMAIN_CAM_RAWC {
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
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8192-wdt";
 			reg = <0 0x10007000 0 0x100>;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
