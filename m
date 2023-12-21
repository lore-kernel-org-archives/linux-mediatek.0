Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CEDC46CD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuhSNqj3oscVEWtEIkp54a6nNUXTvGMlS7FefVV/uyc=; b=lrxWyGyZV3PeBPth6D/1BXNzhO
	pnIAV687R1u5C1TH0wfB3pbs7pTfriPSSHqwGdrVFsyBEzmkIBC3ET28uOiZQunr2eGoHxJdgWmSg
	4sE0ZgkhOZ5GNkQMvAeQF90C36o59qDVhPu3MZM7Ikhfm2iEDW/ZVse+tFmfZwXVHLtKd+K9IH/by
	wL/V2iBOpPICXK2isAdFl71CXshIAx6cIjOMv/s285ltcgvkc6jXpAJ+ydPW5erJWAg2WCrkbSdWx
	AC2bLSNlqjLooSL+y5Hp85RdnoY74hmn/FFDMeQXYiQBo6RzAb4T2ouyd6/vTju11VCVxKDGeD9G/
	CMdp2sJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGGqv-002Wjc-2V;
	Thu, 21 Dec 2023 11:04:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGGqr-002Who-0V
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Dec 2023 11:04:30 +0000
X-UUID: b292f3f09ff011ee958cff29c719f35b-20231221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HuhSNqj3oscVEWtEIkp54a6nNUXTvGMlS7FefVV/uyc=;
	b=jO8Y1rDwHjYCk88EdlYGMrECDLzulrA4GJWZoHGzVd9zAJ/do/vGreo+SFWB9Dc3lUn1tK3/aauT+Wi41OJ8V2Q76P/hziWzMyUlUs1b27T2jUytnU7/EG/4AzK0RHS0wSXZRB+TH3HtbGSV3hCELg+t89UmXZ7yRZTEo4ZwCXE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:96dc1065-62af-4146-806c-c80af1357814,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:5d391d7,CLOUDID:59e20582-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b292f3f09ff011ee958cff29c719f35b-20231221
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 711416488; Thu, 21 Dec 2023 04:04:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Dec 2023 19:04:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Dec 2023 19:04:18 +0800
From: <peter.wang@mediatek.com>
To: <chun-hung.wu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v1 3/3] ufs: host: mediatek: disable mcq irq when clock off
Date: Thu, 21 Dec 2023 19:04:16 +0800
Message-ID: <20231221110416.16176-4-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231221110416.16176-1-peter.wang@mediatek.com>
References: <20231221110416.16176-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.506700-8.000000
X-TMASE-MatchedRID: lR9wedxBitsMQLXc2MGSbA5KPhGIg0MRKx5ICGp/WtFKUzR+o2IeheYH
	EPaPco6b09NQNrxIpFYBtjkcfRMmqWMAzi+7d0ch4RtSDjG+z7D/lBG+uXYJkA6QlBHhBZuwzrW
	t8TufKdvi8zVgXoAltsIJ+4gwXrEtIAcCikR3vq8ecJ4UYu58w+t7M4NW55EM+LVSHK96ubpkoG
	te0BaN7j0poA2OJItE
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.506700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 33DF9C373C8C3152FAE21E497C73C2D539563E69A265D231F0BE56F97B91DB562000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_030429_200991_338E2097 
X-CRM114-Status: GOOD (  12.68  )
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

From: Peter Wang <peter.wang@mediatek.com>

Disable mcq irq when clock off, this is same as legacy mode.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 41 +++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 42 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index eb1934126c87..51f05038408a 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -660,6 +660,45 @@ static void ufs_mtk_pwr_ctrl(struct ufs_hba *hba, bool on)
 	}
 }
 
+static void ufs_mtk_mcq_disable_irq(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	u32 irq, i;
+
+	if (!is_mcq_enabled(hba))
+		return;
+
+	if (host->mcq_nr_intr == 0)
+		return;
+
+	for (i = 0; i < host->mcq_nr_intr; i++) {
+		irq = host->mcq_intr_info[i].irq;
+		disable_irq(irq);
+	}
+	host->is_mcq_intr_enabled = false;
+}
+
+static void ufs_mtk_mcq_enable_irq(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	u32 irq, i;
+
+	if (!is_mcq_enabled(hba))
+		return;
+
+	if (host->mcq_nr_intr == 0)
+		return;
+
+	if (host->is_mcq_intr_enabled == true)
+		return;
+
+	for (i = 0; i < host->mcq_nr_intr; i++) {
+		irq = host->mcq_intr_info[i].irq;
+		enable_irq(irq);
+	}
+	host->is_mcq_intr_enabled = true;
+}
+
 /**
  * ufs_mtk_setup_clocks - enables/disable clocks
  * @hba: host controller instance
@@ -703,8 +742,10 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 
 		if (clk_pwr_off)
 			ufs_mtk_pwr_ctrl(hba, false);
+		ufs_mtk_mcq_disable_irq(hba);
 	} else if (on && status == POST_CHANGE) {
 		ufs_mtk_pwr_ctrl(hba, true);
+		ufs_mtk_mcq_enable_irq(hba);
 	}
 
 	return ret;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index f76e80d91729..922f1e51a60c 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -186,6 +186,7 @@ struct ufs_mtk_host {
 	u32 ip_ver;
 
 	bool mcq_set_intr;
+	bool is_mcq_intr_enabled;
 	int mcq_nr_intr;
 	struct ufs_mtk_mcq_intr_info mcq_intr_info[UFSHCD_MAX_Q_NR];
 };
-- 
2.18.0


