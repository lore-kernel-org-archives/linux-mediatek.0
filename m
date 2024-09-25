Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0BFC369C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYoFa/T7uCa2kYYpkiIDLbmeUTNAteKbhE2v5yCdiLI=; b=HUknMWox/OON3mY8eWaIwgg0rx
	0nUkh2csvxRkVXHrdjyMxWC/A8zlN0xWK/sEL5CvkVb7lIkEeSQEPXoYkpMLcGTRzocvmNI5noiS0
	2PDb9zT3c7XLQDG7Rp050/Jw082figPvPDNunwVCGkmyPvgLpqBxID6BU+VABygnTcA1IVq1sMOHG
	dRYZiQ0YdIsjD8ozVsSOvmfbfEHyZfmsZdggDGvlBle8UJ6X/XuIBbxv7+hCDmrDGVII74GTRygqQ
	DmqwycFs0uDPG5eTxJQT+BIgMqOFBDs14jOkTY/aECy+v/thnnQQoG2uj04NVK83Q2KjnAaONg05N
	+He048Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPil-00000004nuU-0u4F;
	Wed, 25 Sep 2024 10:58:11 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPha-00000004ni1-0zL4;
	Wed, 25 Sep 2024 10:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727261818; x=1758797818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S48zw2Thvj9X/sYDLC/eM5MCODm3HulyKneN0EYbB5w=;
  b=L9AMSzktJRf8XRGcG4s7nCbFRVX23BiSDB4HyGYr5iRhP7TZD68xCc8l
   QTAYekBpFxXe8Rj1GSRk0/zaSKtzNOppxDPOLr0Fm7Tj+dPll9plYgIMX
   2myQTT/QidO/R+dAOsThbjF1FO2/U8qvMOFv+1XygaGPtU+iVfCn0ZY9a
   nBH6sTg6Tj1+j0WKc+Cyym5p2iiSe7b2STIRB57Cnqb5DspVTZR/cFwiU
   pIhToVy4vKr3UZTpH6SYx7VQkMq7iZSA+AM4SphAuqoWPZWPU0r8Et3nW
   RUz9eyuj9HA/luFIf/Pfkyqb8DZN8hVsZYeMsRMHzT7fa1pq4rCGqOt0w
   g==;
X-CSE-ConnectionGUID: YGXpm+7ZQhy2l4pE8hxCTg==
X-CSE-MsgGUID: C5o+Uyq4TCeRHu90RtioNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36966628"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="36966628"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 03:56:56 -0700
X-CSE-ConnectionGUID: kgu1xSJ6TYKBTwpGW5WPQg==
X-CSE-MsgGUID: tZk4416rRMmvd+xhYjxAmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="76237879"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 03:56:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1stPhR-0000000CmpQ-3nEN;
	Wed, 25 Sep 2024 13:56:49 +0300
Date: Wed, 25 Sep 2024 13:56:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v8 2/3] regulator: Add devres version of
 of_regulator_get_optional()
Message-ID: <ZvPscRdWlFPmtCyR@smile.fi.intel.com>
References: <20240925093807.1026949-1-wenst@chromium.org>
 <20240925093807.1026949-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925093807.1026949-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_035658_307703_8076697D 
X-CRM114-Status: GOOD (  20.81  )
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

On Wed, Sep 25, 2024 at 05:38:05PM +0800, Chen-Yu Tsai wrote:
> There are existing uses for a devres version of of_regulator_get_optional()
> in power domain drivers. On MediaTek platforms, power domains may have
> regulator supplies tied to them. The driver currently tries to use
> devm_regulator_get() to not have to manage the lifecycle, but ends up
> doing it in a very hacky way by replacing the device node of the power
> domain controller device to the device node of the power domain that is
> currently being registered, getting the supply, and reverting the device
> node.
> 
> Provide a better API so that the hack can be replaced.

...

> +#if IS_ENABLED(CONFIG_OF)

Do we really need this?

> +static struct regulator *_devm_of_regulator_get(struct device *dev, struct device_node *node,
> +						const char *id, int get_type)
> +{
> +	struct regulator **ptr, *regulator;
> +
> +	ptr = devres_alloc(devm_regulator_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	regulator = _of_regulator_get(dev, node, id, get_type);
> +	if (!IS_ERR(regulator)) {
> +		*ptr = regulator;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return regulator;

Why not using devm_add_action() / devm_add_action_or_reset()
(whichever suits better here)?

> +}

> +#endif

...

> +static inline struct regulator *__must_check devm_of_regulator_get_optional(struct device *dev,
> +									    struct device_node *node,
> +									    const char *id)

I don't know the conventions here, but I find better to have it as

static inline __must_check struct regulator *
devm_of_regulator_get_optional(struct device *dev, struct device_node *node, const char *id)

Similar to other stubs and declarations.

-- 
With Best Regards,
Andy Shevchenko



