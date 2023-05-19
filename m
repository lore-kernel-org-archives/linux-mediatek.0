Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21104C77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 May 2023 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYCgmf/zl2JUy9hr9LbuA1AQ3eiClvVZA7j6UF16zRc=; b=mS3tC5nbApqihw7+rPRpXvzT9L
	d00rVMnvloefi1JdvMiMuiHoSbqHfnSMWjQqedTBqUluk5V0rlK8B+mGOrZs/MKMOcU8nyxmZgh7t
	AG2YDBqeeIycKXYTNOGNb2TaIzIAJAybTnqHWQla8AO/Mqb2uvNatNrKzh9aw2NZyTu1lB3kNoGKR
	COKiuLdDT4ZHEijeeS9wgVAC7yUclwanFtkzhYVi6QN+FeIYz+w75XsqqPQvdO+kcFFMyRfhEYtwA
	zJSlXXMq0oNX0tLSzM04VN6LWJnd5XHRy5ihFAQ3zNm7PI14KZw8quNmPryIwgKyysqAPMp1za8Fn
	ZSaMYSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvIw-00FUpp-2V;
	Fri, 19 May 2023 08:17:38 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzvIt-00FUow-2E;
	Fri, 19 May 2023 08:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684484255; x=1716020255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9fCXL+QfManF/BO6ETnv3SaP6od/vI6ckK+D5YpEYQE=;
  b=Vmq/9nocFfPdxAGfSB0JS61sIXeRnBUZlt1ygF1mDc9P96Qlj6e1OrOC
   iqdOyiEkpTnnp/iXatY4sIYP0TyNVRteq2rltBRMTKlbctl6aSZnOHH6W
   M82+JCwBdWffqnl94HX3to/46WVnX7cLRCLU1nR1amgjgyYBA3K34zByY
   zkyqjveFmKQjh191M0qn9KVKZNQLt7+dglLE3aXDCY1TLhcSCEqy4dR0K
   FruprCUMp8v517XqrS2FIki9AuD6YpEG1RMFMyfj9YVk9KyD+4UC5DyJV
   8nBSYJk6riUkc8nup4hM70b+49duAlqv+bwAgVLu+oUVwAgIS+po9iQa9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341749379"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="341749379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846811912"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="846811912"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 19 May 2023 01:17:31 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 May 2023 11:17:30 +0300
Date: Fri, 19 May 2023 11:17:30 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 94/97] usb: typec: tcpci_mt6360: Convert to platform
 remove callback returning void
Message-ID: <ZGcwmtUIgUSb1hVF@kuha.fi.intel.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-95-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-95-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_011735_813962_E3B5C261 
X-CRM114-Status: GOOD (  28.63  )
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

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

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

-- 
heikki

