Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6AEC18E5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 08:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5DA020724
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 08:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbbQzDYe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eBkps+0g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5DA020724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8PEd0bHSq2pJGdY99T5b5k2vQTIRAYKLlII2nMMlHE=; b=DbbQzDYe1KvInK
	UXkbnurm3ZMps6xbpGM64CLx0jF40IniadhG7QQr5gC2BmfXlr4yWexbJvUcN8kD+J8o8rC3HrhJV
	9JeEuYjlCQks0UY0X4c9jBdp5YbWRbQcUDWBo/m9hl4JPT3c3NxpPjyXsZSyZ2sb4ddneOdgIIMdZ
	Rpmz8m4H/rVCystyq1b2hQCFYOBDKH4dA1wnHmoow2wq1Z/9su1iSp5qffl8+s7C/CLhLY4cgy5qp
	p0iXj3alIRwhtqGfzk4I3ebIelOP8XQBCPSFebYGgwc52Atx5UAHGw1lHMlaUGOJSmwZsnEyYB3dN
	FLXyYXzPKFbcnUUJl+Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDlV0-0000no-62; Mon, 16 Mar 2020 08:53:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDlUl-0000Ys-MG; Mon, 16 Mar 2020 08:53:13 +0000
X-UUID: 12d82f40c85c40dfa13dcda4d76b1fe2-20200316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pHsjntWLbUDnwpKOVMCMm9upcEKd4TT7DMldt126T54=; 
 b=eBkps+0gAmDEbAmDd9gCwRPYPog+2HVPIWL/269NZCRoNsPh/A0OZ07VtUuWJd6I/6wu2nodDEI8KZLWmH7mahlfMrXCDNZFVXWosfDt7WLjGuAKRY0+ltLd/MfFZ3cKr8j8JG2XA5up+mMu7XPqUq9R1zdRIFOGj3WhK+2SA9s=;
X-UUID: 12d82f40c85c40dfa13dcda4d76b1fe2-20200316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1814157914; Mon, 16 Mar 2020 00:53:08 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 01:53:39 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 16:52:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 16 Mar 2020 16:53:52 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.peter~sen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v6 3/7] scsi: ufs: introduce common delay function
Date: Mon, 16 Mar 2020 16:52:59 +0800
Message-ID: <20200316085303.20350-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200316085303.20350-1-stanley.chu@mediatek.com>
References: <20200316085303.20350-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_015311_738285_750A92EC 
X-CRM114-Status: GOOD (  12.09  )
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

Introduce common delay function to collect all delay requirements
to simplify driver and take choices of udelay and usleep_range into
consideration.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
---
 drivers/scsi/ufs/ufshcd.c | 27 ++++++++++++++++++---------
 drivers/scsi/ufs/ufshcd.h |  1 +
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 314e808b0d4e..9fea346f7d22 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -597,6 +597,18 @@ static void ufshcd_print_pwr_info(struct ufs_hba *hba)
 		 hba->pwr_info.hs_rate);
 }
 
+void ufshcd_wait_us(unsigned long us, unsigned long tolerance, bool can_sleep)
+{
+	if (!us)
+		return;
+
+	if (us < 10 || !can_sleep)
+		udelay(us);
+	else
+		usleep_range(us, us + tolerance);
+}
+EXPORT_SYMBOL_GPL(ufshcd_wait_us);
+
 /*
  * ufshcd_wait_for_register - wait for register value to change
  * @hba - per-adapter interface
@@ -620,10 +632,7 @@ int ufshcd_wait_for_register(struct ufs_hba *hba, u32 reg, u32 mask,
 	val = val & mask;
 
 	while ((ufshcd_readl(hba, reg) & mask) != val) {
-		if (can_sleep)
-			usleep_range(interval_us, interval_us + 50);
-		else
-			udelay(interval_us);
+		ufshcd_wait_us(interval_us, 50, can_sleep);
 		if (time_after(jiffies, timeout)) {
 			if ((ufshcd_readl(hba, reg) & mask) != val)
 				err = -ETIMEDOUT;
@@ -3565,7 +3574,7 @@ static inline void ufshcd_add_delay_before_dme_cmd(struct ufs_hba *hba)
 	}
 
 	/* allow sleep for extra 50us if needed */
-	usleep_range(min_sleep_time_us, min_sleep_time_us + 50);
+	ufshcd_wait_us(min_sleep_time_us, 50, true);
 }
 
 /**
@@ -4289,7 +4298,7 @@ int ufshcd_hba_enable(struct ufs_hba *hba)
 	 * instruction might be read back.
 	 * This delay can be changed based on the controller.
 	 */
-	usleep_range(1000, 1100);
+	ufshcd_wait_us(1000, 100, true);
 
 	/* wait for the host controller to complete initialization */
 	retry = 10;
@@ -4301,7 +4310,7 @@ int ufshcd_hba_enable(struct ufs_hba *hba)
 				"Controller enable failed\n");
 			return -EIO;
 		}
-		usleep_range(5000, 5100);
+		ufshcd_wait_us(5000, 100, true);
 	}
 
 	/* enable UIC related interrupts */
@@ -6224,7 +6233,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 			reg = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
 			if (reg & (1 << tag)) {
 				/* sleep for max. 200us to stabilize */
-				usleep_range(100, 200);
+				ufshcd_wait_us(100, 100, true);
 				continue;
 			}
 			/* command completed already */
@@ -7786,7 +7795,7 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
 	 */
 	if (!ufshcd_is_link_active(hba) &&
 	    hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM)
-		usleep_range(2000, 2100);
+		ufshcd_wait_us(2000, 100, true);
 
 	/*
 	 * If UFS device is either in UFS_Sleep turn off VCC rail to save some
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 52425371082a..842f0223f5e5 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -792,6 +792,7 @@ int ufshcd_init(struct ufs_hba * , void __iomem * , unsigned int);
 int ufshcd_make_hba_operational(struct ufs_hba *hba);
 void ufshcd_remove(struct ufs_hba *);
 int ufshcd_uic_hibern8_exit(struct ufs_hba *hba);
+void ufshcd_wait_us(unsigned long us, unsigned long tolerance, bool can_sleep);
 int ufshcd_wait_for_register(struct ufs_hba *hba, u32 reg, u32 mask,
 				u32 val, unsigned long interval_us,
 				unsigned long timeout_ms, bool can_sleep);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
