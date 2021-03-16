Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476C7C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:25:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D63236500F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D63236500F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h4NqcUyfwH8eWnotFM1MXbgCtfiF8gqMc3FTUZAArBE=; b=mDGc+IfnqqpgoaAeR215150I4
	NixKYabzS2Ngtuf9yuD+dK1/MQyCw6RJ32iiJXCyNYCSkKucfGj+PMvVn2nIu9r411+WP/XkM1hPI
	Sfi9V7naL6R6rSeFUQbAixsuTl0tBcJnfcAQxpI96VDI7uniUaucFDP+/39AYOVE0xJ+FSjPmWc7p
	UHmWQRvAXkRuOkCqQOoPKsh2BXADIX+dtXo7Hw0OxhFWWdqYLTyHfJK0E8Dd+9ISx+8LAT8GJ19Eq
	V1n6WSIBkWg4Lok7yN1OznCOYBliAxfQZ5lONm1OdcHPUWQJ5LEfP7O++L8q4ij8/+Il/iV8LTKQ/
	FtvsYJdbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM5wU-000FZ3-1K; Tue, 16 Mar 2021 09:24:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM5uc-000EiS-Ev; Tue, 16 Mar 2021 09:22:52 +0000
X-UUID: 8ffe6039df034c51a8c1b6b3f3c9b876-20210316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JAIKsE+6+h7P4LzOpaujUVJA6bSB8Ha2Zwubv0q62LM=; 
 b=NR8C6WF1ZpLPFobVzFXkLd3mP0Pr3TSevGNS8xCUiwSJ91xnW1+7F2SjAW86gF2exfPyb56DulWeEmAIGBRBZEBvllZhVfOGz/Xh//OIckkwA5oSksn5MmzEmuonQJGU0FhkJv8bhopFgTZtdlRVEiSQ2Ah3ZiG2YJCMa7Mr5d0=;
X-UUID: 8ffe6039df034c51a8c1b6b3f3c9b876-20210316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2082724491; Tue, 16 Mar 2021 01:22:44 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 02:22:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 17:22:34 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 17:22:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Jie
 Qiu" <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Cawa Cheng
 <cawa.cheng@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH v5 08/13] arm64: dts: mediatek: mt8516: harmonize node names
 and compatibles
Date: Tue, 16 Mar 2021 17:22:27 +0800
Message-ID: <20210316092232.9806-8-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 59355DB424F1AFC58F40212131AE27443061E41448F2478C0AFFC142B5987A4F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_092251_054129_D1316C8B 
X-CRM114-Status: GOOD (  11.09  )
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

This is used to fix dtbs_check warning:
  harmonize node names and compatibles;
  add property "usb-role-switch" for connector dependence.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v5: no changes
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi         | 9 +++++----
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b80e95574bef..bbe5a1419eff 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -480,7 +480,7 @@
 		};
 
 		usb0: usb@11100000 {
-			compatible = "mediatek,mtk-musb";
+			compatible = "mediatek,mt8516-musb", "mediatek,mtk-musb";
 			reg = <0 0x11100000 0 0x1000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "mc";
@@ -493,7 +493,7 @@
 		};
 
 		usb1: usb@11190000 {
-			compatible = "mediatek,mtk-musb";
+			compatible = "mediatek,mt8516-musb", "mediatek,mtk-musb";
 			reg = <0 0x11190000 0 0x1000>;
 			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "mc";
@@ -506,8 +506,9 @@
 			status = "disabled";
 		};
 
-		usb_phy: usb@11110000 {
-			compatible = "mediatek,generic-tphy-v1";
+		usb_phy: t-phy@11110000 {
+			compatible = "mediatek,mt8516-tphy",
+				     "mediatek,generic-tphy-v1";
 			reg = <0 0x11110000 0 0x800>;
 			#address-cells = <2>;
 			#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 63fd70086bb8..7d738f01cf8d 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -188,6 +188,7 @@
 &usb0 {
 	status = "okay";
 	dr_mode = "peripheral";
+	usb-role-switch;
 
 	usb_con: connector {
 		compatible = "usb-c-connector";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
