Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDD7EB64DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLUg/vilPItNeSWWIKHfVqqGX6dfEJWBbAJWIfT2Rmk=; b=CXM/5Fx79MkhpXnZZFilD5IkQl
	AcbL+LidKUQ8Cqxo4HSSTbpQq0Ags6+BTDkVxLVR97TBv6hce0XPrXFqgqRMSISWz5ihbKI9JxF9C
	5Zhf8VoEQbd3zAc7+g9gesqNXpB4TgYIJRr3sqW/6tsJlFGlymw1+5bJ67mfpeR/2/Vbz4i4cOW+v
	5LyydXr1zfn1FyvekjGq4LK+HDde917EGmSNi2mtJxPVoPkv2djE70a/+h+yN18fB0+wpO0Gm/E/S
	qNkTVRA4upFkVBNwVyqlIIRFQRQ+rircFPKotF05Hz5X7K/hNfudwWq/WuYRw/pvCihIPK0ojGHvJ
	uXxWu5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIr4f-00BmHN-1R;
	Mon, 10 Jul 2023 13:37:09 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIr4c-00BmG5-19;
	Mon, 10 Jul 2023 13:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688996226; x=1720532226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HA2So+NjBTWAY2fjVnTJJii4ARFTRIerq07ZS5EB7BI=;
  b=N6JM1YG6Fgh9vpVMKWk6DsrHMReXy3dPIukx5Rky5mb+z3aeyjitIZrp
   dWZ4cTyDQM4R1MVqv8GlXsX4tfiFVvwHh84ZvJugrwjonGTcRp4jmz9PN
   rYc/clu5nSxcvUNic4CDgPG0DR9hrAMjYYnpPMjAyRgLYX/A9CBi17w7w
   t+YaeieHkgMQsCZUD2CLMvxRPPO+NZk+lGFQElppGA6vz6ppGXpDtAOm6
   5TNcN4Sdee9u4XzRBnFl/bLGiNeI+5szPwHLWhdym3NV8kLO9O25AHvK3
   Ik1GgyTEtlJBAO5/QbrMp2TwQ91cFMfgfJSDjrBC7uqhsf8RpHDe2kIN/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450701149"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="450701149"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 06:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="894774244"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="894774244"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 10 Jul 2023 06:36:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qIr4P-001ZC8-1X;
	Mon, 10 Jul 2023 16:36:53 +0300
Date: Mon, 10 Jul 2023 16:36:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedts.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Cc: Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v1 0/8] spi: Header and core clean up and refactoring
Message-ID: <ZKwJdb0rJCmH5cBA@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_063706_405422_617B5B25 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 10, 2023 at 01:27:43PM +0300, Andy Shevchenko wrote:
> Various cleanups and refactorings of the SPI header and core parts
> united in a single series.
> 
> Patches 1 & 2, 5 & 6 & 8 are dependent inside each group.
> 
> No functional change intended.

I will resend the entire series.

-- 
With Best Regards,
Andy Shevchenko



