Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA8DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHNIfdjsRBbJSJukL7iEemcqxZrmlZUGeiLA6Z/aBOE=; b=lYncOLgDCt0XaD
	XGnClNblFWPjTA/Ao7FLUSIAImbB3ZmC9L/+U4vhv7o4QbVpe3Z3HNwAxFwQKOqTjyt0n7LMOv05u
	lffdhv6/aFyr7jhBgFp5Mr/fbvZmCuhxVGusEP16kHt615aibUBQamrw7xHdOfddz1x/ib31Ch8HL
	wgdA95/UJJJkkj9AP/TS8pY2fQTKqc19usCpn5nZciEJIF1xJJ5M1nE/ZcfNRWtljK4QCh38kHRcW
	NCJ3VBareB21xglbgcaF5xfm+TiUV8GXtXYT+FcapFLBfjgxIwzE3pQ7HwHxtXn1Dgbduh43e8g1O
	o7RlCDYRfHGyXtqbFS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKitT-00BIbe-Qo; Thu, 17 Feb 2022 15:40:31 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKitO-00BIXl-AW
 for linux-mediatek@lists.infradead.org; Thu, 17 Feb 2022 15:40:28 +0000
Received: by mail-lj1-x22d.google.com with SMTP id o6so15754ljp.3
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Feb 2022 07:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtHuVZsN9dq8Ef87/aHczhTpVzC+pvWaYD+ZfU02gIo=;
 b=DI03Q5WXZVS9ul6CojxIkkW4nz0ZO8uejIIb6VmNzipMI4NSLJuTUuNVVF8WnOFPAk
 ETS6C8BnZIusFEeLd24/3GcTkvUN/KMupJrzeOYeA7tKvdIomQivWL/B3zy0zY/tPlWx
 qZd8OE4OY3XIcUeT56fXQg7Hw3ayHOmVCKvDHuwxw4crgO4MVGVUQrERnwTHeExrETVI
 5SmD7k91ENizvCB6TkQp/RzxY1OH9FxQ24PYKDpYCZa7+veM6B71vzU3wVeuJytFMcjb
 NcYwsjepH5AqvNSOFhYwssoKWSW7LOjr9PgcAHHYaWL9iU46/fTADC/Xvtya3WEZDAsS
 +HSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtHuVZsN9dq8Ef87/aHczhTpVzC+pvWaYD+ZfU02gIo=;
 b=D/biXE8yiCMv2UmLX9D7D5lHbqVjYf2DobmnldEWkBRF9v+fY8LSYI5nHW7ChmtsvO
 SQRS3FRhQSWP+gwP77HTHYB3qiuQplH9dMQmQV0JqIPJTfLcpEKYGGpuuEQkFeYbss2a
 N9cuZCI6rEtW28KagAs6wuayvXVNCZvQEeveFYYJzAnxJLFgNldHhtKnFw/F9RxIPfvN
 H1+adE94HJBorALaYJx0pXNH8IfJa6j2sr05aMFNbeSD2UB7uJVYF8y3/5Yo8OF3Jivo
 QyCCTb90mDI0dHZ1uZiXMT20wq7ar0K0mNdqL2/xyKxE5dzvFagX6hH7+MQyAfDPv9wD
 mXqg==
X-Gm-Message-State: AOAM531T7vjjspEFhUWNWATGL5gB0ZGn9q5zyWNKk2E7F0326I46NxZ2
 fN1xVMzqd9qe1DFFUZt6jVPRJdT/eS2Z2rd2XjAy1g==
X-Google-Smtp-Source: ABdhPJzS1HsQQFljNPEfdzoowpGZXeJXTbt7Iuq1OuK3MM2rhphn87bPRKA7/KY2OrtWgxD7W1s9ZurapEW2QYPSaeM=
X-Received: by 2002:a05:651c:c7:b0:244:f9d7:7c48 with SMTP id
 7-20020a05651c00c700b00244f9d77c48mr2735695ljr.300.1645112424989; Thu, 17 Feb
 2022 07:40:24 -0800 (PST)
MIME-Version: 1.0
References: <1644395927-4138-1-git-send-email-wangqing@vivo.com>
In-Reply-To: <1644395927-4138-1-git-send-email-wangqing@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 17 Feb 2022 16:39:48 +0100
Message-ID: <CAPDyKFqg5N1tCqQ2u2jt5qU0qLuDJRSJRtq_aMVDc7XNDbRvkw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: use div64_u64() instead of do_div()
To: Qing Wang <wangqing@vivo.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_074026_403995_6DEFA293 
X-CRM114-Status: GOOD (  15.15  )
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

On Wed, 9 Feb 2022 at 09:39, Qing Wang <wangqing@vivo.com> wrote:
>
> From: Wang Qing <wangqing@vivo.com>
>
> do_div() does a 64-by-32 division.
> When the divisor is u64, do_div() truncates it to 32 bits, this means it
> can test non-zero and be truncated to zero for division.
>
> fix do_div.cocci warning:
> do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 65037e1..777c9a8
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -766,7 +766,7 @@ static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
>                 clk_ns  = 1000000000ULL;
>                 do_div(clk_ns, mmc->actual_clock);
>                 timeout = ns + clk_ns - 1;
> -               do_div(timeout, clk_ns);
> +               div64_u64(timeout, clk_ns);
>                 timeout += clks;
>                 /* in 1048576 sclk cycle unit */
>                 timeout = DIV_ROUND_UP(timeout, BIT(20));
> --
> 2.7.4
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
