Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4AAC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fGrxMBOLuz/ufum7iLzYyW7+BeCUbMtinCuje5Qnek=; b=4IaF2JFEaJaXCI87Nam+UQ9Kp8
	dgSgxGg538pP5yCQE/wStL2X+khcxH+sO3zKnx2CXyKQLlrPjp5tj8M+ARRkkQQPoQGfLLbgokkcf
	izOASMJNaPtjBmkQC4816L+a4v7rsDMHnwLEdc5t+C+7Rv45diMmJ1kFvVXQxUuKzdAe4Ir/FVuYr
	IzViml0V9T3qSts0hBYCwC/FPnQA4qWN0A7H0RfNaFZ2ARAlfJGb1eQXjqEy10KbcceDMT7OJtzMv
	UMCzgn482icLE8lmUsZPDYroK1KRVgyycYru5b4U6GbtKNcMdYUUAFA14mt9fkDaMmFq3EyMhYUX8
	jMSYSQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oixop-00Bl19-VY; Thu, 13 Oct 2022 13:00:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oixoe-00BkyR-S0
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 13:00:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id a3so2802687wrt.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Oct 2022 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6fGrxMBOLuz/ufum7iLzYyW7+BeCUbMtinCuje5Qnek=;
        b=DDrg6gRNN+qdSFLktuGPe6miLLWo+FuSK7tmXGvcxzwEWl7EOc3azdJ9UyOh6FVCTP
         TWZ6G2PN+tILhovLGjrqwCbPE7iaWPKnBNdJYFB13D7CH/wGS7ZuaVXfV1ngFWozXv2K
         zz8WTWpujszYbJhtDEDk+Oz7PP3dcoMka4qvGpADe9folHcBfkmoJCTuzz6lsAXqBNfT
         7inuvWjNVpbHZ5LP+bMy6YrhzpYc3KtgRLb+RbPToZJpOyJI45oSngd7QHUp/aeDGMSk
         da7DD4PNiGARh+RI85rh85RBiZf8+85ZmGZyKDgd8boOgMlD3HtlacfhdGJv1fshZLB5
         Ascg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fGrxMBOLuz/ufum7iLzYyW7+BeCUbMtinCuje5Qnek=;
        b=2/Jte23Bh/aO7OIijyl6NSpDlmCntUi5oxNFqAY0phFECxDjIFBS6J2msThr4JgRD0
         sXUl/8HU8S9jxE4IFrENo6yatTwYhpRt2k00fJIE4KO3YO8D7WAGrK/vCrK13IDpp8h+
         MpAAV7QF0R9w6qhfudj73AQ0palgJYLWT65nldzp8kSKukM7vW0WItwwDrUTb+uTEdEp
         Wwseridl7eZZhlfihRb6Uexr+iZwTGX4NzPEy5J50sOEhJJcDLjxLodnbyc2S9zzAzoo
         xAECCDXE3zwARdH4jV1x+wVJEOhANIL2ZYe0Acq/I+AHdK3HhJ6dapBC2kz9Wno3n30i
         7DVw==
X-Gm-Message-State: ACrzQf3uXI3SOKxjUTltBJ1JqQ0L9A0zWVDuXhxvO+C/8gPYCjXvPgZ1
	NQ0eBzyhPlVZyN42zlJ9H9j//Q==
X-Google-Smtp-Source: AMsMyM4R9UBvK2aOVuodBoSAKW6fTfehJPe8G1obMNxLSJk0gLOU1bkCanq3VMsPRApZPcX2cW1RDg==
X-Received: by 2002:a05:6000:168c:b0:231:7950:1114 with SMTP id y12-20020a056000168c00b0023179501114mr7941495wrd.484.1665665997291;
        Thu, 13 Oct 2022 05:59:57 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id x4-20020adff644000000b0022afbd02c69sm2010424wrp.56.2022.10.13.05.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 05:59:56 -0700 (PDT)
Date: Thu, 13 Oct 2022 13:59:55 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/7] gpiolib: of: consolidate simple renames into a
 single quirk
Message-ID: <Y0gLy84EvqpOmXdd@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-2-e01d9d3e7b29@gmail.com>
 <Y0aS80PlA/T3mx2d@maple.lan>
 <Y0cTkubAA4637o5y@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0cTkubAA4637o5y@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_060001_012244_A22A1304 
X-CRM114-Status: GOOD (  25.31  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 12, 2022 at 12:20:50PM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 12, 2022 at 11:12:03AM +0100, Daniel Thompson wrote:
> > On Tue, Oct 11, 2022 at 03:19:30PM -0700, Dmitry Torokhov wrote:
> > > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > > index cef4f6634125..619aae0c5476 100644
> > > @@ -365,127 +365,83 @@ struct gpio_desc *gpiod_get_from_of_node(const struct device_node *node,
> > > +static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
> > >  					     const char *con_id,
> > >  					     unsigned int idx,
> > >  					     enum of_gpio_flags *of_flags)
> > >  {
> > > +	static const struct of_rename_gpio {
> > > +		const char *con_id;
> > > +		const char *legacy_id;	/* NULL - same as con_id */
> > > +		const char *compatible; /* NULL - don't check */
> >
> > "don't check" doesn't seem desirable. It's not too big a deal here
> > because everything affected has a vendor prefix (meaning incorrect
> > matching is unlikely). Should there be a comment about the general care
> > needed for a NULL compatible?

There were certainly a lot of compatibles affected by this translation
and given the structure of the drivers it is a tough code review to be
sure you have picked up *all* of them!


> I'll add the wording that NULL is only acceptable if property has a
> vendor prefi, Will that be OK? Otherwise I'll have to add a lot of
> entries for Arizona and Madera.
>
> >
> >
> > > +	} gpios[] = {
> > > +#if IS_ENABLED(CONFIG_MFD_ARIZONA)
> > > +		{ "wlf,reset",	NULL,		NULL },
> >
> > CONFIG_REGULATOR_ARIZONA_LDO1 is better guard for this con id.
>
> Are you sure? I see reset handling happening in
> drivers/mfd/arizona-core.c independently of regulator code...

Looks like I grepped for the wrong string so I was completely wrong
here... and in two different ways!

Firstly I'm wrong about replacing the guard. Existing guard is correct!

Secondly, I didn't notice until now that wm8804 also uses the
"wlf,reset" and it is a little odd that the wm8804 driver will accept
or refuse a misspelled binding based whether the kernel has enabled the
arizona drivers.

Overall I can live with the code we have today but this makes me wonder
if the comment discussed above should be stronger. Something like:
"the NULL compatible code is used there to support legacy entries in
the table; try to avoid adding new NULL entries".


Daniel.

