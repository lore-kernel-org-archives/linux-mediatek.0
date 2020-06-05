Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E97C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 13:02:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A6520772
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 13:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rwO0zYcI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i5o+dER1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A6520772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2vYphtHF3txTtSiBlrqyLN9piDdpVOgdW07Kv5kT8k=; b=rwO0zYcI4Wj9g5
	SPxG7VgSy6ZjgP5IpMD7SxgmCCjRb98Yqyv50lCC7sajI5s+SsedSpwELkYtbPSM5bgocLn5d+1bj
	FZlD6AtgHSVZYht+BW9SJX6/BJzjN9IctQ+1SXaBpfB4ZAPLfbmwjI9Hgm9QA3K1UnspYQ0JCeN2v
	yxvQhKmxQG2EeGYZbCKDJYtkdVKxccIPUqjICUWfKYLoNJf7OmtJ235F3fHW1/blvRRSMkhuKlWGi
	1p1zaTgDS/A9rXpT2hJq30lRsTmZLPewmdOkyTdzMt5HSzsLJ/Xj0xgtRVYi8fqZ0ERbxniUN75z4
	3BfFWOsNl2qFyldoQpEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhBzQ-0007UI-6E; Fri, 05 Jun 2020 13:02:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhBzE-0007Ii-I3
 for linux-mediatek@lists.infradead.org; Fri, 05 Jun 2020 13:02:17 +0000
Received: by mail-wr1-x444.google.com with SMTP id x13so9678677wrv.4
 for <linux-mediatek@lists.infradead.org>; Fri, 05 Jun 2020 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y3GLNe1uiEEyqomGYmE3fIeULXusz66pcaCDflcIBb4=;
 b=i5o+dER1J+4I9KjApGJUl5j8vc3AgLlhglvEfXsfp9xNaKskTKEJLqxNDa11iCBswD
 lHjCEBND3KFJe13zffeJZSFvRRMjnmD1xDuFAStUns7l00Mhdzdv/n2dDXwdUGNLjoMR
 Q8UajpX7oLNc+ArM8+h2A4JIYy6XJYGovy2B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y3GLNe1uiEEyqomGYmE3fIeULXusz66pcaCDflcIBb4=;
 b=fJFOmhrsPEJNhgLIiHdeXNlV9DN8ecM+0sw1wEovtLrs4f7if2hbNz9hf6xc11pfi1
 zBKGSbQadY1nAMAdgQeCTJ/eTzK+m6KKYTJ3HxR3ZaB7QFgWu9mXP9QUnCnrfh6Y1RDo
 KBp1OxYMlTgeTZHHOEB3FTlliSRha/a0oI6vq76qmwpcqnYyZ5RVZ/whVXa9g7b8EqLJ
 ioCNGYERmNT8cRqY9VBWezpFVoL7ApzvcuIfHGnxxWtLNsqxfn9Wp6RIkTFjEAVq9dAr
 G6qVliz8FbxHpFwSTwfm9Pr9FnVJcEuBv1UYqSrnxXt0xUjJ1z8pi3qfzt/KJ94rN/B+
 +3mA==
X-Gm-Message-State: AOAM532DLLegobGVIHvkKFgXVdOPZsrW96vhOiqY4Gk1kJV9QzsIJxmn
 o8f2HDFuamHAY3E85zwmXQcjGg==
X-Google-Smtp-Source: ABdhPJzbEgAdOn5Dla25twrnFWibCM+By/CY94AZjk2Mnb7Wp+Gcych9tY+BqMoYs3yiFXxox2M6aQ==
X-Received: by 2002:a05:6000:12c8:: with SMTP id
 l8mr9792905wrx.148.1591362134700; 
 Fri, 05 Jun 2020 06:02:14 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id d5sm12890866wrb.14.2020.06.05.06.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:02:14 -0700 (PDT)
Date: Fri, 5 Jun 2020 13:02:12 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605130212.GA6303@chromium.org>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605121459.GS16711@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605121459.GS16711@paasikivi.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_060216_618159_46108974 
X-CRM114-Status: GOOD (  12.97  )
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, bgolaszewski@baylibre.com, sj.huang@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 Dongchun Zhu <dongchun.zhu@mediatek.com>, louis.kuo@mediatek.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 05, 2020 at 03:14:59PM +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> Thank you for the update.
> 
> On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > control to set the desired focus via IIC serial interface.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/media/i2c/Kconfig  |  13 ++
> >  drivers/media/i2c/Makefile |   1 +
> >  drivers/media/i2c/dw9768.c | 566 +++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 581 insertions(+)
> >  create mode 100644 drivers/media/i2c/dw9768.c
[snip]
> > +static int dw9768_runtime_suspend(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > +
> > +	dw9768_release(dw9768);
> > +	regulator_bulk_disable(ARRAY_SIZE(dw9768_supply_names),
> > +			       dw9768->supplies);
> > +
> > +	return 0;
> > +}
> > +
> > +static int dw9768_runtime_resume(struct device *dev)
> 
> __maybe_unused for this and the suspend callback.
>

These are always used. If runtime PM is disabled, they are called
explicitly in probe and remove.

Best regards,
Tomasz


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
