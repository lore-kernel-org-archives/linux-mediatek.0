Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22180C83F25
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 03:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eT5G26it2LoWLpqBvVCXM8qF2bBmdhGjdsCmJd3WkD8=; b=elEN58PfCnTRhJFME9JfmgvxYs
	KEjawv2oHZF378PMco8JlL8AD1q3E4JS4BeiBXIetOqIuP53To0fST6vpp+IHacZCTyDVp3v9hVnJ
	7EVNBLAjhN0rGxwp00cUOpTSXV0IcLnAh8a0kOtCdEy4mrcA67kXjvNmOtoNDnIoeacVkywfR+uut
	db1+WrEJTajUGhJGv2XcgcD+LKiQvYrNF2AfVkgO6Q5Ni+C2RzzICuzLlDl2uslD2S6THtqJzD06I
	yrttL5/tUm3D4VHVrzmWjFJolsb2yn6in/Hs3bSQUM0DQ6awRkh172wvTNmD2mfffDJNMuXUz0X20
	p1w+fUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3N6-000000018U2-1Req;
	Tue, 22 Jul 2025 03:08:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3N4-000000018Sh-0q1Q
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 03:08:51 +0000
X-UUID: 2e06bbf466a911f09f706fa2197c6ceb-20250721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eT5G26it2LoWLpqBvVCXM8qF2bBmdhGjdsCmJd3WkD8=;
	b=dkgTBkqBomZFJ5IP3AyZIcwDVov3ZaVn/7eMFLhY55XrZ7DXSNV9dU84dkoJKMA7chfYRd/yx5WxeB389OyoZRK6GqtLL9zKyA2jb96SHTCgbSXVH5ITARb9DQPDxrP/mPK8gqahvWExHI5T8p3QS7qflEIc79pTTitePb0gvGw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:88b4710e-dbc0-42fd-9be5-5b5bea0a6027,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:310b219a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2e06bbf466a911f09f706fa2197c6ceb-20250721
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 852730203; Mon, 21 Jul 2025 20:08:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Jul 2025 11:08:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Jul 2025 11:08:42 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v4 1/9] ufs: host: mediatek: Simplify boolean conversion
Date: Tue, 22 Jul 2025 11:07:16 +0800
Message-ID: <20250722030841.1998783-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250722030841.1998783-1-peter.wang@mediatek.com>
References: <20250722030841.1998783-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_200850_313087_9813C92A 
X-CRM114-Status: UNSURE (   8.51  )
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

This patch simplifies the conversion from unsigned int to boolean
by removing explicit conversions and parentheses, relying on implicit
conversion instead. This change ensures consistency with other
usages in ufs-mediatek.c and streamlines the code.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 182f58d0c9db..744efcde1fff 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -96,49 +96,49 @@ static bool ufs_mtk_is_boost_crypt_enabled(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return !!(host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
+	return host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE;
 }
 
 static bool ufs_mtk_is_va09_supported(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return !!(host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
+	return host->caps & UFS_MTK_CAP_VA09_PWR_CTRL;
 }
 
 static bool ufs_mtk_is_broken_vcc(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return !!(host->caps & UFS_MTK_CAP_BROKEN_VCC);
+	return host->caps & UFS_MTK_CAP_BROKEN_VCC;
 }
 
 static bool ufs_mtk_is_pmc_via_fastauto(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return !!(host->caps & UFS_MTK_CAP_PMC_VIA_FASTAUTO);
+	return host->caps & UFS_MTK_CAP_PMC_VIA_FASTAUTO;
 }
 
 static bool ufs_mtk_is_tx_skew_fix(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return (host->caps & UFS_MTK_CAP_TX_SKEW_FIX);
+	return host->caps & UFS_MTK_CAP_TX_SKEW_FIX;
 }
 
 static bool ufs_mtk_is_rtff_mtcmos(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return (host->caps & UFS_MTK_CAP_RTFF_MTCMOS);
+	return host->caps & UFS_MTK_CAP_RTFF_MTCMOS;
 }
 
 static bool ufs_mtk_is_allow_vccqx_lpm(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return (host->caps & UFS_MTK_CAP_ALLOW_VCCQX_LPM);
+	return host->caps & UFS_MTK_CAP_ALLOW_VCCQX_LPM;
 }
 
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
-- 
2.45.2


