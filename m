Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01432C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 12:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mktM0RpOiKadClzTfdLzCo6hu39vuoblmMR7RDj9bs=; b=KVtCWlXWnXwg+g
	f+ZFIAkLaZwHL8GF2u8kPQOTU5GC6U2Tf/IjcNXTtVv2hyDCkw/0P/tiaHaPxZ+10OX6YipRcM5DD
	OxiwH62hvr2LoNzK7cK2kcEpDKlE1RW7GmweSyjmMy/AKStv18khsuB6RkXNuijbw6n3cl6IHq/Nz
	xTBrW3iwBsFIYC948XFKIzfhYNEKREcOEAaULtz+o1beVka2a113uzINK2jBhOhtUo9Lzq2Suoy1+
	ZYYRDvfhOJylr7AMFucKtQEBfIxumi244YSHXHatoZc/f5ySY9nbpFdz3YeN67rQGZ4JIrvLt1Sru
	0eq5kZoinYSxPq7A3RYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njKFb-00EFW1-S2; Tue, 26 Apr 2022 12:25:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njKF9-00EFMU-1G; Tue, 26 Apr 2022 12:24:36 +0000
X-UUID: 8febe976238f43859e2cde66d3b6b44b-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ed2d14b3-d766-4b74-a495-d0d5135b7078, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:0582c22e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8febe976238f43859e2cde66d3b6b44b-20220426
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1525744363; Tue, 26 Apr 2022 05:24:27 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 05:24:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Apr 2022 20:24:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Apr 2022 20:24:19 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <mingo@redhat.com>, <yj.chiang@mediatek.com>
Subject: [PATCH v4 2/2] tracing: make tracer_init_tracefs initcall asynchronous
Date: Tue, 26 Apr 2022 20:24:07 +0800
Message-ID: <20220426122407.17042-3-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220426122407.17042-1-mark-pk.tsai@mediatek.com>
References: <20220426122407.17042-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_052435_120438_21D35F0C 
X-CRM114-Status: GOOD (  15.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move trace_eval_init() to subsys_initcall to make it start
earlier.
And to avoid tracer_init_tracefs being blocked by
trace_event_sem which trace_eval_init() hold [1],
queue tracer_init_tracefs() to eval_map_wq to let
the two works being executed sequentially.

It can speed up the initialization of kernel as result
of making tracer_init_tracefs asynchronous.

On my arm64 platform, it reduce ~20ms of 125ms which total
time do_initcalls spend.

[1]: https://lore.kernel.org/r/68d7b3327052757d0cd6359a6c9015a85b437232.camel@pengutronix.de
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 kernel/trace/trace.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 0ec7b013104a..7f6ad8f06129 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9615,6 +9615,7 @@ extern struct trace_eval_map *__stop_ftrace_eval_maps[];
 
 static struct workqueue_struct *eval_map_wq __initdata;
 static struct work_struct eval_map_work __initdata;
+static struct work_struct tracerfs_init_work __initdata;
 
 static void __init eval_map_work_func(struct work_struct *work)
 {
@@ -9640,6 +9641,8 @@ static int __init trace_eval_init(void)
 	return 0;
 }
 
+subsys_initcall(trace_eval_init);
+
 static int __init trace_eval_sync(void)
 {
 	/* Make sure the eval map updates are finished */
@@ -9722,15 +9725,8 @@ static struct notifier_block trace_module_nb = {
 };
 #endif /* CONFIG_MODULES */
 
-static __init int tracer_init_tracefs(void)
+static __init void tracer_init_tracefs_work_func(struct work_struct *work)
 {
-	int ret;
-
-	trace_access_lock_init();
-
-	ret = tracing_init_dentry();
-	if (ret)
-		return 0;
 
 	event_trace_init();
 
@@ -9752,8 +9748,6 @@ static __init int tracer_init_tracefs(void)
 	trace_create_file("saved_tgids", TRACE_MODE_READ, NULL,
 			NULL, &tracing_saved_tgids_fops);
 
-	trace_eval_init();
-
 	trace_create_eval_file(NULL);
 
 #ifdef CONFIG_MODULES
@@ -9768,6 +9762,24 @@ static __init int tracer_init_tracefs(void)
 	create_trace_instances(NULL);
 
 	update_tracer_options(&global_trace);
+}
+
+static __init int tracer_init_tracefs(void)
+{
+	int ret;
+
+	trace_access_lock_init();
+
+	ret = tracing_init_dentry();
+	if (ret)
+		return 0;
+
+	if (eval_map_wq) {
+		INIT_WORK(&tracerfs_init_work, tracer_init_tracefs_work_func);
+		queue_work(eval_map_wq, &tracerfs_init_work);
+	} else {
+		tracer_init_tracefs_work_func(NULL);
+	}
 
 	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
