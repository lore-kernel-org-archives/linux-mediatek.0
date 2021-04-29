Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6777FC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 09:33:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1DD361458
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 09:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1DD361458
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H2W2C49G7rl7VSKJi54Xkf7ZrZhDxskmjy2zqrJqHEo=; b=FeSlWKJ8tXYgz55/Z56A1oIgP
	55xJl1JOOzy4SJtTWTXOQUHfECX8LnV2XGVj9FhFoHdSms32JIHuxb9ZIs+Pb0aNGD0zY3vcdFPSh
	l+Pjq7sfTAar0npvJwJE46YHY0tW7hVTsnNvNyv4ER4qDxysQ6ahivJvnyzQrexRLbjnlolUozjsf
	3Ax66g3aYUaAVLlJIrbFrY3ZtqkbM1bD+s+cmznX6bfI7+7ICuUXtKuRTT05D7j2WPAlYeKfP0k4p
	WyIy2oGviZuyWGg4mqKuuq7Jq3N9zQzPebT6aCleHy3mSaghY5YKg2S0/FMZBGoLxaPefXUOqSeRU
	PO8T+TUog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc32S-005RJp-99; Thu, 29 Apr 2021 09:32:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc32E-005RJO-P0; Thu, 29 Apr 2021 09:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/wNiFpqOaAKZtxpT+wIYCT15YwckphLit/10ndu05zM=; b=vrSVvK4f1ma+t5pG1NcX/gtqS/
 kW0nhj1Lg7/VmXkgxw9xx85JJm8qXKIrP2oOzI8gUYRtsoYc/IJ/Kp3VeDXHsFrP1QPurA8pKcqCk
 nw+xwzK/G521aWWX3c4nFisWxARFu/E//9QyX5HHo4D6ieXXqqK0CAdzKvxHz+1TPmilqNklch5ht
 +REWLV/W9yKE2PmwFezdTNr2DtwUtMJtKll1nThiu6xYSk29hvksb7pBinfU+N3Z0NvMByIK0AbR1
 qDXXBWspeFzi9G6Nt2n3YIjseYONi0jA7aeinLQZD8PplL4NdZSy0rNdoSFfxRWQwSpaTqUrErY8o
 bRp7+ZPA==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc32C-000WjK-0x; Thu, 29 Apr 2021 09:32:37 +0000
Received: by mail-pg1-x531.google.com with SMTP id y30so1551162pgl.7;
 Thu, 29 Apr 2021 02:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/wNiFpqOaAKZtxpT+wIYCT15YwckphLit/10ndu05zM=;
 b=NVsODKg1x8dhR/Trn9fbN1LyN/34bBtqRrhqxjyfL7r/oNvcg0y8ymb11FNO8Mx9Zc
 2XHl3aWGDi3rlKSM+ezE3gQDLL0V/T4D2S90e+5yt5aEHVBdHkfpltMJj4/cX2NmwT90
 6DPj46mgaUjf3hFIo6v0lIzj6kmrR2PIpgGHpb/V6d8+GGvZ3ZOm67gvC620YHrtuGZ2
 IGpxE9CHtLx9ImbB0MIgiDZOepv+7Y6eyC7so99pvqtsJPapRS/bIW7TWFsK+r7CgOym
 qgt8o9vhmepUMb5uuCeCFmWHSgPeoTFgkwQSfAwZCQmVMw1FFUdSZugM/wlWu1uXTQDt
 jQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/wNiFpqOaAKZtxpT+wIYCT15YwckphLit/10ndu05zM=;
 b=sE/DtbYmjeEnswAsggmrw2xMwgE5qxhP8yHfdR6PduY06Y2sHNGFf2MS/kUyKdM17P
 ueuSPijlW9bMRjaNP7qYxxpDJRG+ZPX9vw4Id1ssJ4QJV2qwISR4uYD+lnj14SULSkWC
 Ho/tMAq8Y+7gE5ZdnB8rmN1+7kheneRJmdGNVE/RiylawFSDiJQlf8X3DxuiK6oBz20R
 ObMAOpTgb7kIQu/hL5B2YvPxUKFE+conmcBoGsefWz3n3zUT5EUHhGHZX3UpJJ2XFTyO
 KPz5qEnHsAUYaUiaDFGlDotyOu0tnxYL4K3wSGJ4qE336cZGQ5cZg1nZujj36KX8elBO
 6w6Q==
X-Gm-Message-State: AOAM532E326oNi+QtaLMkgsnus0ghnNiCvdIu6odoZywV1WZWFjS6ul1
 6zkIDoQ+lr/emWP2Y5KLvL0KS7glx9jm7/GWeZE=
X-Google-Smtp-Source: ABdhPJwUaOwWjHOoYBhSdQvsUNZUwlRQcBXlmtOw3z2HfS28/S+CegSC4NeUvLbefV1Nrw1ECLOhoaX9GUcIgqyJB/Y=
X-Received: by 2002:a63:a847:: with SMTP id i7mr30760439pgp.203.1619688754072; 
 Thu, 29 Apr 2021 02:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210429070237.3012-1-rocco.yue@mediatek.com>
In-Reply-To: <20210429070237.3012-1-rocco.yue@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 29 Apr 2021 12:32:17 +0300
Message-ID: <CAHp75Vc=GMv5dJ1dJYr=B3W6c+nuPCfXa4wxLJOYPTuqrMskFg@mail.gmail.com>
Subject: Re: [PATCH] rtnetlink: add rtnl_lock debug log
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
 Peter Enderborg <peter.enderborg@sony.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vitor Massaru Iha <vitor@massaru.org>, 
 Sedat Dilek <sedat.dilek@gmail.com>, Wei Yang <richard.weiyang@gmail.com>, 
 Cong Wang <cong.wang@bytedance.com>, Di Zhu <zhudi21@huawei.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, 
 Francis Laniel <laniel_francis@privacyrequired.com>, 
 Roopa Prabhu <roopa@cumulusnetworks.com>, Andrii Nakryiko <andrii@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upsream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_023236_095897_AB9DEEED 
X-CRM114-Status: GOOD (  21.79  )
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

On Thu, Apr 29, 2021 at 10:21 AM Rocco Yue <rocco.yue@mediatek.com> wrote:
>
> We often encounter system hangs caused by certain processes
> holding rtnl_lock for a long time. Even if there is a lock
> detection mechanism in Linux, it is a bit troublesome and
> affects the system performance. We hope to add a lightweight
> debugging mechanism for detecting rtnl_lock.
>
> Up to now, we have discovered and solved some potential bugs
> through such debug information of this lightweight rtnl_lock,
> which is helpful for us.
>
> When you say Y for RTNL_LOCK_DEBUG, then the kernel will detect
> if any function hold rtnl_lock too long and some key information
> will be printed to help identify the issue point.
>
> i.e: from the following logs, we can clear know that the pid=5546

clearly

> RfxSender_4 process hold rtnl_lock for a long time, causing the

holds

> system hang. And we can also speculate that the delay operation

to hang

> may be performed in devinet_ioctl(), resulting in rtnl_lock was
> not released in time.
>
> <6>[  141.151364] ----------- rtnl_print_btrace start -----------

Can you, please, shrink this to the point?

> <6>[  141.152079] RfxSender_4[5546][R] hold rtnl_lock more than 2 sec,
> start time: 139129481562
> <4>[  141.153114]  rtnl_lock+0x88/0xfc
> <4>[  141.153523]  devinet_ioctl+0x190/0x1268
> <4>[  141.154007]  inet_ioctl+0x108/0x1f4
> <4>[  141.154449]  sock_do_ioctl+0x88/0x200
> <4>[  141.154911]  sock_ioctl+0x4b0/0x884
> <4>[  141.155367]  do_vfs_ioctl+0x6b0/0xcc4
> <4>[  141.155830]  __arm64_sys_ioctl+0xc0/0xec
> <4>[  141.156326]  el0_svc_common+0x130/0x2c0
> <4>[  141.156810]  el0_svc_handler+0xd0/0xe0
> <4>[  141.157283]  el0_svc+0x8/0xc
> <4>[  141.157646] Call trace:
> <4>[  141.157956]  dump_backtrace+0x0/0x240
> <4>[  141.158418]  show_stack+0x18/0x24
> <4>[  141.158836]  rtnl_print_btrace+0x138/0x1cc
> <4>[  141.159362]  call_timer_fn+0x120/0x47c
> <4>[  141.159834]  expire_timers+0x28c/0x420
> <4>[  141.160306]  __run_timers+0x3d0/0x494
> <4>[  141.160768]  run_timer_softirq+0x24/0x48
> <4>[  141.161262]  __do_softirq+0x26c/0x968
> <4>[  141.161725]  irq_exit+0x1f8/0x2b4
> <4>[  141.162145]  __handle_domain_irq+0xdc/0x15c
> <4>[  141.162672]  gic_handle_irq+0xe4/0x188
> <4>[  141.163144]  el1_irq+0x104/0x200
> <4>[  141.163559]  __const_udelay+0x118/0x1b0
> <4>[  141.164044]  devinet_ioctl+0x1a0/0x1268
> <4>[  141.164527]  inet_ioctl+0x108/0x1f4
> <4>[  141.164968]  sock_do_ioctl+0x88/0x200
> <4>[  141.165428]  sock_ioctl+0x4b0/0x884
> <4>[  141.165868]  do_vfs_ioctl+0x6b0/0xcc4
> <4>[  141.166330]  __arm64_sys_ioctl+0xc0/0xec
> <4>[  141.166825]  el0_svc_common+0x130/0x2c0
> <4>[  141.167308]  el0_svc_handler+0xd0/0xe0
> <4>[  141.167786]  el0_svc+0x8/0xc
> <6>[  141.168153] ------------ rtnl_print_btrace end -----------
>
> <6>[  147.321389] rtnl_lock is held by [5546] from
> [139129481562] to [147321378812]


...

> +static struct rtnl_debug_btrace_t rtnl_instance = {
> +       .task           = NULL,
> +       .pid            = 0,
> +       .start_time     = 0,
> +       .end_time       = 0,
> +       .nr_entries     = 0,

static assumes all 0:s, what's the point?

> +};

...

> +static void rtnl_print_btrace(struct timer_list *unused)
> +{
> +       pr_info("----------- %s start -----------\n", __func__);
> +       pr_info("%s[%d][%c] hold rtnl_lock more than 2 sec, start time: %llu\n",
> +               rtnl_instance.task->comm,
> +               rtnl_instance.pid,
> +               task_state_to_char(rtnl_instance.task),
> +               rtnl_instance.start_time);
> +       stack_trace_print(rtnl_instance.addrs, rtnl_instance.nr_entries, 0);

> +       show_stack(rtnl_instance.task, NULL, KERN_DEBUG);

Unaligned debug level.

> +       pr_info("------------ %s end -----------\n", __func__);

Looking into tons of these, perhaps you need to define pr_fmt(). I
haven't checked if it's already defined, though.

> +}

...

> +       if (rtnl_instance.end_time - rtnl_instance.start_time > 2000000000ULL) {

Perhaps you should use one of the defined constants from time64.h ?

> +               pr_info("rtnl_lock is held by [%d] from [%llu] to [%llu]\n",
> +                       rtnl_instance.pid,
> +                       rtnl_instance.start_time,
> +                       rtnl_instance.end_time);
> +       }

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
