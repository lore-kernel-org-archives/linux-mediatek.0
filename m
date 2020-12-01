Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18055C64E7B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 14:13:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F9E20757
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 14:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WA/Su0fC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Mw9HOaWV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+uah8n9H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F9E20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VJTCuTkifDZHrr1eLsRfiWT7hzf+rGrp9fYmgrrb8uo=; b=WA/Su0fClBL3Ace96MoUmuNSW
	nXSJhpU8P0NtNr7hIupCoGbsKNcmqRYEHuhiQZCUOmEnkr5Alt2r12ClpK4PjUMcOrujZSU1XHCz0
	2urlHRMSETL6mBDyGsmpMohuuJdzumPG6aYXrfaoq7qi1ijhV+64rUwzmUnAuwj4scpe9eb93lo+S
	Ow73yO1e6d318KLALZSGn+aeoW3JQLqGbKEkRIAeuNh8b03xQcgWuDK7xXqKSGyhqqU8lrSokqbmX
	VBD6XWos4UqklZA9Yx1FbpSn0t6sRSiR1ETH7xit94uMjYuSQ2Ngqx7+bR6fhiH0Il5Yh7s/c9EAb
	pnwDfn2fA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk6PX-000723-MY; Tue, 01 Dec 2020 14:13:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk6PS-0006zI-9E; Tue, 01 Dec 2020 14:13:39 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606832016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Skhg6O9p2Trnjrbm81ayS393ZogAa9PiayeejAPB7Ow=;
 b=Mw9HOaWVR79l72uLb07taz0LhZWUg8d2/HcmPfRcpZ4cCq6AZpzlRRr0IS9gzoIga3r+bO
 NywKzYVIGI/2M4ARyuCPl0/wuC1Xp5OFqTHMuYEFR/xerUVW4pEyqOwq9RPANMLUr8nnj6
 nK9RgMhl6/iHcXlj1MwZtbBiTQlJji+h1+OSgVyxaylqkdMQxxNPKZEBzgS1T4VuBACrXQ
 7H1zXyEIEeWWp673BEURkomaOIfS0UWl5PrTTAX9WUAp02CCJRLpzcXYMylMEtig3BnurG
 3WDPJBaoWh8ly+UtGwljZirT85nz/Lqkgx/ANbTHgmcfETrHkj5MPa/PVfoMgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606832016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Skhg6O9p2Trnjrbm81ayS393ZogAa9PiayeejAPB7Ow=;
 b=+uah8n9H51Y4ejsCR0Zmx8WPPwKY1FEz2dTA8w9rlY73cNkQ3nWGd3qzkRRjnXqZVhA9ir
 2eJhR8yltoybsLAg==
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v4 0/6] kasan: add workqueue and timer stack for generic
 KASAN
In-Reply-To: <CACT4Y+a=GmYVZwwjyXwO=_AeGy4QB9X=5x7cL76erwjPvRW6Zw@mail.gmail.com>
References: <20200924040152.30851-1-walter-zh.wu@mediatek.com>
 <87h7rfi8pn.fsf@nanos.tec.linutronix.de>
 <CACT4Y+a=GmYVZwwjyXwO=_AeGy4QB9X=5x7cL76erwjPvRW6Zw@mail.gmail.com>
Date: Tue, 01 Dec 2020 15:13:36 +0100
Message-ID: <871rg9hawf.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_091338_476500_5E7854FF 
X-CRM114-Status: GOOD (  16.61  )
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
 wsd_upstream <wsd_upstream@mediatek.com>, Linux-MM <linux-mm@kvack.org>,
 Stephen Boyd <sboyd@kernel.org>, Alexander Potapenko <glider@google.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Marco Elver <elver@google.com>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 John Stultz <john.stultz@linaro.org>, Andrey Konovalov <andreyknvl@google.com>,
 Tejun Heo <tj@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 01 2020 at 08:59, Dmitry Vyukov wrote:
> On Wed, Sep 30, 2020 at 5:29 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> On Thu, Sep 24 2020 at 12:01, Walter Wu wrote:
>> > Syzbot reports many UAF issues for workqueue or timer, see [1] and [2].
>> > In some of these access/allocation happened in process_one_work(),
>> > we see the free stack is useless in KASAN report, it doesn't help
>> > programmers to solve UAF on workqueue. The same may stand for times.
>> >
>> > This patchset improves KASAN reports by making them to have workqueue
>> > queueing stack and timer stack information. It is useful for programmers
>> > to solve use-after-free or double-free memory issue.
>> >
>> > Generic KASAN also records the last two workqueue and timer stacks and
>> > prints them in KASAN report. It is only suitable for generic KASAN.
>
> Walter, did you mail v5?
> Checking statuses of KASAN issues and this seems to be not in linux-next.
>
>> > [1]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22+process_one_work
>> > [2]https://groups.google.com/g/syzkaller-bugs/search?q=%22use-after-free%22%20expire_timers
>>
>> How are these links useful for people who do not have a gurgle account?
>
> This is a public mailing list archive, so effectively the same way as
> lore links ;)

Just that it asked me to log in last time. That's why I wrote the
above. Today it does not, odd.

Thanks,

        tglx



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
