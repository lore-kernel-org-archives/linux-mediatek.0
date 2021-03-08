Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E2AC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 13:41:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 772E1651C2
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 13:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 772E1651C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FKCBFAjQ7EUUoOwEM6ZIXKcYUJmOjBJ6DxH71zPd1a4=; b=Zp85KAhyL/3G9HuclwmnIRBrO
	7ojaXCHuuYkzv9DqzyCcdhyhCNH+nhpKsXr7QuMMIHdAnTzpfVLx/iU20b5ya67hSGHU8LrnCPzhF
	YluxS0PuGe+8h9m1nTWomlEVe4LiIiU6b6MvAHRj1nUVVzznECyatrXurcm0ANoIJOFxuGOib/0ZG
	y2zU1xuq316exNseVVtZV+VkIB4PHoYR7S6ly2M/OQoXm58kKgsJSH6E6OzLgxhgkG3L7EKgjPT5p
	JGGvPhlK9NO13DYH89Q4ZwvG3gOZu5mAfHNG27++s8PANiLSodeuGOp+GbdTREQoSq8E2cWZBD/uD
	1ocXb5jvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJG8h-00HWwz-Id; Mon, 08 Mar 2021 13:41:40 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJG7s-00HWhO-Lu
 for linux-mediatek@lists.infradead.org; Mon, 08 Mar 2021 13:40:54 +0000
Received: by mail-qk1-x736.google.com with SMTP id s7so9181048qkg.4
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Mar 2021 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmXU+4B3Yh05wPO2dTCkwdtjQSLG4/1qvxif7cROYeQ=;
 b=pvHQei8+E+5HPL6xfSHqPN9aNzy2vUJNGtq6VVgd2f2btP4+58I254GZfQEVWsF1zF
 nQmzPa/2jebHoP51nncWLcvUg3PjEHS9sYWr4uxKMCzGpgjRXyuZNnt1Qs6DNAS9xjHV
 foZuvFg47ynVVCgiWZ4ytQWS/9vBNik9ibJw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmXU+4B3Yh05wPO2dTCkwdtjQSLG4/1qvxif7cROYeQ=;
 b=U2uPijUaJd7mscHRUCkiJEqLAERkjwed3ExeQMGZzbiJnXLj6285cnySR9ZyR9xsFX
 sXn0fAPSSc/pKe+cDPNZOwmbXLGCVAoLlq0AF/YyzlpeyeUvh5nuaDn7xty2DCTfpe1C
 4Bc7DGRSzUv6ADTMkwU3SXh0/TZQBtcAVOAEzTZER7qYwYZKCl10haKVw6zg8h/eOkb8
 LjnjGAzTdyuPdWH3nrPc+NO0jc0nLnWOzMNBjEp6A19PbfqwCTp2aDZjClBl8pAZ2qAB
 r/K3kH8r3sGw1W+9e23rU3S0/VN9YUgut+lBsQgcQ6nF8tpXhstl8g+NB9XMugN6opIl
 +45g==
X-Gm-Message-State: AOAM533hd7riX1tt3V6zwWsCa1VLLcXJBl3O1zGTtGvanSYBWTP03Xo5
 2aKTR39AGtjql/QBFToMTG7Cx9N7mb/MEQD9McHtfg==
X-Google-Smtp-Source: ABdhPJwicXanOfSurZr872caF2q06P/DdnLaFBVEUAiV9z7HyChhULk1R9gqs4uIAdFKoOTMr46m4YqxGaYNy3hXV+o=
X-Received: by 2002:a37:bd84:: with SMTP id n126mr20169728qkf.54.1615210846918; 
 Mon, 08 Mar 2021 05:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20210308060538.11164-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210308060538.11164-1-mark-pk.tsai@mediatek.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 8 Mar 2021 22:40:36 +0900
Message-ID: <CAFr9PXmiR9Wo9HxhRLj-k6+O5qu-uLSTCvQRqW-Yqgkk8YK-Tw@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/irq-mst: Support polarity configuration
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Marc Zyngier <maz@kernel.org>,
 =?UTF-8?B?WUogQ2hpYW5nICjmsZ/oi7HmnbAp?= <yj.chiang@mediatek.com>, 
 Daniel Palmer <daniel@thingy.jp>, Thomas Gleixner <tglx@linutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_134049_454434_15D708C0 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

Hi Mark-PK,

On Mon, 8 Mar 2021 at 15:05, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> +static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
> +{
> +       if (type != IRQ_TYPE_LEVEL_LOW && type != IRQ_TYPE_LEVEL_HIGH)
> +               return -EINVAL;
> +

Does this mean we can't do rising or falling edge interrupts?

Thanks,

Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
