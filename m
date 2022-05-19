Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B098C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 13:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLwrYClcFEw4d4GPWhf9CzGEbNC2zGJ2rFhFeHHg+wQ=; b=rbTNdQGp6UYuBS
	hOwClJ9QrfzHUiYobyUtcJaFi79dKIMWF4GQHhVwLbnzHIoKNMjNsozSRr3g25xHEbSwyOu0x/iTY
	+/75ggPX9LkPS4QvBnqDt+F0DN7ul0dfEt1kvOHjSP9wVy25vQNnXtEba6H72/XajgA8DCMK/NCBX
	uzc7/l61dG0XEpwivBj+v4vFGgsNXjoBxT5kQg1+CSj907qjZfHWHNjuUAmMpSamzfutA5drMBvtI
	wUHkyj/xnTuebEFVFMtitV3aNfgAzsuhYooO1YptY7AMzDo1LU9ft8rqrxluCbDn7t0iCLRQiq9GD
	o97eZ7IHMGPyphqYA8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrg5k-0070Jg-1I; Thu, 19 May 2022 13:21:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrg3t-006zGJ-KB; Thu, 19 May 2022 13:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l7xioVIlid5Wh7WU7WZik6lZur+fLsYpq5g+mTWR0Pk=; b=b7a17+X2himp3SfbrlHjutD4cj
 ceQv50Quxzo5sFDHtR7tWwnE83YvGYTrixHxz328sN1rnEAvZKhNgxCOAlJbEHAT3ZAhtqjzNN/3k
 SzoBUjE8nyON1GXKlkJQsqh5cky8daxU89PvFipgxtLiZUoNVgQ6IFeYm2ZCjYuDSABhTKytHLj2n
 FlPEw5KRtN+zrftwcAr4u1OQKbe2dxpuzW1qp8iAMrxHO9nvapnp0lNY6d+7qc55rP4MwkbDMbLiK
 xMqPIlpTfzV3ax22Rlp+KvjVyUDSh51FI6vF1QO6EH/xqWpqf8EmN3A8fqcHXyZ0XYTgKRdjju2Dn
 Wj4cF9kw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrg3r-00CkWv-Cc; Thu, 19 May 2022 13:19:27 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id EBE42980E0B; Thu, 19 May 2022 15:19:26 +0200 (CEST)
Date: Thu, 19 May 2022 15:19:26 +0200
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
Message-ID: <20220519131926.GB6479@worktop.programming.kicks-ass.net>
References: <4a0aa13c99ffd6aea6426f83314aa2a91bc8933f.camel@mediatek.com>
 <20220519131452.GG2578@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519131452.GG2578@worktop.programming.kicks-ass.net>
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

On Thu, May 19, 2022 at 03:14:52PM +0200, Peter Zijlstra wrote:
> On Thu, May 19, 2022 at 08:53:15PM +0800, Jing-Ting Wu wrote:
> > Hi all
> > 
> > 
> > There is a race condition between CPU hotplug off flow and
> > __sched_setscheduler(), which will cause hang-up in CPU hotplug off
> > flow.
> 
> Oooh, you're using core scheduling and the A/B are SMT siblings?

Hmm, no.. lemme try again.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
