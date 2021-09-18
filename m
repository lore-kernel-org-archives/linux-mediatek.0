Return-Path: <SRS0=6guZ=OI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1546C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Sep 2021 18:17:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F1966112E
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Sep 2021 18:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F1966112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5/d9Nd07rAy1oAN362cN3KUuThCKCYox+GlRQWIyFA=; b=kwwbBxSKdSXQ3Y
	5rQOlThlZVjHnL159FlstREs3p0vqvzELpp4ffhKWPz91NKV/qdML6Zzh53xA4dP95uPPerB5CZBK
	jy+nfZ5LcKQJiavf/NIJ1G0X3JQK/zjVArMrP5ZqrCTCq/tWz57Ee/3BWJnX/wkM9znIl56go0qun
	NUzLVAoSXxSr8u/JIAM4X7jGULDSE98Fc/jN/pOC8i6KCoNCT9H+rcLc/W0VEJ3xlMONjAKhtR30F
	Vpnsk66+uxC+3aDgm1YOsgWfsPpExGhIugB3mlCE5WgawkAYC/5GzrqRKrl6BmyNxGCAlE4A/+PyH
	M5owYfGApsML4LB+q5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mReuB-00GCyQ-2U; Sat, 18 Sep 2021 18:17:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRety-00GCx3-Qb; Sat, 18 Sep 2021 18:17:28 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5C4460EB6;
 Sat, 18 Sep 2021 18:17:20 +0000 (UTC)
Date: Sat, 18 Sep 2021 19:20:59 +0100
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
Subject: Re: [PATCH] iio: mtk-auxadc: update case IIO_CHAN_INFO_PROCESSED
Message-ID: <20210918192059.4c13d157@jic23-huawei>
In-Reply-To: <20210914130901.1716-2-hui.liu@mediatek.com>
References: <20210914130901.1716-1-hui.liu@mediatek.com>
 <20210914130901.1716-2-hui.liu@mediatek.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_111726_939327_11ABA209 
X-CRM114-Status: GOOD (  25.07  )
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

On Tue, 14 Sep 2021 21:09:01 +0800
Hui Liu <hui.liu@mediatek.com> wrote:

> Convert raw data to processed data.
> 
> Fixes: ace4cdfe67be ("iio: adc: mt2701: Add Mediatek auxadc driver for
> mt2701.")
> Signed-off-by: Hui Liu <hui.liu@mediatek.com>

Hi Hui Liu

This fix is obviously correct but I think we can improve it a little.

1) Add a bit more detail to the patch description.  Perhaps change it to something like
Previously the driver did not apply the scaling necessary to take the
voltage range of this ADC into account. 

2) If you change to

	*val = *val * VOLTAGE_FULL_RANGE;
	*val2 = 12;
	return IIO_VAL_FRACTIONAL_LOG2;

then you should get a more precise answer.  (Please check that though!)
This might be an issue if you have consumers drivers though that can not
cope with this particular type.  If so please state that in the patch description
and add a comment to the code to say that so we don't end up 'improving' this
in future without taking those consumers into account.

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
