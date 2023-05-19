Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B445C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 May 2023 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKdpt1z4oBQRDqlMQrSQOlqHt2YQJOVuTwfFfSfcnnE=; b=5BbsWWlofah+YQHeqAxsBNya/g
	5O0gb5ZRJdfklIodOzpi3bjSG2NiplNHbxlWRr/FJ1MG4trCVLZgBXWIaFR4V1S7NSyGxrgFr0AHQ
	tToaTpYAnTeRNtA3ulKkRuHgFPu7Malx0suP38TSI9qBB3vsrkXZCaiDOOECSOx7r6ZGK6KWxGIwd
	izzjhghpxEg6K2dCQ3mxU7qYJ7A0G0yxuta/gX4S9Zmro0N0aMNHGRJ/SQ5AkHe+jmSVOP4R7dTyh
	fOCmsCeMQXuytJC5I0SHrROHj9SB0WGuFkJF6FZwoUv2AHMtGLKVk5mlm+DBDPS+NYk5bse+MHRfa
	IC9Fl/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvIM-00FUgN-2o;
	Fri, 19 May 2023 08:17:02 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvIJ-00FUfJ-2b;
	Fri, 19 May 2023 08:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684484219; x=1716020219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Nzy5r/yr1kxoILbdgotdhwSHjbJh2d+54NlIbMh5XXk=;
  b=GWupvqfnZuvbdRmlBMwPWCs5TzBNs+8QcTeql7psomSnmr8fsjplQUQn
   EESzBHLXuwymhdW4hGahABuwOEX7jfn6Cofj/Zlal290kJ/vtglZHhuUp
   +E8+EDlCjbvV/3USXOOVSwolIKGfxRMFdDQJyHswVufu9jZtLbGkxr1TZ
   Afp06ecqE+rpOZ2uT9yq2547jVOT5gba5XZP7ga+9a8LxrP5BRXz8yCvL
   uavjjBGjykp7ZcmCUe2Q95RAKcwhsX0eMMAFKH0LYNHHg8dirSXwyi07O
   7qwXVScR9DuXBjBLI2iGp4/YyxHbKiYGJtp4UDrMbqx7em6YHUHRVH8kQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341749272"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="341749272"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846811645"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="846811645"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 19 May 2023 01:16:55 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 May 2023 11:16:54 +0300
Date: Fri, 19 May 2023 11:16:54 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 93/97] usb: typec: tcpci_mt6360: Convert to platform
 remove callback returning void
Message-ID: <ZGcwdrA56NzlSK9K@kuha.fi.intel.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-94-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-94-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_011659_906166_3474C293 
X-CRM114-Status: GOOD (  28.97  )
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

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

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

-- 
heikki

