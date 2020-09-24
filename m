Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED6FC4346E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 04:13:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C64422223E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 04:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDFE4jCI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZI1N7lUE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C64422223E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mT8cnSTKtzW+VyvvaTcEqDjBgm2xCXgVAClWlE8t/aE=; b=YDFE4jCIQsMU1yem8/I4R3o+R/
	wRklhk4MKd0zntKfNRojEZm+gEryfi+/GZrgE1EBcixf6RYLnplo0TlCioUABS1zNSCDU/aP3szSM
	4jbyMliGTPXP6IxkTrIxPn8uQBQReMUZRD/0vQ9/C/uFRcJ4yhOtGlYPRf1vHmI5DxwsLZaR7cdEd
	ydCZjKMtApaMlj5vnSF1SsHFDA8AHzzQB4JqnojCyKIO/H3RUwHFPP+85QVGPn1qsI5WxNy3gtpw+
	cZTIQC6zaKgZ5sPjyRZ3qBELsoyQ62zMu2pg0jPn/5/RYaUZq4eoAZ3r09m6cud4t5sCBTfY0q/3Q
	rHdBDO4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLIcu-00074C-NA; Thu, 24 Sep 2020 04:13:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLIcc-0006xJ-Ga; Thu, 24 Sep 2020 04:12:44 +0000
X-UUID: 1e888abd97c942268420dbc381779e5e-20200923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yih98KEkzJLkFoWBf8Qw3xVcaUYkPNvBrd8fXNNVY9A=; 
 b=ZI1N7lUETWVAnO3koNWr2ANN3sRKljk8Tz4PdVtIbZ8l3ZZhZHzgMEJIrtHi+0IdfpV4f1nnGOevgmpR7jrzbcorrWhO+FsMlk9PsnPIj5A8fEKN0LG8loK+4V9ROLT+FzLo2wIDk0E5yEra83lcSL+aTN0meNziL4WVGb+alAA=;
X-UUID: 1e888abd97c942268420dbc381779e5e-20200923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 909286001; Wed, 23 Sep 2020 20:12:37 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Sep 2020 21:04:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 12:04:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Sep 2020 12:04:22 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, Marco Elver <elver@google.com>,
 "Andrey
 Ryabinin" <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 2/6] workqueue: kasan: record workqueue stack
Date: Thu, 24 Sep 2020 12:04:22 +0800
Message-ID: <20200924040422.30995-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_001242_742024_E18F4BF9 
X-CRM114-Status: GOOD (  13.84  )
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
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Records the last two enqueuing work call stacks in order to print them
in KASAN report. It is useful for programmers to solve use-after-free
or double-free memory workqueue issue.

For workqueue it has turned out to be useful to record the enqueuing
work call stacks. Because user can see KASAN report to determine
whether it is root cause. They don't need to enable debugobjects,
but they have a chance to find out the root cause.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Marco Elver <elver@google.com>
Acked-by: Marco Elver <elver@google.com>
Acked-by: Tejun Heo <tj@kernel.org>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
---

v2:
- Thanks for Marco suggestion.
- Remove unnecessary code
- reuse kasan_record_aux_stack() and aux_stack
  to record timer and workqueue stack

---

 kernel/workqueue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index c41c3c17b86a..5fea7dc9180f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1324,6 +1324,9 @@ static void insert_work(struct pool_workqueue *pwq, struct work_struct *work,
 {
 	struct worker_pool *pool = pwq->pool;
 
+	/* record the work call stack in order to print it in KASAN reports */
+	kasan_record_aux_stack(work);
+
 	/* we own @work, set data and link */
 	set_work_pwq(work, pwq, extra_flags);
 	list_add_tail(&work->entry, head);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
