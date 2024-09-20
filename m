Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB89C78849
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAwibddJXVFpQUpjf1IuUnHdwc51z/1PEBeF4qdcOP0=; b=aCQvb5Z+9MsM5XWeKLuJEScH5s
	YB6xGZq1Ck0H+Nb0u81Vk/XN3noAwWCsd5OpXD8CelvteB+4l9D3wUac0btqcH5sTiqv28vw5W1hd
	DOav77VOCsfX+8SvQm8aKNZuzz7SfYoQXaOmpQI7YoDXDo37skPosfzZHfbu3V+mKsg1ji3A2EsN2
	Ss/1oQNyrrpthJEFXYUWPk4czqpLpsqd6X1Rg2OEUB9lqcyi9s0XNpqvKloa/THQD5beSYsNb2olO
	a4klLXOqyA4W19TxK14pwn+TxOe27658AfhmLaoKScRh23v+PFeb8uCA16PLSxK/QigWkl4XZchqr
	O1MB45XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srdxC-0000000CIKj-1TIq;
	Fri, 20 Sep 2024 13:45:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srdu0-0000000CHht-2026;
	Fri, 20 Sep 2024 13:42:29 +0000
X-UUID: 2bdcc4d8775611efba0aef63c0775dbf-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xAwibddJXVFpQUpjf1IuUnHdwc51z/1PEBeF4qdcOP0=;
	b=gVA677OTK5sRWHZpN/ErCVPJuFKbyZh/gnT8DXaSZ1Syx84GPSgdKAmjt7OKQDFDK1SuPSPotpgj7sWXcS+3GqkNteg3geDBOoHTJxQdl2j2VKRDJ9048tfQYk83dKHaGGS6EkwYoXUH25PPcoJhj9I+TFf/dIltKguBqSxKJ/4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:d12225e5-217c-4c7b-850e-222c2fcf3deb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:c26bff17-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2bdcc4d8775611efba0aef63c0775dbf-20240920
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1141139470; Fri, 20 Sep 2024 06:42:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 06:42:23 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 21:42:23 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8188: Add efuse for GPU speed binning
Date: Fri, 20 Sep 2024 21:41:10 +0800
Message-ID: <20240920134111.19744-5-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240920134111.19744-1-pablo.sun@mediatek.com>
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_064228_559855_C82492A9 
X-CRM114-Status: GOOD (  10.82  )
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

The OPP table of mt8188 GPU contains duplicated frequencies
for different speed bins.

In order to support OPP table, we need to provide the speed bin info
in the efuse data so the GPU driver could properly set the
supported hardware speed bin.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 02a5bb4dbd1f..129edaf33704 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1752,6 +1752,11 @@ efuse: efuse@11f20000 {
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
+
+			gpu_speedbin: gpu-speedbin@580 {
+				reg = <0x581 0x1>;
+				bits = <0 3>;
+			};
 		};
 
 		gpu: gpu@13000000 {
@@ -1763,6 +1768,8 @@ gpu: gpu@13000000 {
 				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "job", "mmu", "gpu";
+			nvmem-cells = <&gpu_speedbin>;
+			nvmem-cell-names = "speed-bin";
 			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
 					<&spm MT8188_POWER_DOMAIN_MFG3>,
-- 
2.45.2


