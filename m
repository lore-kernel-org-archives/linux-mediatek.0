Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0536AC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ovHJT+oKcHWdvmi0CxlPgyNmMFmdo9aZyNXlJHi3zQ=; b=j4iw+4sDuI4BTS2h4iuCF7b4Pf
	bCfZXorLg6wLdLAeUBR7oG6b5ciD0ZqFcDk0w0zQG1lGyaWV6xdgCLj/l/ui4eFr66NDCdbMiWZA/
	insZiFaka8C/8BJFzDSVGQmwJrrpwz+i+V9RvWjjC8Qnhjk1kYp0iJxbZB7tmJXA4c9bNYRWzW1sL
	JNRIxYqYWIugCdrC48pXZ5C7Wc5TY/tJgWWTRvUghRb21/+14jiflx/DmAhyAEuSpTrjNXme4A+kz
	B3A8dgxzTZCUjjZgjAoWz/2P4JA/vUXKMIQfEaQARxPb8pNGDzW/m29dXC48tjds/IWzICortUAVj
	YFp3y8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzckv-00CxUb-0D;
	Thu, 18 May 2023 12:29:17 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzcks-00CxSs-1P;
	Thu, 18 May 2023 12:29:15 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-53404873a19so1309531a12.3;
        Thu, 18 May 2023 05:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684412952; x=1687004952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ovHJT+oKcHWdvmi0CxlPgyNmMFmdo9aZyNXlJHi3zQ=;
        b=jvyFsrkXMIwmBC2OZ/PVh2dkthMG/5310dq1TkKv8oe5nLo9cdsFFtbebSsHxW4suU
         wXTqmVdgHfUs8T9iDIiASg8rU8aUUvQ2XW1m6YAnlCF54YFu3tldCXdjGpcsRRpuDnV/
         gI4ws4CaN1EJTi7WD0ueEgU1QA5eUh/Z31hGMMVKgMCLPktEdWOwnkFjZZ4EDokzVrlg
         wvAw35LV502ziDBD0IcwA6oE1Dfe2YSj8acmQhi2g2MxoaH3sw9m4zMdhrMA+RwD1WD8
         mmin/eeGo8GPShrAEU8ntgphLc7lW4di/syenbCrmdPznmSM2G5pMusP9Lg2mcFiLvfp
         4BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684412952; x=1687004952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ovHJT+oKcHWdvmi0CxlPgyNmMFmdo9aZyNXlJHi3zQ=;
        b=EoM/YoDlUIurLsHbwrBSO7SazKQUQ4WFmfSBK9yonLF1Ydran/tgPxPoySJnnnhI2A
         pgT8u++QhYya3Oehs6W6WGCXTgjE9y3b7rL05WcnqVhOI1VYQhleCrdEdP+u8K/ACqe3
         N1lqhOYdr6TVNTbQaomXeoJZQplpjTOwoYGOsVaLtYyqwrFtWNjC9g16PulIl2KPprEM
         cn33Jse2XCnU6W0xthnTo7TBO6kefrSDIhgz1z2JQ2pDN3HHmmBJojsu8wOxIkAr9H8a
         Sis9nRBGOsObXzCI5OElGJTAeu3pOoX3jy0F7fqFq0I72DDJEi0xMf2M6cNnl6XIkp9W
         CWKw==
X-Gm-Message-State: AC+VfDxRx90fFFYLWmt6CV4HFotcibOcAUEZ6ENPRL9VD0JVhn/o+ZNN
	VFQzHqygKZd2BZ32WpuzMml9ywLfuWc=
X-Google-Smtp-Source: ACHHUZ75+ALZoBfMtEXlLlAxfxBazlz7y6MyID5JB/bb0qqMXCuSWrE1LzMkljdkpj/9+hJQb8CiJg==
X-Received: by 2002:a17:902:ea07:b0:1ac:7d8a:365 with SMTP id s7-20020a170902ea0700b001ac7d8a0365mr2542290plg.26.1684412952263;
        Thu, 18 May 2023 05:29:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b001ac7ab3e97csm1282684pls.260.2023.05.18.05.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 05:29:11 -0700 (PDT)
Date: Thu, 18 May 2023 05:29:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 94/97] usb: typec: tcpci_mt6360: Convert to platform
 remove callback returning void
Message-ID: <2af0cb1b-b4f6-4fc5-809e-eaf07083c523@roeck-us.net>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-95-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-95-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_052914_476933_E6F8B6C3 
X-CRM114-Status: GOOD (  25.54  )
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

On Thu, May 18, 2023 at 01:02:36AM +0200, Uwe Kleine-König wrote:
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
>  drivers/usb/typec/tcpm/tcpci_mt6370.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> index c5bb201a5163..2a079464b398 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -178,12 +178,10 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int mt6370_tcpc_remove(struct platform_device *pdev)
> +static void mt6370_tcpc_remove(struct platform_device *pdev)
>  {
>  	dev_pm_clear_wake_irq(&pdev->dev);
>  	device_init_wakeup(&pdev->dev, false);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id mt6370_tcpc_devid_table[] = {
> @@ -198,7 +196,7 @@ static struct platform_driver mt6370_tcpc_driver = {
>  		.of_match_table = mt6370_tcpc_devid_table,
>  	},
>  	.probe = mt6370_tcpc_probe,
> -	.remove = mt6370_tcpc_remove,
> +	.remove_new = mt6370_tcpc_remove,
>  };
>  module_platform_driver(mt6370_tcpc_driver);
>  
> -- 
> 2.39.2
> 

