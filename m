Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42797C54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT7dGQBmI5VvS3tK3/7lsJiumEuQy1bX+ob0+VMfsWg=; b=T/A/MeJObZ0B7WKGFbK4Kg9hRm
	xjMwiGhbuvblDuaTwL5JWtaWbokKUQjhS/UL2TWItGdImzRNEcE2+5YKUodnh7+0ZTJSWQ7d3PbNE
	UAc1TlPu6SN6fEfv+YdVOeggrM3q8tEuaS/m4P4q7cxSpox2Bh63qdZfkhfqkP6/d7w9Kq7YjCSfP
	cKMZZevvKZxtf7+EBDicUyH70z69RYiHpXuBYUzOYABJYt7oTmood4USb7EjNmO6LHJu30wfMAYBv
	3d8AtvCJX6lszuYdB8zXfyagXfs/adaTGUhpffUMpzJ0Ar2kcx4k35SaxFMNaHVIdiUOI6n7M79SN
	NgfKJRow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGf-000000084Rn-1jXF;
	Fri, 08 Mar 2024 07:03:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGQ-000000084Ha-19Lj
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Mar 2024 07:03:34 +0000
X-UUID: f2e18cd0dd1911eebe6b57d01cc416d2-20240308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gT7dGQBmI5VvS3tK3/7lsJiumEuQy1bX+ob0+VMfsWg=;
	b=CqlHclwCQRIJ4wsHEVoHpg1A13O/11mm6Lg9gZoDm6nTW1JYgOev/Gpsny9xr8phu3D+V3qARKeQVBUrAizavP9eMjQajIRq5E+8POKj4m4nCyTzW+x5AjQgjYvsYJcfSs0KkDDwQpPw7n5T8m6vhqInJrskU4V2+XHultfhLQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:cc79fd42-4fd1-401a-91e2-b69f3598dec3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:249ca8ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f2e18cd0dd1911eebe6b57d01cc416d2-20240308
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 424018702; Fri, 08 Mar 2024 00:03:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Mar 2024 15:02:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Mar 2024 15:02:44 +0800
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
Subject: [PATCH v1 5/7] ufs: host: mediatek: rename host power control API
Date: Fri, 8 Mar 2024 15:02:39 +0800
Message-ID: <20240308070241.9163-6-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240308070241.9163-1-peter.wang@mediatek.com>
References: <20240308070241.9163-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.937300-8.000000
X-TMASE-MatchedRID: pO+4S45NqGgMQLXc2MGSbNIKqYKXY3SWjeDfyjN4mgcH8UzOewTxw64T
	oUk/aSm109NQNrxIpFbzrL9jlOCHAVfdwZmjAXfzkDpLRKO9xhRA8JZETQujwgZbeEWcL03VFKw
	SiW1W6O1fSVVy8GyA5uIwzQmYBQ97hEy3/eAjCRieAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+IC
	quNi0WJA2oD3nmY3rChgcVucK80GgNmlj9gEVxXtJHoHJr4QNaftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.937300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 78655E13DE2074A191B0951B86E0854DF9D4D449F74F5D10B32B846BD99D58152000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_230330_475967_2E0CCB2C 
X-CRM114-Status: GOOD (  10.55  )
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

From: Po-Wen Kao <powen.kao@mediatek.com>

Host power control is control crypto sram power.
Rename it for easy maintain.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek-sip.h | 13 +++----------
 drivers/ufs/host/ufs-mediatek.c     |  4 ++--
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek-sip.h b/drivers/ufs/host/ufs-mediatek-sip.h
index 30146bb1ccbe..fd640846910a 100755
--- a/drivers/ufs/host/ufs-mediatek-sip.h
+++ b/drivers/ufs/host/ufs-mediatek-sip.h
@@ -16,7 +16,7 @@
 #define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
 #define UFS_MTK_SIP_CRYPTO_CTRL           BIT(2)
 #define UFS_MTK_SIP_REF_CLK_NOTIFICATION  BIT(3)
-#define UFS_MTK_SIP_HOST_PWR_CTRL         BIT(5)
+#define UFS_MTK_SIP_SRAM_PWR_CTRL         BIT(5)
 #define UFS_MTK_SIP_GET_VCC_NUM           BIT(6)
 #define UFS_MTK_SIP_DEVICE_PWR_CTRL       BIT(7)
 
@@ -31,13 +31,6 @@ enum ufs_mtk_vcc_num {
 	UFS_VCC_MAX
 };
 
-/*
- * Host Power Control options
- */
-enum {
-	HOST_PWR_HCI = 0,
-	HOST_PWR_MPHY
-};
 
 /*
  * SMC call wrapper function
@@ -78,8 +71,8 @@ static inline void _ufs_mtk_smc(struct ufs_mtk_smc_arg s)
 #define ufs_mtk_device_reset_ctrl(high, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_RESET, &(res), high)
 
-#define ufs_mtk_host_pwr_ctrl(opt, on, res) \
-	ufs_mtk_smc(UFS_MTK_SIP_HOST_PWR_CTRL, &(res), opt, on)
+#define ufs_mtk_sram_pwr_ctrl(on, res) \
+	ufs_mtk_smc(UFS_MTK_SIP_SRAM_PWR_CTRL, &(res), on)
 
 #define ufs_mtk_get_vcc_num(res) \
 	ufs_mtk_smc(UFS_MTK_SIP_GET_VCC_NUM, &(res))
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ae184e4f90e6..2caf0c1d4e17 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1376,7 +1376,7 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (ufshcd_is_link_off(hba))
 		ufs_mtk_device_reset_ctrl(0, res);
 
-	ufs_mtk_host_pwr_ctrl(HOST_PWR_HCI, false, res);
+	ufs_mtk_sram_pwr_ctrl(false, res);
 
 	return 0;
 fail:
@@ -1397,7 +1397,7 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL)
 		ufs_mtk_dev_vreg_set_lpm(hba, false);
 
-	ufs_mtk_host_pwr_ctrl(HOST_PWR_HCI, true, res);
+	ufs_mtk_sram_pwr_ctrl(true, res);
 
 	err = ufs_mtk_mphy_power_on(hba, true);
 	if (err)
-- 
2.18.0


