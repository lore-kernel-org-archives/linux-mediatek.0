Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0D7EB64DC
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jul 2023 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj1P4Aw81ZCZ3pufr5+IwKdtZLvIuxj+dTkCIXo2MYg=; b=yadfOC59Me/fIq2ipeO6i0VPBK
	0lw3fGLxLMcGsn10bfmmfOfBnxYL6MGayvCftSzilc7j4pguKLETB/OZQJuBhRQj/pftjuv8AnVvM
	1aLO8ni/dozveCo1aYX0JUaVBIL7sEJ5pWrZsUZ2yaRKwfj+W+pg4HaVy4fBWBV52lZH1pRSM1MPf
	xmQG52W2gpOyIFHtOHHLSJo0PgRW/CQ/ItkOIcyuBiC7FXkGXSJstfSlE7IPCs9F7lIYk6Ci1XsZE
	0AqqcE+8E/6p9COn1zPzghd4b7Wnpf+fMUg8jjY5mUCiNVGkcIlitM9bRKawiOYzOOR2tewQYSTkY
	lBhGddFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFZyr-005zjJ-2P;
	Sat, 01 Jul 2023 12:45:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFZyn-005zhd-1e;
	Sat, 01 Jul 2023 12:45:36 +0000
X-UUID: 277c4f5c180d11ee83ed1395ce914268-20230701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wj1P4Aw81ZCZ3pufr5+IwKdtZLvIuxj+dTkCIXo2MYg=;
	b=Q7UMMKcw/7y+7G7QpTzieZoz1BdA+J8G6V9cwXgG4i2Y7mFL+5VZ/1xkBQtYl2n46+fkqSsN5+Wpk58EY3GUhvjRohNyzF1LgWeo6fgP9U0XCJ1f6UxLwom3JM8iq6A2aDAuIBUuQEVmGELzHnxsgjusCXe4OMfy83ePNrEpcX4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:a7665549-cf45-4149-ad7f-442123c0f8b1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.27,REQID:a7665549-cf45-4149-ad7f-442123c0f8b1,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:01c9525,CLOUDID:1c81be0d-c22b-45ab-8a43-3004e9216b56,B
	ulkID:230630220847EBLGIDS4,BulkQuantity:10,Recheck:0,SF:28|17|19|48|38|29,
	TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD,TF_CID_SPAM_OBB
X-UUID: 277c4f5c180d11ee83ed1395ce914268-20230701
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1830401980; Sat, 01 Jul 2023 05:45:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 1 Jul 2023 20:44:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 1 Jul 2023 20:44:51 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>
Subject: [PATCH v5 1/2] scsi: ufs: core: Export symbols for MTK driver module
Date: Sat, 1 Jul 2023 20:44:40 +0800
Message-ID: <20230701124442.10489-2-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230701124442.10489-1-powen.kao@mediatek.com>
References: <20230701124442.10489-1-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_054533_581537_2D1FFB1D 
X-CRM114-Status: GOOD (  10.24  )
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

Export symbols for MediaTek UFS driver's PM flow and irq handler.

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c | 3 +++
 include/ufs/ufshcd.h       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 6fb0e007af63..e8bad5e9518e 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -97,6 +97,7 @@ void ufshcd_mcq_config_mac(struct ufs_hba *hba, u32 max_active_cmds)
 	val |= FIELD_PREP(MCQ_CFG_MAC_MASK, max_active_cmds);
 	ufshcd_writel(hba, val, REG_UFS_MCQ_CFG);
 }
+EXPORT_SYMBOL_GPL(ufshcd_mcq_config_mac);
 
 /**
  * ufshcd_mcq_req_to_hwq - find the hardware queue on which the
@@ -245,6 +246,7 @@ u32 ufshcd_mcq_read_cqis(struct ufs_hba *hba, int i)
 {
 	return readl(mcq_opr_base(hba, OPR_CQIS, i) + REG_CQIS);
 }
+EXPORT_SYMBOL_GPL(ufshcd_mcq_read_cqis);
 
 void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i)
 {
@@ -388,6 +390,7 @@ void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
 			      MCQ_CFG_n(REG_SQATTR, i));
 	}
 }
+EXPORT_SYMBOL_GPL(ufshcd_mcq_make_queues_operational);
 
 void ufshcd_mcq_enable_esi(struct ufs_hba *hba)
 {
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 6dc11fa0ebb1..9f579640b909 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1254,9 +1254,12 @@ void ufshcd_parse_dev_ref_clk_freq(struct ufs_hba *hba, struct clk *refclk);
 void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val);
 void ufshcd_hba_stop(struct ufs_hba *hba);
 void ufshcd_schedule_eh_work(struct ufs_hba *hba);
+void ufshcd_mcq_config_mac(struct ufs_hba *hba, u32 max_active_cmds);
+u32 ufshcd_mcq_read_cqis(struct ufs_hba *hba, int i);
 void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i);
 unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
 					 struct ufs_hw_queue *hwq);
+void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba);
 void ufshcd_mcq_enable_esi(struct ufs_hba *hba);
 void ufshcd_mcq_config_esi(struct ufs_hba *hba, struct msi_msg *msg);
 
-- 
2.18.0


