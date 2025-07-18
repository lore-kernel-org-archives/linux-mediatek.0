Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BFAC83F3E
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4LU5ee59xbi0gP8ZOQc4XgfhNEmLH0wOblWiJzYESI=; b=MvucrJEKDAY8+EW+/VdJ6vSpuC
	VM05J6YAliXGDRSAMBDb1fB9meL+f+RbW/J4qxmO0e7jsVqYkSE/ERFHZCJnNm+3ZD52++x5d2eMB
	NqUcw2x8Klp9qxJVXcY+SUGDV+Cf7rTouaIXUIdMzP/Esl8tIrwt8nmdqDEaxBEoeZWtihZc5N7KB
	0y0tTgYsfYs7SblII6VXI24lNKLFb+E1nFamEydcwEvGQ9FAt4t4r/V1v4j8NnzonRPSPCuUJVPRb
	vqIqndeEyZlPlTnmKr+lbFZvbg4phoDE3nXE+o3SbiW7/JJh+FB2OkL7VNQmsSOeRW2KBH4OVP0ot
	O5NFqLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciQF-0000000CJKp-30uf;
	Fri, 18 Jul 2025 10:34:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchoW-0000000CFAK-0PDB
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Jul 2025 09:55:37 +0000
X-UUID: 56679fd063bd11f09f706fa2197c6ceb-20250718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B4LU5ee59xbi0gP8ZOQc4XgfhNEmLH0wOblWiJzYESI=;
	b=k8mR9eAAUEQXrLmnC5zsVnh+TdSbzuKtSqrsfwK5+GommRk1ciLWBMpbgbah8itG/+73aOlPZitBSYSHD4dcC+yOUDyuIWnRhoc4wLMIfFcchspJl9aoHek6XSBEptc1b+nyxAiGJsWzWHhzA+IT/NxIp33cnBWTDU2DMUHwX2E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:62cbd608-3b64-4280-8141-8b1246391a54,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:70d5ec0e-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 56679fd063bd11f09f706fa2197c6ceb-20250718
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 332662980; Fri, 18 Jul 2025 02:55:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Jul 2025 17:55:26 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Jul 2025 17:55:26 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2 1/9] ufs: host: mediatek: Remove unnecessary boolean conversion
Date: Fri, 18 Jul 2025 17:51:44 +0800
Message-ID: <20250718095524.682599-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250718095524.682599-1-peter.wang@mediatek.com>
References: <20250718095524.682599-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_025536_145922_99637F58 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Peter Wang <peter.wang@mediatek.com>

This patch removes unnecessary boolean conversions to ensure consistency
with other usages in ufs-mediatek.c. The changes simplify the code by
directly returning the result of bitwise operations without converting
them to boolean values.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 182f58d0c9db..14f0130da653 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -96,28 +96,28 @@ static bool ufs_mtk_is_boost_crypt_enabled(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return !!(host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
+	return (host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
 }
 
 static bool ufs_mtk_is_va09_supported(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return !!(host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
+	return (host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
 }
 
 static bool ufs_mtk_is_broken_vcc(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return !!(host->caps & UFS_MTK_CAP_BROKEN_VCC);
+	return (host->caps & UFS_MTK_CAP_BROKEN_VCC);
 }
 
 static bool ufs_mtk_is_pmc_via_fastauto(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return !!(host->caps & UFS_MTK_CAP_PMC_VIA_FASTAUTO);
+	return (host->caps & UFS_MTK_CAP_PMC_VIA_FASTAUTO);
 }
 
 static bool ufs_mtk_is_tx_skew_fix(struct ufs_hba *hba)
-- 
2.45.2


