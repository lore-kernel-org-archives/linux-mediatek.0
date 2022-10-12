Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC282C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4W9PYnqE39FVIWPtx23Tk+GKt7RrA3d27Hf1sKJ7FqQ=; b=qWwaIDe6K4E/zW+slSZEdtdw00
	EP5tSuEhnENUCDFyKNIkpTxtX4tYoBYU3NTzUBDxYjLDe8Je1XT00wypMxEwatD1DbBQGJKVqFtLV
	y7MYOVfy8b/1QsYeUuEY1r6ZXAU1Bf2MADOgVnly0va79OX8fW3O1p/whfms2ITtsrEbR9a3U1yz5
	ZtpnJ5CPyH0Rp9FT9PE+JkRh2BPDcscKh1x/yyTf0NzLlFFvJuUDzO5rU7PaoK9hLrMm4GfCtFXQ9
	i6WVh81cfQ4JiZrgq9tSNdjZhtlmxtDp6SJTWbH9H0S0c6psKPM+GXzcBUhGtIaGtsCskVIGd2IzX
	nbiIwlig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oicCQ-008HoX-6C; Wed, 12 Oct 2022 13:55:06 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oicCD-008Hka-Ml; Wed, 12 Oct 2022 13:54:54 +0000
Received: by mail-pj1-x1029.google.com with SMTP id p3-20020a17090a284300b0020a85fa3ffcso2055439pjf.2;
        Wed, 12 Oct 2022 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4W9PYnqE39FVIWPtx23Tk+GKt7RrA3d27Hf1sKJ7FqQ=;
        b=UozGTu6YyIYkQQoEJ9mpP/ZP9EXBHkczxk9/ST0nwoYD5CXIifS1ksxnJ1z/XlD8Iv
         DnXdQDc3QD5BBRt/elc/g3MpiMLgBMvz47ICmyWRQUwskodG72pwSD0FvOfnFwxR4gNT
         0Nv0c1ZEd9a//beEgotrvzkxpjlIn11dOn3z2tb/KyektIxRp3AMw9k8NLnKlAlJMfAZ
         ZW00APC6mm2Rgc0I9F6MtW+FIkz4pX/PUfBY7jV2tV/BJmcb7sxvPImZbSg5MEvkpS1A
         VQqSmx00wjuq8wBY7o0koQO6OL1C+JRHOCj4nWqmVRt4CML82YQgP9dT0rzT4hrO952e
         5MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W9PYnqE39FVIWPtx23Tk+GKt7RrA3d27Hf1sKJ7FqQ=;
        b=xYmGoTZ73Qrc+BAnGQOXbbpODwXd3zQXeAnMvK50JtFeQrU7DEJ0Dey6t2P+7iJFmA
         h2M/DUuw854bpdejmikInwrUObKu3KM8cm7v6WNTgqNLhUYPK2VEd9mSY/1+uDTizPaa
         Da2b1RteK2D1beqOJ+IVEB4kCPpVSvKfoqXc1jM9Dsbtmx+fkTOr2pMnqKO+7wTxkGwe
         0h+1SLOZmpgtgF2H8vZItgKNN9VetfpbMwFkTf0kCyJSi/Hu0+TlX0zel0DRrjxT2TAb
         Q0Swpgm4T4dCzk7QQFIUmPu1muwkDgH2d1kIX5o7bL0675KgJAE4hKv86xgTnmBZNHb8
         a30g==
X-Gm-Message-State: ACrzQf12nmJSkmOXwnSF/Xn8ZpcQDlP4c+UcH96Th7hnfEPm0zZFJnwR
	V6wlT0a66LY0eLLXT9zOTU4=
X-Google-Smtp-Source: AMsMyM4GsOvqLbKi8bnipwZei9bul2eCxZ/xzZEAA7xagdE0qfFC/6Wvyu2i9hoIPRYsb/0vz6gCvA==
X-Received: by 2002:a17:90a:f2c3:b0:20b:b75f:2f9e with SMTP id gt3-20020a17090af2c300b0020bb75f2f9emr5408380pjb.43.1665582890145;
        Wed, 12 Oct 2022 06:54:50 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id s20-20020aa78bd4000000b00562f6df42f1sm8959924pfd.152.2022.10.12.06.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 06:54:49 -0700 (PDT)
Date: Wed, 12 Oct 2022 21:54:39 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0bHH06cbngWk4mH@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_065453_761292_5026B185 
X-CRM114-Status: GOOD (  16.26  )
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

On Wed, Oct 12, 2022 at 04:30:05PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 08:01:27AM +0800, Kent Gibson wrote:
> > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > -#include <linux/gpio.h>
> > >  #include <linux/gpio/driver.h>
> > > +#include <linux/gpio.h>
> 
> > But moving the gpio subsystem header after the gpio/driver is not
> > alphabetical ('.' precedes '/') and it read better and made more sense
> > to me the way it was.
> 
> Okay, I will move it back.
> 
> ...
> 
> > > +#include <linux/seq_file.h>
> > 
> > I wasn't aware that we use anything from seq_file.
> > What am I missing?
> 
> 
> Eventually I can answer to your question: the commit 0ae3109a8391
> ("gpiolib: cdev: add fdinfo output for line request file descriptors")
> is what you are missing.
> 
> That said, we need this patch.
> 

Ah, yes - totally forgot that one is in flight.
That makes sense then.

With the gpio headers retaining their original order:

Rewiewed-by: Kent Gibson <warthog618@gmail.com>

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

