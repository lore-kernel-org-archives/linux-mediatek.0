Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A69C4724C
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 08:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D149208DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 08:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGccCvvL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jXappDhh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D149208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+iGo1RW4pGz71sl2QZ+2iJzwqguViHBAnrM6cIDbcQ=; b=kGccCvvLgrqlII
	H0C3OU3/DYZJrgoJf1749oHsfNre36PNy588TRWfNfMFB0E+gXSqd4UyuGAex6ZhUlo4NFPv2ibDt
	N8DNaZehz0fSQBwywwoqzLEiDwjH7Ki6kld/raeUlFsbwMN5VH+qc5rSEmJWVXPbfVxacQUMUFgJw
	cp4uqK6XVnyNI9w4OK5jNK+PFanaSpjbwDG66WjzR0vTzM8//ls9qRv29TaBGjrgfTR/xKxxmhwPA
	E/UbLHvUvsKfwJ3rLoyin8/DqvFvMJWvRyboMk2bD/ds1yF3kJu+0jwLe98OCohufkJq2Tw4fjAyS
	/UAXOHdj/KBlWXe06Wyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWxzD-0001zc-Al; Fri, 08 May 2020 08:03:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWxx3-0008I4-05; Fri, 08 May 2020 08:01:46 +0000
X-UUID: 0ef9f5bfd095443c9e5d834328e2faa7-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uGT7hSTUzH9ZKoRQUM/Tvp8FCrc2dsU2C85wx6zrn7c=; 
 b=jXappDhhT6v7+89hWqkMKS6/jweiyhR/macCNpBydYfSeFGDa5UkOJ7BDDO27f6M76jlElqkwtijSABhNScf78ey3im8UYPeZIHS4SAhr2uzFAQRS4kNciPwFEd1BKMFxigjO8wuQsxwaIpZFXCyVdRQdy7fnrAf79fMooDd26U=;
X-UUID: 0ef9f5bfd095443c9e5d834328e2faa7-20200508
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1762883254; Fri, 08 May 2020 00:01:28 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 01:01:31 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 16:01:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 May 2020 16:01:18 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v8 3/8] scsi: ufs: export ufs_fixup_device_setup() function
Date: Fri, 8 May 2020 16:01:10 +0800
Message-ID: <20200508080115.24233-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200508080115.24233-1-stanley.chu@mediatek.com>
References: <20200508080115.24233-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 47C1EFE60891844C887843C26736B395BD6B73E41061F5077EBA054EDA9897692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_010145_080944_9B033F88 
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

Export ufs_fixup_device_setup() to allow vendors to re-use it for
fixing device quriks on specified UFS hosts.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
---
 drivers/scsi/ufs/ufshcd.c | 10 +++++++---
 drivers/scsi/ufs/ufshcd.h |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 8d86d9a6a622..c0b2cec5dcd8 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6838,12 +6838,15 @@ static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
 	hba->caps &= ~UFSHCD_CAP_WB_EN;
 }
 
-static void ufshcd_fixup_dev_quirks(struct ufs_hba *hba)
+void ufshcd_fixup_dev_quirks(struct ufs_hba *hba, struct ufs_dev_fix *fixups)
 {
 	struct ufs_dev_fix *f;
 	struct ufs_dev_info *dev_info = &hba->dev_info;
 
-	for (f = ufs_fixups; f->quirk; f++) {
+	if (!fixups)
+		return;
+
+	for (f = fixups; f->quirk; f++) {
 		if ((f->wmanufacturerid == dev_info->wmanufacturerid ||
 		     f->wmanufacturerid == UFS_ANY_VENDOR) &&
 		     ((dev_info->model &&
@@ -6852,11 +6855,12 @@ static void ufshcd_fixup_dev_quirks(struct ufs_hba *hba)
 			hba->dev_quirks |= f->quirk;
 	}
 }
+EXPORT_SYMBOL_GPL(ufshcd_fixup_dev_quirks);
 
 static void ufs_fixup_device_setup(struct ufs_hba *hba)
 {
 	/* fix by general quirk table */
-	ufshcd_fixup_dev_quirks(hba);
+	ufshcd_fixup_dev_quirks(hba, ufs_fixups);
 
 	/* allow vendors to fix quirks */
 	ufshcd_vops_fixup_dev_quirks(hba);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 897338ba67aa..4d296acadd6f 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -952,6 +952,7 @@ int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
 
 void ufshcd_auto_hibern8_enable(struct ufs_hba *hba);
 void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
+void ufshcd_fixup_dev_quirks(struct ufs_hba *hba, struct ufs_dev_fix *fixups);
 #define SD_ASCII_STD true
 #define SD_RAW false
 int ufshcd_read_string_desc(struct ufs_hba *hba, u8 desc_index,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
