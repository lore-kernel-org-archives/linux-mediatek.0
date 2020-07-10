Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A849C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 23:37:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E8F42077D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 23:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/weK1MS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hLQNyhsf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E8F42077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=orgBfScC4cx88Atz7VKjtTUrMmwgZ6AA5OrRLn0rD4A=; b=h/weK1MSHIHNW9o5t5Yiy11tt
	AeoEbexB//HoTDCcRwhHc9zKKuCbJUDZwHz821l1v8un56JJZAPrLzBNb0+h2z1qP4JwGA+94fzcW
	ybAjwqMhYnycmCTj634nzagBIQXgiunDyvJxUMEbj5STqGw1D2VdU+eEt89d7FyoK3i16D/qrRqfU
	P420G+6bapCQo4hISnT6QuAuPZfIRyPWCE4LYiWTONGne36vwPPOlhaWG9i02MHcjHLhKgFUGN8iO
	d7aMyVqWTU+2iz1o6UEkZ9GUd9wYIOPU3RuFP77RIIq/izH1hpiNJXJZ/kB18L68B/4zKhc2ho8m2
	kaUXjcIQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju2Zr-00083c-Hd; Fri, 10 Jul 2020 23:37:11 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju2Zo-00082d-JA
 for linux-mediatek@lists.infradead.org; Fri, 10 Jul 2020 23:37:09 +0000
Received: by mail-pf1-x444.google.com with SMTP id 207so3208194pfu.3
 for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2020 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=M5HYE9/oTgOIRT3zwZ3pJYw3eOk8J4scLkJbJEU3a0s=;
 b=hLQNyhsfo3P3aiZPEk6EUW9Qho68hqFUIrArr6Wt7Bkc/rDv9E2zUOPgKTXqPW2llF
 hZmnnFasG39O9zPqp+uyQqrlQ0EHQegQWkMbxVqa+WkV3MUEprO6xxo07u8XOrCrM+RV
 KmIYjZ/O7NSfO3wh+ofhPRxidZ2PfxDAqGxhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=M5HYE9/oTgOIRT3zwZ3pJYw3eOk8J4scLkJbJEU3a0s=;
 b=FQC6KdBCJrm21lRaurrUKdE7bnhJ8rMppwpupUjZCX+Pu4ox730pfNu22PwknKIDak
 c0VJ7ajWXVDv3XYnLQxIKcWHfSm6Ve3jsJMxYelqKVdtCEhaYMWnIgY8yDFkDE/VGtce
 EF+iIdeY3TDnR6jl+ECqWN1EBgBGpD+bO9DqEs4F0QWTk+LbT1IR+YmOv1cJd4QSPuBp
 aBx5Q+d64RkOnWuQ0QvbmhprL+k3dELBGbxYXAU4UJPQF/PnrQLgDbS9U3+Ci14R561u
 CmIH5md7UViyWjE2BbW9g8SZujuhnYdiU6WJglePE8RrwriXPCGJ10Zfz+shNmcN72di
 ZcPw==
X-Gm-Message-State: AOAM530abq/P3JMZbzMTHxLpJomgSwURDD3mUAjXZkDqc0XTNhLtR/wn
 ggtXIKL1aqh8TWsBDS0i4Dvl8w==
X-Google-Smtp-Source: ABdhPJxEN9sfN7LGaL7s5SBwtbiWlG5R/He18NE/GtGNMYwKECUttin0lySQUNsIHCl3WvIjhRhTRg==
X-Received: by 2002:a63:6fcd:: with SMTP id
 k196mr38245663pgc.251.1594424224453; 
 Fri, 10 Jul 2020 16:37:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id c1sm6384803pgi.52.2020.07.10.16.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:37:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1594351856-876-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594351856-876-1-git-send-email-chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify
 code
From: Stephen Boyd <swboyd@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
Date: Fri, 10 Jul 2020 16:37:02 -0700
Message-ID: <159442422281.1987609.11864731950347548589@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_193708_723446_BBE2CA43 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chunfeng Yun (2020-07-09 20:30:56)
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> index 02a3a77..fa173de 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -32,21 +33,14 @@
>  static int poll_oip(struct bdc *bdc, int usec)

Can we change usec to unsigned? Not sure why negative time is important.

>  {
>         u32 status;
> -       /* Poll till STS!= OIP */
> -       while (usec) {
> -               status = bdc_readl(bdc->regs, BDC_BDCSC);
> -               if (BDC_CSTS(status) != BDC_OIP) {
> -                       dev_dbg(bdc->dev,
> -                               "poll_oip complete status=%d",
> -                               BDC_CSTS(status));

This debug message was lost in the conversion. Any reason?

> -                       return 0;
> -               }
> -               udelay(10);
> -               usec -= 10;
> -       }
> -       dev_err(bdc->dev, "Err: operation timedout BDCSC: 0x%08x\n", status);
> +       int ret;
>  
> -       return -ETIMEDOUT;
> +       ret = readl_poll_timeout(bdc->regs + BDC_BDCSC, status,
> +               (BDC_CSTS(status) != BDC_OIP), 10, usec);
> +       if (ret)
> +               dev_err(bdc->dev, "Err: operation timedout BDCSC: 0x%08x\n", status);

Please drop "Err:" as we have kernel log levels (i.e. dev_err() used
here) for that.

> +
> +       return ret;
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
