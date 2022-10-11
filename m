Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czRWuspWIHlagJO4TEuyucASTDboV9sDSZyO/JWLXqc=; b=YMPoLiDJt+ehGl66qyboahDL/5
	uobCwESseWBNztCa512sYGszUNO1AGmgeWZ18Ru4hK2r8rtySf6ApuAeOZ3J2/4lcHZFT86l1zdUY
	VlRCkw7A7IJzWBKe3dIndwRAXJmtMtOFyiqE1e98G3IXnrnZrLYFtu18Oz82v78qWFELHbB0Jp8t0
	k6/OlXK1sPqw8FptOA4/ARzaxWQbR3AWBhsJeSBnLF4z7BI9JmRgcV1dH+GondEJZPEF4Gsk6IFqY
	O9Pu1wOIhxzjuaXadLYm1WIY/GVMuZOCi5SOd9CTY/HYns5OYxsUzOP3I5BThXdKDAPQgo9KfZl92
	evAqXevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiG0d-004SfD-3F; Tue, 11 Oct 2022 14:13:27 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiG0Q-004SbK-11; Tue, 11 Oct 2022 14:13:15 +0000
Received: by mail-pf1-x42d.google.com with SMTP id w2so13687155pfb.0;
        Tue, 11 Oct 2022 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=czRWuspWIHlagJO4TEuyucASTDboV9sDSZyO/JWLXqc=;
        b=Ce+BVV5v8U7whmYd/FcwKuyV+liXHdnCihvE4vxDmi/zFRXHgG5BsKzJlkvJm3ymzp
         i0kk+obd9ehg5kvdXpvifSYQKkIBJbAwLGSIa8MzHAOItPx5O2ghaGpv98wheUqfKMtx
         xYK29jqCSGAVqjF4MPQoXzVWPbY3qWyTm0lvTcEBlWPddeF6YcST3WGeI8+5CF6qMkzB
         /lDnL0m98oNEh6bOyWy8Twswwetn33Cy9kGtv+34nK50zqhZaf/wZPS7BxRAs1neYTBy
         /bZWo8ysVbEXrzMM/+HfoBHs8qu8Q0eGt0b+IXToEUouhHiAP9GLUrTwNKB7EENxNPMI
         wO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czRWuspWIHlagJO4TEuyucASTDboV9sDSZyO/JWLXqc=;
        b=XoUpIoLC7D2AywtWr+JDuZU50nOBAtAvOdbEhH033ZuxseChuXu8s5I/IQzdPq7iCT
         uc36WQHJcyVJfirx9B5C50EQfI2+0nrQBCoknY2qcuHPxEns1V+b1YNOeSwb++Ebiwzp
         V249Rtev8kAZT0WhP5h3kGO4ZACQEnYmNEHp1Okf3oUawq6s6vn3TjJv9CkMjiVPrYA0
         wNRYOVB+UtZDuFtAQXygay4raXcnYyQQ22EBYAtQThvr9q6bcjOIhYJxYXGQliy81Th/
         hpGmj72v/Rgoskmp2LUsEsl5kv/1ADvuOsVsufSh2U/dgC0sbJZe6MO67WprhRnkWaW6
         DMLQ==
X-Gm-Message-State: ACrzQf2zHhAvX/DTi38G75OPLIgKJqnz+7p1wGgfJbXnPOsu63C64MWN
	4pE34Hty4555A9yFVtQHwyA=
X-Google-Smtp-Source: AMsMyM6A7bmN99+8aFFd/V9x8yL+08obUJvhZG8B8wKWgbvIl/Bh1jOgBftu0u99farGA2SFP/OdqQ==
X-Received: by 2002:a63:8643:0:b0:462:9b02:a0c1 with SMTP id x64-20020a638643000000b004629b02a0c1mr8758435pgd.536.1665497593024;
        Tue, 11 Oct 2022 07:13:13 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id q17-20020aa79831000000b00563ce1905f4sm1492741pfl.5.2022.10.11.07.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:13:12 -0700 (PDT)
Date: Tue, 11 Oct 2022 22:13:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0V57gI75ik4ki3A@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_071314_127764_C957923A 
X-CRM114-Status: GOOD (  14.05  )
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

On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > -#include <linux/gpio.h>
> > > >  #include <linux/gpio/driver.h>
> > > > +#include <linux/gpio.h>
> > > > +#include <linux/hte.h>
> > >
> > > Ok with the hte re-order.
> > >
> > > But moving the gpio subsystem header after the gpio/driver is not
> > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > to me the way it was.
> > 
> > I see, I guess this is vim sort vs shell sort. Strange, they should
> > follow the locale settings...
> 
> I have checked, the shell and vim sort gave the same result as in this patch.
> 

The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
and that still returns the same result.  That matches what I would
expect to see given the content of the text.

And for me vim also gives the original order.

Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?

Cheers,
Kent.




