Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B018C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kBMjssFuU7qb+lDgAID28McqHpYdJdKjSiHXIC3Jco=; b=aCWYH9fyOFoAHO2npraRts1R7C
	wupLAY8htwR7s9cpHWYFgKNLQ946LV+XG/P/zUOINOpSEBNAdeLg+SlbLpytSqnCbY+yjGD56VFAE
	VA6fFSGT0bXKY/zQC5QkanSEzopHSP39kqN7XzJWmWGHxIt7Cd8xoCGnFgSBPsXalA57lC7pwl8JO
	rsU31AiCQ2y0l6TTJYqrdcfJDzNwoHcDxT5S7+IC8zvDfOvyrBL4DZBuXv/+HQdPo3PENNnRwigAm
	VbtRvbtyM4W9eYEVrdMIzQaPXMIIM/PdzlfsbyjuzHb1NJw3QoMSPjRG9kHonGQ8Q/IXclFEd0bmm
	DCc5Zn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFGc-00000001LUJ-1Aio;
	Fri, 29 Mar 2024 16:39:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFGX-00000001LRW-0EBd;
	Fri, 29 Mar 2024 16:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 385F9CE301C;
	Fri, 29 Mar 2024 16:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D9DC433C7;
	Fri, 29 Mar 2024 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711730378;
	bh=bg+h7PlnfTedz1YBjzApxZkMOAnsBGDd8/EzMTXhZfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uW7qxP8y8ACgUR891lLqNXK4nRCSSexkXmk3NVlX/43RdUbJKhMUBo+3F7ImHHCLd
	 EgMy3VnFONlXXBX8N/84xV65QgEoe3byfIcVSoYOnvkYvas222h0lZkI0ts/7GK5dK
	 RXDBa+pCTcdJsCx5bNqP+0NeWpjfPDjTw0LzbJBD2TGFbdPiUtd9S2xCHSf/YkWg3h
	 LkeVRnbJmAa4tPbrg134PWkZdQ7HBQC4t3veXbL+goDjmVnDap5Tj4fOkvn8ClJwbk
	 uuZW1rzs8wZhLpPlp2dMwsOxB3VXY8Xf/XxfLnuX/VdqMAE2Sw5BpezoMJa9uZRiGz
	 dYTGMY6Ps7ZVQ==
Date: Fri, 29 Mar 2024 22:09:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen <allen.lkml@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Allen Pais <apais@linux.microsoft.com>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Kees Cook <keescook@chromium.org>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
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
Message-ID: <ZgbuxmxncU0-0jhA@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com>
 <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
 <ZgW3j1qkLA-QU4iM@matsya>
 <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_093941_441276_7915D740 
X-CRM114-Status: GOOD (  15.24  )
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

On 28-03-24, 12:39, Allen wrote:

> > I think that is very great idea. having this wrapped in dma_chan would
> > be very good way as well
> >
> > Am not sure if Allen is up for it :-)
> 
>  Thanks Arnd, I know we did speak about this at LPC. I did start
> working on using completion. I dropped it as I thought it would
> be easier to move to workqueues.
> 
> Vinod, I would like to give this a shot and put out a RFC, I would
> really appreciate review and feedback.

Sounds like a good plan to me

-- 
~Vinod

