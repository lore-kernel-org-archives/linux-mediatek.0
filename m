Return-Path: <SRS0=D1Kh=6R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B039AC47256
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 06:07:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E20A2073E
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 May 2020 06:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k9R6EhVF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OkA6td7V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E20A2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1purh/J5R0FRGrbFDgIsFQEGFZh5UHCJU5IhagoWjnE=; b=k9R6EhVF2b9vws
	Md7Aeg4Su7ENI8GzSjTPnxoJilX/i4WHjwx90vHhIvZ6aIcNpaunJJVvIdHZYTEGMosa7xU4lH+R5
	qFMox4Ly3oW/c+7pDclZnuILfI8AXjhG/Uv5PSTQQql8GSkZsTVNYjzlohoKrgE/7gL2HJ26NBdTn
	QLDSTGddSopQ5U7M1WqjTT6ndyHx1mVPlqFwDOsM2mtusgzJf9J1jUUqkqSvmT277PzFX2hcn7wTL
	hEPEgNEpSz4CAWAblxbBeuhWbnGOtn+PzzeaUXVegyGCFHnwUg44ga7tSBdPPUHX249fXe1uYYU/R
	3J/EbDILZxo80q41RH+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jV7mM-000796-Cn; Sun, 03 May 2020 06:07:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jV7jc-00027b-C9; Sun, 03 May 2020 06:04:18 +0000
X-UUID: d1217e06b50a4684a07af5808d49821c-20200502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lvTox59cW7leiqB4qAxOe8+RTfYQVWs09Dx8wQB1BQk=; 
 b=OkA6td7VcRog0oaLwxLii552tbuHDrk7Xr8wmXbxeo20KTVmXNEonHXNFyK+VBr3b88kNGs7kHP9GEtl21lYEQ0/QYg0TxtcILW2eMAmQ29VEdB/iDPbeMgGreiRD4KPp+odj9/bMSfDSCnqVyf36dvTvUkTpUVWIEryp7tmfa0=;
X-UUID: d1217e06b50a4684a07af5808d49821c-20200502
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1460049672; Sat, 02 May 2020 22:04:13 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 2 May 2020 23:04:11 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 14:03:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 3 May 2020 14:03:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v4 4/8] scsi: ufs-mediatek: add fixup_dev_quirks vops
Date: Sun, 3 May 2020 14:03:47 +0800
Message-ID: <20200503060351.10572-5-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200503060351.10572-1-stanley.chu@mediatek.com>
References: <20200503060351.10572-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E0035863AB47457224CD7CB1922709E8B7DC8A3D362EDA397C102489C0B91FE72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_230416_460431_B8566D3B 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add fixup_dev_quirk vops in MediaTek UFS platforms and provide
an initial vendor-specific device quirk table.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 673c16596fb2..ce7ba529e613 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -30,6 +30,12 @@
 #define ufs_mtk_device_reset_ctrl(high, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_RESET, high, res)
 
+static struct ufs_dev_fix ufs_mtk_dev_fixups[] = {
+	UFS_FIX(UFS_VENDOR_SKHYNIX, "H9HQ21AFAMZDAR",
+		UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES),
+	END_FIX
+};
+
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
 {
 	u32 tmp;
@@ -555,10 +561,8 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 	struct ufs_dev_info *dev_info = &hba->dev_info;
 	u16 mid = dev_info->wmanufacturerid;
 
-	if (mid == UFS_VENDOR_SAMSUNG) {
-		hba->dev_quirks &= ~UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE;
+	if (mid == UFS_VENDOR_SAMSUNG)
 		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 6);
-	}
 
 	/*
 	 * Decide waiting time before gating reference clock and
@@ -575,6 +579,17 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 	return 0;
 }
 
+void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
+{
+	struct ufs_dev_info *dev_info = &hba->dev_info;
+	u16 mid = dev_info->wmanufacturerid;
+
+	ufshcd_fixup_device_setup(hba, ufs_mtk_dev_fixups);
+
+	if (mid == UFS_VENDOR_SAMSUNG)
+		hba->dev_quirks &= ~UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE;
+}
+
 /**
  * struct ufs_hba_mtk_vops - UFS MTK specific variant operations
  *
@@ -589,6 +604,7 @@ static struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.link_startup_notify = ufs_mtk_link_startup_notify,
 	.pwr_change_notify   = ufs_mtk_pwr_change_notify,
 	.apply_dev_quirks    = ufs_mtk_apply_dev_quirks,
+	.fixup_dev_quirks    = ufs_mtk_fixup_dev_quirks,
 	.suspend             = ufs_mtk_suspend,
 	.resume              = ufs_mtk_resume,
 	.dbg_register_dump   = ufs_mtk_dbg_register_dump,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
