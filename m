Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7C5CEBF97
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxv4h7ofkzean2g/SBkB1c70TV7EMeFgRSSskiCZXY8=; b=QligbwHE52pDaSdty6toOFbUqT
	NZi2tCx0wiTvoSj5HTC7lMjJr1UWnOMdi2NNl6sbujWmreSk3N5ig2kBdzXr7m+jS2m8pEZwX21Mf
	ki5RUj5lcKXsD0yJX0MRmDXihs/TY50b7h2vuYvJeP6H2cLh7iQP1q5V3ff8W29LGbks4GzH1xdnu
	ibZKEZW9hFuTd8pAIq1lOEiHtu392ucnBATXo8dFgyVK2nLBJYJXDr3+1XbWWjCCSvdrVCk82fWjG
	1qFYKoC0TR+dJuB5ZyhVoq+6fhnDY5Py0K+FAKjB8N1Ubs1zuj6pE/XkZYl1fWb4P8I/CwK/3yvsB
	NhGyPqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMxF-00000000ZiL-1qRI;
	Tue, 18 Nov 2025 14:45:13 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMxC-00000000Zht-065w
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 14:45:11 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-7895017c722so22671807b3.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 06:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763477109; x=1764081909; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dxv4h7ofkzean2g/SBkB1c70TV7EMeFgRSSskiCZXY8=;
        b=FGy7sWq+kcRQDqKsAS5y9UyR/bCgEcx2cquu1ZBLDj2swZVG3rYkDW3BUmZRyIoxqK
         NjlTg3XKWYsh1CGTBYzrwzQkpUZRMZNNrYUc6W6QVy26MOuApfwZ0y2ksPWvER7AXKTt
         eESAx8jOOTqg5URUuG9/5To0b4H4jYWUaUMenLujgpQMfQaIIylkx199mi5q4apdVbPr
         950ujv5M7jqYSipaifNGwFn/wj/4O7Mm+i6YgQ6AI7CEuH0AkM8qiGKhePUNxSzVOWVE
         XrHTt2EcMavDMKNtbdfkP7MJGAN9esUEELXtioxTNoW6WX0ldaZ4tnNJY2IZRfyCymF6
         9Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477109; x=1764081909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxv4h7ofkzean2g/SBkB1c70TV7EMeFgRSSskiCZXY8=;
        b=evNB06+EMpaj0ryTeAiYrL5EcD3wf8nvMF6HOgqZVkjqnSo1kre8X37NvG/ieP5lDI
         wz5WDRzuzByhLXNFRgpWeMraK+gm57pwcQBxQNp5wtZtoxyzDMf+a9IAU6inCHFIEupy
         kOZtWpd6n+AbU7R4kMiTw347gyAeuj+dZgrr0rPWGjYjq+Roc2UwppcjQkse/VoO7rmI
         1igKqcrfFwEi8SE+o9cyptgsAusKQWl5EeLXKrsARlWjrWmfDTSPMJIUsj6o9FjZGy3j
         /yvAk7BJ2F20I8MgruMNWBDwZc4iGYCgyNiVUD6KlJ4QtzhSvzqwFc8CjUisHcBIIZaz
         PtRw==
X-Forwarded-Encrypted: i=1; AJvYcCVfndB8eS++xX8yVnQR7Pw9ozev9y0xCul1xQ8jIl4Qxyvvl5h057rAVZ4jki0lTzJB/x4W9ak52iLBadJrCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVyvLn1YnRyvb1+pb2SR1luHqnvAjdpZBxZbIPfpLZQ7jv9Q+b
	kkKhvxUu17enXNaBo82FxJwCOiH+8p8owlm4cyIzLmhkKSzvq4VRhNy3BjP8UfwwOJyhQZ/Z9n9
	60k6xaCD1w4Lq01fKXErgoCSztZbj5FkegJYDWVEuDkX5Mogdn4eH
X-Gm-Gg: ASbGnct9D0Iuf0NTxbbpJwdcuHwssgfy2uMk3Ys8g0KpHkZDaA16hea9iCc8ILe45M2
	rV/cxvcaxmRbZAN/6hqI3cb+1CYqiO9zqjKjrX+FRtI6VBxyBe/UXB5WAwDPsZCdRPGKL01n+iR
	y9hyGjQND7wyztsz/KOObjr06x813FB8VLI2vf3kFUDVtoXVsq1Dr8jJzfBnNijVt6AIGWiLx1H
	g2qpzSjU2aUlzR1C9blPpJ/F4YrL6LV/WhFxZP2jzxsJAKhyo1TTIlEHCFYwFjdKFLihjYn
X-Google-Smtp-Source: AGHT+IF7dxRUgvG46HM4+Rwc//gSMA7288zU/dLypnRqJ7Ti0QMfdRIpamc5xKZmVlaZsx7Wbl3epvjvS9InQfkzXCM=
X-Received: by 2002:a05:690c:3802:b0:787:cad1:bdbf with SMTP id
 00721157ae682-78929eef73amr146762497b3.53.1763477108864; Tue, 18 Nov 2025
 06:45:08 -0800 (PST)
MIME-Version: 1.0
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
 <CAJZ5v0iTMhWoBfbrPabdo7TkNuOwtC=-6acSe9tbDmyzZEoXwg@mail.gmail.com>
 <5941318.DvuYhMxLoT@rafael.j.wysocki> <12784270.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <12784270.O9o76ZdvQC@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 15:44:32 +0100
X-Gm-Features: AWmQ_bn6eOA_VKuMFyefgoEE9Geca2TO4X2U23GfUd5Xp4xmmVMzfrrokKx24cc
Message-ID: <CAPDyKFqByMzQruYZTBL0T47Ww2KTF1Py91K-wrQ9GuTeW3fx9A@mail.gmail.com>
Subject: Re: [PATCH v4] PM: sleep: core: Fix runtime PM enabling in device_resume_early()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rose Wu <ya-jou.wu@mediatek.com>, linux-pm@vger.kernel.org, 
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>, 
	linux-mediatek@lists.infradead.org, "artis. chiu" <artis.chiu@mediatek.com>, 
	"Johnny-cc. Kao" <Johnny-cc.Kao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_064510_509953_D54E2A5E 
X-CRM114-Status: GOOD (  25.47  )
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

On Tue, 18 Nov 2025 at 15:16, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
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
> device when it is going to look for the device's callback or if the
> device is a "syscore" one.  In all of the other cases, disabling runtime
> PM for the device is not in fact necessary.  However, if the device's
> callback returns an error and the power.is_late_suspended flag is not
> going to be set, enable runtime PM so it only remains disabled when
> power.is_late_suspended is set.
>
> Second, make device_resume_early() only enable runtime PM for the
> devices with the power.is_late_suspended flag set.
>
> Fixes: 443046d1ad66 ("PM: sleep: Make suspend of devices more asynchronous")
> Reported-by: Rose Wu <ya-jou.wu@mediatek.com>
> Closes: https://lore.kernel.org/linux-pm/70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com/
> Cc: 6.16+ <stable@vger.kernel.org> # 6.16+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> v3 -> v4:
>    * Reorder the syscore check in device_resume_early() after the
>      is_late_suspended check (Ulf)
>    * Update the changelog to reflect the above.
>
> v2 -> v3:
>    * Also set is_late_suspended for syscore devices to avoid skipping runtime PM
>      disabling for them (Ulf).
>    * Update the changelog to reflect the above.
>
> v1 -> v2:
>    * Add pm_runtime_enable() to device_suspend_late() error path (Rose).
>    * Update the changelog to reflect the above.
>
> ---
>  drivers/base/power/main.c |   25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -903,12 +903,15 @@ static void device_resume_early(struct d
>         TRACE_DEVICE(dev);
>         TRACE_RESUME(0);
>
> -       if (dev->power.syscore || dev->power.direct_complete)
> +       if (dev->power.direct_complete)
>                 goto Out;
>
>         if (!dev->power.is_late_suspended)
>                 goto Out;
>
> +       if (dev->power.syscore)
> +               goto Skip;
> +
>         if (!dpm_wait_for_superior(dev, async))
>                 goto Out;
>
> @@ -941,11 +944,11 @@ Run:
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
> @@ -1630,12 +1633,6 @@ static void device_suspend_late(struct d
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
> @@ -1646,9 +1643,18 @@ static void device_suspend_late(struct d
>                 goto Complete;
>         }
>
> -       if (dev->power.syscore || dev->power.direct_complete)
> +       if (dev->power.direct_complete)
>                 goto Complete;
>
> +       /*
> +        * Disable runtime PM for the device without checking if there is a
> +        * pending resume request for it.
> +        */
> +       __pm_runtime_disable(dev, false);
> +
> +       if (dev->power.syscore)
> +               goto Skip;
> +
>         if (dev->pm_domain) {
>                 info = "late power domain ";
>                 callback = pm_late_early_op(&dev->pm_domain->ops, state);
> @@ -1679,6 +1685,7 @@ Run:
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

