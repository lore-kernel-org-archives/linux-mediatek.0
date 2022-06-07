Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D829CC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 21:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ymfWhv6GmtfxQNfKeyjSNaIcKtqbLZ1eJrRkVTIR7Q=; b=SpKGbCNu+3e6Gb
	PFXXRa+LuRxXuztJ2XSyQ9K7U5ekGEhVMTYrsgLKLSqvR+SQ560lZ9m6p4SfNyVSYuRgVGNTvNRLA
	SSr0PVo+xQugtqFdMrtXkHI5DJ04O/CrwanfmiLj/54NPQn7IS3BLrmcqb60JUsnH23os7RiNEBbg
	Fpu48f5KA+HL1S8Gdv6g1I/d1SkuOvUiqD0lXKqOdxzrgG3TRb2SPZz1IejxxlQGChAxxDeINKAs6
	8ouwJEhho6r68KSWWZVR7OQohi9K4hDXV2ZBG/R25FSXJtyxSLCXU7rgDrJJFdiVGv5jpQrDiwcY1
	aQzOZ53z/Yk8WN08aLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nygw1-009nBu-4k; Tue, 07 Jun 2022 21:40:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nygvr-009nAf-IP; Tue, 07 Jun 2022 21:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x1/V+C9sI/TeUp1PDWZRs88Rbfjxw1JeJjRTekUqC/U=; b=ieiS9PtuJaMPPKIbvSaI4HoSk9
	4AitW1/BHdonVgVihs/0NP4se3DZY1B/NTL7pgOU8kte1RdgxaURb5RW6cb2HzQc2eOTI7J8vkOe7
	FE8DT9j4rsbm04PAzsdakyOPBf1WtCI6VjgsRetCjKF4HmE5212LaAXfzv5kYCJqkRryzuxQbrf7A
	r3/tnoQMHbHJOPMQcsL/dZFeaG7oVUoRh+Sy6F0r+zINpFRsdd0P5BljryiRIePgJgPDuhP/Qcg12
	EJ/3kETrqTs9r8oKENnhquAacD7t3Kz9gebGlp3eyg5ScrkRL5tfBa3oszk45ec4ELXPwn52QHQdm
	EFJdU75A==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nygvh-00C134-2G; Tue, 07 Jun 2022 21:40:01 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C8315302E95;
	Tue,  7 Jun 2022 23:39:58 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8CC71202B5DB0; Tue,  7 Jun 2022 23:39:58 +0200 (CEST)
Date: Tue, 7 Jun 2022 23:39:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>, tglx@linutronix.de,
	wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Jonathan.JMChen@mediatek.com,
	"chris.redpath@arm.com" <chris.redpath@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Vincent Donnefort <vdonnefort@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH] sched: Fix balance_push() vs __sched_setscheduler()
Message-ID: <Yp/Frp7BMp9E5dSp@hirez.programming.kicks-ass.net>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
 <20220519134706.GH2578@worktop.programming.kicks-ass.net>
 <52eea711b8ce3151ff73bfb0289cc9da0e8c4a10.camel@mediatek.com>
 <ba7ddde1829ee9eedcd6673f923d731d60719dc5.camel@mediatek.com>
 <78f3347e01a5c46975b9029f93deea2b31bb8393.camel@mediatek.com>
 <Yp+3xFMrypvHcLua@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yp+3xFMrypvHcLua@hirez.programming.kicks-ass.net>
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

On Tue, Jun 07, 2022 at 10:40:36PM +0200, Peter Zijlstra wrote:
> On Fri, Jun 03, 2022 at 12:15:51AM +0800, Jing-Ting Wu wrote:

> > The patch is helpful to the syndrome, passed stability test over 10
> > days so far. (as-is: < 48 hours failed)
> 
> Excellent, let me go write a Changelog for it, or something.

How's this then?

---
Subject: sched: Fix balance_push() vs __sched_setscheduler()
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue Jun 7 22:41:55 CEST 2022

The purpose of balance_push() is to act as a filter on task selection
in the case of CPU hotplug, specifically when taking the CPU out.

It does this by (ab)using the balance callback infrastructure, with
the express purpose of keeping all the unlikely/odd cases in a single
place.

In order to serve it's purpose, the balance_push_callback needs to be
(exclusively) on the callback list at all times (noting that the
callback always places itself back on the list the moment it runs,
also noting that when the CPU goes down, regular balancing concerns
are moot, so ignoring them is fine).

And here-in lies the problem, __sched_setscheduler()'s use of
splice_balance_callbacks() takes the callbacks off the list across a
lock-break, making it possible for, an interleaving, __schedule() to
see an empty list and not get filtered.

Reported-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Link: https://lkml.kernel.org/r/20220519134706.GH2578@worktop.programming.kicks-ass.net
---
 kernel/sched/core.c |   36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4798,25 +4798,55 @@ static void do_balance_callbacks(struct
 
 static void balance_push(struct rq *rq);
 
+/*
+ * balance_push_callback is a right abuse of the callback interface and plays
+ * by significantly different rules.
+ *
+ * Where the normal balance_callback's purpose is to be ran in the same context
+ * that queued it (only later, when it's safe to drop rq->lock again),
+ * balance_push_callback is specifically targeted at __schedule().
+ *
+ * This abuse is tolerated because it places all the unlikely/odd cases behind
+ * a single test, namely: rq->balance_callback == NULL.
+ */
 struct callback_head balance_push_callback = {
 	.next = NULL,
 	.func = (void (*)(struct callback_head *))balance_push,
 };
 
-static inline struct callback_head *splice_balance_callbacks(struct rq *rq)
+static inline struct callback_head *
+__splice_balance_callbacks(struct rq *rq, bool split)
 {
 	struct callback_head *head = rq->balance_callback;
 
+	if (likely(!head))
+		return NULL;
+
 	lockdep_assert_rq_held(rq);
-	if (head)
+	/*
+	 * Must not take balance_push_callback off the list when
+	 * splace_balance_callbac() and balance_callbacks() are not
+	 * in the same rq->lock section.
+	 *
+	 * In that case it would be possible for __schedule() to interleave
+	 * and observe the list empty.
+	 */
+	if (split && head == &balance_push_callback)
+		head = NULL;
+	else
 		rq->balance_callback = NULL;
 
 	return head;
 }
 
+static inline struct callback_head *splice_balance_callbacks(struct rq *rq)
+{
+	return __splice_balance_callbacks(rq, true);
+}
+
 static void __balance_callbacks(struct rq *rq)
 {
-	do_balance_callbacks(rq, splice_balance_callbacks(rq));
+	do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
 }
 
 static inline void balance_callbacks(struct rq *rq, struct callback_head *head)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
