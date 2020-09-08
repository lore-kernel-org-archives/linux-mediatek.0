Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C935AC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:51:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416A121532
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJgIvKDU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tzjS+Klg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416A121532
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lSjWAKoabqxKwSeb+X8A3lgPpv144SRb5sJ6IbXJBbQ=; b=mJgIvKDUOWtPX+kgrY3C5OyyE
	na1ExOdAm4T8LHUtT/RMB2QNUBFlbPa1Q0Vj5SJgn4oGEjj61G1GoyWS/Iw+Rk07BT3afGWBcYUbJ
	RYV0S1y6HpMk/qbL3aK4y7sAG2Tvn0TxvQ4OYVKBB3jJ7UEmgKYdf6YfUrx45epoUmqOCWEMczni5
	eiKHUSjiKmGeU6uKoJewz2B9UJycsbO6Od+xODGdYTX3ITlclPiOCMlzg9jm8qi0e8zRfkHjKA0oy
	XZ4KFENagxYMFj0pWxpZP+HS8+u+++0rRNVo193vNuHqkVMjEH9C66llCyIMZDDwl4utQCBc1g7Aa
	S4G07wQpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFXSt-0005gm-Fy; Tue, 08 Sep 2020 06:50:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFXSr-0005g5-41; Tue, 08 Sep 2020 06:50:50 +0000
X-UUID: 5c762f38a69046ce81ab4a0eed204109-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vkAchY3C2WddVlo+HHoOzkA8z5hp05WmN9gYTWWqPaI=; 
 b=tzjS+KlgCtKvL3faXFbkAS2GHYlMteLeI9tGWYxOF3Ht2By59bTEqreKQSp3vjPbLgHMZgVZU3zz16rdZOgkEPfyIZyRdGhdYa/kRFeQ0u3LVmDatHnAeU3KTq8ZnEwjHNhj0dq0IRztp5yScCllvXza3ugdVroXM9Ne9fXEOA8=;
X-UUID: 5c762f38a69046ce81ab4a0eed204109-20200907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 851492341; Mon, 07 Sep 2020 22:50:45 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 23:45:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 14:45:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Sep 2020 14:45:10 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH 4/4] scsi: ufs-mediatek: Add host reset mechanism
Date: Tue, 8 Sep 2020 14:45:07 +0800
Message-ID: <20200908064507.30774-5-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200908064507.30774-1-stanley.chu@mediatek.com>
References: <20200908064507.30774-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_025049_364115_08F7C7AD 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add host reset mechanism to try to recover host-side errors
during recovery flow.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 48 +++++++++++++++++++++++++++++++--
 drivers/scsi/ufs/ufs-mediatek.h |  3 +++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index feba74a72309..1a9133ac6efb 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -13,6 +13,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
 
 #include "ufshcd.h"
@@ -91,16 +92,57 @@ static void ufs_mtk_crypto_enable(struct ufs_hba *hba)
 	}
 }
 
+static void ufs_mtk_host_reset(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	reset_control_assert(host->hci_reset);
+	reset_control_assert(host->crypto_reset);
+	reset_control_assert(host->unipro_reset);
+
+	usleep_range(100, 110);
+
+	reset_control_deassert(host->unipro_reset);
+	reset_control_deassert(host->crypto_reset);
+	reset_control_deassert(host->hci_reset);
+}
+
+static void ufs_mtk_init_reset_control(struct ufs_hba *hba,
+				       struct reset_control **rc,
+				       char *str)
+{
+	*rc = devm_reset_control_get(hba->dev, str);
+	if (IS_ERR(*rc)) {
+		dev_info(hba->dev, "Failed to get reset control %s: %d\n",
+			 str, PTR_ERR(*rc));
+		*rc = NULL;
+	}
+}
+
+static void ufs_mtk_init_reset(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	ufs_mtk_init_reset_control(hba, &host->hci_reset,
+				   "hci_rst");
+	ufs_mtk_init_reset_control(hba, &host->unipro_reset,
+				   "unipro_rst");
+	ufs_mtk_init_reset_control(hba, &host->crypto_reset,
+				   "crypto_rst");
+}
+
 static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 				     enum ufs_notify_change_status status)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	if (status == PRE_CHANGE) {
-		if (host->unipro_lpm)
+		if (host->unipro_lpm) {
 			hba->vps->hba_enable_delay_us = 0;
-		else
+		} else {
 			hba->vps->hba_enable_delay_us = 600;
+			ufs_mtk_host_reset(hba);
+		}
 
 		if (hba->caps & UFSHCD_CAP_CRYPTO)
 			ufs_mtk_crypto_enable(hba);
@@ -335,6 +377,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	if (err)
 		goto out_variant_clear;
 
+	ufs_mtk_init_reset(hba);
+
 	/* Enable runtime autosuspend */
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
 
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 87657376d27a..5c32d5f52759 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -92,6 +92,9 @@ enum {
 struct ufs_mtk_host {
 	struct ufs_hba *hba;
 	struct phy *mphy;
+	struct reset_control *hci_reset;
+	struct reset_control *unipro_reset;
+	struct reset_control *crypto_reset;
 	bool mphy_powered_on;
 	bool unipro_lpm;
 	bool ref_clk_enabled;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
