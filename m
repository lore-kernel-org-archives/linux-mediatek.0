Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869D3C38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gq/L7QF5DD127E+x4yCOdD9xGRbI7e/bV1wMv2Kv+dQ=; b=qjC2D0M7rxKTlLw5vqdBn9x82d
	ADQnuLTCGnewFfGS6BY/g0CeVbVsFi1zj9GwvODmOGL4al92U7jm6UQiMuE/fI2qsoBE6HS3bYG9c
	l7a/nNHpBTSgtGd27PuET8YELoY3buFrPapNNlrvkrkfQxTBun9+1oHMfvWFa+TrOty/ZcbXuxf0Z
	xgunryQQ2gwN1S2jn28QGsAkxElzNFalUCMR0NM6KEn+JURqJc5+PDxI6f/xcPdgL08VCa+WgaVdj
	u6irYamN37o8xiJz7D0XgK0VZy6qnSt2kvXAvrcWdmbz1FB6w/tYIp/jbeW2nNwVbad8C9KSgFUkA
	XhEg4LDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIEB2-002WJ3-Iv; Wed, 18 Jan 2023 19:32:52 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIEB0-002WIC-Mu; Wed, 18 Jan 2023 19:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674070370; x=1705606370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rd8D9WM+DMkQQdSGbyw+RjACp0njYXtWMwISiTkUNq4=;
  b=d/Amjq+9RCEzDmCG1zknge2Ho6rsnKL7ycoNGyTtz86tQzMNvknleNLU
   rF6Slkb6haHHTAdpiGC2xdk9kt4h5cYClsIDjiUVAcPlbw0Zmo3Wd+x1a
   PuLBWpc+PB5XmSHaifnsOvg4o6u9Xj3O9Y7UEXtsI3u5Cp6dI6BRpSK+n
   RnfMZWFACn1p7lPGqeY6pwB2PZYGZUfwB43BZwpTAozM1pxxouAqpvySC
   xGLq3EmCGNr4NxxxpqooCLbs9f4PlNCyMzKjk9Ttv58aXqasZQdVY1cah
   h+UJbY/VuZ04U7v8gCzkAUCw6tBsD0x+WEMktFMFa3cDUYVncSuIwHDPG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411319211"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="411319211"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 11:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="802328577"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="802328577"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2023 11:32:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pIEAh-00BLES-15;
	Wed, 18 Jan 2023 21:32:31 +0200
Date: Wed, 18 Jan 2023 21:32:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>, Green Wan <green.wan@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?utf-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
	Peng Fan <peng.fan@nxp.com>, Paul Cercueil <paul@crapouillou.net>,
	- <chuanhua.lei@intel.com>, Long Cheng <long.cheng@mediatek.com>,
	Rajesh Gumasta <rgumasta@nvidia.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Palmer Debbelt <palmer@sifive.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: dma: drop unneeded quotes
Message-ID: <Y8hJT7gaw3+s62rv@smile.fi.intel.com>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_113250_829976_020B9D57 
X-CRM114-Status: GOOD (  11.33  )
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

On Wed, Jan 18, 2023 at 07:01:43PM +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
>  Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-

>  Documentation/devicetree/bindings/dma/intel,ldma.yaml           | 2 +-

>  Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml   | 2 +-

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



