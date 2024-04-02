Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17548C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEVY8ISKO5sb2jFIloFMt5L/HBE8lTDq/QzxP5thYi8=; b=ttJlUdyAA25aXi3OdPZ19iPtl0
	bRGJKW94CJeeembcewvde9EO6s0MdpXKEIBdHnvXfaxZ34dTjlpIQ4bvn7Lpso6vqpB6SURtkMZ90
	89jHfUS5zctUFPQ/bZgjLAaNv3O8GlwfWsCZQg04xIWVyrphx+Q4XOKrKg5bDbjRQzrzAuF2pzGsw
	5ziPw1brG0a0N1FsENbeh2Yiyf1hZWvm4AWLmCdXd2El/D3u0D1XMgUUnPrhOkS1a2WZYbDXE1U4e
	hrtO97S49bwQJ/7xxYKh2yCtYX8BKn2eUWEG5KhVRSfz2llsimxvPAQE5Zf/37mkS3t2yfcVa1IUS
	P/oULGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdvY-0000000BHiK-05VP;
	Tue, 02 Apr 2024 13:11:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdvJ-0000000BHWB-0Imp;
	Tue, 02 Apr 2024 13:11:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16DE360FE3;
	Tue,  2 Apr 2024 13:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE50C433F1;
	Tue,  2 Apr 2024 13:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712063486;
	bh=9zAsnZKUtdaB+0oUBoSFWoiBkfOWRDSb/L5GPa9FOno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLBmLWbFq8b7R4iZ1CSvRnROpQc318dtdynLw3zTplx/2SSnxsPhnBaGB0KWLxJLw
	 gtTVGsvy4tfXtBGJpBXwq9+p3MCPwkvK/hDkMvCwjFUh5usnZu6XFTibfhvcKn+2H6
	 bNq+gdNLc+F4UpxqMWgGKmEwi+KPVyCSJwAIqsT2U4GGmN/LnMTaAplp/AjMnXlBu3
	 Ft/ordeAQQOyjQYy8NAB2+7Nq/5pKWCsboYnCGnNR1VKTyBFWEf/lcch7254rsWnWE
	 MLVvNT3x0cyP38rdvhtkwlombEcbUi6JLHcn3CjFq0MSnQTG+8Cf+UPPNEYFD7jwHP
	 CjyG1mwKRgoUQ==
Date: Tue, 2 Apr 2024 18:41:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	tj@kernel.org, keescook@chromium.org, marcan@marcan.st,
	sven@svenpeter.dev, florian.fainelli@broadcom.com,
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
	patrice.chotard@foss.st.com, wens@csie.org,
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com,
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
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Message-ID: <ZgwD-iScEb9zzB8H@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com>
 <CACRpkdaSBGe0EFm1gK-7qPK4e6T2H1dxFXjhJqO2hWCm1-bNdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaSBGe0EFm1gK-7qPK4e6T2H1dxFXjhJqO2hWCm1-bNdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_061136_004961_9C8FDAE9 
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

On 02-04-24, 14:25, Linus Walleij wrote:
> Hi Allen,
> 
> thanks for your patch!
> 
> On Wed, Mar 27, 2024 at 5:03 PM Allen Pais <apais@linux.microsoft.com> wrote:
> 
> > The only generic interface to execute asynchronously in the BH context is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > behaves similarly to regular workqueues except that the queued work items
> > are executed in the BH context.
> >
> > This patch converts drivers/dma/* from tasklet to BH workqueue.
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> (...)
> > diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> (...)
> >         if (d40c->pending_tx)
> > -               tasklet_schedule(&d40c->tasklet);
> > +               queue_work(system_bh_wq, &d40c->work);
> 
> Why is "my" driver not allowed to use system_bh_highpri_wq?
> 
> I can't see the reasoning between some drivers using system_bh_wq
> and others being highpri?
> 
> Given the DMA usecase I would expect them all to be high prio.

It didnt use tasklet_hi_schedule(), I guess Allen has done the
conversion of tasklet_schedule -> system_bh_wq and tasklet_hi_schedule
-> system_bh_highpri_wq

Anyway, we are going to use a dma queue so should be better performance

-- 
~Vinod

