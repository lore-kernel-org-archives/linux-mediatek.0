Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2F9C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 15:13:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 002B52223F
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 15:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="moPIWnP2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec+X8YBt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 002B52223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pqmGG+MpSwW45jSKNpzrT29c8XOd8dF5Vu0EI0/esCM=; b=moPIWnP2cwHZ66+VEtSMv3W3o
	KMh/zS9CtG6TOX0smSyY6gO+JPqGntXLoPQBWvWWlaYP06PCouGu4nXKafMwx43ZrX0QrEmtJG1gw
	L0MTXIWMYBeAXBv6A2L8pzR/TsgdzN+PdgBfd+kKY2LgZievRECvDAMq7hK/q7nhDq+Qi6v3a/rog
	8e0jVQLh8AmvVIwq2SRsx9UgxskbObzJSV8gmQ3bmshql0U9xMiyPpp/GQJ1+4sP5MnvevEkY/Nfh
	EvSWPk0z81dFxSVZ3OjqcfhqOGcZTKP6x+QykLVNaZ4wI3h/fXb++O7NpNlA1c5ezkzu8lU5OQBLb
	7TNumzg3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZF31-00024F-3Q; Sun, 01 Nov 2020 15:13:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZF2s-000228-AM; Sun, 01 Nov 2020 15:13:31 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1EBE2223F;
 Sun,  1 Nov 2020 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604243604;
 bh=1WOrV1jjtHcG7addgh8YJpo8rrwOUU24MJKpjdERXRE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ec+X8YBt7oP1F3vLOxylHK9Ei/R7rhJqbRKWffexjKA4K0qzs03KxfUKe4UVaRlef
 mSgIzJDEYz/zpcLh7fDzUl21l8n2OlHH00lNG1VGW/ynJeXu6hIdF18OHEA3AISzv4
 1fcdhrX8RXoLyROvANs1aksll0pv4qc89vhlFImY=
Date: Sun, 1 Nov 2020 15:13:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v3] iio: adc: mediatek: fix unset field
Message-ID: <20201101151318.052a9d19@archlinux>
In-Reply-To: <20201018194644.3366846-1-fparent@baylibre.com>
References: <20201018194644.3366846-1-fparent@baylibre.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_101326_429012_574B3647 
X-CRM114-Status: GOOD (  19.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, chun-hung.wu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 pmeerw@pmeerw.net, matthias.bgg@gmail.com, alexandru.ardelean@analog.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 18 Oct 2020 21:46:44 +0200
Fabien Parent <fparent@baylibre.com> wrote:

> dev_comp field is used in a couple of places but it is never set. This
> results in kernel oops when dereferencing a NULL pointer. Set the
> `dev_comp` field correctly in the probe function.
> 
> Fixes: 6d97024dce23 ("iio: adc: mediatek: mt6577-auxadc, add mt6765 support")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

Jonathan
> ---
> 
> Changelog:
> V2:
> 	* s/of_device_get_match_data/device_get_match_data
> 	* include mod_devicetable.h and property.h instead of of_*.h headers
> V3:
> 	* Remove extra space between Fixes tag and Signed-off-by tag
> 	* Add missing Reviewed-by tag from Matthias Brugger
> 
>  drivers/iio/adc/mt6577_auxadc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index ac415cb089cd..79c1dd68b909 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -9,9 +9,9 @@
>  #include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/iopoll.h>
>  #include <linux/io.h>
>  #include <linux/iio/iio.h>
> @@ -276,6 +276,8 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>  		goto err_disable_clk;
>  	}
>  
> +	adc_dev->dev_comp = device_get_match_data(&pdev->dev);
> +
>  	mutex_init(&adc_dev->lock);
>  
>  	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
