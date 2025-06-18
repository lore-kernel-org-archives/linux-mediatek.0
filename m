Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F9DC7115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 21:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmNihe7PTzgHY5aMiXa0EoOwpOW0xdgqzA0ywQIsBWs=; b=qqrjmV77pTLfwL/50SJsny81fp
	+hzncaZuh1VGEGLpkI835E4oMk3WhAvw7E7xAjh8cvu7qcroWJ2aHPgckxCa3bECgmdQSc+yEqcxo
	dE1+RAVPBHjGSKZNhF3VkPxw1QVsrlgKuHNNBqW+iUyLhMmeYe9f4I1ABq+alZbjCNXl239P1fMa2
	vgnq+T+Mc/c9do3MbiVvHhEr0+hyFZhXzjqRtXrrlJAIgLuIgfzIZUyv8H9R6pl3zjHI60e5w/zzq
	dLwyRGhYBvFm8SdBeSwFea9oBFSdnoWrlxyZx0NjpI7y9eB3AZqugPNnUDU1N2hmuwEf7RCFpna/N
	w6UQ4uSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0au-0000000BT4j-0RC7;
	Wed, 18 Jun 2025 21:45:20 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0ar-0000000BT3q-36Va
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Jun 2025 21:45:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553b3316160so51863e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jun 2025 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750283115; x=1750887915; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmNihe7PTzgHY5aMiXa0EoOwpOW0xdgqzA0ywQIsBWs=;
        b=bV6001+NmEvmZvinNj1xpt4gJmE6qTFKw4JJwyEi37ipt2HFTdcKN64+byz6bnnNXW
         CZr6ipJJcFTGUZrMc88Td06Jq7osmCrON4bOovJ8kzoL0xwJ0oO3V2jFQ5mR7Mg1KNNg
         iGRisiu7Q9tDJECaqKSon6NhkiqpLekx9vlSlvWHgZOgM5xlaR8CudL80EahnAe09eLD
         Mp7H1abybjtrwtIElKwHTkEWQKw5Mu0IvWRY/dMWCJB4G7ZONAcx5JJ+HNcvVN0UwyZl
         Mi25tyK7U/6ZeMbvWdA1HB2UJ/Ry3I5/5KA9z6LHaRsz7/H93YM22D0IKWmLlaoDtzXk
         ZCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750283115; x=1750887915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmNihe7PTzgHY5aMiXa0EoOwpOW0xdgqzA0ywQIsBWs=;
        b=pyCADe91Y5iOXc2UNt/UBgaOQ07woVlAkIMIw43eokyDB5oc6N0ATkBHeJOTNyevAd
         0yfrWVd8htBwtNQ5I51xIKctoHoxGRR8TQ4czbH0smNzcArFelmYFL5arHU+mt/pjJlq
         qM5fRXoDOYMyGH701gPpK1UWS8i7s1dP1X+kymndX7U0Mc5o1X7uWCfxsRHq4nTwOaul
         gnjBfaZ2NsTGTOqYG5SwJljKvdemOIj7GnwscXFBSRTGg5mLhkt85rqcs3P9g/oi7o+P
         8JMpVR0nMQSfGtwfTKEtRTZxFzGT2YQRisYgJxBENV4DcNZMIk69smnBGl91i4AoB2hT
         1L2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUq2ydh1mRGURrn/8KdYbrEDaZD0KldPwBULmjcx8ClBOpuWpVmdFKsEQb6deGOgdN1w++ZJ9qDyZB8w7VjdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyguBCo6yAjZaKq4ZXGiLf5t0GJdH+UYIMJOQ6xaJpH3ViEd9FX
	c5w6ndk9zNNWCtjdw4pRmfkL3vxrbRQfbw8DMWrlpz5TYJXfOgeFN3TkjgWOsNVk1g65OcPp1TP
	/fW2qnSzs4yjVpB9NRhZS9Z6u1KmlYqJVmJE299k=
X-Gm-Gg: ASbGnctliID+zNLJ0CpidRIprL53pUmjKz5f+DdnBu0sO5bOYxD03Av7Kv02+ApKrBZ
	xmXqKUFUY68a5KLGOcWPgW4UOpIfWa3ygp5LF78B41dump7rhiRWc7zrLBhTy+GjyDIGvf9LkQ7
	ggF8qTULsIPPyfNHrGmduElEGO5jhbY19EQA0P7jqZBCMcEov009rQ5vztLCTkaJGNzeeEUyJO/
	gFCZh+wTfs=
X-Google-Smtp-Source: AGHT+IGRdPWvQ3bVP/uq5rZZPKY3AdMDW1I/LzLahEs6dluATjog/cp3WTI9a5x6a4bbS7Knu1afIVea+V+1AgDHScw=
X-Received: by 2002:a05:6512:b97:b0:553:241d:4e7d with SMTP id
 2adb3069b0e04-553b6f25d30mr5275016e87.42.1750283114922; Wed, 18 Jun 2025
 14:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 18 Jun 2025 14:45:03 -0700
X-Gm-Features: AX0GCFsOSiqOdRp1Co0Xlnr48njlbsSSxatT1GBZqp64HQBE2esynPFEN6b-XQ0
Message-ID: <CANDhNCoMUrZppodAa0bAdds=M3S7u3VqAmiR_Qd-ow=kxDD9=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] sched/deadline: Fix dl_server runtime calculation formula
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"Team, Android" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_144517_773251_0F3E6648 
X-CRM114-Status: GOOD (  20.18  )
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
>
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
>
> v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediat=
ek.com/
>

Coding nits aside, I put together a quick test that affines to a
single cpu a SCHED_NORMAL and SCHED_FIFO spinner task to illustrate
the issue.

You can quickly see the requested 50ms/sec dl_sever runtime on the big
cpu, ends up being scaled out to 323ms/sec, blocking RT tasks on that
little cpu for quite awhile.
  https://github.com/johnstultz-work/misc/blob/main/images/2025-06-18_illus=
tration-of-problem-dl-server-scaling.png

The wild thing with the example illustration of the issue above is
that since my test uses cpu spinners, the cpufreq quickly maxes out.
So it's only really considering the capacity scaling between the big
(cpu 7) and little (cpu 0) cpus at their top frequency.

When I capped the cpu 0 max frequency to the lowest available, without
the patch the behavior is crazy:
  https://github.com/johnstultz-work/misc/blob/main/images/2025-06-18_dl-se=
rver-scaling-with-cpufreq-lowered.png

Though the image alone maybe isn't as clear, in that case we see the
RT task once it runs ~650ms, the dl_server kicks in and blocks it and
any other RT task from running for over *10 minutes*!

And with the fix to avoid scaling the fair_server, the results looks
much more sane:
https://github.com/johnstultz-work/misc/blob/main/images/2025-06-18_with-pa=
tch-to-not-scale-dl-server-fixed.png

So I'm very happy to add:
  Tested-by: John Stultz <jstultz@google.com>

And hope this gets upstream (and -stable) in some form quickly.

Thanks so much to Kuyo and others on his team for reporting and
root-causing this issue!

thanks
-john

