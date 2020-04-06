Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070ACC2BA80
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:13:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BA220781
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/bVdBKM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WbmuFdQF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2BA220781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2jmlYrD2pjtLeNssXandiR0n+NiHrfaQceW3AG4OLI=; b=F/bVdBKMUCeUkD
	PhResUlrdOzmIHw1YTTiW43CjHkBtmqC5IMQRnYdiMvxcy6iYu4xFG0Tn0v2V2UniyfEP9HWQLVCW
	nt/6vl9YJ9XlJDjkKNcm4LyiT0HrDYNue/M7TB9GnIikYsIwp2WP9SK7I6At130sHgaKH543ksaZ8
	aelY1t0lXSKBDtgSLTCJhrHVj4fgj7767R1+MFgXFtgmHXksxlYFtvGvymltfV92xFKSY5RGENrWG
	LSYMJgdu7ZHXu1sIPNPw47NmJKB/xDuU5LlQwJCsOUAs55R2SJs2ERnNHdWC0j10/6LhlIM5uVtRl
	b46fl87JqIaoFLyflDmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLNoP-00072N-IR; Mon, 06 Apr 2020 09:12:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLNoN-00071y-C7; Mon, 06 Apr 2020 09:12:56 +0000
X-UUID: 52699fc215cb48768708dacf3125b146-20200406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=clVE+7JOIo3PBS3e/XDVaE20LgQxAZYkiBOn5CGZopM=; 
 b=WbmuFdQFPQ9M9LQBYItoJVqk6cWwQHgWlfvmEDuw0UqHNcbWnFw+wkQe6EvFYJSYQjy4ksBBzG+3zZRUPrlYarjDQwLR1ZMO3+8Uqwo57fIO49eH8k18mSb5vuE4IyTk4LhIUNlK5bwvqCGpLMkmnw80eavpwN59/4CNRMYIUx0=;
X-UUID: 52699fc215cb48768708dacf3125b146-20200406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1168555970; Mon, 06 Apr 2020 01:12:52 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 02:12:46 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 17:12:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Apr 2020 17:12:44 +0800
Message-ID: <1586164366.5015.6.camel@mtksdaap41>
Subject: Re: [v5, PATCH 4/5] cpufreq: mediatek: add opp notification for SVS
 support
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 6 Apr 2020 17:12:46 +0800
In-Reply-To: <20200313091038.q7q7exiowoah4nk4@vireshk-i7>
References: <1574769046-28449-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1574769046-28449-5-git-send-email-andrew-sh.cheng@mediatek.com>
 <20191127083619.etocnhpyyut3hzwq@vireshk-i7>
 <1575874588.13494.4.camel@mtksdaap41>
 <20191210064319.f4ksrxozp3gv4xry@vireshk-i7>
 <1583827865.4840.1.camel@mtksdaap41>
 <20200311060616.62nh7sfwtjwvrjfr@vireshk-i7>
 <1584084154.7753.3.camel@mtksdaap41>
 <20200313091038.q7q7exiowoah4nk4@vireshk-i7>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B4990598AEB233FDEC0585B013D8D27A16190BD69A58CD56856C23922C3611EF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_021255_417477_F9C5978B 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo
 Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-03-13 at 14:40 +0530, Viresh Kumar wrote:
> On 13-03-20, 15:22, andrew-sh.cheng wrote:
> > I have something want to consult you.
> > For your previous comment, you suggest use read-write lock to replace
> > mutex lock.
> > Will it be more efficiently even when all are write lock?
> > (all lock region are "setting VProc voltage")
> 
> The data to be protected here isn't the VProc voltage but the list of
> valid OPPs. My idea was if we can make the target() routine run a bit
> faster as it really matters as it is called from scheduler hot path.
> 
> It won't be wrong to use the mutex the way you have used it right now,
> but I think the read lock is much faster, though the read/write lock
> is more beneficial in case where there are multiple readers and fewer
> writers. The target() routine gets called multiple times here, not
> in parallel, and the OPP change notifier won't be called so often.
> 
Hi Viresh,

I will use regulator in the locked region.
And regulator will use mutex_lock.

I use read_lock/write_lock, and there will be below run time error,
Is it due to read_lock/write_lock using spin lock?
write_lock() => _raw_write_lock() @ spinlock.c
Please give me some advices.
Thank you.


[   28.109082] BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:254
[   28.117710] in_atomic(): 1, irqs_disabled(): 0, pid: 1855, name:
sugov:0
[   28.124788] CPU: 0 PID: 1855 Comm: sugov:0 Tainted: G        W
4.19.107 #51
[   28.132440] Hardware name: MediaTek krane sku176 board (DT)
[   28.138006] Call trace:
[   28.140461]  dump_backtrace+0x0/0x17c
[   28.144121]  show_stack+0x20/0x2c
[   28.147432]  dump_stack+0xd4/0x10c
[   28.150831]  ___might_sleep+0x108/0x118
[   28.154659]  __might_sleep+0x50/0x84
[   28.158230]  mutex_lock+0x28/0x60
[   28.161541]  regulator_lock_dependent+0x3c/0x10c
[   28.166152]  regulator_set_voltage+0x48/0xa0
[   28.170417]  mtk_cpufreq_set_voltage+0x16c/0x324
[   28.175046]  mtk_cpufreq_set_target+0x13c/0x2c8
[   28.179574]  __cpufreq_driver_target+0x424/0x4c4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
