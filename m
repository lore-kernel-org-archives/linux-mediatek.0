Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4F5C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 13:45:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0362360F5E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 13:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0362360F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SELwYppp28tZHaWKiKeZfJNJJN4zKrOYG1VBuh+yEkk=; b=n5f7rfXBOaIoW5
	u/B3AO4637i7uduYlp6YBcYgrg3kxlzuQ0/KTWP50k1pBSRdvZ0kWnQ5H+QgvxHe1Dpqqsd4e6sh/
	nsBAWzV2ufRDy2jrGTv2Vd6rtVZ+nTx8Dd1PtbHLRfGtcCUA627Q2M4Npv5Non+3fN9DLx5WaYde0
	e18uOioKhOSGqyI04/M19jlaXJTFBFNWmtXGwY0HHg6hZVOjjc0JanFV25PFDlyDjpvh9yhsKMDdW
	2JjRDT439LYuSHo46nN1Z02kRLrXdcqmzsbY459Nc2KwedDOd8Lymz4RQ2yaUG2WE8RmC7XWXXcVb
	3LG2XHvBkD3BgjuFlZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9SpK-008p0D-8t; Fri, 30 Jul 2021 13:45:26 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Sp7-008oyD-NY; Fri, 30 Jul 2021 13:45:15 +0000
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GbpLq3j0vz6G9mJ;
 Fri, 30 Jul 2021 21:35:47 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 30 Jul 2021 15:45:06 +0200
Received: from localhost (10.47.1.48) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Jul
 2021 14:45:06 +0100
Date: Fri, 30 Jul 2021 14:44:39 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Hui Liu <hui.liu@mediatek.com>
CC: <robh+dt@kernel.org>, <jic23@kernel.org>, <lars@metafoo.de>,
 <pmeerw@pmeerw.net>, <srv_heupstream@mediatek.com>,
 <zhiyong.tao@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <seiya.wang@mediatek.com>,
 <matthias.bgg@gmail.com>, <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1] iio: mtk-auxadc: add mutex_destroy
Message-ID: <20210730144439.00005e26@Huawei.com>
In-Reply-To: <20210729080135.17436-2-hui.liu@mediatek.com>
References: <20210729080135.17436-1-hui.liu@mediatek.com>
 <20210729080135.17436-2-hui.liu@mediatek.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.47.1.48]
X-ClientProxiedBy: lhreml753-chm.china.huawei.com (10.201.108.203) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_064513_975372_5D8DF07D 
X-CRM114-Status: GOOD (  18.48  )
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

On Thu, 29 Jul 2021 16:01:35 +0800
Hui Liu <hui.liu@mediatek.com> wrote:

> Add mutex_destroy when probe fail and remove device.
> 
> Signed-off-by: Hui Liu <hui.liu@mediatek.com>

Hi Hui Liu,

Two things here.

1) You need to explain with a clear example flow when this would serve a
   useful purpose.  As I explained before, we do no in general put mutex_destroy()
   in remove paths as it is usually just noise.

2) It's in the wrong order logically. mutex init is between the clk_prepare_enable
   and iio_device_register, hence if we are going to have mutex destroy it must also
   be in that that location (remove should be reverse of probe or there should be
   a clear comment explaining why we need to do things in a different order.

3) If touching this code at all, please move all of the probe / remove to devm_
   managed code so that we don't need to get this ordering right at all because
   it will be done automatically.

So I won't apply this without 1 and even if I accepted the principle, it's
still in the wrong place in remove.

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
