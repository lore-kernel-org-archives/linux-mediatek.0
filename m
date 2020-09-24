Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28164C4727D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 11:47:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7731F238E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 11:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAUpH2uY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="TqfH7ms/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7731F238E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1uLDac5I4wm5L42EtloXhZ1ZTQlArlbWRN1wuj7LxWI=; b=eAUpH2uY2R96YG8jh9jX9Svrt
	mngAgxLd3wgMdFJrk5ZSXxihyMkFjfqsjq2FEbW0bSdqyi2uchINUsoRMh0CuiwUM1dfnaHJN3dIW
	PoPK/vxoyBLTHMV/4qKNy1j5TW58jIvcd61Nn1fxr7TJu+G3gytyKZPJ0iwOEv+CZRBwtdvNO/ZvO
	1z6294pIECzNRZQVUSVjDQ6U9FFUk7rTvjK38zBOatVVQ73avjRcYaK+fwFyAX9UtjpEkeAmLRyOw
	9UppG3jbAiLa8TBen2Qrb/QGDTl5W3ihHd8PeFY1BvNBI6/g+30i8qS/ekoN/BB5CsHX7Uw3GGnTn
	Z+Drq2tyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLPj0-0000zq-Np; Thu, 24 Sep 2020 11:47:46 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLPiw-0000yW-Rl
 for linux-mediatek@lists.infradead.org; Thu, 24 Sep 2020 11:47:43 +0000
Received: by mail-wm1-x343.google.com with SMTP id d4so3200852wmd.5
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gen+1cfeiOVlze5PT7LGWC4Io/Jy9zJpWLjYnIvdBUo=;
 b=TqfH7ms/kwOFy3YTgEn6UqG4brHkQnjy8aBZKTbxHkbSxe6JG6g0MkBGQNhA+tdZvR
 Wc4gr8CVvLBkf87fYMzPxzVW/UgWr6VgBNCsZbtokIx8fjt8Kwqczd5qf1YvYamucjuQ
 NlDP42JVeL/9yurovMfouUcI0uZsKT1jrxk1HunQohITz+j9mwWPDqtzAqnHQxQSuctr
 0Na+JMknAlwuJsSpsZEnLUSHrVBSuPv674aqJdq20IKnA7rd7fMFdvLqmRfsBq2deV0m
 3kY2VwGlM6yZ+VeZoYDSeETpKInsKH9X+S7dgsDGIETRa0fgU+JKButY361X6OTV/S+0
 R6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gen+1cfeiOVlze5PT7LGWC4Io/Jy9zJpWLjYnIvdBUo=;
 b=GKjsHvjggVEwyNquy+urfFy/qXEW13Ae5fm9IlEufCF2ZoqmF4ghBbiumy8Nn8IkWB
 84DrfSbNMC2am5JDmg3fEQ6Pr/CMPCMzZowVmsyFLaKifBX7lNAA7lVB7p/sbJXy54kU
 mxxJ336p3iVNEfKnDWuO02n7QnRTncbhSCQgWuF9IGIiy3Mf30E9+5cHzIpMxWzbjQHI
 /WRdPBy3bRzSkSfNaB4XZUcuRFv0yfmiDwUA8g4u5kvDyErberzkW10p/7nsXSQhg/VB
 PRShwaMjQpZ2SBkFg9DigW+pO6E0Irix4IaxA5BUQRDBddqs2Fqm1KHRc/WEqd8ImY7d
 P5tw==
X-Gm-Message-State: AOAM532QUwWN1nF2Yue5gBgr9ZsYNYdiEkBU4B4SYxiBx8+fUWgsG65j
 9gu1v6DmAChpBtNxRGS/Zw6UDGpmDHeK42ldekvojQ==
X-Google-Smtp-Source: ABdhPJzlAB1LaKS3vVnOhteN+LKInSJ3iqRi3Bi3sbvOZu3M59dlgKL3UiNjzSfzCIOJabK/i1UMh2XSl+c0rvu4m3o=
X-Received: by 2002:a7b:c749:: with SMTP id w9mr4067938wmk.29.1600948059478;
 Thu, 24 Sep 2020 04:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200924040513.31051-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200924040513.31051-1-walter-zh.wu@mediatek.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 24 Sep 2020 13:47:27 +0200
Message-ID: <CAG_fn=W2dcGKFKHpDXzNvbPUp3USYyWi2DEpEewboqYBodnSsQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] kasan: print timer and workqueue stack
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_074742_927029_A637E103 
X-CRM114-Status: GOOD (  18.50  )
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
 Andrey Konovalov <andreyknvl@google.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24, 2020 at 6:05 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> The aux_stack[2] is reused to record the call_rcu() call stack,
> timer init call stack, and enqueuing work call stacks. So that
> we need to change the auxiliary stack title for common title,
> print them in KASAN report.
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>
> Acked-by: Marco Elver <elver@google.com>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Alexander Potapenko <glider@google.com>
> ---
>
> v2:
> - Thanks for Marco suggestion.
> - We modify aux stack title name in KASAN report
>   in order to print call_rcu()/timer/workqueue stack.
>
> ---
>  mm/kasan/report.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 4f49fa6cd1aa..886809d0a8dd 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -183,12 +183,12 @@ static void describe_object(struct kmem_cache *cache, void *object,
>
>  #ifdef CONFIG_KASAN_GENERIC
>                 if (alloc_info->aux_stack[0]) {
> -                       pr_err("Last call_rcu():\n");
> +                       pr_err("Last potentially related work creation:\n");

This doesn't have to be a work creation (expect more callers of
kasan_record_aux_stack() in the future), so maybe change the wording
here to "Last potentially related auxiliary stack"?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
