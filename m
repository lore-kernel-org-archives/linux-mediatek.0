Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55F6E732E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hV9RHE2np4Q/chcyiz0z8ahVkd4d/jzh2cotT+E4Ik=; b=XJR8nBZ3UaxaL3iyXPSxMWSDDL
	S7fKanb07MLy0kvutrR/LLtIEODP7VgkSl4TR9sJJhF/M3xjpPSX/h+mzXdC2bWqbA0spxazfsEH/
	BkPEIH5Uigi0NO8haT4qfll/JQg5uqx488pU/LAfNZ3LRsegXn9fZZJ73fiQ3PPOhS6dF0RxA5JNm
	h4jMod89QX1RXgmxhI4Qku2hP+T71NehyBoGlMm2Vm3GUcI7qpTmt8lPSiGA6U6jFvMMW/WLZo8Ve
	5yV4kovNDM56iwmT5yu5+q4Z5yZJ2aO7qdIhsm3y8jmqz5yggd3HHL9gRSDBMtnHG77JQcSJyy6eX
	ZNTaVTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsnX-005Mzj-0f;
	Thu, 28 Sep 2023 15:19:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsnT-005MvH-24;
	Thu, 28 Sep 2023 15:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5hV9RHE2np4Q/chcyiz0z8ahVkd4d/jzh2cotT+E4Ik=; b=JBXepoFRBRKckRrMLqnelG5jyB
	iR1XVar5xlG5UqiTkMBAHBGTe1+MCdNP/ZUjQ3wKGsh2FBBtSC7lIxwPbMYljCoyfv0/MQQbmCSxc
	ZZzCk/Tfoc4NAtENKmajrceMBCdgwPzCWFlSQkwH0ts1yUJurcJSeDeO1wm2C5LfmF3DCihEDSybn
	gO8vuygiALgyNQgRvTWuCOhMxqM0poVeiq2NFCiM7kA+ptZt2JZ+EfPn4YJ8sxZoR59/0IP67wlKd
	GbTv7VDYcnz2nLOF1tv+dVuKlefK0NMbDLxskWOoaCUaYeY/5suC5YaxT5MTGKU+J7CWBZ5BpEooQ
	10bPzCRQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsnM-0057CY-0X;
	Thu, 28 Sep 2023 15:19:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 46C453002E3; Thu, 28 Sep 2023 17:19:17 +0200 (CEST)
Date: Thu, 28 Sep 2023 17:19:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang =?utf-8?B?KOW8teW7uuaWhyk=?= <Kuyo.Chang@mediatek.com>
Cc: "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"vschneid@redhat.com" <vschneid@redhat.com>,
	"bristot@redhat.com" <bristot@redhat.com>,
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/1] sched/core: Fix stuck on completion for
 affine_move_task() when stopper disable
Message-ID: <20230928151917.GB29651@noisy.programming.kicks-ass.net>
References: <20230927033431.12406-1-kuyo.chang@mediatek.com>
 <20230927080850.GB21824@noisy.programming.kicks-ass.net>
 <b9def8f3d9426bc158b302f4474b6e643b46d206.camel@mediatek.com>
 <20230928151616.GD27245@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928151616.GD27245@noisy.programming.kicks-ass.net>
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 28, 2023 at 05:16:16PM +0200, Peter Zijlstra wrote:

> AFAICT this is migrate_enable(), which acts on current, so how can the
> CPU that current runs on go away?

> Your patch has at least one very obvious resource leak.

Sorry those are not so, I ended up staring at the wrong
stop_one_cpu_nowait() :-/

Still, the rest is very much the case, if you can't describe the exact
race scenario, you can't be talking about a solution.

