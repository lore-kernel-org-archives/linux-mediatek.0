Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDED6C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 15:08:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A51A722B3F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 15:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A51A722B3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ocgcm8yl/M1EZ/cXZlRwpkVPI4C0T5RZeGWF18VaSUQ=; b=sJWwqemwL706xEB6KSAsDpe/f
	CMZiESJEN3wg2lzUqDcL3sZwxTgIb6dqwXt6q9i0yXLX7QaZnbnCKPPdPYJHAmghftacp/ge/RE2W
	muEuKXc1zQtEG1V3PHlkmdk9hueSK73ooHna/0e/bHJ6+k4soQDQjDfuw2DWY6n8F8qvNbiSNtub/
	RIKoaAE10L6bZIzUq0jhfR6AIHOZ5Dy+PLUdBIr7wqrJf7Jt+iLXh1vUIgm649SSyrpJ4sy+f8xYj
	F8zCQsE5st47eVM/JPQwOGBXQBoRNePwCUOCIJ1SYjd9PjT6KaBzp2dXk39EU30e1r2OCh/aLlfm4
	rlZ2ABK6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klCgm-0002jB-Ac; Fri, 04 Dec 2020 15:08:04 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klCgj-0002iH-Ko
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 15:08:02 +0000
Received: by mail-lj1-x242.google.com with SMTP id y10so6969103ljc.7
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Dec 2020 07:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ugm6nci6pFkFE2fZ87+ANMj4imEPU508tEZXdZdhnMQ=;
 b=p10DaLJuegWL96xzPso5dt1qrw6xgzlmwOoM7oDf4usYdru+bxc+QbiI4MBs0YwHmi
 6oYgnLKlWYw1ZnKUnLeB7VKUYbBS+z/zYK3cEE1d0bQdYbpNY3CJeydIU/+NIpsbQMW5
 5iwMSzHgpA6DWxGvawABSI+IVSiyfjJI41HzjVKEB20clw9Zl5+2gkiTqPKtdHyuxDfl
 FG3bz3narKSAlfO9TG9AlBHkq7IZCnJrkybg+hhCXgXgw2fjHYLEB+UyYdial0Fwh5hS
 oYUAqoD6vY+TVj2LU5U7mJ7WDGKQhJXll4/P7SWUXLuCqwzgruZH0zLIrw+poQm498F3
 /HIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ugm6nci6pFkFE2fZ87+ANMj4imEPU508tEZXdZdhnMQ=;
 b=KN7XKgeDzMp+xDm+IXF7d8LapK2jIEhbUILIYnlek13XUuxgOftgDCvp1woxFIAbbJ
 NAj3+x+xDuLfaJehooO9WNR9f0VdieDf4K9zirwKPx3XHMTcTHBPrX8Tqr452N1dq5T4
 ZzVGYu5sp30mjxUcev+RAM6alv30TgeVUH//+0S0QqvtgVbXYlx6o+XRu4MATYd2QR8N
 v1eqNxMmFaYR406u0+mECoVhghhadLIyy5w9HFqyTkX3W6fzfiWf6IauBh+pw0Am5Cq7
 EvC/ji4xKfPggTxXqA1QrHU9PkNSbv1ANpO3hvM9Kbw7Xy4y2WywTw3n+GlTYPc5hgxs
 ZIAQ==
X-Gm-Message-State: AOAM532gmXnwXBfehRM7N5qVsdRtFLKKkALy0O8/URlS6DP8Qd5ZKiNJ
 QVDpJtAPuKlNSS3EuJ2qAGnyWpY2nr9TTQ3ACaI4BQ==
X-Google-Smtp-Source: ABdhPJzHIwMUOmMN2sHISP7xlPGum+N6euE1+Z7nIc8dnisLvUyDzFd9N0UJu6A2WfrDU5SsPk6AJhpJ3zSMrsEzK6g=
X-Received: by 2002:a2e:80c3:: with SMTP id r3mr3574649ljg.391.1607094479850; 
 Fri, 04 Dec 2020 07:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20201118063405.24906-1-wenbin.mei@mediatek.com>
 <CAPDyKFpHAWBtxLOOvvqmAYFAwCsV66s_LzzVJg-zfXH5QE++Ng@mail.gmail.com>
 <1606266655.11864.7.camel@mhfsdcap03>
 <CANMq1KBwtZNgkK5mEUdOk4sq05aXqQ59QsqYqapPqQr7DEWgMA@mail.gmail.com>
In-Reply-To: <CANMq1KBwtZNgkK5mEUdOk4sq05aXqQ59QsqYqapPqQr7DEWgMA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Dec 2020 16:07:22 +0100
Message-ID: <CAPDyKFruM-5MbsPGAt9zvZJFBdRiUuZcG3gphkBJV+y9-Z=VwQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: Add system suspend/resume interface
To: Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_100801_735312_32653F6A 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 3 Dec 2020 at 02:29, Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> This causes a 0-day warning (on our chromeos-5.4 backports but I don't
> see why upstream would not be affected):
> https://groups.google.com/g/cros-kernel-buildreports/c/MfS3SInT5jg/m/Hkzxh_U7AwAJ
>
> Didn't look at the details of the config, but SET_SYSTEM_SLEEP_PM_OPS
> is a noop if CONFIG_PM_SLEEP is not set (while SET_RUNTIME_PM_OPS is
> noop-ed by CONFIG_PM).
>
> So I guess msdc_suspend/msdc_resume should be guarded by
> CONFIG_PM_SLEEP instead of CONFIG_PM.

Yep.

There is already a patch [1] in my queue for this. It uses the
_maybe_unused approach (Arnd prefers that and I don't mind).

[...]

Kind regards
Uffe

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20201203222922.1067522-1-arnd@kernel.org/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
