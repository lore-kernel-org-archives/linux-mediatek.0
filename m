Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB0BCED635
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKYPCwTfCB7LQ2acnCdecHo4LMsa2525wI+rQ4Lsj0Q=; b=BPZAFpaRL/x8HQAjPT4ekDhTu+
	1elFao3GhFiheDIWCeHjrPvS5W2VgkhThReGoyINyqIXy4yZknzhhw1FpUWZ/HQayK/F+l6ouebKQ
	V+75TgXQeR/JHW1N2mD4wWl4gCHI2CRD5JvCLLpO7iA41dqr8HiZ2SqO+o3cUn0KsbWcDh0RoMNhi
	Xn7eBgRRmp5aMe7wYtv8L/fIlgiCLGmCNhcjomg/Z6d2aO6FDyp7FFxOuc+KuSw3+PRjQUaOBpd5f
	KvMF7XHpZ7KLULJxlsU2Hz3HIpCKww7qtL9onV1/Pds3tAqcIk22V7au7f9lnLzAeOFSshDBz9ZWR
	W7DRWdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKel-00000000PI5-1qhJ;
	Tue, 18 Nov 2025 12:17:59 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKei-00000000PHh-2kAL
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 12:17:58 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-63fc6115d65so5148125d50.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 04:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763468275; x=1764073075; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zKYPCwTfCB7LQ2acnCdecHo4LMsa2525wI+rQ4Lsj0Q=;
        b=sLC7Csw6QHfCj/+OVBxJzjCM3Zj1xWDaXCj1xKjV4shhqUF5yBSUKitewFl9Y9IP9R
         5sqKd8CTMEmFW2LfH/SHXPaB/E4YO/AdgzSGPjtC8iBixuHtb5onbY5VeX+U9MC9ywaw
         Uc1TTG1WoQgu2bwxGRqEuRQHAbZbD/E/bFaREuZxHlTLtvBOBLj4GDkT5UT6+qX09Wnx
         n19G9vjYqrOBRIibTnP0sEnciAH7BF3mOFhAVwyLcWYcxhEmwHURe6KJq9HE2/YBV1AA
         AkW7f3CyufPdZtVOCEuBVDUS2yjO2Vz3peMbbq149zaBpA4/O8a66ETg8DHPatbmkkxL
         W4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468275; x=1764073075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKYPCwTfCB7LQ2acnCdecHo4LMsa2525wI+rQ4Lsj0Q=;
        b=JD/0QjutvmhmCzGO0I8rESmP3VDPLd7KqrihZEQxUN8WVGnxjqrzMwd4y4+P9vBNZP
         ijy8CyUYuVWRTz2T/wKXjnr8okBhHW8sofehY0dqsdpv7ecHjWs9rxa5ZT47Xg5MQjih
         PGLEhdvKLRMuDtu5rRmXyy9jQslWjQUozz9VathaTwvV2C7nBTRLioQ/N6FeBBG46o0v
         nN2OVG3ayHi8P87SWUJxSNnd728rGMB3uex7mrlzLWjUCqNjjnyuDyuvGU0lfXqIWkgq
         T/ozycNbgKaf6HZyggxu/CGeTfA919UlurSHcblu4yW5WPDYEYa0VsuOQRdCVmVhagfx
         +ygA==
X-Forwarded-Encrypted: i=1; AJvYcCXrLJpPT7gNPdt66uznRmZbVxtQmtsq6C7llO6hiwXfLWrwF2IL+0SVBaiX5JxyAk8R7udKTQL157IuNuOx2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZd6uBqLKEw/3xpcH0t9177swcaq5cmy5DY1xB7YgSsySiHc6t
	3r52lm17BF2yT0GCgUENT9pa+sqtWbfewjbaAbYflJj4tdeVoGqil+ZkjLAiVsgE8saBKjuOF5i
	50x29Os/yNwV+G/f0Xa5/nnFTdeYmpyZpvWDSqfpIgw==
X-Gm-Gg: ASbGnct4ORd85YQ8AYXl7a3/xArAPIaTdEbstmf9SIMhojGB+9TJCqYgNY9uRoK2qVH
	ezw7WAagOSbXyQbkIbUvDhCKY8/U/tWDsJjNfv2EODd6heNy2MEQ1R1meHboRGMKR1DnvhftNBV
	sJjueietkzS5CDE4D8mVF7ZF27Gj1oyC78yPMDzDIYlpVGqwd0qYL+tcwZyuZt6sKo2pgnx1ct+
	2q+S1LlV1ZIIwXsDNFM8HjF1V6N7IeO/mP/ppDm+kaJnRWuPBHsOlvuHmEM6aGtqFnujdp3
X-Google-Smtp-Source: AGHT+IH5vkW38a0isCVA2e5T5WYOS8uIIq20npmgKu3RFPtWa3i0ZtmInZUSNURmsnwULuvyfghDcOs4ottSeTikfjQ=
X-Received: by 2002:a53:d048:0:10b0:63f:b922:eda7 with SMTP id
 956f58d0204a3-641e74df9efmr11495816d50.23.1763468275130; Tue, 18 Nov 2025
 04:17:55 -0800 (PST)
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <5940388.DvuYhMxLoT@rafael.j.wysocki> <119e2410ca32a0d55fa6febf93c7a3164b391db0.camel@mediatek.com>
 <12782716.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <12782716.O9o76ZdvQC@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 13:17:19 +0100
X-Gm-Features: AWmQ_bmVtAxNobSpolx7esNrHBiYpoTIJhpwBf5EtPC4hxdNMXHJAkDPR0Y0clA
Message-ID: <CAPDyKFqzt70rkHaRP62zErkMi2kFC1iY-NHPWjK0FWZSjZ00jA@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, Rose Wu <ya-jou.wu@mediatek.com>, 
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>, 
	linux-mediatek@lists.infradead.org, "artis. chiu" <artis.chiu@mediatek.com>, 
	"Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_041756_720133_11F2D7F7 
X-CRM114-Status: GOOD (  33.12  )
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

On Tue, 18 Nov 2025 at 12:48, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tuesday, November 18, 2025 9:31:08 AM CET Rose Wu wrote:
> > Hi,
> >
> > On Mon, 2025-11-17 at 19:57 +0100, Rafael J. Wysocki wrote:
> > >
> > > Make two changes to address this problem.
> > >
> > > First, reorder device_suspend_late() to only disable runtime PM for a
> > > device if the power.is_late_suspended flag is going to be set for it.
> > > In all of the other cases, disabling runtime PM for the device is not
> > > in fact necessary.
> > >
> > > Second, make device_resume_early() only enable runtime PM for the
> > > devices with the power.is_late_suspended flag set.
> > >
> >
> > My concern is with the error path in device_suspend_late().
> > If a device fails its dpm_run_callback(), it appears that its
> > power.is_late_suspended flag is not set, potentially leaving its runtime
> > PM disabled during the resume sequence.
>
> Right, pm_runtime_enable() is missing in the error path after calling
> dpm_run_callback().
>
> ---
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Runtime PM should only be enabled in device_resume_early() if it has
> been disabled for the given device by device_suspend_late().  Otherwise,
> it may cause runtime PM callbacks to run prematurely in some cases
> which leads to further functional issues.
>
> Make two changes to address this problem.
>
> First, reorder device_suspend_late() to only disable runtime PM for a
> device when it is going to look for the device's callback.  In all of
> the other cases, disabling runtime PM for the device is not in fact
> necessary.  However, if the device's callback returns an error and the
> power.is_late_suspended flag is not going to be set, enable runtime
> PM so it only remains disabled when power.is_late_suspended is set.
>
> Second, make device_resume_early() only enable runtime PM for the
> devices with the power.is_late_suspended flag set.
>
> Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asynchronous")
> Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com/
> Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>
> v1 -> v2: Add pm_runtime_enable() to device_suspend_late() error path (Rose).
>
> ---
>  drivers/base/power/main.c |   15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -941,11 +941,11 @@ Run:
>
>  Skip:
>         dev->power.is_late_suspended = false;
> +       pm_runtime_enable(dev);
>
>  Out:
>         TRACE_RESUME(error);
>
> -       pm_runtime_enable(dev);
>         complete_all(&dev->power.completion);
>
>         if (error) {
> @@ -1630,12 +1630,6 @@ static void device_suspend_late(struct d
>         TRACE_DEVICE(dev);
>         TRACE_SUSPEND(0);
>
> -       /*
> -        * Disable runtime PM for the device without checking if there is a
> -        * pending resume request for it.
> -        */
> -       __pm_runtime_disable(dev, false);
> -
>         dpm_wait_for_subordinate(dev, async);
>
>         if (READ_ONCE(async_error))
> @@ -1649,6 +1643,12 @@ static void device_suspend_late(struct d
>         if (dev->power.syscore || dev->power.direct_complete)
>                 goto Complete;
>
> +       /*
> +        * Disable runtime PM for the device without checking if there is a
> +        * pending resume request for it.
> +        */
> +       __pm_runtime_disable(dev, false);
> +

Moving this here means we are going to keep runtime pm enabled for
syscore devices during system wide suspend/resume. That's quite a
change in behaviour for a fix for a regression, I think. Not saying
that it can't work though.

Although, perhaps better to call __pm_runtime_disable() a few lines
earlier and use a separate flag to track that we need to call
pm_runtime_enable() in device_resume_early()?

>         if (dev->pm_domain) {
>                 info = "late power domain ";
>                 callback = pm_late_early_op(&dev->pm_domain->ops, state);
> @@ -1679,6 +1679,7 @@ Run:
>                 WRITE_ONCE(async_error, error);
>                 dpm_save_failed_dev(dev_name(dev));
>                 pm_dev_err(dev, state, async ? " async late" : " late", error);
> +               pm_runtime_enable(dev);
>                 goto Complete;
>         }
>         dpm_propagate_wakeup_to_parent(dev);
>
>
>

Kind regards
Uffe

