Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C736CC52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjBEcD1hgVkUSAeHMvruXX/ya2vI8vZfUW0TZclvBhg=; b=nTkiiIUigeuqSvUW09WQhrhvv7
	D0JJ+OwQPX0dtnCsvUQxxNOOnZJPvzOZ94+ieElM7F4D9XlahrQok5zi/4D9dGcIJOiVwjbQtyVLX
	P/0dAx/dlO6hNxairyl+LFFvd3luPMMdiHtwqBAuORDNwJSrJ/tlybmGOUVUv3KiEH9VBrF7HgjkG
	M1cDHaN4haCyx815OevLGnYs//vB4eaHHITkUR7+Rhux7Q3WgsVlkv/9HhRELttkFIFboQt4NP/Xq
	WcDTXSnkGAxuXSK1hW/w/YiQGT9vqdtuDyuZS6dn+1eQz8/OV/fOYW848fLaGa8keNE4y8oXIbHoU
	f35wVRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8L0-0000000D4Kr-1LH8;
	Thu, 22 Aug 2024 13:58:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8Gm-0000000D2zB-3esi;
	Thu, 22 Aug 2024 13:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RjBEcD1hgVkUSAeHMvruXX/ya2vI8vZfUW0TZclvBhg=; b=izjQ2QjJVcTXEGUQNcQMVk0GEB
	A25PuF3rs2zhEqXlb+vnaHIwqkTv//kf82jPIbpiTNVD5vHpsCtKioKpw1gYyfV225OY9woZT8Wyb
	17yxka8RVbYcuiWWEaIVzpfqDtKFNCHU17GYINaUOxfqcK2A+TrQA29+bWsVLVnttRC8/ZJy05Rn8
	sunffMRBzo1MPb7N8DBwpB8GzUgMTa1xWaaqPjHUgGien2Ca3mDjgGTo1DtqMZX6yEp4YN6pttNFr
	ezmC0z7KmCk6oH9JJsqH3LsnJLP6zWyCUfNNZHFMixt44lqJp5Uc7McW9tYnDHjsOt62AjXsTGXzu
	42HJtpRQ==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8Gi-00000009wxT-3UF7;
	Thu, 22 Aug 2024 13:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724334869; x=1755870869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9YUyCrtIOi7mWuFM6fXfJzgv/Fnrb9gWjYwYg0/W3NI=;
  b=DgwE4MC/zUjnT8fPYNHcXP3fKZRmFtO7ZIp1XtS5rRvDNhKNCTrhew08
   IusZ02zowXsfc16VPPTzuOVyi+lgxb5N3ui8RHYYbQBdzs2/P/nD/fXnj
   eYQp/RbGLEoTrnqYJ81raeMA2El/uQezyP8PAWPAJCkcWU1rctoS9OPAu
   PPObJ1HBQRyEsYNLi2z6KC1O+E6htV3x1GG14LMiEYU9OCwsZbYGo21p/
   czku+LI/rhD7bpMa9Fgv/imkoi1lkh8vTuXW2Jc+wv2IM54Oj8v3eE6VY
   NDriIBxFDgVCFYNbCpX5YGwNj7BEXcV+4U3p1CPJsr+B7mGJyH+YvGA9f
   A==;
X-CSE-ConnectionGUID: wO1H0+GxRB2MU8i9uxQ8qw==
X-CSE-MsgGUID: oO1QkjOSSRKINVGDzkJWfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22561867"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22561867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:54:21 -0700
X-CSE-ConnectionGUID: cAc/ohFRQYyDttAPJPxQxA==
X-CSE-MsgGUID: CKDH6XyBQuSuoE3L1FfDGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66273292"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:54:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8GP-00000000TFF-2VSn;
	Thu, 22 Aug 2024 16:54:09 +0300
Date: Thu, 22 Aug 2024 16:53:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 04/10] regulator: Do pure DT regulator lookup in
 of_regulator_bulk_get_all()
Message-ID: <ZsdC8wkgsdsMJuAL@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-5-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-5-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_145429_550964_048CF352 
X-CRM114-Status: GOOD (  26.86  )
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

On Thu, Aug 22, 2024 at 05:19:57PM +0800, Chen-Yu Tsai wrote:
> The to-be-introduced I2C component prober needs to enable regulator
> supplies (and toggle GPIO pins) for the various components it intends
> to probe. To support this, a new "pure DT lookup" method for getting
> regulator supplies is needed, since the device normally requesting
> the supply won't get created until after the component is probed to
> be available.
> 
> Convert the existing of_regulator_bulk_get_all() for this purpose.
> This function has no in-tree users, as the original patch [1] that
> used it was never landed. This patch changes the function ABI, but
> it is straightforward to convert users.
> 
> The underlying code that supports the existing regulator_get*()
> functions has been reworked in previous patches to support this
> specific case. An internal OF-specific version of regulator_get(),
> of_regulator_get_optional(), is added for this.

> [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/

Make it Link tag

Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/ [1]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

...

>  	/* first do a dt based lookup */
>  	if (dev && dev->of_node) {

	if (dev_of_node())


> -		r = of_regulator_dev_lookup(dev, supply);
> +		r = of_regulator_dev_lookup(dev, dev->of_node, supply);

	dev_of_node()

>  		if (!IS_ERR(r))
>  			return r;
>  		if (PTR_ERR(r) == -EPROBE_DEFER)

...

>  /**
>   * of_get_regulator - get a regulator device node based on supply name
> - * @dev: Device pointer for the consumer (of regulator) device
> + * @dev: Device pointer for dev_printk messages

dev_printk()

> + * @node: Device node pointer for supply property lookup
>   * @supply: regulator supply name
>   *
>   * Extract the regulator device node corresponding to the supply name.
>   * returns the device node corresponding to the regulator if found, else
>   * returns NULL.
>   */

...

>  /** of_regulator_dev_lookup - lookup a regulator device with device tree only
> - * @dev: Device pointer for regulator supply lookup.
> + * @dev: Device pointer for dev_printk messages.

Ditto.

> + * @node: Device node pointer for regulator supply lookup.
>   * @supply: Supply name or regulator ID.
>   *
>   * If successful, returns a struct regulator_dev that corresponds to the name
> @@ -636,13 +639,13 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
>   * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could succeed
>   * in the future.
>   */

...

> +/**
> + * of_regulator_get_optional - get optional regulator via device tree lookup
> + * @dev: device used for dev_printk messages

Ditto.

> + * @node: device node for regulator "consumer"
> + * @id: Supply name
> + *
> + * Returns a struct regulator corresponding to the regulator producer,
> + * or IS_ERR() condition containing errno.
> + *
> + * This is intended for use by consumers that want to get a regulator
> + * supply directly from a device node, and can and want to deal with
> + * absence of such supplies. This will _not_ consider supply aliases.
> + * See regulator_dev_lookup().

Fix kernel-doc warning.

> + */

-- 
With Best Regards,
Andy Shevchenko



