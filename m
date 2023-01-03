Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3059C4708D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlZhINR6GHC8AxP9B6PXhqEqqyEfkDNxrP8vR37yibg=; b=uf381jIf9Pxwan/lAVRyYRpy6W
	Ex/zPCwu5m+vztfaDuM5VKUNDfJmqpYkkfcRTuDAkLprEPCLg8k+hSvDWQ/IMxui2XNJ761eLtMJF
	7Sy3ZS4NNAJg61vZsRFlWiVYSrj8s/k9sYopM+0qUcs74d2YKMdDmz70xSWVrKbM+s0tTq7Ij76Gg
	5ppFRUNZX7DA/vAqy+sqUz6651nqMN0Skobi7r6coDjaR1dQAt09KOdzt6r8wrbmkA5Y2edbxFu/W
	Jn4wO/JJ/xbX8C5y34d2E3SWLc0kq6oOmvdw1x+CRFav53CL2UKQQajR3cpHlz0ZSpsRMze0vV7Jt
	xCvWF5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmzQ-004Q6Q-F2; Tue, 03 Jan 2023 19:30:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmjz-004Hb7-Qq; Tue, 03 Jan 2023 19:14:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303Ii2Pn009653;
	Tue, 3 Jan 2023 19:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=KlZhINR6GHC8AxP9B6PXhqEqqyEfkDNxrP8vR37yibg=;
 b=ppbZc0EOB1H1IrUSr0EVx/Ps0n1THrPDYgb+mZgOyeEbH/c86hv1duHYIo1vUhXyj2GR
 +r7fq3OngGs7j/x6tSk7CBJaf7cp2RDBGug5Z+bstVcUrg/0JnLkNsinbCV+zuZ/p7ju
 7H89bkQ9u3OXjOkKQ7Nb1ss6hW0ledkzJ6EarsMPsiD4beHpXInpzS6MM1kjpmhp0k/V
 cctIXQQ4XGkmYGLP9SAsa1sg8z9Ft7BPsN3c88SB0pSYN7y1r0P6anZ9gZN1hWDIeZiU
 1FERLmaSAiSxg/NBVm6+JqjrcOgQYE1k9CgGxPs9fKq14oFejThbTZvG3iaSWHSOha47 6g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsveg1s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jan 2023 19:14:19 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 303JEIlf017299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jan 2023 19:14:18 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 3 Jan 2023 11:14:18 -0800
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>
CC: <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <mani@kernel.org>,
        <beanhuo@micron.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Arthur Simchaev
	<Arthur.Simchaev@wdc.com>,
        Jinyoung Choi <j-young.choi@samsung.com>,
        "Keoseong Park" <keosung.park@samsung.com>,
        Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v12 14/15] ufs: core: mcq: Add completion support in poll
Date: Tue, 3 Jan 2023 11:09:33 -0800
Message-ID: <aca68dc46c241447e19180e7d2e1b8f9b6b22032.1672771664.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1672771664.git.quic_asutoshd@quicinc.com>
References: <cover.1672771664.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Au2qtghJZRujSsYEv08nUSCiITG4N0gO
X-Proofpoint-ORIG-GUID: Au2qtghJZRujSsYEv08nUSCiITG4N0gO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_07,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_111428_214957_913DE9D5 
X-CRM114-Status: GOOD (  18.27  )
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
for the same completion queue. Hence a spin lock
protection is added.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c     | 13 +++++++++++++
 drivers/ufs/core/ufshcd-priv.h |  2 ++
 drivers/ufs/core/ufshcd.c      |  7 +++++++
 include/ufs/ufshcd.h           |  2 ++
 4 files changed, 24 insertions(+)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index cd10d59..e710d19 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -294,6 +294,18 @@ unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
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
@@ -390,6 +402,7 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
 		hwq = &hba->uhq[i];
 		hwq->max_entries = hba->nutrs;
 		spin_lock_init(&hwq->sq_lock);
+		spin_lock_init(&hwq->cq_lock);
 	}
 
 	/* The very first HW queue serves device commands */
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 1691fc0..b1c5a15 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -75,6 +75,8 @@ unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
 					 struct ufs_hw_queue *hwq);
 struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
 					   struct request *req);
+unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
+				       struct ufs_hw_queue *hwq);
 
 #define UFSHCD_MCQ_IO_QUEUE_OFFSET	1
 #define SD_ASCII_STD true
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 2635570..4d31131 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5461,6 +5461,13 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
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
index 1c4d5f8..2f36351 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1076,6 +1076,7 @@ struct ufs_hba {
  * @sq_lock: serialize submission queue access
  * @cq_tail_slot: current slot to which CQ tail pointer is pointing
  * @cq_head_slot: current slot to which CQ head pointer is pointing
+ * @cq_lock: Synchronize between multiple polling instances
  */
 struct ufs_hw_queue {
 	void __iomem *mcq_sq_head;
@@ -1093,6 +1094,7 @@ struct ufs_hw_queue {
 	spinlock_t sq_lock;
 	u32 cq_tail_slot;
 	u32 cq_head_slot;
+	spinlock_t cq_lock;
 };
 
 static inline bool is_mcq_enabled(struct ufs_hba *hba)
-- 
2.7.4


