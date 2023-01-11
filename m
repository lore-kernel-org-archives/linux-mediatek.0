Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A55EC5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qs5AP02dhkCWqdSuirwOLn7ESeQZZWhOOpRZScjecQ=; b=r1XQmK5N8d1WsKmVB137HHnr1P
	OfVGUrFfgoqGJPNx5ZjZdfy4ZMnMkz8NWfb+/vzvL3pcDQr2vfWFJaye+Wbew0b/O51HJD8xIYBfu
	KEo/0FRUr1dpg3QFw3+um8QsP+xiuuYo2YpcRIsPefdeUHyQHxrSjvRCj+T2QF5KLQdbp8g8CD26z
	9tOZlTSuF+SoBj2dOhHINhdD/VU1XVbtPSpkBURaSaPXjsocTD39EnFxt6K14hscIK0j/n46HbszH
	oEBWg/8/n9sfnKAu7ou9cmrWPXGKRxWq0mB41l5o9sfmc2zwzzkQ/IXw90kRpcoyxOlRreqkzLNxo
	zJxAq5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaNH-00BId6-U3; Wed, 11 Jan 2023 12:38:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaMi-00BIId-NL; Wed, 11 Jan 2023 12:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/qs5AP02dhkCWqdSuirwOLn7ESeQZZWhOOpRZScjecQ=; b=F8MDGb6W+8qDkl56W/QQGnnvxm
	73KrTBTVuI+XfWcCGdZY/menEFB5VNNK29iuaiop0hoY0gbOYhiZu8JrcK31sF+JctiGSUbqqcefZ
	dcep11Xm/ImZOo66D3zamuYpwvARBgJz2q6Q17pfJixnfC3DeR4qe1ghnbBycIJMI9+Wjo7KwCrf8
	f47FXtLdswtYcthg2e0qWrHSC06cX4AXlvdLMN0io/vaTL5fuG+YueFSBJDY6itVf7L+uxSz0OIUv
	G4Q8EZa7/+5qN2BpztIEQHkTXmKmeWYaTg8d7YhdWLZNbOOBKwnC27nE387SWHudTB0bMn4pDdWRC
	6PYi+61w==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFaMW-003fni-2E;
	Wed, 11 Jan 2023 12:37:51 +0000
X-UUID: c19e04dc91ac11eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/qs5AP02dhkCWqdSuirwOLn7ESeQZZWhOOpRZScjecQ=;
	b=na3MEbNFBY/winbUnT2Xem7DQi9zQDLZhzCXY4RhYNEry3wjJVO8x8N+kW4GX2A3q9AFdvMBYSQLU7dgwvQKhUoIIE+nIpaODqUnZFsnl7i/NiCkqBXwK9BYxhZmUYmJe2Orq0PgSmXaDN02B3mSkyWF/2bz1Q7mQvHmtYzUISE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:b6e1ecf9-b4a3-4547-9103-b2d2bfa1182f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:0a5d5b54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: c19e04dc91ac11eda08d4d6090ec5a5c-20230111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1229066808; Wed, 11 Jan 2023 05:37:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 20:37:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 20:37:16 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 3/9] arm64: dts: mediatek: mt8186: Add SPMI node
Date: Wed, 11 Jan 2023 20:37:05 +0800
Message-ID: <20230111123711.32020-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_123749_317563_84F96ED1 
X-CRM114-Status: GOOD (  11.12  )
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

Add SPMI node for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 3d88480913eb..a8ff984f1192 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -605,6 +605,25 @@
 			clock-names = "spi", "wrap";
 		};
 
+		spmi: spmi@10015000 {
+			compatible = "mediatek,mt8186-spmi",
+				     "mediatek,mt8195-spmi";
+			reg = <0 0x10015000 0 0x000e00>,
+			      <0 0x1001B000 0 0x000100>;
+			reg-names = "pmif", "spmimst";
+			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
+				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
+				 <&topckgen CLK_TOP_SPMI_MST>;
+			clock-names = "pmif_sys_ck",
+				      "pmif_tmr_ck",
+				      "spmimst_clk_mux";
+			assigned-clocks = <&topckgen CLK_TOP_SPMI_MST>;
+			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
+			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH 0>;
+			status = "disabled";
+		};
+
 		systimer: timer@10017000 {
 			compatible = "mediatek,mt8186-timer",
 				     "mediatek,mt6765-timer";
-- 
2.18.0


