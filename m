Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D25C5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0tyeVCGLQHUTaZhj2eyO8Q7/skPBVsVWCjbAseVp40=; b=wKInuF8Mc0MccVixpNcaXk4Ycn
	n5Cc+w7Znv2qgNpmkslafPvpwno9S2AznvINwV43iuvVwHSBO0sWy6bwFEkP2dd+rqNjOhg6NW2Xz
	hQnKjFe0WqNrDTufAFvKpXtzQduFPUMm0oI9Jxv9fkxMLBpcuWP60ZPzVM6o1wYzk9z2570L3SfIh
	0YRjLZoCa7fGn80UjYZb+psz210jEFnzFCBr75U/j2Foik+KRFUMKj/dQKQLOC0bGNlXjQKqRmpUL
	aWxVlPOZQ4rkgcj9Qa/wfyHeByGJKWkMBUDj2kqwAHT5eWKGFChwQ3hBNr99hWKUHGc93KZS1rhU/
	RkXc/YQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaMc-00BIFU-Pi; Wed, 11 Jan 2023 12:37:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaMR-00BI4m-Ln; Wed, 11 Jan 2023 12:37:45 +0000
X-UUID: b0115eda91ac11edbbe3f76fe852e059-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f0tyeVCGLQHUTaZhj2eyO8Q7/skPBVsVWCjbAseVp40=;
	b=mySfKi4Gr4f+Et4yhUnX//d/n5V9jJhediN5dUtKQXQCbzx2JgKStMXxA/WhOrY7qYCA+4AruTzpbC9kZ49TiyhzIqzXyTySLBCXr1GwuSsIM+Qb9ixg0CEtNixttutQWgY7NqlmSEeHPTQJ5Fh5gRAeSNXmsuiBortcCcpLD+c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:ed86cc14-de18-4faa-8e7b-01bc17309fa0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:ed86cc14-de18-4faa-8e7b-01bc17309fa0,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:954af68b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230111203719JF1Y4TIF,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: b0115eda91ac11edbbe3f76fe852e059-20230111
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 147127262; Wed, 11 Jan 2023 05:37:19 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
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
Subject: [PATCH 4/9] arm64: dts: mediatek: mt8186: Add ADSP mailbox nodes
Date: Wed, 11 Jan 2023 20:37:06 +0800
Message-ID: <20230111123711.32020-5-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_043743_731161_2F38A1B6 
X-CRM114-Status: GOOD (  10.70  )
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

Add ADSP mailbox node for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index a8ff984f1192..a0b7dacc10cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -640,6 +640,20 @@
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		adsp_mailbox0: mailbox@10686000 {
+			compatible = "mediatek,mt8186-adsp-mbox";
+			#mbox-cells = <0>;
+			reg = <0 0x10686100 0 0x1000>;
+			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		adsp_mailbox1: mailbox@10687000 {
+			compatible = "mediatek,mt8186-adsp-mbox";
+			#mbox-cells = <0>;
+			reg = <0 0x10687100 0 0x1000>;
+			interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
 		nor_flash: spi@11000000 {
 			compatible = "mediatek,mt8186-nor";
 			reg = <0 0x11000000 0 0x1000>;
-- 
2.18.0


