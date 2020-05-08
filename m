Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B4EC38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 17:26:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D08E21775
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 17:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L4upT03G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y1qhyoVE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D08E21775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cvg+4SCvNqrdCodLE38fbG5Ok7QrQR5yM0L98UtJLy8=; b=L4upT03G/yTETW
	3i9/tyzzmtx5e7npVU9uKBn/bW6cRBuG3iRdRkWJdsetjbR2NlLfZFTzOTZifX7pRzXqilWJtImEP
	kg6XJu4HTwcurYn335RDYXDWXpoossfBsyOHNLgYBlWHankp8NjzXyCBti3XUKmJEd/7mGQkui1ZW
	U1hygr14DE/JKicoLVUaWLb/donXg7hDn5mGWPXkhRHRhcEygVVDjwJLQg2fiQWzI9S5/PvPYYsCy
	4iSc4vIiomLl7c2MtyAXoYMCZeh2KNOP8qVTaK6bBmKahql4TAY04qEIm5aFZuB/aK2ENmy9LXRZv
	fPSZ3DJQeKneaZ9IPmGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX6lW-000204-Fr; Fri, 08 May 2020 17:26:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX6kb-00011V-Gz; Fri, 08 May 2020 17:25:30 +0000
X-UUID: 9e62a6f9c40a45a68d7d1e27e133c387-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0ORkRYecHIDtUF3MhVdta5cgJ+2Y5vlSsyDAf2BQW40=; 
 b=Y1qhyoVEz/VSfnYZJQwI1EyMLo9iGjCYtCa7Oo4eaZk886ImFUMnH6kJolCf5vQknmc5GeSelLTaZrc3PtsOT7OUFMxqcYes9T2N386vehKZ0KQnY2UXnfZh5aJPrC0/cWlECIQPDk9+IJMg0l5ii4mPCl0+K11OcbklR0l4ecY=;
X-UUID: 9e62a6f9c40a45a68d7d1e27e133c387-20200508
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2047652130; Fri, 08 May 2020 09:25:04 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 10:15:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 01:15:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 9 May 2020 01:15:12 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v1 3/5] scsi: ufs: customize flush threshold for WriteBooster
Date: Sat, 9 May 2020 01:15:11 +0800
Message-ID: <20200508171513.14665-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200508171513.14665-1-stanley.chu@mediatek.com>
References: <20200508171513.14665-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D97692ED15460159C4AFB5BA8F463C69AA861F79961DE9ADFD1E9F8C1A6BF2862000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_102529_577930_2A7D3638 
X-CRM114-Status: GOOD (  11.32  )
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

Allow flush threshold for WriteBooster to be customizable by
vendors. To achieve this, make the value as a variable in struct
ufs_hba first.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 6 ++++--
 drivers/scsi/ufs/ufshcd.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index cdacbe6378a1..9a0ce6550c2f 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5301,8 +5301,8 @@ static bool ufshcd_wb_presrv_usrspc_keep_vcc_on(struct ufs_hba *hba,
 			 cur_buf);
 		return false;
 	}
-	/* Let it continue to flush when >60% full */
-	if (avail_buf < UFS_WB_40_PERCENT_BUF_REMAIN)
+	/* Let it continue to flush when available buffer exceeds threshold */
+	if (avail_buf < hba->vps->wb_flush_threshold)
 		return true;
 
 	return false;
@@ -6839,6 +6839,7 @@ static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
 		if (!d_lu_wb_buf_alloc)
 			goto wb_disabled;
 	}
+
 	return;
 
 wb_disabled:
@@ -7462,6 +7463,7 @@ static const struct attribute_group *ufshcd_driver_groups[] = {
 
 static struct ufs_hba_variant_params ufs_hba_vps = {
 	.hba_enable_delay_us		= 1000,
+	.wb_flush_threshold		= UFS_WB_40_PERCENT_BUF_REMAIN,
 	.devfreq_profile.polling_ms	= 100,
 	.devfreq_profile.target		= ufshcd_devfreq_target,
 	.devfreq_profile.get_dev_status	= ufshcd_devfreq_get_dev_status,
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index f7bdf52ba8b0..e3dfb48e669e 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -570,6 +570,7 @@ struct ufs_hba_variant_params {
 	struct devfreq_dev_profile devfreq_profile;
 	struct devfreq_simple_ondemand_data ondemand_data;
 	u16 hba_enable_delay_us;
+	u32 wb_flush_threshold;
 };
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
