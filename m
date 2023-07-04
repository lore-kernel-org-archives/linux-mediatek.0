Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F89CEB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kDmDXnjKdjFDPlrVeD7IKJ7Ywmn7ZI+Wx6K1yIaJQEA=; b=yOGvQEs8fM6ZvQc+BypbhqEM1+
	IDegvDU3sHGj1p5KUNncGk2MsvDCiCMwYG8LOVpeR2BhFft4i5w9TzrYNcUFg3Q/dhEEDlkjPiB/W
	YzbLzBVpl/L5yTPNcleTzNy5sq+yHoFLI66khIQnukVt5+J/eII9ZYfIKzDS7l2qRySiKyJPPKGYF
	jV3UBVXH6GHPxFSzO3Cr9Q7KCbhT3TBoIYKA6YT7/vig7eiPnoodVGIqmrE0uukAD22bBh39pbdWq
	hKIjGYVgxnxrIx0DCS1WGnLUU5Fv2+zLHEhWJcQGnQIiSs5ACqjrmaNHmQHsWPTgpQFjBpA33Xj4p
	tQ87CXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGeeM-00DB2x-1A;
	Tue, 04 Jul 2023 11:56:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGeeJ-00DB2B-10;
	Tue, 04 Jul 2023 11:56:52 +0000
X-UUID: d81c1c601a6111ee912e1518a6540028-20230704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kDmDXnjKdjFDPlrVeD7IKJ7Ywmn7ZI+Wx6K1yIaJQEA=;
	b=U0+UN2ctIVNOINxIiOMPfSIuBl9lpsKl3hpCqX2xCsIMfbTzI2JtgIzMmHlH32EW0guaNVhvSxsdT5RSbJvHG1jn7l1ZJJfUu+9sWpYab0HzshDV+rndfjcVLuu5HU4PwxMG17a7dLAManHQTMvKBTZ4Fd69VqImXhPHDAtSP5Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:59e5e2cd-eb0f-4b72-9964-45bceebd50af,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.27,REQID:59e5e2cd-eb0f-4b72-9964-45bceebd50af,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:01c9525,CLOUDID:1f68d90d-c22b-45ab-8a43-3004e9216b56,B
	ulkID:230704195642DL3I3ZRD,BulkQuantity:2,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: d81c1c601a6111ee912e1518a6540028-20230704
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 744830507; Tue, 04 Jul 2023 04:56:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 4 Jul 2023 19:56:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 4 Jul 2023 19:56:40 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong Wu
	<yong.wu@mediatek.com>, <iommu@lists.linux.dev>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] iommu/mediatek: Remove a unnecessary checking for larbid
Date: Tue, 4 Jul 2023 19:56:34 +0800
Message-ID: <20230704115634.7727-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_045651_499060_53134D0C 
X-CRM114-Status: GOOD (  11.29  )
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

Fix a coverity issue:

>>assignment: Assigning: larbid = (fwspec->ids[0] >> 5) & 0x1fU.
	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
>>between: At condition larbid >= 32U, the value of larbid must be between
>>0 and 31.
>>dead_error_condition: The condition larbid >= 32U cannot be true.
	if (larbid >= MTK_LARB_NR_MAX)
>>CID 11306470 (#1 of 1): Logically dead code (DEADCODE)
>>dead_error_line: Execution cannot reach this statement:
>>return ERR_PTR(-22L);
        	return ERR_PTR(-EINVAL);

The checking "if (larbid >= MTK_LARB_NR_MAX)" is unnecessary.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
Rebase on v6.4-rc1.
---
 drivers/iommu/mtk_iommu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index aecc7d154f28..67caa90b481b 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -838,9 +838,6 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 	 * All the ports in each a device should be in the same larbs.
 	 */
 	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
-	if (larbid >= MTK_LARB_NR_MAX)
-		return ERR_PTR(-EINVAL);
-
 	for (i = 1; i < fwspec->num_ids; i++) {
 		larbidx = MTK_M4U_TO_LARB(fwspec->ids[i]);
 		if (larbid != larbidx) {
-- 
2.25.1


