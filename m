Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2D4C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 02:34:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6D92077B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 02:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ANL9vAa9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Usaj9rmL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6D92077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EnaOwf/EgM4qjj4I1BHXtjX9yy/rIrWWgqWd5GwHRkw=; b=ANL9vAa9QQUbq2
	1Jyk3vbXdRvu59/Q58RLTN7cL4S9VuAoHdXACgv8rM4AiaNRKBO9KwhH0FBgWr6s6+Vh2V3ixnZJm
	tT+5mwmq6CKxhmfW2ZyG3N/fd1KxH2KlR4l3+v1D9Wh89KMYbp4PpeTB8vJx3Ka5fS5aNBjqjZIV0
	dd7wQ6OCwnlabHmjsq653IgTiQdKymHhr6/1asGieuAL7/J2QhNFUM1gMMI3PDUrF4wtsZ8yG7zCV
	aWXwGzm8fM4U4rb/C014wH1h1trIGO75HsfzCifzObo81F7wfIYKvRCjKFIF1SN1qgj6dgeP4DdjH
	yANBTyDi+WQv+1BwIKvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ierpJ-0004Ip-J0; Wed, 11 Dec 2019 02:34:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ierpG-0004I1-KQ; Wed, 11 Dec 2019 02:34:08 +0000
X-UUID: dc870180ded84dbc8e5aab1a67bf7875-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=03LJQNLf2DKEdnk4krO0zsTLdTXgWHOH5qSyT3/Sd9o=; 
 b=Usaj9rmLpnYLK/kmAd71xvnnHmJ9U3Ptx3yENeDUJz7vYUXiivCYiCBfTU1MbVuVUd3drHuxXq6uKXsnJMPkb/hZJj5bGZgwQQbgzWrckhoYuCQHPnqCbiBH0gbnEJ9N8KXDfIAS6SjRjQ/icRYlRHqzxgYVGw0j1yz7HhYsBWE=;
X-UUID: dc870180ded84dbc8e5aab1a67bf7875-20191210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1245826193; Tue, 10 Dec 2019 18:33:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 18:35:01 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 10:33:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 10:33:49 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] arm64: dts: Add m4u and smi-larbs nodes for mt8183
Date: Wed, 11 Dec 2019 10:33:39 +0800
Message-ID: <1576031619-12229-1-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_183406_677480_7B51C49B 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 weiyi.lu@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, ming-fan.chen@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add nodes for M4U, smi-common, and smi-larbs.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
change notes:

v2: Rebase on v5.5-rc1 and power_domain nodes[1].
   [1] https://lore.kernel.org/patchwork/patch/1164746/

v1:  https://lore.kernel.org/patchwork/patch/1054099/
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 91217e4f..0f8f78e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/memory/mt8183-larb-port.h>
 #include <dt-bindings/power/mt8183-power.h>
 #include "mt8183-pinfunc.h"
 
@@ -335,6 +336,15 @@
 			clock-names = "clk13m";
 		};
 
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt8183-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larbs = <&larb0 &larb1 &larb2 &larb3
+					  &larb4 &larb5 &larb6>;
+			#iommu-cells = <1>;
+		};
+
 		auxadc: auxadc@11001000 {
 			compatible = "mediatek,mt8183-auxadc",
 				     "mediatek,mt8173-auxadc";
@@ -651,9 +661,25 @@
 			#clock-cells = <1>;
 		};
 
+		larb0: larb@14017000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x14017000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB0>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clock-names = "apb", "smi";
+		};
+
 		smi_common: smi@14019000 {
 			compatible = "mediatek,mt8183-smi-common", "syscon";
 			reg = <0 0x14019000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_GALS_COMM0>,
+				 <&mmsys CLK_MM_GALS_COMM1>;
+			clock-names = "apb", "smi", "gals0", "gals1";
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
 		};
 
 		imgsys: syscon@15020000 {
@@ -662,18 +688,57 @@
 			#clock-cells = <1>;
 		};
 
+		larb5: larb@15021000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x15021000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys CLK_IMG_LARB5>, <&imgsys CLK_IMG_LARB5>,
+				 <&mmsys CLK_MM_GALS_IMG2MM>;
+			clock-names = "apb", "smi", "gals";
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_ISP>;
+		};
+
+		larb2: larb@1502f000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x1502f000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys CLK_IMG_LARB2>, <&imgsys CLK_IMG_LARB2>,
+				 <&mmsys CLK_MM_GALS_IPU2MM>;
+			clock-names = "apb", "smi", "gals";
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_ISP>;
+		};
+
 		vdecsys: syscon@16000000 {
 			compatible = "mediatek,mt8183-vdecsys", "syscon";
 			reg = <0 0x16000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb1: larb@16010000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_VDEC>, <&vdecsys CLK_VDEC_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VDEC>;
+		};
+
 		vencsys: syscon@17000000 {
 			compatible = "mediatek,mt8183-vencsys", "syscon";
 			reg = <0 0x17000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb4: larb@17010000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x17010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vencsys CLK_VENC_LARB>,
+				 <&vencsys CLK_VENC_LARB>;
+			clock-names = "apb", "smi";
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VENC>;
+		};
+
 		ipu_conn: syscon@19000000 {
 			compatible = "mediatek,mt8183-ipu_conn", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
@@ -703,5 +768,25 @@
 			reg = <0 0x1a000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		larb6: larb@1a001000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x1a001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM_LARB6>, <&camsys CLK_CAM_LARB6>,
+				 <&mmsys CLK_MM_GALS_CAM2MM>;
+			clock-names = "apb", "smi", "gals";
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+		};
+
+		larb3: larb@1a002000 {
+			compatible = "mediatek,mt8183-smi-larb";
+			reg = <0 0x1a002000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM_LARB3>, <&camsys CLK_CAM_LARB3>,
+				 <&mmsys CLK_MM_GALS_IPU12MM>;
+			clock-names = "apb", "smi", "gals";
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+		};
 	};
 };
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
