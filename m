Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RmIBDmA7HuVmZSyUWJ93x5lRlH/NRx1RsQwV9uMu1M=; b=UFIUXy+ZCY0BNxWf0DTgnix45o
	56KEwtP2f+71LZGa5fYANrZLCDRW9qqgFChV53ZR5/MOovpj6CnbXpSmGFdKbb6JQOkUeHXS62T1B
	tpPEN7FMbK/MpvwPUQ2pX9uDYnRYXyAPgDdmUXnb2VneJECuMy22Kg8g3NVmJtj46q+SwIPovvIHg
	4DsTUYo//jv/CPjkptwfaEnxWhc21fBHAfeDxBYNmg1NCyNo1jHEDCVpbZgyxUMhrGvb46dB7Xc3v
	Tw5+Cn6AVXE/xWozpUVihcaL6pw25k0t87Ok2MRfst2R8+0DzoMzaGvc/BJHp0hIeFlBdd7FEQMQS
	+83z1Sfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJzA-006nft-BM; Fri, 15 Jul 2022 11:59:56 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJyy-006nZm-R1; Fri, 15 Jul 2022 11:59:46 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BDACF1FD85;
	Fri, 15 Jul 2022 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657886379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4RmIBDmA7HuVmZSyUWJ93x5lRlH/NRx1RsQwV9uMu1M=;
	b=AqIscoSlqIjk/nPYNDWwjjd9fWwuEi5DU9TQYGiCa2z4jdMdkfWhltCvjGsN96UZJW0NAs
	6L+wRg97LtJ2t5o+ij77C/gmHsm/RNCv6KvgTwiT1a08v/liV6xg053aQ9bRMAY8GzRHK8
	vQqWrDGD6pEi5J/g/siParyxrugja7U=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 792A913754;
	Fri, 15 Jul 2022 11:59:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id lTDPHKtW0WKsAgAAMHmgww
	(envelope-from <mkoutny@suse.com>); Fri, 15 Jul 2022 11:59:39 +0000
Date: Fri, 15 Jul 2022 13:59:38 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Shakeel Butt <shakeelb@google.com>, wsd_upstream@mediatek.com,
	lixiong.liu@mediatek.com, wenju.xu@mediatek.com,
	jonathan.jmchen@mediatek.com
Subject: Re: [Bug] race condition at rebind_subsystems()
Message-ID: <20220715115938.GA8646@blackbody.suse.cz>
References: <1978e209e71905d89651e61abd07285912d412a1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1978e209e71905d89651e61abd07285912d412a1.camel@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_045945_062375_0E68DCB9 
X-CRM114-Status: GOOD (  19.03  )
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

Hello Jing-Ting.

On Thu, Jun 30, 2022 at 06:52:10PM +0800, Jing-Ting Wu <jing-ting.wu@mediatek.com> wrote:
> Root cause:
> The rebind_subsystems() is no lock held when move css object from A
> list to B list,then let B's head be treated as css node at
> list_for_each_entry_rcu().

Nice outcome of the analysis.

> The call stack as following:
> kthread
> -> worker_thread
> -> process_one_work
> -> flush_memcg_stats_dwork
> -> __mem_cgroup_flush_stats
> -> cgroup_rstat_flush_irqsafe
> -> cgroup_rstat_flush_locked
> 
> Detail:
> static void cgroup_rstat_flush_locked(struct cgroup *cgrp, bool
> may_sleep)
> {
> ...
>    rcu_read_lock();
>    list_for_each_entry_rcu(css, &pos->rstat_css_list,
>                              rstat_css_node)
>         css->ss->css_rstat_flush(css, cpu);
>    rcu_read_unlock();
> ...
> }
> 
> Because the content of css->ss is not a function address,
> once the css_rstat_flush is called, kernel exception will happen.

I agree with your analysis. The list_for_each_entry_rcu() is not
accounting for the move from A to B and the head's rstat_css_list is
invalid in the cgroup_rstat_flush() context.

> When the issue happened, the list of pos->rstat_css_list at group A is
> empty.
> There must be racing conditions.
> 
> From reviewing code, we find rebind_subsystems() is no lock held when
> move css object to other list.
> 
> int rebind_subsystems(struct cgroup_root *dst_root, u16 ss_mask)
> {
> ...
>    if (ss->css_rstat_flush) {
>          list_del_rcu(&css->rstat_css_node);
>          list_add_rcu(&css->rstat_css_node,
>                       &dcgrp->rstat_css_list);
>    }
> ...
> }
> 
> If we held a css object from A group list, at same time this css object
> was moved to B group list.
> [...]
> Do you have any suggestion for this issue?

The css->rstat_css_node should not be modified if there are possible RCU
readers elsewhere.
One way to fix this would be to insert synchronize_rcu() after
list_del_rcu() and before list_add_rcu().
(A further alternative (I've heard about) would be to utilize 'nulls'
RCU lists [1] to make the move between lists detectable.)

But as I'm looking at it from distance, it may be simpler and sufficient
to just take cgroup_rstat_lock around the list migration (the nesting
under cgroup_mutex that's held with rebind_subsystems() is fine).

HTH,
Michal

[1] https://www.kernel.org/doc/html/latest/RCU/rculist_nulls.html


