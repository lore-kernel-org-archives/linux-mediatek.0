Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3B1C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 10:09:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C804206F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 10:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KHLgyKhY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OssNNdmi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C804206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iZ8wjNOM6ruzJ8oFzrJqvxk9GhWQ/oj0fYwf04fMn50=; b=KHLgyKhYrrWUle
	qgw4nOpOz7V4gCQ/IT+s5OTpMaQ63yobA4S9CXTzBoo63Ulwk+GjstjN0BQR9G+kdAwVPXdtqFqCV
	zIAMqJgJdUx900QkH5g334gLPBhFhkckIYPz+sLeXpTNv3Z5/AzFxcC4+pbk7TwjAPWZF40XVWFNk
	QjrFkEqR8wNK3Zj7fTC0GJHgkxqwMxRX0IcE9oHUtG5p3li1qB0Gq0Hd25c0vqE2HtjH2pDwtNaon
	KDRLp1amJciUOdEcZiwJGtHpodwsgUvvKk4cFeVwOdwAcfCfE++p/McjzHLG6XoqZMWxhbHvGNNss
	V1xJy/D/T/kuNqHLkcGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHlv8-0003YK-Kq; Fri, 27 Mar 2020 10:08:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHluz-0003QR-CN; Fri, 27 Mar 2020 10:08:50 +0000
X-UUID: b63c526b7d004feabeb3e0a5765a11f8-20200327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=XvMgTRarhYjvy31eOrL8qWKvV+LoDQUZ6Y/LzdVLi0s=; 
 b=OssNNdmi8gzqWtSJCr29WTyaehWsUt2Pp6mP0ELQYndd1QNc/guloHxn2s/z8GQEhBnrZF9TVSOylIGO2ibCLvNF7vaCCWsllJwP9da3Sf0mExtlHU28Wrkfpnm9ukrGzDeIe9tay5g0TsslKz4PC5L3mi7mbM+TxcpvN7U39eo=;
X-UUID: b63c526b7d004feabeb3e0a5765a11f8-20200327
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1373330433; Fri, 27 Mar 2020 02:08:47 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 02:58:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 17:58:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 27 Mar 2020 17:58:35 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 1/1] scsi: ufs: set device as active power mode after
 resetting device
Date: Fri, 27 Mar 2020 17:58:35 +0800
Message-ID: <20200327095835.10293-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 51B629C57321E8224197746DE299EA04D736E0A923D7FF8BAF8247DCEF92CBA82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_030849_430525_04319106 
X-CRM114-Status: UNSURE (   8.55  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently ufshcd driver assumes that bInitPowerMode parameter
is not changed by any vendors thus device power mode can be set as
"Active" during initialization.

According to UFS JEDEC specification, device power mode shall be
"Active" after HW Reset is triggered if the bInitPowerMode parameter
in Device Descriptor is default value.

By above description, we can set device power mode as "Active" after
device reset is triggered by vendor's callback. With this change,
the link startup performance can be improved in some cases
by not setting link_startup_again as true in ufshcd_link_startup().

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 13 -------------
 drivers/scsi/ufs/ufshcd.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 227660a1a446..f0a35b289b7c 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -171,19 +171,6 @@ enum {
 #define ufshcd_clear_eh_in_progress(h) \
 	((h)->eh_flags &= ~UFSHCD_EH_IN_PROGRESS)
 
-#define ufshcd_set_ufs_dev_active(h) \
-	((h)->curr_dev_pwr_mode = UFS_ACTIVE_PWR_MODE)
-#define ufshcd_set_ufs_dev_sleep(h) \
-	((h)->curr_dev_pwr_mode = UFS_SLEEP_PWR_MODE)
-#define ufshcd_set_ufs_dev_poweroff(h) \
-	((h)->curr_dev_pwr_mode = UFS_POWERDOWN_PWR_MODE)
-#define ufshcd_is_ufs_dev_active(h) \
-	((h)->curr_dev_pwr_mode == UFS_ACTIVE_PWR_MODE)
-#define ufshcd_is_ufs_dev_sleep(h) \
-	((h)->curr_dev_pwr_mode == UFS_SLEEP_PWR_MODE)
-#define ufshcd_is_ufs_dev_poweroff(h) \
-	((h)->curr_dev_pwr_mode == UFS_POWERDOWN_PWR_MODE)
-
 struct ufs_pm_lvl_states ufs_pm_lvl_states[] = {
 	{UFS_ACTIVE_PWR_MODE, UIC_LINK_ACTIVE_STATE},
 	{UFS_ACTIVE_PWR_MODE, UIC_LINK_HIBERN8_STATE},
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index b7bd81795c24..7a9d1d170719 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -129,6 +129,19 @@ enum uic_link_state {
 #define ufshcd_set_link_hibern8(hba) ((hba)->uic_link_state = \
 				    UIC_LINK_HIBERN8_STATE)
 
+#define ufshcd_set_ufs_dev_active(h) \
+	((h)->curr_dev_pwr_mode = UFS_ACTIVE_PWR_MODE)
+#define ufshcd_set_ufs_dev_sleep(h) \
+	((h)->curr_dev_pwr_mode = UFS_SLEEP_PWR_MODE)
+#define ufshcd_set_ufs_dev_poweroff(h) \
+	((h)->curr_dev_pwr_mode = UFS_POWERDOWN_PWR_MODE)
+#define ufshcd_is_ufs_dev_active(h) \
+	((h)->curr_dev_pwr_mode == UFS_ACTIVE_PWR_MODE)
+#define ufshcd_is_ufs_dev_sleep(h) \
+	((h)->curr_dev_pwr_mode == UFS_SLEEP_PWR_MODE)
+#define ufshcd_is_ufs_dev_poweroff(h) \
+	((h)->curr_dev_pwr_mode == UFS_POWERDOWN_PWR_MODE)
+
 /*
  * UFS Power management levels.
  * Each level is in increasing order of power savings.
@@ -1091,6 +1104,7 @@ static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
 {
 	if (hba->vops && hba->vops->device_reset) {
 		hba->vops->device_reset(hba);
+		ufshcd_set_ufs_dev_active(hba);
 		ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, 0);
 	}
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
