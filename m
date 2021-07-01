Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633C7C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FEC8613E8
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 16:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FEC8613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8h12cA2Ho2lc8aYTsFsIhIWkTSVc2+n6ZTe8sqFBqQ=; b=XJOFgpXI+Jll3D
	PwWBjxpP6omRBexgjFUOs9vY6QnMMgo4BEU6BopWLk+1ZVzMYc28EyKzmB5n/lL4Q6DxVKROn8qST
	PmVebzF0fVUBlqNEvnG+xZMdHcUrNpD+5rhdhiitdglMRzoeEOCEmDrFbFj2xz7pXu/Oxt/QSJCWn
	TFlUsYI8xt2WX1LJZ8BiEGkfY29XwDbdmfkz2TGQB2JEdvDXa6PQpU2hQvlX+DvyuiyG+P5IQfDB8
	2dIgJQHOT/trDeqGCZp32MxJld9xJ4JeaJCxiIjC+GNwDT1M3wMS3q9eslNVWvmYYU9hDexEkm7Qf
	y1MxZk/TiMCrgFMM8JGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyzpB-000Tih-Jn; Thu, 01 Jul 2021 16:46:01 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyzoz-000Tgn-9h; Thu, 01 Jul 2021 16:45:50 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 t24-20020a9d7f980000b029046f4a1a5ec4so7179539otp.1; 
 Thu, 01 Jul 2021 09:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tg55kCy9BnkaIPndB0hyuKuJD9G9ni7AlPPZSuQ9v3w=;
 b=EG/wdGjb5gh1+lTssu6tjjpWrw3VyNM79pDPJceh1pco9KxMnUvdoA32pMzrdeXOT6
 WyI2S/KFyZfUvMqCtWz9QQ05KMEuAGU8dRqzU/mNgyzHEtozI3hsTBnHFLTeufxHCSPH
 xbkQwEn4jpJ/z+ovT2c3o8FhQ9YK9WBw6UDQxrjiA/VseIeb8y2U7IBsEPSAwFzIQMeE
 wmZKXrjNMxac3IMgyCHwG5MP/WwZVd32GbR0RwxaA/pLvzjcUHIZ1ksqgyCQQa6/xF3Z
 1/ABlj4qnvAk6RSg/9VTSu1h79CwD3i4v8IfazBsXRNA1g8rRetIiRZlhZY86L3AYavF
 kjDA==
X-Gm-Message-State: AOAM5334DmNELlHaI9Ju3FGvc7g8X0+9FZRUFr/y/3JHJIZlx9VkKRx/
 b86NXlV9hykxrRRxbb5B0FJDn8Ym4s0UIQ80Xek=
X-Google-Smtp-Source: ABdhPJzJRnn4f+Vbn+ymJy286bml0QkXr0HrBOpFwNgfZMUVbXSNYFoo4KA1Pu2nyMOx8volQGLdwbVBVNuW2BqDwWI=
X-Received: by 2002:a9d:674b:: with SMTP id w11mr775865otm.260.1625157947244; 
 Thu, 01 Jul 2021 09:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210701004538.23483-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210701004538.23483-1-mark-pk.tsai@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 1 Jul 2021 18:45:36 +0200
Message-ID: <CAJZ5v0gtWRpbpL82Nh9VpkXQfOqMXAC08nNmEovHq_=xdwN=mA@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: use ktime_us_delta in initcall_debug_report()
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 yj.chiang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_094549_385535_A205DFF7 
X-CRM114-Status: GOOD (  18.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 1, 2021 at 2:45 AM Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> usecs is no more used after trace_device_pm_report_time replaced
> by device_pm_callback_start/end in the below change.
>
> commit e8bca479c3f2 ("PM / sleep: trace events for device PM callbacks")
>
> Use ktime_us_delta to make the debug log more precise instead of
> nsecs >> 10.
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/base/power/main.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index f893c3c5af07..d568772152c2 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -220,16 +220,13 @@ static void initcall_debug_report(struct device *dev, ktime_t calltime,
>                                   void *cb, int error)
>  {
>         ktime_t rettime;
> -       s64 nsecs;
>
>         if (!pm_print_times_enabled)
>                 return;
>
>         rettime = ktime_get();
> -       nsecs = (s64) ktime_to_ns(ktime_sub(rettime, calltime));
> -
>         dev_info(dev, "%pS returned %d after %Ld usecs\n", cb, error,
> -                (unsigned long long)nsecs >> 10);
> +                (unsigned long long)ktime_us_delta(rettime, calltime));
>  }
>
>  /**
> --

Applied as 5.14-rc1 material with some edits in the subject and
changelog, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
