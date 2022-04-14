Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4804CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apB6i5Tm1OQNiZMcKG91/1tN5v35jUZRY43u5ZooxOk=; b=ts8fHQRlHt2SiN
	+XNNO6RZd2gYSEckRC36H2kU64ka2BP+giuA95HitMNyYU46p4TS+TCKYMTsMLzxfKHISP9ZzDwI1
	ZlsIC/Yuml4BtP/GH05eCYu+NVwWhmufwyClxp/fyoYuo8FkOjIS9qrL6lqL57iyJ4PpU3xApRp6D
	9h6VjEKqFYrqjv+OKrQN4Pc2CN8obnmZgeNA/e4BAxFGO5cz+joclJGwHrfBBU+UISUE/P2Aa7LUz
	vBhkYt4F8OAkeQT7zzbTukq5yJbdHCWwX3wW1Y3675NZKAoT1o8e+C/crTAQgebGLY7xk/yK4lYYT
	SSAoL/LNfAtf+BfnadAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf0iG-0064CW-Tg; Thu, 14 Apr 2022 14:44:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf0i7-00649v-Sl; Thu, 14 Apr 2022 14:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=07JiligZE/4GH4BaZTL7wgTjvBdZxthvgQyY/4H+jtA=; b=U5KNuPPiSY3gWFaMAmgvDiJiAo
 UMct/Awrtq9CTXyRMreCQBa8XsfWjAViM9oQ5WRjsrKK1gSm/S7wwnIvZ2aOIMwlj+6zSmlSd7gP8
 Hi32LDtaXzc/h1ze8wtPbK0QGVw7ayKN1KEAJiqChfc1bH45pavDVa2vjvrQJAX0zbvArVLN+cPJj
 12+E4JK6ufHMGW19AZsmeyen0JppChZKQdDn7+YyacoUsXUZvuUu9g0E/0a0LEcih89GQQcVYP12/
 UeMWDA1T3Sxl8k42r4j3bB7Ig9oChiT83U8Zm2+pGIEyK7+SFuI8OEbjxAQu3ZtSodB6Qu4YxxrZH
 OjhDvt/g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf0i0-0052Va-5V; Thu, 14 Apr 2022 14:44:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 750A730080F;
 Thu, 14 Apr 2022 16:44:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 346482B388774; Thu, 14 Apr 2022 16:44:29 +0200 (CEST)
Date: Thu, 14 Apr 2022 16:44:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 wsd_upstream@mediatek.com, Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] [PATCH v3]sched/pelt: Fix the attach_entity_load_avg
 calculate method
Message-ID: <YlgzTS+laNNvMukT@hirez.programming.kicks-ass.net>
References: <20220414090229.342-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414090229.342-1-kuyo.chang@mediatek.com>
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


I've taken the liberty of carrying over the tags from v2 and reworked
the Changelog a little.

---
Subject: sched/pelt: Fix attach_entity_load_avg() corner case
From: kuyo chang <kuyo.chang@mediatek.com>
Date: Thu, 14 Apr 2022 17:02:20 +0800

From: kuyo chang <kuyo.chang@mediatek.com>

The warning in cfs_rq_is_decayed() triggered:

    SCHED_WARN_ON(cfs_rq->avg.load_avg ||
		  cfs_rq->avg.util_avg ||
		  cfs_rq->avg.runnable_avg)

There exists a corner case in attach_entity_load_avg() which will
cause load_sum to be zero while load_avg will not be.

Consider se_weight is 88761 as per the sched_prio_to_weight[] table.
Further assume the get_pelt_divider() is 47742, this gives:
se->avg.load_avg is 1.

However, calculating load_sum results in 0:

  se->avg.load_sum = div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
  se->avg.load_sum = 1*47742/88761 = 0.

Then enqueue_load_avg() adds this to the cfs_rq totals:

  cfs_rq->avg.load_avg += se->avg.load_avg;
  cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;

Resulting in load_avg being 1 with load_sum is 0, which will trigger
the WARN.

Fixes: f207934fb79d ("sched/fair: Align PELT windows between cfs_rq and its se")
Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
[peterz: massage changelog]
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Link: https://lkml.kernel.org/r/20220414090229.342-1-kuyo.chang@mediatek.com
---
 kernel/sched/fair.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3829,11 +3829,11 @@ static void attach_entity_load_avg(struc
 
 	se->avg.runnable_sum = se->avg.runnable_avg * divider;
 
-	se->avg.load_sum = divider;
-	if (se_weight(se)) {
-		se->avg.load_sum =
-			div_u64(se->avg.load_avg * se->avg.load_sum, se_weight(se));
-	}
+	se->avg.load_sum = se->avg.load_avg * divider;
+	if (se_weight(se) < se->avg.load_sum)
+		se->avg.load_sum = div_u64(se->avg.load_sum, se_weight(se));
+	else
+		se->avg.load_sum = 1;
 
 	enqueue_load_avg(cfs_rq, se);
 	cfs_rq->avg.util_avg += se->avg.util_avg;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
