Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B50CC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 18:08:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3571460295
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 18:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3571460295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IVqs89JnLAwr8dHEpVgnD8uybPc7RCiqpmA5Sd006U=; b=jftUF6fsgP588y
	NMsS8FVMoKt1/XMudqdnXueUROl2EnfMGGffJXXKopNXmOMsKTx/nGITpA5kYJvAFKV/zgmSYQpfD
	MB+btcg3zFbWHrvCMVLahzcS6MKBW7tI0k5B8iNC2SrVHfuOj+/saWcgOQykvxRqWzCOIwQRFQJEQ
	hUKm4ZhzS/n6m/iHvdmMfRljGV0rnvd28ZGb5DZJj+R39lhKzIpaMrdYsjisSUXttjvrMh7ImZFro
	4GfVgIxdeiN/r9S3btG2XMxrO+ZbmP4hBzZzeN3oEb3dOeMD8p1/IVvZ9AEou56W15nQJUb+vvNQU
	dW0kwQpdRTaehRb7wYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEF7w-00ApOh-Cw; Thu, 12 Aug 2021 18:08:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEF7i-00ApJT-8h; Thu, 12 Aug 2021 18:08:12 +0000
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Glvm64WYlz6CBbF;
 Fri, 13 Aug 2021 02:07:18 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Thu, 12 Aug 2021 20:07:58 +0200
Received: from localhost (10.52.121.184) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Thu, 12 Aug
 2021 19:07:56 +0100
Date: Thu, 12 Aug 2021 19:07:25 +0100
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
Subject: Re: [PATCH v1 1/2] iio: mtk-auxadc: add support IIO_CHAN_INFO_RAW case
Message-ID: <20210812190725.00007449@Huawei.com>
In-Reply-To: <20210812054844.30575-2-hui.liu@mediatek.com>
References: <20210812054844.30575-1-hui.liu@mediatek.com>
 <20210812054844.30575-2-hui.liu@mediatek.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.121.184]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_110810_507346_055CAB21 
X-CRM114-Status: GOOD (  17.98  )
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

On Thu, 12 Aug 2021 13:48:43 +0800
Hui Liu <hui.liu@mediatek.com> wrote:

> Add support IIO_CHAN_INFO_RAW case.
Why?

We almost never support both RAW and PROCESSED as userspace should be
fine to use either.  There are a few reasons we've let drivers do
this but I would like know why it matters to you and it definitely
needs to be in the patch description.

> 
> Signed-off-by: Hui Liu <hui.liu@mediatek.com>
> ---
>  drivers/iio/adc/mt6577_auxadc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index 79c1dd68b909..e995d43287b2 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -60,7 +60,8 @@ static const struct mtk_auxadc_compatible mt6765_compat = {
>  		.type = IIO_VOLTAGE,				    \
>  		.indexed = 1,					    \
>  		.channel = (idx),				    \
> -		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED), \
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |	    \
> +				      BIT(IIO_CHAN_INFO_PROCESSED), \
>  }
>  
>  static const struct iio_chan_spec mt6577_auxadc_iio_channels[] = {
> @@ -181,6 +182,19 @@ static int mt6577_auxadc_read_raw(struct iio_dev *indio_dev,
>  	struct mt6577_auxadc_device *adc_dev = iio_priv(indio_dev);
>  
>  	switch (info) {
> +	case IIO_CHAN_INFO_RAW:
> +		*val = mt6577_auxadc_read(indio_dev, chan);
> +		if (*val < 0) {
> +			dev_notice(indio_dev->dev.parent,
> +				"failed to sample data on channel[%d]\n",
> +				chan->channel);
> +			return *val;
> +		}
> +		if (adc_dev->dev_comp->sample_data_cali)
> +			*val = mt_auxadc_get_cali_data(*val, true);
> +
> +		return IIO_VAL_INT;
> +
>  	case IIO_CHAN_INFO_PROCESSED:
>  		*val = mt6577_auxadc_read(indio_dev, chan);
>  		if (*val < 0) {


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
