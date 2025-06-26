Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C6C77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jun 2025 05:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ixr34CRuFwoG6PvhFrZURvWLjuli1tb6auMPGQGYXo=; b=hNGVw5W66Qf0zH/9ebcLloWiel
	welXNamguZcOSi+DzwFzeCavCAMsnop8tURlbxLNuyRFdPaBNwQEN4Acosla80WdCLsvqIRDuRZss
	Xhw8UA1GI/ttCHJgxRUCrhx5p2y9877FqMzh3JT7aND8uMqPwCfnbqB7HsSYJnEZwjPqF9IWeY8a0
	pFKVxP+iR4KOnTgrNvvpmSzYPBf0e/QukYAoz/r88tuMzkHaZ6OZH3xEljXqkkPuMBlR7ff0fhAiI
	PO1JF/8/iZVkG67gA8D8BtDxVn1IQqp2ZALDCD6AvU+xXWWNtSAs8j5Nq+3tFvkurcLUaQv692jq+
	5EGLyqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUf9B-0000000Adx3-08nS;
	Thu, 26 Jun 2025 05:27:41 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUf6s-0000000AdpL-0lRl
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Jun 2025 05:25:20 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553b584ac96so607796e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jun 2025 22:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750915516; x=1751520316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ixr34CRuFwoG6PvhFrZURvWLjuli1tb6auMPGQGYXo=;
        b=itHuyiO8V8Jomr2spYPCQs7850bwLvSR2JYPECoRxcwGMZzbPgxYVQpVbh4XeR6fsP
         1UAJxeaJkcA2lXXnUE77ZXVyinOGNKWC6ODbKA3sUlSnSAjGv3rt/wRKNJRSK/VCNSFf
         dZYYGFE4CiPsUVd7xdpTIPTeAsReLXY0ib46cXRz2EQYrdgMUKU5NZ51PDsRMSyPrRKQ
         nOataAcBtKwKLAjEJCNIpn4FFRTDtoqTeJ6LJd6TgdDP/LZxg0CmpYswj/kkm+RPE6WK
         UTHa3YYZougePFw8nvZ5nm5EKhDtw9qfyh5elbHQGLkp8ismr4rPtNmLUw/qiPlVXeZE
         /o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750915516; x=1751520316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ixr34CRuFwoG6PvhFrZURvWLjuli1tb6auMPGQGYXo=;
        b=oM3bisiaywDmEynRxCi/gAbFbmeBIixUI/2Xb1EZ880BZueMes7CET3wCSjzRIv93y
         0+2stWdiLE9+aPMy0BYKe0dsXIj3pvJqhLkK9QUd+JE4trvth5eCNEU5I8xDre8uSfM5
         dlhZz7mRygRV50knlFuat7aoocydr/zTUDoCa/4RFuT5Gw9IODhoHeWDzqvC0u5DakKB
         WUUe23Csds4eY5R1TLdSRo4Nw74iUpQAO42pfBq2D/ijmZC15Ddi7zfnFq+XwNge3q1c
         zWcw3G1ixevwCDWP9EYJYmaCPR8Pcu9lfrIfOvFgcY39bmMva5q2dZIzUNqHhnl6N0CB
         aTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdbHhxZNTJ58hMlNuKLR6gWwVbR/Ns3sPcVi8BFOLSHyLpzcl6r9D0kXCQGuhcdTTJ4qHdhOKVVTwWY2M4IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgspUYpx+TJnaumVQCUgOAfmt0kkbcVPOJEwgHzYvSrhpkARY+
	dGTz3Zxh00X/XTT2F3KWiUI72unAWdTJVZs2Nzqb7vyiOQ167Fzo7xWvhYVnqa8PC62VgZ0JEiE
	RnlEQvAOuD7UDRDuH72YCk2wBG3hj9WFHFftNijw=
X-Gm-Gg: ASbGncv94jrYntd/iNdI0PbSW7o/zcZk88TYk5XHKzKuo1NtV11P55mj/79EvtCCHoS
	FzNdKoA6K5G5J774kIll9cBBTy5HenJi9J0J37cvEafqygZsuU8LF3wSRdxTEozrtIp+ox+EVx1
	8gt+YtyzhkWjmUM0TkIADa8pSCe/hlsUyqAwiDDcUppq28CFGlDqeZO8QUQlI48JcKX66fNLqz
X-Google-Smtp-Source: AGHT+IGodguDEXCNroFB1rkVwfUyXnwlhYIj4o/5DqnlD+lqXFzy5P/tRol06d9uCArjELEt3Fyvfk5CURCo3xl53cU=
X-Received: by 2002:a05:6512:2c85:b0:553:2edd:a7e0 with SMTP id
 2adb3069b0e04-555028b2014mr893010e87.16.1750915515243; Wed, 25 Jun 2025
 22:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250626030746.2245365-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250626030746.2245365-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Jun 2025 22:25:03 -0700
X-Gm-Features: Ac12FXyLVy8PiJFpc0O5wjSoIq1ZDfueOIQeT5UYqek1YBjnhVpxXNtpqkY_jhA
Message-ID: <CANDhNCpNZd+s9+ZXU=+4t3CyV=7weFsbWQEx2=M9yphx6szt8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] sched/deadline: Fix dl_server runtime calculation formula
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
X-CRM114-CacheID: sfid-20250625_222518_240974_9817FE69 
X-CRM114-Status: GOOD (  32.68  )
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

On Wed, Jun 25, 2025 at 8:08=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> [Symptom]
> The calculation formula for dl_server runtime is based on
> Frequency/capacity scale-invariance.
> This will cause excessive RT latency (expect absolute time).

I appreciate your symptom/analysis/solution markers, but they are a
little unconventional for commit messages, so you might consider
dropping them.

Further, you're explaining the cause of the problem before you
describe what you were seeing.

I might suggest rewording as:
"In our testing with 6.12 based kernel on a big.LITTLE system, we were
seeing instances of RT tasks being blocked from running on the LITTLE
cpus for multiple seconds of time, apparently by the dl_server. This
far exceeds the default configured 50ms per second runtime."

Then you can get into the analysis where you can state as you had above:
"This is due to the fair dl_server runtime calculation being scaled
for frequency & capacity of the cpu"

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

This part is all good, but you might want to make it more clear why
the smaller scaled "runtime" value here results in longer delays for
RT tasks.
ie:

This smaller "accounted runtime" value is what ends up being
subtracted against the fair-server's runtime for the current period.
Thus after 50ms of real time, we've only accounted ~238us against the
fair servers runtime. This 209:1 ratio in this example means that on
the smaller cpu the fair server is allowed to continue running,
blocking RT tasks, for over 10 seconds before it exhausts its supposed
50ms of runtime.  And on other hardware configurations it can be even
worse.

> [Solution]
> The runtime for dl_server should be fixed time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the dl_server.

I think this can be stated more simply as:
"For the fair deadline_server, to prevent realtime tasks from being
unexpectedly delayed, we really do want to use fixed time, and not
scaled time for smaller capacity/frequency cpus. So remove the scaling
from the fair server's accounting to fix this."

> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: John Stultz <jstultz@google.com>
> Tested-by: John Stultz <jstultz@google.com>
>
> v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediat=
ek.com/
> v2: https://lore.kernel.org/all/20250617155355.1479777-1-kuyo.chang@media=
tek.com/

Please add a "---" line above the version data so it doesn't get added
to the commit history.

> Change-Id: Iaaa1ec78f405586c22ba56230ef1143206daa2d0

Also no Change-Ids in upstream targeted commits.
./scripts/checkpatch.pl should warn you about this, and its a good
idea in general to run that before submitting.

> ---
>  kernel/sched/deadline.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..96a21f38fcc3 100644
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
> +       if (!dl_server(dl_se))
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se, del=
ta_exec);
>
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

I still feel like these lines don't make much sense, and it seems like
they could be dropped.  When is (!rq->fair_server.dl_server) true?

>         rq->fair_server.runtime -=3D scaled_delta_exec;
>
> --

Thanks so much again for finding this issue and resubmitting this
patch! I really do want to see this land quickly as it addresses a
pretty big issue.
-john

