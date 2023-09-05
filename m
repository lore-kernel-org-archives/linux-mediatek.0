Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD561CA0FE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 03:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4dyYXyL7RU5UnXE05o13Pbj4LUrckjq2hXc574i32Y=; b=2lJOcRmpeTmhKzAvTQkatpYIPX
	OD6+b5iz1rx2EOW+MStxB4dIp0tfYRSCqrKwkAoPjInnYV+/+5wi9KQOMSv4zhsrMAwqQbZf8ePt8
	mOC0ENwZqrgMyil/VJINb+Kah9Gj28WloiARDMDU2xH3VXPtJ4Ox1G59+uI9o2IrH2aBgIFz7K2ro
	Vp+l2SxtUwPXV/PEzyQo2y+nLF9r5p9DnzSPvGc9OkcA2d6k/0X0nVGFxtTd+Sr4OAIwAUowq1Gqx
	e3iaT8bo7uTJc/rP8b2aX4HlZFv1jpP/HWDaeKp32o+CMLTdZbDItBEcVsMtnYLbhl1vptwQXwWWD
	JeUcubAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdNAU-005ByG-0p;
	Tue, 05 Sep 2023 03:55:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdNAR-005Bxh-2s;
	Tue, 05 Sep 2023 03:55:57 +0000
X-UUID: 1b9b8da84ba011ee86758d4a7c00f3a0-20230904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=W4dyYXyL7RU5UnXE05o13Pbj4LUrckjq2hXc574i32Y=;
	b=E1ennS2vxLmzW9ikhXdckQCR08ks/om54edlauMWXT/Mc5m+r2HE+dNG3gLv9rPAB0k1M7itMYWEzWMP6ihbJj8xW1MR7c9kjvZHX7kl9cxeBcunXNtKaB43WPXOvWw5ObatrC4wu+O86PNyn/FPbF2nw0FZuOn4Zq/CFjIg558=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:81f3e190-dab1-4b3a-ac75-c4cac3b72270,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:441d51ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1b9b8da84ba011ee86758d4a7c00f3a0-20230904
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1662943875; Mon, 04 Sep 2023 20:55:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Sep 2023 11:45:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Sep 2023 11:45:16 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Fabien Parent
	<fparent@baylibre.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 2/2] arm64: dts: mediatek: mt8195-demo: update and reorder reserved memory regions
Date: Tue, 5 Sep 2023 11:45:11 +0800
Message-ID: <20230905034511.11232-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230905034511.11232-1-macpaul.lin@mediatek.com>
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230905034511.11232-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_205555_931777_4BBDE1F8 
X-CRM114-Status: GOOD (  13.88  )
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

The dts file of the MediaTek MT8195 demo board has been updated to include
new reserved memory regions.
These reserved memory regions are:
 - SCP
 - VPU,
 - Sound DMA
 - APU.

These regions are defined with the "shared-dma-pool" compatible property.
In addition, the existing reserved memory regions have been reordered by
their addresses to improve readability and maintainability of the DTS
file.

Cc: stable@vger.kernel.org      # 6.1, 6.4, 6.5
Fixes: e4a417520101 ("arm64: dts: mediatek: mt8195-demo: fix the memory size of node secmon")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 37 ++++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

Changes for v2:
 - No change.

Changes for v3:
 - Fix vpu_mem and apu_mem node according to the result of "make dtbs_check W=1"
 - Fix comment style to Linux for optee node.

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index ff363ab925e9..5d635085fe3f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -56,13 +56,8 @@
 		#size-cells = <2>;
 		ranges;
 
-		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
-		bl31_secmon_reserved: secmon@54600000 {
-			no-map;
-			reg = <0 0x54600000 0x0 0x200000>;
-		};
-
-		/* 12 MiB reserved for OP-TEE (BL32)
+		/*
+		 * 12 MiB reserved for OP-TEE (BL32)
 		 * +-----------------------+ 0x43e0_0000
 		 * |      SHMEM 2MiB       |
 		 * +-----------------------+ 0x43c0_0000
@@ -75,6 +70,34 @@
 			no-map;
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
+
+		scp_mem: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+
+		vpu_mem: memory@53000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x53000000 0 0x1400000>; /* 20 MB */
+		};
+
+		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
+		bl31_secmon_mem: memory@54600000 {
+			no-map;
+			reg = <0 0x54600000 0x0 0x200000>;
+		};
+
+		snd_dma_mem: memory@60000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60000000 0 0x1100000>;
+			no-map;
+		};
+
+		apu_mem: memory@62000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x62000000 0 0x1400000>; /* 20 MB */
+		};
 	};
 };
 
-- 
2.18.0


