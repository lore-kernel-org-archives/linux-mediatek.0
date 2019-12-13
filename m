Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F4CC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:13:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7925322527
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZjgQL9aL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S/XRFDFV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7925322527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAsAcZVdQVRh0ZWjE42lsUFBhaKwhTTwaexkMhM+q+E=; b=ZjgQL9aLEfJBIp
	/vNbv+IAHNmCUfUAWxAXO9n9pPKfBFc8KqvZy8mUkLt38t79T9FzHlgGncfNbQ1tzDyK4p3+kx4R7
	vtMNvtQbbPG7oxEL/l7u5P8NM+JNYnLc4mZXERsYTafCuNoDAmsYZ6yp8lH4zgwAyvsDp6yoQmSTo
	hcWhSwX4lFQi1q2aXEedArwOkSaTYtWdHINMTk3FEyWRPzQqVCSx/a1CwMl0z58/lhx/0wthJO/pC
	j4OwI1LgKVIxut9pk8cLUs2FK9ryPP2Z1kZT1oPtaay+TK4xDiR2q4/aU9xjBxQb+D/0vxS8T4dVe
	XSDElSXdp5an1BOFiysg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifg4R-0001Db-3I; Fri, 13 Dec 2019 08:13:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifg3Y-0000It-My; Fri, 13 Dec 2019 08:12:14 +0000
X-UUID: 67382a28288b429f8d1a94a7a637c4a8-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0yehFparESOAYtBHbkhuNFqrZ0ymdP9wHcWW3IPfXfY=; 
 b=S/XRFDFVQMyGhR2EUu1JuonSUW+hei9VFFdTvFiM3KuuQA7IE+p5EHthhruR/4HFajkEUvzfnJWi5utbiTzBYxdDQwYkPE2ECZW1703LkcTZnZSEcjMQoAWYwMFDoIOxAzdZbXOn/zwN0bnBSGEV7nZe1fce4hwGcdq1kZDvUbE=;
X-UUID: 67382a28288b429f8d1a94a7a637c4a8-20191213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1478481258; Fri, 13 Dec 2019 00:12:11 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 00:12:55 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 16:11:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 13 Dec 2019 16:11:06 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>
Subject: [PATCH v1 4/4] scsi: ufs-mediatek: configure and enable clk-gating
Date: Fri, 13 Dec 2019 16:11:35 +0800
Message-ID: <1576224695-22657-5-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
References: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_001212_810297_AF7F99A1 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable clk-gating with customized delayed timer value in
MediaTek Chipsets.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 71e2e0e4ea11..282ad06ec846 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -205,6 +205,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	/* Enable runtime autosuspend */
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
 
+	/* Enable clock-gating */
+	hba->caps |= UFSHCD_CAP_CLK_GATING;
+
 	/*
 	 * ufshcd_vops_init() is invoked after
 	 * ufshcd_setup_clock(true) in ufshcd_hba_init() thus
@@ -293,6 +296,23 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 	return ret;
 }
 
+static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
+{
+	unsigned long flags;
+	u32 ah_ms;
+
+	if (ufshcd_is_clkgating_allowed(hba)) {
+		if (ufshcd_is_auto_hibern8_supported(hba) && hba->ahit)
+			ah_ms = FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK,
+					  hba->ahit);
+		else
+			ah_ms = 10;
+		spin_lock_irqsave(hba->host->host_lock, flags);
+		hba->clk_gating.delay_ms = ah_ms + 5;
+		spin_unlock_irqrestore(hba->host->host_lock, flags);
+	}
+}
+
 static int ufs_mtk_post_link(struct ufs_hba *hba)
 {
 	/* disable device LCC */
@@ -308,6 +328,8 @@ static int ufs_mtk_post_link(struct ufs_hba *hba)
 			FIELD_PREP(UFSHCI_AHIBERN8_SCALE_MASK, 3));
 	}
 
+	ufs_mtk_setup_clk_gating(hba);
+
 	return 0;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
