Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2677C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 08:50:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E3E20679
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 08:50:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hBH/jL6a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oISdFcYS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3E3E20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWCJ/5TqyqWer5NP4SrPQULKD9NjbOo3fJixC73G8gc=; b=hBH/jL6a4y3QwW
	kCjtsN6WoOQVRNBT/Zjctj3sMtNr83taM3UjhKvEZcArnhn3RezND2mdekSBV7fwpDZ9f0gTZmsc8
	DXBeJkn3THfrMB/JITLtACubt4aKuIQ2O7EHIYKpr3ZGLH9q7Sv4aA9Gl1tkR3S53GRfkriCZW44V
	NQdlzeOTDYQ6mK6xWk/aM8ZYUIhKwFE1tCi359HeezgORZUOdO6nRee6mC0mC9Vgw/7C+GdrC6oEF
	hKHKFunw8EuRIfm7HRT7nfVgYLh6QoyiL8GWRPlXQ00gq4ke4dSD0ClwiAT53186RTGpeIJFOWM8d
	mQA98rviDahTHCxzUOPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkkpL-0005bj-VS; Mon, 15 Jun 2020 08:50:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkkjf-0004TV-Ls; Mon, 15 Jun 2020 08:44:57 +0000
Received: by mail-pj1-x102f.google.com with SMTP id b7so5877777pju.0;
 Mon, 15 Jun 2020 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=myvNnjze95Yl2SyKV+SrVEtGJL4UPmr2kTdonMuTSII=;
 b=oISdFcYSOQZNDKsKZuBBTK+7unBXRFo+muI/V1jUc3IfXu3i7HmaqO+k2IqsjChblm
 xgKiEbr3IRoIzbdmFXzO62cdT0AcUo8LzLRd9WnCoWE6FHTzuNLG7QGW7lZhlFvAult6
 EzBIfeZUJ++8H4GKeNlQyAF4m6xYscy67qYLE+kusDfC+LzuidKlXdhA9dhO628EK/hz
 04ZRl2osW+mN5jz0r4gS127mX2uebX/qvvkk7ZfpQhhMuRnl/Ty9lhAqMuOCJjpDlGG5
 83xoWWLOVAdS22ZZGIOqmu9Y2ghUHftTcHtA2Ic0x0tSeLjpcMcq/I29llSpScOOtdlm
 a2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=myvNnjze95Yl2SyKV+SrVEtGJL4UPmr2kTdonMuTSII=;
 b=pOJYFeXCdf+2PWtbtO3S4lUYuFc0hzyqEzuUL8+IxlBqnujt6j3HcoD0EWYmnzqzK7
 ml44qYO9eRCq/6BBYQ5MiplFHTyKoG3JDAXYPLUR53xeV1fSjARu6ddbnyXiLmtCqsUr
 eRdqBFykB/Gnl5JHeTWgKF1x17mubQk9F5eBNKsJLqxhFVgk22RC4HfxsAQNUusBpw4o
 uhl1RxzGikDS43HLsIUTgK41rU0cKoKKz23zWZ+d7C+Lm8TGG2VXVoPtBVxJIM/N8kCf
 /wvP//UyhkG8A37aN0AgwEMmtZ6tUsVZgTemkvRhUi3bOPZMQIkYqCmhGEJxhyeWbK7g
 05BA==
X-Gm-Message-State: AOAM533NmqSVFa88s2qmHt1+TwjZoVg9HtXQ2PVZC7/Qk/BCuJcjL76J
 L0UWJnxN67m/UY+jZl6iWaHnAfi0uArzsUKC8nc=
X-Google-Smtp-Source: ABdhPJzZSVB9+37ZECL2ML/pFpQxuUFxCPGZLcIJ+xzsp2pcKjg11WpH23kGVz5r9pIbWTHuVH/fIRyg3tivNSH3Q30=
X-Received: by 2002:a17:90a:ac05:: with SMTP id
 o5mr11342618pjq.228.1592210693624; 
 Mon, 15 Jun 2020 01:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com>
 <20200521193204.GA14214@chromium.org>
 <1590209415.8804.431.camel@mhfsdcap03> <20200610183600.GI201868@chromium.org>
 <1591954266.8804.646.camel@mhfsdcap03>
 <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
 <1592205866.8804.686.camel@mhfsdcap03>
In-Reply-To: <1592205866.8804.686.camel@mhfsdcap03>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jun 2020 11:44:41 +0300
Message-ID: <CAHp75Ve12f7skOs1iW5U4=meP5-fXRppH=XMST6asQbjxn2OGg@mail.gmail.com>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_014455_916662_FE90FBED 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Louis Kuo <louis.kuo@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 15, 2020 at 10:30 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> On Fri, 2020-06-12 at 20:49 +0200, Tomasz Figa wrote:
> > On Fri, Jun 12, 2020 at 11:33 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:

...

> > [1] https://www.kernel.org/doc/html/latest/driver-api/gpio/consumer.html#the-active-low-and-open-drain-semantics
> >
>
> Thank you for the sharing.
> If driver only focus on the logical function of GPIO pins,
> 'n_rst_gpio' may need to be renamed back to the 1st version 'rst_gpio'.

Yes, we should not have any of n_* GPIOs, they must be marked as Active Low.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
