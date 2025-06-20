Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9367C7115C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jun 2025 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN1LA4ycWLYTHnDpp5XY9WIgVZkngojcPUNGmlqXWbc=; b=1aq7hWdsJBNQqykfrBg/2mTEso
	L+M1cBYc1FgBTqgA9SWO/kacG2Vobha3TXJNkMeZ3rdQ94nLJecYseA5/FCPj9OyylpRCroTGyrhH
	zGctFTb+rATnBnOrJj1mXPbx69p5HgIRE6bXqoFoMXNp18QYWxF7ndlYMgl0zHl90udTzqEOdlUjJ
	YfxFtJSyThgMd3OWQxK1i1k33C47BGo9sxGjmJyvEMEire5LIctC38uymGGmAPnZK0W1zMTEzs1i3
	UKnbT06XNyz+c8kpKfIzHR6d2qWNVVf7xpZpMmxWdVsRJEdpGhObtTTrgK0I2XyHufKZ15mt4QXfM
	hJzsMYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdjv-0000000FzQJ-1ipg;
	Fri, 20 Jun 2025 15:33:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdZU-0000000FxCx-2mGm
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Jun 2025 15:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750432946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cN1LA4ycWLYTHnDpp5XY9WIgVZkngojcPUNGmlqXWbc=;
	b=d0caeUqITTRgH3jrOPfV9zlRVfxR/NRN9XGg9QL5+UGDSYaj1/gEg42n1RK1irXgq7sA7B
	9Z0eNdQRomWmIv1lFx8eYCFQamV2GF9TE54WGQTaiItKMgioQ8k4hPJSf22dCu9Jof+1Yc
	/Ubi+fbS6h7FjepitrTG6KipbCHiOek=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-WiyyvWiNOEeWK7ZweyTp1w-1; Fri, 20 Jun 2025 11:22:24 -0400
X-MC-Unique: WiyyvWiNOEeWK7ZweyTp1w-1
X-Mimecast-MFC-AGG-ID: WiyyvWiNOEeWK7ZweyTp1w_1750432943
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45334219311so10143855e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Jun 2025 08:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750432943; x=1751037743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cN1LA4ycWLYTHnDpp5XY9WIgVZkngojcPUNGmlqXWbc=;
        b=lPrTDtfES1YbbL5GKb0emKByUzpUvw7Ox3d3qDeQxGxLPGShgB8kIPv/qTFcykSmPw
         Tte3CjEWuowUcdQMfq7JQA2g/T9wCjHNq67uZPLcBcBPeqalHdvb/mwMyfrs5lDN6V0h
         IXnb7zDOsxE25J9hPUG3aqCiHZ+/vhhvh8fDRsjUSbj+AEKWs2Uxjy1TGTgygjRE722c
         6i7+LN7pTh0K2Rk14no+IVYwrEE5fihllekVsWL3XcrXpsjg4MObFUQ/3Rtdi2gLOuxE
         NGxdej+K5mJnFawC7FZ4cH1v9DzuaD/Q6G5RlhOru+vao6MiwmYnZAKf0GAJ9oRmAKzO
         Sjhw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Pqb4JvTtfenfRJ1XCowx/owIbE7a/uCZkxeihUHsj1KSQTNjiidjnaMuQmlqU9V2cRh/HwV1NKwY2E7JYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6h2UhSbggg04pzD4y91b0U0JX4U3NwmvPeJb0RtVRcuf00CLt
	wkSGLaiDub1fLvT0gdrQR5FOtHKLyTS4AX6P88qtaMoUI4+SeXNsDYoBPHqwaG+DYGGNM4mVPfD
	/kDurKz4kiX9G35AUOVVRq0HfDKJALA/FC0IOUTW8jNdMWsAs/yb+7OCzRUZGAnELLIlJ5EbyWA
	==
X-Gm-Gg: ASbGncv3v2hLklX5+5CBNpnjvKceUAxyf0is56F41Pilgtn4OXntwcBoNkdcgcymDPX
	GyaUA9XIpaNan/y6pf2c5rTbEquJ8jLbSJ17zjHQJCbg3oXG8X1nOPwnKestHZvhun3gH0r2rXr
	bccnohKE9/BWj3phJFhS/jt1260lB4yn86AwY4yTuhn28ZnbpsP+dLLnNpiclyjiiIhXSK2QFrH
	/EnzdfRky6iCy2zuGSD7HIaJj+o/IEsbfc/7dRfctIm0xp3O8XXnrGMkjr0JK1AukcM0y/ttsMI
	95wZHiNuStBm68W8Yn1bGOhirb9qqho/t3GqVRy80HhRW2fCQK4k
X-Received: by 2002:a05:600c:4ec6:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-453659c5990mr33686695e9.13.1750432943261;
        Fri, 20 Jun 2025 08:22:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZmVpv8KaX6/5zmsF8suS17BhoS4C59H1HpKJfGYz4l67tvqNN65MS3ZSI+H8wSDwwq8cC1A==
X-Received: by 2002:a05:600c:4ec6:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-453659c5990mr33686485e9.13.1750432942892;
        Fri, 20 Jun 2025 08:22:22 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.47.238.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364705748sm28034795e9.28.2025.06.20.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:22:21 -0700 (PDT)
Date: Fri, 20 Jun 2025 17:22:17 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation
 when expiry time passed
Message-ID: <aFV8qeH__bw0chWM@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
 <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
 <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <6ec534be0618de3e2b4d81555e5f24155326c0b9.camel@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tKzv7AWUxuYeUR9M_9kQ773g0KlKf6VSkbgq0YXTT3A_1750432943
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_082228_776278_9197A7DF 
X-CRM114-Status: GOOD (  18.39  )
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

On 20/06/25 11:00, Kuyo Chang wrote:

...

> "DL replenish lagged too much" means the fair_server took much longer
> than expected to use up its running time,
> so the deadline fell way behind the clock (which is also why
> start_dl_timer() failed). 
> In this situation, just replenishing one dl_period isn’t enough to
> catch up.
>  
> A corner case is when there are too many IRQs or IPIs in the system.
> In this case, runtime gets consumed very slowly, and the fair_server
> keep running without being throttled.
> Even the runtime is exhausted finally, the fair_server would be
> restarted immediately.
> In the end, IRQs, IPIs, and fair tasks can take over the whole system,
> no chance for RT tasks to run.

Thanks for the additional explanation.

The way I understand it now is the following (of course please correct
me if I am still not getting it :)

- a dl_server is actively servicing NORMAL tasks, but suffers lot of IRQ
  load and cannot make much progress
- it does anyway make progress, but it reaches update_curr_dl_se@throttle
  only when its current deadline is past rq_clock
- dl_runtime_exceeded() branch is entered, but start_dl_timer() fails as
  the computed act is still in the past
- enqueue_dl_entity(REPLENISH) call replenish_dl_entity() which tries to
  add runtime and advance the deadline, but time moved on so far that
  deadline is still behind rq_clock() and so "DL replenish ..." is
  printed
- replenish_dl_new_period() updates runtime and deadline from current
  clock and the dl-server is put back to run (so it continues to run
  over/starve FIFO tasks)

It looks like your proposed fix might work in this particular corner
case, but I am not 100% comfortable with not trying to replenish
properly (catch up with runtime) at all. I wonder if we might then start
missing some other corner case. Maybe we could try to catch this
particular corner case before even attempting to start the dl_timer,
since we know it will fail, and do something at that point?

Thanks,
Juri


