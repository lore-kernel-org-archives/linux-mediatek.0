Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA56DC71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 01:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=im0q8ClCjXD2mvVerYz5I3/8z9Q0AW/ovNXXUp9V+iY=; b=xwvZ6DSaJ35JQ4ZIUiqOeUREoX
	7LrbMbStqZ30nr+dXpHShWMeEzwt8GNugMm1WnbEDYzi0TTEOMcBuXBnga6d/f2VBqWYs/74JBQiV
	KhV8M06OZbghEAcQNMut8t8KsgLCk6rT71lFliGW4IolaYh/wZ068xxU7P3s0rJi/DcwgPjPCrZlD
	ncFRTrV/j4B5qor84wPfIAeyYTHJaRdiaAeCFGbqZSZP7wNrVHVuqWQXBkXZeVbn1p+5vNrnCWS+Y
	yUz7TP7mitHQYZCIBvIhIHKjlPGJuqnF/EGL+WBOwvDZgBRvwjngFa3KHpMPhrDI8PCsAUPSY6GFf
	fR1FeK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfVjj-00H3WG-2T;
	Mon, 11 Sep 2023 01:29:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfVjg-00H3Vp-02;
	Mon, 11 Sep 2023 01:29:09 +0000
X-UUID: 978f595c504211ee86758d4a7c00f3a0-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=im0q8ClCjXD2mvVerYz5I3/8z9Q0AW/ovNXXUp9V+iY=;
	b=XFrx3yOU2YRryg3Ovz2IveZUrsgtW9oD+cXJwS6OjpghnNgPq0mXVtAFodFEzQwUomZSxav53upWZWxJqm5RkVQ2e3VA/Mqgd/JA2Ne+VHKRJUZ9I1JpFEvqDhqY8gWoME4lOI63ds2LOeZ0Kx9yckB/4JU3lk4LiwYfPYgvWJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:0e4010cf-33d5-400f-8e11-15682df3aec5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:d8aac613-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 978f595c504211ee86758d4a7c00f3a0-20230910
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1675991857; Sun, 10 Sep 2023 18:29:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 09:18:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 09:18:26 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<anan.sun@mediatek.com>, <yf.wang@mediatek.com>, <mingyuan.ma@mediatek.com>,
	"T . J . Mercier" <tjmercier@google.com>
Subject: [PATCH 4/4] iommu/mediatek: mt8188: Enable secure bank for MM IOMMU
Date: Mon, 11 Sep 2023 09:17:51 +0800
Message-ID: <20230911011751.29906-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911011751.29906-1-yong.wu@mediatek.com>
References: <20230911011751.29906-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.598800-8.000000
X-TMASE-MatchedRID: B3Nm01t+RNhCFB88XbRv2bEKX02srTXIecN1rDssvvDfUZT83lbkEN6M
	yUV+2+DZGlJMOm/5VnDPKWCeeNrZI1xxDx5qbkR9FEUknJ/kEl4YSQiB0ZTudfoLR4+zsDTt+GY
	UedkXNWqL/HZHDiyt++LzVTV0D0HpQEFsbYa5mcq99t6fBcMggP3DHWJiJx+xOZ4YLhUX84hl1c
	/Yz0rsldD5p8F+rstIdazI6Mv0D0LyNp7g4PXe0BXsxz6ujBxUq1f8XSkHBUmNJXmEMVvLtmcjF
	nImzvyS
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.598800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A88BD7686A6A1EF7415F10E6A74A8CDC5FA3F3BCB510FDC2C554BB6F39BEFA0D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_182908_068785_93254F2D 
X-CRM114-Status: GOOD (  10.09  )
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

Enable secure bank for MT8188 VDO IOMMU and VPP IOMMU to support
secure video path (SVP) feature. The last bank is the secure bank.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 24d7f5138f7b..f17046157c79 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1667,11 +1667,11 @@ static const struct mtk_iommu_plat_data mt8188_data_vdo = {
 	.m4u_plat       = M4U_MT8188,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_3BITS | OUT_ORDER_WR_EN |
 			  WR_THROT_EN | IOVA_34_EN | SHARE_PGTABLE |
-			  PGTABLE_PA_35_EN | MTK_IOMMU_TYPE_MM,
+			  PGTABLE_PA_35_EN | MTK_IOMMU_TYPE_MM | SECURE_BANK_ENABLE,
 	.hw_list        = &m4ulist,
 	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
-	.banks_num      = 1,
-	.banks_enable   = {true},
+	.banks_num      = 5,
+	.banks_enable   = {true, false, false, false, true},
 	.iova_region    = mt8192_multi_dom,
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
 	.iova_region_larb_msk = mt8188_larb_region_msk,
@@ -1684,11 +1684,11 @@ static const struct mtk_iommu_plat_data mt8188_data_vpp = {
 	.m4u_plat       = M4U_MT8188,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_3BITS | OUT_ORDER_WR_EN |
 			  WR_THROT_EN | IOVA_34_EN | SHARE_PGTABLE |
-			  PGTABLE_PA_35_EN | MTK_IOMMU_TYPE_MM,
+			  PGTABLE_PA_35_EN | MTK_IOMMU_TYPE_MM | SECURE_BANK_ENABLE,
 	.hw_list        = &m4ulist,
 	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
-	.banks_num      = 1,
-	.banks_enable   = {true},
+	.banks_num      = 5,
+	.banks_enable   = {true, false, false, false, true},
 	.iova_region    = mt8192_multi_dom,
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
 	.iova_region_larb_msk = mt8188_larb_region_msk,
-- 
2.25.1


