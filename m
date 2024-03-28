Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B6FCD11DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CoqXNTRcmwlCY/xhGyAVojJiT/UcLdDcoASRjE/JUY=; b=2cpcrZT5dYd3YlFj6fJZGzgH7r
	25jtwdtOMroBQBOXW6OL/GafbgyLHwHs+pQ7rfEusyRBHHJSC/lQ5UE19YHTm0/C8s1lokygr6Ef6
	Olb/HtIUGh8V/3uyrnxMkNfYhXJPzOyrBJ5LK6RzNE6YppJ9U2bXrNbVTL6MqDuuFoaaxh7A/gMLd
	iFg0HgND5LArQr4LIHtxULPnPWorpeB73Vi5NvnX6uIsfOo7e1UcRA0x3XxQN/izDUdOd+Egq4iQp
	/eiuoxme+Zwc6kaoAKjVIoCUOz6Abl5c057gk1OgLQO0p5OGZHaVNzeY0KYk6iJ+rZ8dvK74vTp07
	47NUwwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpuXa-0000000FC43-3e7a;
	Thu, 28 Mar 2024 18:31:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpuXX-0000000FC2p-0Wm6;
	Thu, 28 Mar 2024 18:31:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7250A61783;
	Thu, 28 Mar 2024 18:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9561C433C7;
	Thu, 28 Mar 2024 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711650709;
	bh=09Kq07Ctu1YK6YAopY47/y5AlbJwjHjNBMXfeYxKY3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQ+Ol01eGrtbmmXmm5UOF8z3YVrAFzrLyUinoyXQOw2oD/3BtgXxtRpcyL6qEGHMi
	 Fuf1dGmu1+mXVCx0A2v+QG1OZmZa5GwKeTprSp0vXiGl5WvN4w7glf0wb/Ho4jGsI6
	 A7WhuNfxRZ+SYEDd2EHDavctgY396ec7mZY6h+UmOVbwQhncgmm56Grgtq512eTU0I
	 juRVEJtAyO8mA2/2SAJmqgsMiWvU8lqDqaMAEVDmDUSGgn+tYLJ7mum23hafaIgM0S
	 0/cB+mlWradcKD4+nkGPqD1rFiy3Q7s73Qm1b4qRq5IHy2lK358t2WVn9s4EqNJkuF
	 qXaWYWlrz6OoQ==
Date: Fri, 29 Mar 2024 00:01:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Paul Cercueil <paul@crapouillou.net>, Eugeniy.Paltsev@synopsys.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Leo Li <leoyang.li@nxp.com>, zw@zh-kernel.org,
	Zhou Wang <wangzhou1@hisilicon.com>, haijie1@huawei.com,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	logang@deltatee.com, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, peter.ujfalusi@gmail.com,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	"jh80.chung" <jh80.chung@samsung.com>, oakad@yahoo.com,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, brucechang@via.com.tw,
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr,
	Alan Stern <stern@rowland.harvard.edu>,
	Oliver Neukum <oneukum@suse.com>,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	"linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-s390@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Message-ID: <ZgW3j1qkLA-QU4iM@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com>
 <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_113151_248265_6F9A9644 
X-CRM114-Status: GOOD (  21.24  )
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

On 28-03-24, 11:08, Arnd Bergmann wrote:
> On Thu, Mar 28, 2024, at 06:55, Vinod Koul wrote:
> > On 27-03-24, 16:03, Allen Pais wrote:
> >> The only generic interface to execute asynchronously in the BH context is
> >> tasklet; however, it's marked deprecated and has some design flaws. To
> >> replace tasklets, BH workqueue support was recently added. A BH workqueue
> >> behaves similarly to regular workqueues except that the queued work items
> >> are executed in the BH context.
> >
> > Thanks for conversion, am happy with BH alternative as it helps in
> > dmaengine where we need shortest possible time between tasklet and
> > interrupt handling to maximize dma performance
> 
> I still feel that we want something different for dmaengine,
> at least in the long run. As we have discussed in the past,
> the tasklet context in these drivers is what the callbacks
> from the dma client device is run in, and a lot of these probably
> want something other than tasklet context, e.g. just call
> complete() on a client-provided completion structure.
> 
> Instead of open-coding the use of the system_bh_wq in each
> dmaengine, how about we start with a custom WQ_BH
> specifically for the dmaengine subsystem and wrap them
> inside of another interface.
> 
> Since almost every driver associates the tasklet with the
> dma_chan, we could go one step further and add the
> work_queue structure directly into struct dma_chan,
> with the wrapper operating on the dma_chan rather than
> the work_queue.

I think that is very great idea. having this wrapped in dma_chan would
be very good way as well

Am not sure if Allen is up for it :-)

-- 
~Vinod

