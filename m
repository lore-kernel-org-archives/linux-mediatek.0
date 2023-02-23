Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EC5C64ED8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Bv9hus6t23MVmXdkKAq2V+bGJu+2jJEci4Oifa1YpA=; b=Atfq+0hG2dp3+QGO+vl7txFm98
	S29jERIbfhBeZDMqornHEjTu5bAY+rZL5PJs+H38gckyI4kMQfsHaOK+SeukDBT4gcrZ32PItubam
	A7FFxqhyqVhwBT6tdnAzHvz52F09Wp9oqmUkn1YWxq9WbosXDDv+S57VZhTjSYAJQ8jle+emnXgPz
	qoV+CmGDFow5Jh/dIjgXFaDm2pAo1rKE51D8FrgFI2SiK3jPQgyUO9EFBBCBYOj/91WsCRdrqmjid
	BosJU1YnIcrRmyVLQHqeTuZelVZbp75Yab97Y+PkTS6PT8ev3ciJ7xwhk+JUCWi5ZuCXNnE9QptDi
	141AhiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVDWb-00H1c4-4M; Thu, 23 Feb 2023 15:28:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVDWD-00H1OG-Pf; Thu, 23 Feb 2023 15:28:27 +0000
X-UUID: b39fcc7cb38e11edbbe3f76fe852e059-20230223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3Bv9hus6t23MVmXdkKAq2V+bGJu+2jJEci4Oifa1YpA=;
	b=HX+2368OVaqsOeM6xpaLbviCQiCuqdTGARKtvAxd4o/Pmpn25kBhLm+O+y2ksJ4wS28xQTIbxD+lDAt6CxBBOdud3gvmVCKMG3N2yfxUZ+7pj9pC7fFEKiJT19ZvQdR5UoMYrSsbwt465RQS4KG0WnyuYYXatjGI5v0dohk0wss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:6d4036ff-77ff-468c-966f-f8c8fe33fdea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:d35962b1-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: b39fcc7cb38e11edbbe3f76fe852e059-20230223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 632956423; Thu, 23 Feb 2023 08:28:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 23 Feb 2023 23:28:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 23 Feb 2023 23:28:18 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>, <mason.zhang@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>
Subject: [PATCH v3 5/6] scsi: ufs: core: Export symbols for MTK driver module
Date: Thu, 23 Feb 2023 23:27:55 +0800
Message-ID: <20230223152757.13606-6-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230223152757.13606-1-powen.kao@mediatek.com>
References: <20230223152757.13606-1-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_072825_899098_6A379879 
X-CRM114-Status: GOOD (  12.32  )
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

Export
- ufshcd_mcq_config_mac
- ufshcd_mcq_make_queues_operational
- ufshcd_mcq_read_cqis
- ufshcd_disable_intr

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c     | 3 +++
 drivers/ufs/core/ufshcd-priv.h | 2 --
 drivers/ufs/core/ufshcd.c      | 3 ++-
 include/ufs/ufshcd.h           | 5 +++++
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index f9af658b4ba2..7f00af766f5c 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -92,6 +92,7 @@ void ufshcd_mcq_config_mac(struct ufs_hba *hba, u32 max_active_cmds)
 	val |= FIELD_PREP(MCQ_CFG_MAC_MASK, max_active_cmds);
 	ufshcd_writel(hba, val, REG_UFS_MCQ_CFG);
 }
+EXPORT_SYMBOL_GPL(ufshcd_mcq_config_mac);
 
 /**
  * ufshcd_mcq_req_to_hwq - find the hardware queue on which the
@@ -242,6 +243,7 @@ u32 ufshcd_mcq_read_cqis(struct ufs_hba *hba, int i)
 {
 	return readl(mcq_opr_base(hba, OPR_CQIS, i) + REG_CQIS);
 }
+EXPORT_SYMBOL_GPL(ufshcd_mcq_read_cqis);
 
 void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i)
 {
@@ -372,6 +374,7 @@ void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
 			      MCQ_CFG_n(REG_SQATTR, i));
 	}
 }
+EXPORT_SYMBOL_GPL(ufshcd_mcq_make_queues_operational);
 
 void ufshcd_mcq_enable_esi(struct ufs_hba *hba)
 {
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 529f8507a5e4..ffafcac329a8 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -66,8 +66,6 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
 int ufshcd_mcq_init(struct ufs_hba *hba);
 int ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba);
 int ufshcd_mcq_memory_alloc(struct ufs_hba *hba);
-void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba);
-void ufshcd_mcq_config_mac(struct ufs_hba *hba, u32 max_active_cmds);
 void ufshcd_mcq_select_mcq_mode(struct ufs_hba *hba);
 u32 ufshcd_mcq_read_cqis(struct ufs_hba *hba, int i);
 void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3357cfa23616..b3966f772063 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2563,7 +2563,7 @@ static void ufshcd_enable_intr(struct ufs_hba *hba, u32 intrs)
  * @hba: per adapter instance
  * @intrs: interrupt bits
  */
-static void ufshcd_disable_intr(struct ufs_hba *hba, u32 intrs)
+void ufshcd_disable_intr(struct ufs_hba *hba, u32 intrs)
 {
 	u32 set = ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
 
@@ -2579,6 +2579,7 @@ static void ufshcd_disable_intr(struct ufs_hba *hba, u32 intrs)
 
 	ufshcd_writel(hba, set, REG_INTERRUPT_ENABLE);
 }
+EXPORT_SYMBOL_GPL(ufshcd_disable_intr);
 
 /**
  * ufshcd_prepare_req_desc_hdr - Fill UTP Transfer request descriptor header according to request
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 8f79cca449e1..c49c9572088a 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1230,6 +1230,7 @@ static inline void ufshcd_rmwl(struct ufs_hba *hba, u32 mask, u32 val, u32 reg)
 
 int ufshcd_alloc_host(struct device *, struct ufs_hba **);
 void ufshcd_dealloc_host(struct ufs_hba *);
+void ufshcd_disable_intr(struct ufs_hba *hba, u32 intrs);
 int ufshcd_hba_enable(struct ufs_hba *hba);
 int ufshcd_init(struct ufs_hba *, void __iomem *, unsigned int);
 int ufshcd_link_recovery(struct ufs_hba *hba);
@@ -1242,9 +1243,13 @@ void ufshcd_parse_dev_ref_clk_freq(struct ufs_hba *hba, struct clk *refclk);
 void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val);
 void ufshcd_hba_stop(struct ufs_hba *hba);
 void ufshcd_schedule_eh_work(struct ufs_hba *hba);
+
+void ufshcd_mcq_config_mac(struct ufs_hba *hba, u32 max_active_cmds);
+u32 ufshcd_mcq_read_cqis(struct ufs_hba *hba, int i);
 void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i);
 unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
 					 struct ufs_hw_queue *hwq);
+void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba);
 void ufshcd_mcq_enable_esi(struct ufs_hba *hba);
 void ufshcd_mcq_config_esi(struct ufs_hba *hba, struct msi_msg *msg);
 
-- 
2.18.0


