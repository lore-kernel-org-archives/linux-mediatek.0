Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B270C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvkXA2mPqSaFnAQuHS4A0rmOCQvSNCrXQRwg+sSPOMU=; b=K6M4mZN1i+yJ0O93UfzTzs1rhN
	XRrA8tEjRYZwP98dRTZcoJyXVZyx3MHQBIR4tsCw5P07hoTYZj7kervYShN/AAPuyrqgdwFnwe7v+
	BsO4F8Z/vJmqy+VbrCANC8gsK1dTf9WC1kd0ViZDoDYEiz47WM6vDZc02do2VgbiEBfW8TdjS+J+b
	uQb3rWfkYuatzh2k1mhvpVEZ6l47sOuUjxzTBLX90JfYvdhTRqnMmPqWmnq/8rKGtg868esktgfut
	hBS0btJEe9WnwkBglSvOz5Djwcvqng/tMeSd8V3Jijx8wn4Q9Py4FFCMkDB32qIwq3HwzbAsHW67j
	d8Ca8NhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzckg-00CxQC-0F;
	Thu, 18 May 2023 12:29:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzckb-00CxOI-0S;
	Thu, 18 May 2023 12:28:58 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64354231003so851763b3a.0;
        Thu, 18 May 2023 05:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684412934; x=1687004934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OvkXA2mPqSaFnAQuHS4A0rmOCQvSNCrXQRwg+sSPOMU=;
        b=SurrS0NPOHoNg01wUHihvUXqjL3E+Y0johRZz2xt3EfXVjQTsoJxVDDrrTXmIUKaA+
         mfr9VvpKcJnsEWPPkJGu3HlVp/BqZi43UwMNB/zTm4iWE5uSk+HObEM9nRJT6C3s0J9i
         ETGgbEqViAdCXFQ1XpYCY+wSdtvo67g/mO4iWkbWbXaGCEOcT/dBx1y6h+voMOK2t7nM
         oIBXJADj3PD30ITaY8HWSdAZ//kPlIO4i2WDlAEDmFtjCeFYJ0Ti0DrqEAOG6wl0xLmp
         6nhSJl39BxBxVlEANi8rdql/+KNumyx3oXB8SK0WaTL/FpJF30p6SppKbUd0D0LHQKZS
         HeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684412934; x=1687004934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvkXA2mPqSaFnAQuHS4A0rmOCQvSNCrXQRwg+sSPOMU=;
        b=UXl8/tW87UPE3T6e7hz5BDklhqI6FUg7yGxZStbEE/XZueaFcKtZlN6GgejOFACQN+
         CECG3Tg9QkSMw3U35zY2bJ/mQ22srBUFm4cql53e3M/IBy0e6P20E88pr2JXx40R4eZJ
         Q2dAb4Kj5QX0vJ/puD954rAasN2qTLocnraK8/78v34tTpDeY9B96v8eVyRqdX7OZERW
         TaEkIUg6F9Gjn8ALkiMcurjKT1bkpCaDfUXHt/GQTS78IHh5C7SF6uC241ueELpCTVWk
         tyKw117Dw2SbXbd/fFs7AjU4BRq4Z4/P/HI6I5QdywONqzn1zabrBDf95mi2+oiVtOck
         dzPg==
X-Gm-Message-State: AC+VfDzpz5hrXoJLayDJ5jYUpXhuxOInK4P72Y9Gwcikoq4yIzu38ZIx
	kD2Bupi/fHEfGliS2SUhpFY1i3ewjsI=
X-Google-Smtp-Source: ACHHUZ6O+/H/cPs9HhB9sgWTZ158Wb2S5pgCVPuODTCiXEy3yT2GAzOqNBn2+X2UwvY8r1XsSBywSA==
X-Received: by 2002:a05:6a00:10d4:b0:63b:6279:1039 with SMTP id d20-20020a056a0010d400b0063b62791039mr2913187pfu.0.1684412934342;
        Thu, 18 May 2023 05:28:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s21-20020aa78295000000b0063f0068cf6csm1228153pfm.198.2023.05.18.05.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 05:28:53 -0700 (PDT)
Date: Thu, 18 May 2023 05:28:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 93/97] usb: typec: tcpci_mt6360: Convert to platform
 remove callback returning void
Message-ID: <9d467c12-90d5-43ae-b5da-2a6516ab6767@roeck-us.net>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-94-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-94-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_052857_178552_CD23D466 
X-CRM114-Status: GOOD (  25.79  )
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

On Thu, May 18, 2023 at 01:02:35AM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index 6fa8fd5c8041..02b7fd302265 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -178,13 +178,12 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int mt6360_tcpc_remove(struct platform_device *pdev)
> +static void mt6360_tcpc_remove(struct platform_device *pdev)
>  {
>  	struct mt6360_tcpc_info *mti = platform_get_drvdata(pdev);
>  
>  	disable_irq(mti->irq);
>  	tcpci_unregister_port(mti->tcpci);
> -	return 0;
>  }
>  
>  static int __maybe_unused mt6360_tcpc_suspend(struct device *dev)
> @@ -222,7 +221,7 @@ static struct platform_driver mt6360_tcpc_driver = {
>  		.of_match_table = mt6360_tcpc_of_id,
>  	},
>  	.probe = mt6360_tcpc_probe,
> -	.remove = mt6360_tcpc_remove,
> +	.remove_new = mt6360_tcpc_remove,
>  };
>  module_platform_driver(mt6360_tcpc_driver);
>  
> -- 
> 2.39.2
> 

