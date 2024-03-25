Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E886C54E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+rL76cq08dGVPkj2wxsdNomOGe7rQOHyUfzV90HHdk=; b=jU53pOoJFAmFnR+LFVI7Wadrex
	Nreid/tzVZMwLNBVsrOrYQ/JtsZ07VMyaGWpPF+NHuBFUsXvd2BVdItKNFgcWFVRuwXfiu9FAEQfy
	sI3UcNMxRYdGyy5mmAqpdtGVP/1S53A2xGkp5/fhYIgllGwPB5CUWujAheq0wOXa6i8xUOfp9vGsT
	oJbtZznRSVIGQtbg1gIzeF9J/J5UCW1Osjz3gg+0Pjn22Q2YlFPk94chmZzNLzI3uic15BJch2wI4
	wf+S2yXt9yyYuqMe6EVKumf81p3AuhGKeIoAcycj35VB/abmNsB2qmMEp8A9N+ZDjTE6vgs44xP0K
	AmDOUUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rof9o-0000000G1GB-2b7X;
	Mon, 25 Mar 2024 07:54:12 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rof9j-0000000G1ER-2pc6;
	Mon, 25 Mar 2024 07:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711353246; x=1742889246;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G9pVMPBkGeSCKm7GL4349gPmBncBHLw8Di6BWoQcag0=;
  b=fkXBLBgH37ph5Q0oYqWWbQJliLEsV/7J0cRb9rnT+QtQitFB1LufvUhR
   6RbAy21oMDg0XwBl2NbcQeU1Th3VwscKlE20dvZ5f7JIhKFElboWiyf9v
   AoMfPWHhEa189te3dE2STHMcSX1XKpuZC/9kgI4CzPJ9m6PRNtlvqDuaL
   nN6V2ei/lTfqgAXmfQoLN8yhfvu93Vj4NIIYgfA1T9W0hCDNpKb9uxXQX
   Dhv3JxCOHVocNU6iEtQTMeJHdCB5MGLVPKCuloulscTuDe93TllMdzTgy
   OXt8/kHxgpiBw8R+45tukcx9r+bXhkr1PvtE/TQn9JXL8uBNH5WKpQr2p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6199178"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6199178"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 00:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="16197266"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2024 00:53:46 -0700
Message-ID: <1f1e59a4-359e-4679-8ea9-3d915a930e91@linux.intel.com>
Date: Mon, 25 Mar 2024 09:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Elie Morisse <syniurge@gmail.com>,
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Nick Hawkins <nick.hawkins@hpe.com>, Yicong Yang <yangyicong@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Ajay Gupta <ajayg@nvidia.com>, Peter Korsgaard <peter@korsgaard.com>,
 Andrew Lunn <andrew@lunn.ch>, Robert Richter <rric@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Vignesh R <vigneshr@ti.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vladimir Zapolskiy <vz@mleia.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Conghui Chen <conghui.chen@intel.com>, Viresh Kumar
 <viresh.kumar@linaro.org>, Michal Simek <michal.simek@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_005407_991803_563A7C72 
X-CRM114-Status: GOOD (  18.60  )
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

On 3/22/24 3:25 PM, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-amd-mp2-plat.c      |  2 +-
>   drivers/i2c/busses/i2c-at91-master.c       |  2 +-
>   drivers/i2c/busses/i2c-at91-slave.c        |  8 ++++----
>   drivers/i2c/busses/i2c-axxia.c             | 10 +++++-----
>   drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  2 +-
>   drivers/i2c/busses/i2c-designware-master.c |  2 +-
>   drivers/i2c/busses/i2c-designware-slave.c  |  8 ++++----
>   drivers/i2c/busses/i2c-diolan-u2c.c        |  2 +-
>   drivers/i2c/busses/i2c-exynos5.c           |  4 ++--
>   drivers/i2c/busses/i2c-gxp.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-hisi.c              |  4 ++--
>   drivers/i2c/busses/i2c-img-scb.c           |  2 +-
>   drivers/i2c/busses/i2c-imx.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-jz4780.c            |  2 +-
>   drivers/i2c/busses/i2c-kempld.c            |  2 +-
>   drivers/i2c/busses/i2c-meson.c             |  4 ++--
>   drivers/i2c/busses/i2c-mlxbf.c             |  8 ++++----
>   drivers/i2c/busses/i2c-mt65xx.c            |  2 +-
>   drivers/i2c/busses/i2c-mxs.c               |  2 +-
>   drivers/i2c/busses/i2c-nomadik.c           |  2 +-
>   drivers/i2c/busses/i2c-npcm7xx.c           | 12 ++++++------
>   drivers/i2c/busses/i2c-nvidia-gpu.c        |  4 ++--
>   drivers/i2c/busses/i2c-ocores.c            |  8 ++++----
>   drivers/i2c/busses/i2c-octeon-platdrv.c    |  2 +-
>   drivers/i2c/busses/i2c-omap.c              |  4 ++--
>   drivers/i2c/busses/i2c-opal.c              |  4 ++--
>   drivers/i2c/busses/i2c-pasemi-core.c       |  2 +-
>   drivers/i2c/busses/i2c-pnx.c               |  2 +-
>   drivers/i2c/busses/i2c-pxa.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-qcom-cci.c          |  2 +-
>   drivers/i2c/busses/i2c-qcom-geni.c         |  2 +-
>   drivers/i2c/busses/i2c-robotfuzz-osif.c    |  2 +-
>   drivers/i2c/busses/i2c-rzv2m.c             |  8 ++++----
>   drivers/i2c/busses/i2c-s3c2410.c           |  4 ++--
>   drivers/i2c/busses/i2c-stm32f7.c           | 14 +++++++-------
>   drivers/i2c/busses/i2c-tegra-bpmp.c        |  4 ++--
>   drivers/i2c/busses/i2c-tegra.c             |  4 ++--
>   drivers/i2c/busses/i2c-thunderx-pcidrv.c   |  2 +-
>   drivers/i2c/busses/i2c-virtio.c            |  2 +-
>   drivers/i2c/busses/i2c-wmt.c               |  2 +-
>   drivers/i2c/busses/i2c-xiic.c              |  2 +-
>   41 files changed, 95 insertions(+), 95 deletions(-)
> 

> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c7e56002809a..14c61b31f877 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -832,7 +832,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   }
>   
>   static const struct i2c_algorithm i2c_dw_algo = {
> -	.master_xfer = i2c_dw_xfer,
> +	.xfer = i2c_dw_xfer,
>   	.functionality = i2c_dw_func,
>   };
>   
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index 2e079cf20bb5..b47ad6b16814 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -58,7 +58,7 @@ static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
>   	return 0;
>   }
>   
> -static int i2c_dw_reg_slave(struct i2c_client *slave)
> +static int i2c_dw_reg_target(struct i2c_client *slave)
>   {
>   	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
>   
> @@ -83,7 +83,7 @@ static int i2c_dw_reg_slave(struct i2c_client *slave)
>   	return 0;
>   }
>   
> -static int i2c_dw_unreg_slave(struct i2c_client *slave)
> +static int i2c_dw_unreg_target(struct i2c_client *slave)
>   {
>   	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
>   
> @@ -214,8 +214,8 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
>   
>   static const struct i2c_algorithm i2c_dw_algo = {
>   	.functionality = i2c_dw_func,
> -	.reg_slave = i2c_dw_reg_slave,
> -	.unreg_slave = i2c_dw_unreg_slave,
> +	.reg_target = i2c_dw_reg_target,
> +	.unreg_target = i2c_dw_unreg_target,
>   };

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

