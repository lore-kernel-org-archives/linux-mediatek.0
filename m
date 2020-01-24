Return-Path: <SRS0=meO2=3N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4876AC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 07:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7942072C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 07:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HsNKrJ91";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V5Vm7bIk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A7942072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJ1kQaOL5kmqtpxjxJqJFq35Bkc8jfAg1P/ooAIWRJk=; b=HsNKrJ91nt524P
	pfwFWwhnXi/3n5s0JCo7IWjRzJAKo7b4I1W2XErUSHWLJ30crub51ECYw3ZpcC+qVkJBeu9uS761f
	ogSf9fL3OKf65zIGUuQwV/fx9lb6BNSbRrrgEJLA1xVBrK1TugMvW3GcOaxBkaHxkfksLrPEuQlJD
	hfJcSkTIPN6wV5WSkzCmTNDi7R4zoiJTetwD6FBPDsdEY4tJkGi7hcRwHEhcppLocPYdE6NZlurAW
	3DVfwD0mO1tIPYdLiA3fUVuzs7pL4+Q31yrEGmh/QDZ+DGCVDZ/9GMxl3Lr3L9oeNpF24iV/zrcbt
	kBWJpWK6hO3sIXRIvX+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuswg-0006vz-KN; Fri, 24 Jan 2020 06:59:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuswW-0006nd-L2; Fri, 24 Jan 2020 06:59:50 +0000
X-UUID: 42917ee3b45c450eb5f7185589ba59d9-20200123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=r4uFNCZlrJfbAJ6zHc5lh0WBsNxu96UHiQ4PJMYHYz8=; 
 b=V5Vm7bIkKPgkjZPA86djf7vhc3N01MAGvA5lFFUmR3BwIK17VzRzPC64K9t/jjk36K+bQP/i5Wg0xeKAV7EBgVJmjbBVpgh/31RqGRL0R+jAsQKNzVH3VPHwn4alSaQsOWNEYIyzUz4G7XYX7OEqTxUUNFGy+UAtGeM+c5N08OA=;
X-UUID: 42917ee3b45c450eb5f7185589ba59d9-20200123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1834949673; Thu, 23 Jan 2020 22:59:45 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 23 Jan 2020 22:49:42 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 24 Jan 2020 14:48:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 24 Jan 2020 14:48:57 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 1/5] scsi: ufs-mediatek: ensure UniPro is not powered down
 before linkup
Date: Fri, 24 Jan 2020 14:49:22 +0800
Message-ID: <20200124064926.29472-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200124064926.29472-1-stanley.chu@mediatek.com>
References: <20200124064926.29472-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EE6B3AAFE2976FDE2B0D0A4B718E0322C10E6D114694D9985155B9BB79974CB92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_225948_697951_DD2B9875 
X-CRM114-Status: UNSURE (   9.63  )
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

Mediatek Chipsets will enter proprietary UniPro low-power mode during
suspend with link status as hibern8. Make sure leaving such low-power
mode before linkup to avoid any possible recovery path.

In the same time, re-factor related funciton to improve code readability.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 53eae5fe2ade..7ac838cc15d1 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -30,6 +30,11 @@
 #define ufs_mtk_device_reset_ctrl(high, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_RESET, high, res)
 
+#define ufs_mtk_unipro_powerdown(hba, powerdown) \
+	ufshcd_dme_set(hba, \
+		       UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0), \
+		       powerdown)
+
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
 {
 	u32 tmp;
@@ -290,6 +295,8 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 	int ret;
 	u32 tmp;
 
+	ufs_mtk_unipro_powerdown(hba, 0);
+
 	/* disable deep stall */
 	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(VS_SAVEPOWERCONTROL), &tmp);
 	if (ret)
@@ -390,9 +397,7 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 	if (err)
 		return err;
 
-	err = ufshcd_dme_set(hba,
-			     UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
-			     0);
+	err = ufs_mtk_unipro_powerdown(hba, 0);
 	if (err)
 		return err;
 
@@ -413,14 +418,10 @@ static int ufs_mtk_link_set_lpm(struct ufs_hba *hba)
 {
 	int err;
 
-	err = ufshcd_dme_set(hba,
-			     UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
-			     1);
+	err = ufs_mtk_unipro_powerdown(hba, 1);
 	if (err) {
 		/* Resume UniPro state for following error recovery */
-		ufshcd_dme_set(hba,
-			       UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
-			       0);
+		ufs_mtk_unipro_powerdown(hba, 0);
 		return err;
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
