Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CA1C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:44:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C5823107
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C5823107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S2j5q7rIo4GPj5otJk0H31XJaralQKg/nVAyHtJMZRQ=; b=jGo4vCVWlfgDGfrhRZBtfb4xt
	AmSsRU0NHKAQf+0YZnPM1K4LMZZNRrnh8ojln7cLYi+A0vJKsLNUuBW2YOYNSBJ4xffxaHIvrQC2V
	KlKV2h+tXuTC+jHDfq7aD2QWPm5L/j/EBGED48x+f7+k0NsmfSwAcfbl0UHgc8J5Z+frs3chU+4Q5
	uMNwsa4KmSJV6ayS/htr2bf1vnj6zhAwQerUZwJo21MU0iJIKTBnynSmwZCHJFU2ahNVsGB5NYjT5
	Eu/Wz1ZVyKPdV9cGLJYoVOIxWy7sGBYVEOVSP0tgYDbZ99fn4ydlFo06RPObK8vhUNy9mpXdu6wHw
	GDBByrI3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx4Ql-0004LA-Lc; Wed, 06 Jan 2021 08:44:35 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx4Qk-0004Jc-77
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 08:44:34 +0000
Received: by mail-vs1-xe33.google.com with SMTP id z16so1413748vsp.5
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 00:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8BtqrpAZ+ssFRAoqkcqoX+i0pgFKIbpTJROkFhKnB54=;
 b=X6NOAGdSiz/IW64htDr3odCGFCPzWLdw7XHUJBvbZ00IdN6jDKzb1siXxIaPi6D5A4
 5SY3alIe8rbRH0qev5KIOe0isaJ7wHkYHKpmsWbmKEocFdYPWRLY5uyQIMJum8Q1qUOk
 bfZgrO8BjvLdMl6IN7roLOGRKB7/n15FTRqJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8BtqrpAZ+ssFRAoqkcqoX+i0pgFKIbpTJROkFhKnB54=;
 b=YiA4PJc5/CFwhXs2GkWtz3vRPAhIaHhjlK+DRUtW/c578U589f1NauNAuYbHwGhv5V
 gnOZiRjoB5iLrkam2FSjVhjHm74VUeGSvIsYfFN3iBxWlZjibLSdxzEYpoAP1JsXis0f
 BrFaiHmo0/tUWWpjvlx61E0tTZww4r0HB+2wjAcbNGr9Two0i1xjtgB5NEY1jwu6uNMH
 cL2U8mw1EaMB5C41Sh/6a1kF+tVib92Nc8t3BTv5ZtpfHNlCrzBHqlwWqJfyKs3KJfU7
 4ecRDkngEH+6/2Br8r/EiE58e5hRNgTVlNG5drELgTPAthLFyi8897nbZNCZgAKtB4oj
 +MHQ==
X-Gm-Message-State: AOAM530bw2j5pmuVssTK0XXQwtikE/QGKnhzUqqu0xGHMBaZgiNh0jV0
 X2R6hqst+xBPkpMLEiEudSGO01zYb/t9OC4V6pTDQQ==
X-Google-Smtp-Source: ABdhPJyvWwQuY4TJxmlVoIBqvuScGueMmhttXzbYyJihh6nXvK0B7iBhP8fCeeXeXIPqoFUXoWoASZIehmQdnjNOooo=
X-Received: by 2002:a67:5c03:: with SMTP id q3mr2298164vsb.47.1609922670668;
 Wed, 06 Jan 2021 00:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20201227105449.11452-1-roger.lu@mediatek.com>
 <20201227105449.11452-4-roger.lu@mediatek.com>
 <CANMq1KBNKy708Vz67WOc+n7V7ne4L1EZVkUVGj6abd5voxKjxA@mail.gmail.com>
 <1609750266.20758.40.camel@mtksdaap41> <1609922515.18506.17.camel@mtksdaap41>
In-Reply-To: <1609922515.18506.17.camel@mtksdaap41>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 6 Jan 2021 16:44:19 +0800
Message-ID: <CANMq1KCDPn6vRXMC5piH=Ym+ZGTiF=B4KAJ-5iKSWwVQLWgYNA@mail.gmail.com>
Subject: Re: [PATCH v10 3/7] [v10,
 3/7]: soc: mediatek: SVS: introduce MTK SVS engine
To: Roger Lu <roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_034434_303739_22C4EDA5 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Nishanth Menon <nm@ti.com>, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Angus Lin <Angus.Lin@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 HenryC Chen <HenryC.Chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, YT Lee <yt.lee@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 6, 2021 at 4:41 PM Roger Lu <roger.lu@mediatek.com> wrote:
>
> Hi Nicolas,
>
> [snip]
> > >
> > > > +
> > > > +       /* Svs efuse parsing */
> > > > +       ft_pgm = (svsp->efuse[0] >> 4) & GENMASK(3, 0);
> > > > +
> > > > +       for (idx = 0; idx < svsp->bank_num; idx++) {
> > > > +               svsb = &svsp->banks[idx];
> > > > +
> > > > +               if (ft_pgm <= 1)
> > > > +                       svsb->init01_volt_flag = SVSB_INIT01_VOLT_IGNORE;
> > > > +
> > > > +               switch (svsb->sw_id) {
> > > > +               case SVSB_CPU_LITTLE:
> > > > +                       svsb->bdes = svsp->efuse[16] & GENMASK(7, 0);
> > > > +                       svsb->mdes = (svsp->efuse[16] >> 8) & GENMASK(7, 0);
> > > > +                       svsb->dcbdet = (svsp->efuse[16] >> 16) & GENMASK(7, 0);
> > > > +                       svsb->dcmdet = (svsp->efuse[16] >> 24) & GENMASK(7, 0);
> > > > +                       svsb->mtdes  = (svsp->efuse[17] >> 16) & GENMASK(7, 0);
> > >
> > > Again, if all of those values were u8, there'd be no need for these GENMASK
> >
> > Ok, I'll use u8 instead of GENMASK. Thanks.
>
> After refining the codes, I think it's much explicit to assign the bits
> I want by GENMASK() and will remove other GENMASK() that are repetitive
> like in svs_set_bank_phase() or svs_set_freqs_pct_v2().

I'm not sure what you mean, but, sure, you can go ahead with v11 and
we'll see how it looks.

Thanks,

> [snip]
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
