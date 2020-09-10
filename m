Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8C7C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:31:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA17A206A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:31:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qXzN309K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA17A206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Af07SpOiOykTn5XlJsB91ns7h7I6M4VozcidUcFakNU=; b=qXzN309KGPFrACwC1NIbtfR6o
	8Q67JobK860kvbQ952ttDCFiqCj6r6EYFlWZB//YQ9UCKd9GTNhWplxMcmLW3m8o9i0PKUpmFIJk3
	OdD48p95qks18MHLnFI8XOCzD6i0c3a/caiOT8XJ4/lPuVb212LsK5p9ae/gkrnBomVA5b5d2jSYm
	6mlCBVp8AwJXglLfHA9QtZmi/GEomaouIZtr8OmNsw8mUxkeM9RldOp3BCdBf5tqzFBEnai+CAzQY
	tTPmgRmjkqEJk9NDrudJ0qvg0hZbeF0LwPYcpVUeT9X1IDysC1jIqkyfji1xuQ64dIhUKaie/MySQ
	KMuiFCIuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQPk-0005fy-34; Thu, 10 Sep 2020 17:31:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQNP-0004FC-GK; Thu, 10 Sep 2020 17:28:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id CD68729BB09
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] arm64: dts: mediatek: Add mt8183 power domains
 controller
Date: Thu, 10 Sep 2020 19:28:26 +0200
Message-Id: <20200910172826.3074357-13-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910172826.3074357-1-enric.balletbo@collabora.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_132851_738261_2D1F587F 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Add power domains controller node for SoC mt8183

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 160 +++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 102105871db2..7012cdb22bf0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/mt8183-power.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include "mt8183-pinfunc.h"
@@ -316,6 +317,160 @@ pio: pinctrl@10005000 {
 			#interrupt-cells = <2>;
 		};
 
+		scpsys: syscon@10006000 {
+			compatible = "mediatek,mt8183-power-controller", "syscon";
+			reg = <0 0x10006000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			audio@MT8183_POWER_DOMAIN_AUDIO {
+				reg = <MT8183_POWER_DOMAIN_AUDIO>;
+				clocks = <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
+					 <&infracfg CLK_INFRA_AUDIO>,
+					 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>;
+				clock-names = "audio", "audio1", "audio2";
+				#power-domain-cells = <0>;
+			};
+
+			conn@MT8183_POWER_DOMAIN_CONN {
+				reg = <MT8183_POWER_DOMAIN_CONN>;
+				mediatek,infracfg = <&infracfg>;
+				#power-domain-cells = <0>;
+			};
+
+			mfg_async@MT8183_POWER_DOMAIN_MFG_ASYNC {
+				reg = <MT8183_POWER_DOMAIN_MFG_ASYNC>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&topckgen CLK_TOP_MUX_MFG>;
+				clock-names = "mfg";
+				#power-domain-cells = <1>;
+
+				mfg@MT8183_POWER_DOMAIN_MFG {
+					reg = <MT8183_POWER_DOMAIN_MFG>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					mfg_core0@MT8183_POWER_DOMAIN_MFG_CORE0 {
+						reg = <MT8183_POWER_DOMAIN_MFG_CORE0>;
+						#power-domain-cells = <0>;
+					};
+
+					mfg_core1@MT8183_POWER_DOMAIN_MFG_CORE1 {
+						reg = <MT8183_POWER_DOMAIN_MFG_CORE1>;
+						#power-domain-cells = <0>;
+					};
+
+					mfg_2d@MT8183_POWER_DOMAIN_MFG_2D {
+						reg = <MT8183_POWER_DOMAIN_MFG_2D>;
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+				};
+			};
+
+			disp@MT8183_POWER_DOMAIN_DISP {
+				reg = <MT8183_POWER_DOMAIN_DISP>;
+				clocks = <&topckgen CLK_TOP_MUX_MM>,
+					 <&mmsys CLK_MM_SMI_COMMON>,
+					 <&mmsys CLK_MM_SMI_LARB0>,
+					 <&mmsys CLK_MM_SMI_LARB1>,
+					 <&mmsys CLK_MM_GALS_COMM0>,
+					 <&mmsys CLK_MM_GALS_COMM1>,
+					 <&mmsys CLK_MM_GALS_CCU2MM>,
+					 <&mmsys CLK_MM_GALS_IPU12MM>,
+					 <&mmsys CLK_MM_GALS_IMG2MM>,
+					 <&mmsys CLK_MM_GALS_CAM2MM>,
+					 <&mmsys CLK_MM_GALS_IPU2MM>;
+				clock-names = "mm", "mm-0", "mm-1", "mm-2", "mm-3",
+					      "mm-4", "mm-5", "mm-6", "mm-7",
+					      "mm-8", "mm-9";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				mediatek,infracfg = <&infracfg>;
+				mediatek,smi = <&smi_common>;
+				#power-domain-cells = <1>;
+
+				cam@MT8183_POWER_DOMAIN_CAM {
+					reg = <MT8183_POWER_DOMAIN_CAM>;
+					clocks = <&topckgen CLK_TOP_MUX_CAM>,
+						 <&camsys CLK_CAM_LARB6>,
+						 <&camsys CLK_CAM_LARB3>,
+						 <&camsys CLK_CAM_SENINF>,
+						 <&camsys CLK_CAM_CAMSV0>,
+						 <&camsys CLK_CAM_CAMSV1>,
+						 <&camsys CLK_CAM_CAMSV2>,
+						 <&camsys CLK_CAM_CCU>;
+					clock-names = "cam", "cam-0", "cam-1",
+						      "cam-2", "cam-3", "cam-4",
+						      "cam-5", "cam-6";
+					mediatek,infracfg = <&infracfg>;
+					mediatek,smi = <&smi_common>;
+					#power-domain-cells = <0>;
+				};
+
+				isp@MT8183_POWER_DOMAIN_ISP {
+					reg = <MT8183_POWER_DOMAIN_ISP>;
+					clocks = <&topckgen CLK_TOP_MUX_IMG>,
+						 <&imgsys CLK_IMG_LARB5>,
+						 <&imgsys CLK_IMG_LARB2>;
+					clock-names = "isp", "isp-0", "isp-1";
+					mediatek,infracfg = <&infracfg>;
+					mediatek,smi = <&smi_common>;
+					#power-domain-cells = <0>;
+				};
+
+				vdec@MT8183_POWER_DOMAIN_VDEC {
+					reg = <MT8183_POWER_DOMAIN_VDEC>;
+					mediatek,smi = <&smi_common>;
+					#power-domain-cells = <0>;
+				};
+
+				venc@MT8183_POWER_DOMAIN_VENC {
+					reg = <MT8183_POWER_DOMAIN_VENC>;
+					mediatek,smi = <&smi_common>;
+					#power-domain-cells = <0>;
+				};
+
+				vpu_top@MT8183_POWER_DOMAIN_VPU_TOP {
+					reg = <MT8183_POWER_DOMAIN_VPU_TOP>;
+					clocks = <&topckgen CLK_TOP_MUX_IPU_IF>,
+						 <&topckgen CLK_TOP_MUX_DSP>,
+						 <&ipu_conn CLK_IPU_CONN_IPU>,
+						 <&ipu_conn CLK_IPU_CONN_AHB>,
+						 <&ipu_conn CLK_IPU_CONN_AXI>,
+						 <&ipu_conn CLK_IPU_CONN_ISP>,
+						 <&ipu_conn CLK_IPU_CONN_CAM_ADL>,
+						 <&ipu_conn CLK_IPU_CONN_IMG_ADL>;
+					clock-names = "vpu", "vpu1", "vpu-0", "vpu-1",
+						      "vpu-2", "vpu-3", "vpu-4", "vpu-5";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+					mediatek,smi = <&smi_common>;
+					#power-domain-cells = <1>;
+
+					vpu_core0@MT8183_POWER_DOMAIN_VPU_CORE0 {
+						reg = <MT8183_POWER_DOMAIN_VPU_CORE0>;
+						clocks = <&topckgen CLK_TOP_MUX_DSP1>;
+						clock-names = "vpu2";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+
+					vpu_core1@MT8183_POWER_DOMAIN_VPU_CORE1 {
+						reg = <MT8183_POWER_DOMAIN_VPU_CORE1>;
+						clocks = <&topckgen CLK_TOP_MUX_DSP2>;
+						clock-names = "vpu3";
+						mediatek,infracfg = <&infracfg>;
+						#power-domain-cells = <0>;
+					};
+				};
+			};
+		};
+
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8183-wdt",
 				     "mediatek,mt6589-wdt";
@@ -754,6 +909,11 @@ mmsys: syscon@14000000 {
 			#clock-cells = <1>;
 		};
 
+		smi_common: smi@14019000 {
+			compatible = "mediatek,mt8183-smi-common", "syscon";
+			reg = <0 0x14019000 0 0x1000>;
+		};
+
 		imgsys: syscon@15020000 {
 			compatible = "mediatek,mt8183-imgsys", "syscon";
 			reg = <0 0x15020000 0 0x1000>;
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
