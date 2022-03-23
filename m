Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18928C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqO4cOZEU1CEiZWGVCGk/Tz594QT+suqIv6kcOnWrV8=; b=mQAAPnTtXJVW/F
	aZ0OuIJqOkRDSe/DjXFf8i/g1Cw5vrVJ+luFPtWcoXC9XE5FiJPiyKAgDINUNxFP7ExEy8z1Q4qG/
	lOWV5aiuezDkYgXxAX2CBt8siPH26MlM3HLYgTArULwj8AYcpWCk+E8Efxdax4nLX5hNVoB/9MSVl
	nEN+C6P0za2ppE9h7VD4f3wydsPfMO71FprbTtWP0xyQrKx1vXw3vrk2iJjXr8NYRMLPzA1UKEXFc
	PjECzSx5ubIbl8kbzDIk5J92lQTNdGqTK9bfNAZfeUPiSxp/i6nTFPED2of+YPQsuN2TJdAZlafVm
	uWVRUhbdhTVpogfA7Vwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX2qM-00E59z-Qf; Wed, 23 Mar 2022 15:24:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX2pQ-00E4k6-B9; Wed, 23 Mar 2022 15:23:19 +0000
X-UUID: 4b233885bba2430d8f1e5ec0c8ee771d-20220323
X-UUID: 4b233885bba2430d8f1e5ec0c8ee771d-20220323
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 47443145; Wed, 23 Mar 2022 08:23:05 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 08:23:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 23:23:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Mar 2022 23:23:01 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>, <mingo@redhat.com>
CC: <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <mark-pk.tsai@mediatek.com>, <yj.chiang@mediatek.com>
Subject: [PATCH v3 1/2] tracing: Avoid adding tracer option before
 update_tracer_options
Date: Wed, 23 Mar 2022 23:22:56 +0800
Message-ID: <20220323152257.7871-2-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
References: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_082316_471998_7BFB0CEB 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To prepare for support asynchronous tracer_init_tracefs initcall,
avoid calling create_trace_option_files before __update_tracer_options.
Otherwise, create_trace_option_files will show warning because
some tracers in trace_types list are already in tr->topts.

For example, hwlat_tracer call register_tracer in late_initcall,
and global_trace.dir is already created in tracing_init_dentry,
hwlat_tracer will be put into tr->topts.
Then if the __update_tracer_options is executed after hwlat_tracer
registered, create_trace_option_files find that hwlat_tracer is
already in tr->topts.

Link: https://lore.kernel.org/lkml/20220322133339.GA32582@xsang-OptiPlex-9020/
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 kernel/trace/trace.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index eb44418574f9..85ec758c4455 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6317,12 +6317,18 @@ static void tracing_set_nop(struct trace_array *tr)
 	tr->current_trace = &nop_trace;
 }
 
+static bool tracer_options_updated;
+
 static void add_tracer_options(struct trace_array *tr, struct tracer *t)
 {
 	/* Only enable if the directory has been created already. */
 	if (!tr->dir)
 		return;
 
+	/* Only create trace option files after update_tracer_options finish */
+	if (!tracer_options_updated)
+		return;
+
 	create_trace_option_files(tr, t);
 }
 
@@ -9133,6 +9139,7 @@ static void update_tracer_options(struct trace_array *tr)
 {
 	mutex_lock(&trace_types_lock);
 	__update_tracer_options(tr);
+	tracer_options_updated = true;
 	mutex_unlock(&trace_types_lock);
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
