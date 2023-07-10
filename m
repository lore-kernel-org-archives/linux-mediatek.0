Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA167EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmvNJWp7gSYLSOL1lBEhYIoTeNEMnNA7CgbmPYUsFE8=; b=GQzA+zxYJP/irZacSDllDG1aYS
	QJb5N4fbcNHLLbeC5jw27qLkYnLws+Gimqoi1BP6GnJClVqg3TrtdB8+DgIGMwW93lT3jWE8e8BST
	TnaGSnbEGeWDUFrjPQuJva0kjGMuI4XEXTW5cN4tRM1FE0OC7VJTU1sCkEMCo5pLprzPvFjJX/Le7
	nAQAZzgG75zq7WencX4yHA1pJ1MCGDcCAl6gTeSdjQzNTZEMYPxnEoh60/68XJjt16kBLPFAGctnw
	UHCL5/65GcYUZI5mXINXlK9a3zswBocw5SPqqLseJGtrr6fzI88K+tx4kUWe+avix0ZyEQotqU5wW
	HGM2pNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qItVx-00CA4m-05;
	Mon, 10 Jul 2023 16:13:29 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qItVt-00CA3O-14;
	Mon, 10 Jul 2023 16:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689005605; x=1720541605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hcRhvsNpzCZm3Sd7nNPgrDaCtucecy1QPHYWw64ui6o=;
  b=Uo26fDc1STsoBFkrw6JA8Ubfb/Bw2dOnw5Cgkpt0cMeafWJmMBxToIjE
   8Wb4qs959VPz8Td+zRFLOMyRR9zDLmCYRSjq8/VutOporF9lqKjkcGQeM
   zpQ7YqOH+pShuON+9Rx9+FwpOhX8IU2v664HYihx6vxor6CsnuREGqO5w
   dlRG8biHPMTZrzpEFuXKDu5KipJsjKMb0YeoCSTVMqmjW14ZecUpHFEEw
   4fIEK4IK4Opi0O83rPaKqWfIms8+2rp6si0+n70IVOsC1guJnDIJFQz/H
   9yTvxfea9JEso10YiDt8mKOr7k0WBs9N9pIZtf42eFIGWTZIfamq/mgwS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354244112"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354244112"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 09:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="790844445"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="790844445"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2023 09:12:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qItUs-001bGm-39;
	Mon, 10 Jul 2023 19:12:22 +0300
Date: Mon, 10 Jul 2023 19:12:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 09/15] spi: Use struct_size() helper
Message-ID: <ZKwt5utuGaCf5nmT@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-10-andriy.shevchenko@linux.intel.com>
 <20230710-doze-scared-9f0a2e1a9125-mkl@pengutronix.de>
 <ZKwtgwZtUUHGC+S3@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKwtgwZtUUHGC+S3@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_091325_416826_F19BA3EB 
X-CRM114-Status: GOOD (  14.91  )
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

On Mon, Jul 10, 2023 at 07:10:43PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 05:59:55PM +0200, Marc Kleine-Budde wrote:
> > On 10.07.2023 18:49:26, Andy Shevchenko wrote:

...

> > > +	struct spi_transfer	t[];
> > 
> > You might want to use the DECLARE_FLEX_ARRAY helper here.
> 
> Technically, yes, semantically documentation [1] disagrees with

"and [2]"

> you, so I leave it as is.
> 
> [1]: Documentation/process/deprecated.rst:269

[2]: Documentation/process/deprecated.rst:350

-- 
With Best Regards,
Andy Shevchenko



