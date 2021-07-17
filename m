Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD85C636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 16:42:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CDE96115B
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 16:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CDE96115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLqsNe5Fvj+tVQn7hvJefGsI1UL0PC2LBxooSqmrgBI=; b=PCGPzUaHZA/eDv
	z+Kfo8sdCF8Oe7bMy8JBPTd6FRHQ1BWmuXaP/8UfJa1eEv0aQq0kSqtI7pts5h8y8z/fWrJfRpvY2
	IWEFwEc/lS1WYWSTlKXYpBluRRbSqj+ZkApWyTNE+7Z+0WHlz/fSpycbaFUNpz7T5ktrjl52+KLGM
	9YZTySfq/qrmZCcGkTNxLJcFUlhTfRhI8lb0+ZHdvxT0KD2aauBbu9hsm8r02yTR/lyr50NZSnHAd
	So08i7RP9O4kKn7E2gi8mkH2IhTTMoaVaYkN599yQSWDk9/TVZKEzuOqIhPyORicObZfpjSodb+xD
	NrCEcvZD2JmSPoOpB+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4nOW-006pev-3C; Sat, 17 Jul 2021 16:42:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4nOJ-006pe2-Ve; Sat, 17 Jul 2021 16:42:17 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18D1E61159;
 Sat, 17 Jul 2021 16:42:08 +0000 (UTC)
Date: Sat, 17 Jul 2021 17:44:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Hui Liu <hui.liu@mediatek.com>
Cc: <robh+dt@kernel.org>, <knaack.h@gmx.de>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <srv_heupstream@mediatek.com>,
 <zhiyong.tao@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <seiya.wang@mediatek.com>,
 <matthias.bgg@gmail.com>, <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] iio: mtk-auxadc: add mutex_destroy
Message-ID: <20210717174432.7e69e4e9@jic23-huawei>
In-Reply-To: <20210715093523.29844-2-hui.liu@mediatek.com>
References: <20210715093523.29844-1-hui.liu@mediatek.com>
 <20210715093523.29844-2-hui.liu@mediatek.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_094216_090315_D9A8A6F8 
X-CRM114-Status: GOOD (  19.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 15 Jul 2021 17:35:23 +0800
Hui Liu <hui.liu@mediatek.com> wrote:

> Add mutex_destroy when probe fail and remove device.
> 
> Signed-off-by: Hui Liu <hui.liu@mediatek.com>
Hi Hui Liu,

We very very rarely bother to call mutex_destroy().  The reason is
that it is only a non noop in when mutex debugging is enabled and
that is only useful if there is a plausible route in which it could
be used after the mutex_destroy.   Given these are both at the ends
of removal paths, I don't think this is useful.  That's why you will
rarely find mutex_destroy() being called.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/mt6577_auxadc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index 79c1dd68b909..d57243037ad6 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -289,6 +289,7 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>  	ret = iio_device_register(indio_dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to register iio device\n");
> +		mutex_destroy(&adc_dev->lock);
>  		goto err_power_off;
>  	}
>  
> @@ -313,6 +314,7 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
>  			      0, MT6577_AUXADC_PDN_EN);
>  
>  	clk_disable_unprepare(adc_dev->adc_clk);
> +	mutex_destroy(&adc_dev->lock);
>  
>  	return 0;
>  }


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
