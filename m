Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC8DC02198
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2025 08:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Njrwp1r+zGFeVgzOdnxL9NZg66bIEaAv4Rd5Sy5Yx5k=; b=H/kJA5i2JNavzOUw7dfIOQ9Oqz
	7BilMvHIzxJNOnxDp6Hnn40NN6KayKrdFgUPFTmncMb0kDT5Vambnicz7wQgdMmZCP1MnNDABkodl
	2FwSBBolXXRYIhzl5GbIro0O/PH9wnEoU8h/qrI20wqsCasJTdYT+a+6IRf8Cb//68jy76hYlUfGI
	M01LH/gVnm8iGOHoJSQRxUHu7FNHGrJlnzwmDOu+oNkeBa6qERqoJ/M+R2FbaJU2ENyq1FJmlo8zX
	NxnC6tFd9Y3TU58mX7ZOhnxHHEQMV1ibTMWfjEMM9HWRhULqHszQiuvbo0WS4ofADtumFFIhgU2lY
	2RVlqEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tir8W-0000000E8g1-0VrX;
	Fri, 14 Feb 2025 08:33:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tir5o-0000000E88S-1Qyv
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Feb 2025 08:30:37 +0000
X-UUID: f30f2d8ceaad11ef9048ed6ed365623b-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Njrwp1r+zGFeVgzOdnxL9NZg66bIEaAv4Rd5Sy5Yx5k=;
	b=DxTmpZR/jqXDMvzZh/cIHnUUtc4P1LIHBxtHtMvEEpAwIpPtWQcgHdM6VdbFETH3VPjoNCeXfF82jmcVvhzj3FbZbLgJ3tQsLGVFGEouMopXco6NWTXv1bqmdRFtQLMAEuwG1sG4qrdsV4j7Rc09Nr1CmKhNR1NtKm0sN9Y5nQc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:477ab33a-4c50-477f-bb10-c347dfe5d9d3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:60aa074,CLOUDID:2593bf24-96bd-4ac5-8f2e-15aa1ef9defa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f30f2d8ceaad11ef9048ed6ed365623b-20250214
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 154057349; Fri, 14 Feb 2025 01:30:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 16:30:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 16:30:27 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v3] ufs: core: add hba parameter to trace events
Date: Fri, 14 Feb 2025 16:29:36 +0800
Message-ID: <20250214083026.1177880-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_003036_404389_B9FC0A00 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Included the ufs_hba structure as a parameter in various trace events
to provide more context and improve debugging capabilities.
Also remove dev_name which can replace by dev_name(hba->dev).

V3:
 - Remove dev_name entry form TP_STRUCT__entry() to reduce the size.

V2:
 - Remove dev_name and replace it with dev_name(hba->dev).

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs_trace.h | 135 ++++++++++++++++++-----------------
 drivers/ufs/core/ufshcd.c    |  68 +++++++++---------
 2 files changed, 103 insertions(+), 100 deletions(-)

diff --git a/drivers/ufs/core/ufs_trace.h b/drivers/ufs/core/ufs_trace.h
index 84deca2b841d..caa32e23ffa5 100644
--- a/drivers/ufs/core/ufs_trace.h
+++ b/drivers/ufs/core/ufs_trace.h
@@ -83,34 +83,34 @@ UFS_CMD_TRACE_TSF_TYPES
 
 TRACE_EVENT(ufshcd_clk_gating,
 
-	TP_PROTO(const char *dev_name, int state),
+	TP_PROTO(struct ufs_hba *hba, int state),
 
-	TP_ARGS(dev_name, state),
+	TP_ARGS(hba, state),
 
 	TP_STRUCT__entry(
-		__string(dev_name, dev_name)
+		__field(struct ufs_hba *, hba)
 		__field(int, state)
 	),
 
 	TP_fast_assign(
-		__assign_str(dev_name);
+		__entry->hba = hba;
 		__entry->state = state;
 	),
 
 	TP_printk("%s: gating state changed to %s",
-		__get_str(dev_name),
+		dev_name(__entry->hba->dev),
 		__print_symbolic(__entry->state, UFSCHD_CLK_GATING_STATES))
 );
 
 TRACE_EVENT(ufshcd_clk_scaling,
 
-	TP_PROTO(const char *dev_name, const char *state, const char *clk,
+	TP_PROTO(struct ufs_hba *hba, const char *state, const char *clk,
 		u32 prev_state, u32 curr_state),
 
-	TP_ARGS(dev_name, state, clk, prev_state, curr_state),
+	TP_ARGS(hba, state, clk, prev_state, curr_state),
 
 	TP_STRUCT__entry(
-		__string(dev_name, dev_name)
+		__field(struct ufs_hba *, hba)
 		__string(state, state)
 		__string(clk, clk)
 		__field(u32, prev_state)
@@ -118,7 +118,7 @@ TRACE_EVENT(ufshcd_clk_scaling,
 	),
 
 	TP_fast_assign(
-		__assign_str(dev_name);
+		__entry->hba = hba;
 		__assign_str(state);
 		__assign_str(clk);
 		__entry->prev_state = prev_state;
@@ -126,80 +126,80 @@ TRACE_EVENT(ufshcd_clk_scaling,
 	),
 
 	TP_printk("%s: %s %s from %u to %u Hz",
-		__get_str(dev_name), __get_str(state), __get_str(clk),
+		dev_name(__entry->hba->dev), __get_str(state), __get_str(clk),
 		__entry->prev_state, __entry->curr_state)
 );
 
 TRACE_EVENT(ufshcd_auto_bkops_state,
 
-	TP_PROTO(const char *dev_name, const char *state),
+	TP_PROTO(struct ufs_hba *hba, const char *state),
 
-	TP_ARGS(dev_name, state),
+	TP_ARGS(hba, state),
 
 	TP_STRUCT__entry(
-		__string(dev_name, dev_name)
+		__field(struct ufs_hba *, hba)
 		__string(state, state)
 	),
 
 	TP_fast_assign(
-		__assign_str(dev_name);
+		__entry->hba = hba;
 		__assign_str(state);
 	),
 
 	TP_printk("%s: auto bkops - %s",
-		__get_str(dev_name), __get_str(state))
+		dev_name(__entry->hba->dev), __get_str(state))
 );
 
 DECLARE_EVENT_CLASS(ufshcd_profiling_template,
-	TP_PROTO(const char *dev_name, const char *profile_info, s64 time_us,
+	TP_PROTO(struct ufs_hba *hba, const char *profile_info, s64 time_us,
 		 int err),
 
-	TP_ARGS(dev_name, profile_info, time_us, err),
+	TP_ARGS(hba, profile_info, time_us, err),
 
 	TP_STRUCT__entry(
-		__string(dev_name, dev_name)
+		__field(struct ufs_hba *, hba)
 		__string(profile_info, profile_info)
 		__field(s64, time_us)
 		__field(int, err)
 	),
 
 	TP_fast_assign(
-		__assign_str(dev_name);
+		__entry->hba = hba;
 		__assign_str(profile_info);
 		__entry->time_us = time_us;
 		__entry->err = err;
 	),
 
 	TP_printk("%s: %s: took %lld usecs, err %d",
-		__get_str(dev_name), __get_str(profile_info),
+		dev_name(__entry->hba->dev), __get_str(profile_info),
 		__entry->time_us, __entry->err)
 );
 
 DEFINE_EVENT(ufshcd_profiling_template, ufshcd_profile_hibern8,
-	TP_PROTO(const char *dev_name, const char *profile_info, s64 time_us,
+	TP_PROTO(struct ufs_hba *hba, const char *profile_info, s64 time_us,
 		 int err),
-	TP_ARGS(dev_name, profile_info, time_us, err));
+	TP_ARGS(hba, profile_info, time_us, err));
 
 DEFINE_EVENT(ufshcd_profiling_template, ufshcd_profile_clk_gating,
-	TP_PROTO(const char *dev_name, const char *profile_info, s64 time_us,
+	TP_PROTO(struct ufs_hba *hba, const char *profile_info, s64 time_us,
 		 int err),
-	TP_ARGS(dev_name, profile_info, time_us, err));
+	TP_ARGS(hba, profile_info, time_us, err));
 
 DEFINE_EVENT(ufshcd_profiling_template, ufshcd_profile_clk_scaling,
-	TP_PROTO(const char *dev_name, const char *profile_info, s64 time_us,
+	TP_PROTO(struct ufs_hba *hba, const char *profile_info, s64 time_us,
 		 int err),
-	TP_ARGS(dev_name, profile_info, time_us, err));
+	TP_ARGS(hba, profile_info, time_us, err));
 
 DECLARE_EVENT_CLASS(ufshcd_template,
-	TP_PROTO(const char *dev_name, int err, s64 usecs,
+	TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		 int dev_state, int link_state),
 
-	TP_ARGS(dev_name, err, usecs, dev_state, link_state),
+	TP_ARGS(hba, err, usecs, dev_state, link_state),
 
 	TP_STRUCT__entry(
 		__field(s64, usecs)
 		__field(int, err)
-		__string(dev_name, dev_name)
+		__field(struct ufs_hba *, hba)
 		__field(int, dev_state)
 		__field(int, link_state)
 	),
@@ -207,14 +207,14 @@ DECLARE_EVENT_CLASS(ufshcd_template,
 	TP_fast_assign(
 		__entry->usecs = usecs;
 		__entry->err = err;
-		__assign_str(dev_name);
+		__entry->hba = hba;
 		__entry->dev_state = dev_state;
 		__entry->link_state = link_state;
 	),
 
 	TP_printk(
 		"%s: took %lld usecs, dev_state: %s, link_state: %s, err %d",
-		__get_str(dev_name),
+		dev_name(__entry->hba->dev),
 		__entry->usecs,
 		__print_symbolic(__entry->dev_state, UFS_PWR_MODES),
 		__print_symbolic(__entry->link_state, UFS_LINK_STATES),
@@ -223,60 +223,62 @@ DECLARE_EVENT_CLASS(ufshcd_template,
 );
 
 DEFINE_EVENT(ufshcd_template, ufshcd_system_suspend,
-	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+	     TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		      int dev_state, int link_state),
-	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+	     TP_ARGS(hba, err, usecs, dev_state, link_state));
 
 DEFINE_EVENT(ufshcd_template, ufshcd_system_resume,
-	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+	     TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		      int dev_state, int link_state),
-	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+	     TP_ARGS(hba, err, usecs, dev_state, link_state));
 
 DEFINE_EVENT(ufshcd_template, ufshcd_runtime_suspend,
-	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+	     TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		      int dev_state, int link_state),
-	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+	     TP_ARGS(hba, err, usecs, dev_state, link_state));
 
 DEFINE_EVENT(ufshcd_template, ufshcd_runtime_resume,
-	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+	     TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		      int dev_state, int link_state),
-	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+	     TP_ARGS(hba, err, usecs, dev_state, link_state));
 
 DEFINE_EVENT(ufshcd_template, ufshcd_init,
-	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+	     TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		      int dev_state, int link_state),
-	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+	     TP_ARGS(hba, err, usecs, dev_state, link_state));
 
 DEFINE_EVENT(ufshcd_template, ufshcd_wl_suspend,
-	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+	     TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		      int dev_state, int link_state),
-	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+	     TP_ARGS(hba, err, usecs, dev_state, link_state));
 
 DEFINE_EVENT(ufshcd_template, ufshcd_wl_resume,
-	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+	     TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		      int dev_state, int link_state),
-	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+	     TP_ARGS(hba, err, usecs, dev_state, link_state));
 
 DEFINE_EVENT(ufshcd_template, ufshcd_wl_runtime_suspend,
-	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+	     TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		      int dev_state, int link_state),
-	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+	     TP_ARGS(hba, err, usecs, dev_state, link_state));
 
 DEFINE_EVENT(ufshcd_template, ufshcd_wl_runtime_resume,
-	     TP_PROTO(const char *dev_name, int err, s64 usecs,
+	     TP_PROTO(struct ufs_hba *hba, int err, s64 usecs,
 		      int dev_state, int link_state),
-	     TP_ARGS(dev_name, err, usecs, dev_state, link_state));
+	     TP_ARGS(hba, err, usecs, dev_state, link_state));
 
 TRACE_EVENT(ufshcd_command,
-	TP_PROTO(struct scsi_device *sdev, enum ufs_trace_str_t str_t,
+	TP_PROTO(struct scsi_device *sdev, struct ufs_hba *hba,
+		 enum ufs_trace_str_t str_t,
 		 unsigned int tag, u32 doorbell, u32 hwq_id, int transfer_len,
 		 u32 intr, u64 lba, u8 opcode, u8 group_id),
 
-	TP_ARGS(sdev, str_t, tag, doorbell, hwq_id, transfer_len, intr, lba,
+	TP_ARGS(sdev, hba, str_t, tag, doorbell, hwq_id, transfer_len, intr, lba,
 		opcode, group_id),
 
 	TP_STRUCT__entry(
 		__field(struct scsi_device *, sdev)
+		__field(struct ufs_hba *, hba)
 		__field(enum ufs_trace_str_t, str_t)
 		__field(unsigned int, tag)
 		__field(u32, doorbell)
@@ -290,6 +292,7 @@ TRACE_EVENT(ufshcd_command,
 
 	TP_fast_assign(
 		__entry->sdev = sdev;
+		__entry->hba = hba;
 		__entry->str_t = str_t;
 		__entry->tag = tag;
 		__entry->doorbell = doorbell;
@@ -312,13 +315,13 @@ TRACE_EVENT(ufshcd_command,
 );
 
 TRACE_EVENT(ufshcd_uic_command,
-	TP_PROTO(const char *dev_name, enum ufs_trace_str_t str_t, u32 cmd,
+	TP_PROTO(struct ufs_hba *hba, enum ufs_trace_str_t str_t, u32 cmd,
 		 u32 arg1, u32 arg2, u32 arg3),
 
-	TP_ARGS(dev_name, str_t, cmd, arg1, arg2, arg3),
+	TP_ARGS(hba, str_t, cmd, arg1, arg2, arg3),
 
 	TP_STRUCT__entry(
-		__string(dev_name, dev_name)
+		__field(struct ufs_hba *, hba)
 		__field(enum ufs_trace_str_t, str_t)
 		__field(u32, cmd)
 		__field(u32, arg1)
@@ -327,7 +330,7 @@ TRACE_EVENT(ufshcd_uic_command,
 	),
 
 	TP_fast_assign(
-		__assign_str(dev_name);
+		__entry->hba = hba;
 		__entry->str_t = str_t;
 		__entry->cmd = cmd;
 		__entry->arg1 = arg1;
@@ -337,19 +340,19 @@ TRACE_EVENT(ufshcd_uic_command,
 
 	TP_printk(
 		"%s: %s: cmd: 0x%x, arg1: 0x%x, arg2: 0x%x, arg3: 0x%x",
-		show_ufs_cmd_trace_str(__entry->str_t), __get_str(dev_name),
+		show_ufs_cmd_trace_str(__entry->str_t), dev_name(__entry->hba->dev),
 		__entry->cmd, __entry->arg1, __entry->arg2, __entry->arg3
 	)
 );
 
 TRACE_EVENT(ufshcd_upiu,
-	TP_PROTO(const char *dev_name, enum ufs_trace_str_t str_t, void *hdr,
+	TP_PROTO(struct ufs_hba *hba, enum ufs_trace_str_t str_t, void *hdr,
 		 void *tsf, enum ufs_trace_tsf_t tsf_t),
 
-	TP_ARGS(dev_name, str_t, hdr, tsf, tsf_t),
+	TP_ARGS(hba, str_t, hdr, tsf, tsf_t),
 
 	TP_STRUCT__entry(
-		__string(dev_name, dev_name)
+		__field(struct ufs_hba *, hba)
 		__field(enum ufs_trace_str_t, str_t)
 		__array(unsigned char, hdr, 12)
 		__array(unsigned char, tsf, 16)
@@ -357,7 +360,7 @@ TRACE_EVENT(ufshcd_upiu,
 	),
 
 	TP_fast_assign(
-		__assign_str(dev_name);
+		__entry->hba = hba;
 		__entry->str_t = str_t;
 		memcpy(__entry->hdr, hdr, sizeof(__entry->hdr));
 		memcpy(__entry->tsf, tsf, sizeof(__entry->tsf));
@@ -366,7 +369,7 @@ TRACE_EVENT(ufshcd_upiu,
 
 	TP_printk(
 		"%s: %s: HDR:%s, %s:%s",
-		show_ufs_cmd_trace_str(__entry->str_t), __get_str(dev_name),
+		show_ufs_cmd_trace_str(__entry->str_t), dev_name(__entry->hba->dev),
 		__print_hex(__entry->hdr, sizeof(__entry->hdr)),
 		show_ufs_cmd_trace_tsf(__entry->tsf_t),
 		__print_hex(__entry->tsf, sizeof(__entry->tsf))
@@ -375,22 +378,22 @@ TRACE_EVENT(ufshcd_upiu,
 
 TRACE_EVENT(ufshcd_exception_event,
 
-	TP_PROTO(const char *dev_name, u16 status),
+	TP_PROTO(struct ufs_hba *hba, u16 status),
 
-	TP_ARGS(dev_name, status),
+	TP_ARGS(hba, status),
 
 	TP_STRUCT__entry(
-		__string(dev_name, dev_name)
+		__field(struct ufs_hba *, hba)
 		__field(u16, status)
 	),
 
 	TP_fast_assign(
-		__assign_str(dev_name);
+		__entry->hba = hba;
 		__entry->status = status;
 	),
 
 	TP_printk("%s: status 0x%x",
-		__get_str(dev_name), __entry->status
+		dev_name(__entry->hba->dev), __entry->status
 	)
 );
 
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 1893a7ad9531..97c89ac73a54 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -369,7 +369,7 @@ static void ufshcd_add_cmd_upiu_trace(struct ufs_hba *hba, unsigned int tag,
 	else
 		header = &hba->lrb[tag].ucd_rsp_ptr->header;
 
-	trace_ufshcd_upiu(dev_name(hba->dev), str_t, header, &rq->sc.cdb,
+	trace_ufshcd_upiu(hba, str_t, header, &rq->sc.cdb,
 			  UFS_TSF_CDB);
 }
 
@@ -380,7 +380,7 @@ static void ufshcd_add_query_upiu_trace(struct ufs_hba *hba,
 	if (!trace_ufshcd_upiu_enabled())
 		return;
 
-	trace_ufshcd_upiu(dev_name(hba->dev), str_t, &rq_rsp->header,
+	trace_ufshcd_upiu(hba, str_t, &rq_rsp->header,
 			  &rq_rsp->qr, UFS_TSF_OSF);
 }
 
@@ -393,12 +393,12 @@ static void ufshcd_add_tm_upiu_trace(struct ufs_hba *hba, unsigned int tag,
 		return;
 
 	if (str_t == UFS_TM_SEND)
-		trace_ufshcd_upiu(dev_name(hba->dev), str_t,
+		trace_ufshcd_upiu(hba, str_t,
 				  &descp->upiu_req.req_header,
 				  &descp->upiu_req.input_param1,
 				  UFS_TSF_TM_INPUT);
 	else
-		trace_ufshcd_upiu(dev_name(hba->dev), str_t,
+		trace_ufshcd_upiu(hba, str_t,
 				  &descp->upiu_rsp.rsp_header,
 				  &descp->upiu_rsp.output_param1,
 				  UFS_TSF_TM_OUTPUT);
@@ -418,7 +418,7 @@ static void ufshcd_add_uic_command_trace(struct ufs_hba *hba,
 	else
 		cmd = ufshcd_readl(hba, REG_UIC_COMMAND);
 
-	trace_ufshcd_uic_command(dev_name(hba->dev), str_t, cmd,
+	trace_ufshcd_uic_command(hba, str_t, cmd,
 				 ufshcd_readl(hba, REG_UIC_COMMAND_ARG_1),
 				 ufshcd_readl(hba, REG_UIC_COMMAND_ARG_2),
 				 ufshcd_readl(hba, REG_UIC_COMMAND_ARG_3));
@@ -473,7 +473,7 @@ static void ufshcd_add_command_trace(struct ufs_hba *hba, unsigned int tag,
 	} else {
 		doorbell = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
 	}
-	trace_ufshcd_command(cmd->device, str_t, tag, doorbell, hwq_id,
+	trace_ufshcd_command(cmd->device, hba, str_t, tag, doorbell, hwq_id,
 			     transfer_len, intr, lba, opcode, group_id);
 }
 
@@ -1063,7 +1063,7 @@ static int ufshcd_set_clk_freq(struct ufs_hba *hba, bool scale_up)
 						clki->max_freq, ret);
 					break;
 				}
-				trace_ufshcd_clk_scaling(dev_name(hba->dev),
+				trace_ufshcd_clk_scaling(hba,
 						"scaled up", clki->name,
 						clki->curr_freq,
 						clki->max_freq);
@@ -1081,7 +1081,7 @@ static int ufshcd_set_clk_freq(struct ufs_hba *hba, bool scale_up)
 						clki->min_freq, ret);
 					break;
 				}
-				trace_ufshcd_clk_scaling(dev_name(hba->dev),
+				trace_ufshcd_clk_scaling(hba,
 						"scaled down", clki->name,
 						clki->curr_freq,
 						clki->min_freq);
@@ -1122,7 +1122,7 @@ int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,
 				return ret;
 			}
 
-			trace_ufshcd_clk_scaling(dev_name(dev),
+			trace_ufshcd_clk_scaling(hba,
 				(scaling_down ? "scaled down" : "scaled up"),
 				clki->name, hba->clk_scaling.target_freq, freq);
 		}
@@ -1186,7 +1186,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
 	ufshcd_pm_qos_update(hba, scale_up);
 
 out:
-	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
+	trace_ufshcd_profile_clk_scaling(hba,
 			(scale_up ? "up" : "down"),
 			ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 	return ret;
@@ -1548,7 +1548,7 @@ static int ufshcd_devfreq_target(struct device *dev,
 	if (!ret)
 		hba->clk_scaling.target_freq = *freq;
 
-	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
+	trace_ufshcd_profile_clk_scaling(hba,
 		(scale_up ? "up" : "down"),
 		ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 
@@ -1881,7 +1881,7 @@ void ufshcd_hold(struct ufs_hba *hba)
 	case REQ_CLKS_OFF:
 		if (cancel_delayed_work(&hba->clk_gating.gate_work)) {
 			hba->clk_gating.state = CLKS_ON;
-			trace_ufshcd_clk_gating(dev_name(hba->dev),
+			trace_ufshcd_clk_gating(hba,
 						hba->clk_gating.state);
 			break;
 		}
@@ -1893,7 +1893,7 @@ void ufshcd_hold(struct ufs_hba *hba)
 		fallthrough;
 	case CLKS_OFF:
 		hba->clk_gating.state = REQ_CLKS_ON;
-		trace_ufshcd_clk_gating(dev_name(hba->dev),
+		trace_ufshcd_clk_gating(hba,
 					hba->clk_gating.state);
 		queue_work(hba->clk_gating.clk_gating_workq,
 			   &hba->clk_gating.ungate_work);
@@ -1933,7 +1933,7 @@ static void ufshcd_gate_work(struct work_struct *work)
 		if (hba->clk_gating.is_suspended ||
 		    hba->clk_gating.state != REQ_CLKS_OFF) {
 			hba->clk_gating.state = CLKS_ON;
-			trace_ufshcd_clk_gating(dev_name(hba->dev),
+			trace_ufshcd_clk_gating(hba,
 						hba->clk_gating.state);
 			return;
 		}
@@ -1955,7 +1955,7 @@ static void ufshcd_gate_work(struct work_struct *work)
 			hba->clk_gating.state = CLKS_ON;
 			dev_err(hba->dev, "%s: hibern8 enter failed %d\n",
 					__func__, ret);
-			trace_ufshcd_clk_gating(dev_name(hba->dev),
+			trace_ufshcd_clk_gating(hba,
 						hba->clk_gating.state);
 			return;
 		}
@@ -1980,7 +1980,7 @@ static void ufshcd_gate_work(struct work_struct *work)
 	guard(spinlock_irqsave)(&hba->clk_gating.lock);
 	if (hba->clk_gating.state == REQ_CLKS_OFF) {
 		hba->clk_gating.state = CLKS_OFF;
-		trace_ufshcd_clk_gating(dev_name(hba->dev),
+		trace_ufshcd_clk_gating(hba,
 					hba->clk_gating.state);
 	}
 }
@@ -2006,7 +2006,7 @@ static void __ufshcd_release(struct ufs_hba *hba)
 	}
 
 	hba->clk_gating.state = REQ_CLKS_OFF;
-	trace_ufshcd_clk_gating(dev_name(hba->dev), hba->clk_gating.state);
+	trace_ufshcd_clk_gating(hba, hba->clk_gating.state);
 	queue_delayed_work(hba->clk_gating.clk_gating_workq,
 			   &hba->clk_gating.gate_work,
 			   msecs_to_jiffies(hba->clk_gating.delay_ms));
@@ -4422,7 +4422,7 @@ int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
 	ufshcd_vops_hibern8_notify(hba, UIC_CMD_DME_HIBER_ENTER, PRE_CHANGE);
 
 	ret = ufshcd_uic_pwr_ctrl(hba, &uic_cmd);
-	trace_ufshcd_profile_hibern8(dev_name(hba->dev), "enter",
+	trace_ufshcd_profile_hibern8(hba, "enter",
 			     ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 
 	if (ret)
@@ -4447,7 +4447,7 @@ int ufshcd_uic_hibern8_exit(struct ufs_hba *hba)
 	ufshcd_vops_hibern8_notify(hba, UIC_CMD_DME_HIBER_EXIT, PRE_CHANGE);
 
 	ret = ufshcd_uic_pwr_ctrl(hba, &uic_cmd);
-	trace_ufshcd_profile_hibern8(dev_name(hba->dev), "exit",
+	trace_ufshcd_profile_hibern8(hba, "exit",
 			     ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 
 	if (ret) {
@@ -5808,7 +5808,7 @@ static int ufshcd_enable_auto_bkops(struct ufs_hba *hba)
 	}
 
 	hba->auto_bkops_enabled = true;
-	trace_ufshcd_auto_bkops_state(dev_name(hba->dev), "Enabled");
+	trace_ufshcd_auto_bkops_state(hba, "Enabled");
 
 	/* No need of URGENT_BKOPS exception from the device */
 	err = ufshcd_disable_ee(hba, MASK_EE_URGENT_BKOPS);
@@ -5859,7 +5859,7 @@ static int ufshcd_disable_auto_bkops(struct ufs_hba *hba)
 	}
 
 	hba->auto_bkops_enabled = false;
-	trace_ufshcd_auto_bkops_state(dev_name(hba->dev), "Disabled");
+	trace_ufshcd_auto_bkops_state(hba, "Disabled");
 	hba->is_urgent_bkops_lvl_checked = false;
 out:
 	return err;
@@ -6193,7 +6193,7 @@ static void ufshcd_exception_event_handler(struct work_struct *work)
 		return;
 	}
 
-	trace_ufshcd_exception_event(dev_name(hba->dev), status);
+	trace_ufshcd_exception_event(hba, status);
 
 	if (status & hba->ee_drv_mask & MASK_EE_URGENT_BKOPS)
 		ufshcd_bkops_exception_event_handler(hba);
@@ -7652,7 +7652,7 @@ static void ufshcd_process_probe_result(struct ufs_hba *hba,
 		hba->ufshcd_state = UFSHCD_STATE_OPERATIONAL;
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 
-	trace_ufshcd_init(dev_name(hba->dev), ret,
+	trace_ufshcd_init(hba, ret,
 			  ktime_to_us(ktime_sub(ktime_get(), probe_start)),
 			  hba->curr_dev_pwr_mode, hba->uic_link_state);
 }
@@ -9148,12 +9148,12 @@ static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on)
 	} else if (!ret && on && hba->clk_gating.is_initialized) {
 		scoped_guard(spinlock_irqsave, &hba->clk_gating.lock)
 			hba->clk_gating.state = CLKS_ON;
-		trace_ufshcd_clk_gating(dev_name(hba->dev),
+		trace_ufshcd_clk_gating(hba,
 					hba->clk_gating.state);
 	}
 
 	if (clk_state_changed)
-		trace_ufshcd_profile_clk_gating(dev_name(hba->dev),
+		trace_ufshcd_profile_clk_gating(hba,
 			(on ? "on" : "off"),
 			ktime_to_us(ktime_sub(ktime_get(), start)), ret);
 	return ret;
@@ -9853,7 +9853,7 @@ static int ufshcd_wl_runtime_suspend(struct device *dev)
 	if (ret)
 		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__, ret);
 
-	trace_ufshcd_wl_runtime_suspend(dev_name(dev), ret,
+	trace_ufshcd_wl_runtime_suspend(hba, ret,
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
 
@@ -9873,7 +9873,7 @@ static int ufshcd_wl_runtime_resume(struct device *dev)
 	if (ret)
 		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__, ret);
 
-	trace_ufshcd_wl_runtime_resume(dev_name(dev), ret,
+	trace_ufshcd_wl_runtime_resume(hba, ret,
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
 
@@ -9905,7 +9905,7 @@ static int ufshcd_wl_suspend(struct device *dev)
 out:
 	if (!ret)
 		hba->is_sys_suspended = true;
-	trace_ufshcd_wl_suspend(dev_name(dev), ret,
+	trace_ufshcd_wl_suspend(hba, ret,
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
 
@@ -9928,7 +9928,7 @@ static int ufshcd_wl_resume(struct device *dev)
 	if (ret)
 		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__, ret);
 out:
-	trace_ufshcd_wl_resume(dev_name(dev), ret,
+	trace_ufshcd_wl_resume(hba, ret,
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
 	if (!ret)
@@ -9966,7 +9966,7 @@ static int ufshcd_suspend(struct ufs_hba *hba)
 	}
 	if (ufshcd_is_clkgating_allowed(hba)) {
 		hba->clk_gating.state = CLKS_OFF;
-		trace_ufshcd_clk_gating(dev_name(hba->dev),
+		trace_ufshcd_clk_gating(hba,
 					hba->clk_gating.state);
 	}
 
@@ -10039,7 +10039,7 @@ int ufshcd_system_suspend(struct device *dev)
 
 	ret = ufshcd_suspend(hba);
 out:
-	trace_ufshcd_system_suspend(dev_name(hba->dev), ret,
+	trace_ufshcd_system_suspend(hba, ret,
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
 	return ret;
@@ -10067,7 +10067,7 @@ int ufshcd_system_resume(struct device *dev)
 	ret = ufshcd_resume(hba);
 
 out:
-	trace_ufshcd_system_resume(dev_name(hba->dev), ret,
+	trace_ufshcd_system_resume(hba, ret,
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
 
@@ -10093,7 +10093,7 @@ int ufshcd_runtime_suspend(struct device *dev)
 
 	ret = ufshcd_suspend(hba);
 
-	trace_ufshcd_runtime_suspend(dev_name(hba->dev), ret,
+	trace_ufshcd_runtime_suspend(hba, ret,
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
 	return ret;
@@ -10120,7 +10120,7 @@ int ufshcd_runtime_resume(struct device *dev)
 
 	ret = ufshcd_resume(hba);
 
-	trace_ufshcd_runtime_resume(dev_name(hba->dev), ret,
+	trace_ufshcd_runtime_resume(hba, ret,
 		ktime_to_us(ktime_sub(ktime_get(), start)),
 		hba->curr_dev_pwr_mode, hba->uic_link_state);
 	return ret;
-- 
2.45.2


