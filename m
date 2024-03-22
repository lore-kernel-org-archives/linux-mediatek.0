Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E05C47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnmzmRGCFHjCwYkizgpy1J5Hoo1fYMDcJOM3psNjWA0=; b=5GkHD8mDG/k6RiS+zP+dmtyWRU
	FQwvi8zuoWFiU8O6Kmn+9AaBNyg8PSfBPra5pD4xlw9gc2V+mZVeIhO27rQ8LLRCkK9vFpQljjnAu
	XDAf/UkEk7hLuJcHG5zIUgqp5ckOPltS7c1c6zL99L+Wz7ylCmo6hOhDwSP/sS+sC+F8YFZt9AML8
	x9H9abKsEFFzs90hzvVwP4cSRUCaq7eMERXCYyWh7nZ71iDw40ebTNKOwevnCFBIu2Oxytic5utsk
	bpTX92YL3r+E4Ow0Cna+A4bP1CyA7YXAJB/KgA+4mP+ST7Weo+dpV7fp5AUNpOOkXR0SQ+pmUZS8F
	kUovUGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngaH-00000007iAe-2QNm;
	Fri, 22 Mar 2024 15:13:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngaD-00000007i70-0kFb;
	Fri, 22 Mar 2024 15:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711120405; x=1742656405;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=F50EgZ2lJjv6pHduFkF5MM5IKGV69nz1KM4YNtLhMAs=;
  b=zyvOy36lO+E1LMBsugBk3bEobiL/S80mCMu9v7L1QUwTDtKnAsycus/p
   zjGgu4BJPzhGmkZn6ep+vBfXtoroutjKamsAu4eNgQlZfq9l+k3GIWr7S
   4mCodSJSVWvA7Z89YQDe5HCjCrBeFnim7oc4IQAYeXcIWaTegaNM9mBvz
   7C8RFW/IRfZOTDGUYuJCDHqULF6VniR/YOfvNphiJ+67vBXnwNLf6cWzL
   ZD+ezdAxcXDO1gHaXkxlegG6KeiF7aZXMuln+rkd8kY8rBrGbQ5kStz7b
   R2IqHzWqwkmSlIpbYUjOopM4Wq1yKn4+zkU5PGlxsuJ1kOODzII7JkbUu
   g==;
X-CSE-ConnectionGUID: X1l3K2T7QvGR7YYL+xW82w==
X-CSE-MsgGUID: FtnGXb0RSl6ESGuAQ94UKg==
X-IronPort-AV: E=Sophos;i="6.07,146,1708412400"; 
   d="scan'208";a="185306479"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2024 08:13:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 08:13:07 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 08:12:51 -0700
Message-ID: <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
Date: Fri, 22 Mar 2024 16:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Content-Language: en-US, fr-FR
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-i2c@vger.kernel.org>
CC: Elie Morisse <syniurge@gmail.com>, Shyam Sundar S K
	<shyam-sundar.s-k@amd.com>, Andi Shyti <andi.shyti@kernel.org>, "Codrin
 Ciubotariu" <codrin.ciubotariu@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins
	<nick.hawkins@hpe.com>, Yicong Yang <yangyicong@hisilicon.com>, "Oleksij
 Rempel" <o.rempel@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Paul Cercueil
	<paul@crapouillou.net>, Neil Armstrong <neil.armstrong@linaro.org>, "Kevin
 Hilman" <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Khalil Blaiech
	<kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang
	<qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	"Benjamin Fair" <benjaminfair@google.com>, Ajay Gupta <ajayg@nvidia.com>,
	"Peter Korsgaard" <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, Robert
 Richter <rric@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz
 Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Vignesh
 R <vigneshr@ti.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh
 Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>, Sven Peter
	<sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, "Vladimir
 Zapolskiy" <vz@mleia.com>, Loic Poulain <loic.poulain@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, "Laxman Dewangan"
	<ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, "Conghui Chen"
	<conghui.chen@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, "Michal
 Simek" <michal.simek@amd.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
	<linux-samsung-soc@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-omap@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<asahi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-tegra@vger.kernel.org>,
	<virtualization@lists.linux.dev>, Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_081325_466997_F5849FA6 
X-CRM114-Status: GOOD (  10.77  )
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

On 22/03/2024 at 14:25, Wolfram Sang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

[..]

>   drivers/i2c/busses/i2c-at91-master.c       |  2 +-
>   drivers/i2c/busses/i2c-at91-slave.c        |  8 ++++----

[..]

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # for at91
Probably file names themselves will need some care, in a second time.

Thanks. Regards,
   Nicolas

[..]

> --
> 2.43.0
> 


