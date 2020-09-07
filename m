Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF58C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 13:15:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DFE0207C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 13:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UlMDRTTi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tr/UEPlB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DFE0207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZdTIkMpVu91qDLz2zdX3waZC4QzMUD+pSuYHPF8kdYY=; b=UlMDRTTiYPMs6Yy0GkOucjO4I
	kuv54YFtgRG2C5Cr99zzwvGD9GeO5SOAvD6PZgoGJ/mdmyd6sYXMBJPzZwwIbsg6/gVgPl4MK8YH3
	9xBuzGdSe/k8lC/LRqLkXyocNXITP/u0geGZ1KghBrLiTwWNDpLReewVqsBLmZBO5p4P2G182xbBo
	jyUmFgcRacSxVehlJ2U64ftAF0Z8jWQHif8+MFWQuJLs+QcRY3ykbYPfqZH3OqwdPSuZymqgDxJfz
	IFYPFJfNZwnVABK+ka3ohdFef1KNLy5BVBvoi5wHXx2d9KtlnM9Q5kxd1Xt5u8gp/y4z4MeDLhr3N
	QZ8C03uBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFGzg-0007Jl-Q7; Mon, 07 Sep 2020 13:15:36 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFGzc-0007IC-E6
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 13:15:33 +0000
Received: by mail-ej1-x641.google.com with SMTP id o8so4982781ejb.10
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gw9lL2TvHDntCUhAnmDZSsRD6P570jc9dLDcigHjLqo=;
 b=Tr/UEPlBz2fsDMLmFd0VCTGHcFQoc3bi3jh3lDW53ENl1TrQGuLEKeEciByE6ZA2WD
 XSmZEXdGl7UtzQnOv0mi030b/ZpXsd3jp6njzQGgvSUCvjgszzE07oO7iR4juvN86L83
 BBDqz5v7eDZQXHBAJ4NVL4rmU5c4uIBCozDxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gw9lL2TvHDntCUhAnmDZSsRD6P570jc9dLDcigHjLqo=;
 b=CLd9e1dX+ZIoEyhcBw5k3iVqehXSb6rLO3/NDc2pfVaDe1q+vrAEbUa8O4zBcfRjpH
 ahZG3KXQDzgnp+FSFa2atIsQQwa34BX/IwAjXffbVUHEK0oA5eo+WCJqVNmFQy00sAtA
 R3ZeTyZa9fDxl2xvPnM3zX5Ywqi1dcluhfjh41uB06lyl3QXONDau8ltY9vC70nYuLH/
 L1IqfvoVZYn48XV6+JVt6FybTJli7tX8KUKwPc5bqCen0CsZxxDSEEtCbBRCw7Klj9Cj
 k83S9kFg6icpZk/L6y6cxRdG4f246zHug2jJqkyAT2oWtlJmhYdMAf+e0MKPqXWDltXD
 AEXw==
X-Gm-Message-State: AOAM533xNnV8IWBIqNn3nQs71u9ATW12cgJ3carA6rqPG1ef8zS1d9Sa
 2k/yHUHkJOtJ9HuL+LHOKpRxTfLjmEUIbw==
X-Google-Smtp-Source: ABdhPJyUwKHshM3Yt6hlFGYyTMztoUG7AoIOK3hvJlyhA+8ja/jWL14KilNRNweaEC8UYEBRxoN6tQ==
X-Received: by 2002:a17:906:8690:: with SMTP id
 g16mr20552336ejx.187.1599484530669; 
 Mon, 07 Sep 2020 06:15:30 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id w14sm15302255ejn.36.2020.09.07.06.15.29
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 06:15:29 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id e11so12312773wme.0
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 06:15:29 -0700 (PDT)
X-Received: by 2002:a1c:a5c8:: with SMTP id
 o191mr21337268wme.127.1599484528763; 
 Mon, 07 Sep 2020 06:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
 <1599225767.4733.64.camel@mhfsdcap03>
 <CAHp75Ve8WNuCuRmFcXaZHLjHMGfsvM=69ii5g4H+NYud6N95eQ@mail.gmail.com>
In-Reply-To: <CAHp75Ve8WNuCuRmFcXaZHLjHMGfsvM=69ii5g4H+NYud6N95eQ@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 7 Sep 2020 15:15:17 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BH4NZrhg=abqc=P9Uzf+t4Davn4SP9i3QktS4Q05WtzA@mail.gmail.com>
Message-ID: <CAAFQd5BH4NZrhg=abqc=P9Uzf+t4Davn4SP9i3QktS4Q05WtzA@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_091532_485198_27A91323 
X-CRM114-Status: GOOD (  25.51  )
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
 srv_heupstream <srv_heupstream@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= <shengnan.wang@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 matrix.zhu@aliyun.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 4:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Sep 4, 2020 at 4:48 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > On Wed, 2020-09-02 at 16:44 +0300, Andy Shevchenko wrote:
> > > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:
>
> ...
>
> > > > +   struct i2c_client *client = to_i2c_client(dev);
> > > > +   struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > >
> > >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > >
> > > Same for the rest similar cases.
> >
> > We've discussed the issue in DW9768 V2.
> >
> > For V4L2 sub-device drivers, dev_get_drvdata() shouldn't be used
> > directly.
> >
> > More details please check the Google Issue:
> > https://partnerissuetracker.corp.google.com/issues/147957975
>
> This is not a public link. Can you remind me what was the issue?
>

v4l2-subdev framework uses dev drvdata for its own purposes. However,
that problem was about the driver setting its own drvdata and having
it overridden by the framework. There is nothing wrong in using
dev_get_drvdata(), assuming the correct type is known and here it's
guaranteed to be v4l2_subdev for the v4l2-subdev framework.

In fact i2c_get_clientdata() [1] is just a wrapper that calls
dev_get_drvdata(&client->dev).

[1] https://elixir.bootlin.com/linux/v5.9-rc3/source/include/linux/i2c.h#L351

> ...
>
> > > > +   if (!bus_cfg.nr_of_link_frequencies) {
> > > > +           dev_err(dev, "no link frequencies defined\n");
> > > > +           ret = -EINVAL;
> > > > +           goto check_hwcfg_error;
> > > > +   }
> > >
> > > If it's 0, the below will break on 'if (j == 0)' with slightly different but
> > > informative enough message. What do you keep above check for?
> >
> > I still prefer to the original version.
> > If 'bus_cfg.nr_of_link_frequencies' is 0, shouldn't we directly return
> > error?
>
> But that will happen anyway. I will leave this to Sakari and
> maintainers to decide.
>

I agree with Andy on this. The check is redundant. In fact, the later
error message is more meaningful, because it at least suggests a
frequency that must be supported, while the earlier one only states
the fact.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
