Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5454C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/QbT98lLaFEOcv7uxacjapivJDRbKOmgwmp5EptZOw=; b=o5vn0Akhu2iE4LhwftjO0Wt7l8
	V122k9VC5FojjYH4yNJiM43YUNV0Qi6qjK+jomJKSiJufNfHpDMLTF6GT1vv8aoWfBb1Vq4Xl3jFv
	oiJOSmTjIOrnHlhBkarlSgZ6ikXcUTdh0WCU923bpWLa6mfDFeWNRDjShTy5wjpmgY2lBbG/pLizq
	34ec7xK4qdWAaxacsKxL0J3wstBOPrnHPrT81EEUhXZl4Md1es95vMafGgsVEbfYT3cXntPcsSr/v
	QdapiAeC4Bv6r6Uwgtk/uahsHvF8qZ731e4CTftXJeEGML9a3RxXiTSuYaiaUPcjRjGFoThhsf8rM
	kG5sRAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUat-0000000GvdA-3a4K;
	Fri, 23 Aug 2024 13:44:47 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUZe-0000000GvM5-28E6;
	Fri, 23 Aug 2024 13:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724420610; x=1755956610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ib4sJFch59+GHVbbNODHxykPpCp6swAnQhqC1AHvoNM=;
  b=RvKoed14wIVS7WWbe2RILh/yRicWZ0WL0A0AW+JtRxsAgrgaGMyF9dl4
   vzwOcfjh1GHgL65wPAffcZDDaZpeUCNol5EOiq0FVE9ISLml8wEtaTrBR
   CcriEG7eMwWEiI7WR8QIUeYmN0XY4PMFMQMLj+HPvFZYn3QcH9mhRtnvz
   aKdtqZ1A5Q7I8OmwUaz25InCGlCDFTtmUbxRhdLSSseujcf6yNlOF5U32
   h2AHepGNGEj5ze+lj/WtaaxyhOGlAymFzbm3FzH2F05QozLXGSoNCraMZ
   Z3dS9f3AveHvYs6Xx/nUadlBZKP+V/Y7o/eFNUmMblU3VfkGXBzMoAGlw
   A==;
X-CSE-ConnectionGUID: jmm7IlkMTWCK9DYl44XVPA==
X-CSE-MsgGUID: bNPMwXlnTmaugudtI8n0fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40352808"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="40352808"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:43:29 -0700
X-CSE-ConnectionGUID: S+vBFfveTkGCT/5A9bwGUw==
X-CSE-MsgGUID: IoLQjP50Q9K73aFOWBIlnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="84980367"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:43:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUZW-00000000oAz-2JFe;
	Fri, 23 Aug 2024 16:43:22 +0300
Date: Fri, 23 Aug 2024 16:43:22 +0300
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
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <ZsiR-kizxnvZufgR@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-3-wenst@chromium.org>
 <ZsdBddTDuvNasHNq@smile.fi.intel.com>
 <CAGXv+5FjwxGQgV6SdLfTeNRYbpcgwkEnCWvaZiWh4rs3bhs-2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FjwxGQgV6SdLfTeNRYbpcgwkEnCWvaZiWh4rs3bhs-2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_064330_615184_5D843F3C 
X-CRM114-Status: GOOD (  22.50  )
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

On Fri, Aug 23, 2024 at 02:49:59PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 9:47 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:19:55PM +0800, Chen-Yu Tsai wrote:

...

> > > +/**
> > > + * of_get_child_regulator - get a child regulator device node
> > > + * based on supply name
> > > + * @parent: Parent device node
> > > + * @prop_name: Combination regulator supply name and "-supply"
> > > + *
> > > + * Traverse all child nodes.
> > > + * Extract the child regulator device node corresponding to the supply name.
> > > + * returns the device node corresponding to the regulator if found, else
> > > + * returns NULL.
> >
> > At the same time you may fix kernel-doc warnings (no "Return" section) in these
> > three (on your wish you may fix others in a separate change, but it's not
> > related to this series).
> 
> As you said some other functions are missing it as well, so I'll do a
> patch separate from this series to fix them all.

But you need to fix them in this patch series. We do not add patches with known
issues, which are really easy to fix beforehand.

(And below seems you indirectly agrees on that)

> > > + */

...

> > > +/** of_regulator_dev_lookup - lookup a regulator device with device tree only
> >
> > Something went wrong with the indentation.
> 
> Will fix, and also add a "Return" section.

Thank you!

> > > + * @dev: Device pointer for regulator supply lookup.
> > > + * @supply: Supply name or regulator ID.
> > > + *
> > > + * If successful, returns a struct regulator_dev that corresponds to the name
> > > + * @supply and with the embedded struct device refcount incremented by one.
> > > + * The refcount must be dropped by calling put_device().
> > > + * On failure one of the following ERR-PTR-encoded values is returned:
> > > + * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could succeed
> > > + * in the future.
> > > + */

-- 
With Best Regards,
Andy Shevchenko



