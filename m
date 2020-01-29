Return-Path: <SRS0=1JTW=3S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A1EC33CB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 10:54:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D9D2071E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 10:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pPI/e/TJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IrdZ5iDQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D9D2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYe6D0hbNLxTlSxQJhNDI+hr/yEO4IcZcF0AxU/O7ss=; b=pPI/e/TJRnxqtd
	Hn+pGmWPYFRHE1OqsDW6pp5AK1fmh5GciiIxpfh1F5zmhNSQ/kUKrkAYjwbKNQ8A9Voe3PjkE+MbD
	U2w1/SQTKhyphEvT29KK86iOgGGJnIlZ1QVayPyawtpYtGUTtlDs4rFDjRHdebvoZGgNOIqAMOqri
	0lGBSy47t8xfPBhbwOI1SN0kM58p+8I3Fzb5SKnyD/vlXxiapRok25jQgm0uMepPkgxSUv5A+w3tV
	BL9HV+Hl0Yy3PBB9ES9vluzU7DADt0mrznIAnPbQ/tGeCSK7D7NjOg67HAgtfM0ZfxXxk/Zb8Mi0G
	vyGqe/VJOQlL0MB/tayQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwkyl-0004kf-2t; Wed, 29 Jan 2020 10:53:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwky6-0003uP-Nm; Wed, 29 Jan 2020 10:53:12 +0000
X-UUID: 0139de97ebbe4a2ca2ec1b6975426278-20200129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YOeqNnQON0pZMvJ2TpcgdJrhCqwz0qDgTvW6jd4cUGg=; 
 b=IrdZ5iDQeikJVk8a/7kLN/r3KvkibPQpsew7fsi1CCLv3mNOdjS5Q5a+eWdaacAnG9mNMt2aLi9XqAY4//N7eqmGJzcLt8PxVLCL3CbK5aQKpcl4ihaDTq54GqVXLUvnd8dy0JHRlsjdgZH5N2i2bS8E6Qk/r7gzXvd1/R7L/KU=;
X-UUID: 0139de97ebbe4a2ca2ec1b6975426278-20200129
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 520913895; Wed, 29 Jan 2020 02:53:08 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 02:54:21 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 18:52:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 29 Jan 2020 18:52:59 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <beanhuo@micron.com>
Subject: [PATCH RESEND v3 2/4] scsi: ufs-mediatek: support linkoff state
 during suspend
Date: Wed, 29 Jan 2020 18:52:49 +0800
Message-ID: <20200129105251.12466-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200129105251.12466-1-stanley.chu@mediatek.com>
References: <20200129105251.12466-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DC123E8965DA74E2D8BA28955FEE042764F383F49095A75C11AD3EBB4E6441692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_025310_838163_D521039A 
X-CRM114-Status: GOOD (  10.12  )
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
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If system suspend or runtime suspend mode is configured as
linkoff state, phy can be powered off and reference clock
can be gated in MediaTek Chipsets.

In the same time, remove redundant reference clock control
in suspend and resume callbacks because such control can be
well-handled in setup_clocks callback..

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 7ac838cc15d1..d78897a14905 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -167,7 +167,7 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 
 	switch (status) {
 	case PRE_CHANGE:
-		if (!on) {
+		if (!on && !ufshcd_is_link_active(hba)) {
 			ufs_mtk_setup_ref_clk(hba, on);
 			ret = phy_power_off(host->mphy);
 		}
@@ -437,10 +437,11 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		err = ufs_mtk_link_set_lpm(hba);
 		if (err)
 			return -EAGAIN;
-		phy_power_off(host->mphy);
-		ufs_mtk_setup_ref_clk(hba, false);
 	}
 
+	if (!ufshcd_is_link_active(hba))
+		phy_power_off(host->mphy);
+
 	return 0;
 }
 
@@ -449,9 +450,10 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	int err;
 
-	if (ufshcd_is_link_hibern8(hba)) {
-		ufs_mtk_setup_ref_clk(hba, true);
+	if (!ufshcd_is_link_active(hba))
 		phy_power_on(host->mphy);
+
+	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_hpm(hba);
 		if (err)
 			return err;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
