Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC58C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 11:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiBoTNDwyVYnp/k8YvHLkWovLgqLCCLY+5EADxfgnR4=; b=Tp0ERZKI41rdg6HPQj6w3dwDw2
	Ddq47aGNyLzIgIJ8n1W0FOmR+pjdkhA3xAebdEGaOz1DUZLiJ9B2ZvDlOWm5K4i2/2/J8DokauMjH
	EWwVcpitW/2DHq+P/ohWs6dIpoVaxMyBsb7utj4UyqK0jaBxj3UTYQIF4X/acH+qBH4sYE2XbpEA0
	fUKNFiKHkg29WuzbIzNGrqAwmkfIvXBoU5Fae+FYYUf8vgwwCZ2A5ajt0x7gWL1nD/TxQQhU6oDKE
	rOu0dVwdhFP17hV++AnzBEzMZtLvDE1Qmqmug4J9YbH8aBppTqnThfpUrN1zumxHydpXD8W7nsioJ
	3ijkiIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69CB-005sI4-EQ; Tue, 28 Jun 2022 11:15:51 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69C5-005sCm-Fa; Tue, 28 Jun 2022 11:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656414945; x=1687950945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VAm8GqMxSVbXa5l11MJLdH5RISvLfde2v1QEXHVyiio=;
  b=HRBsKKPDtpbtyLVdjR9THOK1h86J8RZxN7df8fXQhvGxGxEJsF2w0rWr
   B9xN/EBai9qTk3bCJsIa9Eeit/DSFFLigVPMIb0dMaOkYHsMM1bj3L5Dt
   U35LWXssooBcqjpmKvOMfi5AMYF4nh269Z7x6Z41PTk/lwUffCZQZEzXn
   W+X4Ap7gSkVfLnb0KHmuKUTXEpSZ2Rm9P429/eAMO/VqLZPadGoNf4H+t
   S8hd/remurn7Tm3x5lk3EWDjc0BOk1g/hWHtFxPDJJj1fB+O9e/lZfIFS
   fxY6+UE3pXxJqbcTDKr3NgNwF383Es15TXBAIsztti3y6GpQhMLHVpea6
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="343402312"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="343402312"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 04:15:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="540456672"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 04:15:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1o69BV-000wl7-8C;
	Tue, 28 Jun 2022 14:15:09 +0300
Date: Tue, 28 Jun 2022 14:15:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Al Cooper <alcooperx@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Tobias Klauser <tklauser@distanz.ch>,
	Russell King <linux@armlinux.org.uk>,
	Vineet Gupta <vgupta@kernel.org>,
	Richard Genoud <richard.genoud@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Alexander Shiyan <shc_work@mail.ru>,
	Baruch Siach <baruch@tkos.co.il>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Pali Rohar <pali@kernel.org>, Andreas Farber <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"David S. Miller" <davem@davemloft.net>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Peter Korsgaard <jacmet@sunsite.dk>, Timur Tabi <timur@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Rob Herring <robh@kernel.org>, sascha hauer <sha@pengutronix.de>,
	peng fan <peng.fan@nxp.com>, kevin hilman <khilman@kernel.org>,
	ulf hansson <ulf.hansson@linaro.org>,
	len brown <len.brown@intel.com>, pavel machek <pavel@ucw.cz>,
	joerg roedel <joro@8bytes.org>, will deacon <will@kernel.org>,
	andrew lunn <andrew@lunn.ch>,
	heiner kallweit <hkallweit1@gmail.com>,
	eric dumazet <edumazet@google.com>,
	jakub kicinski <kuba@kernel.org>, paolo abeni <pabeni@redhat.com>,
	linus walleij <linus.walleij@linaro.org>,
	hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
	david ahern <dsahern@kernel.org>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Fix console probe delay when stdout-path isn't set
Message-ID: <Yrrivbk2NSK3loBW@smile.fi.intel.com>
References: <20220628020110.1601693-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628020110.1601693-1-saravanak@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_041545_654337_1559F2A4 
X-CRM114-Status: GOOD (  13.91  )
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

On Mon, Jun 27, 2022 at 07:01:01PM -0700, Saravana Kannan wrote:
> Since the series that fixes console probe delay based on stdout-path[1] got
> pulled into driver-core-next, I made these patches on top of them.
> 
> Even if stdout-path isn't set in DT, this patch should take console
> probe times back to how they were before the deferred_probe_timeout
> clean up series[2].

Are you sure it's only limited to the serial drivers?
(just asking, I don't know myself the answer)

-- 
With Best Regards,
Andy Shevchenko



