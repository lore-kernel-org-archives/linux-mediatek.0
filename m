Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74EAECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtXcdd8ScrmiMxXYED78ro39J5fEKT2VrBvKuAZeofY=; b=r+XiV/Hp6nU34p5PnUOTfds3Ik
	pgYIrp4hr0h02tKvolxscwhJP+PXXyFZsBza8WLzsadxelBWw7Qne0ut3Gomb8nZ2uOQF63he54W2
	Jydfm8khVou0+nEQ1N5frby5nZeQpMLEGBMQGAzX3hqQI4S7ft97J6dJYRZgkuA4q9SjsEMZXXaz2
	MQ/Tp4Cj/V1eS5QHhgWY3Z+P4YXq4vqeIiMZYifqv5M6xOnsB/vCYvpb8gmCn6jx3Xmy6XXa4vZRI
	rOJz/WpjLexj3z6AJCyYiOFqNbhVZ5MEW0aLKnnwj664gfuoK0IufOHShfwmrFFecIGz26b9I5wAK
	DxkRvcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU86d-005rc1-0I; Fri, 02 Sep 2022 14:57:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU85Z-005qz5-Iv; Fri, 02 Sep 2022 14:56:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C7E460A36;
	Fri,  2 Sep 2022 14:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB38C433D7;
	Fri,  2 Sep 2022 14:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662130568;
	bh=8HxsyLelsYqwOCxhTJ5jpbUjl0UPkAy78gN1FK3B4KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIfrCsnC9TPzpq/x+bzxefF3RTtWsi1KGr682ovbh1PBJBn9g8++/aZpERT2Hewmq
	 poSK1QtcWyTv+MHbfWWtQZnuTeqVdBDlR4m7Bm6CxoPZ0ZLTstOh/bnB1mYSAUrYFI
	 UGcx0TJUS/P9oScrPgZQT/BrI8uvssK25MpOCLp0=
Date: Fri, 2 Sep 2022 16:56:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, major.chen@samsung.com,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	wsd_upstream@mediatek.com, hongfei.tang@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/debug: fix dentry leak in
 update_sched_domain_debugfs
Message-ID: <YxIZhWB2tCXzlzWj@kroah.com>
References: <20220902031518.1116-1-kuyo.chang@mediatek.com>
 <YxGUBzp9C7kcNgps@kroah.com>
 <5ce45c874d6a05ca69abed3961d413c4a4360e79.camel@mediatek.com>
 <YxGpp/+lWSzwpVLZ@kroah.com>
 <f14e71182ebf1520aeede06afb44af49ec6128a0.camel@mediatek.com>
 <YxHI2sRgF2gqYcHk@kroah.com>
 <YxIX96nUnwz56fte@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxIX96nUnwz56fte@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_075609_705952_F36163D0 
X-CRM114-Status: GOOD (  19.37  )
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

On Fri, Sep 02, 2022 at 03:49:27PM +0100, Al Viro wrote:
> On Fri, Sep 02, 2022 at 11:11:54AM +0200, Greg Kroah-Hartman wrote:
> 
> > +/**
> > + * debugfs_lookup_and_remove - lookup a directory or file and recursively remove it
> > + * @name: a pointer to a string containing the name of the item to look up.
> > + * @parent: a pointer to the parent dentry of the item.
> > + *
> > + * This is the equlivant of doing something like
> > + * debugfs_remove(debugfs_lookup(..)) but with the proper reference counting
> > + * handled for the directory being looked up.
> > + */
> > +void debugfs_lookup_and_remove(const char *name, struct dentry *parent)
> > +{
> > +	struct dentry *dentry;
> > +
> > +	dentry = debugfs_lookup(name, parent);
> > +	if (IS_ERR_OR_NULL(dentry))
> > +		return;
> 
> 	Could somebody explain how could that return ERR_PTR()?

If debugfs is not enabled then debugfs_lookup() will return an
ERR_PTR().  But, doh, this _IS_ debugfs so you are right, that will
never happen.

> Incidentally, IS_ERR_OR_NULL is almost always a sign of bad interface - or
> that of lazy cargo-culting.  Please, don't propagate that garbage... ;-/

Fair enough, I'll fix that up, many thanks for noticing it.

greg k-h

