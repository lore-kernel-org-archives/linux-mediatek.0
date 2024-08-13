Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCE1C52D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ngY2bybcGQBO9kFt0361MJc73RjnRBuFaiRNkHuJtM=; b=eRI4ly2f4OLJ9ckf6azTLt+NQV
	CTERXu6WhAPp0eVV+YNnOoK2EoMnTxl9bRft1DSl1tsTIqUQhTfVeRvjXm0M0K9sKJXvYCjVb9g6k
	AYDXI7jeGrcp+hKb8050XEIP6UvYSuLYf4scV+Nz16nK+/ndXdDKEVAyJMo2IyLHY4UbVK1AbuHnH
	nn7vtOWRxlwP1FqOs+wb4bSTqlyvmfKi/0JeCJ8czL+OzIPziZk6S/W/W9LL5OJK8nJcTtEV4coW4
	rPMsvNRxZ6O+AhNxmkrMbPsTscaSPiV1jQn7giWVyw9PCA5oq+/QN/KLhmzKmRrB7PY/aajaYKdsx
	/Kn5mzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpRp-00000003SwM-22Kj;
	Tue, 13 Aug 2024 11:12:17 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpRC-00000003SlZ-26Pf;
	Tue, 13 Aug 2024 11:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723547498; x=1755083498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9CYbKupifRahOwQ5D4eldN4XFRGyx70KQdl2CNH2QuA=;
  b=ZBzg76gxjyXf9DRtaIbX1d9IRK+YIgUUmKj/vcNYj9wKLdvXqk64l6s4
   T7oD0S3OdaEWtT/TcsZgJ1JJpGbW7Q6Fkh76Vkiuus8tubXqvux3ILKD6
   h8oLdSyiKDUF2DKGCSys0NAFDzNSaYSOjuqVTMf1AhqJezNdti6JVvQ5M
   +7my1PTFoTU0L7Hni5e1oNoiB3YchkFeMiCT5XD2HFPpnqyqB/XRLMg6l
   nLwrbQfKbJF/jYdpn6Aedg708ZJWx39MO53VhoHHo658MVbryxokXmTjg
   Q3WOhstEY3WiLmwPoGnxQeLcxMzstCcfOKXfc5fg+BSbQ8VYVQUHdMyZg
   w==;
X-CSE-ConnectionGUID: Uitn12J+TrWtDjEswViRig==
X-CSE-MsgGUID: ALijcxGyQK2PBjk8cwscEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21571773"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21571773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:11:37 -0700
X-CSE-ConnectionGUID: ov+rmDnlQzOWIO73weRrvg==
X-CSE-MsgGUID: KwVgZ/FVRbe2ddxlyiPVaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="96167459"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:11:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdpR4-0000000Ehfz-1Xvv;
	Tue, 13 Aug 2024 14:11:30 +0300
Date: Tue, 13 Aug 2024 14:11:30 +0300
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
Subject: Re: [PATCH v4 1/6] of: dynamic: Add of_changeset_update_prop_string
Message-ID: <Zrs_YijPxKBFQF0_@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-2-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_041138_572960_E4E0151C 
X-CRM114-Status: GOOD (  14.58  )
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

On Thu, Aug 08, 2024 at 05:59:24PM +0800, Chen-Yu Tsai wrote:
> Add a helper function to add string property updates to an OF changeset.
> This is similar to of_changeset_add_prop_string(), but instead of adding
> the property (and failing if it exists), it will update the property.
> 
> This shall be used later in the DT hardware prober.

...

> +int of_changeset_update_prop_string(struct of_changeset *ocs,
> +				    struct device_node *np,
> +				    const char *prop_name, const char *str)
> +{
> +	struct property prop;
> +
> +	prop.name = (char *)prop_name;
> +	prop.length = strlen(str) + 1;
> +	prop.value = (void *)str;

Is it the existing style in the file? Otherwise I often see style like this

	struct property prop = {
		.name = (char *)prop_name;
		.length = strlen(str) + 1;
		.value = (void *)str;
	};

in the kernel (IRQ domain, platform core, ...).

> +	return of_changeset_update_prop_helper(ocs, np, &prop);
> +}

-- 
With Best Regards,
Andy Shevchenko



