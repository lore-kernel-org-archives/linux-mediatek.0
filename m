Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B15C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:24:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D179C65010
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D179C65010
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Au2OHZYS1r+mDml291ZMusT35/aBPgW/62UD3Gsy47Y=; b=VID1A/xMBGtyTZtE+4Z2IxZk8
	tTnSACGCU4QjXLc8YW8lan6T8V9S+Ko5s7bIVGByrBJgSPetM6z/RCYxtnx83b3036ruFUnYbtCwh
	/TpCsD3b3GyDnmrz0UoSO6AXTQQfVqceAnoI02WgMTli1+H0peZ+2r8P2JzTsT/dALj9pD9i2l9oz
	ZF5O7EKTlRKLNh5SRuWHw+vR2nakM48UdRYSfWBnQPvQb3xxnSaclhY3qSmIyGfcUrJI3UgrtpMoq
	mstjwvZkqFZYge2BRzZZa/E/2q1WxEJUVCtujabAfAdY038TghwvO2jsT/aTWHt5CI8sqi+AUMTcS
	nkY/zI1Lg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM5vw-000FFq-EL; Tue, 16 Mar 2021 09:24:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM5ua-000EiX-V4; Tue, 16 Mar 2021 09:22:51 +0000
X-UUID: a5997897c32646c4a8fa0277bcd88568-20210316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zB5+UbCIqmRXUnArIfL/d4SuNe4wsjmoe4UmxZTYlxk=; 
 b=tHF51cgwcW2VJYUdzmBUgC2I8jAbaG2QKxnkJMmMtZlupOQlhDJrxqR+mBimjGTrqCKr3bPBIfY0N+bEaRSR7Jqmv3IU8CcGQknh86CZsy8DabCt9KEbUcqUY8etQL5mqdmYejU4ir2/hviIb0W9MawGcfTBvN6sZCSvn5/SH0w=;
X-UUID: a5997897c32646c4a8fa0277bcd88568-20210316
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 632622486; Tue, 16 Mar 2021 01:22:46 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 02:22:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 17:22:34 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 17:22:35 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jie
 Qiu <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Cawa Cheng
 <cawa.cheng@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH v5 11/13] arm: dts: mt7629: harmonize node names and
 compatibles
Date: Tue, 16 Mar 2021 17:22:30 +0800
Message-ID: <20210316092232.9806-11-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 61F338BCA16A9E0EA2E83DB3185949E357E7C3EF4CF8C6F8F6381591DDE2A0802000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_092249_506143_78D1349D 
X-CRM114-Status: GOOD (  10.02  )
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

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v5: no changes
---
 arch/arm/boot/dts/mt7629.dtsi | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
index 5cbb3d244c75..874043f0490d 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -329,8 +329,9 @@
 			status = "disabled";
 		};
 
-		u3phy0: usb-phy@1a0c4000 {
-			compatible = "mediatek,generic-tphy-v2";
+		u3phy0: t-phy@1a0c4000 {
+			compatible = "mediatek,mt7629-tphy",
+				     "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x1a0c4000 0xe00>;
@@ -413,14 +414,15 @@
 			};
 		};
 
-		pciephy1: pcie-phy@1a14a000 {
-			compatible = "mediatek,generic-tphy-v2";
+		pciephy1: t-phy@1a14a000 {
+			compatible = "mediatek,mt7629-tphy",
+				     "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x1a14a000 0x1000>;
 			status = "disabled";
 
-			pcieport1: port1phy@0 {
+			pcieport1: pcie-phy@0 {
 				reg = <0 0x1000>;
 				clocks = <&clk20m>;
 				clock-names = "ref";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
