Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B4FC3F2CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 08:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 337D220724
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 08:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LyzmVwuC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Cv9LabzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 337D220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s++izh/WNO4vA6tmdEkzR8KPQKoeuVM5pGJnVLSPyz0=; b=LyzmVwuCul5WPE
	NxC5/4jJmKK2eJWEKz0l/itrTmTGtdRMhMiEsNs0pMvxU+pEkkIaA+Uz4l/Lx0O4I1Ufp5Auh7wpQ
	JcAkdYC65lG2GvDMgyo+cTnglaJNUnzxD7Bc0xv4yIkCOKOCT7Ooue2DUM0WaH2vnBnTeffiULmkM
	XifvDHiGpeh4sv0mlRgN0m0uhvkL7HLtqF2D5TRldsH/x6K9v0Ep+7hwRq3777ZPjEm4XeoDcTEU9
	w2VjOJ2oYvUkBcWx/dxGYrp8zJ0u6G3AWlJH+OCLkI44FGHFJjiISnURs0Di0GOdlP9gJrBZyuMSO
	gqMKdxEtKT4crf3JBV3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDlWf-00034y-B9; Mon, 16 Mar 2020 08:55:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDlUp-0000ba-Qw; Mon, 16 Mar 2020 08:53:17 +0000
X-UUID: 4471a023f759491e941356d824c24d50-20200316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=99iqgru7wZylBry8uZxukF5QSaJ1870BxVD1/bjGF28=; 
 b=Cv9LabzZm8NqemFFmnDUjAzRgnMa6npXqCeiiFdOGl3zgxvwwPIsLXUP6UWWas03TRpK1BKefvO4i9FYGRBkyJPrEsyflYKCgajNqkMRhoMUnufJ11Ju6Y75Xq/Xdk2tMbvq/3PFZM2mBbeEKqVubly7eS2lVc/fOEq31sRaJhw=;
X-UUID: 4471a023f759491e941356d824c24d50-20200316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 318047060; Mon, 16 Mar 2020 00:53:08 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 01:53:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 16:52:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 16 Mar 2020 16:53:52 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.peter~sen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v6 5/7] scsi: ufs: allow customized delay for host enabling
Date: Mon, 16 Mar 2020 16:53:01 +0800
Message-ID: <20200316085303.20350-6-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200316085303.20350-1-stanley.chu@mediatek.com>
References: <20200316085303.20350-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 94691A3A41D10FC11804F686BBA71B46EEB3B616F15602C2520FE49EE5CB67D32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_015315_913229_D7E14818 
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

Currently a 1 ms delay is applied before polling CONTROLLER_ENABLE
bit. This delay may not be required or can be changed in different
controllers. Make the delay as a changeable value in struct ufs_hba to
allow it customized by vendors.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 3 ++-
 drivers/scsi/ufs/ufshcd.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 9fea346f7d22..78b6ac6fcc4e 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4298,7 +4298,7 @@ int ufshcd_hba_enable(struct ufs_hba *hba)
 	 * instruction might be read back.
 	 * This delay can be changed based on the controller.
 	 */
-	ufshcd_wait_us(1000, 100, true);
+	ufshcd_wait_us(hba->hba_enable_delay_us, 100, true);
 
 	/* wait for the host controller to complete initialization */
 	retry = 10;
@@ -8421,6 +8421,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 
 	hba->mmio_base = mmio_base;
 	hba->irq = irq;
+	hba->hba_enable_delay_us = 1000;
 
 	err = ufshcd_hba_init(hba);
 	if (err)
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 842f0223f5e5..b7111925d899 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -663,6 +663,7 @@ struct ufs_hba {
 	u32 eh_flags;
 	u32 intr_mask;
 	u16 ee_ctrl_mask;
+	u16 hba_enable_delay_us;
 	bool is_powered;
 	struct ufs_init_prefetch init_prefetch_data;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
