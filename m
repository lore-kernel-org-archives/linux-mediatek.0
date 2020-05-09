Return-Path: <SRS0=UIhI=6X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05330C28CBC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 09:37:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC2E124955
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 09:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AgKLdfbW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GSPBgeb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC2E124955
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSsVpimI6GZGUF8gd2zcmLc1q/HWT9UIJWECmQvhlOo=; b=AgKLdfbWIomM5M
	+wLnrZsXPU5TG22mQDMIr9dxq7pqDEvpy63yK0zdZHEAU4sEMjCHndTpmToN/m0Bv37X+hlF7lHLE
	4a06UV0NTVG+Bm/JOB4mU69DarFRWSBTC+Qggbio1CFmq86pBzvMz+QvzwW5y3t/KPCvXZvkwS84F
	Ev3cx4dI2+EO68V75Kl3zFdR87HR+qnxwH8ybA/qDwGvG9QBnybanP72DSvO7YGgT/8AroeTMPd3A
	ghRjp6QKeYUcEeM966QwgP3NOk0L3ej9mm3eNhkAf8QKdQcg3eMhWaGwcE90l2jJZBVZUvdvaKNbw
	Xsie38YMb0OYTAbXhr2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXLvK-0005uM-CK; Sat, 09 May 2020 09:37:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXLv9-0005jw-RJ; Sat, 09 May 2020 09:37:25 +0000
X-UUID: dd1e952536c34f29b1981b7d8440e845-20200509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9vLJufccMQirOO3fRMdyvDSO0idv15wihf8x27nLpCU=; 
 b=GSPBgeb/Nmk/aAHRVy0tsl+qOYB+p0hcL1/iUW9UnQQR5dUNfoHxC7EAcMic5fvHQlcRxGmR02n7WzLZoVkH5f/eV9CDCvP93PAsuB38joVxrPflMHhFk2JkUUbNvTy9799QyF1iZgs7detWAtnn6+hRcizyRVVkN391VgMVy84=;
X-UUID: dd1e952536c34f29b1981b7d8440e845-20200509
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1457269330; Sat, 09 May 2020 01:37:13 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 02:37:18 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 17:37:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 9 May 2020 17:37:16 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v2 3/4] scsi: ufs: customize flush threshold for WriteBooster
Date: Sat, 9 May 2020 17:37:15 +0800
Message-ID: <20200509093716.21010-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200509093716.21010-1-stanley.chu@mediatek.com>
References: <20200509093716.21010-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A1C6ED970B30FA952A189F7D64977EEEC0A73EE51969F02DCF84178B2B2A59822000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_023724_540147_CAE651C5 
X-CRM114-Status: GOOD (  11.60  )
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
ufs_hba_variant_params.

Besides, use macro UFS_WB_BUF_REMAIN_PERCENT() instead to provide
more flexible usage of WriteBooster available buffer values.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs.h    | 5 +----
 drivers/scsi/ufs/ufshcd.c | 7 ++++---
 drivers/scsi/ufs/ufshcd.h | 1 +
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
index b3135344ab3f..fadba3a3bbcd 100644
--- a/drivers/scsi/ufs/ufs.h
+++ b/drivers/scsi/ufs/ufs.h
@@ -478,10 +478,7 @@ enum ufs_dev_pwr_mode {
 	UFS_POWERDOWN_PWR_MODE	= 3,
 };
 
-enum ufs_dev_wb_buf_avail_size {
-	UFS_WB_10_PERCENT_BUF_REMAIN = 0x1,
-	UFS_WB_40_PERCENT_BUF_REMAIN = 0x4,
-};
+#define UFS_WB_BUF_REMAIN_PERCENT(val) ((val) / 10)
 
 /**
  * struct utp_cmd_rsp - Response UPIU structure
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index cdacbe6378a1..aca50ed39844 100644
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
@@ -5336,7 +5336,7 @@ static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
 	}
 
 	if (!hba->dev_info.b_presrv_uspc_en) {
-		if (avail_buf <= UFS_WB_10_PERCENT_BUF_REMAIN)
+		if (avail_buf <= UFS_WB_BUF_REMAIN_PERCENT(10))
 			return true;
 		return false;
 	}
@@ -7462,6 +7462,7 @@ static const struct attribute_group *ufshcd_driver_groups[] = {
 
 static struct ufs_hba_variant_params ufs_hba_vps = {
 	.hba_enable_delay_us		= 1000,
+	.wb_flush_threshold		= UFS_WB_BUF_REMAIN_PERCENT(40),
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
