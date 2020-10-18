Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E6FC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:44:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46661206ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gwm+qtBO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VMvrkPOj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46661206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gMwL5bXqO5RbkRSfqF77OQQSA7p0KQHyiMKbinnT1L8=; b=gwm+qtBOaMPVIDZcQvEvsx2JI
	UisQFePHfYyDMHMgkc4s9w8+ItRvCWTIL3K16EG4258m6WMXIYSVzynfyeXER9J+YMFT8d50vWne4
	N7ZjO50WABLNApMCR21PirS9QwGtpRP7thQzhUeAKRmdvJsTj3ANMYB90dbbbFpwRQUUZLQ74tje1
	CdBum/Mkn0s0QRvpGkRO8g7Ah4kBj6i+/iZG3I9HntLC4MrOy2nxit9q31d5ULoLucEJcYaPy0BMy
	fUwpW9BiWpub6XBIAWS/w4A54w2rp1UKDG0d3R3/c2bbTa2QZBxhnQ9ZEqjVh1VLdeCLOImmrh2oL
	tE+xufWQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUEb4-00073a-4l; Sun, 18 Oct 2020 19:44:02 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUEay-00071G-IR
 for linux-mediatek@lists.infradead.org; Sun, 18 Oct 2020 19:43:57 +0000
Received: by mail-il1-x141.google.com with SMTP id p16so8342917ilq.5
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2020 12:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pWenhFesr1w3jNOrHoKxpIn7aIFwj8qNewUZEqgfPdM=;
 b=VMvrkPOjHLlUI4sI2rGOGrISxzwGTODFlquH0zCr68cYhcIzYg/MHdPtegAja3vzVw
 Lu+TAn7km0+xlnYQyM1xJS8hq3q73WvmTpICDR4AwTamcnLbCwvquMZ3KbGvgusTKw2Q
 2qpBvGIjMWb6GtF5HJUNqK1yUBBNMA+GcEjKn7WNoFbNz0405900KcycpwxBG10xc/gH
 lMd/6ncCX7lUP61gfFhdD+FeqB7kKrIbRx2WjIOjl0K13gCaOn9cXTW+xhlzRLXS/4Uo
 BYns0JcvGifKCUYamerAe//rCV6IKDoi8F0IgF1UALU+6FIQpd5d2TarzYtWPAi/CIf5
 ve6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pWenhFesr1w3jNOrHoKxpIn7aIFwj8qNewUZEqgfPdM=;
 b=tkmsNPKX324qYZgJ2Ng/jqtV7lFD+KRX8WTLXrw07ozQaQamIZ3yK5tIpu8PBlaXaU
 WwtEL/2QDNHWl05p0Smd6nkBucyFkLjJ0yhrwq/KobgWoQ2eblyRlQMR9xr/nwTx9nMD
 TJpuxn0oCZitEzdGMhtN4NhSBg8GFBkbX/GK8zrNkjCHW5tqBqyhsL+BFqm9nLCQybdz
 qiIELg85i0kYJA2isTenIlLtK9xEsv+oCejBiLjxHv6XP91xmMoaa/fNF8FHDTQ/4TL5
 YnXggiEiwfZWzLnKE0KxJlhNXlonEJThdumkm52priZZ5/Gq5Wf1lyzmQvgdVbAJhugm
 MzmA==
X-Gm-Message-State: AOAM530LaxRfXTd1TQXxL315mBURJchARxf0Mlk0sgN4NtrEwSEIBGGj
 qj/fxdxFfNAwG0dZuUEI4zTq1sOHbaqBwbQ/ro/9XQ==
X-Google-Smtp-Source: ABdhPJzVCY4CXlJo5Yk7DLu6Jm6h8fkfHziS90cktjXSQwP51sBX0o/6i7dgEM8BHuTRh478qb6FII0oYpE820vpB5c=
X-Received: by 2002:a92:c5af:: with SMTP id r15mr8834836ilt.88.1603050234668; 
 Sun, 18 Oct 2020 12:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201018171545.3190476-1-fparent@baylibre.com>
 <CAHp75VfJUhA3WmmirctmrieQfZKSNerFa=nwPmBYvffXUTRp9A@mail.gmail.com>
 <CAHp75VdFw5jy10QSOFbJVyObqEmiaavFM=BFd92kw1AH4rMxqw@mail.gmail.com>
In-Reply-To: <CAHp75VdFw5jy10QSOFbJVyObqEmiaavFM=BFd92kw1AH4rMxqw@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Sun, 18 Oct 2020 21:43:43 +0200
Message-ID: <CAOwMV_z9B4suGd33H_D6ep-UpXn2W2QyTd8az2C_NERMFALWVA@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adc: mediatek: fix unset field
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_154356_642597_3F12229D 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio <linux-iio@vger.kernel.org>,
 chun-hung.wu@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <jic23@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy

On Sun, Oct 18, 2020 at 8:33 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Oct 18, 2020 at 9:31 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Sun, Oct 18, 2020 at 8:16 PM Fabien Parent <fparent@baylibre.com> wrote:
> > >
> > > dev_comp field is used in a couple of places but it is never set. This
> > > results in kernel oops when dereferencing a NULL pointer. Set the
> > > `dev_comp` field correctly in the probe function.
> > >
> > > Fixes: 6d97024dce23 ("iio: adc: mediatek: mt6577-auxadc, add mt6765 support")
> > >
> > > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> >
> > Shouldn't be a blank line in the tag block.
> >
> > I think Jonathan can fix it, but be more careful in the future.
>
> One more serious issue, you forgot to add tags you have gotten in the
> previous round.

Thanks for the review. I will make it easy for the maintainer and send
right away a v3 that fixes both issues you pointed out.

> --
> With Best Regards,
> Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
