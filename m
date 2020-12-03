Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0B5C4361A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 18:29:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4044208BA
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 18:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4044208BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CtMaQZHSixJX/Z6kDCnaRUA+4aBGwz2TzFTYVTnXXjE=; b=aAWQ1NHy9povQKNERGb0tasT/
	b8RUzUgF7TUIEaCeSoIpjRCgkGJWOJlTTjcNmjuMtV2fRrqV8kwczmaCRS4fvTXS2LQuee4a69Rnm
	B5R520rsz9Oit7oZil1L0DIVxSgQw9s6kArsUQ92WqSmTvPZyRD9p7aXVAnKYqKAgKqhAtjo3s73O
	lt5sZ2YavwcKeDG5oKFkFkWnDsG3Y/AJVsYRs+KgWxR8JN6ajK0yEwDx79hHQElpC3w6nZiiitjF9
	jckz/KesuNKOnOijOa5trOfYLekn7d9cI5M5pRxfVMyF4NU2CMRY/qDRHQVmK+83BkAvMIgMP3C/R
	8eVFdB7zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kktM3-0002zf-1Q; Thu, 03 Dec 2020 18:29:23 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kktLx-0002ye-BB; Thu, 03 Dec 2020 18:29:18 +0000
Received: by mail-pl1-x641.google.com with SMTP id p6so1621328plo.6;
 Thu, 03 Dec 2020 10:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+WyCqEHFRXG/znTaYwcRSAz+ikU4KUuDWRGTqiuEseI=;
 b=Jq1AeVxjxylFag35gbpDoPu6RWql4w6olyXkAzkSvgiJXX/z5a/6KalXnelP8oFs7U
 hQ/rQwIzWJ7TgKd79uqjVwE26bchVNuMP+6FJegdEdSKA0xJZyYM0417c0moxtGUVFiq
 iq0Op36EaHeARncOUAKj+VBrfPm9/l8AFhky13Tpib9uOkMVmPcUZKOkCoCcNndgPBfN
 BD3VK01aF2hL4MZRrs7A16UjaoM6GhfmNU7UTiPE9Zb56W59bW+BMl/JUz5ts5/cmQw9
 3XuTGWJqvkraNhgLLm7DDat/9WTe6nRIv7V0Sa5MOO1nbjGyLagXPFijR58IMNo+v1Zi
 bn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+WyCqEHFRXG/znTaYwcRSAz+ikU4KUuDWRGTqiuEseI=;
 b=iz02SLe7FGelUz62u7RP34HaBWl7l81N/bOeNB1LSTz34sHXpw6XAykiX7ccitcxra
 3ACzMhJfkleptt9PjNpdxeoqKZ2g99YDiOD25eE2t3yHA71hvxAx0pbAoJnwUN+1GzmP
 r2HNR1Pz8VZu7jhm+ViAsy1F1DQruOtYjCnCtRkv3AVYv3g7XU4zkI+B9L8BQiZGXzTk
 ktIAgW7OvXzrJtjuaaBnwpVF2OmV7u3adXETvcHQMhIsrjqyUAPjVMO77SqmY9WABGD3
 C1JCgSBqZt3xYoCjjPfWvotaiqQwBym5wpDlh2DXml7z7ra6h3EhHrkb3gGIxZ4pC+G2
 f24Q==
X-Gm-Message-State: AOAM530erC8NP3rf0ERgTpVlnJnL0tSXn2vLaUXEip/k+fBr2SIpPMMp
 lwWs5XYxHViz1m8cuFnPdgMb7H6fdXnxmEMGfJM=
X-Google-Smtp-Source: ABdhPJw76gw7sWSLM4C/6LEnb1g+m3GERIOLPxkx5+zN/CF8v9kUqWUvnYpr3RBnylk3CWwPcZLba5heZ9xnwtU6OrU=
X-Received: by 2002:a17:90a:34cb:: with SMTP id
 m11mr364955pjf.181.1607020155055; 
 Thu, 03 Dec 2020 10:29:15 -0800 (PST)
MIME-Version: 1.0
References: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
 <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com>
 <8eb453c7-a221-e741-5fe5-655e59075f34@canonical.com>
In-Reply-To: <8eb453c7-a221-e741-5fe5-655e59075f34@canonical.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Dec 2020 20:30:03 +0200
Message-ID: <CAHp75VffBjhvuZ1Uy5Eo5qSiZ4w-+dhH5cR_XgmqGvxtrMd3uQ@mail.gmail.com>
Subject: Re: media: i2c: add OV02A10 image sensor driver
To: Colin Ian King <colin.king@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_132917_524224_D07BB71E 
X-CRM114-Status: GOOD (  22.94  )
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 3, 2020 at 8:24 PM Colin Ian King <colin.king@canonical.com> wrote:
> On 03/12/2020 18:10, Andy Shevchenko wrote:
> > On Thu, Dec 3, 2020 at 8:03 PM Colin Ian King <colin.king@canonical.com> wrote:
> >
> >> Static analysis on linux-next with Coverity has detected an issue with
> >> the following commit:
> >
> > If you want to fix it properly, see my comments below...
> >
> >> 529 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
> >> 530 {
> >> 531        struct ov02a10 *ov02a10 = to_ov02a10(sd);
> >> 532        struct i2c_client *client =
> >> v4l2_get_subdevdata(&ov02a10->subdev);
> >>
> >>    1. var_decl: Declaring variable ret without initializer.
> >>
> >> 533        int ret;
> >> 534
> >> 535        mutex_lock(&ov02a10->mutex);
> >> 536
> >>
> >>    2. Condition ov02a10->streaming == on, taking true branch.
> >>
> >> 537        if (ov02a10->streaming == on)
> >>
> >>    3. Jumping to label unlock_and_return.
> >>
> >> 538                goto unlock_and_return;
> >> 539
> >> 540        if (on) {
> >> 541                ret = pm_runtime_get_sync(&client->dev);
> >> 542                if (ret < 0) {
> >
> >> 543                        pm_runtime_put_noidle(&client->dev);
> >> 544                        goto unlock_and_return;
> >
> > Instead of two above:
> >                        goto err_rpm_put;
> >
> >> 545                }
> >> 546
> >> 547                ret = __ov02a10_start_stream(ov02a10);
> >> 548                if (ret) {
> >> 549                        __ov02a10_stop_stream(ov02a10);
> >> 550                        ov02a10->streaming = !on;
> >> 551                        goto err_rpm_put;
> >> 552                }
> >> 553        } else {
> >> 554                __ov02a10_stop_stream(ov02a10);
> >> 555                pm_runtime_put(&client->dev);
> >> 556        }
> >> 557
> >> 558        ov02a10->streaming = on;
> >
> > (1)
> >
> >> 559        mutex_unlock(&ov02a10->mutex);
> >> 560
> >> 561        return 0;
> >> 562
> >> 563 err_rpm_put:
> >> 564        pm_runtime_put(&client->dev);
> >
> >> 565 unlock_and_return:
> >
> > Should be moved to (1).
> >
> >> 566        mutex_unlock(&ov02a10->mutex);
> >> 567
> >>
> >> Uninitialized scalar variable (UNINIT)
> >>     4. uninit_use: Using uninitialized value ret.
> >>
> >> 568        return ret;
> >> 569 }
> >>
> >> Variable ret has not been initialized, so the error return value is a
> >> garbage value. It should be initialized with some appropriate negative
> >> error code, or ret could be removed and the return should return a
> >> literal value of a error code.
> >>
> >> I was unsure what value is appropriate to fix this, so instead I'm
> >> reporting this issue.
> >
> Not sure I fully understand how that fixes it.

If you are not sure and have no means to test, then don't bother. This
is not the priority driver anyway.

>  Given that ret is
> currently not initialized when we hit:
>
>          if (ov02a10->streaming == on)
>                 goto unlock_and_return;
>
> either we initialize ret to 0 at the start of the function, or do:
>
>          if (ov02a10->streaming == on) {
>                 ret = 0;
>                 goto unlock_and_return;
>         }
>
> (assuming the intention is to return zero for this specific case).

No, please read my message again.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
