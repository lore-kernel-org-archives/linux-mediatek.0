Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903E6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BU/vb1T4/AmX8PsznKUvM9J58WiKN7FOTpgWz4HqPsE=; b=oD/r78UO+UOABfWRVHYWFO+bUb
	AFgW07iEU6hvmvxsCk5qnUINqpf+w8MUtME++bY/1MywTDYcgFphfDG4OSaujAnCuvn039hxCw9k8
	oELTMxmFhUSMNMDI5myjJISRCIv7ephYXL/5siipys0kdmqG97pYGcV4wIPe3zxoqLueuIWLnN8Cu
	GIrruPCOgB7Dzdc7D/SefACRocJC01SBU7icABj7wePV17v77VInkV4dHOrcKj2DDnnmTHGERnaHs
	YQQJ/7TbkWufE/y8q+3ti3meoaQNU8ca4w3diQZPEuLItF3cIyYUseDNpf97LG+NmaRoWwIGSRVqE
	HiDzx/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10J8-005bPt-1f;
	Thu, 09 Nov 2023 08:22:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10J5-005bNS-25;
	Thu, 09 Nov 2023 08:22:33 +0000
X-UUID: 1b7aee387ed911ee9b7791016c24628a-20231109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BU/vb1T4/AmX8PsznKUvM9J58WiKN7FOTpgWz4HqPsE=;
	b=nBI1toItkOIXUxdOG4/u26ienwqmarM3CkMIqMb3gErVN5fdFxvE55wx8lHPFchNPSoiR4A8yB8Q/Mf0oj/GNMyOoBtkI13e0Yy2p/1ZcuOAER8xw0jc6KXnO7QeOLQvy8GU2nxUZr6Ek5pR6b335pBujn4kq3tOe54d46dNpew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:d2993fec-fabd-4b62-9224-5a6ffc158ab3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:40cb7472-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1b7aee387ed911ee9b7791016c24628a-20231109
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 833492450; Thu, 09 Nov 2023 01:22:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 9 Nov 2023 16:22:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 9 Nov 2023 16:22:02 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Nathan Lu <nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>
Subject: [PATCH 1/3] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
Date: Thu, 9 Nov 2023 16:21:59 +0800
Message-ID: <20231109082201.7698-2-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231109082201.7698-1-yu-chang.lee@mediatek.com>
References: <20231109082201.7698-1-yu-chang.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.713300-8.000000
X-TMASE-MatchedRID: cAwOsowI+VI9S3IiQd+eNQPZZctd3P4B7f6JAS2hKPjzYcyIF7RSVUJM
	0WayO38293LsYxp0JcCAMuqetGVetnyef22ep6XYOwBXM346/+yM9Ua9k8upKwxegQaluhXR/2K
	hHD7tAS9MLZjh2GXqCdemleE2qBNU
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.713300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AD6E27B88C9127213837B2B8D37D4225CD92AD89CCF4C621C718CBBE78B2CC6F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_002231_694377_7C7F69E3 
X-CRM114-Status: UNSURE (   9.61  )
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

Add MT8188 VPPSYS0 and VPPSYS1 driver data.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 88209102ff3b..1e5239cc5445 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -89,6 +89,16 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vppsys0_driver_data = {
+	.clk_driver = "clk-mt8188-vpp0",
+	.is_vppsys = true,
+};
+
+static const struct mtk_mmsys_driver_data mt8188_vppsys1_driver_data = {
+	.clk_driver = "clk-mt8188-vpp1",
+	.is_vppsys = true,
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -429,6 +439,8 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt8183-mmsys", .data = &mt8183_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8186-mmsys", .data = &mt8186_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8188-vdosys0", .data = &mt8188_vdosys0_driver_data },
+	{ .compatible = "mediatek,mt8188-vppsys0", .data = &mt8188_vppsys0_driver_data },
+	{ .compatible = "mediatek,mt8188-vppsys1", .data = &mt8188_vppsys1_driver_data },
 	{ .compatible = "mediatek,mt8192-mmsys", .data = &mt8192_mmsys_driver_data },
 	/* "mediatek,mt8195-mmsys" compatible is deprecated */
 	{ .compatible = "mediatek,mt8195-mmsys", .data = &mt8195_vdosys0_driver_data },
-- 
2.18.0


