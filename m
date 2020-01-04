Return-Path: <SRS0=JELp=2Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FD3C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2020 14:26:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0EFA24653
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2020 14:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXsKkfVg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z1lhBqcg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0EFA24653
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0p1PqFsMRevRSFW/RWs3g1RJ0dsbN7uU4Ws9J1nDt0=; b=iXsKkfVgV75wpw
	ciVNf5RTWuk97HeJeigM6Bx8V7dRsg+wheB8gzxfR3zHh3UEjTzRyiXtoomgOcleP5GsTbPjHMrTO
	S36FjOAeakTYffmLT+T5n6VlZfr1lEqMTczCxQAXJlLHSCHWJxFi94EXnqASqDZRodjwG6mVc7xtl
	WsHQ7Xfvyh5QVaTku1aIPomB3Fwc8txwRDyVRPpl8C108pKZai29UUVCDeAB1W4M/A76TsKdpH6eY
	IxJz52l176T86hIw0+eK7BkTdR+Oino9l45B1zrCCHj42FPMSfLghz3frkibMSmdaNsz2KI1cJ78B
	V3UiWNK0UmLT4D2yydbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inkNo-00005P-8z; Sat, 04 Jan 2020 14:26:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inkNf-0008Nx-J2; Sat, 04 Jan 2020 14:26:21 +0000
X-UUID: 3ec3ede03b9b49abaa10ede337b29247-20200104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Lcy3+KlfMb7jLpiBkhLUoc+fZ0Xd/X066UNWWwKFUng=; 
 b=Z1lhBqcgEO/h+MWEeifc2Pkj+Ix4L8mD/gm333vaE/5EVABiB9qqN3HJQEE7vbZS8y+jpApuEOTdudiLUPpKwJDnD9Tlm8j8i37VNGNpyjzYH56A3TUY2xsrurpJa5DYr1GFmb/6I0kbWRpKbaG4xU+6J6zss7LgnJI4mfvqntY=;
X-UUID: 3ec3ede03b9b49abaa10ede337b29247-20200104
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 670809894; Sat, 04 Jan 2020 06:26:12 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 4 Jan 2020 06:26:37 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 4 Jan 2020 22:25:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 4 Jan 2020 22:26:40 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 2/3] scsi: ufs: add device reset history for vendor
 implementations
Date: Sat, 4 Jan 2020 22:26:07 +0800
Message-ID: <1578147968-30938-3-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1578147968-30938-1-git-send-email-stanley.chu@mediatek.com>
References: <1578147968-30938-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200104_062619_636968_ADE26FFA 
X-CRM114-Status: UNSURE (   8.75  )
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

Device reset history shall be also added for vendor's device
reset variant operation implementation.

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Asutosh Das <asutoshd@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 5 +++--
 drivers/scsi/ufs/ufshcd.h | 6 +++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index bae43da00bb6..29e3d50aabfb 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4346,13 +4346,14 @@ static inline int ufshcd_disable_device_tx_lcc(struct ufs_hba *hba)
 	return ufshcd_disable_tx_lcc(hba, true);
 }
 
-static void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
-				   u32 reg)
+void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
+			    u32 reg)
 {
 	reg_hist->reg[reg_hist->pos] = reg;
 	reg_hist->tstamp[reg_hist->pos] = ktime_get();
 	reg_hist->pos = (reg_hist->pos + 1) % UFS_ERR_REG_HIST_LENGTH;
 }
+EXPORT_SYMBOL_GPL(ufshcd_update_reg_hist);
 
 /**
  * ufshcd_link_startup - Initialize unipro link startup
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index e05cafddc87b..de1be6a862b0 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -805,6 +805,8 @@ int ufshcd_wait_for_register(struct ufs_hba *hba, u32 reg, u32 mask,
 				u32 val, unsigned long interval_us,
 				unsigned long timeout_ms, bool can_sleep);
 void ufshcd_parse_dev_ref_clk_freq(struct ufs_hba *hba, struct clk *refclk);
+void ufshcd_update_reg_hist(struct ufs_err_reg_hist *reg_hist,
+			    u32 reg);
 
 static inline void check_upiu_size(void)
 {
@@ -1083,8 +1085,10 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
 
 static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
 {
-	if (hba->vops && hba->vops->device_reset)
+	if (hba->vops && hba->vops->device_reset) {
 		hba->vops->device_reset(hba);
+		ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, 0);
+	}
 }
 
 extern struct ufs_pm_lvl_states ufs_pm_lvl_states[];
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
