Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B27CD11C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roPWxbLccZER+vBGVJyQfVpEx9mdSzd/kyTN65Tprig=; b=VOOU6hbLpLeLFhJtbYvZgFexz4
	ITRxMCzUzUGMKb2s8DEp/9VicNIObvc1gEKTmq2TquPU1AX1ZRfq15tmeY5Ib7wzHDUxR6MwW8Pye
	lDoJ6gKUANUBLK6IrPlP9J047cXknQLZYRXIboY2auP8q4LSX45RBR17WuwrdnmghjCL66F4v5IYj
	nO5XEBFB7ptH+7x4+RKv2za6cLAgifeRxLPtaA6ua46VNfRgYdmJ2aZ3GBCsZvtF8QFk9CiVyAn01
	p68I0NhDP5/O7hvUh3UH6WpQ2phbteVKiuCm3Ss/xPLPp8GBRL2W0TNRod/BDqqJ3GVh7matV2jAy
	eOj9F7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsftB-00000006Bvu-3CU3;
	Fri, 05 Apr 2024 09:29:37 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsft6-00000006BtT-3XlQ;
	Fri, 05 Apr 2024 09:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1712309337; bh=gui0f6MViE5zSAEEOcDKHdPoDszSctiaYWprNP7GSNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcrcoLqsz/zzlMruWf44PYk75DueBejOUyr1Eh31EyaZcoY7ODel3t0vFK51sQutC
	 YY7dBqw6x5FiEghmAZFtz/zTJMGq5GtkEocuVfbQcN9BDPuRIei5HZ4DdjLpHxZ7+6
	 E7lgHaOaQ5/+P2XOh5i4UPTyYivuDu5pF+wIovDfOhmC0jyS7Po0jdQpgN6Tw+kWcU
	 BR21bYeWeQT2EX7dHW/mtmIf4RbdkqX5exTxh2367mA4o2zBmZSc7BFV4XrNkiEptZ
	 Q5SBD2Ru9xBFkYUfXpcQGRwkKRKwaEBGta6Gar0WuqKpV+3lBKaNoDOSXQIouXFRPP
	 Bq/roRR1X1cQQ==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4V9tTX48kvz8B;
	Fri,  5 Apr 2024 11:28:48 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.3 at mail
Date: Fri, 5 Apr 2024 11:28:47 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org,
	vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, paul@crapouillou.net,
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
	jh80.chung@samsung.com, oakad@yahoo.com,
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
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
Message-ID: <Zg_ET2XmZM_Id_Ad@qmqm.qmqm.pl>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240327160314.9982-10-apais@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_022933_054313_96CB138E 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 27, 2024 at 04:03:14PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
[...]
>  drivers/mmc/host/cb710-mmc.c                  | 15 ++--
>  drivers/mmc/host/cb710-mmc.h                  |  3 +-
[...]

Acked-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>

