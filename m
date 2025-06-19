Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E0DC7115B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6QZTbgBsBIWN9k4dZ6Hk3/RHB+MOYXXgpk4gPxs+OQ=; b=fJN+QZRC9ftBNn2dSK/ccF0Jc7
	7lkEPaAMKeiRiadWfjBEy58FyfsMUZ2Om1I/dGI4+VZ4SskfC0CvxvdRT/lc3NqRMNxiaCRzFbURu
	NZU8Mz9D781Q5OtPYOZhXR46xrIwHlwAFCVB4wYR3BOQThowWvAUfGdMr7hZSjpdNBe6i2Mynatyj
	A8wdu7WanL5TxC8OL4MFDOSrJtDJOBrVkY8i5cMnTSLZHI0OJ6B2qwkVX/u3QIK1qfEiiq1qyTRam
	UGY+8+FqdzQYAIAz5AxD7d3OKsVgdvTmJ2jvZbvgMC2K6aQttlo/HF3uzQifU37OmVxe1sJMwf3eg
	VHiwyb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHW2-0000000DYRf-3wxl;
	Thu, 19 Jun 2025 15:49:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSF5A-0000000D8NN-1Lwa
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Jun 2025 13:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750338809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j6QZTbgBsBIWN9k4dZ6Hk3/RHB+MOYXXgpk4gPxs+OQ=;
	b=gYaR5fGuCZKJKmXcPWIDn1m6BMadsgDlb66jwK/+D/hY4B1dwdwWIGmtnqRd59RqvHLzQB
	SjUC5OBBcav+CneAHRKHUKmumqk9mQ8L0aRKaWL2fEdsmDRjKwt20NHPYKzpkVdiwZuOjC
	yfhIMTpHBRTbFb/eAavP4gLBnWGwSHo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-o88NMlqqMQ-cHVV0bHrMZg-1; Thu, 19 Jun 2025 09:13:28 -0400
X-MC-Unique: o88NMlqqMQ-cHVV0bHrMZg-1
X-Mimecast-MFC-AGG-ID: o88NMlqqMQ-cHVV0bHrMZg_1750338807
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450cb8f8b1bso887845e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jun 2025 06:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338807; x=1750943607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6QZTbgBsBIWN9k4dZ6Hk3/RHB+MOYXXgpk4gPxs+OQ=;
        b=SQwIgA8AYVsjJrrSEQBqLVwtl95baYwcg9fTR+kNkMztVkUsTm1+QBZ64o0Hsk1E3y
         lziu85IkuJRkeG5SXWjChbmROtbZnmzxzQn9XhTqfH3HDUjnegCFWpveoetHiBEyf7lz
         WLMk989TteFE7vUULxFZuN/nX/BmPEjUFuOtsPfQqDEe0rgUdyLBB6dU2g4hN8aqV8eT
         uDcbCQ4XNQDH/WMSIH9/cMm8j/7wEM54mOTKbs2j+rezyoXRiaExcf16DXQ4VwnmOY4e
         2cKunJ1hidBj6TQ7A5Q3x3CDaPbzvSUpp6uG/A+xYvY27BqRMh+7/+gy3Hrr5Pkt2K9q
         oahw==
X-Forwarded-Encrypted: i=1; AJvYcCUlbcq0xWUO80pIHmnqoKwNXLONDRBHRAkZHarNJuO///TArGL10ZJrbiStP836BDnl5lklzivBcj94I01Mfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQXnd2LGKxXfSWQoMPcgKeZdy4lDdrZU94ihqSswnFcLsOcmYx
	13yv8xtDMfMRHo+rv/PajlqazeFFxC2oKc4s+2IG5Es2+WtqdszARFLFp2mTAirD2O4R1m8RcXh
	AF2v1gJU0+OCd/I0KIRcTmo73J2VMa/Ttt3I//22drRVfw/F3z2suL30W6lE1u4jJNC/q/mTirw
	==
X-Gm-Gg: ASbGncvdJ8PewbpNWX2+4gBXc1oiQCR70UkYdfBk8A6y8HlWLjx+3F865AybSurJWPk
	LuYoIYWWhg1AIYjithgO2XMkDPmYYkg13s0bBUd1Co48rO9ypyoRfGnMhICUGoXUV8wT/6fV+0m
	UnQwdgU5idaDLH5t0y4lVGimEdKlYla1s6ITJ7YKn4ySGestPwNCDD8UZhENVO7E4f0TSNVpeCP
	64v2XCR5A+Iu6O3OdaSJbmKcsanOylPJgx+nLwaTCUMZhl6qnsTvqbUXHPLRnFJjkjRUQw6f4df
	O9sGsW405ZIEn/wloRqUcqTju54ov117fAfOqk5jmDk6hRID6KU2YA==
X-Received: by 2002:a05:600c:1c12:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4533caf5e9fmr223551245e9.13.1750338807292;
        Thu, 19 Jun 2025 06:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMD/1y+DW1U7YZaLtAM718HwgsMR2hyVtSoS0D2IF1BJD9ZA4K+FKXjkc1zCzOuZWEA10NWA==
X-Received: by 2002:a05:600c:1c12:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4533caf5e9fmr223550895e9.13.1750338806871;
        Thu, 19 Jun 2025 06:13:26 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.47.246.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536087c247sm16215935e9.9.2025.06.19.06.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:13:25 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:13:21 +0200
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
Message-ID: <aFQM8TdZIIvvGv8T@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
 <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <089882f95b1b910f7feecddd0ad9b17f38394c64.camel@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 93Wv_L3MkysZWhVLXAHFwoaD4lr4BG_rAgNZw2rTJQ0_1750338807
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_061332_427742_0B2E6A9E 
X-CRM114-Status: GOOD (  20.88  )
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

On 18/06/25 22:20, Kuyo Chang wrote:

...

> When dl_defer_running = 1 and the running time has been exhausted, 
> it means that the dl_server should stop at this point.
> However, if start_dl_timer() returns a failure, it indicates that the
> actual time spent consuming the running time was unexpectedly long. 
>  
> At this point, there are two options:
> [as-is] 1. re-enqueuing the dl entity with ENQUEUE_REPLENISH will clear
> the throttled flag 
> and re-enqueue the dl entity to keep the fair_server running. 
> enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> => replenish_dl_entity
>   => replenish_dl_new_period(dl_se, rq);
>   => dl_se->dl_yielded = 0;
>   => dl_se->dl_throttled = 0;
> => __enqueue_dl_entity(dl_se);
> 
> [to-be] 2. To avoid RT latency, the fair_server should remain throttled
> while replenishing the dl_se. 
> Once replenishing is complete, we can ensure that a timer is
> successfully started. 
> When the timer is triggered, the throttled state will be cleared,
> ensuring that RT tasks can execute during this interval.
>  
> It is a policy decision for dealing with the case of failure in
> start_dl_timer().
> The second approach is better for real-time (RT) latency in my opinion,
> as RT tasks must be prioritized.

OK, I think I see your points, but I am still not sure I fully
understand the link with the issue you describe in the changelog - the
relation with "DL replenish lagged too much", that is.

Could you please expand on the details of the situation that is opening
up for the issue your patch is addressing? Do you know why we hit the
corner case that causes the warning in the first place?

I would like to understand exactly what we are trying to fix before
deciding how to fix it, sorry if I am being dense. :-)

Thanks,
Juri


