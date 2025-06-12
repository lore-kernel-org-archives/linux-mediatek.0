Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91732C61CE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bD8PDRIgZsjcIS9lKDcZdxD8mZFpquswL/wkRzyKbz4=; b=KQgtByhPiewEhpEL1axLHDRbRP
	e2tz+6+VSWdUxC3wuG+jf4nqNaOFt3+7KmUINjRXmb13T55rS/k+uWQ7rATbaP/29OH7339NPiyPn
	VF9YKe/PTySAVkaJMf6aQoGGu3tBlA+CVClwoqGT/wBO56Z4Ru+A1ZFMRDrDWrKMtEAeQcWN7JH6U
	kplqhaosKI1xw9nBvsk7g2O+Nb9U1RXb0PpViKobMBzGsnMHW+mpj2VkIhHRvXUpfRdJ/BeUN9zh8
	jkSzw2B227J44AD4paHJ3xf97wDMWhSS0uNmLu03bh6WypLAT59itkq/tzQ21HV8r1YnPA81gDtpN
	YyXNN5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhtr-0000000DRJ0-1uZT;
	Thu, 12 Jun 2025 13:23:23 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhOv-0000000DJ14-2yQS;
	Thu, 12 Jun 2025 12:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749732685; x=1781268685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bql/TNuo24JhgENmtOEIa3XVAhbnXtyYW3C4rsZ9KFs=;
  b=SbW4ldG7t6vYkDvdyKYmzgm+j6O4i6JoS4+20uzDzF1Q8zADcziGHeq6
   HTWC0eC6veOSOc9NoYB/oVGqlzAPl/kojuaQOUCsV5xq9yM4aMkPCoWXM
   Ha6V0GVLAeax86OaH0/oeWV6sp204g2CUKWgIDjFiWU3FltuleUDtAB+0
   lquKQL1oBf07LduOYgEoVrcd4D1YKGL50OYuPjpivFGTedq/MsWQN1CHU
   lGXdWRBJAfVZ59orN8rabHxeFcn7sUX4ltSpGSDA9HnKpNu1VcEEkqNo+
   JHsGSjweYU3P6TQJch7IuWWRVn+HqZmhv5owL0A2AHY/7FDOLR3NFTVCp
   g==;
X-CSE-ConnectionGUID: fDU+g/XeSPKtRD/N1F6wng==
X-CSE-MsgGUID: J8RwB4uiTWae9SDHBY2Oxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69478293"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="69478293"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:51:20 -0700
X-CSE-ConnectionGUID: mofzayPbSfemxo/78nvEhA==
X-CSE-MsgGUID: 65CP34ARQ+yNMlLSnRyUqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152795140"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:51:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPhOg-00000005x89-01m7;
	Thu, 12 Jun 2025 15:51:10 +0300
Date: Thu, 12 Jun 2025 15:51:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	Tomasz Duszynski <tomasz.duszynski@octakon.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Mudit Sharma <muditsharma.info@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Andreas Klinger <ak@it-klinger.de>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/28] iio: zero init stack with { } instead of memset()
Message-ID: <aErNPaZzvgAps_-b@smile.fi.intel.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_055125_757877_E7B0499C 
X-CRM114-Status: GOOD (  12.40  )
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

On Wed, Jun 11, 2025 at 05:38:52PM -0500, David Lechner wrote:
> Jonathan mentioned recently that he would like to get away from using
> memset() to zero-initialize stack memory in the IIO subsystem. And we
> have it on good authority that initializing a struct or array with = { }
> is the preferred way to do this in the kernel [1]. So here is a series
> to take care of that.

I believe we may do that independently of the compilers that can leave garbage
in the padding. In case it happens, it will be good adventure to fix the bugs
in the code, that for some reason take padding(s) into account for the real
values.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



