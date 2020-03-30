Return-Path: <SRS0=Fjxk=5P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC35C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 13:58:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA632073B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 13:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jti9++NA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA632073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i96DTo7iKUsdnVfLIlstv2GH9FlpOBWBpatbyu+YPaw=; b=jti9++NApR2AIm
	xgODfh0ZGt1710spECmDrlyQc/H/b3qha6IgBTRLCtWks2a3Ezh6INkn8gLcobgPikHLh7/Ycjtg2
	hQ4VFf8WotoMkMWHWyRZpYnp4T4Mu4yxsY1SwKxXtlevALs1yI+CMWGLoLlFZtbv3XSOt2op9l7C8
	bdTx37nq2ZMm/tooj/h74Ffcw2D8iBlQeCRNZJ3QqiPddEPauXAo3ESPMY/tC5r3ByHVI0rGZysIm
	s2aL+T/WTrwO82U+pbKvo+m2awpYJDKiOW41UATo5qPUGAmL9Ttu/iR/T3OWmnQPXtwSerlUf+tT3
	19xpBWDahw/dMU1TCqSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIuvT-00074a-Rx; Mon, 30 Mar 2020 13:58:03 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIuvJ-0006vz-Pk; Mon, 30 Mar 2020 13:57:54 +0000
IronPort-SDR: hi8yj3FSE53BE4Uua9s9ELuk/l5Xk3SDF5jAVfT4zCgGVbMex2ipeOlwda6LfEw+B34WXq5WUj
 2qT2ytpSrTvw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 06:57:52 -0700
IronPort-SDR: gpBtDX8eCH7FPm/oTANkhiBgT7C3LcYmTxj4V4fYHVRnHSmLlXU2EfOXWkjBLcFEkqq3cZ3hvj
 sR+HqgJrtWfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; d="scan'208";a="449803069"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2020 06:57:49 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jIuvH-00EDZT-4T; Mon, 30 Mar 2020 16:57:51 +0300
Date: Mon, 30 Mar 2020 16:57:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V4, 2/2] media: i2c: Add DW9768 VCM driver
Message-ID: <20200330135751.GQ1922688@smile.fi.intel.com>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
 <20200330123634.363-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330123634.363-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_065753_848582_598C536A 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 30, 2020 at 08:36:34PM +0800, Dongchun Zhu wrote:
> This patch adds a V4L2 sub-device driver for DW9768 voice coil moter,
> providing control to set the desired focus via I2C serial interface.

...

> +static const struct dev_pm_ops dw9768_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(dw9768_runtime_suspend, dw9768_runtime_resume, NULL)
> +};
> +
> +static struct i2c_driver dw9768_i2c_driver = {
> +	.driver = {
> +		.name = DW9768_NAME,

> +		.pm = IS_ENABLED(CONFIG_PM) ? &dw9768_pm_ops : NULL,

What is this conditional for?

> +		.of_match_table = dw9768_of_table,
> +	},
> +	.probe_new  = dw9768_probe,
> +	.remove = dw9768_remove,
> +};

> +

Extra blank line.

> +module_i2c_driver(dw9768_i2c_driver);

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
