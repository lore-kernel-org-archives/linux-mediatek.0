Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5019C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 03:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrXyrHa0ATvfxbxnypiKWwOONkL+w/I27YUkLx+aJjY=; b=2fQIUEFAh/Prcm
	ZztXqqQYlQ8n3JVI8jXm9ZmGbVoaP41eMuo7sK7+dlCE95ksmwG2W+jXnynrUMVDiG83+a3BzkimM
	NvSYe/+ihsyMLe3bBhDmpV9UV/tBWVykAirXBD7MQBvGUCQ8cuN486x+46G/ClhfFeqrOeC8rrAjb
	6TcGvi/J5+UefA7FvUR4e83WrSEt5LMDilo9rNLarP8+szDeTyXyHM6QXOtASG+XoNJwDCDIOEooQ
	67SkL8v9wJh+KoO76LT/vTa18v7RMB+KHm6bpmO09Ob5iSy4POWX+oi5Derphw/eVUZlW4EhmcNTW
	56QhUvXk9z+o9XpqtOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWrcV-00Chth-4Y; Wed, 23 Mar 2022 03:25:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWrcI-00ChpR-K4; Wed, 23 Mar 2022 03:25:00 +0000
X-UUID: 7528de70dad24c2cb76fd9c1ec734a0c-20220322
X-UUID: 7528de70dad24c2cb76fd9c1ec734a0c-20220322
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 450781750; Tue, 22 Mar 2022 20:24:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 20:24:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 11:24:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Mar 2022 11:24:44 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <oliver.sang@intel.com>, <rostedt@goodmis.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lkp@intel.com>, <lkp@lists.01.org>,
 <mark-pk.tsai@mediatek.com>, <matthias.bgg@gmail.com>, <mingo@redhat.com>,
 <yj.chiang@mediatek.com>
Subject: [PATCH] tracing: Avoid adding duplicated tracer options when
 update_tracer_options is running in parallel
Date: Wed, 23 Mar 2022 11:24:42 +0800
Message-ID: <20220323032442.22082-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220322133339.GA32582@xsang-OptiPlex-9020>
References: <20220322133339.GA32582@xsang-OptiPlex-9020>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_202458_673278_DDDB460A 
X-CRM114-Status: GOOD (  12.16  )
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

When update_tracer_options is running in parallel,
tr->tops might be updated before the trace_types list traversal.
Let update_tracer_options traverse the trace_types list safely in
kernel init time and avoid the tr->tops update before it finish.

Link: https://lore.kernel.org/lkml/20220322133339.GA32582@xsang-OptiPlex-9020/
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 kernel/trace/trace.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index adb37e437a05..2974ae056068 100644
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
