Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB7BC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tah2dAHbxREASTnvJuJls1whJtxCEwW9tPvWPYuqkMo=; b=ycOcv0NaVMdVkM+vaMMlhhBMhY
	qKKGmRMRU2UF+0ysbcIP4NFTQty4W3wMyaa1iXtqVKHks4MV2OlNcNfQzdug9qb2bH9OPbzMfLzjo
	ShMVvgzq6/eqywU5iUgUB1ZPBDqCAMLOyp3xQG6xD7EtVKIMlc8u+bGjpelzq54I9s4NswagW1TDb
	csukFCQaSgVjv345KPAK7CxkXaL6q2yKXjdqbHluO7ffiy8TVbDD9iM3G8IlROutxjKPY7oghdyIV
	mwnpDY+7y5pF/BO5FSpXHY7DcoZYytkl6Fw9rxHqvEOaX9pJFhYYz0+ZNm0Jf5IOfz/f+iH/B4R5Y
	OK62l2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmAi3-00H9g2-3D;
	Tue, 11 Apr 2023 09:54:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmAi0-00H9fJ-2C;
	Tue, 11 Apr 2023 09:54:41 +0000
X-UUID: df4fca9ad84e11ed8687db9d93187ff1-20230411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tah2dAHbxREASTnvJuJls1whJtxCEwW9tPvWPYuqkMo=;
	b=QbR8mNcE+jZuM+PiT6wQZLjt0GveBogC1IzTT9YOfLyPCWefJ6JyJZc31hxlBXCiVwP/QrN91rhqArNZDr1XuX4jUM89M0Pxe//QI1IdmuTPDKq82wqoCb7/6jTgF6LQBBjFsoparFhD1poPvKPqp03CuygbC+MqQGb9stI7FkI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:2769d050-d6d4-45dd-9697-e98e4a010b88,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:3d0faf83-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: df4fca9ad84e11ed8687db9d93187ff1-20230411
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1653532697; Tue, 11 Apr 2023 02:54:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 11 Apr 2023 17:34:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 11 Apr 2023 17:34:00 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, <nfraprado@collabora.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <jianjiao.zeng@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>
Subject: [PATCH v7 12/14] arm64: dts: mt8195: Remove the unnecessary dma-ranges
Date: Tue, 11 Apr 2023 17:31:42 +0800
Message-ID: <20230411093144.2690-13-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411093144.2690-1-yong.wu@mediatek.com>
References: <20230411093144.2690-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_025440_721101_F7A4DC55 
X-CRM114-Status: UNSURE (   9.16  )
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

After we add the dma-ranges in the parent "soc" node,
this property is unnecessary for the leaf node.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8f1264d5290b..89f469ba9f6c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2299,7 +2299,6 @@ venc: video-codec@1a020000 {
 			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
 		};
 
 		jpgdec-master {
@@ -2311,7 +2310,6 @@ jpgdec-master {
 				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
 				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
 				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
-			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -2383,7 +2381,6 @@ jpgenc-master {
 					<&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
 					<&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
 					<&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
-			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-- 
2.25.1


