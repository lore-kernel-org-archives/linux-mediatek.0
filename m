Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3688AC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 06:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORRus/ro4FIyVLQAs/Zz1Z+37Vnb3kGYqJp0YKLyVc8=; b=r0d4OvodUC8nYcLK7kjw96P3O/
	in6LBuVItAk5ntjirEIiKcWD2Rl50C3kdTQOoe5rlIDyv1G87rAVz5KKRxN6j3Wgs+3D1EUNLBeQ+
	kwZA9yScxQFfsxPmJNd8xyyN36i3DCRug+OzZGT4JmkhgZ7pVhPW37aFrTuFe8nkBQAvgxabil8+q
	5CM1UqdxLgaIS8qdGK8JfQPEDCAIU/a0lGhGtYI20q+wL+1Nak6z7IQEqhcD5ct2ioJ9EMzd9FE8j
	LWakdEtTFRg/oDe132yLSuOe1fY22iEUHWNiFwCLITgQ5y9W6vDxDRCDLWafhd6bWUTA6e2r9pYks
	8DJ1L+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0dGZ-005Iys-5b; Thu, 01 Dec 2022 06:41:51 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0dGN-005Iu9-1C
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 06:41:40 +0000
Received: by mail-vk1-xa29.google.com with SMTP id j14so401435vkp.3
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Nov 2022 22:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ORRus/ro4FIyVLQAs/Zz1Z+37Vnb3kGYqJp0YKLyVc8=;
        b=ozPGcKusnW7rTsIrfvE7H+v7AiVI8+/BAg9bAQlefF2PRdN6TwUnAfGP3f6VPYOdmu
         IDowWN8o9eJXDTZPZ213/YN1F3FOI+KdMyHNZ0qDvsS6JUkGzbpNtjcFbPonQv2K/beJ
         veAp975HT2AEFLlc3uILNBOo+SNEI6AS9nihq/V66zU/9k4vEKftRhjy1q65zgy59aBD
         r5tUxgQXndF/QEu5SLwQV8EL3AK4HmrfgV/LrwYSIhN6H/WPIhsH6SzuMOxfeU72dk4W
         /NOTIYPZbcE1iCaV6std23k8HXs3Z83iajNPIiZP8sTvni152nEITBCohO4zrRnXR/i+
         yW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORRus/ro4FIyVLQAs/Zz1Z+37Vnb3kGYqJp0YKLyVc8=;
        b=UtCURvxHG89flbCPCuTFDzrt3iL5L09jFNlubYkym7s6caQwQNj1lmhcNf/OIwWFn/
         2VzBGY/C8l/5bIJGZ5iwmqpj0gOcAkmeid9UO1QrOR8j/JAOCMZet7cX07Rh9HPkfGK6
         fumXdgnnLKrRIuuDzIqvnyMvTdRuCcEGib7/DFTV3Jkr1V4UmmtBy06nqOea5x1ZxQQS
         wl0BveLTqjwAHcStxg/7xUw0p4e2sE9gy1uKCDp22E7uAUEeOvUG4BoEREzAINJdBrzK
         6ihmvnH5WAgCHITT3KUhEKTgMrbtNxJv93hWJ4IKIEdWfrJR+xnUDIzZl3wYtiXpkkF1
         9knQ==
X-Gm-Message-State: ANoB5pm7Xtpf0RbEOqcaKePw3TM3gEcjEdbItjRgbtQt8lrBJR1XnLbJ
	/UUgooHZFq5HtSEYRpGsHgixjMe8fsaYAmpqH59CQA==
X-Google-Smtp-Source: AA0mqf541NigviDqLoiF6INf2Z2gKtvGceTfjMGBF93ndRKDKSIn1QkCrX/zRVaeFBUJC6Mos7A6sUzD/94b8KaOEBg=
X-Received: by 2002:a1f:62c1:0:b0:3bd:32cc:975 with SMTP id
 w184-20020a1f62c1000000b003bd32cc0975mr2808876vkb.36.1669876896228; Wed, 30
 Nov 2022 22:41:36 -0800 (PST)
MIME-Version: 1.0
References: <20220704014046.34596-1-haibo.li@mediatek.com> <Ysx39t+I56lDGe4i@google.com>
In-Reply-To: <Ysx39t+I56lDGe4i@google.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Thu, 1 Dec 2022 14:41:25 +0800
Message-ID: <CAMSo37WGWLuP64LGOth4s+hXuN_1mEBwEGz+i6L7HxryF56eZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] cfi: free old cfi shadow asynchronously
To: Sami Tolvanen <samitolvanen@google.com>, Haibo Li <haibo.li@mediatek.com>
Cc: xiaoming.yu@mediatek.com, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Aaron Tomlin <atomlin@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_224139_108394_A00682E0 
X-CRM114-Status: GOOD (  16.54  )
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

Hi, Haibo, Sami

Thanks for the changes here!

With the Linaro LKFT project[1], we noticed there is about 5 seconds
boottime improvement for the 5.15 kernel Android builds.
And after some investigation, we found it's these changes
made the improvement.
And I'd like to share one of the test results here for your information:

====>>> data started here
 Linux 5.15: 5.15-gki-android13-aosp-master-rb5-boottime
    boottime:
    Index Build Number boottime-fresh-install#KERNEL_BOOT_TIME_avg
boottime-fresh-install#ANDROID_BOOT_TIME_avg
boottime-fresh-install#TOTAL_BOOT_TIME_avg
boottime-reboot#KERNEL_BOOT_TIME_avg
boottime-reboot#ANDROID_BOOT_TIME_avg
boottime-reboot#TOTAL_BOOT_TIME_avg
    1 5.15.41-aec224bb9ebc 1.6 37.19 38.79 1.61 30.14 31.75
    2 5.15.41-c2162eca3f66 1.62 36.92 38.53 1.62 30.04 31.66
    3 5.15.41-e796ee569574 1.62 37.27 38.89 1.62 30.01 31.62
    4 5.15.41-432cf292eb20 1.62 41.64 43.26 1.61 35.16 36.76
    5 5.15.41-a3829998513a 1.62 42.2 43.82 1.61 35.4 37.01
<<<==== data ended here

# the improvements started from build#5.15.41-e796ee569574 since these
changes were submitted to the ACK[3]
# the unit of the data is seconds
# boottime-fresh items are data for the first time boot after deployment
# boottime-reboot items are the average data for the 2nd ~ 7th data
with the minimum and maximum excluded.
# for the meaning of
KERNEL_BOOT_TIME/ANDROID_BOOT_TIME/TOTAL_BOOT_TIME please see the
description here[2]

[1]: https://source.android.com/docs/core/architecture/kernel/android-common?hl=en#linaro-kernel-functional-testing
[2]: https://github.com/Linaro/test-definitions/blob/master/automated/android/boottime/device-script.sh
[3]: https://android-review.googlesource.com/q/I08dcb29ef97453b836efd0d64286196600be8cce

Thanks,
Yongqin Liu

On Tue, 12 Jul 2022 at 03:20, Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Mon, Jul 04, 2022 at 09:40:44AM +0800, Haibo Li wrote:
> > This patchset changes synchronize_rcu to call_rcu in update_shadow.
> >
> > Patch 1 enables the CFI sanitization for cfi.c and
> > bypass __cfi_slowpath_diag.
> > It is the prerequisite for using call_rcu in cfi.c.
> >
> > Patch 2 changes synchronize_rcu to call_rcu and
> > free old cfi shadow in rcu cb
> >
> > Changes in v2:
> >  - Remove _run_cfi_check,add __nocfi to __cfi_slowpath_diag directly
> >  - Rename _cfi_shadow_free_rcu to free_shadow
> >
> > Haibo Li (2):
> >   cfi: enable sanitize for cfi.c
> >   cfi: free old cfi shadow asynchronously
> >
> >  kernel/Makefile |  3 ---
> >  kernel/cfi.c    | 14 +++++++++++---
> >  2 files changed, 11 insertions(+), 6 deletions(-)
>
> Thanks for sending v2! For the series:
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
>
> Sami



-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android

