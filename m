Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AADEC4724C
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 08:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3399207DD
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 08:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GyJg9F6o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JKZsXpEJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3399207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmSIY//dsJ9/rClnwm7b8G5N/kdmIQbgSWiSuq01ebM=; b=GyJg9F6oX8Yy35
	cBkUSmiW1n6dlKQQIQS/O/lYRSQyw38PLoIqcR5PY2jhnSukzwEpcas6KIFHzN0mFA2JOxRk3b7dY
	Ci/0CZ9kfNpbz/jDMVKZuQ6Mi/E7JAQTM7ziT6aw/Bbk1ZKArUrGyiEfqImv+7bYa1ZoJXBW2WTTo
	ryc0llJ8fnmxtzWJKal8txmqTseQgRW41cku3EspoTBjhsDgmceJb23XlSBqLUmu6btPnBsTRP7Jb
	S7/lfApuvn8Zs9AJ/dwuaBDjqPqPyPF2UlsQsYypH1BkW5JWsNyM+NT7M4vTlbRe9AoCyPY0P8nEm
	gayl1UqJ41w7dljBGGNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWxww-0008Ba-Be; Fri, 08 May 2020 08:01:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWxwk-0007wK-4D; Fri, 08 May 2020 08:01:27 +0000
X-UUID: 39f120d4fb6541c089bde632878326bb-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zX9LXOY/O270hUPX2+GL3UKkBmewuNRKxd0VGBvTLxQ=; 
 b=JKZsXpEJu1Ae4xPRhC6eN10DRCYaCBlXKy1NfWCWJah6ljtjAve8Et6dgTfUHABX7zCxwB63XJ76Wodk3EwMoneVHZBfDbrb8Kh+zirz1AZfsoEGiQTCmpiu8Pgj54YlP3a/wIOkctgt8qWoFjSni7uQozo+tuJEjS7bdMsIDog=;
X-UUID: 39f120d4fb6541c089bde632878326bb-20200508
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1167146198; Fri, 08 May 2020 00:01:17 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 01:01:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 16:01:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 May 2020 16:01:18 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v8 4/8] scsi: ufs-mediatek: add fixup_dev_quirks vops
Date: Fri, 8 May 2020 16:01:11 +0800
Message-ID: <20200508080115.24233-5-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200508080115.24233-1-stanley.chu@mediatek.com>
References: <20200508080115.24233-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_010126_179835_19EE376F 
X-CRM114-Status: UNSURE (   9.27  )
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
Reviewed-by: Avri Altman <avri.altman@wdc.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 673c16596fb2..1898f1269ac5 100644
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
+	ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
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
