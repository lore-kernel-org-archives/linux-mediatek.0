Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44199C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 07:31:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1516A206E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 07:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qci3f8BL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Mh7jYGd8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1516A206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6/hv+46OsKinmOm7CG9tsLnW4hUCwK9+gNHn3fUrao=; b=Qci3f8BL1tq1BI
	aB0Q2FgG4GgD4D2LykxC2BDhbJ1/87alNOVuWkcIewBvaUgdqqQvVaD8hHVjL8/ZNZiguND9ZcukJ
	QE380S3keQ3uAaGNXMgkpbVsJEs3SWmWuo/wdzN2VA8lfQ+TQlOvNlzVmNyYY1bIIT7jHRcEeNWlr
	egWGSFw6ZcLKm4rPDk/u4s/PRd5ScqsWo/P6GbptEKFy76GO2JKHfpozQkKCovLpAfFb4P13iaLoA
	YikxUYP15a3E87nciuxjhif5Kub3MAjQi+/HRETAaxyFIiE03g6Tyn6lghcRFg0W7TChl11NBqd6I
	FxMLZuSQfSBJK+kg8xvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkjau-0002xU-Bz; Mon, 15 Jun 2020 07:31:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkjae-0002oc-HQ; Mon, 15 Jun 2020 07:31:36 +0000
X-UUID: 2533bebe5058479c885fc8125dc53319-20200614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1p/mBZcy6sHsnC7cHVAVgHT2d4KvBg+27AI/6Uhvh9c=; 
 b=Mh7jYGd8dRFc7G+VM8E7+VRttKfXrKHKnoE9gHhDR2wjKbJ3dNxE2xvJMdYoAmtuWvf1iXr5XunULifKwzGd6ocFwGWehfqBsqy70aAaUtS0zFwCZ9BrA8IV4olCw4FzawMqcjzCx2lxzLDQMhTYdqlDa+PZvbCku37Z+Pkcj7E=;
X-UUID: 2533bebe5058479c885fc8125dc53319-20200614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 758295400; Sun, 14 Jun 2020 23:31:24 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 00:22:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 15:22:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Jun 2020 15:22:36 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v3 2/2] scsi: ufs: Add trace event for UIC commands
Date: Mon, 15 Jun 2020 15:22:35 +0800
Message-ID: <20200615072235.23042-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200615072235.23042-1-stanley.chu@mediatek.com>
References: <20200615072235.23042-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E480AC581F2CCFBAB70C1410BBF35B768838CBDFF7362722302DE912D2F9049B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_003135_481862_459124F3 
X-CRM114-Status: UNSURE (   7.45  )
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

Usage:
	echo 1 > /sys/kernel/debug/tracing/events/ufs/enable
	cat /sys/kernel/debug/tracing/trace_pipe

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Acked-by: Avri Altman <avri.altman@wdc.com>
---
 drivers/scsi/ufs/ufshcd.c  | 26 ++++++++++++++++++++++++++
 include/trace/events/ufs.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index ad4fc829cbb2..1e1316ba7082 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -340,6 +340,26 @@ static void ufshcd_add_tm_upiu_trace(struct ufs_hba *hba, unsigned int tag,
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
+	if (!strcmp(str, "send"))
+		cmd = ucmd->command;
+	else
+		cmd = ufshcd_readl(hba, REG_UIC_COMMAND);
+
+	trace_ufshcd_uic_command(dev_name(hba->dev), str, cmd,
+				 ufshcd_readl(hba, REG_UIC_COMMAND_ARG_1),
+				 ufshcd_readl(hba, REG_UIC_COMMAND_ARG_2),
+				 ufshcd_readl(hba, REG_UIC_COMMAND_ARG_3));
+}
+
 static void ufshcd_add_command_trace(struct ufs_hba *hba,
 		unsigned int tag, const char *str)
 {
@@ -2052,6 +2072,8 @@ ufshcd_dispatch_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd)
 	ufshcd_writel(hba, uic_cmd->argument2, REG_UIC_COMMAND_ARG_2);
 	ufshcd_writel(hba, uic_cmd->argument3, REG_UIC_COMMAND_ARG_3);
 
+	ufshcd_add_uic_command_trace(hba, uic_cmd, "send");
+
 	/* Write UIC Cmd */
 	ufshcd_writel(hba, uic_cmd->command & COMMAND_OPCODE_MASK,
 		      REG_UIC_COMMAND);
@@ -4833,6 +4855,10 @@ static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
 		complete(hba->uic_async_done);
 		retval = IRQ_HANDLED;
 	}
+
+	if (retval == IRQ_HANDLED)
+		ufshcd_add_uic_command_trace(hba, hba->active_uic_cmd,
+					     "complete");
 	return retval;
 }
 
diff --git a/include/trace/events/ufs.h b/include/trace/events/ufs.h
index 5f300739240d..84841b3a7ffd 100644
--- a/include/trace/events/ufs.h
+++ b/include/trace/events/ufs.h
@@ -249,6 +249,37 @@ TRACE_EVENT(ufshcd_command,
 	)
 );
 
+TRACE_EVENT(ufshcd_uic_command,
+	TP_PROTO(const char *dev_name, const char *str, u32 cmd,
+		 u32 arg1, u32 arg2, u32 arg3),
+
+	TP_ARGS(dev_name, str, cmd, arg1, arg2, arg3),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name)
+		__string(str, str)
+		__field(u32, cmd)
+		__field(u32, arg1)
+		__field(u32, arg2)
+		__field(u32, arg3)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name, dev_name);
+		__assign_str(str, str);
+		__entry->cmd = cmd;
+		__entry->arg1 = arg1;
+		__entry->arg2 = arg2;
+		__entry->arg3 = arg3;
+	),
+
+	TP_printk(
+		"%s: %s: cmd: 0x%x, arg1: 0x%x, arg2: 0x%x, arg3: 0x%x",
+		__get_str(str), __get_str(dev_name), __entry->cmd,
+		__entry->arg1, __entry->arg2, __entry->arg3
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
