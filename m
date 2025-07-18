Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24990C83F17
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbOhcVeC6+s+TuG0DtMpL3rCihlIFdMbY09xg4A7nlU=; b=T9KAGnjtJRU8lNcL1i3qJact3m
	qg5Q+3Nkr7rLaO0YaIiLI9GgnZFZzQ64cn/BU0nY8Wm9bnbj9tl8gT/3dfGh69ZZeYlnV3rRThGsK
	KZj9mUZ+T9RqxENHdo6nBn1jyoXRxx6IbNnlRyas9rx8cQ49LFi1Tj7xHTIPKVs7lFhQw86wgXKh9
	i7leJCvSJlncqKGKFHAWV2YyLpw708DV4mzgIQH2qlCn0hGHTTGtuzJ09CbhUdPmnWPQrL5Bbq4kX
	u1ov+VaM2h1vtG/mSPcVM0WpNnJXlbIB1I+glEk0GCmFg301Meq10jAdkFmnhCL7USTTNhJOhLmVN
	85KZRkAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgmR-0000000C5ME-1xdo;
	Fri, 18 Jul 2025 08:49:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgVx-0000000C3Hz-2q2V;
	Fri, 18 Jul 2025 08:32:22 +0000
X-UUID: b590918a63b111f09eb0dd999d3936bf-20250718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bbOhcVeC6+s+TuG0DtMpL3rCihlIFdMbY09xg4A7nlU=;
	b=nj33n3Y8DD/1yCYuhpgkbniVyUVLgTNgXWNjSrVkEdcu1tiWJRGZ3WckSjr9hEPEtXcRuDmbxQRUnT7ci9QFgxHAWGP5RAKanEz6pgZyvGpmb7DFlfdAtoL4CZmquBmzlVmlm23rrZD91ElK0RyNYoFmpJM4AbD7XLXZX573Viw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:6c2720c2-e540-420c-a62c-0a8009d298d5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:f1fbeb0e-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b590918a63b111f09eb0dd999d3936bf-20250718
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1276370455; Fri, 18 Jul 2025 01:32:15 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Jul 2025 16:32:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Jul 2025 16:32:11 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Sean Wang
	<sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<openembedded-core@lists.openembedded.org>, <patches@lists.linux.dev>,
	<stable@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
Date: Fri, 18 Jul 2025 16:32:01 +0800
Message-ID: <20250718083202.654568-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250718083202.654568-1-macpaul.lin@mediatek.com>
References: <20250718083202.654568-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_013221_722294_06A9FFED 
X-CRM114-Status: GOOD (  15.30  )
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

Add a basic device-tree (mt8395-genio-1200-evk-ufs.dts) in order to be able
to use UFS storage as the main storage on Genio 1200 EVK board.

This board is the origin Genio 1200 EVK already mounted two main storages,
one is eMMC, and the other is UFS. The system automatically prioritizes
between eMMC and UFS via BROM detection, so user could not use both storage
types simultaneously. As a result, mt8395-evk-ufs must be treated as a
separate board.

It use mt8395-genio-common.dtsi file to use common definitions.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8395-genio-1200-evk-ufs.dts    | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index f68865d06edd..c34ca7ae3155 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -100,6 +100,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
new file mode 100644
index 000000000000..f362097489a2
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Ramax Lo <ramax.lo@mediatek.com>
+ *         Macpaul Lin <macpaul.lin@mediatek.com>
+ */
+/dts-v1/;
+#include "mt8395-genio-common.dtsi"
+
+&ufshci {
+	status = "okay";
+	vcc-supply = <&mt6359_vemc_1_ldo_reg>;
+	vccq2-supply = <&mt6359_vufs_ldo_reg>;
+};
+
+&ufsphy {
+	status = "okay";
+};
+
+&mmc0 {
+	status = "disabled";
+};
+
+/ {
+	model = "MediaTek Genio 1200 EVK-P1V2-UFS";
+	compatible = "mediatek,mt8395-evk-ufs", "mediatek,mt8395",
+		     "mediatek,mt8195";
+};
-- 
2.45.2


