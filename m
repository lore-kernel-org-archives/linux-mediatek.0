Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060DEC18E5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 07:35:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE83B20674
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 07:35:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nyyAWMJl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L5S8qPJA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE83B20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Im9/NxHbJZY83Gaimqlj+QY4Ddhyu7+KSYqvCokC5aI=; b=nyyAWMJlQIGoqs
	5T5Is2o+XnbkgCidtwdz+RDe9h+AIfrBXD80pJ3wsFogJzjawLntwMKVmQO7rxbuaBZMnyBDQtRjg
	ZsYvzXZNHmu7Omp7thY8QBXCHQPIkWn4NE3H+WpDfQWn29M61v0XfSrHimF9UueizKTB4/dvw6jIx
	NV5fRSeTsh5fBGVYFNaaAraQxiAzA9SrEJIg/7CB/mmkfHTb4thyl4SPThoAKJ2+k+VXGEISN/Xv3
	y1UaogHegFDpvCpxC6YEB+iU2JjcFU88WZQ+hOCRwpsJVlluuitkRh7lTr7ab1SsGKZteWF2AdRcH
	xbwQAs0CvVlPGQUxGCNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDkH4-0000HJ-4w; Mon, 16 Mar 2020 07:34:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDkGt-00007f-BC; Mon, 16 Mar 2020 07:34:48 +0000
X-UUID: bba4515da9d54e56a147976aea2d47fd-20200315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Et48gACf9Egz+SR4ne4zbTYMcE1fV+LhbFdrbAdWJRk=; 
 b=L5S8qPJAItguBjZM8gqD9CECe6APUY0zXPK3EAAab/edTqolxVn43L7SXdKlYQNFittOSY7ZSZT+NICzN7i7RilAV/NXhRtyzjZHwhdeLtMoVDdN7X7JCP0jVH+wuy4IvrCwByBFzMxIRTgZAHerjvoNBIDnLQ6bZSrHg2xpCkg=;
X-UUID: bba4515da9d54e56a147976aea2d47fd-20200315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 969705265; Sun, 15 Mar 2020 23:34:42 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 00:24:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 15:23:02 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 16 Mar 2020 15:21:41 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 1/3] dt-bindings: soc: add mtk svs dt-bindings
Date: Mon, 16 Mar 2020 15:23:15 +0800
Message-ID: <20200316072316.7156-2-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200316072316.7156-1-roger.lu@mediatek.com>
References: <20200316072316.7156-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 112A0A39678B4604765912F345C1DC43D8BA2C8BC42B043C5E958F65E334171E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_003447_384036_77BD1667 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 Angus Lin <Angus.Lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Roger Lu <roger.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the binding for enabling mtk svs on MediaTek SoC.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 .../devicetree/bindings/power/mtk-svs.txt     | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt

diff --git a/Documentation/devicetree/bindings/power/mtk-svs.txt b/Documentation/devicetree/bindings/power/mtk-svs.txt
new file mode 100644
index 000000000000..9a3e81b9e1d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/mtk-svs.txt
@@ -0,0 +1,76 @@
+* Mediatek Smart Voltage Scaling (MTK SVS)
+
+This describes the device tree binding for the MTK SVS controller (bank)
+which helps provide the optimized CPU/GPU/CCI voltages. This device also
+needs thermal data to calculate thermal slope for accurately compensate
+the voltages when temperature change.
+
+Required properties:
+- compatible:
+  - "mediatek,mt8183-svs" : For MT8183 family of SoCs
+- reg: Address range of the MTK SVS controller.
+- interrupts: IRQ for the MTK SVS controller.
+- clocks, clock-names: Clocks needed for the svs hardware. required
+                       clocks are:
+		       "main": Main clock for svs controller to work.
+- nvmem-cells: Phandle to the calibration data provided by a nvmem device.
+- nvmem-cell-names: Should be "svs-calibration-data" and "calibration-data"
+
+Subnodes:
+- svs-cpu-little: SVS bank device node of little CPU
+  compatible: "mediatek,mt8183-svs-cpu-little"
+  operating-points-v2: OPP table hooked by SVS little CPU bank.
+		       SVS will optimze this OPP table voltage part.
+  vcpu-little-supply: PMIC buck of little CPU
+- svs-cpu-big: SVS bank device node of big CPU
+  compatible: "mediatek,mt8183-svs-cpu-big"
+  operating-points-v2: OPP table hooked by SVS big CPU bank.
+		       SVS will optimze this OPP table voltage part.
+  vcpu-big-supply: PMIC buck of big CPU
+- svs-cci: SVS bank device node of CCI
+  compatible: "mediatek,mt8183-svs-cci"
+  operating-points-v2: OPP table hooked by SVS CCI bank.
+		       SVS will optimze this OPP table voltage part.
+  vcci-supply: PMIC buck of CCI
+- svs-gpu: SVS bank device node of GPU
+  compatible: "mediatek,mt8183-svs-gpu"
+  operating-points-v2: OPP table hooked by SVS GPU bank.
+		       SVS will optimze this OPP table voltage part.
+  vgpu-supply: PMIC buck of GPU
+
+Example:
+
+	svs: svs@1100b000 {
+		compatible = "mediatek,mt8183-svs";
+		reg = <0 0x1100b000 0 0x1000>;
+		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_THERM>;
+		clock-names = "main_clk";
+		nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
+		nvmem-cell-names = "svs-calibration-data", "calibration-data";
+
+		svs_cpu_little: svs-cpu-little {
+			compatible = "mediatek,mt8183-svs-cpu-little";
+			operating-points-v2 = <&cluster0_opp>;
+			vcpu-little-supply = <&mt6358_vproc12_reg>;
+		};
+
+		svs_cpu_big: svs-cpu-big {
+			compatible = "mediatek,mt8183-svs-cpu-big";
+			operating-points-v2 = <&cluster1_opp>;
+			vcpu-big-supply = <&mt6358_vproc11_reg>;
+		};
+
+		svs_cci: svs-cci {
+			compatible = "mediatek,mt8183-svs-cci";
+			operating-points-v2 = <&cci_opp>;
+			vcci-supply = <&mt6358_vproc12_reg>;
+		};
+
+		svs_gpu: svs-gpu {
+			compatible = "mediatek,mt8183-svs-gpu";
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
+			operating-points-v2 = <&gpu_opp_table>;
+			vgpu-spply = <&mt6358_vgpu_reg>;
+		};
+	};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
