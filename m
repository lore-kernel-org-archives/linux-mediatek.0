Return-Path: <SRS0=WPHR=7H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0934BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 09:57:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10CC20787
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 09:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OTOuvecu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Jy+KUYg4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D10CC20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hh+MjSHXvWMEshoMDw/HT4q7i4PiiTwi1BBWvmVnsQo=; b=OTOuvecubGqDOd
	PRoHH681wh9v8RxNVlz+M3N+Xhu/1c4s7MAdIUjQi+GpT3830e+F0lS/SYX+GXETVtQ5P8m+9mCur
	1BewSHrrkfE6+olmjP+pB9ZPWyMqvyFDGfgJJfgPcPgTe+UISuEQbTb6Ygj7t19cfPyT3aFUJbUeP
	qega8xa+WPDr1FJWQyJmjmjg2izEyfnzGE04OAUe0UONy30aSzGucW1N4RVdzoYn8pwHoU4xrH2IQ
	XIAFbQ7etmzVh/AXT6xTY7bRdH4M3QzRT6JNz6gQPMmH890AU/rpvY+RitZ0SWDm2/9WoYUk5kzP0
	UBzhP9Nd+a/Kl6L+AwhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd9rI-0004gA-3M; Mon, 25 May 2020 09:57:24 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd9qp-0004In-8E
 for linux-mediatek@lists.infradead.org; Mon, 25 May 2020 09:56:57 +0000
Received: by mail-qk1-x743.google.com with SMTP id q8so533932qkm.12
 for <linux-mediatek@lists.infradead.org>; Mon, 25 May 2020 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W3OPQj+6MaWJ3brcNW2aa4WZVKniXvFNcmel059rH8E=;
 b=Jy+KUYg4h6yqEgXZCmyC1r7hZaPjIJ5NbD8kOSB7ANDSGTcv/cxI7IqondbwUcYIx4
 YDawj4yAqtGCTp0JhlLeUar5y5gF5ERMxMtMxT9kSvZxxMG4qNqP+DMsADzyMxnVKbjp
 Qp5JMPqDS0aZAK6jAL+ldHNC8V3WS0Ap82mFULselou6eQNZR6sUCTVknKoKe+7skkSe
 dQeDlVCIHtIQn2PZEtJqdGm5TlcgmE0EGSNqzldorS8mctTWozaYEL/goXdYZEUy6XHq
 b1ZewotnWXEtHoJ8G6kTfaYc7CdNtQvcQjiQnRuegORWPKpgBsNANNWjDA7f82Y4NWg5
 MWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W3OPQj+6MaWJ3brcNW2aa4WZVKniXvFNcmel059rH8E=;
 b=noX+gIKylwU4bD8U2DpzdQS1AgzPLzN6E9MjD00+bA9/H1/yqmn+/GK1czTthhKLhG
 RBpsbW+0J194WwT3S3VCKh/gRBUSBSWSxF9ZwsqlSXiDgWYwQQ+4eFEHOo/jfaFcSArf
 sRsNMypfCJJtCqB8nmba8oST46hGB4946jHKcoo/AmWEsFv32L1KTGMaWsCLA4iqHauD
 lILI13kfg0vZPD6wCw59GrK5990/GUzHv7zLEKUC2RfIJxUN7rdTq0CDdaK+gjQa6R0+
 JUPgIWC6/zYv39Qf+yLH8W3eididfs2bEq+nBWhFuUkuy8kNTnIx11I+QJCqV9ComEpi
 SLZQ==
X-Gm-Message-State: AOAM530ZaW2Aj6UE+JZuB26dOEGSwTRYSRyBl+AxJDvnsCsbJM2LerVM
 JiKXhZwQYJ+MJ9QbSPN2o9kyP07GxZiWsi9WhRXmaA==
X-Google-Smtp-Source: ABdhPJxqSbuF0F9MjNbi/qpdSowpX/KR1shgHH8LS5OI24MEwe9xv7ADZ1UvXqDFHd6kocEjU/m+KLakA52EHSzuhyQ=
X-Received: by 2002:a05:620a:786:: with SMTP id
 6mr1210763qka.407.1590400613522; 
 Mon, 25 May 2020 02:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200522020151.23405-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20200522020151.23405-1-walter-zh.wu@mediatek.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 25 May 2020 11:56:42 +0200
Message-ID: <CACT4Y+axrVeCwdEg_yWH57jF7gcKT429J4wVwsNGPuARcPMiLg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] kasan: add tests for call_rcu stack recording
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_025655_332353_3938C6C9 
X-CRM114-Status: GOOD (  18.78  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 4:02 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Test call_rcu() call stack recording and verify whether it correctly
> is printed in KASAN report.

Reviewed-and-tested-by: Dmitry Vyukov <dvyukov@google.com>

> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  lib/test_kasan.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> index e3087d90e00d..6e5fb05d42d8 100644
> --- a/lib/test_kasan.c
> +++ b/lib/test_kasan.c
> @@ -792,6 +792,35 @@ static noinline void __init vmalloc_oob(void)
>  static void __init vmalloc_oob(void) {}
>  #endif
>
> +static struct kasan_rcu_info {
> +       int i;
> +       struct rcu_head rcu;
> +} *global_ptr;
> +
> +static noinline void __init kasan_rcu_reclaim(struct rcu_head *rp)
> +{
> +       struct kasan_rcu_info *fp = container_of(rp,
> +                                               struct kasan_rcu_info, rcu);
> +
> +       kfree(fp);
> +       fp->i = 1;
> +}
> +
> +static noinline void __init kasan_rcu_uaf(void)
> +{
> +       struct kasan_rcu_info *ptr;
> +
> +       pr_info("use-after-free in kasan_rcu_reclaim\n");
> +       ptr = kmalloc(sizeof(struct kasan_rcu_info), GFP_KERNEL);
> +       if (!ptr) {
> +               pr_err("Allocation failed\n");
> +               return;
> +       }
> +
> +       global_ptr = rcu_dereference_protected(ptr, NULL);
> +       call_rcu(&global_ptr->rcu, kasan_rcu_reclaim);
> +}
> +
>  static int __init kmalloc_tests_init(void)
>  {
>         /*
> @@ -839,6 +868,7 @@ static int __init kmalloc_tests_init(void)
>         kasan_bitops();
>         kmalloc_double_kzfree();
>         vmalloc_oob();
> +       kasan_rcu_uaf();
>
>         kasan_restore_multi_shot(multishot);
>
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20200522020151.23405-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
