Return-Path: <SRS0=a7PR=N3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A6BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 11:17:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB7F608FB
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 11:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BB7F608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdJU13aT7ovlFbDUXS0uPzM96B8pejMsunOTGtMh3VY=; b=RXiVSdZGR6gmqU
	yhHcy6v4mm75snVPdGMjODJODGesGYorp3BO4BCqFrmp6kwtEQ/H2JYoKBgUkJG/hRj7+X3MFNGqd
	2zceroEO02UkBPmFJcmF5pF9wEcg8ULk6xzpJEmGFeyF2c7TbMWKeZpl7OKGgyTiisnU7t80c9UKV
	csX5obvYhmJsFAdYCXWMLK0OrTI47+Lc0SHLqcAkpUY0ghXMmOje5rjaXBH9/iYjwdiqmm9/cStlv
	5DXOlp746mqCYCmgdy4mHk8clvawFTf+RNrfXrcqx9jt/0t3++Bkg4FgwhvlWRqj9oTZVraKkeEsb
	8WlWeQf5kYaWhVBzodqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMq9E-00FeKM-Ny; Sun, 05 Sep 2021 11:17:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMq91-00FeIc-Lb; Sun, 05 Sep 2021 11:17:04 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21362608FB;
 Sun,  5 Sep 2021 11:16:54 +0000 (UTC)
Date: Sun, 5 Sep 2021 12:20:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Hui Liu <hui.liu@mediatek.com>
Cc: <robh+dt@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <chun-hung.wu@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <seiya.wang@mediatek.com>, <ben.tseng@mediatek.com>,
 <matthias.bgg@gmail.com>, <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] iio: mtk-auxadc: update case
 IIO_CHAN_INFO_PROCESSED
Message-ID: <20210905122017.645dd9b3@jic23-huawei>
In-Reply-To: <20210831054207.13236-2-hui.liu@mediatek.com>
References: <20210831054207.13236-1-hui.liu@mediatek.com>
 <20210831054207.13236-2-hui.liu@mediatek.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_041703_784356_21C463B9 
X-CRM114-Status: GOOD (  20.55  )
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

On Tue, 31 Aug 2021 13:42:07 +0800
Hui Liu <hui.liu@mediatek.com> wrote:

> Convert raw data to processed data, the processed data is input voltage.
> 
> Signed-off-by: Hui Liu <hui.liu@mediatek.com>

Looks very much to be a fix. Please track down appropriate patch and let
me know what the Fixes: tag should be.  If you reply to this thread
I'll add it plus a not saying it is an ABI change, but a necessary one
as the driver was previously buggy.

Whilst we are here, what is the cali_data() function actually there for?
Seems to only set *val = *val which is rather pointless.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/mt6577_auxadc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index 79c1dd68b909..d4fccd52ef08 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -82,6 +82,10 @@ static const struct iio_chan_spec mt6577_auxadc_iio_channels[] = {
>  	MT6577_AUXADC_CHANNEL(15),
>  };
>  
> +/* For Voltage calculation */
> +#define VOLTAGE_FULL_RANGE  1500	/* VA voltage */
> +#define AUXADC_PRECISE      4096	/* 12 bits */
> +
>  static int mt_auxadc_get_cali_data(int rawdata, bool enable_cali)
>  {
>  	return rawdata;
> @@ -191,6 +195,10 @@ static int mt6577_auxadc_read_raw(struct iio_dev *indio_dev,
>  		}
>  		if (adc_dev->dev_comp->sample_data_cali)
>  			*val = mt_auxadc_get_cali_data(*val, true);
> +
> +		/* Convert adc raw data to voltage: 0 - 1500 mV */
> +		*val = *val * VOLTAGE_FULL_RANGE / AUXADC_PRECISE;
> +
>  		return IIO_VAL_INT;
>  
>  	default:


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
