Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5276EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 13:38:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12AB0615A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 13:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12AB0615A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CJ/AjZGK/MN4uNq7JNBqkYX/iV0qmqQtJCVnmH2sFs=; b=AYX1xCOwtPVXM7
	nWphvXZw8SHiFTQQTh85i7hmerIgJOkrNKCtDy3wEiX63nnQl5bw8DNLY/SwhMXRyMx4lMC/qviHJ
	wcwZcoGKnj+dv43m/HUUlk3lQCtcLf1oYNSALsCE31xDzh0H3xHqWka1o9erGhi+GCc0R4WRcnElW
	Vcsh+nF8HnNo+nRCRo0GTjl9UJIEgk9CN06JUIsIzFTQgLDvjpvX39BqtcM0u5CmOJe2TYp4DY4up
	CUR0IvYXIrmxdVzoLIiWcbIWyeuqs8vo+xHD/spnMBaz32JikpngGf9dxYENuLxI9gIi4wclTDzC1
	or7BBmYIrbkAbtYDT32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXkdi-00AbT0-D0; Tue, 05 Oct 2021 13:37:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXkdf-00AbS0-Ln
 for linux-mediatek@lists.infradead.org; Tue, 05 Oct 2021 13:37:49 +0000
X-UUID: 113616a431984be88970335c74a3c991-20211005
X-UUID: 113616a431984be88970335c74a3c991-20211005
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 482053734; Tue, 05 Oct 2021 06:37:44 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Oct 2021 06:27:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 5 Oct 2021 21:27:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Oct 2021 21:27:40 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
 <chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
 <powen.kao@mediatek.com>, <jonathan.hsu@mediatek.com>,
 <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <mikebi@micron.com>
Subject: [PATCH 1/2] scsi: ufs: support vops pre suspend
Date: Tue, 5 Oct 2021 21:27:37 +0800
Message-ID: <20211005132738.14820-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211005132738.14820-1-peter.wang@mediatek.com>
References: <20211005132738.14820-1-peter.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_063747_725413_BDEE2E34 
X-CRM114-Status: GOOD (  12.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

This patch introduce an solution to do pre suspned before SSU
(sleep) command.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 9 +++++++--
 drivers/scsi/ufs/ufshcd.h | 8 +++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 188de6f91050..73eb626fa88f 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8897,6 +8897,10 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	flush_work(&hba->eeh_work);
 
+	ret = ufshcd_vops_suspend(hba, pm_op, PRE_CHANGE);
+	if (ret)
+		goto enable_scaling;
+
 	if (req_dev_pwr_mode != hba->curr_dev_pwr_mode) {
 		if (pm_op != UFS_RUNTIME_PM)
 			/* ensure that bkops is disabled */
@@ -8924,7 +8928,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 * vendor specific host controller register space call them before the
 	 * host clocks are ON.
 	 */
-	ret = ufshcd_vops_suspend(hba, pm_op);
+	ret = ufshcd_vops_suspend(hba, pm_op, POST_CHANGE);
 	if (ret)
 		goto set_link_active;
 	goto out;
@@ -9052,7 +9056,8 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 set_old_link_state:
 	ufshcd_link_state_transition(hba, old_link_state, 0);
 vendor_suspend:
-	ufshcd_vops_suspend(hba, pm_op);
+	ufshcd_vops_suspend(hba, pm_op, PRE_CHANGE);
+	ufshcd_vops_suspend(hba, pm_op, POST_CHANGE);
 out:
 	if (ret)
 		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index f0da5d3db1fa..e90320253d96 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -344,7 +344,8 @@ struct ufs_hba_variant_ops {
 					enum ufs_notify_change_status);
 	int	(*apply_dev_quirks)(struct ufs_hba *hba);
 	void	(*fixup_dev_quirks)(struct ufs_hba *hba);
-	int     (*suspend)(struct ufs_hba *, enum ufs_pm_op);
+	int     (*suspend)(struct ufs_hba *, enum ufs_pm_op,
+					enum ufs_notify_change_status);
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
 	int	(*phy_initialization)(struct ufs_hba *);
@@ -1300,10 +1301,11 @@ static inline void ufshcd_vops_fixup_dev_quirks(struct ufs_hba *hba)
 		hba->vops->fixup_dev_quirks(hba);
 }
 
-static inline int ufshcd_vops_suspend(struct ufs_hba *hba, enum ufs_pm_op op)
+static inline int ufshcd_vops_suspend(struct ufs_hba *hba, enum ufs_pm_op op,
+				enum ufs_notify_change_status status)
 {
 	if (hba->vops && hba->vops->suspend)
-		return hba->vops->suspend(hba, op);
+		return hba->vops->suspend(hba, op, status);
 
 	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
