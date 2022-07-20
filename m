Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78778CCA480
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pzLgv9ky2wFjPxIDoNECzKUHnIHhbLPkHN6dOxjlcw=; b=eJ4dympnMEBOSzBBh2uwrD7K1j
	o/bY93C75XEQ8RJbQx22QVvf0kG5fJQ5Wck8p8nX7TcmWvJJOd8K2updg0EYC5+XH0MoI5Mg6Inlo
	kV11LB+n8/FJUExMlSj5fxhCtGsXVqj9OObuxwih9uAsXe9W1ZSnsKZUGoSBE/A8z54fv37xgKDX3
	i22BkGen0u8x8OJdY0vN7BXBu4UkjtAveTpZITasH9ElYh1D7zyC56Te5YrWNZJCv/1fGgDHv+MBH
	dfDvuhQ4hLi5LAMvQ4UdySQAJpLmFp+u9y/ZA42ufsYhmsqIuoPv/WxY+orcDjsyrLX2l8fXVgont
	JXGD5HqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE8u2-005KGe-Lp; Wed, 20 Jul 2022 12:34:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE8rn-005I8x-Ij; Wed, 20 Jul 2022 12:31:54 +0000
X-UUID: 49dff35d686044c49321c576c4b45e6b-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:985c7839-266f-4382-9585-4a97d73d7cf8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:a9e4ffd7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 49dff35d686044c49321c576c4b45e6b-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1510131346; Wed, 20 Jul 2022 05:31:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 20 Jul 2022 20:30:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Jul 2022 20:30:26 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee.jones@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, MandyJH Liu
	<mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, YC Hung
	<yc.hung@mediatek.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.corp-partner.google.com>
Subject: [PATCH v3 17/21] arm64: dts: mt8195: Add adsp node and adsp mailbox nodes
Date: Wed, 20 Jul 2022 20:30:19 +0800
Message-ID: <20220720123023.13500-18-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220720123023.13500-1-tinghan.shen@mediatek.com>
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_053151_712076_58DE1519 
X-CRM114-Status: GOOD (  10.65  )
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
index 635d8cf9fe19..54d8d26dd2e4 100644
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


