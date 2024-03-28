Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63CECD11DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=622VK9NVBI6NV/BHlHroiE+gl2GqatwpJmnEQrqKhSw=; b=FluEXM0zGvowD4JKwp3rk74zl+
	Jj4JvKuo66UyMC+fQYZU9nv2T6GYMJogi0JIsaaDqJVA1FQeXBlLgHSOQk/x3po1I5x0ltW4FyXjd
	JSa7pNm/oZebMQqAMXUWnVvmBh3DWWwxJnY49oFR30vm+WCi2F5c1iI1MOiWXH3QoEFS0VSaPqCnJ
	+3l7SsExHrQztJEqlAV3dfPl8Z07IOE9XfVOxaJiTpmGcmJtzbeInLtykHcyJWI+HEiJTJFI246PH
	UiVCXcirR5qmAPoZEhQ2Y2o7M2Db3L7KgceBgSLaW2D6HO9sxlxRVsdFJHWZIyYFxce1MF2PhPTh7
	T7ugRDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvbJ-0000000FQDT-0Rx0;
	Thu, 28 Mar 2024 19:39:49 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvbE-0000000FQBq-0x7Q;
	Thu, 28 Mar 2024 19:39:45 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7e05d68723dso281196241.1;
        Thu, 28 Mar 2024 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711654782; x=1712259582; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=622VK9NVBI6NV/BHlHroiE+gl2GqatwpJmnEQrqKhSw=;
        b=ly0y1j2rC9P0Zy2qjoiHwMGog4pYdmtn01vtiyseIyeL4G46OodMc+h5d5Cxs0gGWd
         7bBUuDZwkegac6j4yiPpY1U0stxc4W1I2MRKtrs/cgaRvt6R/CuGueRqulyRv7PQRaR/
         GupQtZvK7qUUn+h9CyijvZcBLC+GpesIOqQzg5/b7d6VCdw+yiuwm4zb8dmbBMVcfZCE
         C0aSQ3l6WGBUORx52Q5HL51kAr0F3C+wf68WB6WxIBZQIuGzOd68q4LMdKnorxmIBQjt
         t5chxfmqCx8cHZCU0kNwUdsydpmFAOrQb2/461sOb2YlueLqh/A0glLl5onWKnTsFQsj
         cLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711654782; x=1712259582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=622VK9NVBI6NV/BHlHroiE+gl2GqatwpJmnEQrqKhSw=;
        b=c5HG2ZQqEg6gbKlwoLj0CZkEMvL6iMCIlWQAUKanRz2YUrWTg3xpkxAyXJGTG2Ibje
         uvATu9wbgZRZnCjwDPCkiyqkF5gDRAiPFTOoEznhKJZ4Cm5IdDRjzvaqDE8T35QzIqiP
         l3b+C4ECNdYMrctxshkD99e80lrQmZRFBCLfonxgJ2/iD78UymU+w5WXnn/8zZyyWwUL
         Wz8vtx0Vdk1zp+mVP7JRcwuuSzfo7Me4IXIp7Bebi9JTHqbc08e3E/ensLa3gWysBAVm
         vfRSRMIP8MUDyKxpzDtZ7QF5/SuVAO30ivg9joweZxBCCWjSS8x19YSkfvI37PqtWMFq
         MpWA==
X-Forwarded-Encrypted: i=1; AJvYcCX5UfAdqGynJflcf/ZTr0PETCX45mkcqaL3t3S5OhexH7XQ8XEn7NDTTf9Bm1JKc3GSwSv+Gn0lvQm+wQEx4mKpj3v8YmEj95O8UoAdSN90n3hNCCUEZS16pOpsH4OtBcqxkipVI5yp2hBSR/vp8T7BOE8v1MdEu4EA8CWBEvr5c1Pw1d2urD6ade/FI0La6MFv9y6lVXSrrVsCBVjTniq/PIIypmtulBz+HrznrDryrL86whRCSR2735aMC71xPqjJ/SBonoUVKCsYWoNy6TKKCigBV5JoeaSj2d/K4KVp220l
X-Gm-Message-State: AOJu0YzhAnvFIG50xEywoVA3I8nLJwuh3s+TxnP87W8V9au6pqvcPB5d
	HFASsGFE/b1bnLLLUV86hZiv0tH33LHaTF/7GnKtSFx7bMenF1MbXE6UbzHlei6N2ig/MvEwqme
	WBbzfxY1u7IOGpf9r76C1qqGw+48=
X-Google-Smtp-Source: AGHT+IEY59Ji/OARBUAoYgwqWp5p4Pop3R94bZWuKlJaRj9K8xYwJ5pD7jLBPmXxcg5SXNElqhUUtT98mEK7bvSO2Kc=
X-Received: by 2002:a1f:c801:0:b0:4d4:1cca:1a72 with SMTP id
 y1-20020a1fc801000000b004d41cca1a72mr369742vkf.6.1711654781874; Thu, 28 Mar
 2024 12:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com> <ZgW3j1qkLA-QU4iM@matsya>
In-Reply-To: <ZgW3j1qkLA-QU4iM@matsya>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 12:39:30 -0700
Message-ID: <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Vinod Koul <vkoul@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Allen Pais <apais@linux.microsoft.com>, 
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
	duncan.sands@free.fr, Alan Stern <stern@rowland.harvard.edu>, 
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
X-CRM114-CacheID: sfid-20240328_123944_290351_F60288A3 
X-CRM114-Status: GOOD (  26.47  )
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

> > >> The only generic interface to execute asynchronously in the BH context is
> > >> tasklet; however, it's marked deprecated and has some design flaws. To
> > >> replace tasklets, BH workqueue support was recently added. A BH workqueue
> > >> behaves similarly to regular workqueues except that the queued work items
> > >> are executed in the BH context.
> > >
> > > Thanks for conversion, am happy with BH alternative as it helps in
> > > dmaengine where we need shortest possible time between tasklet and
> > > interrupt handling to maximize dma performance
> >
> > I still feel that we want something different for dmaengine,
> > at least in the long run. As we have discussed in the past,
> > the tasklet context in these drivers is what the callbacks
> > from the dma client device is run in, and a lot of these probably
> > want something other than tasklet context, e.g. just call
> > complete() on a client-provided completion structure.
> >
> > Instead of open-coding the use of the system_bh_wq in each
> > dmaengine, how about we start with a custom WQ_BH
> > specifically for the dmaengine subsystem and wrap them
> > inside of another interface.
> >
> > Since almost every driver associates the tasklet with the
> > dma_chan, we could go one step further and add the
> > work_queue structure directly into struct dma_chan,
> > with the wrapper operating on the dma_chan rather than
> > the work_queue.
>
> I think that is very great idea. having this wrapped in dma_chan would
> be very good way as well
>
> Am not sure if Allen is up for it :-)

 Thanks Arnd, I know we did speak about this at LPC. I did start
working on using completion. I dropped it as I thought it would
be easier to move to workqueues.

Vinod, I would like to give this a shot and put out a RFC, I would
really appreciate review and feedback.

Thanks,
Allen

>
> --
> ~Vinod
>

