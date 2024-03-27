Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E25C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjjb3drcv3Ayv3J8QY9Y1C9tZ2hSe2Ve9q5qRtyoa/s=; b=DvfE24xdupoLtwe8wmSSz58Hbk
	GbbgW9rmyv6HHpjytHj1JUaUOEDdB+sYo6ZlxPBZOtGqe+RH90tUyhypBJAovv0Yymc9phxTDvUbR
	OXLflT28baFal1JuCov3wk/7lrkcWSRavwRgwI9sf8sfOQ+79xILR/wcdqOYsEPl2Co74pNMNlgwh
	F8hAdho1xwAHHt0SASHc6O4NSGSyxJLivVaQyK2qXOvR7K6M3gPaGY37ViMHwWJmUNqODObwlWGt9
	ruBmLWCCEvWkTRfIG2SeXwDFDw2wjfl1mayU8E4F0lkvwulozdxSS6/V2U3uLJJnQVCfXYtv8G14j
	oE1IUBMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWYx-0000000AAGm-3rqA;
	Wed, 27 Mar 2024 16:55:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWYs-0000000AAEt-3dtv;
	Wed, 27 Mar 2024 16:55:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 72A43CE2707;
	Wed, 27 Mar 2024 16:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABDBC433C7;
	Wed, 27 Mar 2024 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711558535;
	bh=vpDkfUBtWL+UxBwjuUm5gYeL/cEacWfXEPKG81vcE0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9UtOMh9NhK8uq0mZiMXt2LKgdT1qaV4eqkqQ4OpNjzEIBfNH8AxnSa5LKMbuNnuj
	 139SwlhRdsUzFtHFa7nm692D1Q6Maoi8Dc8aCzxaDG36oyEKDDYttLwvcqzFnSbA0P
	 DJD28wQMsDmrT4Kh7AowzV2l5JSL5uf6ZAH6m6jc=
Date: Wed, 27 Mar 2024 17:55:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
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
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
Message-ID: <2024032753-probable-blatancy-80bf@gregkh>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160314.9982-5-apais@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_095539_316614_AEBFB814 
X-CRM114-Status: GOOD (  19.35  )
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

On Wed, Mar 27, 2024 at 04:03:09PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.

No it does not, I think your changelog is wrong :(

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/usb/atm/usbatm.c            | 55 +++++++++++++++--------------
>  drivers/usb/atm/usbatm.h            |  3 +-
>  drivers/usb/core/hcd.c              | 22 ++++++------
>  drivers/usb/gadget/udc/fsl_qe_udc.c | 21 +++++------
>  drivers/usb/gadget/udc/fsl_qe_udc.h |  4 +--
>  drivers/usb/host/ehci-sched.c       |  2 +-
>  drivers/usb/host/fhci-hcd.c         |  3 +-
>  drivers/usb/host/fhci-sched.c       | 10 +++---
>  drivers/usb/host/fhci.h             |  5 +--
>  drivers/usb/host/xhci-dbgcap.h      |  3 +-
>  drivers/usb/host/xhci-dbgtty.c      | 15 ++++----
>  include/linux/usb/cdc_ncm.h         |  2 +-
>  include/linux/usb/usbnet.h          |  2 +-
>  13 files changed, 76 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
> index 2da6615fbb6f..74849f24e52e 100644
> --- a/drivers/usb/atm/usbatm.c
> +++ b/drivers/usb/atm/usbatm.c
> @@ -17,7 +17,7 @@
>   *  		- Removed the limit on the number of devices
>   *  		- Module now autoloads on device plugin
>   *  		- Merged relevant parts of sarlib
> - *  		- Replaced the kernel thread with a tasklet
> + *  		- Replaced the kernel thread with a work

a "work"?

>   *  		- New packet transmission code
>   *  		- Changed proc file contents
>   *  		- Fixed all known SMP races
> @@ -68,6 +68,7 @@
>  #include <linux/wait.h>
>  #include <linux/kthread.h>
>  #include <linux/ratelimit.h>
> +#include <linux/workqueue.h>
>  
>  #ifdef VERBOSE_DEBUG
>  static int usbatm_print_packet(struct usbatm_data *instance, const unsigned char *data, int len);
> @@ -249,7 +250,7 @@ static void usbatm_complete(struct urb *urb)
>  	/* vdbg("%s: urb 0x%p, status %d, actual_length %d",
>  	     __func__, urb, status, urb->actual_length); */
>  
> -	/* Can be invoked from task context, protect against interrupts */
> +	/* Can be invoked from work context, protect against interrupts */

"workqueue"?  This too seems wrong.

Same for other comment changes in this patch.

thanks,

greg k-h

