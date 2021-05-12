Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A59C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:45:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2B361D8E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C2B361D8E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qnyjxi+FFBrO33blCZmNbPtSixYwl++fsvsNqL1zVOI=; b=gcZ3/DMdttCp+9x8nRZBMhpI7
	pdbi7M1Geab+dMpyFmH5+KSDHqsyhq244VVy7j84WvkVuRihVqtmAjSmNewTcGyjOz/8SlP7uhrnH
	HmB9Wxc8jv06F9qCZNx5gB74v7bWpQEASQFQd1rWHQrtRMsZk/udBGywSyy8Ad5rJKARK74UWFgoK
	1+zWgQ0s+RujY7bJpACpg94lDaLSNtU3Ce6aHobK5dluVafriyFtDxdtg+Y8ohEJgDTDnKuKAyP2e
	bLeAyCaGVB/x+01I8wE4kKT6iyLqpyGe2EuupEuAllSXBiLX1kIw0dtf5OBial2vJirPCRoT5Dk+i
	+S3ZLX4QQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgr3I-003F3s-1S; Wed, 12 May 2021 15:45:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgr3F-003F3b-W7; Wed, 12 May 2021 15:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=2mpyyEC7XJrsgi3YMcgqzQye6WX/xUo0syDXtLLqF04=; b=PHYqo0ropTy/dLE5BZGs3dzRjH
 v8bMKAcqiRGgi14bcsrC0KjgGpCECP+4vbqnDt6Pj1DNrnOEu83cihpf4KtpA7SZK1O/yPdMSU9hY
 OL5Xa3pC9h1Ru1lb0EISYA82Dx+A6f9lRSgDRsCsIaJwpa/L4ejJLzdUG7qat/YXAYH1vzXaVWxWu
 k4lXNH7aA4DaDF5bfY+48N7XhBXuYWOuQhqfFNCcc3q/gvFyEC06q9K+BoLYlnIkBVdAcGuLvWvHU
 g3GhjbI+AEblA7HTL9fyuU9UqJDHEkin+Ffeglo+PGLQHGmf3LLmIbMIPV64VlKTGRSK+O6HlVYrB
 v8rtuxrQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgr3C-00AXaZ-SY; Wed, 12 May 2021 15:45:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so3287232wmv.1; 
 Wed, 12 May 2021 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2mpyyEC7XJrsgi3YMcgqzQye6WX/xUo0syDXtLLqF04=;
 b=WFdXTTeGbyXygnc4svp/5Z6Yk40JUjx0BGhGZTTdIpzcdVLERcPZdfDiQraL3WyFSz
 WVcHOixfJNFZrHnz2ATXiy6RSFHvmnAG1znR2IcVgWn6UhSc0ohGvdE0LGlp5TK5ZykB
 p6sHfLifLnmwXqZWKOJNYT+dlxdURVlGN9XpdjTTsSZRfcE2e2thjcKuGJLrUZCPAFa3
 TpZIFmUY5z6YpSkwRXETaVrPln0GY9MiLJB6uM+MHmWJ67u/gBpGuiSp2lMvXKWfRBNi
 vyFt2wZAvZtqWSnP7q5qwje5gnKdD5PLNveQoqL92ci2uqPwnX7UJ69ik2I4iG+yP5lW
 xQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2mpyyEC7XJrsgi3YMcgqzQye6WX/xUo0syDXtLLqF04=;
 b=QU37PtbTNXymG9eCn0dcOuWeHzC2cTo+w6hgyiEZYkAwpK4VhpFox2pzq4e1HLI4Tk
 KXUygJr0rWAwzm7i9T0KwZDWyOyQyOIhHPpla/+mK5jJPRGBzR5Lib4sfvlKeK8QrAxb
 f5O6zeLxtGGfOenJ5zN8w+ndnpKz4lDUpqmljDcEomSH20UBB3INBhsr12QYLocpf92I
 5tdyR+FgZI6VhfCSZPySMIb+30my9JEw3LFjA10X6lzPVSckBjcnA9OQ/kZMj3qKha6M
 vcQSRH1ZDM3+RikbFxhGQyJ2ab6n74aHyH8juuSqnc3yIyZqbyl/EGCFsN1CFzJx1fNN
 YzsA==
X-Gm-Message-State: AOAM530nzq6azFRsoWxNCqWelXSlpXbx7T4mbRZefcwZVxzlevLbfWb+
 cFAIeLE7X+NeGtgwu9Tmda0=
X-Google-Smtp-Source: ABdhPJyoX0JIfO4FFBxxeezwHm+TZ3T0E/Xd6lO8PKbV1N17Ydciv5FK3V4Aa254aJ28KFfR+uSWkQ==
X-Received: by 2002:a7b:c252:: with SMTP id b18mr39969380wmj.32.1620834328018; 
 Wed, 12 May 2021 08:45:28 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id l18sm19802wrx.96.2021.05.12.08.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 08:45:27 -0700 (PDT)
Subject: Re: [PATCH v21 1/5] i2c: core: support bus regulator controlling in
 adapter
To: Hsin-Yi Wang <hsinyi@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
 <20210507131406.2224177-2-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2df39bc6-3ab1-69f2-4ac3-952277f53fe5@gmail.com>
Date: Wed, 12 May 2021 17:45:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210507131406.2224177-2-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_084530_977647_744A0317 
X-CRM114-Status: GOOD (  27.74  )
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



On 07/05/2021 15:14, Hsin-Yi Wang wrote:
> From: Bibby Hsieh <bibby.hsieh@mediatek.com>
> 
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
> 
> We can control bulk regulator if it is provided in i2c
> adapter device.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/i2c/i2c-core-base.c | 95 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  2 +
>  2 files changed, 97 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5a97e4a02fa2..23bc7c269184 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -461,12 +461,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>  	struct i2c_client	*client = i2c_verify_client(dev);
> +	struct i2c_adapter	*adap;
>  	struct i2c_driver	*driver;
>  	int status;
>  
>  	if (!client)
>  		return 0;
>  
> +	adap = client->adapter;
>  	client->irq = client->init_irq;
>  
>  	if (!client->irq) {
> @@ -532,6 +534,14 @@ static int i2c_device_probe(struct device *dev)
>  
>  	dev_dbg(dev, "probe\n");
>  
> +	if (adap->bus_regulator) {
> +		status = regulator_enable(adap->bus_regulator);
> +		if (status < 0) {
> +			dev_err(&adap->dev, "Failed to enable bus regulator\n");
> +			goto err_clear_wakeup_irq;
> +		}
> +	}
> +
>  	status = of_clk_set_defaults(dev->of_node, false);
>  	if (status < 0)
>  		goto err_clear_wakeup_irq;
> @@ -589,8 +599,10 @@ static int i2c_device_probe(struct device *dev)
>  static int i2c_device_remove(struct device *dev)
>  {
>  	struct i2c_client	*client = to_i2c_client(dev);
> +	struct i2c_adapter      *adap;
>  	struct i2c_driver	*driver;
>  
> +	adap = client->adapter;
>  	driver = to_i2c_driver(dev->driver);
>  	if (driver->remove) {
>  		int status;
> @@ -605,6 +617,8 @@ static int i2c_device_remove(struct device *dev)
>  	devres_release_group(&client->dev, client->devres_group_id);
>  
>  	dev_pm_domain_detach(&client->dev, true);
> +	if (!pm_runtime_status_suspended(&client->dev) && adap->bus_regulator)
> +		regulator_disable(adap->bus_regulator);
>  
>  	dev_pm_clear_wake_irq(&client->dev);
>  	device_init_wakeup(&client->dev, false);
> @@ -617,6 +631,86 @@ static int i2c_device_remove(struct device *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume_early(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	int err;
> +
> +	if (!client)
> +		return 0;
> +
> +	if (pm_runtime_status_suspended(&client->dev) &&
> +		client->adapter->bus_regulator) {
> +		err = regulator_enable(client->adapter->bus_regulator);
> +		if (err)
> +			return err;
> +	}
> +
> +	return pm_generic_resume_early(&client->dev);
> +}
> +
> +static int i2c_suspend_late(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	int err;
> +
> +	if (!client)
> +		return 0;
> +
> +	err = pm_generic_suspend_late(&client->dev);
> +	if (err)
> +		return err;
> +
> +	if (!pm_runtime_status_suspended(&client->dev) &&
> +		client->adapter->bus_regulator)
> +		return regulator_disable(client->adapter->bus_regulator);
> +
> +	return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int i2c_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	int err;
> +
> +	if (!client)
> +		return 0;
> +
> +	if (client->adapter->bus_regulator) {
> +		err = regulator_enable(client->adapter->bus_regulator);
> +		if (err)
> +			return err;
> +	}
> +
> +	return pm_generic_runtime_resume(&client->dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	int err;
> +
> +	if (!client)
> +		return 0;
> +
> +	err = pm_generic_runtime_suspend(&client->dev);
> +	if (err)
> +		return err;
> +
> +	if (client->adapter->bus_regulator)
> +		return regulator_disable(client->adapter->bus_regulator);
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops i2c_device_pm = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
> +	SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> +};
> +
>  static void i2c_device_shutdown(struct device *dev)
>  {
>  	struct i2c_client *client = i2c_verify_client(dev);
> @@ -674,6 +768,7 @@ struct bus_type i2c_bus_type = {
>  	.probe		= i2c_device_probe,
>  	.remove		= i2c_device_remove,
>  	.shutdown	= i2c_device_shutdown,
> +	.pm		= &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index e8f2ac8c9c3d..953a4eecb88f 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>	/* for struct device */
>  #include <linux/sched.h>	/* for completion */
>  #include <linux/mutex.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/rtmutex.h>
>  #include <linux/irqdomain.h>		/* for Host Notify IRQ */
>  #include <linux/of.h>		/* for struct device_node */
> @@ -729,6 +730,7 @@ struct i2c_adapter {
>  	const struct i2c_adapter_quirks *quirks;
>  
>  	struct irq_domain *host_notify_domain;
> +	struct regulator *bus_regulator;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
