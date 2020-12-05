Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D188C4361A
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 02:50:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C1422E00
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 02:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07C1422E00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rtx8k69n81IGFezFjqX05mQJWMlPuLCYALM5/TxRXr0=; b=lqgy0pGDbDqQJbvb3NQtACcEy
	EFo87jkfp1+IKtxYkp4kReqOwIMSo2oCibF1+I1oY4eNhKjYbz1/TDWxpQ3rchcgYC2qgDZ44WNzH
	AZaSfyXuxUZo+rkXbXfeO31UBWYeyL7Rnem+mGPzq7ZCmjrQ5JIIoOnxBh7BP3SkImyJhqJKjFVuw
	sauL5LyOHJTunpJUUVKjIPXmmP6iPrWAy6qihp09fjrtzJtiZ4mPjvBK2Fr1L1YxckvfYl09D/NqN
	jEJ1/c977wnMPjujMK/qmNVQ4Krz7ObUOQIw6MYMnOAvvJjgVBlR8fPG0/av43RpfuslzFRgDjDYt
	J/sc4tL6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klNeC-0005Ru-OT; Sat, 05 Dec 2020 02:50:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klNds-0005Ke-EH; Sat, 05 Dec 2020 02:49:49 +0000
X-UUID: 9aa960bef3694796b89e05c35b0940be-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=12nYlJ8dAThbcPOzqgCSYVFK6E/3Wv4YUgQ2UJ8FAJ8=; 
 b=ihMFEQ4OI+GtzUG6Yg0ZBpdhTMu0vHQhEcAdY+HlQpmzg4dDfh4nx4v7JXRXxriKl5kc+KHQndQj0cOKES3VidRAnr635RjIQIi93Sklif3O8ImpXsUn87c3B3tJpfoB0Zh7Cbc+FR1K4QAGJPMN0yAY11VYgiH0qMfF8Wm+yKo=;
X-UUID: 9aa960bef3694796b89e05c35b0940be-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 549270809; Fri, 04 Dec 2020 18:49:43 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 18:39:42 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Dec 2020 10:39:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 5 Dec 2020 10:39:35 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v4 1/8] scsi: ufs: Remove unused setup_regulators variant
 function
Date: Sat, 5 Dec 2020 10:39:31 +0800
Message-ID: <20201205023938.13848-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201205023938.13848-1-stanley.chu@mediatek.com>
References: <20201205023938.13848-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_214948_624812_4B8B45F4 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, huadian.liu@mediatek.com, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since setup_regulators variant function is not used by any
vendors, simply remove it.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 10 +---------
 drivers/scsi/ufs/ufshcd.h | 10 ----------
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 11a4aad09f3a..c2f611516ea7 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8171,16 +8171,10 @@ static int ufshcd_variant_hba_init(struct ufs_hba *hba)
 		goto out;
 
 	err = ufshcd_vops_init(hba);
-	if (err)
-		goto out;
-
-	err = ufshcd_vops_setup_regulators(hba, true);
-	if (err)
-		ufshcd_vops_exit(hba);
-out:
 	if (err)
 		dev_err(hba->dev, "%s: variant %s init failed err %d\n",
 			__func__, ufshcd_get_var_name(hba), err);
+out:
 	return err;
 }
 
@@ -8189,8 +8183,6 @@ static void ufshcd_variant_hba_exit(struct ufs_hba *hba)
 	if (!hba->vops)
 		return;
 
-	ufshcd_vops_setup_regulators(hba, false);
-
 	ufshcd_vops_exit(hba);
 }
 
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 7a7e056a33a9..21de7607611f 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -277,7 +277,6 @@ struct ufs_pwr_mode_info {
  * @get_ufs_hci_version: called to get UFS HCI version
  * @clk_scale_notify: notifies that clks are scaled up/down
  * @setup_clocks: called before touching any of the controller registers
- * @setup_regulators: called before accessing the host controller
  * @hce_enable_notify: called before and after HCE enable bit is set to allow
  *                     variant specific Uni-Pro initialization.
  * @link_startup_notify: called before and after Link startup is carried out
@@ -307,7 +306,6 @@ struct ufs_hba_variant_ops {
 				    enum ufs_notify_change_status);
 	int	(*setup_clocks)(struct ufs_hba *, bool,
 				enum ufs_notify_change_status);
-	int     (*setup_regulators)(struct ufs_hba *, bool);
 	int	(*hce_enable_notify)(struct ufs_hba *,
 				     enum ufs_notify_change_status);
 	int	(*link_startup_notify)(struct ufs_hba *,
@@ -1119,14 +1117,6 @@ static inline int ufshcd_vops_setup_clocks(struct ufs_hba *hba, bool on,
 	return 0;
 }
 
-static inline int ufshcd_vops_setup_regulators(struct ufs_hba *hba, bool status)
-{
-	if (hba->vops && hba->vops->setup_regulators)
-		return hba->vops->setup_regulators(hba, status);
-
-	return 0;
-}
-
 static inline int ufshcd_vops_hce_enable_notify(struct ufs_hba *hba,
 						bool status)
 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
