Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25E9C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 11:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A948261409
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 11:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A948261409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDGG4J8Ip5p00WRtikowj2NRyaJS0zzQRvIuusVJpBE=; b=HBUT35CazfCDWw
	eUO9kx5QZt2I0LotgGTAshhlg986vzWXxcD2wo6Lo7F/FmVJ7b1UB5NfIvKqRORiYfYUvxUvowoJN
	vXyoVWcxwDv+PigP4KcJW4o5Pw4WQ3h8V4FVNsHnJiXOGWQbPPpJNIIl5bPEx0GmPBs0DgsYOdKA3
	ALwIex7gJy/qtmRs8mtse1hL3YeIsbTSYgD5yrN8QlRDL4m83mbUEoj0sG99Em2kPUEZPoghlYOw8
	oRT3YK49TH2VAbXG7KmMEp6oMf9ppGZ+cNk0DuU5V+mgK034hKjAFuB/3cX22TyHH/g36dAYsY+eb
	jERqiFiuVIC627epKr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyY6Y-00DgeL-Dz; Wed, 30 Jun 2021 11:10:06 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyY6N-00Dgbk-6x
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 11:09:56 +0000
Received: by mail-lj1-x229.google.com with SMTP id r16so2717494ljk.9
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rm4+AwW3LWH2YQHGgTfNo9gJL+afdzfJtfRIoJfvAJc=;
 b=IE4nSEae0+ZNPzwJoKlwld0IYMdDWkixjHhLI3tUBqdFmS+a6KK5cYvjzyrNiwZmdF
 Z0m6eXqZtwFMVuQd3GrlSzs2UcjhKOZHgP0a2+UvPrLvGf6REbtdTFZU1RZeiK+YMpi+
 XfOkbN6NpLc+GUcqYnxdCqJta/t/pBzt1xKP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rm4+AwW3LWH2YQHGgTfNo9gJL+afdzfJtfRIoJfvAJc=;
 b=cuPGcYLij0EbzSP/I71q2GaMzqMFaFo1lbI3IrK9yFWie7NXqwDNEVdv966jxEKqgX
 3Dz9BFyqTPhRtxuBKf27ohrCrBaQpWbAe0VJHHOtJEM9C8p/fL2cxaafGjCqCERUbwEp
 L/SDz59k/kEpsLjeCb9mvbf2udnlybWeama8+llPZE3Fctv4756R/9V3r0BytQv45OaW
 478v0LSfu2+LaY0TMcHB0rrsYlpPZV0tyPjnrXklxOtoA2Din/4ztX2wETOZhIngfXfZ
 zYN+mk4LCAA4DxjE9PVWDSlognsFTWIrdzxNgV004s2ozU71aM41TkXg+o+Cmp0Ija3k
 vNyg==
X-Gm-Message-State: AOAM532O6XOOMiOe5hotQHRaZr69zxQdWbJtZDmApCtjn27HTfkNJpIw
 vSp38gzd4mpbKQbpo3m1YA6r3E6hY4f4TwvRKbXQmQ==
X-Google-Smtp-Source: ABdhPJzHKuADQa+MobKZ58Bk27asyyFyPDlClM32paRLGxROtq0/z4kqJ9wzvBtX+VJ0lDLBPbqJCGectO03IhUHOfg=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr7332089ljp.251.1625051391558; 
 Wed, 30 Jun 2021 04:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-4-chun-jie.chen@mediatek.com>
 <CAGXv+5F2zTcqnjH2ud38vUD149KJtgxhPQME2Mk6-vGtQv+2YQ@mail.gmail.com>
 <ff6179e8-06f9-fbba-c704-a74381c2149a@gmail.com>
In-Reply-To: <ff6179e8-06f9-fbba-c704-a74381c2149a@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Jun 2021 19:09:40 +0800
Message-ID: <CAGXv+5FXuMnhsnytLYKKA9YE97bps7KnkDNADvv8f_wdTqnrfg@mail.gmail.com>
Subject: Re: [PATCH 03/22] clk: mediatek: Fix corner case of tuner_en_reg
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_040955_336239_51FD682A 
X-CRM114-Status: GOOD (  18.12  )
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

On Wed, Jun 30, 2021 at 6:53 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 30/06/2021 09:31, Chen-Yu Tsai wrote:
> > On Thu, Jun 17, 2021 at 7:01 AM Chun-Jie Chen
> > <chun-jie.chen@mediatek.com> wrote:
> >>
> >> On MT8195, tuner_en_reg is moved to register offest 0x0.
> >> If we only judge by tuner_en_reg, it may lead to wrong address.
> >> Add tuner_en_bit to the check condition. And it has been confirmed,
> >> on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
> >> clock square control.
> >>
> >> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Though you might want to consider converting these types of checks into feature
> > flags.
> >
>
> Yes I think adding a feature flag is the way to go. Luckily there are only a few
> SoCs that will need updates at the same time.

I also see that the different clock modules are tied together using only clock
names written in the drivers, instead of clock references in the device tree.

Unfortunately reworking this would likely require a lot more work. I previously
did a bit of internal reworking for the sunxi drivers. While not the same, I
think the plumbing required is comparable.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
