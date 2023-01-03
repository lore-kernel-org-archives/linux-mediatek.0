Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D98C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dbP0MU+Ngm34ssMNX9Il2BdD+R80io9dtP2LvmVbgA=; b=Rk/eUUjHhtC3HjOe2eA3Sfg/FH
	7Q3iTMSeI9l9JXKJ3Vr+Fo1YjI+j2TpXcLup2fabW46q+NeIykaLKD8x+t1vkYlK+iaqUSSeZUMI5
	QMbYp9jZgIjK82zQYoDUARDYxlmM17KStXmWrPpF4KlGqmOztpXHeMi2I73DCdXqKC2Hsjg2u1S/a
	4JL3xvEP96Ye334ZXCn4sU85ZXADLCF0hgWdGX1v1zhTjwMIf9bin2YBcawiyNV+zH44WAoAtKRKB
	hFIZfIJh0rwpVQcYBrVKLSnAHmFQUWnG1VfRk4zQGDQQWp/uxThwaMM6vYbWm+dX451O3Qy4LAgLy
	xTo1uhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmvs-004OHU-R6; Tue, 03 Jan 2023 19:26:44 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmil-004GvN-N2; Tue, 03 Jan 2023 19:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1672773191; x=1704309191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=9dbP0MU+Ngm34ssMNX9Il2BdD+R80io9dtP2LvmVbgA=;
  b=i6IT2FIbqR7Eh98cb98HR9tnlLszAE1LPO04SId0531aFNm+AR7qE0IK
   BWZ6/tXc9CtBzEvBe5Z6MYnj1SiqeY6g9IFNMFj4LDIhrxd5gu9GHNVrM
   SNztPpCCR70uVa/56Tv4TXcAnXPzmZKyr4JZ1Ul0hexxnVjPS1UQNJvnH
   4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Jan 2023 11:13:10 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 11:13:10 -0800
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 3 Jan 2023 11:13:10 -0800
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
	<linux-scsi@vger.kernel.org>
CC: <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
	<stanley.chu@mediatek.com>, <adrian.hunter@intel.com>, <bvanassche@acm.org>,
	<avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>, <linux-arm-msm@vger.kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Jinyoung Choi
	<j-young.choi@samsung.com>, open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v12 09/15] ufs: core: mcq: Use shared tags for MCQ mode
Date: Tue, 3 Jan 2023 11:09:28 -0800
Message-ID: <0bc3193c8f4cd9b777227a2e39c363e331743c8f.1672771664.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1672771664.git.quic_asutoshd@quicinc.com>
References: <cover.1672771664.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_111312_554315_F3B3DF35 
X-CRM114-Status: GOOD (  16.30  )
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

Enable shared tags for MCQ. For UFS, this should
not have a huge performance impact. It however
simplifies the MCQ implementation and reuses most of
the existing code in the issue and completion path.
Also add multiple queue mapping to map_queue().

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c |  2 ++
 drivers/ufs/core/ufshcd.c  | 28 ++++++++++++++++------------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 496e2b6..8bf222f 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -280,6 +280,7 @@ void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
 
 int ufshcd_mcq_init(struct ufs_hba *hba)
 {
+	struct Scsi_Host *host = hba->host;
 	struct ufs_hw_queue *hwq;
 	int ret, i;
 
@@ -315,5 +316,6 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
 	/* Give dev_cmd_queue the minimal number of entries */
 	hba->dev_cmd_queue->max_entries = MAX_DEV_CMD_ENTRIES;
 
+	host->host_tagset = 1;
 	return 0;
 }
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bd80ce6..d25ec34 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2776,24 +2776,28 @@ static inline bool is_device_wlun(struct scsi_device *sdev)
  */
 static void ufshcd_map_queues(struct Scsi_Host *shost)
 {
-	int i;
+	struct ufs_hba *hba = shost_priv(shost);
+	int i, queue_offset = 0;
+
+	if (!is_mcq_supported(hba)) {
+		hba->nr_queues[HCTX_TYPE_DEFAULT] = 1;
+		hba->nr_queues[HCTX_TYPE_READ] = 0;
+		hba->nr_queues[HCTX_TYPE_POLL] = 1;
+		hba->nr_hw_queues = 1;
+	}
 
 	for (i = 0; i < shost->nr_maps; i++) {
 		struct blk_mq_queue_map *map = &shost->tag_set.map[i];
 
-		switch (i) {
-		case HCTX_TYPE_DEFAULT:
-		case HCTX_TYPE_POLL:
-			map->nr_queues = 1;
-			break;
-		case HCTX_TYPE_READ:
-			map->nr_queues = 0;
+		map->nr_queues = hba->nr_queues[i];
+		if (!map->nr_queues)
 			continue;
-		default:
-			WARN_ON_ONCE(true);
-		}
-		map->queue_offset = 0;
+		map->queue_offset = queue_offset;
+		if (i == HCTX_TYPE_POLL && !is_mcq_supported(hba))
+			map->queue_offset = 0;
+
 		blk_mq_map_queues(map);
+		queue_offset += map->nr_queues;
 	}
 }
 
-- 
2.7.4


