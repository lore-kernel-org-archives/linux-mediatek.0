Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374FFC83F27
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igl7SH5JDLTywDS2p1Q+tp8LtvRBkpXdg66r0qK08wE=; b=ha7vVf8cVhWJshhmhtXrJBWLPY
	M4nP86RyhnDeFnJcjc9Guv4YQzrEcdMB7F+SqfXcJY/oxmoHybYngw3EJil1ToHGTr5i+dbLJIBYB
	K4Boy3ltNcP+FoFXeB8tGx/e+ykIKFvrdl1SzKEFqQMYwHLo13JcnOs02cKmJ57QkpBVfUIoNs7Mq
	PrBNKPPxRGwVQopu/wsL5tW+Wh9Io3aaC+WJH92eKWbrwmtqlI2eKkiwq6m3qhuKrc+PorwaFTD+C
	fPNaTIm8YcUav5MvnWxCpu6GqdVezcK7cZuuqfzG0KVeWZ4SFAmYPP9woy2zXkLP4TxlYE3PXtMii
	iEaXIyPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvva-00000006vAS-3kXX;
	Wed, 16 Jul 2025 06:47:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvdD-00000006tHA-34fz
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 06:28:45 +0000
X-UUID: 19fcf622620e11f09eb0dd999d3936bf-20250715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=igl7SH5JDLTywDS2p1Q+tp8LtvRBkpXdg66r0qK08wE=;
	b=gN9RUBo71NqhcHWPXwbWmmgMNmrFf6bEh014QCned+TUMCB/uNJqTS1EtaWQauJqJfth79UbnXjglGMu2s0PLTMSzbmjyt7OL08WCxrs5aJVJxYtO0QYZGSof40rj0ehS7epf9Abo9+tXW09wPzF+MtQIfXvPBenCEqysbCPYnA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b92c9f0a-b4e0-4a8c-9df9-88ff512db7a9,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:73dcea49-3902-4ad6-a511-6378a8132fbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 19fcf622620e11f09eb0dd999d3936bf-20250715
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1018499964; Tue, 15 Jul 2025 23:28:35 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Jul 2025 14:28:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 16 Jul 2025 14:28:31 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v1 01/10] ufs: host: mediatek: Change return type to bool
Date: Wed, 16 Jul 2025 14:25:26 +0800
Message-ID: <20250716062830.3712487-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250716062830.3712487-1-peter.wang@mediatek.com>
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_232843_813056_D1C3F46B 
X-CRM114-Status: GOOD (  10.91  )
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

This patch updates the return type to bool for consistency
with the previous style.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 182f58d0c9db..e56763e6c650 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -124,21 +124,21 @@ static bool ufs_mtk_is_tx_skew_fix(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return (host->caps & UFS_MTK_CAP_TX_SKEW_FIX);
+	return !!(host->caps & UFS_MTK_CAP_TX_SKEW_FIX);
 }
 
 static bool ufs_mtk_is_rtff_mtcmos(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return (host->caps & UFS_MTK_CAP_RTFF_MTCMOS);
+	return !!(host->caps & UFS_MTK_CAP_RTFF_MTCMOS);
 }
 
 static bool ufs_mtk_is_allow_vccqx_lpm(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return (host->caps & UFS_MTK_CAP_ALLOW_VCCQX_LPM);
+	return !!(host->caps & UFS_MTK_CAP_ALLOW_VCCQX_LPM);
 }
 
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
-- 
2.45.2


