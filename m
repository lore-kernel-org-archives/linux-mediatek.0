Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 09:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Cux1TteOFkzrDhf+AskQ4pGE9IDn2pAna8F2T+mkJo=; b=fycjqa9bA8+Fju
	TFopHmCNP5ATdwY8YLDWjyi0p5IUoGKFuEWYiTCLr6zfCIALLEh25ejw5WlDATaczxtx/lGfEELr9
	bPkIjtT8IpZjj6vnlY6JsDnOyInFzb9OY6CDOrfR+Vz9u3ZgQekyxkQtABL4U14G03l9GvGFd6C3S
	yAZklb6IpAUAc+P38jxlOP4RIxI11+7VInZk1ofFzqhiS3VeFKa/O6WpsMOmDtkK7s/q+rrmzGFSz
	n3b4x9V6DuaTIhKblw1sgLfEAKV83Xx8p7K3k32WB42gyrfjeBWOFMq5fPsQnYJKm+ZDr2EDEFZjn
	C8EvEphP25uJuBCncAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevoz-004u4O-JA; Thu, 14 Apr 2022 09:31:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevow-004u3H-Le; Thu, 14 Apr 2022 09:31:23 +0000
X-UUID: 3bf17ada3a454afc9594f2875a5bfcee-20220414
X-UUID: 3bf17ada3a454afc9594f2875a5bfcee-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuyo.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 59873806; Thu, 14 Apr 2022 02:31:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 02:29:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 14 Apr 2022 17:29:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 17:29:28 +0800
Message-ID: <f2579de9b0555568eff94ff83f8695af7b218349.camel@mediatek.com>
Subject: Re: [PATCH 1/1] [PATCH v2]sched/pelt: Refine the enqueue_load_avg
 calculate method
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 "Steven Rostedt" <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 14 Apr 2022 17:29:28 +0800
In-Reply-To: <f7913fea-d110-9140-6dfa-72561c3fbefd@arm.com>
References: <20220414015940.9537-1-kuyo.chang@mediatek.com>
 <f7913fea-d110-9140-6dfa-72561c3fbefd@arm.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_023122_757764_B8A54714 
X-CRM114-Status: GOOD (  18.14  )
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

On Thu, 2022-04-14 at 11:02 +0200, Dietmar Eggemann wrote:
> On 14/04/2022 03:59, Kuyo Chang wrote:
> > From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [...]
> 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index d4bd299d67ab..159274482c4e 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -3829,10 +3829,12 @@ static void attach_entity_load_avg(struct
> > cfs_rq *cfs_rq, struct sched_entity *s
> >  
> >  	se->avg.runnable_sum = se->avg.runnable_avg * divider;
> >  
> > -	se->avg.load_sum = divider;
> > -	if (se_weight(se)) {
> > +	se->avg.load_sum = se->avg.load_avg * divider;
> > +	if (se_weight(se) < se->avg.load_sum) {
> >  		se->avg.load_sum =
> > -			div_u64(se->avg.load_avg * se->avg.load_sum,
> > se_weight(se));
> > +			div_u64(se->avg.load_sum, se_weight(se));
> 
> Seems that this will fit on one line now. No braces needed then.

Thanks for your friendly reminder.

> 
> > +	} else {
> > +		se->avg.load_sum = 1;
> >  	}
> >  
> >  	enqueue_load_avg(cfs_rq, se);
> 
> Looks like taskgroups are not affected since they get always online
> with cpu.shares/weight = 1024 (cgroup v1):
> 
> cpu_cgroup_css_online() -> online_fair_sched_group() ->
> attach_entity_cfs_rq() -> attach_entity_load_avg()
> 
> And reweight_entity() does not have this issue.
> 
> Tested with `qemu-system-x86_64 ... cores=64 ... -enable-kvm` and
> weight=88761 for nice=0 tasks plus forcing se->avg.load_avg = 1
> before
> the div_u64() in attach_entity_load_avg().
> 
> Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
