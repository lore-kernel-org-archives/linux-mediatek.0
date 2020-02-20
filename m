Return-Path: <SRS0=Q2+k=4I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74E4C11D05
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 13:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 974C3208C4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 13:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MrF/jqVr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JuGyWgg0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 974C3208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nf5unxUIos1djdDDml93aSUjth/DMmRlIzvnfIrPg0k=; b=MrF/jqVrIZG1M7
	L6OHzUX0wBxMChOkZ/RMZmRGiXq01P/VHqUz5WEE4GCRwyeoE967wuO2kLnkNmoxhGvPRBZhdrRYg
	d/tYf/9oSv2RHvLTdiOCpQaOTdqvKaPs625A0TMZhwu7jX5D0AJE934N0QBPZujqe1c4YnMz4PL9g
	7CBA210XZe0fsGp1NN3XdNSWPCN5lmjfCip566oa5BsYOsUpzvcq3lYiNwCHXRh1iBICXtVMyDumZ
	okdSUc4yB08SSXe8dAyjgGkW2O8o0AnvUDkStSJ/Dp3SbYeDYWn9OFTVzKZicDYwbtSro8UnSseHf
	vnln9VG3v/yF6Cd/5EmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4mCQ-0006eY-7m; Thu, 20 Feb 2020 13:49:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4mCE-0006Tk-Rt; Thu, 20 Feb 2020 13:48:56 +0000
X-UUID: 092ee87abc6f4752b17417d381563e8d-20200220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=j1shUdhIMGXtvTw4SkKdC2CAhrzkCOkweoDSyilUUBo=; 
 b=JuGyWgg0RsaKFLxSk6fjV3FIRJ1bjIHfLJD/lwDYvFI29QK150I1/LVKDfZhQPlZP2R3f4maAU7TjKRmtV5IuQ7BLtPmwL3qjPPKXghufc0F24H7uYSZ1m5f0+0qR8DN1YiDSd7vi8ie7gLwSBMWpndL7+idFV/LgUtqHsiPA9U=;
X-UUID: 092ee87abc6f4752b17417d381563e8d-20200220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1175834965; Thu, 20 Feb 2020 05:48:52 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 20 Feb 2020 05:48:51 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 20 Feb 2020 21:49:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 20 Feb 2020 21:46:45 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 1/1] scsi: ufs: ufs-mediatek: add waiting time for
 reference clock
Date: Thu, 20 Feb 2020 21:48:48 +0800
Message-ID: <20200220134848.8807-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200220134848.8807-1-stanley.chu@mediatek.com>
References: <20200220134848.8807-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_054854_914774_28A0FA07 
X-CRM114-Status: GOOD (  11.47  )
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

Some delays may be required either after gating or before ungating
reference clock for device according to vendor requirements.

Note that in UFS 3.0, the delay time after gating reference
clock can be defined by attribute bRefClkGatingWaitTime. Use the
formal value instead if it can be queried from device.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 46 +++++++++++++++++++++++++++++++--
 drivers/scsi/ufs/ufs-mediatek.h |  2 ++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 9d05962feb15..de650822c9d9 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -100,6 +100,17 @@ static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
 	return err;
 }
 
+static void ufs_mtk_udelay(unsigned long us)
+{
+	if (!us)
+		return;
+
+	if (us < 10)
+		udelay(us);
+	else
+		usleep_range(us, us + 10);
+}
+
 static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -112,6 +123,7 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 
 	if (on) {
 		ufs_mtk_ref_clk_notify(on, res);
+		ufs_mtk_udelay(host->ref_clk_ungating_wait_us);
 		ufshcd_writel(hba, REFCLK_REQUEST, REG_UFS_REFCLK_CTRL);
 	} else {
 		ufshcd_writel(hba, REFCLK_RELEASE, REG_UFS_REFCLK_CTRL);
@@ -137,12 +149,29 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 
 out:
 	host->ref_clk_enabled = on;
-	if (!on)
+	if (!on) {
+		ufs_mtk_udelay(host->ref_clk_gating_wait_us);
 		ufs_mtk_ref_clk_notify(on, res);
+	}
 
 	return 0;
 }
 
+static void ufs_mtk_setup_ref_clk_wait_us(struct ufs_hba *hba,
+					  u16 gating_us, u16 ungating_us)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	if (hba->dev_info.clk_gating_wait_us) {
+		host->ref_clk_gating_wait_us =
+			hba->dev_info.clk_gating_wait_us;
+	} else {
+		host->ref_clk_gating_wait_us = gating_us;
+	}
+
+	host->ref_clk_ungating_wait_us = ungating_us;
+}
+
 static u32 ufs_mtk_link_get_state(struct ufs_hba *hba)
 {
 	u32 val;
@@ -502,10 +531,23 @@ static void ufs_mtk_dbg_register_dump(struct ufs_hba *hba)
 static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 {
 	struct ufs_dev_info *dev_info = &hba->dev_info;
+	u16 mid = dev_info->wmanufacturerid;
 
-	if (dev_info->wmanufacturerid == UFS_VENDOR_SAMSUNG)
+	if (mid == UFS_VENDOR_SAMSUNG)
 		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 6);
 
+	/*
+	 * Decide waiting time before gating reference clock and
+	 * after ungating reference clock according to vendors'
+	 * requirements.
+	 */
+	if (mid == UFS_VENDOR_SAMSUNG)
+		ufs_mtk_setup_ref_clk_wait_us(hba, 1, 1);
+	else if (mid == UFS_VENDOR_SKHYNIX)
+		ufs_mtk_setup_ref_clk_wait_us(hba, 30, 30);
+	else if (mid == UFS_VENDOR_TOSHIBA)
+		ufs_mtk_setup_ref_clk_wait_us(hba, 100, 32);
+
 	return 0;
 }
 
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 492414e5f481..4c787b99fe41 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -92,6 +92,8 @@ struct ufs_mtk_host {
 	struct ufs_hba *hba;
 	struct phy *mphy;
 	bool ref_clk_enabled;
+	u16 ref_clk_ungating_wait_us;
+	u16 ref_clk_gating_wait_us;
 };
 
 #endif /* !_UFS_MEDIATEK_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
