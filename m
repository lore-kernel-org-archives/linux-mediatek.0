Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE0C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 01:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66yALVos8vbenfmLPDF16xxikZzpF7R/dW4qgi3gNfs=; b=fSjKaclemU1qwvQCI0V1PByI54
	tKlrnrpkkGl+szcSufD7f5a0UL0tb0nL13654k/MrQNs/32Q4xAcfil7isx3EDhRttj8V0Pkr+2zy
	Pd/iQuVMx+Zct+WKHT10jXfFpRjQDm5ahaizvMG2WS4tSXZpsfdIJ/oDUsaoqvnzrYLEYGN8Q37YA
	21YTABbBVvGdE1u0g32Bgv4GeAU7m9HKT1YhaJFacWcJPw09F8SnjfeU0SIfv+AfgncYxURO7fIHj
	WIQBPmYGybmsfsfW5cVC0blMtr3mtpnkE+9YaQQxCNeb7MI06LrbO/RkzU4ium8EK1uaXljyb7s1N
	sALpyTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXSQ-000zRu-Io; Fri, 23 Sep 2022 01:26:22 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXBO-000twl-6k; Fri, 23 Sep 2022 01:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1663895326; x=1695431326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=66yALVos8vbenfmLPDF16xxikZzpF7R/dW4qgi3gNfs=;
  b=cutCW96g0h4gJsmiXtegQHrbHxs6y307PCaRzMGnTEZVFZpzJWbmcGHo
   v5CREErtKOPVsCqSwNfo6rlgTq98k/q05hjUPiHylSOD77mYMPuCO7jCn
   Cje6KDOWDuD8KPKJT7gHiLayxxINw8WdU4OWddprfSPDk9E72V68zj9d/
   0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Sep 2022 18:08:45 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 18:08:45 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 22 Sep 2022 18:08:45 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <mani@kernel.org>, <quic_nguyenb@quicinc.com>,
	<quic_xiaosenh@quicinc.com>, <quic_cang@quicinc.com>,
	<quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
	<quic_richardp@quicinc.com>, <stanley.chu@mediatek.com>,
	<adrian.hunter@intel.com>, <bvanassche@acm.org>, <avri.altman@wdc.com>,
	<beanhuo@micron.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, Asutosh Das <quic_asutoshd@quicinc.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, open list
	<linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 14/16] ufs: core: mcq: Add completion support in poll
Date: Thu, 22 Sep 2022 18:05:21 -0700
Message-ID: <a6ae9ca3f2aa41d3fe36ced88e58cac3813f8eb5.1663894792.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1663894792.git.quic_asutoshd@quicinc.com>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_180846_375279_F85DE58B 
X-CRM114-Status: GOOD (  14.21  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Complete cqe requests in poll. Assumption is that
several poll completion may happen in different CPUs
for the same Completion Queue. Hence a spin lock
protection is added.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
---
 drivers/ufs/core/ufs-mcq.c     | 13 +++++++++++++
 drivers/ufs/core/ufshcd-priv.h |  2 ++
 drivers/ufs/core/ufshcd.c      |  7 +++++++
 include/ufs/ufshcd.h           |  2 ++
 4 files changed, 24 insertions(+)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 46221c4..a8ca4c9 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -392,6 +392,18 @@ unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
 	return completed_reqs;
 }
 
+unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
+				       struct ufs_hw_queue *hwq)
+{
+	unsigned long completed_reqs;
+
+	spin_lock(&hwq->cq_lock);
+	completed_reqs = ufshcd_mcq_poll_cqe_nolock(hba, hwq);
+	spin_unlock(&hwq->cq_lock);
+
+	return completed_reqs;
+}
+
 void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
 {
 	struct ufs_hw_queue *hwq;
@@ -485,6 +497,7 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
 		hwq = &hba->uhq[i];
 		hwq->max_entries = hba->nutrs;
 		spin_lock_init(&hwq->sq_lock);
+		spin_lock_init(&hwq->cq_lock);
 	}
 
 	/* The very first HW queue is to serve device command */
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 417e2ca..6e9bec6 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -64,6 +64,8 @@ unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
 					 struct ufs_hw_queue *hwq);
 struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
 					   struct request *req);
+unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
+				       struct ufs_hw_queue *hwq);
 
 #define UFSHCD_MCQ_IO_QUEUE_OFFSET	1
 #define SD_ASCII_STD true
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 0705861..44b6c0b 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5426,6 +5426,13 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 	struct ufs_hba *hba = shost_priv(shost);
 	unsigned long completed_reqs, flags;
 	u32 tr_doorbell;
+	struct ufs_hw_queue *hwq;
+
+	if (is_mcq_enabled(hba)) {
+		hwq = &hba->uhq[queue_num + UFSHCD_MCQ_IO_QUEUE_OFFSET];
+
+		return ufshcd_mcq_poll_cqe_lock(hba, hwq);
+	}
 
 	spin_lock_irqsave(&hba->outstanding_lock, flags);
 	tr_doorbell = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 5731c01..efaa7c2 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1062,6 +1062,7 @@ struct ufs_hba {
  * @sq_lock: serialize submission queue access
  * @cq_tail_slot: current slot to which CQ tail pointer is pointing
  * @cq_head_slot: current slot to which CQ head pointer is pointing
+ * @cq_lock: Synchronize between multiple polling instances
  */
 struct ufs_hw_queue {
 	void __iomem *mcq_sq_head;
@@ -1079,6 +1080,7 @@ struct ufs_hw_queue {
 	spinlock_t sq_lock;
 	u32 cq_tail_slot;
 	u32 cq_head_slot;
+	spinlock_t cq_lock;
 };
 
 static inline bool is_mcq_enabled(struct ufs_hba *hba)
-- 
2.7.4


