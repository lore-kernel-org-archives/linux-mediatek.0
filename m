Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1212CD11DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YT6C4kyGaXJTnO4s5bmEmPWYlNQPKErlDo5CuGDxbV8=; b=Rjz610s8QEoBpx6jDnWCuLYitL
	TGK0fXm2mLGBzjcjkusi1OLTn3E8CnyNSGe1fS3u4/dBjsW9k/Ij/25go8eaTdE/9cOYAqdDOMlYk
	Mi598/jyYCjQ+pO4EEkpMmaNRfFYAuxEQ024ZI/Pe9jQ2JlVxJRbRMuIjNESqewcorO+EKt7a72jz
	tzaYMmJiP0NcPAnGFNe0k1E3R3Fz/Vhz80oUEN1sXZKMyLuuQ/i/XvEHBwF9nFpLlRXTbIglHN8W4
	fOqhCTsPjikucnsl9EGJ10foR0AF+HPPw5s6wowcwBcZqzrlSL4LAjDmAvLoARynda8IuGpm80t8p
	gPuMwd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvnd-0000000FSy5-1c1u;
	Thu, 28 Mar 2024 19:52:33 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvnZ-0000000FSvw-0GQs;
	Thu, 28 Mar 2024 19:52:30 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e6e3eadec8so681305a34.0;
        Thu, 28 Mar 2024 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711655547; x=1712260347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YT6C4kyGaXJTnO4s5bmEmPWYlNQPKErlDo5CuGDxbV8=;
        b=Of1A8TLl7pT1NcWV/WSdZvoFpccifSBUje6jPJ3MTacRSRbGXBB9VEKdyF0EK5lPUL
         iSL7SJZQC0eoI1dTF0+oxZGCTo1vE4CQbufLijenN6nohUi0tOvyVy2xd0UoPiths0A9
         JBqVmzK68vCmRl6iJaW/rpAGPdIHLplMfiSvZwqptuGtdUrzRHpdX4gJ2piAEyWb1JxM
         JLzaNat5+YONsHS0mDSHL7sf47ShAG55NJ6GXasQOg9ZWCmCZWdDDwB44myh+Uc01m4g
         dUgBD5XrCOi5OymZUm+4ndN9PV4yZ+i0cayAc/SDwmb4iHRm9amndA26KS6U2K9XhJ+Z
         xBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655547; x=1712260347;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YT6C4kyGaXJTnO4s5bmEmPWYlNQPKErlDo5CuGDxbV8=;
        b=GSgZeEvEroYGKeMxVtaI9WMTn6kAf1muV1sfY+YGdRBzQcNm07I+/gkTKmWfJz1miB
         93ZrBqjh5AYP95ZxDyGpT87gSaE5FROlZ11oRiRgo+CHQa50XgrrbVFl5ThVxrkVvOVO
         +xRyayM/EINBlXN92i+4wL68l2bGK6HB7ZrzgW5xmc+eDbu2Xu1HXmgzUY73KxRyk/q7
         mwFqqvyCFDAtfUx5+7nsdfmzs+Ugg4uQpZUn32P/sYiFEnjuioeXXKM0Susg1FpxUHZe
         atk0HKDbGid9wjL/qin3TaQogwfGG/cJYbwzX5FMYCd6FPciPZSHwCe7YcE1CUdoPkqd
         cGvw==
X-Forwarded-Encrypted: i=1; AJvYcCXTysfzFqNgkaMKfxpqFwiWlaWGqLT4sKCuOX6o3yZiocRvujY0zfujkY0LfAWaEMrqVa+wIKQFTU04rfjDGERfs9WLlDGPc9sL3YM4Ndic95SLkb5sAAV4zjLPuIuaqIM1xe6YHQ3zvJ7tLIxEFMk7E1tks/84rvnlxad70fUyoOIcyrSnB6m+T3+m+bKhIinkz+XJFbn+KfWs1UhtTRsoO2rvnGhfQaIYCvWHccB16ytYf0ZBQq2IUjhoNzdhRLDZT2NncZ1sbgymS06Y9k+amTwJHw9UXO/+FQi2IxhM6F44
X-Gm-Message-State: AOJu0YxIvapyy5xQOTnWxJR8+oAGn0NEzevdZEbcxNwhdm/LSkw8w6mo
	GpAUTj36+nA25K6UQDScP3cG8/m3tGkaUR6fheeEiUH8LFX1nAs=
X-Google-Smtp-Source: AGHT+IHzO114l0NerWSB89S0FuZIWvU872Dx5hTOnZas2urBgE80eNZxB2BV9A8JCj8+LYtYL67EKw==
X-Received: by 2002:a05:6870:3513:b0:22a:8e5:941 with SMTP id k19-20020a056870351300b0022a08e50941mr177999oah.52.1711655546921;
        Thu, 28 Mar 2024 12:52:26 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id pd12-20020a0568717a8c00b00229f94bf403sm536320oac.19.2024.03.28.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 12:52:26 -0700 (PDT)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:b987:69e:202a:697a])
	by serve.minyard.net (Postfix) with ESMTPSA id 4B51A180059;
	Thu, 28 Mar 2024 19:52:25 +0000 (UTC)
Date: Thu, 28 Mar 2024 14:52:24 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen <allen.lkml@gmail.com>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	tj@kernel.org, keescook@chromium.org, vkoul@kernel.org,
	marcan@marcan.st, sven@svenpeter.dev, florian.fainelli@broadcom.com,
	rjui@broadcom.com, sbranden@broadcom.com, paul@crapouillou.net,
	Eugeniy.Paltsev@synopsys.com, manivannan.sadhasivam@linaro.org,
	vireshk@kernel.org, Frank.Li@nxp.com, leoyang.li@nxp.com,
	zw@zh-kernel.org, wangzhou1@hisilicon.com, haijie1@huawei.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	afaerber@suse.de, logang@deltatee.com, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	andersson@kernel.org, konrad.dybcio@linaro.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	patrice.chotard@foss.st.com, linus.walleij@linaro.org,
	wens@csie.org, jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, jassisinghbrar@gmail.com, mchehab@kernel.org,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	ulf.hansson@linaro.org, manuel.lauss@gmail.com,
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
	duncan.sands@free.fr, stern@rowland.harvard.edu, oneukum@suse.com,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
Message-ID: <ZgXKeL36ckOyNpI/@mail.minyard.net>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
 <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
 <ZgXDmx1HvujsMYAR@mail.minyard.net>
 <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_125229_317877_E098D1CA 
X-CRM114-Status: GOOD (  21.98  )
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
Reply-To: minyard@acm.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 28, 2024 at 12:41:22PM -0700, Allen wrote:
> > > > I believe that work queues items are execute single-threaded for a work
> > > > queue, so this should be good.  I need to test this, though.  It may be
> > > > that an IPMI device can have its own work queue; it may not be important
> > > > to run it in bh context.
> > >
> > >   Fair point. Could you please let me know once you have had a chance to test
> > > these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> > > workqueue.
> > >
> > >  Thanks for taking time out to review.
> >
> > After looking and thinking about it a bit, a BH context is still
> > probably the best for this.
> >
> > I have tested this patch under load and various scenarios and it seems
> > to work ok.  So:
> >
> > Tested-by: Corey Minyard <cminyard@mvista.com>
> > Acked-by: Corey Minyard <cminyard@mvista.com>
> >
> > Or I can take this into my tree.
> >
> > -corey
> 
>  Thank you very much. I think it should be okay for you to carry it into
> your tree.

Ok, it's in my for-next tree.  I fixed the directory reference, and I
changed all the comments where you changed "tasklet" to "work" to
instead say "workqueue".

-corey

> 
> - Allen
> 

