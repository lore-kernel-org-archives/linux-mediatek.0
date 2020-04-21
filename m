Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14580C38A30
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 01:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE972084D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 01:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmdi0prV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="m1L+849n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBE972084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8R3S5H+8LfTQuaNtDVmfO3qh2Tsxb5IwPbxpMlvHWKE=; b=fmdi0prVORlpOp
	HZfqc/TR0iXQvBG3K/mmALXRlPH2jWx9uClWkfWL4Webt4jlqoS3t5mWbKTt4/m4MPL9Da6A7UZJm
	heG8uirba1kvTiR42LTCjTKMyrH++ydJjAB3IdWmmdcfyY6/2DrykixRDDXp/YUSQMTXWKPXJbo5V
	EXjr3SHZlByDRpYac3uxV+HaXXgOc7aCgLwk6B5ZcM67NFDQyzGmJFV2fi2P0dM4TFirWERNOvkjk
	OWWb/osAiapBbi9VFvwCwh/d2MPhNtPZq7Xnj2phV3sKJLUo0QQTuPO8FT5aHTJAAt2nD/5khYYHF
	x0RrGO72EonzpFLskmrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQhou-0006Gh-Js; Tue, 21 Apr 2020 01:35:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQhop-0006E0-RO; Tue, 21 Apr 2020 01:35:27 +0000
X-UUID: 466973d370a8428494279345db8f6969-20200420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tKjf4UjhrVLsulgdGZ92MxlbkkoP6I0QBgm4UjGVFkU=; 
 b=m1L+849nnQ76c+RmZa0AMCrsIgLqfgy/gN3/bT0Cxwm6IMAICCXMO8DY6TeRuTWJS4688dIrbxelxrqJPGBjgRjkEi7jE7mSWb2ZussX+T55C16X8OqyqI1Vcvk2lgBuM0Wdw3Sz1UUbLuUsE92sJmBhbqOKPTLMwVElkub1VKQ=;
X-UUID: 466973d370a8428494279345db8f6969-20200420
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1598436887; Mon, 20 Apr 2020 17:35:19 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Apr 2020 18:35:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Apr 2020 09:35:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Apr 2020 09:35:12 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Bart Van Assche
 <bvanassche@acm.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2] stacktrace: cleanup inconsistent variable type
Date: Tue, 21 Apr 2020 09:35:11 +0800
Message-ID: <20200421013511.5960-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_183523_896063_0483359F 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Modify the variable type of 'skip' member of struct stack_trace.
In theory, the 'skip' variable type should be unsigned int.
There are two reasons:
- The 'skip' only has two situation, 1)Positive value, 2)Zero
- The 'skip' of struct stack_trace has inconsistent type with struct
  stack_trace_data, it makes a bit confusion in the relationship between
  struct stack_trace and stack_trace_data.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
changes in v2:
modify the commit log to describe the matter more clearly.

---
 include/linux/stacktrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/stacktrace.h b/include/linux/stacktrace.h
index 83bd8cb475d7..b7af8cc13eda 100644
--- a/include/linux/stacktrace.h
+++ b/include/linux/stacktrace.h
@@ -64,7 +64,7 @@ void arch_stack_walk_user(stack_trace_consume_fn consume_entry, void *cookie,
 struct stack_trace {
 	unsigned int nr_entries, max_entries;
 	unsigned long *entries;
-	int skip;	/* input argument: How many entries to skip */
+	unsigned int skip;	/* input argument: How many entries to skip */
 };
 
 extern void save_stack_trace(struct stack_trace *trace);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
