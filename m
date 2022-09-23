Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D86ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3op6r+zBloxUZmPBYopLhjOoMBMFIxK210nn9z153CQ=; b=RYNd+F8hXKC8Lj0wWKZhEiTTRi
	xY1bPIWGTrPNEfK1iMMzVAd5RSWDFDoVLzUCW1aGo4nf5oKf2GcVlux/mLcluV1li0OurU1gTFLZM
	WqZLb7sWLug9aRfYQle3LJIEu2N77DFMpdfIFVifQO4FFECbQjxZRRh3KVyWTN5cNtiJoPp1hNpdQ
	s7niRSylXt0I1y53iIKg8mC4vcGSMkKDR9MznC6Zgr5FVyTyqy8/yF9yHcCsW7HL1c+Rmp8Afa007
	trtUodD9IqXB3Vre5blGblccP+l69IdS2yZpI7wJIcVkQQ5IX/ujlcmbP2XQhwAkWeRVQKTtR9Ak3
	e2NpqnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obiUR-004P9e-1A; Fri, 23 Sep 2022 13:13:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obiUK-004P7b-55; Fri, 23 Sep 2022 13:13:09 +0000
X-UUID: a8789f3ff5f04f398fd43ec62478fb51-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3op6r+zBloxUZmPBYopLhjOoMBMFIxK210nn9z153CQ=;
	b=c8FieRMpAZmftuyJdTIt5uY4U4g9S8maJsnefnFulbYASFXzILEiFY3xd4JOh7OCDVCXKk7aglz3SRNlLl37MhFak5cjGS8CoAGPnkQl6ZAmLe7m1uMdeKPHfnIdZxXPbA8d0UdsJDTn4RJp+FDuUfRC94ZCK6Yze3Uma5RTL0c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:08286104-d571-4b21-a643-757c3d5a7bfa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:2189d006-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a8789f3ff5f04f398fd43ec62478fb51-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 385034267; Fri, 23 Sep 2022 06:13:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 21:11:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Sep 2022 21:11:52 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 4/5] arm64: dts: mt8186: Add dpi node
Date: Fri, 23 Sep 2022 21:11:47 +0800
Message-ID: <20220923131148.6678-5-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
References: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_061304_245928_2637DA74 
X-CRM114-Status: UNSURE (   9.59  )
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

Add dpi node for mt8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 68f06bef88f3..c6809fdc7d15 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -976,6 +976,25 @@
 			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 		};
 
+		dsi0: dsi@14013000 {
+			compatible = "mediatek,mt8186-dsi";
+			reg = <0 0x14013000 0 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&mmsys CLK_MM_DSI0>,
+				 <&mmsys CLK_MM_DSI0_DSI_CK_DOMAIN>,
+				 <&mipi_tx0>;
+			clock-names = "engine", "digital", "hs";
+			resets = <&mmsys MT8186_MMSYS_SW0_RST_B_DISP_DSI0>;
+			phys = <&mipi_tx0>;
+			phy-names = "dphy";
+			status = "disabled";
+
+			port {
+				dsi_out: endpoint { };
+			};
+		};
+
 		iommu_mm: iommu@14016000 {
 			compatible = "mediatek,mt8186-iommu-mm";
 			reg = <0 0x14016000 0 0x1000>;
-- 
2.18.0


