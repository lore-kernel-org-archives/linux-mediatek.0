Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437F3C63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 10:30:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B867B21D1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 10:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B867B21D1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9CO7QRO5u1W2ii3NXduhYQ4HWzxbCuo8RWZJJJhZD2g=; b=RlabXx5VUx3k7zG8NEHLUrU6G
	G2YJsD4c8+mG2MFURKh9rtHoxcM2elwnKy8twqNeue20DHgfUWUlnn25H0TFi21tsGpsQOmvWsuar
	LTo4DbQC5S9GtVtOdKWt7G0Z21F/KxcKD5rEZbCwDnfZXQykBQ+kfpIoPezNcGEoHya8Vm/4HS31l
	uYHebbe4mTh2SeNGaC7aLbCmjxZP0SCc/seFh0yeYFlL6Injqdq1NNnBD41J0m4cofEy8TS6SF3qR
	QA+atpg4bCg5qpgULQNptJhHWgrrmRGCKeAAG5hH2Lj/+0DMcBghFsqcXcukgFaDVNjhVWnVtruOk
	TSb/C/Zmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkls2-0004as-Ht; Thu, 03 Dec 2020 10:29:54 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kklry-0004YW-0K
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 10:29:51 +0000
Received: by mail-ot1-x343.google.com with SMTP id x15so1275162otp.4
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Dec 2020 02:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dD/UF3nKA/vHAeqLilY0XbqwU9Dd3XarhmvDlCA55tM=;
 b=sNAUb/6EpXsXZLgScT2nBxmPy0qJ8cz5eUI+26eOvpwQ34r3z4nNCosaC5QHGRCTTv
 ooKyyAGZP4PiQA2DsJyROx/nzT8LgObcMWN7pHC4vIVt9wVl16nEueIrXK3EPyr4wYDx
 igu1H3z1STu2hP/BAMzv8BB7kcmC0wT/PcFZW4Xx18MJA/F150Z8JWiGW3NFVJF+fpEW
 W7IRu+4ah0axnhkYH2zOKap3cVSCsnWpPTLkMsWn3iEHCFshS7yRkWWsQiLvKbMc9SLU
 jodXExiQPL0dd1K16UWOU1xbH7sJesNfY+8hEtJ9AQpsgbcVdAwtCCMm/kPqCyuxLSmL
 lDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dD/UF3nKA/vHAeqLilY0XbqwU9Dd3XarhmvDlCA55tM=;
 b=T/JKW42zunYqhegtFHOrC9mLSde+PZBZmanO3ch0L+d1fkTbgbP8HtmnwTw8qRfBy+
 3D2xyggN75Ei8HOTU7REtqQ0/SSKjoBaFV0qK5tkNwZjlLHTm6uDJI8rPBmNitVbjZyC
 VdPMDrxmr8yFGxGOBziqMSPC441u9yOZf4NDuIS4NxFRRYFASZfW3o1B6VPwk3+DTlDp
 MD/kW8It+aZrlWuaChdxzd2a0gETl45uQnrSbw3Buq6qukWrz1tj6IE60lBz8K0Cgdaa
 o0Us2hUSAUbsXfa8S/VFehB+OkTVkWJ6uxdt6FewSsAVG5lxZHa6V2Ayhn1Cg1AjA4uz
 xSjQ==
X-Gm-Message-State: AOAM533/Id2zvVMA0RGgV0uTrUoOcTAsiVGIdcmxJgf/XUWPhGcmshkC
 TczOopvqCQ/rQFii3z11IyfUva8dvIXGl6/sg+jXDQ==
X-Google-Smtp-Source: ABdhPJydGvdWaYJOm+Ie12Lw3ZJQHjW/6RDf4PUUEjAcJRpmJDcB86vOtH+sjygI7l3Ka0hhovq+moKy+jtukv+vr9A=
X-Received: by 2002:a9d:7cc8:: with SMTP id r8mr1563625otn.233.1606991385992; 
 Thu, 03 Dec 2020 02:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20201203022748.30681-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20201203022748.30681-1-walter-zh.wu@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Thu, 3 Dec 2020 11:29:34 +0100
Message-ID: <CANpmjNNdaiN=J0TU_AjAoH=ECNC8dJWS8HTvJs9nxBkJce9AmQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] lib/test_kasan.c: add workqueue test case
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_052950_106181_821E8D64 
X-CRM114-Status: GOOD (  19.39  )
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
 Andrey Konovalov <andreyknvl@google.com>, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 3 Dec 2020 at 03:27, Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
> Adds a test to verify workqueue stack recording and print it in
> KASAN report.
>
> The KASAN report was as follows(cleaned up slightly):
>
>  BUG: KASAN: use-after-free in kasan_workqueue_uaf
>
>  Freed by task 54:
>   kasan_save_stack+0x24/0x50
>   kasan_set_track+0x24/0x38
>   kasan_set_free_info+0x20/0x40
>   __kasan_slab_free+0x10c/0x170
>   kasan_slab_free+0x10/0x18
>   kfree+0x98/0x270
>   kasan_workqueue_work+0xc/0x18
>
>  Last potentially related work creation:
>   kasan_save_stack+0x24/0x50
>   kasan_record_wq_stack+0xa8/0xb8
>   insert_work+0x48/0x288
>   __queue_work+0x3e8/0xc40
>   queue_work_on+0xf4/0x118
>   kasan_workqueue_uaf+0xfc/0x190
>
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Acked-by: Marco Elver <elver@google.com>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>
> v4:
> - testcase has merge conflict, so that rebase onto the KASAN-KUNIT
>
> ---
>  lib/test_kasan_module.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/lib/test_kasan_module.c b/lib/test_kasan_module.c
> index 2d68db6ae67b..62a87854b120 100644
> --- a/lib/test_kasan_module.c
> +++ b/lib/test_kasan_module.c
> @@ -91,6 +91,34 @@ static noinline void __init kasan_rcu_uaf(void)
>         call_rcu(&global_rcu_ptr->rcu, kasan_rcu_reclaim);
>  }
>
> +static noinline void __init kasan_workqueue_work(struct work_struct *work)
> +{
> +       kfree(work);
> +}
> +
> +static noinline void __init kasan_workqueue_uaf(void)
> +{
> +       struct workqueue_struct *workqueue;
> +       struct work_struct *work;
> +
> +       workqueue = create_workqueue("kasan_wq_test");
> +       if (!workqueue) {
> +               pr_err("Allocation failed\n");
> +               return;
> +       }
> +       work = kmalloc(sizeof(struct work_struct), GFP_KERNEL);
> +       if (!work) {
> +               pr_err("Allocation failed\n");
> +               return;
> +       }
> +
> +       INIT_WORK(work, kasan_workqueue_work);
> +       queue_work(workqueue, work);
> +       destroy_workqueue(workqueue);
> +
> +       pr_info("use-after-free on workqueue\n");
> +       ((volatile struct work_struct *)work)->data;
> +}
>
>  static int __init test_kasan_module_init(void)
>  {
> @@ -102,6 +130,7 @@ static int __init test_kasan_module_init(void)
>
>         copy_user_test();
>         kasan_rcu_uaf();
> +       kasan_workqueue_uaf();


Why can't this go into the KUnit based KASAN test?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
