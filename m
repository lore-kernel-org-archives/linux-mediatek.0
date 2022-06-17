Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72913C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhpGIg1n/ux6GeWC7xC6YPnxhV/LxylhGF8nravTRnc=; b=EBhORKRGWtGeoRj3bqGXuNK7A5
	EaF+6LTgbHf8EWKUwNAz7x4QAtudceav2jtAD2ZJmRXYt8IgBJw1ATXfOS82OpvZaUEbYN3Tr/jFX
	dQhy5N8CCEt3gCxVN8ZsiZzC45zeaAW2u0rjnMtYwVCR0TZ3yhOlYYuBFddPUz9ZpuWseHWxlCx+x
	D3RXeb6S9JRbZJ13NV9grwxFGKog+VySEX9qz8imEGzwBDoYwYJpLHIiyY18WtN8RJCbfK0ApkQE3
	I3rgkoOoAq/qAEZ5ZCzaMhAZIOVUur+zeZdKjZXA0RgAxkZUrNpHv4Z3hU36aCnPmWjcUz94uwn3y
	oRNDYxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26XL-0060To-O9; Fri, 17 Jun 2022 07:36:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26Ki-005vy6-Gl; Fri, 17 Jun 2022 07:23:57 +0000
X-UUID: 890f4e77027b4e4095a3ba0e1fcbd0cd-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:d7629dc2-3555-4992-93fc-d1d11adb2dc1,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:f014e048-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 890f4e77027b4e4095a3ba0e1fcbd0cd-20220617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1379137595; Fri, 17 Jun 2022 00:23:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 00:23:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 15:23:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 15:23:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Macpaul Lin <macpaul.lin@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v4 2/2] arm64: dts: mediatek: mt8195: enable usb remote wakeup
Date: Fri, 17 Jun 2022 15:23:44 +0800
Message-ID: <20220617072344.21461-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617072344.21461-1-chunfeng.yun@mediatek.com>
References: <20220617072344.21461-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_002356_630159_25DB7AA0 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable USB remote wakeup of all four xHCI controller

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4: add tested-by Macpaul

v3: add reviewed-by AngeloGioacchino;

NOTE:
  based on v5.18-next/dts64 of matthias.bgg's branch

v2: no changes, based on new version of mt8195.dtsi
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index d5bc4cf5f4ac..3ad14e0e0956 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -573,6 +573,8 @@
 				 <&apmixedsys CLK_APMIXED_USB1PLL>,
 				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -636,6 +638,8 @@
 				 <&apmixedsys CLK_APMIXED_USB1PLL>,
 				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck","xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -655,6 +659,8 @@
 				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
 				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -674,6 +680,8 @@
 				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
 				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
+			wakeup-source;
 			status = "disabled";
 		};
 
-- 
2.18.0


