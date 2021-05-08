Return-Path: <SRS0=aHEw=KD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350F1C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 May 2021 09:07:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 915A961456
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 May 2021 09:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 915A961456
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TPe14zfCvEzqsyZjffTtQLj/zRE2uc5ShPoS6RDi2v4=; b=ClfglK8ykS91jylqrY6c0l98v
	fUau34lWMaBqJTxPh0cnDTZxyYNl0eu0mT46X0zTHSn1TbPyO6uNSOdgtfk11p4qGt+cWiGJHGGl2
	kAx6NK4g3f+94TLLN4ef8rtsTid7H5nABKYsidq8aa4DyEEcT+DP7E0ZjFRmEth2KfO2FukB6jZsk
	4mznnnR1eCReoR7ALKsZix6ALpP7mt4nsnnHebe4nRBrLGcNW5xeVRyFrX6hRbmPhShHm26ci3xrP
	wFn1QLJpxONrNtbRVpWuu0VehwxCTegnk308tiAee1y4IgYYDX64tFgjd297u6DL/ocqZS4BpAQRt
	bQriwjpUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfIw1-009CT6-V7; Sat, 08 May 2021 09:07:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfIvj-009CRT-5c; Sat, 08 May 2021 09:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=BQEDEF8yXVQHuoS/VcP7ckQfizJjVZZPCWYcIwLlGC0=; b=E6p1pUWY8sFa7hTM7ChtAR6l2S
 L5JeBjp8H78tM466qH0B6GnPm/iXPoQ0QApcCSnQ2kmMgwQbbcuwhLJ+2Lx6kAbA1/jQ4JSbM2Pm6
 OVQLI/ZjOGExkWUQBnzazolgoRiDomCpfIWVdu3LIPQNGNqAaZx1d457YmK4mKEe9Fpfztm6yt0p7
 xNi/AeHLYopEIp1Gxz19Hm+7axtHWg30oYG0M5tTe1y0FN9V0fCIdGYrbUN7awPIE74rBmtyzdt45
 3mDkMPtEpXslsSzYQebGLJcQ+o3dYukPC6UoHEqnRaWPhOZWim6jvsrsxMP88Sx3NmTFusaDERutZ
 QV0am34A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfIvg-007SBM-Hv; Sat, 08 May 2021 09:07:21 +0000
X-UUID: 67b603814c0c44d494f296475897b087-20210508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BQEDEF8yXVQHuoS/VcP7ckQfizJjVZZPCWYcIwLlGC0=; 
 b=mkS57A8CmghwoCQGW+P8kQZhlOVZicMWFpjdFfhc8Y1lJKnJMnFDrhKhbavxj9Ybg+YMgD2qEnY43mMrHQYPdIFn80l2AIxXgUOnG8l0pw42SnPZbCEmQwm+RPHNtlC4lc+vsOmCzP80NP3BzKiyaV9kxRiCxNrocF7aOZqppp8=;
X-UUID: 67b603814c0c44d494f296475897b087-20210508
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1622398521; Sat, 08 May 2021 02:07:15 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 May 2021 02:07:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 May 2021 17:07:05 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 May 2021 17:07:03 +0800
Message-ID: <1620464074.29475.77.camel@mbjsdccf07>
Subject: Re: [PATCH] rtnetlink: add rtnl_lock debug log
From: Rocco.Yue <rocco.yue@mediatek.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
CC: Peter Enderborg <peter.enderborg@sony.com>, Thomas Gleixner
 <tglx@linutronix.de>, Anshuman Khandual <anshuman.khandual@arm.com>, "Vitor
 Massaru Iha" <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>, "Wei
 Yang" <richard.weiyang@gmail.com>, Cong Wang <cong.wang@bytedance.com>, "Di
 Zhu" <zhudi21@huawei.com>, Stephen Hemminger <stephen@networkplumber.org>,
 Francis Laniel <laniel_francis@privacyrequired.com>, Roopa Prabhu
 <roopa@cumulusnetworks.com>, Andrii Nakryiko <andrii@kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upsream@mediatek.com>, "David S . Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, <peterz@infradead.org>
Date: Sat, 8 May 2021 16:54:34 +0800
In-Reply-To: <27fa19c9-81b2-3604-033c-b7fe5d14b620@i-love.sakura.ne.jp>
References: <20210429070237.3012-1-rocco.yue@mediatek.com>
 <27fa19c9-81b2-3604-033c-b7fe5d14b620@i-love.sakura.ne.jp>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 713E8F3AE8C65CE8C71BAB24CB649A0B06DD346C287C9BD6D3E538B044E94BF22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210508_020720_618478_628D5A7B 
X-CRM114-Status: GOOD (  20.90  )
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

> > +static void rtnl_print_btrace(struct timer_list *unused)
> > +{
> > +	pr_info("----------- %s start -----------\n", __func__);
> > +	pr_info("%s[%d][%c] hold rtnl_lock more than 2 sec, start time: %llu\n",
> > +		rtnl_instance.task->comm,
> > +		rtnl_instance.pid,
> > +		task_state_to_char(rtnl_instance.task),
> > +		rtnl_instance.start_time);
> > +	stack_trace_print(rtnl_instance.addrs, rtnl_instance.nr_entries, 0);
> 
> Do we want to print same traces every 2 seconds? 
> 
> Since it is possible to stall for e.g. 30 seconds, printing either only upon
> first call to rtnl_print_btrace() for each stalling duration or only upon
> end of stalling duration (i.e. from rtnl_relase_btrace()) is better?
> 

Thanks for your review, Tetsuo.

rtnl_chk_timer is a one-shot timer, I don't rearm the timer after
expire, therefore traces are only logged once after rtnl_lock was held
for more than 2 seconds, rather than every 2 seconds. In this way, even
if this rtnl_lock debug mechanism is enabled, the overhead is also
affordable in the user load.

As far as I understand it, there won't be the problem you mentioned.

In my experience, it's more appropriate to print trace when
call rtnl_print_btrace(), we can't expect that rtnl_lock will be
released before kernel reboot. And after holding the rtnl_lock for more
than 2s, we will print these logs, which is more helpful for us.

> > +	show_stack(rtnl_instance.task, NULL, KERN_DEBUG);
> 
> Why KERN_DEBUG ?
> 
> If you retrieve the output via dmesg, KERN_DEBUG would be fine.
> But for syzkaller (which counts on printk() messages being printed to
> consoles), KERN_INFO (or default) is expected.
> 

KERN_INFO is expected, I will fix it in patch v2.

> > +	pr_info("------------ %s end -----------\n", __func__);
> > +}
> > +
> > +static void rtnl_relase_btrace(void)
> > +{
> > +	rtnl_instance.end_time = sched_clock();
> > +
> 
> You should del_timer_sync() here than
> 
> > +	if (rtnl_instance.end_time - rtnl_instance.start_time > 2000000000ULL) {
> > +		pr_info("rtnl_lock is held by [%d] from [%llu] to [%llu]\n",
> > +			rtnl_instance.pid,
> > +			rtnl_instance.start_time,
> > +			rtnl_instance.end_time);
> > +	}
> > +
> > +	del_timer(&rtnl_chk_timer);
> 
> here in order to make sure that end message is printed only after
> rtnl_print_btrace() messages are printed.
> 

Will have a separate patch for this.

> > +}
> > +#endif
> > +
> 

Best Regards
Rocco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
