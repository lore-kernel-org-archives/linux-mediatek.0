Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04A9C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yVSAp3BOn2NMVHDPGQ6AJu+jYwg4kqser2wze3TvZks=; b=aK2dFFuJvDmI/QDb0aVrD55brm
	uXqxtZo6wcaN4tJCBI9478xuNH2GDGDTm6KWsWZnWKmj/MwG2uBC0lODTH2XGZzhJAJzaVT6IcM5b
	eRBki0kxiABchVeF6DSh1ld30X5UXGAiXp8hM1Z4d+Iasj0gtfYEo0mx79Sl6ZK3wNy6Yb7LhV2kv
	UkeEYf+elCaF8WFBl2Kq5+aqkm6rrbEJKO6Vk/RjbvR8edd01jLjSooparYNvzDHTKbcioz/IspAk
	8coFAXshZ6N5RF1crqMYQMH5hEtM/4XLet8j1oNS5NDbbT9BIfhBXxk9UQE8pcxB2FCaE+ce8nHAK
	G0cQtXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQbY-0000000GG16-2mMv;
	Mon, 24 Aug 2026 09:04:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQbU-0000000GFuC-0E9j;
	Mon, 24 Aug 2026 09:04:31 +0000
X-UUID: c8ebeff69f9a11f1afed4741b24580c9-20260824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yVSAp3BOn2NMVHDPGQ6AJu+jYwg4kqser2wze3TvZks=;
	b=pLglmnOamEJZIzk8PC3d0HVWd+fsj8GCpNcL3BhPYkn3+J8lIbsR70QvPqXfAotormSi2zc9EOxMtPv8kxvvgJhbqftr1f5Vy9R3Mq5kY5v/QURRt9vjtJyiHxIycuscVNKczGt/UO5JigdWw0wSkWMIpYfCbmc64zt6HdUL6Eg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fb79ceae-531a-4e1e-a065-894d415011fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:33c795a0-ab86-4d1b-963c-dc790779b75a,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c8ebeff69f9a11f1afed4741b24580c9-20260824
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1732657383; Mon, 24 Aug 2026 02:04:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Aug 2026 17:04:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 24 Aug 2026 17:04:13 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Fei Shao <fshao@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Justin Yeh
	<justin.yeh@mediatek.com>
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0 memory region
Date: Mon, 24 Aug 2026 17:04:00 +0800
Message-ID: <20260824090409.203230-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_020428_112601_D97B96AD 
X-CRM114-Status: GOOD (  12.21  )
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

The SCP firmware in linux-firmware for this platform
(mediatek/mt8188/scp_c0.img) supports MDP, which the mdp3-rdma node
drives through scp_c0. On top of the segments it loads, the firmware
allocates a 1 MiB DMA region at 0x50800000 at run time. That lies
outside the 8 MiB reserved for SCP core0, so Linux is free to allocate
over memory the firmware uses.

Enlarge the region to 9 MiB. apu_mem starts at 0x55000000, so no other
reserved region has to move.

Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first SCP core")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..35f60b5bba6f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -166,7 +166,7 @@ reserved_memory: reserved-memory {
 
 		scp_mem_reserved: memory@50000000 {
 			compatible = "shared-dma-pool";
-			reg = <0 0x50000000 0 0x800000>;
+			reg = <0 0x50000000 0 0x900000>;
 			no-map;
 		};
 
-- 
2.45.2


