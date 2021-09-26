Return-Path: <SRS0=WJkm=OQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5091DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Sep 2021 11:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0461B61041
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Sep 2021 11:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0461B61041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pA4Xpj+KS/B9O59NjfLyGpWrLFgYw0QRpgZHELKshoM=; b=BqqSxULmpQJUZw
	1fVDXIGUACv0EyrDy+9mFCKuJ1QIL2b3p8Oe/VmJVTRQlE5T7uGSzPbdLSwoAEd4SLK4K95J/wzyp
	m6TmDsvuicTeiKth9u/pCivawKM+hrQisJv+8uWPAMHkGneLRB1wtr7kZaT1nPP3hBThb9CF8qkGz
	ThZ18olVcWWUkhQcTIJTWhOgHGVRKoMR7bCkjsDceropDXwpt20flOEpQnSRTRb/90gH03AfwAD1J
	wbZE5VkFTmhOQrprlXpBS7M4MUILju3Hsf3PAjB95Ed9ZH3+rQ1r+H5SrYb4O6Eg0HN3qJ29IWRjx
	kJnv4U1i7CGGsDGGSjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUSIz-000Rap-JG; Sun, 26 Sep 2021 11:26:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUSIn-000RZr-RE; Sun, 26 Sep 2021 11:26:39 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 101466008E;
 Sun, 26 Sep 2021 11:26:32 +0000 (UTC)
Date: Sun, 26 Sep 2021 12:30:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Hui-Liu Liu <hui.liu@mediatek.com>
Cc: <robh+dt@kernel.org>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <chun-hung.wu@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <seiya.wang@mediatek.com>, <ben.tseng@mediatek.com>,
 <matthias.bgg@gmail.com>, <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 1/1] iio: mtk-auxadc: fix case IIO_CHAN_INFO_PROCESSED
Message-ID: <20210926123022.1b76eaae@jic23-huawei>
In-Reply-To: <20210926073028.11045-2-hui.liu@mediatek.com>
References: <20210926073028.11045-1-hui.liu@mediatek.com>
 <20210926073028.11045-2-hui.liu@mediatek.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_042637_935303_C5439359 
X-CRM114-Status: GOOD (  19.76  )
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

On Sun, 26 Sep 2021 15:30:28 +0800
Hui-Liu Liu <hui.liu@mediatek.com> wrote:

> From: Hui Liu <hui.liu@mediatek.com>
> 
> The previous driver does't apply the necessary scaling to take the
> voltage range into account.
> We change readback value from raw data to input voltage to fix case
> IIO_CHAN_INFO_PROCESSED.
> 
> Fixes: ace4cdfe67be ("iio: adc: mt2701: Add Mediatek auxadc driver for mt2701.")
> Signed-off-by: Hui Liu <hui.liu@mediatek.com>

Hi Hui Liu,

Thanks for the updated description.  Applied to the fixes-togreg branch of iio.git
and marked for stable. 

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
