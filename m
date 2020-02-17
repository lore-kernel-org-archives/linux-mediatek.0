Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C0C7619F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:36:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D85C720718
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jn+hpno3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="egQkMmyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D85C720718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ah2aq9F4v74yFFE5C7HrszApkyp0hGcWUYmV74TAOK4=; b=jn+hpno36uxlrn
	FCC9e5Fr5Z/34Q1NGpTlvBUvzM58CnLWS3fJkvoelMXGnqpLGHk1IKI+NU0Xf39o7TiCzB1Ocvzek
	xX2MgIzze+IKjvT6HloJRgrhcpDk32DGn+PNXVW8l+5Ny1is5qtQIHHYih+szn573WPkN06j4Cwhh
	ZBgG+0FuU13605HfsGkpwf7Z8HfPNFopDOD5AdbiqtC+CZYO8wH1rW4cKJmPg0cGawyJEhATGJ17N
	LFwPADsZK6gssNOUfJQUr+Rwesm+IxfplIck8/zrYnvzdnSJRP7Mzj0z60fuGDwOOK9i1rnsbLZHz
	05H9wFs4lrRhmKX9n1Lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3cpI-0005h8-2h; Mon, 17 Feb 2020 09:36:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3coz-0005Fc-59; Mon, 17 Feb 2020 09:36:10 +0000
X-UUID: 0f3aae06424b4e9695bf8bd9257379b4-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=r7AqXWWI2XOKb8o72epYunSOyZikfu2WAV4cdgSvlQU=; 
 b=egQkMmyoh7DXNkcULir9MSrkozqejp1Ig+OmZqS1QYBPCtHqw1dPfD7mpdbwk7eHTQYV1boUsu987vL78e33iFsAmp5rHckPYHgp4rn7vbFPrjOm9DXMZEufyufhv5Iv0UgfIP0ihsork6Nx3E6Kb3ImTuY/YkaX9u/llTaYD9Y=;
X-UUID: 0f3aae06424b4e9695bf8bd9257379b4-20200217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 524207647; Mon, 17 Feb 2020 01:36:03 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 01:36:22 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 17:33:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 17 Feb 2020 17:35:36 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 1/2] scsi: ufs: add required delay after gating reference
 clock
Date: Mon, 17 Feb 2020 17:35:58 +0800
Message-ID: <20200217093559.16830-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200217093559.16830-1-stanley.chu@mediatek.com>
References: <20200217093559.16830-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6F93E073A79775700A46518EB217FC1397C16A2E0DDEF6E3FF63E042F98D71FF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_013609_232172_68BE84E2 
X-CRM114-Status: GOOD (  10.17  )
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

In UFS version 3.0, a newly added attribute bRefClkGatingWaitTime defines
the minimum time for which the reference clock is required by device during
transition to LS-MODE or HIBERN8 state.

Currently this time is detected and stored in
hba->dev_info.clk_gating_wait_us but applied to vendor implementatios only.
Make it applied to reference clock named as "ref_clk" in device tree in
common path.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 744b8254220c..7f60721f54d1 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7417,8 +7417,10 @@ static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
 	struct ufs_clk_info *clki;
 	struct list_head *head = &hba->clk_list_head;
 	unsigned long flags;
+	unsigned long wait_us;
 	ktime_t start = ktime_get();
 	bool clk_state_changed = false;
+	bool ref_clk;
 
 	if (list_empty(head))
 		goto out;
@@ -7436,7 +7438,8 @@ static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
 
 	list_for_each_entry(clki, head, list) {
 		if (!IS_ERR_OR_NULL(clki->clk)) {
-			if (skip_ref_clk && !strcmp(clki->name, "ref_clk"))
+			ref_clk = !strcmp(clki->name, "ref_clk") ? true : false;
+			if (skip_ref_clk && ref_clk)
 				continue;
 
 			clk_state_changed = on ^ clki->enabled;
@@ -7449,6 +7452,9 @@ static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
 				}
 			} else if (!on && clki->enabled) {
 				clk_disable_unprepare(clki->clk);
+				wait_us = hba->dev_info.clk_gating_wait_us;
+				if (ref_clk && wait_us)
+					usleep_range(wait_us, wait_us + 10);
 			}
 			clki->enabled = on;
 			dev_dbg(hba->dev, "%s: clk: %s %sabled\n", __func__,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
