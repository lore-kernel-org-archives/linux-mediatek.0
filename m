Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE87AC74A5B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uctRIe2bZla+yug5rGspur8RVLaFggvVGV73vpRJbTM=; b=u33Ybbo5NO+v7LnfdneLlM18qO
	O1LoL+q60qJa+cAmauEyCHvEbA9F0fsNYtT1411L0LQcm4AzpJjgZbLum9C7B5IBAasFDC5irEIB5
	zNXk2L14hCQL+n//YXQPWK8wHi5bsKTpDjObUbApFHrLCd/zPFbat6voh0uPVP8hHXRDKeAUQNMa2
	6bF87wgnu3g/H5oY4P6DqkY9Z4QdXQ+/uOjqvhnqKC6r1XcNuzGE2H60yiJNxfokDv7Pm8d0rzSF1
	EhNDY1QcFT70DpLigWYqprIH9o0YWwIgrUZfGsceNnVH89jAyuH+f99BGRY521LzuZXiTzvSRbcLh
	M7fZEQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSUX-008jDL-1h;
	Sun, 26 Mar 2023 15:41:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgSUT-008jCW-0r;
	Sun, 26 Mar 2023 15:41:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A29DDB80767;
	Sun, 26 Mar 2023 15:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D533C433D2;
	Sun, 26 Mar 2023 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679845262;
	bh=21uEPRsfEI6Bmn4l2Yo3fQlTwIXz1UGKObvRJC3gEzY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W8UV2+C20/Ija6ZI/S572nlTDADojVrGdQ31d3VqGtzPothV7yLPpcN73LCcBY9/v
	 LBURlPry05C4uENgAOfQjGxzcLpNGk8EksOGlPsJOIRDIsFP/c2j5pbmXTi9WQO2Jm
	 Dr9hMyewDKdIwPmgw1sXDfjQo0mnTL/k7Ek1S951FQHLKAUTH/skK1DHc8hTC4GMpX
	 +jw/2Shj2oVOANbym7tOoUYtFkYMmDRF4UA/mN19HhKdlQ8Zno+Fp1fPZVmIMhLyV7
	 P3KxigVaIZ/uRjRu8+SVaAzGPnEZb6lOdqdFAWFRgXF0U6mpSFK32bj9kqB0Xn8yRu
	 Yu31MHVyBCy6g==
Date: Sun, 26 Mar 2023 16:56:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: ChiaEn Wu <chiaen_wu@richtek.com>
Cc: <lars@metafoo.de>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <peterwu.pub@gmail.com>,
 <cy_huang@richtek.com>
Subject: Re: [PATCH] iio: adc: mt6370: Fix ibus and ibat scaling value of
 some specific vendor ID chips
Message-ID: <20230326165604.27338cc6@jic23-huawei>
In-Reply-To: <1679667167-16261-1-git-send-email-chiaen_wu@richtek.com>
References: <1679667167-16261-1-git-send-email-chiaen_wu@richtek.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_084105_593333_AF61971E 
X-CRM114-Status: GOOD (  21.29  )
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

On Fri, 24 Mar 2023 22:12:47 +0800
ChiaEn Wu <chiaen_wu@richtek.com> wrote:

> The scale value of ibus and ibat on the datasheet is incorrect due to the
> customer report after the experimentation with some specific vendor ID
> chips.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Hi. Only significant issue here is the one the build bot found.
A few other trivial formatting suggestions inline.

Thanks,

Jonathan


>  
>  static int mt6370_adc_read_channel(struct mt6370_adc_data *priv, int chan,
> @@ -98,6 +105,26 @@ static int mt6370_adc_read_channel(struct mt6370_adc_data *priv, int chan,
>  	return ret;
>  }
>  
> +static int mt6370_adc_get_ibus_scale(struct mt6370_adc_data *priv)
> +{
> +	if (priv->vid == MT6370_VID_RT5081  ||
> +	    priv->vid == MT6370_VID_RT5081A ||
> +	    priv->vid == MT6370_VID_MT6370)
> +		return 3350;
> +	else

I'd drop the else.  We are special casing the matches above, so it makes sense
for them to be out of line.  The 'normal' case doesn't need to be indented.

> +		return 3875;
> +}
> +
> +static int mt6370_adc_get_ibat_scale(struct mt6370_adc_data *priv)
> +{
> +	if (priv->vid == MT6370_VID_RT5081  ||
> +	    priv->vid == MT6370_VID_RT5081A ||
> +	    priv->vid == MT6370_VID_MT6370)
> +		return 2680;
> +	else
> +		return 3870;
> +}
> +
>  static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
>  				 int chan, int *val1, int *val2)
>  {
> @@ -123,7 +150,7 @@ static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
>  		case MT6370_AICR_250_mA:
>  		case MT6370_AICR_300_mA:
>  		case MT6370_AICR_350_mA:
> -			*val1 = 3350;
> +			*val1 = mt6370_adc_get_ibus_scale(priv);
>  			break;
>  		default:
>  			*val1 = 5000;
> @@ -150,7 +177,7 @@ static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
>  		case MT6370_ICHG_600_mA:
>  		case MT6370_ICHG_700_mA:
>  		case MT6370_ICHG_800_mA:
> -			*val1 = 2680;
> +			*val1 = mt6370_adc_get_ibat_scale(priv);
>  			break;
>  		default:
>  			*val1 = 5000;
> @@ -251,6 +278,19 @@ static const struct iio_chan_spec mt6370_adc_channels[] = {
>  	MT6370_ADC_CHAN(TEMP_JC, IIO_TEMP, 12, BIT(IIO_CHAN_INFO_OFFSET)),
>  };
>  
> +static int mt6370_get_vendor_info(struct mt6370_adc_data *priv)
> +{
> +	unsigned int dev_info;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &dev_info);
> +	if (ret)
> +		return ret;
> +
> +	priv->vid = FIELD_GET(MT6370_VENID_MASK, dev_info);

Blank line preferred before a simple return like this.  Makes the code a tiny
bit more readable.

> +	return 0;
> +}
> +
>  static int mt6370_adc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -263,6 +303,10 @@ static int mt6370_adc_probe(struct platform_device *pdev)
>  	if (!regmap)
>  		return dev_err_probe(dev, -ENODEV, "Failed to get regmap\n");
>  
> +	ret = mt6370_get_vendor_info(priv);

The build bot spotted this one.  Can't use priv yet as it doesn't exist
for a few more lines.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get vid\n");
> +
>  	indio_dev = devm_iio_device_alloc(dev, sizeof(*priv));
>  	if (!indio_dev)
>  		return -ENOMEM;


