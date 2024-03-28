Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C21ECD11DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 19:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BW4gpjPip0MIz7Sv02WTjVBL1poTtTjeiFToXn5W8yQ=; b=H60P1nIRT4j9th9Z71OORaY+tB
	E0Wj01gw7x5CJBQkHbB+0qwn1ZReaMP+a3SK/RBvTvbnnH0k52deU+sHnYPvn0ls2NAI7tu2XypPL
	iJKFAhOL5IJZP6aOUfgwls7RdT7npMpA5uQYegwRbfyy4SwoRiqk0uL0Q+FZnuR0FNp8fv8D8yVmj
	CIhQe82mZZN42JbecxpEfnD7dQgwwV5EWprKrbZ3+1LmUSrgrLPCjd2mt62igUkTrbyLCqBstVHeL
	D25emTJ4s5lX4GnjPYW7GwJJkJ8wJ5IyFsbuloXxQg/hUm2LwvphGPERf/9ImGE/sNaPRRQ5Reu22
	CHZ8ZYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvlQ-0000000FSDp-3lzl;
	Thu, 28 Mar 2024 19:50:16 +0000
Received: from flow5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvlN-0000000FSAs-01ho;
	Thu, 28 Mar 2024 19:50:14 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id 35A5620026D;
	Thu, 28 Mar 2024 15:50:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 28 Mar 2024 15:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711655408; x=1711662608; bh=BW4gpjPip0
	MIz7Sv02WTjVBL1poTtTjeiFToXn5W8yQ=; b=f7UX+4Pcu6g1fuDG/2VVEitZ3G
	QUMw7eXjSXsVFH66+taJAuA+K236VIbLKYe25JuST225E4z1xHxL2/2LtCRDTnmU
	n6ve6KfgedMjL2XLQveE6wn2Etpx5XZpxwVEvGc9S8uh0MO7kxHXOMvBs0RSLgOb
	Z4x6VFyXqeAGF29fvaja951eipxGSjyBqxDJrgJqsQGYGDJchM0S/wIgeKCC56Tp
	yy3P1woDZ2PYXLyJCN7oQDlQyZnTv8POQK4Y9IX1QsW7x4LXBpTuUVXL079pL1qY
	c8aHoEkfsGnaqC7cdNeGeJKfDtIInY7//byDCYjIJh0GZpsXE1Nlwpvc28Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711655408; x=1711662608; bh=BW4gpjPip0MIz7Sv02WTjVBL1poT
	tTjeiFToXn5W8yQ=; b=csg1O07txOaVvOWughgoF1bJEzemGtOETePgwtvzZAfA
	VtfvSPlTmevhy2SRIOSlxGl/ziKmaxcsgCY8MskufwdkbniJlzOnf6V2YN6oj/wj
	O/GMHPI1vHTQCnnkxXW8ewXWuqkTeHxgt378h4sL5SXj1OE11EYjcq+gJSzV/2yx
	57hBTFu9rPkf/BSl7zjPJkqQr23ZCzjOc+lNEw90HzsO6vZ1BHt1GGEbfjXZeYqk
	4mjQu7/I6378RC3ndN5bM7YGcXnnklViSVT1WVQmKqWfCE4MpnbATpOmDMjTcgSj
	Ndwws714kFqEKc2vOOAREK2Ek5kgI3Az+hJNSEwS1A==
X-ME-Sender: <xms:7ckFZgx5tu4bAvUGLkKcZrX-cRBBCFPUwivVbrqpvYnxZjfR3Ouh3g>
    <xme:7ckFZkRueNttJPZFneG6Q80JylGkQF6mdDjM59ne5mlAoW1W9VzUlkuyJ4EgvxkD9
    qcvlQkaqolFxDiDZLU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduledguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:7ckFZiVjaDs8eD5LFreZzpgUuHvfIy_8fMXgOX4leo573jO7501ZgQ>
    <xmx:7ckFZujghNVwcfUCWKm85BVyJWRtb8_SXoseITfNpe_wG_psaAm3sQ>
    <xmx:7ckFZiD3xw2zvDrylXyZZwHVDAyX3ZEv_6D9gPl8_sbUEnjX936dYg>
    <xmx:7ckFZvKUkZitQXBsGo5-E7fjRHu2EeySeOnc0hwOM13gLqXyAC2RIw>
    <xmx:8MkFZpfgruaumRILI-G9uyonNT2Mm7JcDkeb2mObdPHz9wSV9uAJgiH6gVM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7B52EB6008D; Thu, 28 Mar 2024 15:50:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
In-Reply-To: <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
 <ZgW3j1qkLA-QU4iM@matsya>
 <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
Date: Thu, 28 Mar 2024 20:49:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: Allen <allen.lkml@gmail.com>, "Vinod Koul" <vkoul@kernel.org>
Cc: "Allen Pais" <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
 "Tejun Heo" <tj@kernel.org>, "Kees Cook" <keescook@chromium.org>,
 "Hector Martin" <marcan@marcan.st>, "Sven Peter" <sven@svenpeter.dev>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Ray Jui" <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>,
 "Paul Cercueil" <paul@crapouillou.net>, Eugeniy.Paltsev@synopsys.com,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Viresh Kumar" <vireshk@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Leo Li" <leoyang.li@nxp.com>, zw@zh-kernel.org,
 "Zhou Wang" <wangzhou1@hisilicon.com>, haijie1@huawei.com,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sean Wang" <sean.wang@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, logang@deltatee.com,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Orson Zhai" <orsonzhai@gmail.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Chen-Yu Tsai" <wens@csie.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, peter.ujfalusi@gmail.com,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>,
 "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Manuel Lauss" <manuel.lauss@gmail.com>,
 =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 "jh80.chung" <jh80.chung@samsung.com>, oakad@yahoo.com,
 "Kunihiko Hayashi" <hayashi.kunihiko@socionext.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>, brucechang@via.com.tw,
 HaraldWelte@viatech.com, pierre@ossman.eu,
 "Duncan Sands" <duncan.sands@free.fr>,
 "Alan Stern" <stern@rowland.harvard.edu>,
 "Oliver Neukum" <oneukum@suse.com>,
 openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-s390@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_125013_123735_63DB361D 
X-CRM114-Status: GOOD (  13.25  )
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

On Thu, Mar 28, 2024, at 20:39, Allen wrote:
>> >
>> > Since almost every driver associates the tasklet with the
>> > dma_chan, we could go one step further and add the
>> > work_queue structure directly into struct dma_chan,
>> > with the wrapper operating on the dma_chan rather than
>> > the work_queue.
>>
>> I think that is very great idea. having this wrapped in dma_chan would
>> be very good way as well
>>
>> Am not sure if Allen is up for it :-)
>
>  Thanks Arnd, I know we did speak about this at LPC. I did start
> working on using completion. I dropped it as I thought it would
> be easier to move to workqueues.

It's definitely easier to do the workqueue conversion as a first
step, and I agree adding support for the completion right away is
probably too much. Moving the work_struct into the dma_chan
is probably not too hard though, if you leave your current
approach for the cases where the tasklet is part of the
dma_dev rather than the dma_chan.

      Arnd

