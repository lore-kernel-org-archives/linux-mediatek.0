Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DD8C3F2CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 04:10:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A560520842
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 04:10:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hmEoX3MS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hV2wIZhI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A560520842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCvFyW6YUzFlusdUTkOSrp6Z+NsgqrSHiBE3UwV87wE=; b=hmEoX3MSrBO5V5
	msDG9u+fsxqofqRYMrzvn5VNMb3x8sMJeDv70Y5O484XNjES3WCDfru84NXmwAiB7gSSiApGa3Q0K
	MhD9NscQ1eDSje4CKXy2zpaViyvJfNt59um0KDomImmKDoClLbgCLie5rKAaRwuxe45BNAyux7gZK
	nDaWojaAKG74y+y13yvbPs6787NElkluc0acYtrYGtnB9K99naE3CVaSuZaV5zZWlaoo1BlDtxCyb
	wGSkAcb7u4wsRUv06TzdzSp7ZLLeoevRBjqHAtIIPPP6+iSZu5qMoQfK8LbatqfjR2KU36hn+OqNc
	8YjErLUkFf/qIJdut6uA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9hqQ-0004kq-W1; Thu, 05 Mar 2020 04:10:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9hqH-0004c1-PM; Thu, 05 Mar 2020 04:10:39 +0000
X-UUID: ab703395b46d434c98becdaa4044ca43-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Rj5iYKNwFcesfwwy5zTGLm6uozn0z7qv/GaBAu+slyw=; 
 b=hV2wIZhImQwCLHgcX+CryUNtGPTHf2kzq0yy6ki+l9Gf/XZ7CHAzPsqhxfDA40RPXl/kwRwmz34tEH41aIweBk5WkjyGXpkkuy5iK/UC6QB6WSSgdHmrBo0/wzQih7tAkFhnQ96rM1fhgiGABYufltAffOxkyFgOm9pzyz6X0Ik=;
X-UUID: ab703395b46d434c98becdaa4044ca43-20200304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 743008612; Wed, 04 Mar 2020 20:10:33 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 20:08:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 12:04:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 5 Mar 2020 12:06:20 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 3/4] scsi: ufs: allow customized delay for host enabling
Date: Thu, 5 Mar 2020 12:07:03 +0800
Message-ID: <20200305040704.10645-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200305040704.10645-1-stanley.chu@mediatek.com>
References: <20200305040704.10645-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA07B504F3F26FF626B890E43A8DA3B6510C5A53DA0DDB0E5AC4B1F78667188A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_201037_833343_E792673B 
X-CRM114-Status: GOOD (  10.69  )
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
---
 drivers/scsi/ufs/ufshcd.c | 6 +++++-
 drivers/scsi/ufs/ufshcd.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index ed61ecb98b2d..39cae907abd0 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4282,7 +4282,10 @@ int ufshcd_hba_enable(struct ufs_hba *hba)
 	 * instruction might be read back.
 	 * This delay can be changed based on the controller.
 	 */
-	usleep_range(1000, 1100);
+	if (hba->hba_enable_delay_us) {
+		usleep_range(hba->hba_enable_delay_us,
+			     hba->hba_enable_delay_us + 100);
+	}
 
 	/* wait for the host controller to complete initialization */
 	retry = 10;
@@ -8402,6 +8405,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 
 	hba->mmio_base = mmio_base;
 	hba->irq = irq;
+	hba->hba_enable_delay_us = 1000;
 
 	err = ufshcd_hba_init(hba);
 	if (err)
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 49ade1bfd085..baf1143d4839 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -662,6 +662,7 @@ struct ufs_hba {
 	u32 eh_flags;
 	u32 intr_mask;
 	u16 ee_ctrl_mask;
+	u16 hba_enable_delay_us;
 	bool is_powered;
 
 	/* Work Queues */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
