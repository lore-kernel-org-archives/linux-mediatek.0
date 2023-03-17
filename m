Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453BAC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 05:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B0oWSAqYH3d4rxQTXEiSY0Y15GtFNYgYD2YcLGwJd3A=; b=LNHGxklJhuOA1azDeIryenLzrk
	W1UXXoskedgV6nMMtPy0a9ralPZjcBHAnn7xB3jVsibo9osUHheMf1/x/fruKu88sQThJLw+3zuYe
	bgFI7598ynWCG58IKSNCD5xDsmlBapKnr14hF9Pc914FnzcJN0MP5yip23WZLqL9UXejsUR7Uk7M6
	jwvjB3F9bsoK2ZkohpJdTzdfm9e/4A5cqDFziS8j0G2gHDZIV4RFYe16CfwIF3CsYBAXrl/8iWxi7
	zmxrodKH42Etpe6IqONsCI0AJeDbsx84FGxf72rBMzH0suEfRrPJZ80vaqQoINaKql25354iLqRXy
	YSn/4AkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd2gY-0014wC-1p;
	Fri, 17 Mar 2023 05:31:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd2gV-0014vR-31;
	Fri, 17 Mar 2023 05:31:25 +0000
X-UUID: f0a04442c48411edb5598346aad47b14-20230316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=B0oWSAqYH3d4rxQTXEiSY0Y15GtFNYgYD2YcLGwJd3A=;
	b=GuP51zBdOowuCYrz23UP0QbVtjheq+3uxCfc+GvMA7tA+fwHwfFNmsmFLxJe9uSmeSoVDl9uVhfodJmIG4GO1SoH7cnG/uE3exX19rwr/JbdYmGpvO+dxYCo5TU50JX+qu1+TK6UpKutcw68u/t9PzKpUbjn6mtP/U/MD+XGwg8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:e0288ae7-f261-4231-b0fb-7d013f158c31,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:83295aa,CLOUDID:c62815f6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: f0a04442c48411edb5598346aad47b14-20230316
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <cheng-jui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2038913308; Thu, 16 Mar 2023 22:31:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 13:31:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 13:31:14 +0800
From: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
	<mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Tom
 Zanussi" <zanussi@kernel.org>
CC: <Bobule.chang@mediatek.com>, <wsd_upstream@mediatek.com>, Tze-nan Wu
	<Tze-nan.Wu@mediatek.com>, <stable@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] tracing: Fix use-after-free and double-free on last_cmd
Date: Fri, 17 Mar 2023 13:30:44 +0800
Message-ID: <20230317053044.13828-1-cheng-jui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_223123_981383_8DA7705E 
X-CRM114-Status: GOOD (  14.65  )
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

From: "Tze-nan Wu" <Tze-nan.Wu@mediatek.com>

Currently, the last_cmd variable can be accessed by multiple processes
asynchronously when multiple users manipulate synthetic_events node
at the same time, it could lead to use-after-free or double-free.

This patch add lastcmd_mutex to prevent last_cmd from being accessed
asynchronously.

================================================================

It's easy to reproduce in the KASAN environment by running the two
scripts below in different shells.

script 1:
        while :
        do
                echo -n -e '\x88' > /sys/kernel/tracing/synthetic_events
        done

script 2:
        while :
        do
                echo -n -e '\xb0' > /sys/kernel/tracing/synthetic_events
        done

================================================================
double-free scenario:

    process A                       process B
-------------------               ---------------
1.kstrdup last_cmd
                                  2.free last_cmd
3.free last_cmd(double-free)

================================================================
use-after-free scenario:

    process A                       process B
-------------------               ---------------
1.kstrdup last_cmd
                                  2.free last_cmd
3.tracing_log_err(use-after-free)

================================================================

Appendix 1. KASAN report double-free:

BUG: KASAN: double-free in kfree+0xdc/0x1d4
Free of addr ***** by task sh/4879
Call trace:
        ...
        kfree+0xdc/0x1d4
        create_or_delete_synth_event+0x60/0x1e8
        trace_parse_run_command+0x2bc/0x4b8
        synth_events_write+0x20/0x30
        vfs_write+0x200/0x830
        ...

Allocated by task 4879:
        ...
        kstrdup+0x5c/0x98
        create_or_delete_synth_event+0x6c/0x1e8
        trace_parse_run_command+0x2bc/0x4b8
        synth_events_write+0x20/0x30
        vfs_write+0x200/0x830
        ...

Freed by task 5464:
        ...
        kfree+0xdc/0x1d4
        create_or_delete_synth_event+0x60/0x1e8
        trace_parse_run_command+0x2bc/0x4b8
        synth_events_write+0x20/0x30
        vfs_write+0x200/0x830
        ...

================================================================
Appendix 2. KASAN report use-after-free:

BUG: KASAN: use-after-free in strlen+0x5c/0x7c
Read of size 1 at addr ***** by task sh/5483
sh: CPU: 7 PID: 5483 Comm: sh
        ...
        __asan_report_load1_noabort+0x34/0x44
        strlen+0x5c/0x7c
        tracing_log_err+0x60/0x444
        create_or_delete_synth_event+0xc4/0x204
        trace_parse_run_command+0x2bc/0x4b8
        synth_events_write+0x20/0x30
        vfs_write+0x200/0x830
        ...

Allocated by task 5483:
        ...
        kstrdup+0x5c/0x98
        create_or_delete_synth_event+0x80/0x204
        trace_parse_run_command+0x2bc/0x4b8
        synth_events_write+0x20/0x30
        vfs_write+0x200/0x830
        ...

Freed by task 5480:
        ...
        kfree+0xdc/0x1d4
        create_or_delete_synth_event+0x74/0x204
        trace_parse_run_command+0x2bc/0x4b8
        synth_events_write+0x20/0x30
        vfs_write+0x200/0x830
        ...

Fixes: 27c888da9867 ("tracing: Remove size restriction on synthetic event cmd error logging")
Cc: stable@vger.kernel.org
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---
 kernel/trace/trace_events_synth.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_events_synth.c b/kernel/trace/trace_events_synth.c
index 46d0abb32d0f..ce438eccab2e 100644
--- a/kernel/trace/trace_events_synth.c
+++ b/kernel/trace/trace_events_synth.c
@@ -42,16 +42,25 @@ enum { ERRORS };
 #undef C
 #define C(a, b)		b
 
+static DEFINE_MUTEX(lastcmd_mutex);
+
 static const char *err_text[] = { ERRORS };
 
 static char *last_cmd;
 
 static int errpos(const char *str)
 {
-	if (!str || !last_cmd)
-		return 0;
+	int ret = 0;
+
+	mutex_lock(&lastcmd_mutex);
+	if (!str || !last_cmd) {
+		mutex_unlock(&lastcmd_mutex);
+		return ret;
+	}
 
-	return err_pos(last_cmd, str);
+	ret = err_pos(last_cmd, str);
+	mutex_unlock(&lastcmd_mutex);
+	return ret;
 }
 
 static void last_cmd_set(const char *str)
@@ -59,18 +68,24 @@ static void last_cmd_set(const char *str)
 	if (!str)
 		return;
 
+	mutex_lock(&lastcmd_mutex);
 	kfree(last_cmd);
 
 	last_cmd = kstrdup(str, GFP_KERNEL);
+	mutex_unlock(&lastcmd_mutex);
 }
 
 static void synth_err(u8 err_type, u16 err_pos)
 {
-	if (!last_cmd)
+	mutex_lock(&lastcmd_mutex);
+	if (!last_cmd) {
+		mutex_unlock(&lastcmd_mutex);
 		return;
+	}
 
 	tracing_log_err(NULL, "synthetic_events", last_cmd, err_text,
 			err_type, err_pos);
+	mutex_unlock(&lastcmd_mutex);
 }
 
 static int create_synth_event(const char *raw_command);
-- 
2.18.0


