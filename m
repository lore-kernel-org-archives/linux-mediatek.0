Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAA3CD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38L22690z5fHiXIh40+Mckw2G05fl9KZgILyvKKXC2I=; b=rsxsdDQKODdJFscmYbjP+5dW9+
	yZO+lVoTG2U9K2AbNL9dqzSLpehvQ+EoWJTsJI59igf/T0/brQCLdJBV5x0wFD2vHsU38pCfi8lBe
	Fk2y4tJ3BRKDWdlCcCRr6SPAEeICYpaR6zZDBDMW9lMW31/vWHnSCe3usNqLHsx8Sx2/y9mKgfxGQ
	gxaq00xYF4SESGzfjyzKnaMOm2ZVOTnXEmtfn0fl1vNG9kspZSLFkWlue7hcooEk/Xf/f405ldAq8
	8QHRwVIGd5UYaa9AwWtAJcl7YFRIqYnIZ9H7Ka3UQsVFesy3SrjgUPlA1vZZfHQqILbJ2wkY4de4A
	yIYFimzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slprb-00000004Vlw-3gJs;
	Wed, 04 Sep 2024 13:15:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slpqe-00000004VcA-2uWS;
	Wed, 04 Sep 2024 13:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=38L22690z5fHiXIh40+Mckw2G05fl9KZgILyvKKXC2I=; b=ioY3POu4aXVdDvXOvybLtGP/he
	8mm+W7GaFslm+NlV0FInEdcmBpygvSRsrAVmBCAbgXUWresp3X0bh3jOyCsGS+/676VnOKf2FI9wF
	tFZmhb0Xfq1dT/U/X6GBqJoqHeCKDBbGY58ZoMzvh+QLYvq4LBUnZ32Hz11IyAE0Ub6a129lRspaX
	7v4xTTJjZuHcP9RlastXVrPRHyYlMDXX5GW8ZoPY61Zh8Vk+LOPoi6d+QdcXDVt4Eu/44L6/E3Idc
	kd3JyIeQaYLMkRz3Qatf3khLg09FRJPzhfpqCru/Rc5xvhwScLDfgkl9nwo6eWuMX3mussIdXRQIT
	eWGrvXCw==;
Received: from mgamail.intel.com ([198.175.65.14])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1slppy-00000000E5U-3ze9;
	Wed, 04 Sep 2024 13:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455659; x=1756991659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zHIc1Xe49cAdQbrSE9iC8kis8SkfxhbbHfvV3kPeSfA=;
  b=RkI8QdV9WnArEWp+6bglOSMuSfTMjSOlVNQtI2E3/xdJ3LMzcH+RTyN7
   oYfHParVLdfVrybFoFBFy7GqFnvIESEPH2QeTlAjJvD6FNaQp7Faf9wqZ
   POUcrLOe0NcFx0PpAmj70FDSfXyiEXIG5sejKlB+s00Y+yHXEDZt3wKOY
   askju/s9HDCZmkNGER0sJa5StcXf5q3CIHjBZVfy8m1Qsugx+gzCFZ8md
   ahoCN4LErIfyYHqymyg9/FRrjtlWNTN9zNnw9AcnyxUd2OiqV1ingf6Tt
   AN9rik8hHizwxlkvkIOSE09V6wAoCwk4LiKoUseQVAMQPJyJqsP258vjW
   w==;
X-CSE-ConnectionGUID: G18Ck+w0T6qX4YDnDwxi4A==
X-CSE-MsgGUID: UL3+XSaLTcy9LOhAl7cnyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27904064"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="27904064"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:13:31 -0700
X-CSE-ConnectionGUID: nqlk14NrR3qCkWhyjarSeQ==
X-CSE-MsgGUID: EbYFOQjIR46uSDvJ0f9PEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="69894307"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:13:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slpp5-000000054Ne-0cgl;
	Wed, 04 Sep 2024 16:13:23 +0300
Date: Wed, 4 Sep 2024 16:13:22 +0300
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
Subject: Re: [PATCH v6 05/12] regulator: Do pure DT regulator lookup in
 of_regulator_bulk_get_all()
Message-ID: <Zthc8r62z2eaR8k0@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-6-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_141424_205400_FBF128D5 
X-CRM114-Status: GOOD (  18.74  )
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

On Wed, Sep 04, 2024 at 05:00:07PM +0800, Chen-Yu Tsai wrote:
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
> 
> Also convert an existing usage of "dev && dev->of_node" to
> "dev_of_node(dev)".

> [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Make it Link tag.

  Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/ [1]
  Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

-- 
With Best Regards,
Andy Shevchenko



