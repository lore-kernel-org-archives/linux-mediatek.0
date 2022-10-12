Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF3EC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 19:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0rrEqvpdS6/A3qRrs8G1ifD0QqY6vlEf+AAA3SCDLo=; b=z/WAVvvsiH4tjK0+yVZtORjKDo
	jKLgDv3iU2+msC8RayKZy3ppaGQeFqTtNo3/IrGq1k061eP5MluMkuNL53m5ZRgbKWIkBXADNwYxP
	M3ByzaeT0KI3HpRmGRiTZkd0pVGMcgGI/xIJiyWR8Ce9QZ3zBrbcuQchszPBdgzKTcxUBJXvQxiWF
	Evccf2MmPaOaxl8sJuktgN+8CYuOFr1UOZ0vWoQijligxZ3Y2Zkdl+rvSCSMyXqUuhMASCK7P/D2Z
	XAwIsbyTql+mhbLpsfW0fnOXdoV4FtdnJcPZF4tlgEqb0UzAVq+HJ9lrQv9suggt4q2EtqJlw1pUE
	Su2OIAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oihHm-0099Is-WA; Wed, 12 Oct 2022 19:20:59 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oihHk-0099I3-9o; Wed, 12 Oct 2022 19:20:57 +0000
Received: by mail-pg1-x52a.google.com with SMTP id q9so16335734pgq.8;
        Wed, 12 Oct 2022 12:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E0rrEqvpdS6/A3qRrs8G1ifD0QqY6vlEf+AAA3SCDLo=;
        b=iBzv5RFIKLcFDEFE31IHe5x6LpZ6Ym8lDJNJeOhVbsP1RRe3jLwXPlZtKWBY3l+p+c
         tPANZJM2r0maEn4ei2n8BoT6KxZSzL7yfEd+GM64JY9f+dz4jw/evfMMx7f5xymfc4L9
         fBOGaAbreD8+EC1lKjn6AMUcelQ3GRPOOm8q1Z87N26wnX2ma+zFww+4/qKesnPsdq2l
         7Poe2kgZZA33gB5s3V/jHwHmrp9KxE55WifPvVMjz5U5uX3o/xoCn6j0UdpuJNx+vmAQ
         xPxZFqc/Yh7xQ6ItD/BfMV8hWNEXg1i/L7UXdMcOt0izsTw0RuAxSwmfBD8cYNPE+mb4
         s7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0rrEqvpdS6/A3qRrs8G1ifD0QqY6vlEf+AAA3SCDLo=;
        b=gAUwKHDGjWvdQqg01wYVFbYNAqrSgeo2TBUdTpY1yv8yhzgPJAsiUqWTQNS7Hif9+R
         DESN8ZctHXbSSTsNQtJjQTULWq18hb/yQCetsCC5QEFZahlVAt0fBSQkzKSRuL3MaBnY
         oeyEJSVcsiwaFwq2j24VfxGL5z0OqgCVJ9lPpwam8efjcCdZyzeCYJAeDQbnPgqVihIN
         2Bqmfwc04sHpDktIf76NPKnRxqkIPKpzGD9IsID3hhaYInW+VVFhzZPC+kjHGafPl7jv
         M62wC0mmudzwafrArkQOJislm0fkf/VWxxyyjp4W+5vvoxn4igtkSF2Xy11g7W+x0t9j
         RHiA==
X-Gm-Message-State: ACrzQf3z1jF1xOd9Bc7JHwWG+MmesykektbfN94iihT2IrVXUctzZK1/
	Cl7OE/kY/r4k/uPGg3vYZUk=
X-Google-Smtp-Source: AMsMyM5LApyzMLt69cPOLbkpAgOB7rUw1DRn6jbML7+50wdhr0ZswZ9v/4yWajRa1tsPYbe6J0I/UQ==
X-Received: by 2002:a63:24d:0:b0:452:87c1:9781 with SMTP id 74-20020a63024d000000b0045287c19781mr26962898pgc.512.1665602454084;
        Wed, 12 Oct 2022 12:20:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d4c1:686c:5489:5df9])
        by smtp.gmail.com with ESMTPSA id s15-20020a170902ea0f00b0016d72804664sm11021027plg.205.2022.10.12.12.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 12:20:53 -0700 (PDT)
Date: Wed, 12 Oct 2022 12:20:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/7] gpiolib: of: consolidate simple renames into a
 single quirk
Message-ID: <Y0cTkubAA4637o5y@google.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-2-e01d9d3e7b29@gmail.com>
 <Y0aS80PlA/T3mx2d@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0aS80PlA/T3mx2d@maple.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_122056_366015_4C482A48 
X-CRM114-Status: GOOD (  37.11  )
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

On Wed, Oct 12, 2022 at 11:12:03AM +0100, Daniel Thompson wrote:
> On Tue, Oct 11, 2022 at 03:19:30PM -0700, Dmitry Torokhov wrote:
> > This consolidates all quirks doing simple renames (either allowing
> > suffix-less names or trivial renames, when index changes are not
> > required) into a single quirk.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/gpio/gpiolib-of.c | 176 +++++++++++++++++-----------------------------
> >  1 file changed, 64 insertions(+), 112 deletions(-)
> 
> Nice diffstat, almost a shame that the diff algo itself has latched onto
> spurious anchor points to generate something that is so hard to read
> ;-) .
> 
> I've reviewed this pretty closely and AFAICT it does exactly what the
> preivous code does. Thus the comments below are all related to things
> that the new table makes obvious that the previous code handled in a
> rather inconsistent way. Maybe that means these could/should be fixed
> in an extra patch within this patch set.
> 
> I guess that means, despite the feedback below, *this* patch is:
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> 
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index cef4f6634125..619aae0c5476 100644
> > @@ -365,127 +365,83 @@ struct gpio_desc *gpiod_get_from_of_node(const struct device_node *node,
> > +static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
> >  					     const char *con_id,
> >  					     unsigned int idx,
> >  					     enum of_gpio_flags *of_flags)
> >  {
> > +	static const struct of_rename_gpio {
> > +		const char *con_id;
> > +		const char *legacy_id;	/* NULL - same as con_id */
> > +		const char *compatible; /* NULL - don't check */
> 
> "don't check" doesn't seem desirable. It's not too big a deal here
> because everything affected has a vendor prefix (meaning incorrect
> matching is unlikely). Should there be a comment about the general care
> needed for a NULL compatible?

I'll add the wording that NULL is only acceptable if property has a
vendor prefi, Will that be OK? Otherwise I'll have to add a lot of
entries for Arizona and Madera.

> 
> 
> > +	} gpios[] = {
> > +#if IS_ENABLED(CONFIG_MFD_ARIZONA)
> > +		{ "wlf,reset",	NULL,		NULL },
> 
> CONFIG_REGULATOR_ARIZONA_LDO1 is better guard for this con id.

Are you sure? I see reset handling happening in
drivers/mfd/arizona-core.c independently of regulator code...

> 
> 
> > +#endif
> > +#if IS_ENABLED(CONFIG_REGULATOR)
> > +		/*
> > +		 * Some regulator bindings happened before we managed to
> > +		 * establish that GPIO properties should be named
> > +		 * "foo-gpios" so we have this special kludge for them.
> > +		 */
> > +		{ "wlf,ldoena",  NULL,		NULL }, /* Arizona */
> 
> CONFIG_REGULATOR_ARIZONA_LDO1 is better for this one too.

Good idea.

> 
> 
> > +		{ "wlf,ldo1ena", NULL,		NULL }, /* WM8994 */
> > +		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
> 
> CONFIG_REGULATOR_WM8994 is a better guard for these.

Yep.

> 
> 
> > +#endif
> > +#if IS_ENABLED(CONFIG_SPI_MASTER)
> > +		/*
> > +		 * The SPI GPIO bindings happened before we managed to
> > +		 * establish that GPIO properties should be named
> > +		 * "foo-gpios" so we have this special kludge for them.
> > +		 */
> > +		{ "miso",	"gpio-miso",	"spi-gpio" },
> > +		{ "mosi",	"gpio-mosi",	"spi-gpio" },
> > +		{ "sck",	"gpio-sck",	"spi-gpio" },
> 
> CONFIG_SPI_GPIO is a better guard for these.

OK.

> 
> 
> >
> > +		/*
> > +		 * The old Freescale bindings use simply "gpios" as name
> > +		 * for the chip select lines rather than "cs-gpios" like
> > +		 * all other SPI hardware. Allow this specifically for
> > +		 * Freescale and PPC devices.
> > +		 */
> > +		{ "cs",		"gpios",	"fsl,spi" },
> > +		{ "cs",		"gpios",	"aeroflexgaisler,spictrl" },
> 
> CONFIG_SPI_FSL_SPI for these.

OK.

> 
> > +		{ "cs",		"gpios",	"ibm,ppc4xx-spi" },
> 
> CONFIG_SPI_PPC4xx for this.

OK.

> 
> 
> > +#endif
> > +#if IS_ENABLED(CONFIG_TYPEC_FUSB302)
> > +		/*
> > +		 * Fairchild FUSB302 host is using undocumented "fcs,int_n"
> > +		 * property without the compulsory "-gpios" suffix.
> > +		 */
> > +		{ "fcs,int_n",	NULL,		"fcs,fusb302" },
> > +#endif
> >  	};
> > +	struct gpio_desc *desc;
> > +	const char *legacy_id;
> > +	unsigned int i;
> >
> >  	if (!con_id)
> >  		return ERR_PTR(-ENOENT);
> >
> > +	for (i = 0; i < ARRAY_SIZE(gpios); i++) {
> > +		if (strcmp(con_id, gpios[i].con_id))
> > +			continue;
> >
> > +		if (gpios[i].compatible &&
> > +		    !of_device_is_compatible(np, gpios[i].compatible))
> > +			continue;
> >
> > +		legacy_id = gpios[i].legacy_id ?: gpios[i].con_id;
> > +		desc = of_get_named_gpiod_flags(np, legacy_id, idx, of_flags);
> > +		if (!gpiod_not_found(desc)) {
> > +			pr_info("%s uses legacy gpio name '%s' instead of '%s-gpios'\n",
> > +				of_node_full_name(np), legacy_id, con_id);
> > +			return desc;
> > +		}
> > +	}
> >
> > +	return ERR_PTR(-ENOENT);
> >  }
> 
> I would normally trim last but this but given what git did to this particular
> patch I left it as a public service ;-)  (it has the - parts of the
> patch removed).
> 
> 
> Daniel.

Thanks.

-- 
Dmitry

