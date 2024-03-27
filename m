Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCE7C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOw2NlnXBhvo80NLMmzd6pkkJ3EgPfGkkGtJAd8chaM=; b=Y0zM9Kpm1AWRIwJ1InY4mA83gn
	w9BbqFD0NmLLhNm0eT0mtSLmpcNlECI8yoLcpl3RnlWS6+3WzkwIU3eozmP30x+gaqd6xqII10Rz7
	DMLjeg4S4yAeHU867HyTi5r8XjoZY97vfTAjPTeyOlTaI8kofSJPmsCm1yeArVKAOu7Ctp35LA3CN
	bmfEXz8BUWO2VnsoqfCAhUGlx3J+jIikqSZaqYu+98V5kYTR5GttkyFgkL1qk1KsseUva8m8K/IoA
	G+W277QgU0WPsglUycAhf7/QdsBPR4IKLAL59LzbCuO+ww3CA0K580tQlc1y0/EpdPMtZYmgBHuAx
	LZKY3IEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXUd-0000000APC1-1WsJ;
	Wed, 27 Mar 2024 17:55:19 +0000
Received: from netrider.rowland.org ([192.131.102.5])
	by bombadil.infradead.org with smtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXUY-0000000AP7x-1yos
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 17:55:17 +0000
Received: (qmail 935614 invoked by uid 1000); 27 Mar 2024 13:55:00 -0400
Date: Wed, 27 Mar 2024 13:55:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org,
  vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev,
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
  aubin.constans@microchip.com, ulf.hansson@linaro.org,
  manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com,
  oakad@yahoo.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
  brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
  duncan.sands@free.fr, oneukum@suse.com,
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
  linux-s390@vger.kernel.org, netdev@vger.kernel.org,
  linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
Message-ID: <42c445b4-a156-4c43-bf98-bd2a9ac7a4fa@rowland.harvard.edu>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160314.9982-5-apais@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_105514_877289_2F09414A 
X-CRM114-Status: GOOD (  12.94  )
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
> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c0e005670d67..88d8e1c366cd 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c

> @@ -1662,10 +1663,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
>  	usb_put_urb(urb);
>  }
>  
> -static void usb_giveback_urb_bh(struct work_struct *work)
> +static void usb_giveback_urb_bh(struct work_struct *t)
>  {
> -	struct giveback_urb_bh *bh =
> -		container_of(work, struct giveback_urb_bh, bh);
> +	struct giveback_urb_bh *bh = from_work(bh, t, bh);
>  	struct list_head local_list;
>  
>  	spin_lock_irq(&bh->lock);

Is there any reason for this apparently pointless change of a local
variable's name?

Alan Stern

