Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658CDC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 08:02:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9082120BED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 08:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IpVmxxnD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DbYbBgZ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9082120BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kvfiBrt9oZ9S69yMYr4ohD8O1WBhOs4+iUpftEuc9vM=; b=IpVmxxnDwjM02sT4flKAKXLA9
	2lOLQA+ya6GV71KfsjZ3RgRSbENHHeSWalb9d0IsSuMcOFs/ugR5TxOgIVo5yKY9Rd2221x6bXZMe
	YOEs9+emBtJDGrziLt7Zbf/kmYvjr0Vm2/KF9Ff0QhlbJg3uy6d9GaNAj2fKZ/xzy6EBRD3UZrlum
	1DfKG6irzx7EQCqktAygM7vC71GlP93kIH0VdETWJ1b8PPrgZrFb+BGOL3iFkdE7JT4zd7pEmcT/N
	GWKVSFwBeWdC1WkUPalTXVOgxUgEr2h0Se3HpRYf3slzl9/9MgnQsGV4FRg3Gu8ODaao4SIsltZdZ
	HFDyDGfug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSbjQ-00071A-W4; Wed, 14 Oct 2020 08:01:57 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSbjL-0006yn-Dw
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 08:01:52 +0000
Received: by mail-vs1-xe43.google.com with SMTP id l6so1564750vsr.7
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2020 01:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3SO3tpo8g36O18u0oTsmNryoKX09AzBl8HzOfu6KgoA=;
 b=DbYbBgZ8S2slO0gKKAwBS1h5tPnC5UOqXpXpJWvJJXORH1syj5Gj4P4kZp4lEtfqvk
 s3VZU45qRfiV88urjqeoUW6VgzhxZs4IFKz1TjSK0mq5+cKW3yFnXPx+k5bGLWHul2yb
 KfWLbpznyIO1QloLKpl3nVaEGUsFxYa5JTRY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3SO3tpo8g36O18u0oTsmNryoKX09AzBl8HzOfu6KgoA=;
 b=KtmpeMc4a5xckuAcjjoXcSwq9RZdlIDPZM8hmXNnv6tIZHz/zp5u+kAZV7DjCNalhU
 FS4982FmMG7QL/mePOlpyOgw0ABJ2P6FCMVTjDCy+syS2uzsF+cP5FKCMpgfEhoQvax6
 0trzc+Kf7HGzJPwaGwIOm1f/zoMgOLTpQJVLyVBKD75mhZ2yt5Njl8B81OG85oeoEz8K
 zk2rm8r6tKorR7pUaya7o+UJtogt7eZB6tP4uB5XqQ/0PVk2+nP160aALV7DA2t+JH+n
 +Ta2HN4D/8OJb063fcLtonfytyZ1AWYXOjnUdA7SHmnOEkfNkTfqfTqEFxfoEfI7QCNx
 yOAg==
X-Gm-Message-State: AOAM533/YkO22jRq5+Zbga50Ih5XhWYHc/UOL1558t2+WbwcZEQiRj/d
 03fMPN8u9z9N9LrNUIMUPWjvrE4O7hmbbOwNWKD4Cg==
X-Google-Smtp-Source: ABdhPJy4vPRWpqm/Lif01f+pNzCo9hDq0DItgcGHT0TGikh9kiap2X7FLHy31dzvgFI2Ge6IgyErPNRyNZXr1kxDxFs=
X-Received: by 2002:a67:7d93:: with SMTP id y141mr2580312vsc.21.1602662509278; 
 Wed, 14 Oct 2020 01:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201012124547.16649-1-wenbin.mei@mediatek.com>
 <20201012124547.16649-5-wenbin.mei@mediatek.com>
 <72ae1d89-fe31-4f50-15c0-29119d662ea1@gmail.com>
 <1602642530.11864.3.camel@mhfsdcap03>
 <CANMq1KBe9u25yDxg8UtmOX4vhr8De=5-pJyMRkSBF4O=FpBN9A@mail.gmail.com>
 <8bcc800b-fa1a-a42c-9fb7-a7546e889694@gmail.com>
In-Reply-To: <8bcc800b-fa1a-a42c-9fb7-a7546e889694@gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 14 Oct 2020 16:01:38 +0800
Message-ID: <CANMq1KAnG5Z=GZBqUhz9FdWx9-bSkUs3FgZnURjvzeHTrpTWGw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] mmc: mediatek: Add subsys clock control for MT8192
 msdc
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_040151_501200_C7C59AA3 
X-CRM114-Status: GOOD (  19.36  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 3:44 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 14/10/2020 05:06, Nicolas Boichat wrote:
> > On Wed, Oct 14, 2020 at 10:29 AM Wenbin Mei <wenbin.mei@mediatek.com> wrote:
> >>
> >> On Tue, 2020-10-13 at 17:10 +0200, Matthias Brugger wrote:
> >>>
> >>> On 12/10/2020 14:45, Wenbin Mei wrote:
> >>>> MT8192 msdc is an independent sub system, we need control more bus
> >>>> clocks for it.
> >>>> Add support for the additional subsys clocks to allow it to be
> >>>> configured appropriately.
> >>>>
> >>>> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
[...]
> >>>> +   host->bulk_clks[0].id = "pclk_cg";
> >>>> +   host->bulk_clks[1].id = "axi_cg";
> >>>> +   host->bulk_clks[2].id = "ahb_cg";
> >>>
> >>> That looks at least suspicious. The pointers of id point to some strings defined
> >>> in the function. Aren't they out of scope once msdc_of_clock_parse() has returned?
> >>>
> >> These constants are not in stack range, so they will not be lost.
> >> And I have confirmed it after msdc_of_clock_parse() has returned, these
> >> ids still exist.
> >
> > Yes I guess the constants end up in .rodata (or similar section), but
> > I'm not sure if this is absolutely guaranteed.
> >
> > In any case, this is a commonly used pattern, so I'd hope it's fine
> > (just a sample, there are more):
> > https://elixir.bootlin.com/linux/latest/source/drivers/pci/controller/dwc/pcie-qcom.c#L266
> > https://elixir.bootlin.com/linux/latest/source/sound/soc/codecs/wm8994.c#L4638
> > https://elixir.bootlin.com/linux/latest/source/drivers/mfd/madera-core.c#L467
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpio-dwapb.c#L675
> >
>
> Alright, then this looks good, sorry for the noise!

To close this in more satisfying way, I asked internally, and +Pi-Hsun
Shih digged out this answer:
"""
C11 standard 6.4.5 String literals says: "The multibyte character
sequence is then used to initialize an array of >>static storage
duration<< and length just sufficient to contain the sequence"
"""

> Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
