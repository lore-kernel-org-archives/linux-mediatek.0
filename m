Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F22C54E66
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIq4WDamNAejLOlLbfTnowDxoUNzQaKvxhfTroNW3B4=; b=u5tPuEtlDM+Qz4D/WpVUX0IuBa
	dciYX9jf+Uk02pbAaK5o67k47zZE58JPcfH9wtmXxaoXOfjdXaC5YRj9128xtlPBpSXFSlUoWTra9
	Pdwjfoa6tCsiREerRxZ6+BpObyjU9R5QDimOJ4+3ruEKPDNKL/GyKaKxJU4un33FNqhoKDtM8WD6j
	hXi+21HY8mIw0A+2Ng8GWaJfU3B7P3Tuj5CFdTplLVYxokLZ5J36D13TVQK48+HECe9V6KRwnL2KY
	kja15+NpMyq1mda/tK4Y0oHOaU0Bi5umuAIHzvQLddrjSk/DWP9rZCNoTZB72YKiSvrNXWPkjHAut
	M73ccD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl31v-0000000HAhU-03WH;
	Fri, 15 Mar 2024 08:35:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl31n-0000000HAbw-3OSO
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 08:35:03 +0000
X-UUID: e5d53252e2a611ee9aa9374d6d45775a-20240315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kIq4WDamNAejLOlLbfTnowDxoUNzQaKvxhfTroNW3B4=;
	b=Cg2Yya2kgBcLzFaYWHlupA0NxLaMN9lkAr3de2qDy3yxpwAbRQOG/sZh1O6nB02dFYRQO2R8viLQA3TiZrgu6a7sWXmQ7btUiIbN0E279Jx4uxfKJk9L/9gsUhbo0pz/AZKKDstHn9WIzAsSrD4EiOQDxMUv/HYGkb/7mlBUKmI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:b480dd25-5e1d-4568-a252-89652068c3d8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:0bd0eeff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e5d53252e2a611ee9aa9374d6d45775a-20240315
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 46592572; Fri, 15 Mar 2024 01:34:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Mar 2024 16:34:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Mar 2024 16:34:50 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v2 1/7] ufs: host: mediatek: fix vsx/vccqx control logic
Date: Fri, 15 Mar 2024 16:34:42 +0800
Message-ID: <20240315083448.7185-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240315083448.7185-1-peter.wang@mediatek.com>
References: <20240315083448.7185-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.435800-8.000000
X-TMASE-MatchedRID: pO+4S45NqGgMQLXc2MGSbO7KTDtx8CgguftX4oH7dy7I9EDAP/dptnzK
	3Q9zSFL709NQNrxIpFYBtjkcfRMmqe3NIrNSYNRX4RtSDjG+z7DoatYL/ATKmL/A+0D1to6P9Gb
	SSaq0f4MRsHN+CG+OBlY5wOHo2QlHj2hRzH1UwuAURSScn+QSXt0H8LFZNFG73Yq8RVaZivVXBl
	d66gU5uBkSdfES7f3hGCZJhkKb/b/kxfO2+4tQJnvTu24Jt2HH
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.435800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B88309B41904768C1A60F4D39D39C4D5043DE9CE936F6FE1B5441FA846FEB74E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_013500_378379_56F9AF66 
X-CRM114-Status: GOOD (  13.73  )
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

VSX(the upper layer of VCCQ/VCCQ2) should
1. Always set to hpm mode if ufs device is active.
2. Enter lpm mode only if ufs device is not active.

VCCQX should
1. Keep hpm mode if vccq and vccq2 not set in dts.
2. Keep hpm mode if vcc not set in dts keep vcc always on.
3. Keep hpm if broken vcc keep vcc always on and not allow vccq lpm.
4. Except upper case, can enter lpm mode if ufs device is not active.

Acked-by: Chun-Hung Wu <Chun-Hung.Wu@mediatek.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 41 +++++++++++++++++++++++----------
 drivers/ufs/host/ufs-mediatek.h |  6 +++++
 2 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 776bca4f70c8..147b5286ec98 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -119,6 +119,13 @@ static bool ufs_mtk_is_pmc_via_fastauto(struct ufs_hba *hba)
 	return !!(host->caps & UFS_MTK_CAP_PMC_VIA_FASTAUTO);
 }
 
+static bool ufs_mtk_is_allow_vccqx_lpm(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	return (host->caps & UFS_MTK_CAP_ALLOW_VCCQX_LPM);
+}
+
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
 {
 	u32 tmp;
@@ -1271,27 +1278,37 @@ static void ufs_mtk_vsx_set_lpm(struct ufs_hba *hba, bool lpm)
 
 static void ufs_mtk_dev_vreg_set_lpm(struct ufs_hba *hba, bool lpm)
 {
-	if (!hba->vreg_info.vccq && !hba->vreg_info.vccq2)
-		return;
+	bool skip_vccqx = false;
 
-	/* Skip if VCC is assumed always-on */
-	if (!hba->vreg_info.vcc)
-		return;
-
-	/* Bypass LPM when device is still active */
+	/* Prevent entering LPM when device is still active */
 	if (lpm && ufshcd_is_ufs_dev_active(hba))
 		return;
 
-	/* Bypass LPM if VCC is enabled */
-	if (lpm && hba->vreg_info.vcc->enabled)
-		return;
+	/* Skip vccqx lpm control and control vsx only */
+	if (!hba->vreg_info.vccq && !hba->vreg_info.vccq2)
+		skip_vccqx = true;
+
+	/* VCC is always-on, control vsx only */
+	if (!hba->vreg_info.vcc)
+		skip_vccqx = true;
+
+	/* Broken vcc keep vcc always on, most case control vsx only */
+	if (lpm && hba->vreg_info.vcc && hba->vreg_info.vcc->enabled) {
+		/* Some device vccqx/vsx can enter lpm */
+		if (ufs_mtk_is_allow_vccqx_lpm(hba))
+			skip_vccqx = false;
+		else /* control vsx only */
+			skip_vccqx = true;
+	}
 
 	if (lpm) {
-		ufs_mtk_vccqx_set_lpm(hba, lpm);
+		if (!skip_vccqx)
+			ufs_mtk_vccqx_set_lpm(hba, lpm);
 		ufs_mtk_vsx_set_lpm(hba, lpm);
 	} else {
 		ufs_mtk_vsx_set_lpm(hba, lpm);
-		ufs_mtk_vccqx_set_lpm(hba, lpm);
+		if (!skip_vccqx)
+			ufs_mtk_vccqx_set_lpm(hba, lpm);
 	}
 }
 
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index f76e80d91729..d0a5ab17860a 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -136,6 +136,12 @@ enum ufs_mtk_host_caps {
 	UFS_MTK_CAP_VA09_PWR_CTRL              = 1 << 1,
 	UFS_MTK_CAP_DISABLE_AH8                = 1 << 2,
 	UFS_MTK_CAP_BROKEN_VCC                 = 1 << 3,
+
+	/*
+	 * Override UFS_MTK_CAP_BROKEN_VCC's behavior to
+	 * allow vccqx upstream to enter LPM
+	 */
+	UFS_MTK_CAP_ALLOW_VCCQX_LPM            = 1 << 5,
 	UFS_MTK_CAP_PMC_VIA_FASTAUTO           = 1 << 6,
 };
 
-- 
2.18.0


