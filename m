Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67056C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 14:53:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 333ED2078E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 14:53:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MNWkd4xz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u1QrlX4t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 333ED2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2XltSqVx126S+Te7WiSDcBLSGhvTpEKgyYpQAhmJ/ks=; b=MNWkd4xzxO18fBgt42qVeLPy2
	j1m8MaBI8A1gSjYnLecSZCFL3WLz9pbwkoojC2QPrS814SgyjZxbTPKR3CdIUZW9Ptim6XLOSyUc+
	POVCdY8aQgbWYSW8A+xwN8SKuNWfgmnrrU94qCDAtmklBIyQw827AXm6AGPeHzl/dUGIOzr2Yo7SY
	fBQTeEl6pmk7thlLc3vmA9/U++291bYLhA2UrpM42XRY5eR0qhdkhxIXHfLZOSePeU6+hjjfJqbvY
	hUhw1SEqfgBzNqEi0oyNHLudLm1YKVkThopvODqf6tuk8MGTDNvYZAOopVlGwnT1k2Ls5hMKGZxVT
	XrD+6rrzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDU8A-0001zY-GC; Wed, 02 Sep 2020 14:52:58 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDU87-0001yM-51; Wed, 02 Sep 2020 14:52:55 +0000
Received: by mail-qk1-x742.google.com with SMTP id o64so4560724qkb.10;
 Wed, 02 Sep 2020 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Umk5Ulvu4oLoYIO+HUXZ2g8XNW9wJ6mMmUfCXe6cwzE=;
 b=u1QrlX4tBu3SeweQyeFvKcbd9BBbzKPHcAtreRTlE33njRMc4xrp/YRss9Ci+1XqX+
 0xWJ6n7UQr5uBOb+HLR1Gi1qqN/3rG4mHZvtQlPi50OjxzIAQ5GVt57+5LQn4Od+lzjl
 jYGMV86QT9ZunHZEH/BhYUBDXSQblsoWLudOKuTH8j1YF7k27tHzvRVh8Y4hgcDS/6PC
 +Zk1u8BeT7PHGtED6kcFwnHyMDUoOv9vK31Qca6YjTjUNyAy3yyeOHMxwL4c1B60duVJ
 qXoKMXatMGF3ZaXHvIDSU0tDAHb6hDyN9jRZhvc6r0HNEm2oANhB8njQAruZnTk08Egb
 XX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Umk5Ulvu4oLoYIO+HUXZ2g8XNW9wJ6mMmUfCXe6cwzE=;
 b=BPXg5TeMDsnIP7tNjqbCxjQJvFi85rM/xDZSJKHSWG1Z6wCuN4/hjt6PqVGh9WHBTc
 qNwYx0xPoxDIsDiZKWMGSO5cWXsMMnUhLHolByqFbsY/p6JwXnaRjDoxGrFWi07jqBOb
 kNt9ioqYGRvJW3iaaVQgXdr3Fe2ZsVu4Bb0wh3+fmWUbbJJDdqpBX5KoY9Zq2LeEiJUO
 CVNuz+FG6gI/K8Xao/pTjMZ2t0hNczWlk7Ong/Q8u/9D7wewRMBpqixdVvbfXQpgWjte
 OuZIYOk/Gy5WjklXrzfKhoe45/JcP3Sf07Ie6IOlEj2az/krADkY4A5bpTrGfxJcGzn3
 JOaQ==
X-Gm-Message-State: AOAM530vLNkm7+J0nJ3H1GGWdpkchxhIHXcguB+a1ryAuh0OQigGqvB1
 pE3aP383Q48bJCjdfW7eskn0PQMLc8rKCg==
X-Google-Smtp-Source: ABdhPJwtF2MnHLtEgYqsM1xBk1VrAbk4U4yp0K+SVFwUEGI/lp1d3JSafaq/2JyqeLrKZqK4fC46LQ==
X-Received: by 2002:a37:8b01:: with SMTP id n1mr7286182qkd.62.1599058369875;
 Wed, 02 Sep 2020 07:52:49 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:a198])
 by smtp.gmail.com with ESMTPSA id r11sm4772987qtt.2.2020.09.02.07.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 07:52:49 -0700 (PDT)
Date: Wed, 2 Sep 2020 10:52:41 -0400
From: Tejun Heo <tj@kernel.org>
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v3 2/6] workqueue: kasan: record workqueue stack
Message-ID: <20200902145241.GG4230@mtj.thefacebook.com>
References: <20200825015833.27900-1-walter-zh.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825015833.27900-1-walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_105255_232129_4B2ABB08 
X-CRM114-Status: GOOD (  12.70  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Marco Elver <elver@google.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Alexander Potapenko <glider@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 25, 2020 at 09:58:33AM +0800, Walter Wu wrote:
> Records the last two enqueuing work call stacks in order to print them
> in KASAN report. It is useful for programmers to solve use-after-free
> or double-free memory workqueue issue.
> 
> For workqueue it has turned out to be useful to record the enqueuing
> work call stacks. Because user can see KASAN report to determine
> whether it is root cause. They don't need to enable debugobjects,
> but they have a chance to find out the root cause.
> 
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
