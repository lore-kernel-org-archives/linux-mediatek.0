Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523D0C71136
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jun 2025 21:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJBYievKNfCEHacHMV9ZIC+ridMvs+KwmtxKpRY2HrU=; b=HFN6TsPMVkhw6l1zBB+yWl/+rc
	MmOtYld60218Fq5KWcHUhhoMXCcFMP18pmcREPi1wo6OBSKx6XWivkUkvUd0FXZfTltUHaE3xhh7w
	fvX/nrzke7CZX0GEml/v3mJFy2cmA2ClhxFO6HoUj+CWMhhZWlNO8PTSMKVCi9JiN/hnS0hV+aELL
	HsnVbqCJjT/utMgrTR7Kq5eMKQAIcjpw3JZtyISU3NqwCG8DYl8izKlvIcRjbJHhRn15PV90w5Vmj
	yzIYW8rbD/r+O3vRYHVUpOl08tcth6ebQISYb7vq70OhkYBuBrJ9mO5QLwrzHVsBHAat7lIyRbM7o
	G9Ifxgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdTh-00000008OhK-288L;
	Tue, 17 Jun 2025 21:04:21 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdRt-00000008OX9-3bWn
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Jun 2025 21:02:31 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553b82f3767so3857333e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jun 2025 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750194147; x=1750798947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJBYievKNfCEHacHMV9ZIC+ridMvs+KwmtxKpRY2HrU=;
        b=PpJWVs2chJdjaEyvp5ywsiePDEX1ILuBG/uUzol6Q9LC/CvFeqMRPC5qZneBIEKFyl
         9vUJ59t05NKYuYM88Vh8cCWsrR683CXIvXSPo1ZXT8vBG8oNFEQau8Epnkzp6ud9LIfB
         6ZTJGNXQ364+0uJZjn/oWzNb1zOzO70t+RuygSTqUd5nFsk1BQhMBGo7T/GhZM3q1+0E
         KunS1hu2vYgumIVSQR3zJ/oXCfTWzWWv+c4Tgn9hLIe9OlmfEHn9pvQHBrUGRQ7jdNP9
         8kd3O6Nq71p91qmQWFKhK4r6A3yGXSd6o9ibeXG7Le+nPuF4Eueex7SRsqCovT5qQ1J+
         tXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194147; x=1750798947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJBYievKNfCEHacHMV9ZIC+ridMvs+KwmtxKpRY2HrU=;
        b=MidiG6wRIYY+C7YUTEmCEDUirrvWFnQ41V2ULv4aR5O1wMbJaj4uV+fO9LYN4TnW8d
         npWvh9vWgGxvZgUneUbFWjeHdwMvkHy8KIdaHoZiWCNzMqnmjIgH/mT1vhj0UN/go2Uc
         9Lom2XKcmx8OWJqfD7rTMRCUrpLvfDX63EyJnNSFpPY8+L8Lf3VVMEA9MBQB26sin1dD
         UCkq0ZTLN/ElXC/WhcYv+R3fMU5qeIeGFkVQzG9bYePkc2AoWCCYge7lRP4oZsaGVc1O
         deQ7iqIHI9pT9bHV+g0mbzskgQOIbhKQyrnbviV2FRN9DsWtnaPKwEbWkXbI517sUwHI
         E2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWnVHT0e3NypQ82KgQGKm5FKXdlzhG7R3HSBlQmbTv1Oo459xP4YRc4J3f6gsko9Z1HwvLSnef861rMwy+FLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmEDTB1uQ4PberkO1xkgGX/Oqk151f51a1KxYJn0KLeCcaQdz5
	2ZKwEhGh4OjKiOdh9BvQ8ykOZfEfSYZnTRh+Ch2xJww/HUy1g9k0N/cr/9hTqPjPilxF2CdON8s
	zVilxKxUwHYwjOFU78vH+wYA5WQsK4e6UUTca5ps=
X-Gm-Gg: ASbGnctum2eWbEgXvlYTSaxgUnO3lA2wA3DbIvFZGR5CSu781pbbNccQqYI8ovmzoJx
	R6ckDfDCv5gGg7XsELoJ1Sz8KJoUj3YAV22H4jxJ9J32SQ7+l/QLsbwOReYQTarTZgL5ph07VyA
	hcI/rtJigz3lFf14UJ29OiuH6fU1WaouYa0BXfe6ovmyiZPQcpqx49mJH6c7FkR7lIaN6C/B0=
X-Google-Smtp-Source: AGHT+IF7sTQYGGBwCF4kAUzw/HchYbiway7musm8Os50fNb5cA76yIicDTBJe181wiAxG4715hg2/8AO/GJeuaxl92c=
X-Received: by 2002:ac2:4c41:0:b0:553:37e7:867b with SMTP id
 2adb3069b0e04-553b6ee8899mr4611437e87.31.1750194147074; Tue, 17 Jun 2025
 14:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 17 Jun 2025 14:02:14 -0700
X-Gm-Features: AX0GCFtWGhwas8ObpV8SSgSSLy0WEYla_bnrUoClImFq7kWv5WAqODjqVFnEkwI
Message-ID: <CANDhNCrUtLCU86hNk4qyfbqn9eXsmbzgzJCxYmXGRCko0r=VbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] sched/deadline: Fix dl_server runtime calculation formula
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
X-CRM114-CacheID: sfid-20250617_140229_900045_59990737 
X-CRM114-Status: GOOD (  24.22  )
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

On Tue, Jun 17, 2025 at 8:54=E2=80=AFAM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
>
> From: kuyo chang <kuyo.chang@mediatek.com>
>
> [Symptom]
> The calculation formula for dl_server runtime is based on
> Frequency/capacity scale-invariance.
> This will cause excessive RT latency (expect absolute time).
>
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
>
> Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> scale-invariance defined as below:
>
> Frequency scale-invariance: 100
> Capacity scale-invariance: 50
> First by Frequency scale-invariance,
> the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> Then by capacity scale-invariance,
> it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
>
> So it will scaled to 238,418 ns.
>
> [Solution]
> The runtime for dl_server should be fixed time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the dl_server.

Thanks again for iterating on this patch! I've got a few minor nits below.

> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
>
> v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediat=
ek.com/
>
> ---
>  kernel/sched/deadline.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..f68a158d01e9 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1504,7 +1504,9 @@ static void update_curr_dl_se(struct rq *rq, struct=
 sched_dl_entity *dl_se, s64
>         if (dl_entity_is_special(dl_se))
>                 return;
>
> -       scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se, delta_exec)=
;
> +       scaled_delta_exec =3D delta_exec;
> +       if (!dl_se->dl_server)
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se, del=
ta_exec);

Just a nit, but would
    if (!dl_server(dl_se))

be a little cleaner/consistent with other readers?

>         dl_se->runtime -=3D scaled_delta_exec;
>
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

I'm a little confused on the conditional here. Is
fair_server.dl_server ever not true (after the first call to
dl_server_start())?

Also, in the discussion on your first version, it seemed there might
be a need for different servers to have different requirements, but it
seemed like fair_server would always not want to be scaled.

thanks
-john

