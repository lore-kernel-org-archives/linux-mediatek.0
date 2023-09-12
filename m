Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF83BCA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hd86NQfy2/lhvIbniSQO9dAVZPI8a5X3Ca7Vv9yeC14=; b=ASTcFqNYrMNUFaoS1zxUVvXq6+
	EcK7Zz2scGRi9M+TFUj2sXsvFJj/qkHpQBY20oxNGJPvng3XM8fXQPSjs0fS6+QwCzUSw3C9X2LGz
	7gnvK3J6J9i+BUXjql21UcqBRBx3iXZlB9qDJAk/epiQElLH3VkWoUH8E6l3J8u4lyQG9XR7wUnk9
	vkH/QJtSyScisPGAf9kZc5krIIhnqmw025KhPZRRPRycNKwQ986iqcA475N8X2A8v7vSwPKHrI8ie
	RwX9TPhfK06Sq1w3iUz4ujhu8HVHEuhKf/vk/wQ6ixPiI+nR4NHT4BQhLkeTDOlYJK6J0Vi1VEqlJ
	/olmJwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyHr-002TJu-1J;
	Tue, 12 Sep 2023 07:58:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyHm-002TEX-0h;
	Tue, 12 Sep 2023 07:58:15 +0000
X-UUID: 1d5ad584514211ee9b7791016c24628a-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Hd86NQfy2/lhvIbniSQO9dAVZPI8a5X3Ca7Vv9yeC14=;
	b=XMln9Jm45RDlVIvEgzMf8JWLyUqzthP4wpyyX0dN/NLZqQbCa2LKk8u/KQks7dEvqtlAdIDh8ccOokwLlIEq1qfBfGPetaa+GqOPxTbhG9HWdhnlV9jo7LG6gTy15rKsAkciG5AUsZsI9uJObR0YTxt1IxKiGUTfiNf8bGMu9Qs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:298a5847-d392-4c3d-b7fd-2ccc6142f00e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:1cfbbcbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1d5ad584514211ee9b7791016c24628a-20230912
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 724426915; Tue, 12 Sep 2023 00:58:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:58:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:58:06 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Moudy
 Ho" <moudy.ho@mediatek.com>
Subject: [PATCH v5 01/14] arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
Date: Tue, 12 Sep 2023 15:57:52 +0800
Message-ID: <20230912075805.11432-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230912075805.11432-1-moudy.ho@mediatek.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.350500-8.000000
X-TMASE-MatchedRID: 0VUFvhcn2zGtGUuyWCB/Kov2/i8VNqeOTJDl9FKHbrmcq6An+rYU0aPF
	jJEFr+olwXCBO/GKkVr3FLeZXNZS4CiM3WUt6LtFq75+vYUEA6c1eDdHSu1zer3ImkgySmfNZD2
	GrhvHTdNT/H8FxK09S4RGm6Pfc7I/U5SBgP48jsZUtJVflqbs7O3+vHT2M5IReZUpm6wun3ba/0
	6NhYDa4wyzCDjlUx89djekYOaiKTo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.350500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4A4A701C13C3B14EFF21FAE6838F6E2B81B29EBD16EA211067CC0034D71129622000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_005814_269574_4285C600 
X-CRM114-Status: GOOD (  10.30  )
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

In order to generalize the node names, the DMA-related nodes
corresponding to MT8183 MDP3 need to be corrected.

Fixes: 60a2fb8d202a ("arm64: dts: mt8183: add MediaTek MDP3 nodes")
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5169779d01df..bab68c233792 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1781,7 +1781,7 @@
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
-		mdp3-rdma0@14001000 {
+		dma-controller0@14001000 {
 			compatible = "mediatek,mt8183-mdp3-rdma";
 			reg = <0 0x14001000 0 0x1000>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
@@ -1793,6 +1793,7 @@
 			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
 			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
 				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>;
+			#dma-cells = <1>;
 		};
 
 		mdp3-rsz0@14003000 {
@@ -1813,7 +1814,7 @@
 			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
 		};
 
-		mdp3-wrot0@14005000 {
+		dma-controller@14005000 {
 			compatible = "mediatek,mt8183-mdp3-wrot";
 			reg = <0 0x14005000 0 0x1000>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
@@ -1822,6 +1823,7 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_MDP_WROT0>;
 			iommus = <&iommu M4U_PORT_MDP_WROT0>;
+			#dma-cells = <1>;
 		};
 
 		mdp3-wdma@14006000 {
-- 
2.18.0


