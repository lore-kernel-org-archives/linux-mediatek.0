Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4301C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHLxAbJI3Tvc/Nh/p+1D0Hu8y+rB24RASS7y//u7zZE=; b=MC9eD0fAmibMXP
	EhFyHllBOPHZxBCVjABi3Z9zWe6JBpmddofs1styYcymAYVSgeXBYq8dKAc+Ap9Qq7awZWGFxL9Zi
	X9Mj9kKSkNseXQBklODWxWBVIlfe6EDsktLGRPxYH5BoPQiqIVWzn+qau4cSrEcT/+3ipNG25tNZp
	7WQez0LAlbffpUxc+qXwWwI/sEPFQlbdTP1Y0NypiS27eRPgcJteYGMXoScKelUpqvGRF5tspSWPE
	Qo1D61kHwfjj6RoAzvwDJqPef9JrcoO0YHrlu2wsTQLR03AajXDgEnyBAUw1C5EZ134kOmBvpyZXZ
	U2jOrSGTKinB+HNr8SKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhJO-007Vb9-GA; Thu, 19 May 2022 14:39:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgUm-0077DC-Ne; Thu, 19 May 2022 13:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=spFvWqpntAjyDIyQTuuju53IdKRla2N41ylF/wTFrBs=; b=Uwd124YOn/1UWMQ9pfsIjaHRgD
 r1J47bokiQmjgRiNdg22ytRK3cQ04t+q/vkAH7Tl8wtzrgIQWOTX3d2z1SmbF7ijt0VjtAneCXHuu
 K4ujhEmQEsiCj6NfpHCJ4TFAZ35un83XQS32gdqz/bp+YufNtfKJUt5UgVBv2biL73oaFyLzEbCd6
 mYR06XJaIqM7PcsVPKWnQIZ7As06GLkjElqUXM+hRN39wnYyk5BZ2ruKoXVzhMIsejYkNjlvygQxq
 Y+eKUATAOBCM4wyWwNm3IxgONvZP7MG9WkTzPCJ9PqsUZDDQA9sFBuLSAwGmLkzCv0CY85ZK1RUyF
 150H2/KA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgUe-0022LG-Jc; Thu, 19 May 2022 13:47:09 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2411D980E0B; Thu, 19 May 2022 15:47:06 +0200 (CEST)
Date: Thu, 19 May 2022 15:47:06 +0200
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
Subject: Re: [Bug] Race condition between CPU hotplug off flow and
 __sched_setscheduler()
Message-ID: <20220519134706.GH2578@worktop.programming.kicks-ass.net>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
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

On Thu, May 19, 2022 at 08:53:15PM +0800, Jing-Ting Wu wrote:
> Hi all
> 
> 
> There is a race condition between CPU hotplug off flow and
> __sched_setscheduler(), which will cause hang-up in CPU hotplug off
> flow.

How easy can you reproduce; does the below hack make it better?

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 95bac3b094b3..f18ee22b29bc 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4763,20 +4763,30 @@ struct callback_head balance_push_callback = {
 	.func = (void (*)(struct callback_head *))balance_push,
 };
 
-static inline struct callback_head *splice_balance_callbacks(struct rq *rq)
+static inline struct callback_head *
+__splice_balance_callbacks(struct rq *rq, bool foo)
 {
 	struct callback_head *head = rq->balance_callback;
 
 	lockdep_assert_rq_held(rq);
-	if (head)
-		rq->balance_callback = NULL;
+	if (head) {
+		if (foo && head == &balance_push_callback)
+			head = NULL;
+		else
+			rq->balance_callback = NULL;
+	}
 
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
