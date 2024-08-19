Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D3FC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIMsl1ookSA1DyUgN8UuW8SMlUC0glIxT4g4JKXaVdU=; b=ETChyblaI9W9XPU3fMbKzYK2D8
	oUmeJX7aqtKNykVKiPjecPxRs2V/mf1mADltGDRqNcoKn/z6FwgdJsXAwU0QaZGzlqeLEOWpgTgRS
	iWuEghQdi/9wqs+ahIC3EWRIdYuTRQ/NY4t2IkrBrGO5YGALOxGTcjTPzNuonbF1wCUMU34BIo2eA
	PluX6u4iE02aLurdSL6HAUM5O9AogMV7JNVvYMkHZuyAvTYmWKsj51VF0IPT9W6u7EhTNANiAVgae
	BRXfJlXAQRq2GrC8vFzLXBtAsEpuffQTaM6fOQO9JOTdDBOQugXaa8+14TytpP7Qx/cVUyS/Zfd27
	U0aHvy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfySZ-00000000uf8-1y4Z;
	Mon, 19 Aug 2024 09:13:55 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfySV-00000000uZx-0Oks
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Aug 2024 09:13:52 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so6081201fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Aug 2024 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724058825; x=1724663625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIMsl1ookSA1DyUgN8UuW8SMlUC0glIxT4g4JKXaVdU=;
        b=4QbSrAvhPB+djUWacowSJHZsKwAIDOJgHjQXByGdwiFkARQ1Ayn0YuLl99CF77bmQY
         x4ZAgRHcVja0ZzjMtP4GLq9lU/96LoNykegwPJTmMWpwMEWqvpcM6dqjZBsd9j4uo6mj
         hIO8tzxHV9+deD5sPcR26uzc08c4tJhb/C1M3irUkXjCBNzubU4+A5jJHzJOmPoZedN4
         nHtzKiwRdu8xMGHWZjRd4BPPuNp2l0gjsrSpLh1lhSf77cSHXRnwNZmXyJSeRyReRfX2
         orjDRD5vxX9s9SXQw/eFGbPAh5+KTWxC/EePJX6UMBLQkIYcty+89Hemm3VQRoP31ujR
         5OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058825; x=1724663625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIMsl1ookSA1DyUgN8UuW8SMlUC0glIxT4g4JKXaVdU=;
        b=Ey5ze9+i8P4mBKXDetWVeTcCCVW1c7JTuKa9z6gFd7ZZbM8BUaWgBMxXmGv9WorubE
         5SQPMd9Dlzyg64LPl6xGvvOD/6E1eHJdXNS22RRPw+odtSYMRWP5kRgmQLq6w6fcb0Fh
         fCVzGYmRNueSJBFPfYc7XdwEuOhz8pW2RLCr8XgkTWKtmg+nVSURDOml1NH3dZJLEquY
         ckfTalejm/XqzcFOpKDrAx2Ql3lQY+ibRuiGzwBuhLoxym1EnIMYmHbf+6BAtkZ4fmGR
         BKQbmmLn8mHCszjeKwrwHaA3iYqPG5IvWrtz/uCoOrI4+icUjzdWufSWgNVikCZ8IMUc
         FAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX80a6vx8wic5YYHW8lPAq5GtPXkl/H3FQas0mvft+kBluwe621a/C+bXAYdYJGUh7TvmcR5DPY4uOpB9g+lGdJZ0YJlbfgzhgg572jP89zGtN9
X-Gm-Message-State: AOJu0YywJocibMxemiNkq8dOM806XyigiA9obilGKJPFdM5jsN+EJ4XD
	Dmofby6+fIIbhQorO4/O90v8IbaLxfpcrX43F9WQtkVS2qyLEfOG5TFhczakk+JwYWePXU8GncK
	9geBo9HuugclGlUbkdxPhdXmal58ABP4H0Acd
X-Google-Smtp-Source: AGHT+IFOZG4WMA3ByLVTlGA87b7bgPZg8l2Jlfvs7m1bi8xHPKgfIE9xY9QB2B3aIl9fWxotTq3p7F1FeB2f8sINkIQ=
X-Received: by 2002:a2e:742:0:b0:2ef:2677:7b74 with SMTP id
 38308e7fff4ca-2f3be5f02eemr74527771fa.41.1724058824221; Mon, 19 Aug 2024
 02:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240819082513.27176-1-Tze-nan.Wu@mediatek.com>
In-Reply-To: <20240819082513.27176-1-Tze-nan.Wu@mediatek.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 19 Aug 2024 11:13:33 +0200
Message-ID: <CANn89iJ04bbS4iaB8dpgbtZTWF_JVt1JawwxFah16zN1aj3HWw@mail.gmail.com>
Subject: Re: [PATCH] net/socket: Acquire cgroup_lock in do_sock_getsockopt
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>, Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, bobule.chang@mediatek.com, 
	wsd_upstream@mediatek.com, Yanghui Li <yanghui.li@mediatek.com>, 
	Cheng-Jui Wang <cheng-jui.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_021351_177267_34A3DE78 
X-CRM114-Status: GOOD (  31.18  )
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

On Mon, Aug 19, 2024 at 10:27=E2=80=AFAM Tze-nan Wu <Tze-nan.Wu@mediatek.co=
m> wrote:
>
> The return value from `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` can change
> between the invocations of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and
> `BPF_CGROUP_RUN_PROG_GETSOCKOPT`.
>
> If `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` changes from "false" to
> "true"
> between the invocations of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and
> `BPF_CGROUP_RUN_PROG_GETSOCKOPT`,
> `BPF_CGROUP_RUN_PROG_GETSOCKOPT` will receive an -EFAULT from
> `__cgroup_bpf_run_filter_getsockopt(max_optlen=3D0)` due to `get_user()`
> had not reached in `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`.
>
> Scenario shown as below:
>
>            `process A`                      `process B`
>            -----------                      ------------
>   BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
>                                             enable CGROUP_GETSOCKOPT
>   BPF_CGROUP_RUN_PROG_GETSOCKOPT (-EFAULT)
>
> Prevent `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` change between
> `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and `BPF_CGROUP_RUN_PROG_GETSOCKOPT`
> by acquiring cgroup_lock.
>
> Co-developed-by: Yanghui Li <yanghui.li@mediatek.com>
> Signed-off-by: Yanghui Li <yanghui.li@mediatek.com>
> Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
>
> ---
>
> We have encountered this issue by observing that process A could sometime=
s
> get an -EFAULT from getsockopt() during our device boot-up, while another
> process B triggers the race condition by enabling CGROUP_GETSOCKOPT
> through bpf syscall at the same time.
>
> The race condition is shown below:
>
>            `process A`                        `process B`
>            -----------                        ------------
>   BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
>
>                                               bpf syscall
>                                         (CGROUP_GETSOCKOPT enabled)
>
>   BPF_CGROUP_RUN_PROG_GETSOCKOPT
>   -> __cgroup_bpf_run_filter_getsockopt
>     (-EFAULT)
>
> __cgroup_bpf_run_filter_getsockopt return -EFAULT at the line shown below=
:
>         if (optval && (ctx.optlen > max_optlen || ctx.optlen < 0)) {
>                 if (orig_optlen > PAGE_SIZE && ctx.optlen >=3D 0) {
>                         pr_info_once("bpf getsockopt: ignoring program bu=
ffer with optlen=3D%d (max_optlen=3D%d)\n",
>                                      ctx.optlen, max_optlen);
>                         ret =3D retval;
>                         goto out;
>                 }
>                 ret =3D -EFAULT; <=3D=3D return EFAULT here
>                 goto out;
>         }
>
> This patch should fix the race but not sure if it introduces any potentia=
l
> side effects or regression.
>
> And we wondering if this is a real issue in do_sock_getsockopt or if
> getsockopt() is designed to expect such race conditions.
> Should the userspace caller always anticipate an -EFAULT from getsockopt(=
)
> if another process enables CGROUP_GETSOCKOPT at the same time?
>
> Any comment will be appreciated!
>
> BTW, I added Chengjui and Yanghui to Co-developed due to we have several
> discussions on this issue. And we both spend some time on this issue.
>
> ---
>  net/socket.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/net/socket.c b/net/socket.c
> index fcbdd5bc47ac..e0b2b16fd238 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -2370,8 +2370,10 @@ int do_sock_getsockopt(struct socket *sock, bool c=
ompat, int level,
>         if (err)
>                 return err;
>
> -       if (!compat)
> +       if (!compat) {
> +               cgroup_lock();
>                 max_optlen =3D BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);
> +       }
>

Acquiring cgroup_lock mutex in socket getsockopt() fast path ?

There is no way we can accept such a patch, please come up with a
reasonable patch.

cgroup_bpf_enabled() should probably be used once.

