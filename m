Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E51C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 01:06:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E8020775
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 01:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVXi18rq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WBRwXuL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E8020775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bHiTg3UzcRh6YqMfbXISc3jjM4TbbBfoYLM9LZajaD0=; b=pVXi18rqdulZJj9nvqWqzdAJ7
	U+6sUDMK/IRjTTxAALclT3CibkUI1mCMrJ++zhUjHIH3dBqXxBtKtxVxlYaEcoX4LKIK5DXSIZdVY
	xdrJvNX/EPWKZISUeRQMudHP6x4n8RSi59x/2+dCHYOQKrCMwRhgH95F0bF/ZGRTMCq2mWiTd/3sR
	hPFtmUXPf83CzWCuXQgNjDVfyZzLifQ0L7rrtU0bJD4FFExTo1cvOyVP+hJS0LxNqaMU8I19wig6y
	f6fRGheDn0aInRp5OQL7nEf89Bgk7WKYv5mdWq9ANEUXE/Nd6REDU7l/14vCUBpmu62ZanhgF7GZ0
	omAIqq+2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvsLq-0007ja-Gh; Thu, 16 Jul 2020 01:06:18 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvsLn-0007hf-QL
 for linux-mediatek@lists.infradead.org; Thu, 16 Jul 2020 01:06:16 +0000
Received: by mail-pj1-x1043.google.com with SMTP id b92so3840473pjc.4
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2020 18:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=e2rVUlKuuIkQy85IOtUCVSZFDO7sfvuCwv9FBlIGudc=;
 b=WBRwXuL1J49aFDX6OowkdQp60wkBLDyNji+VnP+47luf3SDgodM5CwOA/KeRQyBiK/
 Ds76Qrv97EixHLwWaFyaLiwTYTLZejCwlFlXIoUV0aQV3W6LmFuXJ0T9YbB3FvLVWKvL
 v9EEQ8v7wIiTl2OmiIYvZKqXM71Q7RR3K0iF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=e2rVUlKuuIkQy85IOtUCVSZFDO7sfvuCwv9FBlIGudc=;
 b=DBAuRODaOvx98GqZaPju6giZYTP6aLSQjRLx9R6KF6UkB4YBPHBQ9oHUyUUtPMLHku
 bXOSFxPhZUfJuKpCPp8F61+VkZJ6lgJZxrIFwEAcprCbn/7kbYc+jbNLrZSHkLcMWtcL
 xDUC4J7TlfjAb6I7pHCYMK9C2M2gnkDLh2shX9lMgrmjkfa8GjvgkWBVPcOPCCqGl6mo
 EGtimyUKQ/lL1Y5IHAxFs3MwAiSfzRtyCvzjpoQvCBv0f2NgxGdjH/884go5GYBQUeQT
 LilXWhoauH+XUMREKt6Hm1UrA4W91TGe812Ll8y2fW/THm49YyEMqUloXdAipjSNsPXh
 4xAA==
X-Gm-Message-State: AOAM5302A8Bed8PyMpVLJME3Cw0LIyWK+ppXw7q+5VLl757yg8Oijh4A
 hmnWiXAkWZg/UOqG/9M9xS346Q==
X-Google-Smtp-Source: ABdhPJwDuXNH1tttabpe1OV+jVg8VPDxCAe+DQNCQJLCDygr1r24B/9SZizwmtIKi2LthbUBcxYHIA==
X-Received: by 2002:a17:902:8d8b:: with SMTP id
 v11mr1626798plo.221.1594861572552; 
 Wed, 15 Jul 2020 18:06:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id j19sm3134274pjy.40.2020.07.15.18.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 18:06:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1594622881-6563-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594622881-6563-1-git-send-email-chunfeng.yun@mediatek.com>
Subject: Re: [v3 PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify
 code
From: Stephen Boyd <swboyd@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 15 Jul 2020 18:06:10 -0700
Message-ID: <159486157046.1987609.11356860908068064534@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_210615_916018_C6BB7692 
X-CRM114-Status: GOOD (  10.69  )
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

Quoting Chunfeng Yun (2020-07-12 23:48:01)
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> index 02a3a77..d567e20 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -29,24 +30,19 @@
>  #include "bdc_dbg.h"
>  
>  /* Poll till controller status is not OIP */
> -static int poll_oip(struct bdc *bdc, int usec)
> +static int poll_oip(struct bdc *bdc, u32 usec)
>  {
>         u32 status;
> -       /* Poll till STS!= OIP */
> -       while (usec) {
> -               status = bdc_readl(bdc->regs, BDC_BDCSC);
> -               if (BDC_CSTS(status) != BDC_OIP) {
> -                       dev_dbg(bdc->dev,
> -                               "poll_oip complete status=%d",
> -                               BDC_CSTS(status));
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
> +                                (BDC_CSTS(status) != BDC_OIP), 10, usec);
> +       if (ret)
> +               dev_err(bdc->dev, "operation timedout BDCSC: 0x%08x\n", status);
> +       else
> +               dev_dbg(bdc->dev, "%s complete status=%d", __func__, BDC_CSTS(status));

Different than before but OK.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
