Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDB4C54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fydS8KBtthi1h3b4IeD9/II1N6JzyYB+1Hi99jvkzCo=; b=vS3rWJXhL4LZjO31a5XEoafoZq
	MsIPlxMZ/JZaPw+ojjDFHbcoyC6VCnJ7XWE4V+M+C6gV8o7GuxOdx5jaS1WxlFS/aGvJbKgw8wnPd
	wGdAEULyfCVpPJ8zYo8qBX/OP/W+euMGaIecJ49Q83/EnYEby6tWgOuwwF+UKsJBnS/bA2feaMfsw
	+8cefRX9NrMzS/aOyCWRjaNJR646mJlNd69vMr0Jsk2S3QfDSwpqJTzqnSsjBactCT5PUKji4Pn/n
	8yV30RYBE5/tmmccSdPGy1owv2Lon+vauawRfZd6tG35ttjve6CbBTgJqMHk9EJ7PBBb2TTndDSki
	aaAQOU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl32u-0000000HB9F-1riY;
	Fri, 15 Mar 2024 08:36:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl32p-0000000HB5B-2DA6
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 08:36:05 +0000
X-UUID: 0c2595fae2a711eeacdb61a41848c7d2-20240315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fydS8KBtthi1h3b4IeD9/II1N6JzyYB+1Hi99jvkzCo=;
	b=TDhzrJrP0xJilDblVU8G4+Qywvtrkc/opoLOSTexDxISJKaV1t3KvZWTtW4P0JRf72HO9pGGJT4yLa0j0iy8mriUxmAXFT5cFwjdHLj1YaaXRElJj8KdyfUk7tb71Krx/gjaKXn1SdNzJWaKSK6hMXEhKhlq9xTCIVYTPG7b1wM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:6c0718dd-7d51-4cc2-86ee-4e76ae18fcb1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:9d077190-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0c2595fae2a711eeacdb61a41848c7d2-20240315
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1062647806; Fri, 15 Mar 2024 01:35:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Mar 2024 16:34:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Mar 2024 16:34:51 +0800
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
Subject: [PATCH v2 5/7] ufs: host: mediatek: rename host power control API
Date: Fri, 15 Mar 2024 16:34:46 +0800
Message-ID: <20240315083448.7185-6-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240315083448.7185-1-peter.wang@mediatek.com>
References: <20240315083448.7185-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.382800-8.000000
X-TMASE-MatchedRID: Dz2rI8EJB2ASsMJYjeJjbpXi1z8zt1TRVg8Cu6buTGUH8UzOewTxw64T
	oUk/aSm1G04xakpCTBluGm5dWKYjJW94Ipa1otxoFYJUGv4DL3xo3Yq5PCwLAvNhzIgXtFJV88y
	Ax0zkDh7IrNi4B9W0wmRsrGzt2UVHWrGyEceiJjOO0rt0LpQGedVeTBbTX7DomyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1l3+bAt/YFVQrDtKO1nMb87ylVHbseLLr9peJJrwQXnmJjf1mJVm5IF8I4
	oUq5Vga
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.382800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C01B34E67F7175378414B0B793A12B756D2599DB6D4BDD5D41C9AA142BEDD6D22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_013603_630276_43E79BDF 
X-CRM114-Status: GOOD (  11.13  )
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

From: Po-Wen Kao <powen.kao@mediatek.com>

Mediatek host power include two part:
1. ufshci power, which is the main power of ufs host controller.
2. ufshci crypto sram power, which is the power of ufs crypto engine.

This host power control is actually control crypto sram power.
Rename it for easy maintain.

Acked-by: Chun-Hung Wu <Chun-Hung.Wu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek-sip.h | 13 +++----------
 drivers/ufs/host/ufs-mediatek.c     |  4 ++--
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek-sip.h b/drivers/ufs/host/ufs-mediatek-sip.h
index 35d1d5e76a2c..c26513aedee3 100755
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
index bb5b11185d8a..90523652a6fb 100644
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


