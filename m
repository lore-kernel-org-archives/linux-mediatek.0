Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4DDC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 06:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xc9xiiID9usUhiq1H6h/T0grA82mAj6tr+nXZplACo0=; b=MoI7y876nniR2qaDF/1qv80v+7
	M+nF5Klp64Jv7plsuqZRzFDINO8Vf5QBwzMt/dxShecNipfxewmyOelRtFDSkAlWMLYjlA3xzVqrQ
	yPy3WesLH1fBOIesYRYn6LYqcq1Hyar7k1wQUcXtcuUk7uACFY/jyEeKklLOL5ysWkkTqv3T4pl9t
	/WjOR6rWEIPto4xBJmJPEigEGDSmWjrx6xPeCTcfnaJUJbVEdoMoN+DeK/dWqo5knUnO/WNN4QqhZ
	DsNEI815S1TY+eEUdMivHPEmcDs6MPluVgBNsofcPjDfO/LsZROOhUpFq1goBPeeyn6gqfW7fE3f/
	P6oyknJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQMX4-004Owz-JK; Fri, 10 Feb 2023 06:05:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQMX1-004Ow4-2l; Fri, 10 Feb 2023 06:05:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 548E361CA4;
	Fri, 10 Feb 2023 06:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77ADC433D2;
	Fri, 10 Feb 2023 06:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676009109;
	bh=R+M0ft2NoW5OEkw9Yp/lx0D4Vb1O1La2tMhNLmrHwBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzFaShVbYUL6AnzcrewjwVNrWiJJde9hTV8N08ircjXv3C51e3nW1I8NUd2RMI+7M
	 3qFjHfFG7uUtTMfQ3B0mmemAuWTzOCQsVIym1QDac0Fwh6uGDPSj2lZQFVTwFfBf+J
	 qXnz//A5czX2LOvB+wyWER7bwOfG59bq2nmKpbzKWgYYw14Kf2JzmmQlTomzMeLQhA
	 +POxMFnDWrSFug3xwaq+SJuL5KJIXJArxMGqB99mLZ2l/k2nVd4Lq/Gs3AhFG9XiUR
	 hLRjRPu2RUQIFYOBXTlsc2I6Deu+PJSzIOoLmDbZH50Qu31YrxFNc0fxfN1/oMMCik
	 pcYUxYygwH29Q==
Date: Fri, 10 Feb 2023 11:35:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
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
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Green Wan <green.wan@sifive.com>,
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
	linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: drop unneeded quotes
Message-ID: <Y+XekQsIwpixyPD0@matsya>
References: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_220511_183723_E0C34BF0 
X-CRM114-Status: UNSURE (   8.25  )
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

On 24-01-23, 09:11, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.

Applied both, thanks

-- 
~Vinod

