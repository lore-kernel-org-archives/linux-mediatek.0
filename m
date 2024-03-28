Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43629CD11DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQZIemFmXjC6xyiLulQ43Ea/EhoY/GbG4RXFhJQU0/8=; b=aZhwzqVtZXOYEgervJ1zL8d3RD
	PfWatSu8bKGTNDEvKXfOu5EpJC5+H8EO6bsGRJg/VQjmeHTYdKveJWlWCjsgl1Bvu/t5FAlMJBtHC
	e5dLUbU4XC4AWGcXrhDzhDJTLidU6jPg+Cs4unW7Llw83wbvOkH1iCvOXIvE02U4Jn3K7e5M51XDx
	RnRQIngl4mPRghjVQiAR/5atLMqzqrd/afxYRAvS3OMew4hQajzibg6RKSgCKgQ1hg0ki8JuTITwS
	W/REIlo0LqM1ATuvqbazeELw7rQHK33h7p5Wbd2BBNI9qD/8DE+2zZIURRb+eCoMtPrpL1r2MBMOh
	niN3cT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvx0-0000000FVnU-1UrV;
	Thu, 28 Mar 2024 20:02:14 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvwu-0000000FVl3-3Piq;
	Thu, 28 Mar 2024 20:02:10 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-78a16114b69so122036085a.0;
        Thu, 28 Mar 2024 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711656126; x=1712260926; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lQZIemFmXjC6xyiLulQ43Ea/EhoY/GbG4RXFhJQU0/8=;
        b=Iz5B4McBCx7e0HcG7aT3b1gIDZS1HdqCD7uwNwkFJdfK0aG2HxVplwrISE8XwYh2X9
         aVjSvDIDoY2fcxc/n+/Jx4+Z19Wqvi2pk7yWKZFnuO+cJPu/J3RobPeC0ivhV/DwoDU2
         3SjGEXs1alkZIT09HvOKdEpXI5TZdBX0WuVSo0+Ter3/Bsq3tyfaaKmsI9H82rSTlDuG
         Gg3aCHMaekzCjJKnJX1agV3dY4pV0DUc52pOEyHKXlRW2P6iO/WN3tSMUrA+ZSO+3hLh
         Ax5vJ/PVSG4Rkd6thjrRTKshFWsv6YC8yV2Ds03bj6+AOA2a+1TuhppfS5vQ+07yrplt
         H2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711656126; x=1712260926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQZIemFmXjC6xyiLulQ43Ea/EhoY/GbG4RXFhJQU0/8=;
        b=RMHWTlyfm7kYX8QlQlIgvd5HTORZ5a3m4IikRqtx/16GhrJWqqRrK+wkQyxbPMPbSW
         gpKgFEKsmw3gWhlZq/9udo1x0n4L8NpLFRhNBboJg9Z7433s3C2e3tknYwJ08Wz3GDNn
         DOxHu46TppxauqAe3np8vJkwpy5SY8jrOCfZidZqQ3J83oIBNewLeTFz0uTEsP0DDK0e
         U+E7LBwM2fmFUrz6rVwKNIx3ENExtE1QLFPuOmTqouIrJ1sr6n0tZjHSiNNjSgATwIkT
         gnsJYMyDh6cFOC8u+07B7fjoXRZu5gqzh2IYMorM6HnaGkWe8JcSO9N1wx5/J4xYnQBt
         XScQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBpHVHGU8EmeGiMjnYdK0q0IreT6mun3B1sVbThrKiKpcvfea+yMOAcz1P2ausTnTzYBvLKRKh/n+OLKVh4adIghPUP+afggsa+k67TJnaUbCMfBryVnphoNdbWjWxKttCYf1ItqpsxmszOU2KMUL6/wywR082pskiFT8HrP9en3BGmDXDUguFfzbBk+0cOLQ3kncgCwFYnpH01owjZLElOudHH/85Zf9kxGdws/sscqvBa6eOFGjGTOgkFHK8abEOXTJS1rxIyWSpNp3l6eDQSJEd03bqac4h3W0epd/LeNPe
X-Gm-Message-State: AOJu0Yx6h/mZMX0agY/cXOLCRbX60NaSmIs20qSrAfMtDLDMM8Jar8Ne
	G1uWx8GJFUc9jtvbJsIri+DsoHN4FNgBcDibDjTbNSKSk/sw0s8FGhRc3a3Ypxb4711bnWkgczv
	clIdUFIbzyDn32UfKA8HLCQVRrhA=
X-Google-Smtp-Source: AGHT+IFQNOvoxYEranyGbOCvmAR4etDDhau+OcrTFex7JkKGx6yINzP/h18hs1c4qiY1arvh6SuEYWtwfkxWkgaJ4wM=
X-Received: by 2002:a05:620a:c4e:b0:78a:62a6:7e2f with SMTP id
 u14-20020a05620a0c4e00b0078a62a67e2fmr5081544qki.5.1711656126274; Thu, 28 Mar
 2024 13:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com> <ZgW3j1qkLA-QU4iM@matsya>
 <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com> <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
In-Reply-To: <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 13:01:55 -0700
Message-ID: <CAOMdWSKC4B8zn6N+=5DssB_BiR6JkHBEpJr0ohKb149eJvCKMQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vinod Koul <vkoul@kernel.org>, Allen Pais <apais@linux.microsoft.com>, 
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Paul Cercueil <paul@crapouillou.net>, Eugeniy.Paltsev@synopsys.com, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Viresh Kumar <vireshk@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Leo Li <leoyang.li@nxp.com>, zw@zh-kernel.org, 
	Zhou Wang <wangzhou1@hisilicon.com>, haijie1@huawei.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, logang@deltatee.com, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, peter.ujfalusi@gmail.com, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, Ulf Hansson <ulf.hansson@linaro.org>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	"jh80.chung" <jh80.chung@samsung.com>, oakad@yahoo.com, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu, 
	Duncan Sands <duncan.sands@free.fr>, Alan Stern <stern@rowland.harvard.edu>, 
	Oliver Neukum <oneukum@suse.com>, openipmi-developer@lists.sourceforge.net, 
	dmaengine@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	"linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-s390@vger.kernel.org, 
	Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_130208_903881_92E87D30 
X-CRM114-Status: GOOD (  21.26  )
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

> >> > Since almost every driver associates the tasklet with the
> >> > dma_chan, we could go one step further and add the
> >> > work_queue structure directly into struct dma_chan,
> >> > with the wrapper operating on the dma_chan rather than
> >> > the work_queue.
> >>
> >> I think that is very great idea. having this wrapped in dma_chan would
> >> be very good way as well
> >>
> >> Am not sure if Allen is up for it :-)
> >
> >  Thanks Arnd, I know we did speak about this at LPC. I did start
> > working on using completion. I dropped it as I thought it would
> > be easier to move to workqueues.
>
> It's definitely easier to do the workqueue conversion as a first
> step, and I agree adding support for the completion right away is
> probably too much. Moving the work_struct into the dma_chan
> is probably not too hard though, if you leave your current
> approach for the cases where the tasklet is part of the
> dma_dev rather than the dma_chan.
>

 Alright, I will work on moving work_struck into the dma_chan and
leave the dma_dev as is (using bh workqueues) and post a RFC.
Once reviewed, I could move to the next step.

Thank you.

- Allen

