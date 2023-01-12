Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88D3C61DB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11aNuTnXnc1zBHf/DOng+UuHFjCbI3B9XtmDQSCZXi0=; b=JVCXoA6c/led9Apbf/dQ0iPeVE
	TB0qUfghdhqalE+kQtgRWloANcuHhVjU+0JaTvFtN9eVJG34Wk0+Um1OXh6DZZ5+zygmygPBSyRSL
	D4IfbWYtZWYcJ57px01xF3KKvkbeB4YIC0/WAF9tV2EubYtXXFwWWkhVUa8BTVzDAcRg+ET+ry2/c
	R5ksDb8585bI6WEnkJpkmCl0oRzVY2FUaYpFv8e82Zp1t/4hE+MA4VcRHLBRHGPpd7T1UiNd4+t95
	HXxuhv8E9TWsOdWCAL2j/hVnXHGWPH1DuPGJo1BPXT2NRNdIG2P2Lvpu4ryuisAO+od6Zfs93cdBG
	t6IQrOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtEa-00EC9S-KZ; Thu, 12 Jan 2023 08:46:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtE0-00EBw6-5X; Thu, 12 Jan 2023 08:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=11aNuTnXnc1zBHf/DOng+UuHFjCbI3B9XtmDQSCZXi0=; b=KIwi04xiqy9Ug5DCg62eUGO5et
	etDjtQgfzkC9SKnRTRtgCZsq6eQFf5J3OUYHsixI+Pa18PUrHRFSiQ8fpYo+5+O97oJ1PPxWyCMP8
	H6FFS9GgXv1mkXGr+WgSVUQVAV+G/wH/xyNimTAxXZdHMoPuCBFeXUfTXWn0Dc/2rhTaSH1NNtDtL
	86qu8FSasc0kQlo2TsxEtnvcP+VZcKKg4+tY2v9IhfYjpHEjYRZZXsK1dEG/Eds+0tDpSV9YrcZPu
	tH/81HhjqAIKi8KA2dgqKy/MMiqLKO/c5TKEBtTlvSeBVetXx2p8asex/zpneqOQ2ImB0r0ihZs0e
	RM0/CG6w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFtDi-003x8Q-1E;
	Thu, 12 Jan 2023 08:46:06 +0000
X-UUID: 7e85825c925511edbbe3f76fe852e059-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=11aNuTnXnc1zBHf/DOng+UuHFjCbI3B9XtmDQSCZXi0=;
	b=T/oYtKrzSUMMz50t8hgsKIi4kVvByvmyG67UG8u+vBcfT/HN3APhTLSQ9EcHYAWEVXQz4qSAmkkQ0k0v5WzJTeyyFNh6x/D2Bah92P8ab89qWq06DoVT07gmiMBtrXJZU3HI/QMLt6rzWpguMfSXVy1SYuKGq/AhlYx5mZmGIwI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:d51800a8-5699-432a-81b7-d5dd63b84e93,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:d51800a8-5699-432a-81b7-d5dd63b84e93,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:ff6d7354-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230112164509NT883R14,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 7e85825c925511edbbe3f76fe852e059-20230112
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 258812004; Thu, 12 Jan 2023 01:45:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 12 Jan 2023 16:45:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 12 Jan 2023 16:45:05 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, Irui Wang
	<irui.wang@mediatek.com>
Subject: [V1,1/2] arm64: dts: mt8195: add jpeg encode device node
Date: Thu, 12 Jan 2023 16:45:02 +0800
Message-ID: <20230112084503.4277-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112084503.4277-1-irui.wang@mediatek.com>
References: <20230112084503.4277-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_084600_285538_2F3C696C 
X-CRM114-Status: UNSURE (   9.89  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

add mt8195 jpegenc device node

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..af49ec352bfe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2152,6 +2152,46 @@
 			#clock-cells = <1>;
 		};
 
+
+		jpgenc-master {
+			compatible = "mediatek,mt8195-jpgenc";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+			iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+					<&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+					<&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+					<&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			jpgenc@1a030000 {
+				compatible = "mediatek,mt8195-jpgenc-hw";
+				reg = <0 0x1a030000 0 0x10000>;
+				iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
+						<&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
+						<&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
+						<&iommu_vdo M4U_PORT_L19_JPGENC_BSDMA>;
+				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
+				clocks = <&vencsys CLK_VENC_JPGENC>;
+				clock-names = "jpgenc";
+				power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
+			};
+
+			jpgenc@1b030000 {
+				compatible = "mediatek,mt8195-jpgenc-hw";
+				reg = <0 0x1b030000 0 0x10000>;
+				iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+						<&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+						<&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+						<&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
+				clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGENC>;
+				clock-names = "jpgenc";
+				power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+			};
+		};
+
 		larb20: larb@1b010000 {
 			compatible = "mediatek,mt8195-smi-larb";
 			reg = <0 0x1b010000 0 0x1000>;
-- 
2.18.0


