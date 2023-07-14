Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311F2EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKmPqGb1g30twwWqaJ5CUfJThJzoEqQ8H0HnZr1gDBk=; b=vJVFfHXManORB9DVdryhElyVX+
	o+39o5ef8w171Wm4PiAekT91Yacu7tXNlS3QoJH7JGz6cgES7V5oMZmcswsh5UnDjpkZ40P4Lx5OT
	a9RwlIzucoAILiMDMbfhlxs7aM7tJhEY8/y7Hqze/ReqTevmOwak7bmoeiiIm61l/APCxbHK6e7jo
	R8Ge3gizy3MRt8CSUEYSvxuGFHw2IylMLe/wqY+LeEOS/1FnZWwcZRHjTXIoxrOTfu2kFkAE6zXHL
	GdmNJ3rBQqwSLL3AUTXUdtaXSU75DgJCR3cGm200w531y56iemGMdhx7+nuAIMwoa9qz6bNEk5Byr
	3yLF5BgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKJ42-006Ily-1G;
	Fri, 14 Jul 2023 13:42:30 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKJ3y-006IkQ-0M
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jul 2023 13:42:27 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b6fbf0c0e2so29403171fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jul 2023 06:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1689342141; x=1691934141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKmPqGb1g30twwWqaJ5CUfJThJzoEqQ8H0HnZr1gDBk=;
        b=JVbrQ9XHrBarwjW6smOjpuQfehr7HlZKI1aPI45qO5NxlJLulfdIWmx79hksCqkAqX
         1tF6nWBXJdq92p4ytUVujUPXZVyNM0BD7hpfWsmpBtJ26/vJk8QwJ53TbSoRjsvwq2z7
         X2QZ9OCZaYFFCwr9olRkaAP4Za62lZv7AETBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689342141; x=1691934141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKmPqGb1g30twwWqaJ5CUfJThJzoEqQ8H0HnZr1gDBk=;
        b=K06qRnS27u2/B9h8z4rSqa/EtW+V5krMsWQy98g4SfWe1GrnpUBWknY7DeLXa4EisD
         2ZzKW/KJTs9MwpyQOuAX+qcNlPU+cWYigZxPLUDJwIxrgh8N8wMWsDrmuBabp/nOt9jq
         AhIZrW1ZROmXrPBrRrRJC2RLAE7fLegUkiqXs6omy6s6MfKoscY2JW3cA4DRFFLc18sz
         xqPjZ5NQOzwKByxo/85g/cMXR5lK59HJsaHn4lDJ6yWpWzb1R2oVMW/mBzDu0LuCuKI6
         LtKWkHzn33QdxlGrhYlPy8b0ZtcRaqftyI37/GTQdCnq0G5L23WjZldfytlsUU+w1xBM
         Rnrw==
X-Gm-Message-State: ABy/qLZ5fgEJNu4UxkvfqD0wKzuvsCNBqe7B6OfOC2mdGcogAJpJIz/M
	qphTcl1t25ChQTCERtwMPSb8bQZNSfrZfGadSDh13g==
X-Google-Smtp-Source: APBJJlH1WlIL+So7XPu4cswA6dYrMzMWL7p+KH+gVJRpdkuvvZwGD/w94Pdv9W6rq0jyEEhBOw2A3nnL6lODP8EX8Ss=
X-Received: by 2002:a2e:3c0c:0:b0:2b6:d137:b61c with SMTP id
 j12-20020a2e3c0c000000b002b6d137b61cmr3810480lja.39.1689342140935; Fri, 14
 Jul 2023 06:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230713003201.GA469376@google.com> <161f1615-3d85-cf47-d2d5-695adf1ca7d4@linux.alibaba.com>
 <0d9e7b4d-6477-47a6-b3d2-2c9d9b64903d@paulmck-laptop> <f124e041-6a82-2069-975c-4f393e5c4137@linux.alibaba.com>
 <87292a44-cc02-4d95-940e-e4e31d0bc6f2@paulmck-laptop> <f1c60dcb-e32f-7b7e-bf0d-5dec999e9299@linux.alibaba.com>
 <CAEXW_YSODXRfgkR0D2G-x=0uZdsqvF3kZL+LL3DcRX-5CULJ1Q@mail.gmail.com>
 <894a3b64-a369-7bc6-c8a8-0910843cc587@linux.alibaba.com> <CAEXW_YSM1yik4yWTgZoxCS9RM6TbsL26VCVCH=41+uMA8chfAQ@mail.gmail.com>
 <58b661d0-0ebb-4b45-a10d-c5927fb791cd@paulmck-laptop> <7d433fac-a62d-4e81-b8e5-57cf5f2d1d55@paulmck-laptop>
 <058e7ee9-0380-eb1b-d9a8-b184cba6ed53@linux.alibaba.com>
In-Reply-To: <058e7ee9-0380-eb1b-d9a8-b184cba6ed53@linux.alibaba.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Fri, 14 Jul 2023 09:42:08 -0400
Message-ID: <CAEXW_YQCpUsPz24H4Mux6wOH1=RFRR-gsXLFTbJ37MgUJo3kCw@mail.gmail.com>
Subject: Re: [PATCH v1] rcu: Fix and improve RCU read lock checks when !CONFIG_DEBUG_LOCK_ALLOC
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: paulmck@kernel.org, Sandeep Dhavale <dhavale@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-erofs@lists.ozlabs.org, 
	xiang@kernel.org, Will Shiu <Will.Shiu@mediatek.com>, kernel-team@android.com, 
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_064226_149933_8348559D 
X-CRM114-Status: GOOD (  24.04  )
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

On Thu, Jul 13, 2023 at 11:17=E2=80=AFPM Gao Xiang <hsiangkao@linux.alibaba=
.com> wrote:
>
>
>
> On 2023/7/14 10:16, Paul E. McKenney wrote:
> > On Thu, Jul 13, 2023 at 09:33:35AM -0700, Paul E. McKenney wrote:
> >> On Thu, Jul 13, 2023 at 11:33:24AM -0400, Joel Fernandes wrote:
>
> ...
>
> >>>
> >>> >From what Sandeep described, the code path is in an RCU reader. My
> >>> question is more, why doesn't it use SRCU instead since it clearly
> >>> does so if BLK_MQ_F_BLOCKING. What are the tradeoffs? IMHO, a deeper
> >>> dive needs to be made into that before concluding that the fix is to
> >>> use rcu_read_lock_any_held().
> >>
> >> How can this be solved?
> >>
> >> 1.   Always use a workqueue.  Simple, but is said to have performance
> >>      issues.
> >>
> >> 2.   Pass a flag in that indicates whether or not the caller is in an
> >>      RCU read-side critical section.  Conceptually simple, but might
> >>      or might not be reasonable to actually implement in the code as
> >>      it exists now.  (You tell me!)
> >>
> >> 3.   Create a function in z_erofs that gives you a decent
> >>      approximation, maybe something like the following.
> >>
> >> 4.   Other ideas here.
> >
> > 5.    #3 plus make the corresponding Kconfig option select
> >       PREEMPT_COUNT, assuming that any users needing compression in
> >       non-preemptible kernels are OK with PREEMPT_COUNT being set.
> >       (Some users of non-preemptible kernels object strenuously
> >       to the added overhead from CONFIG_PREEMPT_COUNT=3Dy.)
>
> I'm not sure if it's a good idea

I think it is a fine idea.

> we need to work on
> CONFIG_PREEMPT_COUNT=3Dn (why not?), we could just always trigger a
> workqueue for this.
>

So CONFIG_PREEMPT_COUNT=3Dn users don't deserve good performance? ;-)

thanks,

 - Joel

