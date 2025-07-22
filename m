Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F747C83F25
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 09:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKOODA8AhDMVK+3zgK4+VmsoIhuWOIaeZX3PHT4WMgo=; b=OHIg/Kp5fpQ1qcSR0FH8pKyZld
	peW/Q95a32GOnx8xiGmQ8P1RiEIS8KBCibCFMujh0fpLDvAFGJmPS7c2m+bzKhhrkJbjES3PSx8Aw
	wTQfOY0dWzcYsywTwRJ3wneVue0F/2dR1g1Hy+ZCF6Na6EP9KrM8ioh02tBU++xhQoFTF7Q2XX2cQ
	nHilm6JqKOud023MldXu9H9a+1qebANHMCKuFST2GD6oVv7TjFzUmSYCYPRBEHOeBLlCq4h5D1iQq
	6yZXNptHLKT6ZuXcCHvvWUHhb0P3/oCptQjpkgEqCo+meLDP/oJKoyPjFWNJNOEpM4QKrzjlLaoH4
	OVFnnt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8sb-00000001vzF-1YtH;
	Tue, 22 Jul 2025 09:01:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8ol-00000001v4h-30gC;
	Tue, 22 Jul 2025 08:57:48 +0000
X-UUID: ec1b941866d911f09eb0dd999d3936bf-20250722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oKOODA8AhDMVK+3zgK4+VmsoIhuWOIaeZX3PHT4WMgo=;
	b=iogyFG8GP6r6CrRcKehdXCLuO6JV4CAbBsmF2LulpIBsuQi2XnEDEUcT+D0sBq1x6HVVasBVt+H7ORbHncKPQgPpwHPZNbrps7hk6PoXiW/dekG4jw2lG3xqC7z1wil+yIeMg02DLkmi/IlhX1vDpocACRyrVi9+Y5h8b/TXJhU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:d42ec1e0-8eab-4fb9-8c4c-0f7cc11765ab,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:12641f50-93b9-417a-b51d-915a29f1620f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ec1b941866d911f09eb0dd999d3936bf-20250722
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 191178884; Tue, 22 Jul 2025 01:57:40 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Jul 2025 16:57:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Jul 2025 16:57:36 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Peter Wang
	<peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, "James E . J
 . Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K . Petersen"
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Rice Lee
	<ot_riceyj.lee@mediatek.com>, Eric Lin <ht.lin@mediatek.com>
Subject: [PATCH v2 4/4] arm64: dts: mediatek: mt8195: add UFSHCI node
Date: Tue, 22 Jul 2025 16:57:20 +0800
Message-ID: <20250722085721.2062657-4-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_015747_766228_A3F6AF45 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Rice Lee <ot_riceyj.lee@mediatek.com>

Add a UFS host controller interface (UFSHCI) node to mt8195.dtsi.
Introduce the 'mediatek,ufs-disable-mcq' property to allow disabling
Multiple Circular Queue (MCQ) support.

Signed-off-by: Rice Lee <ot_riceyj.lee@mediatek.com>
Signed-off-by: Eric Lin <ht.lin@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Changes for v2:
 - No change.

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index dd065b1bf94a..8877953ce292 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1430,6 +1430,31 @@ mmc2: mmc@11250000 {
 			status = "disabled";
 		};
 
+		ufshci: ufshci@11270000 {
+			compatible = "mediatek,mt8195-ufshci";
+			reg = <0 0x11270000 0 0x2300>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&ufsphy>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_AES_UFSFDE>,
+				 <&infracfg_ao CLK_INFRA_AO_AES>,
+				 <&infracfg_ao CLK_INFRA_AO_UFS_TICK>,
+				 <&infracfg_ao CLK_INFRA_AO_UNIPRO_SYS>,
+				 <&infracfg_ao CLK_INFRA_AO_UNIPRO_TICK>,
+				 <&infracfg_ao CLK_INFRA_AO_UFS_MP_SAP_B>,
+				 <&infracfg_ao CLK_INFRA_AO_UFS_TX_SYMBOL>,
+				 <&infracfg_ao CLK_INFRA_AO_PERI_UFS_MEM_SUB>;
+			clock-names = "ufs", "ufs_aes", "ufs_tick",
+					"unipro_sysclk", "unipro_tick",
+					"unipro_mp_bclk", "ufs_tx_symbol",
+					"ufs_mem_sub";
+			freq-table-hz = <0 0>, <0 0>, <0 0>,
+					<0 0>, <0 0>, <0 0>,
+					<0 0>, <0 0>;
+
+			mediatek,ufs-disable-mcq;
+			status = "disabled";
+		};
+
 		lvts_mcu: thermal-sensor@11278000 {
 			compatible = "mediatek,mt8195-lvts-mcu";
 			reg = <0 0x11278000 0 0x1000>;
-- 
2.45.2


