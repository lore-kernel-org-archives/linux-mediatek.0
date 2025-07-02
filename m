Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4909C83038
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 03:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pCONnCH5T7GCdkrr2svC567N0fS4DbXVH4ChpdByoM=; b=iJNTBpjQXufJZ6FiGVbC47KGIW
	rfiWZ7OrPtQiIdpEh28v1jl6DGzpBdpcP+7IdIkmanAfwLE98tgVUcMM5wRl8gA/XiglCOneLAX7R
	lipb8QuWVuMo839rsqhQuIJBtjK8iLhFHzZuPsNBh0Dt7+7LWfoGQZsU2eCCs5+pZmQ5ubIzqxtXf
	dWe+Wpax3b7Pt1F2wItCKWZia04uh7xF/EHc0n8lgTUanXacoz1vIKAE4gBkuH7KqX3NPKKhNLa5i
	mWYyOdGOsX+rDSqQZoAQoN2PEqj2qaA4l5ba2Acup1MufBPV16C4FfO+0HtIzbNkIRvuEbCjSxiQH
	QXBElQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWoBT-0000000789f-3CJs;
	Wed, 02 Jul 2025 03:30:56 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWo95-000000077uP-05zt
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Jul 2025 03:28:28 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553c31542b1so4589272e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Jul 2025 20:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751426904; x=1752031704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pCONnCH5T7GCdkrr2svC567N0fS4DbXVH4ChpdByoM=;
        b=M6rOAJamDP+fimSFNhh88+rv7/OJ2txVRA9qJWJGA2vnxmwy2fDejOZTMdJNSBwldZ
         EfVTin9weFSQDK+d4XiT8ufz9d+eoMYLNVQ7woJVSIfRQeIyUuWtFTxvWYcdhcN2Tp/l
         PLBArNsQHT75L20IwOETPV4aAeOCUJInHdGv3ggfinwc9eau9pLucY7OenBYkyrwfBvE
         klY7En7ItamjP3ZTB95eXghFfyXCUZrAbvc4oHyYVnHGQ4b2bWYkMo5uwT0i6ISbUgNm
         dIqQYhwUKEms8FN0vgGmgnddvuAsxX82gSyx2xAcTikIuJdI4o09UG3Q12B/iuAlHvaM
         5+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751426904; x=1752031704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pCONnCH5T7GCdkrr2svC567N0fS4DbXVH4ChpdByoM=;
        b=KQ85WmCzYsrJ3hEhspLn6y0Lg9obOo+kgGqurex5TSIbPwv+L3VSyjuCBXXdjaCZvY
         HkIjkgLAyxNDMZJAaaZqgP8avhLix/Hm12K5vqQdaTkWXEZDXanVdSNjGOYKHx+h3gGX
         5fXiNaLeEQyk7M30GqQ/oLcZLVLxh7/iXEX4tikaNTZxBAgtXSuFEnKoiSeSwNO0sL3k
         8z2kr/mSecUJZG1lk33FXvfeDIcMUPzQWv4hHK9FzGogEsZH/IIjcpB8o3VFxe0tWAsQ
         2bzcQ5yIsFlYYOtgyuqfiaagRYZLqtUTse+U8BZk6wW7koU0YIyV4vDsA1CVCB3p3Cdx
         PR3g==
X-Forwarded-Encrypted: i=1; AJvYcCVUu3SQRJWtq39CJHHGvPuHmAeqXrXFWd5e4E66NuftgkFks/5mSXV7g4tz3QfDdBY8SLAo2iVGVJFR2jyHlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2hbmOzIMB9VvT5dwCAgc6hQeumLF5pJgnh0P/5xTWok0mLf+w
	b3Y4VWtjZI6vblpMx3VFiPSD56UukLMT+OeXbLwm/5PmteJ8uRMorPOmeqA5Z8XU+TynK+J7u5V
	8p9RVhlZUeDkYRLs/dlL3SF8yAVFwygL6cZX9moU=
X-Gm-Gg: ASbGncuADB3tttdDaxm72np9XwjE1TtcNEvchht72BwHAbdMj/vqssPfqpwg6MknCy8
	0ik9kdVbrnZW6LWcLogJ0WiUrVtj8VGk7s/QQgBIsysx7fzk8l3acfydsbQuxaPLJp+FwhtZ5LJ
	XndVboOvKH+iCq0fdkXBRsWwU5jy6ensL+nBI9QDQzCFmN3eBp7e7yqRtPULNByI2Dpvqhk1Y7
X-Google-Smtp-Source: AGHT+IG7apXbcjCcHGp0kZ92UX+gym5ki6TPagVcyHMy+qG0QMpO2pvfDEUg2Wlq7uVoA/TS/9vt31DS/gX08hJFeHA=
X-Received: by 2002:ac2:4bd3:0:b0:553:5283:980f with SMTP id
 2adb3069b0e04-55628388443mr413354e87.51.1751426903821; Tue, 01 Jul 2025
 20:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250702021440.2594736-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250702021440.2594736-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 1 Jul 2025 20:28:12 -0700
X-Gm-Features: Ac12FXwwpzKziB_llADT_ppGncI36EFdCzpapMYlOJvYbZhU5k4G0Rc4-PwHlfs
Message-ID: <CANDhNCqYCpdhYS9afdKeY34Bmw8MXyqKWCSTxOZNLTjYrUaVXg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] sched/deadline: Fix dl_server runtime calculation formula
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
X-CRM114-CacheID: sfid-20250701_202827_057286_5C8ABC29 
X-CRM114-Status: GOOD (  20.98  )
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

On Tue, Jul 1, 2025 at 7:14=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com>=
 wrote:
>
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
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: John Stultz <jstultz@google.com>
> Tested-by: John Stultz <jstultz@google.com>

Thanks so much again for the multiple iterations here.

I've re-tested this and it still looks good.

For what its worth:
Acked-by: John Stultz <jstultz@google.com>

Juril/Peter: if/when you take this, could you add a:
Fixes: a110a81c52a9 ("sched/deadline: Deferrable dl server")

It would be great to get this merged and into -stable soon.

thanks
-john

