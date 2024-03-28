Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD3DCD11DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 19:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnKBKhBKsmsJMY/bC4lZDp0UO96Fq//Yoyy126bkPGI=; b=cEdN8lQB8CCdYnYlbOawWEj+Ah
	7iU6qpsPudfgnTB/nxNM3CVbp0blhFSRGMppvqZDJBkHV5HVndaMAzBtVc1gHiwYGQcHXZt4zPG/j
	KOPf187iqp8ajmjg5kYwaD4xE0oFGn7DRRg97EHRXbO0stdp8GXfXarE+XNGQCEEdBDbE+N2zdbTI
	uPlE+H+R0/7PzNaUvJf5yCOqD4wXbtt8hPYAD9+Ihv4KjXCzDh5oNF47J/+diDRVCmum+V/n+Yd+I
	cp4wk7Qe5ebR9buGorZ/MHTv01cP5HxLCIsbjWPvRgOMiKHHgYKdjdnkXy/rKaPMvnX59YQl5nuA4
	65zjoriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvtz-0000000FUyt-2clw;
	Thu, 28 Mar 2024 19:59:07 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvtu-0000000FUw6-3DLq;
	Thu, 28 Mar 2024 19:59:04 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-47822e4dc24so471416137.3;
        Thu, 28 Mar 2024 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711655940; x=1712260740; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vnKBKhBKsmsJMY/bC4lZDp0UO96Fq//Yoyy126bkPGI=;
        b=mh2aGv6albal+vGy7dvWaCQW4EXlzydGRGqgye8VC3MEssrxydZXJuP1bjajl4n/DQ
         JgSufvy3BoMcoo7DYpF6u7uk2f4yIfsbd2ogtVqD91RaHWOHhzwr9R1OcZgn1Qt2nKgM
         Mz0hCmtRRNKes3iHiAs7lIEeQPu+nPoWclNkJPhlVGaLAkmZ7B1oCswKoc1F9zA7BwCy
         l9Q/p7IpfAW1AxmlBkXpTy1cXiu1wZZupAHz6qQokWkBRkTwPYFUX71Uxsuxj5yvpAQi
         1o0eTvMEYAnfJyZTOZfuC0H+wBUsQu7+k/1uS9B+hDZCC0R6ARGuoOYC7NI+t1l8/4Ko
         zC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655940; x=1712260740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnKBKhBKsmsJMY/bC4lZDp0UO96Fq//Yoyy126bkPGI=;
        b=JRkBPmoeD02Yq/GTihNnlDCqmfUO9mae0E5MAmZH+G/5fBZtwC4pvegEObrXh0d/fu
         5Z112kFQETNG7s0eiHy6eerGxSyHSmTIO40e8U6NZdBn+ybbfPeEcdUpFhit1u7OVclo
         n/H2YwVHKYHCdEb5S7zHftDNr+yc7yXugK4TZ3Ag+ya9rpCs6WOzCWvp5e9/7x3JyLPc
         lx4myvi+TdDMpEOth9ZmY8GLtQC4z/Aaz/nZ5JzNBRUvfUAUfUyJiuS27FW24l0B0SAH
         d+KhHgpsxCxMyImz4yDk8Tfk9rd8HoqrBgAOHOtU3AbIC+ODfGuZZmcUMLbWJoryW4Nh
         YBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYRZ5IWgNCnfDKfnVWSLd554JT9voJjLLmsrBpS8Fyq83OmIh89nnGaGL/RI8w+yqhxtK4fyNQZTQvaBEzQEmQx1ZnJSmRZxaLeRA2rWy7BlmKFEOhF0XkkljNO22HPYg+9G1uvhwb6fNU760bFvV8ISgyqN+Om0L/rbJk1khiBlIPy9PRSuQ8pj7bn59VQqcFSfL7XIFCUt0q3c+V/kjg1wt/+ulWy6zCIgOBtryhRdozoheVYZ25izGU8+tRotQ3mGp9MafNbsjK/6dYaxhyXXcEzEhDD6KXWdTIIEX2OG3Q
X-Gm-Message-State: AOJu0Yz542Hk26zqdP2aAAfG1tc+xrwK0Ob1/eUPkH1ul28w1OQB8P8p
	3wQgCxIJJJ++M9qHemCSqsJHmH2uskeHq8Hku2JahQmp7NlxsTQqQeg1/7otUiwxwKiTBeyBnZT
	K70zI1scuuNQowB+Vfq3yIA64j5U=
X-Google-Smtp-Source: AGHT+IEsqiTQ+RuhLXyb/Y+jV0DgOZDtp/0zVM9owKFV3xn7f9aoxOYdP+JeSKGOIKqBlapOYOkCUtaaLw32MikZSqo=
X-Received: by 2002:a05:6102:2a65:b0:476:cf52:e1b7 with SMTP id
 hp5-20020a0561022a6500b00476cf52e1b7mr141814vsb.28.1711655940207; Thu, 28 Mar
 2024 12:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com> <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
 <ZgXDmx1HvujsMYAR@mail.minyard.net> <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
 <ZgXKeL36ckOyNpI/@mail.minyard.net>
In-Reply-To: <ZgXKeL36ckOyNpI/@mail.minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 12:58:49 -0700
Message-ID: <CAOMdWS+KrT2dK0XiEkZJT0aHnre1sr6gMMSkdxuXZaUh5e2e8Q@mail.gmail.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
To: minyard@acm.org
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_125902_870678_B45CF769 
X-CRM114-Status: GOOD (  17.64  )
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

> > > >
> > > >   Fair point. Could you please let me know once you have had a chance to test
> > > > these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> > > > workqueue.
> > > >
> > > >  Thanks for taking time out to review.
> > >
> > > After looking and thinking about it a bit, a BH context is still
> > > probably the best for this.
> > >
> > > I have tested this patch under load and various scenarios and it seems
> > > to work ok.  So:
> > >
> > > Tested-by: Corey Minyard <cminyard@mvista.com>
> > > Acked-by: Corey Minyard <cminyard@mvista.com>
> > >
> > > Or I can take this into my tree.
> > >
> > > -corey
> >
> >  Thank you very much. I think it should be okay for you to carry it into
> > your tree.
>
> Ok, it's in my for-next tree.  I fixed the directory reference, and I
> changed all the comments where you changed "tasklet" to "work" to
> instead say "workqueue".
>

 Thank you very much for fixing it.

- Allen

