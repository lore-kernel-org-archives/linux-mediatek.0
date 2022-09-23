Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64B5C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 01:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBB2IUjlk3Tku5HcCdkZTFHCcqZ3cJIKTd4Gu75oCbU=; b=nHPgRgCGOPvETHSXxilcH3EbHi
	aEZde1luTp/W11wB1lGbkCJFnlMul5oTDjKZt1AAWEUR/lFJpxQKn0oUf/3ISFgKWkZRW0/WjQ32c
	CWyd8LFN4QLhdQ4ROQxWDsekLict8NhD1+hb0fhIick58J4VQnzpT2jW0EvGWO0TQJsER5TxPO7WZ
	5yQRm0sSx8ba4cs1SvaLy7wAbZO4JQSJJp4CAFw+lNG8G53CRDrNv3SUd9H+THmeHpjgBI3/xLeB/
	pbtcWL/56UbAPKeavXgkmDmaFtxV6kDxPZjq5Daq1YOXfmgOZoBT+h158TZsBL2kI3oNQLs8tMpPT
	xLuxyNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXUG-000zx3-FH; Fri, 23 Sep 2022 01:28:16 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXBQ-000twl-L1; Fri, 23 Sep 2022 01:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1663895328; x=1695431328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=OBB2IUjlk3Tku5HcCdkZTFHCcqZ3cJIKTd4Gu75oCbU=;
  b=wA7HUXAtwV1OBu84vGSO0Xj4QwHDCScYCX9/PTET7WgTMGQEwfm6jIKE
   4/JcvMYe3tMNszjXYb2Ynk9A9S5qt8iFGIMH8hY+dFQrsVPWL5tvGg+Mm
   GC3fuBkfkh+d9l/Ibms+iyVjVcRMV7d28Laq4YmKmB2t25Vj3llZEO/uG
   U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Sep 2022 18:08:48 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 18:08:48 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 22 Sep 2022 18:08:47 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <mani@kernel.org>, <quic_nguyenb@quicinc.com>,
	<quic_xiaosenh@quicinc.com>, <quic_cang@quicinc.com>,
	<quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
	<quic_richardp@quicinc.com>, <stanley.chu@mediatek.com>,
	<adrian.hunter@intel.com>, <bvanassche@acm.org>, <avri.altman@wdc.com>,
	<beanhuo@micron.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, Asutosh Das <quic_asutoshd@quicinc.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, open list
	<linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 15/16] ufs: core: mcq: Enable Multi Circular Queue
Date: Thu, 22 Sep 2022 18:05:22 -0700
Message-ID: <c670b4f07fec06652d281ff0a390f3d2ef347d70.1663894792.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1663894792.git.quic_asutoshd@quicinc.com>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_180848_760573_16395D78 
X-CRM114-Status: GOOD (  10.04  )
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

MCQ is enabled in the Host Controller.

Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
---
 drivers/ufs/core/ufshcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 44b6c0b..a230897 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8312,6 +8312,10 @@ static int ufshcd_config_mcq(struct ufs_hba *hba)
 
 	hba->host->can_queue = hba->nutrs - UFSHCD_NUM_RESERVED;
 	hba->reserved_slot = hba->nutrs - UFSHCD_NUM_RESERVED;
+	/* Select MCQ mode */
+	ufshcd_writel(hba, ufshcd_readl(hba, REG_UFS_MEM_CFG) | 0x1,
+		      REG_UFS_MEM_CFG);
+	hba->mcq_enabled = true;
 	dev_info(hba->dev, "MCQ configured, nr_queues=%d, io_queues=%d, read_queue=%d, poll_queues=%d, queue_depth=%d\n",
 		 hba->nr_hw_queues, hba->nr_queues[HCTX_TYPE_DEFAULT],
 		 hba->nr_queues[HCTX_TYPE_READ], hba->nr_queues[HCTX_TYPE_POLL],
-- 
2.7.4


