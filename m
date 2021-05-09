Return-Path: <SRS0=dq3f=KE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE2BC433B4
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 09:43:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A58D610CB
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 May 2021 09:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A58D610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HjQb4cZYjagjTFD69JitG7S/BamWFBgO7YuwT28Y+wQ=; b=X2UgI0i5zWBqTZS8bT1d8lryZ
	zDo1JIW55palxO/VOWqPzZlZlPDXGKMGiyJC5ozI+mM8Rs/3HdnYN21Yzr4UVSrhzz2tY1vw1HKHl
	aJwGrMuyYjm/XlQrh8bTMzTvN4PsJzF74+E82qe+ZFfBGMBrLLDa60GrqhaTqQSOwCf7tFu/3Ygu6
	rpB57xhWvA/xRDDUpSi2RXg5aNNLMiQtJM5GG10tS99TIvGh00h6ke6iZicq5nTavmhtv1MaxtGcE
	CM2GdLbUek/Sbs8FyvVIpAuNgrhdRr+9uWJlYGalYUTdbEGAI/oOfAk3Hr80NasRnMaSEBD/2L3g+
	giUk6Oy5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lffxV-00BMWU-SN; Sun, 09 May 2021 09:42:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lffxF-00BMT0-Ek; Sun, 09 May 2021 09:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=osq21oo/pRLHDf/4dr8pVAgwlLU2iHtgI72VbG/Kutk=; b=rEvc1W1rTKz0l3qb+KOtrdRlXS
 BY10uvlTIQeH0sj6pBt5Hg0Xj+dTEDR7DcitWKsN6Bm0Jz0gPeQ+LHbMVo89tu5wwPU0tc9eWTLM7
 dxk9pk3Gshs8xTT1hG8E4Hm6I6jLeuX/V5x/c1sQNESO6ODFaleiYRwL/Z5MI/g3MnmBGgNFrxKug
 4xeuZuhQwgxjvSub1xiAvqv6+Ko8eI51yOdrwAvZVE2mYHajOWMr1vTYgujkItCb/maeHV9MpfoJc
 7Az9Ra09ivmeBoOZP6ufvpyg/VeAj4yTeiROGM/watBEfg2QrpaRkq9EsGtrGsDWGfeWA0jkctceJ
 7K/dekVA==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lffxC-007vAi-KT; Sun, 09 May 2021 09:42:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id v13so7712318ple.9;
 Sun, 09 May 2021 02:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=osq21oo/pRLHDf/4dr8pVAgwlLU2iHtgI72VbG/Kutk=;
 b=ExOg7CDVTtLE34McWFTFmZ2xnh6oSX4bL86dD3qd0hx6y57SY6pN/QQEcz3o01Fjl5
 9MPS3LgSaMrU2mfXflKK76Rfi1XhqmrcrBs6X7q1OhPlDHrRMzzskN1JsQBV3Vi7QpIl
 bcpk+esswKbQ3r6XZyZQpGlVrcwPU8seg/YaJL8YBwC3QTPnPhcq9c8iOUJqXb56tkq1
 rWViAwa/b7hnCDeG+XlGodYmUUx3E3LzQkkaen+OxfvpDhtm7eeW2DweeFke17iLMoEu
 5aa+0Kwm194+b2B72gUZnnb+PbLFtz9CW0NgOcvFmfLrYOrVuVCWxJgKrFIDYLXSztgc
 cRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=osq21oo/pRLHDf/4dr8pVAgwlLU2iHtgI72VbG/Kutk=;
 b=jOrBIGqK4U81R2nzWXRtoflHE/t1Zm3Y4oK8w4+YkyDR8CBfTH9fulUe+0P/IcqjBe
 R6MFAdFwFRXetqabEPoxaz1pRPo7pdFnrtq/Hm+2baHbcmCgHdtvZI/RYreEC0LCxfrj
 G4C0gL9nQIERHaNTbmj+yXmUZQBs6CXvitc7stbWKWzDPhbS8P1ipDCRnhc3nXk3LJub
 FNb4Qv2BKDs5kvXBMJpePqyj1QdFTkxjsheC2k34Wyr8wR88GK/xuT69Ikli3qpmMbQh
 85biScg7uKbORrAfkDea8fVg7Y4OnEZcMCBCSNeZYrmfApTExVKFHEw5RDbMt1km4dbN
 GGwg==
X-Gm-Message-State: AOAM533arFD80SCGI2siHO4v2TgCvPx/Qx4Vdw7QIUN+CKRfIffZwTCz
 C8EhjWd8uNtpe7PMikkPKBnAFcU47L25B02NEH8=
X-Google-Smtp-Source: ABdhPJxS/G8bgnKha6sxonMpWEB3Q2HfsON0oELtruM6eHw3yTIc4qcTmY+lxzoYFiLooPnCo6qRzaW7iIbqkvVcl6k=
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr3914834pja.181.1620553344888; 
 Sun, 09 May 2021 02:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210508085738.6296-1-rocco.yue@mediatek.com>
In-Reply-To: <20210508085738.6296-1-rocco.yue@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 9 May 2021 12:42:08 +0300
Message-ID: <CAHp75VftbW7pgkfrSB6teKZO4EfGH9UWkhy1SAtijCLvKz8HTQ@mail.gmail.com>
Subject: Re: [PATCH][v2] rtnetlink: add rtnl_lock debug log
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
X-CRM114-CacheID: sfid-20210509_024226_717232_189878E5 
X-CRM114-Status: GOOD (  18.94  )
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

On Sat, May 8, 2021 at 12:11 PM Rocco Yue <rocco.yue@mediatek.com> wrote:
>
> We often encounter system hangs caused by certain process
> holding rtnl_lock for a long time. Even if there is a lock
> detection mechanism in Linux, it is a bit troublesome and
> affects the system performance. We hope to add a lightweight
> debugging mechanism for detecting rtnl_lock.
>
> Up to now, we have discovered and solved some potential bugs
> through this lightweight rtnl_lock debugging mechanism, which
> is helpful for us.
>
> When you say Y for RTNL_LOCK_DEBUG, then the kernel will detect
> if any function hold rtnl_lock too long and some key information
> will be printed out to help locate the problem.
>
> i.e: from the following logs, we can clearly know that the pid=2206
> RfxSender_4 process holds rtnl_lock for a long time, causing the
> system to hang. And we can also speculate that the delay operation
> may be performed in devinet_ioctl(), resulting in rtnl_lock was
> not released in time.
>
> <6>[   40.191481][    C6] rtnetlink: -- rtnl_print_btrace start --

You don't seem to get it. It's a quite long trace for the commit
message. Do you need all those lines below? Why?

> <6>[   40.191494][    C6] rtnetlink: RfxSender_4[2206][R] hold rtnl_lock
> more than 2 sec, start time: 38181400013
> <4>[   40.191510][    C6]  devinet_ioctl+0x1fc/0x75c
> <4>[   40.191517][    C6]  inet_ioctl+0xb8/0x1f8
> <4>[   40.191527][    C6]  sock_do_ioctl+0x70/0x2ac
> <4>[   40.191533][    C6]  sock_ioctl+0x5dc/0xa74
> <4>[   40.191541][    C6]  __arm64_sys_ioctl+0x178/0x1fc
> <4>[   40.191548][    C6]  el0_svc_common+0xc0/0x24c
> <4>[   40.191555][    C6]  el0_svc+0x28/0x88
> <4>[   40.191560][    C6]  el0_sync_handler+0x8c/0xf0
> <4>[   40.191566][    C6]  el0_sync+0x198/0x1c0
> <6>[   40.191571][    C6] Call trace:
> <6>[   40.191586][    C6]  rtnl_print_btrace+0xf0/0x124
> <6>[   40.191595][    C6]  call_timer_fn+0x5c/0x3b4
> <6>[   40.191602][    C6]  expire_timers+0xe0/0x49c
> <6>[   40.191609][    C6]  __run_timers+0x34c/0x48c
> <6>[   40.191616][    C6]  run_timer_softirq+0x28/0x58
> <6>[   40.191621][    C6]  efi_header_end+0x168/0x690
> <6>[   40.191628][    C6]  __irq_exit_rcu+0x108/0x124
> <6>[   40.191635][    C6]  __handle_domain_irq+0x130/0x1b4
> <6>[   40.191643][    C6]  gic_handle_irq.29882+0x6c/0x2d8
> <6>[   40.191648][    C6]  el1_irq+0xdc/0x1c0
> <6>[   40.191656][    C6]  __delay+0xc0/0x180
> <6>[   40.191663][    C6]  devinet_ioctl+0x21c/0x75c
> <6>[   40.191668][    C6]  inet_ioctl+0xb8/0x1f8
> <6>[   40.191675][    C6]  sock_do_ioctl+0x70/0x2ac
> <6>[   40.191682][    C6]  sock_ioctl+0x5dc/0xa74
> <6>[   40.191688][    C6]  __arm64_sys_ioctl+0x178/0x1fc
> <6>[   40.191694][    C6]  el0_svc_common+0xc0/0x24c
> <6>[   40.191699][    C6]  el0_svc+0x28/0x88
> <6>[   40.191705][    C6]  el0_sync_handler+0x8c/0xf0
> <6>[   40.191710][    C6]  el0_sync+0x198/0x1c0
> <6>[   40.191715][    C6] rtnetlink: -- rtnl_print_btrace end --
>
> <6>[   42.181879][ T2206] rtnetlink: rtnl_lock is held by [2206] from
> [38181400013] to [42181875177]

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
