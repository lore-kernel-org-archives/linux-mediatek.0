Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4DCC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 12:20:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AED961424
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 12:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AED961424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WH8pWLWE93Z5uT6BQ4DPczzYYE7qECAE82aNQSa208I=; b=Sd92/BXmE60ZXc1pRA9P51s5P
	3tgLBTAOwmC641zyzyfT8frbHEOHG1k1zVhLqmyFhS/OO6W57dlcEcrU66RcAtMn7bmt2Gvoxwjo5
	uL9+Y3fjKxdRru6sJ3eo1eEz0N2nbCBtTCDqKjLHlNamBp/gqTxXdJUusefnzB8lfof1xLBUz+b3L
	B87Wgp1lig3c6+ozs++JUsfXSKkTvH+gPvtaarFuz6pLNeyz+aLldqlD5qHIZCmPWIii+/oNz4mF/
	pVhvKNkUIjBSLQ6JCd/+Jb67MvzvXP087dmozEdtTMUzgop6RdcbtXdNDJ569wztc7zok1QN5CKGz
	EhR/Rk8lw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4tB-00EFBl-6h; Mon, 10 May 2021 12:19:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4sx-00EF9T-Em; Mon, 10 May 2021 12:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GLh0mrZgEMV8uCKtdZxi8FRirgZQFF8C22C3Zf7j/X4=; b=pcHzbQ8JI++JrQiNwbCTR49zAZ
 /P5kE+ZJouREJh3BLrgXHC2/IJAA4p4HLRhCppS8TcSFiU0trLPhga0xe+T5dtIZAGRnifW3olXa5
 XdyGR+acomiXPuzEZJazGys3bj/6nYXVAwkjrk9d2dShU0DKGOvzqe5iKl98Y1M7ro+HxT2bgriAu
 jQZvYntZrXmeg2uqHzkxIetICZZKfR0J2+qh9qCsnsU1+1OJ4Zbro7o465nFYM14cGDIUCUTOz2qr
 gLlW+INSl8MOkCFFMzhF4JQtsNI2HuOnirRM9Bsv8Z1X+MOq2v477+lGzIuK93+u3h3KzhSxe8gcz
 pNqlqGlg==;
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4su-008gUu-Be; Mon, 10 May 2021 12:19:41 +0000
IronPort-SDR: bfk+HbhY5sE2NYGdWSZC+l+hoDmj/eGuQ2SLMQCe1b7EtzjafG98m0nSJEJYhhK2dKpzaQEVqQ
 9DA6DJdWmwng==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="220126458"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="220126458"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 05:19:38 -0700
IronPort-SDR: ao4yB93p+glGus/p+7LqlVOo/UzoL00iN6fQNdv79r/4ZwcIE5umGx34UpIlUVegZIcG2R+z+i
 pNhno4LPORtg==
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="391900373"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 05:19:32 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1lg4sg-00BAFq-NY; Mon, 10 May 2021 15:19:26 +0300
Date: Mon, 10 May 2021 15:19:26 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: "Rocco.Yue" <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Peter Enderborg <peter.enderborg@sony.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Cong Wang <cong.wang@bytedance.com>, Di Zhu <zhudi21@huawei.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Roopa Prabhu <roopa@cumulusnetworks.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upsream@mediatek.com
Subject: Re: [PATCH][v2] rtnetlink: add rtnl_lock debug log
Message-ID: <YJkkzlJQPWXjanxe@smile.fi.intel.com>
References: <20210508085738.6296-1-rocco.yue@mediatek.com>
 <CAHp75VftbW7pgkfrSB6teKZO4EfGH9UWkhy1SAtijCLvKz8HTQ@mail.gmail.com>
 <1620631421.29475.106.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620631421.29475.106.camel@mbjsdccf07>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_051940_433470_5C2FDBBB 
X-CRM114-Status: GOOD (  30.93  )
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

On Mon, May 10, 2021 at 03:23:41PM +0800, Rocco.Yue wrote:
> On Sun, 2021-05-09 at 12:42 +0300, Andy Shevchenko wrote:
> > On Sat, May 8, 2021 at 12:11 PM Rocco Yue <rocco.yue@mediatek.com> wrote:
> > >
> > > We often encounter system hangs caused by certain process
> > > holding rtnl_lock for a long time. Even if there is a lock
> > > detection mechanism in Linux, it is a bit troublesome and
> > > affects the system performance. We hope to add a lightweight
> > > debugging mechanism for detecting rtnl_lock.
> > >
> > > Up to now, we have discovered and solved some potential bugs
> > > through this lightweight rtnl_lock debugging mechanism, which
> > > is helpful for us.
> > >
> > > When you say Y for RTNL_LOCK_DEBUG, then the kernel will detect
> > > if any function hold rtnl_lock too long and some key information
> > > will be printed out to help locate the problem.
> > >
> > > i.e: from the following logs, we can clearly know that the pid=2206
> > > RfxSender_4 process holds rtnl_lock for a long time, causing the
> > > system to hang. And we can also speculate that the delay operation
> > > may be performed in devinet_ioctl(), resulting in rtnl_lock was
> > > not released in time.
> > >
> > > <6>[   40.191481][    C6] rtnetlink: -- rtnl_print_btrace start --
> > 
> > You don't seem to get it. It's a quite long trace for the commit
> > message. Do you need all those lines below? Why?
> > 
> 
> The contents shown in all the lines below are the original printed after
> adding this patch, I pasted these lines into commit message to
> illustrate this patch as a case.
> 
> It now appears that some of following are indeed unnecessary, I am going
> to condense a lot of following contents as follows.
> 
> Could you please help to take a look at it again? many thanks :-)
> 
> [   40.191481] rtnetlink: -- rtnl_print_btrace start --
> [   40.191494] RfxSender_4[2206][R] hold rtnl_lock more than 2 sec,
> start time: 38181400013
> [   40.191571] Call trace:
> [   40.191586]  rtnl_print_btrace+0xf0/0x124
> [   40.191656]  __delay+0xc0/0x180
> [   40.191663]  devinet_ioctl+0x21c/0x75c
> [   40.191668]  inet_ioctl+0xb8/0x1f8
> [   40.191675]  sock_do_ioctl+0x70/0x2ac
> [   40.191682]  sock_ioctl+0x5dc/0xa74
> [   40.191715] rtnetlink: -- rtnl_print_btrace end --
> [   42.181879] rtnetlink: rtnl_lock is held by [2206] from
> [38181400013] to [42181875177]

Much better, thanks!

(You still need a real review on the contents of the change)

> > > <6>[   40.191494][    C6] rtnetlink: RfxSender_4[2206][R] hold rtnl_lock
> > > more than 2 sec, start time: 38181400013
> > > <4>[   40.191510][    C6]  devinet_ioctl+0x1fc/0x75c
> > > <4>[   40.191517][    C6]  inet_ioctl+0xb8/0x1f8
> > > <4>[   40.191527][    C6]  sock_do_ioctl+0x70/0x2ac
> > > <4>[   40.191533][    C6]  sock_ioctl+0x5dc/0xa74
> > > <4>[   40.191541][    C6]  __arm64_sys_ioctl+0x178/0x1fc
> > > <4>[   40.191548][    C6]  el0_svc_common+0xc0/0x24c
> > > <4>[   40.191555][    C6]  el0_svc+0x28/0x88
> > > <4>[   40.191560][    C6]  el0_sync_handler+0x8c/0xf0
> > > <4>[   40.191566][    C6]  el0_sync+0x198/0x1c0
> > > <6>[   40.191571][    C6] Call trace:
> > > <6>[   40.191586][    C6]  rtnl_print_btrace+0xf0/0x124
> > > <6>[   40.191595][    C6]  call_timer_fn+0x5c/0x3b4
> > > <6>[   40.191602][    C6]  expire_timers+0xe0/0x49c
> > > <6>[   40.191609][    C6]  __run_timers+0x34c/0x48c
> > > <6>[   40.191616][    C6]  run_timer_softirq+0x28/0x58
> > > <6>[   40.191621][    C6]  efi_header_end+0x168/0x690
> > > <6>[   40.191628][    C6]  __irq_exit_rcu+0x108/0x124
> > > <6>[   40.191635][    C6]  __handle_domain_irq+0x130/0x1b4
> > > <6>[   40.191643][    C6]  gic_handle_irq.29882+0x6c/0x2d8
> > > <6>[   40.191648][    C6]  el1_irq+0xdc/0x1c0
> > > <6>[   40.191656][    C6]  __delay+0xc0/0x180
> > > <6>[   40.191663][    C6]  devinet_ioctl+0x21c/0x75c
> > > <6>[   40.191668][    C6]  inet_ioctl+0xb8/0x1f8
> > > <6>[   40.191675][    C6]  sock_do_ioctl+0x70/0x2ac
> > > <6>[   40.191682][    C6]  sock_ioctl+0x5dc/0xa74
> > > <6>[   40.191688][    C6]  __arm64_sys_ioctl+0x178/0x1fc
> > > <6>[   40.191694][    C6]  el0_svc_common+0xc0/0x24c
> > > <6>[   40.191699][    C6]  el0_svc+0x28/0x88
> > > <6>[   40.191705][    C6]  el0_sync_handler+0x8c/0xf0
> > > <6>[   40.191710][    C6]  el0_sync+0x198/0x1c0
> > > <6>[   40.191715][    C6] rtnetlink: -- rtnl_print_btrace end --
> > >
> > > <6>[   42.181879][ T2206] rtnetlink: rtnl_lock is held by [2206] from
> > > [38181400013] to [42181875177]

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
