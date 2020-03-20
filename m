Return-Path: <SRS0=3B0C=5F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30519C43332
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:43:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0691F2072D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:43:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O793VjGm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MSBQZ/fq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0691F2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iD686vtf4ZiHwO0WvpOjfTBVBSb62BNJi2mX8s9IrAg=; b=O793VjGmJe1liA
	2On7t8Vo4xihP5typqhXeX0Gb4PmZwNbXiEkyA0z/BFSPPkQ2Gzw3YgJQiHobZgNHO45UOiZOaDvm
	MfHcljFsO8pAdxPCbOuiauHXpS3674d3qokhkHoRMXVHNXg+P8tg6mADTmd7vxOfLLsOC38Qw/gMq
	zrWIx1axaCcMgoUVfYUZjVA3/d0awiMyzxaaj2hyt5aTPHvVyvfoiQ0HOKdrnF0C/Fek6yHRV78pH
	ExNcf58EzRFJPMZuRY97OMLeKCR265P7Oe5ojywwKRVu5aMa8J9V4p9SsKhFIE2YQTdyIUR/NV+3b
	4arnq0qKReG/CEELtGbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFCJE-0008VS-J7; Fri, 20 Mar 2020 07:43:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFCIg-0007xo-H5; Fri, 20 Mar 2020 07:42:39 +0000
X-UUID: 4e9c810ff50943e5876136de749f1aff-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HRs7cf/vg54eE9WqxDBPqnxsyBTDI4woFjEa7HdU93I=; 
 b=MSBQZ/fqyQkJndzDsZi4Mp6qZ2cmoRwia2TMcJ5zwHjbHYkxkGmH1yz8TozkBOWGx1XkiD8WAEUGQngFqX9YY3JA8rSwX0GSR+4sJ/noQj2Ubc7bs7hui3OK0UUwqRUZtxYvk11NdiN6Pg70jkWq6jzO59CgPzLqYY4tVuRc/lo=;
X-UUID: 4e9c810ff50943e5876136de749f1aff-20200319
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1576837386; Thu, 19 Mar 2020 23:42:34 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 00:32:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 15:30:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Mar 2020 15:29:20 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <kernel@pengutronix.de>
Subject: [PATCH v13 10/11] arm64: dts: Add power controller device node of
 MT8183
Date: Fri, 20 Mar 2020 15:32:19 +0800
Message-ID: <1584689540-5227-11-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1584689540-5227-1-git-send-email-weiyi.lu@mediatek.com>
References: <1584689540-5227-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_004238_578094_4DD737DA 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power controller node and smi-common node for MT8183
In scpsys node, it contains clocks and regmapping of
infracfg and smi-common for bus protection.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 62 ++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 124f9d3..70f18b9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/mt8183-power.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include "mt8183-pinfunc.h"
 
@@ -255,6 +256,62 @@
 			#interrupt-cells = <2>;
 		};
 
+		scpsys: power-controller@10006000 {
+			compatible = "mediatek,mt8183-scpsys", "syscon";
+			#power-domain-cells = <1>;
+			reg = <0 0x10006000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
+				 <&infracfg CLK_INFRA_AUDIO>,
+				 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
+				 <&topckgen CLK_TOP_MUX_MFG>,
+				 <&topckgen CLK_TOP_MUX_MM>,
+				 <&topckgen CLK_TOP_MUX_CAM>,
+				 <&topckgen CLK_TOP_MUX_IMG>,
+				 <&topckgen CLK_TOP_MUX_IPU_IF>,
+				 <&topckgen CLK_TOP_MUX_DSP>,
+				 <&topckgen CLK_TOP_MUX_DSP1>,
+				 <&topckgen CLK_TOP_MUX_DSP2>,
+				 <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB1>,
+				 <&mmsys CLK_MM_GALS_COMM0>,
+				 <&mmsys CLK_MM_GALS_COMM1>,
+				 <&mmsys CLK_MM_GALS_CCU2MM>,
+				 <&mmsys CLK_MM_GALS_IPU12MM>,
+				 <&mmsys CLK_MM_GALS_IMG2MM>,
+				 <&mmsys CLK_MM_GALS_CAM2MM>,
+				 <&mmsys CLK_MM_GALS_IPU2MM>,
+				 <&imgsys CLK_IMG_LARB5>,
+				 <&imgsys CLK_IMG_LARB2>,
+				 <&camsys CLK_CAM_LARB6>,
+				 <&camsys CLK_CAM_LARB3>,
+				 <&camsys CLK_CAM_SENINF>,
+				 <&camsys CLK_CAM_CAMSV0>,
+				 <&camsys CLK_CAM_CAMSV1>,
+				 <&camsys CLK_CAM_CAMSV2>,
+				 <&camsys CLK_CAM_CCU>,
+				 <&ipu_conn CLK_IPU_CONN_IPU>,
+				 <&ipu_conn CLK_IPU_CONN_AHB>,
+				 <&ipu_conn CLK_IPU_CONN_AXI>,
+				 <&ipu_conn CLK_IPU_CONN_ISP>,
+				 <&ipu_conn CLK_IPU_CONN_CAM_ADL>,
+				 <&ipu_conn CLK_IPU_CONN_IMG_ADL>;
+			clock-names = "audio", "audio1", "audio2",
+				      "mfg", "mm", "cam",
+				      "isp", "vpu", "vpu1",
+				      "vpu2", "vpu3", "mm-0",
+				      "mm-1", "mm-2", "mm-3",
+				      "mm-4", "mm-5", "mm-6",
+				      "mm-7", "mm-8", "mm-9",
+				      "isp-0", "isp-1", "cam-0",
+				      "cam-1", "cam-2", "cam-3",
+				      "cam-4", "cam-5", "cam-6",
+				      "vpu-0", "vpu-1", "vpu-2",
+				      "vpu-3", "vpu-4", "vpu-5";
+			infracfg = <&infracfg>;
+			smi_comm = <&smi_common>;
+		};
+
 		apmixedsys: syscon@1000c000 {
 			compatible = "mediatek,mt8183-apmixedsys", "syscon";
 			reg = <0 0x1000c000 0 0x1000>;
@@ -605,6 +662,11 @@
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
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
