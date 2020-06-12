Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264F3C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 15:11:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F05D920835
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 15:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jFXOSw/p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eaID3cTv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F05D920835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TkPeyujFm7kZZD1CeRg9aC4fCYcOA0fkRVKHxUxXtc=; b=jFXOSw/pntVtmz
	+v2mm2FOdjwMdU0V9hOoT3fWP+nRA9FgaB9BfkvcF0lzpPurJJybpvS0nLpSXONnGVNQO8IayaK2L
	mdGasKBDgxprW1gaLKiGkth3btuOJl8Gh69MleL7oqqqEkkfwXGzIzislZ+3Dq2vSdqRWFxw1Wc03
	o1yUO5/VvI+x7+T2XZqSbBHS2Ltznk1PIBRB6aeZyxEoge7SHHJIrclgySws1/m4/X8/+v7+lSTHi
	Ds3jII6nnmplRTkCjMaqpX/8JLZLxKQgespwN+7tBJip8kbecQ5o7uXEcOF3AqVx0ASfZQ65zW7rc
	wJ1w0D20oIml7ab6roEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjlKr-0003nV-9K; Fri, 12 Jun 2020 15:11:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjlJy-0001ZH-Oz; Fri, 12 Jun 2020 15:10:21 +0000
X-UUID: 8f356d6555984c1488f17e2b486b0d39-20200612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+0KA0dOhmw5UB0xe1wGnzSeL3/LIui1ay1wP2Ey5MGg=; 
 b=eaID3cTvZCfa59n34eaUV9pwbbuVl/oZfmdU8lesH8Q0YYxMvpcppJJSc/FeyrVNCZXNyBVJKYgC2vxLXgG3y5P+17R08PXpdQ7u5OZM5bwCIp95xqptRHSXskb1WSy8cSaRsnqSRebpZieZIzZDvl7FX3nWHW/8tkEGa0MvruA=;
X-UUID: 8f356d6555984c1488f17e2b486b0d39-20200612
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1102410366; Fri, 12 Jun 2020 07:09:51 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Jun 2020 08:10:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Jun 2020 23:10:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Jun 2020 23:10:01 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v1 2/2] scsi: ufs: Add trace event for UIC commands
Date: Fri, 12 Jun 2020 23:10:00 +0800
Message-ID: <20200612151000.27639-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200612151000.27639-1-stanley.chu@mediatek.com>
References: <20200612151000.27639-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 59D9D01AB4EC54D1F10C739C554AC979AC81CEAF602D64FA508FA0139328F5D72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_081018_810842_31B8064B 
X-CRM114-Status: UNSURE (   8.41  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the ftrace infrastructure to conditionally trace UFS UIC command
events.

New trace event "ufshcd_uic_command" is created, which samples the
following UFS UIC command data:
- Device name
- Optional identification string
- UIC command opcode
- UIC command argument1
- UIC command argument2
- UIC command argement3
- UIC command execution result

Usage:
	echo 1 > /sys/kernel/debug/tracing/events/ufs/enable
	cat /sys/kernel/debug/tracing/trace_pipe

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c  | 29 +++++++++++++++++++++++++++++
 include/trace/events/ufs.h | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index c197a3315d21..181617966658 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -339,6 +339,27 @@ static void ufshcd_add_tm_upiu_trace(struct ufs_hba *hba, unsigned int tag,
 			&descp->input_param1);
 }
 
+static void ufshcd_add_uic_command_trace(struct ufs_hba *hba,
+					 struct uic_command *ucmd,
+					 const char *str)
+{
+	u32 cmd;
+
+	if (!trace_ufshcd_uic_command_enabled())
+		return;
+
+	if (!strcmp(str, "uic_send"))
+		cmd = ucmd->command;
+	else
+		cmd = ufshcd_readl(hba, REG_UIC_COMMAND);
+
+	trace_ufshcd_uic_command(dev_name(hba->dev), str, cmd,
+				 ucmd->result,
+				 ufshcd_readl(hba, REG_UIC_COMMAND_ARG_1),
+				 ufshcd_readl(hba, REG_UIC_COMMAND_ARG_2),
+				 ufshcd_readl(hba, REG_UIC_COMMAND_ARG_3));
+}
+
 static void ufshcd_add_command_trace(struct ufs_hba *hba,
 		unsigned int tag, const char *str)
 {
@@ -2054,6 +2075,8 @@ ufshcd_dispatch_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd)
 	/* Write UIC Cmd */
 	ufshcd_writel(hba, uic_cmd->command & COMMAND_OPCODE_MASK,
 		      REG_UIC_COMMAND);
+
+	ufshcd_add_uic_command_trace(hba, uic_cmd, "uic_send");
 }
 
 /**
@@ -2080,6 +2103,9 @@ ufshcd_wait_for_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd)
 	hba->active_uic_cmd = NULL;
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 
+	uic_cmd->result = ret;
+	ufshcd_add_uic_command_trace(hba, uic_cmd, "uic_complete");
+
 	return ret;
 }
 
@@ -3760,6 +3786,9 @@ static int ufshcd_uic_pwr_ctrl(struct ufs_hba *hba, struct uic_command *cmd)
 		ret = (status != PWR_OK) ? status : -1;
 	}
 out:
+	cmd->result = ret;
+	ufshcd_add_uic_command_trace(hba, cmd, "uic_complete");
+
 	if (ret) {
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
diff --git a/include/trace/events/ufs.h b/include/trace/events/ufs.h
index 5f300739240d..cf8d568d5a13 100644
--- a/include/trace/events/ufs.h
+++ b/include/trace/events/ufs.h
@@ -249,6 +249,39 @@ TRACE_EVENT(ufshcd_command,
 	)
 );
 
+TRACE_EVENT(ufshcd_uic_command,
+	TP_PROTO(const char *dev_name, const char *str, u32 cmd, int result,
+		 u32 arg1, u32 arg2, u32 arg3),
+
+	TP_ARGS(dev_name, str, cmd, result, arg1, arg2, arg3),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name)
+		__string(str, str)
+		__field(u32, cmd)
+		__field(int, result)
+		__field(u32, arg1)
+		__field(u32, arg2)
+		__field(u32, arg3)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name, dev_name);
+		__assign_str(str, str);
+		__entry->cmd = cmd;
+		__entry->result = result;
+		__entry->arg1 = arg1;
+		__entry->arg2 = arg2;
+		__entry->arg3 = arg3;
+	),
+
+	TP_printk(
+		"%s: %s: cmd: 0x%x, arg1: 0x%x, arg2: 0x%x, arg3: 0x%x, result: %d",
+		__get_str(str), __get_str(dev_name), __entry->cmd,
+		__entry->arg1, __entry->arg2, __entry->arg3, __entry->result
+	)
+);
+
 TRACE_EVENT(ufshcd_upiu,
 	TP_PROTO(const char *dev_name, const char *str, void *hdr, void *tsf),
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
