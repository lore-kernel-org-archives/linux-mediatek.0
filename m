Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EC7C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPIQE8B+aGip676QZPN8Nla/PuXbEbpjmOqR7e1BWpg=; b=J9sR/m790JioWj
	LxCAT4gQvOORecc33LIjzzZ5XCp3HNkYPrsOAVp7ivQUzHkQV27lr93h9W+DO9rawGGKBb2CIAvlN
	NRSxUk/5vVJMBqvu4EQOr+9wVyYpGR3kS6fljmtule//I/Fu9z2veiGMTSCKJGIUth5DmpJCKyHXD
	LraerrgkdJEdPSVr1DtWcWUZWsyDJ2XxLPux3M/ej0a3qkgDExOXHWQgvzJjc5bA2D9bkwG3Ppe2A
	95B2l76zPpuWAorpbFCUvSkW6UPdtH4dZ14P+aaITpS4+UGsOr9cI1K0xKMWPDuciOqSTOIiM8YOB
	RX6eKnIb0kIpvTq9QuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX2px-00E4x3-IY; Wed, 23 Mar 2022 15:23:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX2pO-00E4jW-6Y; Wed, 23 Mar 2022 15:23:15 +0000
X-UUID: 8d0e4e6fbe9b42aca6bca4af67bc5772-20220323
X-UUID: 8d0e4e6fbe9b42aca6bca4af67bc5772-20220323
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 666822239; Wed, 23 Mar 2022 08:23:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 08:23:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 23 Mar 2022 23:23:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Mar 2022 23:23:02 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>, <mingo@redhat.com>
CC: <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <mark-pk.tsai@mediatek.com>, <yj.chiang@mediatek.com>
Subject: [PATCH v3 2/2] tracing: make tracer_init_tracefs initcall asynchronous
Date: Wed, 23 Mar 2022 23:22:57 +0800
Message-ID: <20220323152257.7871-3-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
References: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_082314_291012_FB59BF47 
X-CRM114-Status: GOOD (  15.55  )
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
 kernel/trace/trace.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 85ec758c4455..2974ae056068 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9571,6 +9571,7 @@ extern struct trace_eval_map *__stop_ftrace_eval_maps[];
 
 static struct workqueue_struct *eval_map_wq __initdata;
 static struct work_struct eval_map_work __initdata;
+static struct work_struct tracerfs_init_work __initdata;
 
 static void __init eval_map_work_func(struct work_struct *work)
 {
@@ -9596,6 +9597,8 @@ static int __init trace_eval_init(void)
 	return 0;
 }
 
+subsys_initcall(trace_eval_init);
+
 static int __init trace_eval_sync(void)
 {
 	/* Make sure the eval map updates are finished */
@@ -9678,15 +9681,8 @@ static struct notifier_block trace_module_nb = {
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
 
@@ -9708,8 +9704,6 @@ static __init int tracer_init_tracefs(void)
 	trace_create_file("saved_tgids", TRACE_MODE_READ, NULL,
 			NULL, &tracing_saved_tgids_fops);
 
-	trace_eval_init();
-
 	trace_create_eval_file(NULL);
 
 #ifdef CONFIG_MODULES
@@ -9724,6 +9718,23 @@ static __init int tracer_init_tracefs(void)
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
+	INIT_WORK(&tracerfs_init_work, tracer_init_tracefs_work_func);
+	if (!eval_map_wq)
+		tracer_init_tracefs_work_func(&tracerfs_init_work);
+	else
+		queue_work(eval_map_wq, &tracerfs_init_work);
 
 	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
