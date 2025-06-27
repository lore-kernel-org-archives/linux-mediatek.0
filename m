Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EBC7EE31
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jun 2025 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIyz0TyYX+Z3NqBUdZDf3ZSHxoRX7/bXEgMDfSI548Y=; b=giZR2Jn57X09KeZV9ftGesuPT0
	PCvWJtHru7ioGgvqyI63ZTcv0MRWPUUOF+QkjaswHP/CCsPHIEnOxQ9TlaVVgxVfMMifdN5DnvqYq
	UqMDoVrdn4vJmLVdEzRBvHUejrOtCU9YxW27hvhw4HeahuJd0c7PcycO5XUR+AApEIySnOYe44Neo
	dedbIroJb9OyxDCIuHEVQAs1XQVNQ3o8+YnxXevDmmj7d0z3r4xB4qN3HpIIi49ZCIWLbATM9jtYm
	k0jK2i6bWSwyq9ajBgGpCmpiBEl6qPahGrO+a+4Rmia4G8Q4yBG7MOR/Aks246V3DYbQV8TyFT9TY
	Llxl1tbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzBY-0000000DOEM-25yR;
	Fri, 27 Jun 2025 02:51:28 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUz9D-0000000DNuj-0yL7
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Jun 2025 02:49:05 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553b82f3767so1742560e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jun 2025 19:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750992540; x=1751597340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIyz0TyYX+Z3NqBUdZDf3ZSHxoRX7/bXEgMDfSI548Y=;
        b=OJn2LmL50WIuad0hrEaAiQeauyBljgdp7zo2HvgyHOvtahNmWzCo0QGpb/jtCZmKpC
         sMitrlbthMYH7IFwXjWDK/Vc1465cnqyZAQLTrParyhP61sSMZVeqSx2V5nDjJQoO7kC
         d3aUvmKkIM9jfkISIUg1U+IMWdesZ5e7fWnn8QqD84Xe1czAbWWyLkkLGeCd0TKll8gS
         uo2w2RvNOyF+XdW+fX90IA2HnqnKMD/mQLfGyhx56sIlQv4qo0OU9SIaaaqRD1EklCYw
         EO4u5RucM5N+SaXxeb8fM1M1gOA1+KFJMX/9GSk3Mkv3ECwLJtXD0fSjl7++bHEtVuoM
         82ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750992540; x=1751597340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIyz0TyYX+Z3NqBUdZDf3ZSHxoRX7/bXEgMDfSI548Y=;
        b=k1EIKEnT97CSFUnrbJZIRcWaVaL56tv6uz4ygDUl4Pp1vbqXnJfKg/PS8FQpVf7hnN
         pqd51pQWhjE99f+evIpYeiEo1j8NroOfC3OcYqaXk403kZh6ho9S9WL9JYsJJLJiUti2
         8wpm7hMSqQpknKWyFHPo6nU+hyVruHUApc3JSQPw+mN0T1uho+QGwbQTsZUayXOFjWzS
         N8Uf+iPRNWhjCNUsktKdcQU4vb0fPkmpDN2KXZQifEusSHECXiEu4msFMOb5vHk6TJjv
         UGu140ySKbJkBiuiDXsuY7pJkGDZYfQEzlT0lyNEcrMaP23eivQOCLn119/ZjAPoGEd/
         bvZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVujztucnluxOsp97jzfG05lsyNBjurAtl+2V0Uc/DZZcRsQUSl7iJZJuYh4jjmdGKEKqL89M/pK2RPQfb0XA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtMHamtt7rnK5Z8l1qSoIeNpH9ShOlEmS8yxRZHEWg9FNh55Ng
	SQaiMD8OE6QM39BVmvgp2iLdYqlVAj4D4BlVRe09aOgeZ2SFMjlxtTmK3LyDWglusucEVynVLqN
	zC0Kcyj3I2QLAow6Ec6JUN7bSmlAtmin5mplULiA=
X-Gm-Gg: ASbGncs82jxQvjcFJInwOet81kltx8JrCzY1ErWQC1qsB1YzevH/Ij1XymyX2qNqu89
	Uek2VxZfxB6uEiY3voTOAQLzVTa7+nyMbYv/yi1W5d2KjYzYqyViATekgCxTrPP3hwwylCKNwOu
	my9qvOlfKK3eo9+ZiDnqXISPOZFeJh4j6fdnzg5GGv3SLt4EfpDTy9qVDmobWs8Qapalz8PRiu
X-Google-Smtp-Source: AGHT+IEzF/swD5xaOdJR7lMJjb1yXBvdw4JiGquGN0u5dPeY58LAcd6ntfOPW/1JZJGrYX4JaKsPUJ8VGHh+iWR50cE=
X-Received: by 2002:a05:6512:4007:b0:553:5283:980f with SMTP id
 2adb3069b0e04-5550ba29ed0mr628392e87.51.1750992540108; Thu, 26 Jun 2025
 19:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 19:48:48 -0700
X-Gm-Features: Ac12FXwf59eyhe3NIP1HlmImClaDAHzqNeVDRK7bbuvKnPBO5OcLJhb39G9nTn8
Message-ID: <CANDhNCorm58L9CqHyNORgfk=++HkCttmyCkM23Pn8rXV7cF41Q@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] sched/deadline: Fix dl_server runtime calculation formula
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_194903_291571_54C4BBD5 
X-CRM114-Status: GOOD (  34.92  )
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

On Thu, Jun 26, 2025 at 7:28=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> In our testing with 6.12 based kernel on a big.LITTLE system, we were
> seeing instances of RT tasks being blocked from running on the LITTLE
> cpus for multiple seconds of time, apparently by the dl_server. This
> far exceeds the default configured 50ms per second runtime.
>
> This is due to the fair dl_server runtime calculation being scaled
> for frequency & capacity of the cpu.
>
> Consider the following case under a Big.LITTLE architecture:
> Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> scale-invariance defined as below:
> Frequency scale-invariance: 100
> Capacity scale-invariance: 50
> First by Frequency scale-invariance,
> the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> Then by capacity scale-invariance,
> it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
> So it will scaled to 238,418 ns.
>
> This smaller "accounted runtime" value is what ends up being
> subtracted against the fair-server's runtime for the current period.
> Thus after 50ms of real time, we've only accounted ~238us against the
> fair servers runtime. This 209:1 ratio in this example means that on
> the smaller cpu the fair server is allowed to continue running,
> blocking RT tasks, for over 10 seconds before it exhausts its supposed
> 50ms of runtime.  And on other hardware configurations it can be even
> worse.
>
> For the fair deadline_server, to prevent realtime tasks from being
> unexpectedly delayed, we really do want to use fixed time, and not
> scaled time for smaller capacity/frequency cpus. So remove the scaling
> from the fair server's accounting to fix this.
>

Thanks again for revising the commit message, this version is easier
(for me at least) to follow.


> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..96a21f38fcc3 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq *rq, stru=
ct task_struct *p)
>         if (delta_exec < 0)
>                 return;
>
> -       scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq->fair_server, =
delta_exec);
> +       scaled_delta_exec =3D delta_exec;
> +       if (!rq->fair_server.dl_server)
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq->fair_=
server, delta_exec);
>
>         rq->fair_server.runtime -=3D scaled_delta_exec;

As I mentioned earlier, I still don't see this conditional as making a
lot of sense, as I don't believe there is time when this function
would be called and (!rq->fair_server.dl_server) would be true.
And even if there were, I'm not sure it makes sense to scale the time
interval based on the fair_server.dl_server flag.

From a separate discussion, you highlighted that it might be useful
once we have multiple dl_server types, which may want scaled
accounting, but I think in that case we should use an explicit flag
instead of the dl_server bit to denote if the accounting should be
scaled or not.

So, since your patch is a fix for a pretty bad bug, I think it should
be focused on fixing the issue in the simplest and clearest way for
the existing code, and not be too worried about integrating with
future changes that haven't landed.

Then, as those future changes land, we can see how best to generalize
the decision to scale or not scale the accounting on a dl_server.

That said, the conditional is a bit of a moot point, since I don't
think we'll actually hit it, and I'm motivated to get the bug you are
fixing resolved, so I wouldn't object if this went in as-is, but it
seems like it would be much cleaner to just drop that conditional as
you did in the original version of this patch.

Thanks so much again for your iterating on this change here! I really
appreciate your efforts to both find this issue as well as to get it
fixed!
-john

