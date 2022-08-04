Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5894C19F29
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 03:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tS1bsJP4kxZ9hR4dR/gRP541fCFVSMhady9htG0xic4=; b=lfz8svzpFJ3Wm4X8bD+0WA7PLj
	C8UjIGihIQXcjo/94t6wcOwOcuYIkYRWQGS8cvyIzEumGDvX0s7fQYO+6GoUnH9s++AcZKzk0TxV4
	9R6AiRrO5AeqfyNTMkh1o9doYDW55sg4+FDSXLQwWi/pfWQwvEfbaip5PPoPQp87OwlkIgOIZYmEK
	N/UMhrqEobUdvavvbgrBq9AuUvHkYp05NqcGIh8dSBI5FXKgiFqj3QwDTgiqym4ucgV3Hry12s7hx
	J6QvBvGi36mZ5tA9X6d5zHwe17rky2AwpCRlTvxC53LCTzsrJY4byqu0djVdvHsUURQQ10CsRInlk
	cSqs2B1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJRMv-00FllF-UG; Thu, 04 Aug 2022 03:17:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJRMi-00FlGz-JI; Thu, 04 Aug 2022 03:17:43 +0000
X-UUID: bb655d8614a54cef90cca7477dc05e7a-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ae6bb148-511c-44c0-85ba-4ee1630491e6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:69482ed1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bb655d8614a54cef90cca7477dc05e7a-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 916923318; Wed, 03 Aug 2022 20:17:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 10:15:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Aug 2022 10:15:57 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, MandyJH Liu <mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, YC Hung
	<yc.hung@mediatek.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.corp-partner.google.com>
Subject: [PATCH v5 16/20] arm64: dts: mt8195: Add adsp node and adsp mailbox nodes
Date: Thu, 4 Aug 2022 10:15:49 +0800
Message-ID: <20220804021553.14867-17-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220804021553.14867-1-tinghan.shen@mediatek.com>
References: <20220804021553.14867-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_201740_856869_C69E3099 
X-CRM114-Status: GOOD (  10.24  )
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

From: YC Hung <yc.hung@mediatek.corp-partner.google.com>

Add adsp node and adsp mailbox nodes for mt8195.

Signed-off-by: YC Hung <yc.hung@mediatek.corp-partner.google.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.corp-partner.google.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index bbea0acff3d2f..f42d33414125f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -739,6 +739,43 @@
 			#clock-cells = <1>;
 		};
 
+		adsp: dsp@10803000 {
+			compatible = "mediatek,mt8195-dsp";
+			reg = <0 0x10803000 0 0x1000>,
+			      <0 0x10840000 0 0x40000>;
+			reg-names = "cfg", "sram";
+			clocks = <&topckgen CLK_TOP_ADSP>,
+				 <&clk26m>,
+				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
+				 <&topckgen CLK_TOP_MAINPLL_D7_D2>,
+				 <&scp_adsp CLK_SCP_ADSP_AUDIODSP>,
+				 <&topckgen CLK_TOP_AUDIO_H>;
+			clock-names = "adsp_sel",
+				 "clk26m_ck",
+				 "audio_local_bus",
+				 "mainpll_d7_d2",
+				 "scp_adsp_audiodsp",
+				 "audio_h";
+			power-domains = <&spm MT8195_POWER_DOMAIN_ADSP>;
+			mbox-names = "rx", "tx";
+			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
+			status = "disabled";
+		};
+
+		adsp_mailbox0: mailbox@10816000 {
+			compatible = "mediatek,mt8195-adsp-mbox";
+			#mbox-cells = <0>;
+			reg = <0 0x10816000 0 0x1000>;
+			interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		adsp_mailbox1: mailbox@10817000 {
+			compatible = "mediatek,mt8195-adsp-mbox";
+			#mbox-cells = <0>;
+			reg = <0 0x10817000 0 0x1000>;
+			interrupts = <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
 		afe: mt8195-afe-pcm@10890000 {
 			compatible = "mediatek,mt8195-audio";
 			reg = <0 0x10890000 0 0x10000>;
-- 
2.18.0


