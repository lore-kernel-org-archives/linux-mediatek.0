Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82B2EED620
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 16:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqfm9ogszy01Qwx/Eh6C5oLCFUyR0nWquRMGCl1ez9s=; b=etFGF6KSwh7Xa8n0KRHjWEgs6h
	Mj0/If716iolzG2VuX8g0qSiEdYnAim13sgan7+AbHn/XzDv7sf1kWm39EajGjNP3M08XF9hxFfYl
	EZmCzIhGE7aELSFlGGAingF/NUL4GWB0EUzUdzgZIVY6uoYLEq3BK9buNhmEw8fyPDETAGy3cCM9C
	VgXWT51q7P9PHjyhr/ju+YpMzUbdxz1wyLkjpaENjFdrdlo+R/KRjpwemmt2dqd6h8vTg5KS6uVrW
	hs4TppmDAZmsvEGByXbdeeK/UXjTAKmaJEoVNxWEu3sb9NAZUDVKy68DqZ1BzigJ2TRrrW9ilv9xy
	+0DcOmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somwT-0000000DkAx-1LLe;
	Thu, 12 Sep 2024 16:45:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somug-0000000Djem-1Vim;
	Thu, 12 Sep 2024 16:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1D98A452D1;
	Thu, 12 Sep 2024 16:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C84C4CEC4;
	Thu, 12 Sep 2024 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726159400;
	bh=jAOZmLaS86bj9s5j3+eO3YVYQkX0MvMiHQnL9QbBzJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fITLn6YDWhfp6bpfzsNr1JXfMoSPjzBm3aRD/hH7VamK3QUvyqd7puHy+Bq67h//v
	 v7/8bNGawMiC76RnwwHhGuA24TmAbQLT7jVdFU8TiejH0pWgakwdbME4NMpFyckM+U
	 LPXMKuMgi/Bfon9sxpR8UJPA7rJ7MzMwUfSAWk9rMnbwQHJj7tg6YEPQ3q0wk5eU4c
	 ZIqoKFhCWDY+PlV5iQ7YLs6B28rgvr+YtWemR0yoszDvx1Gj+1yk1iBpaI8tAVEUPB
	 BOQFKIMn69zn/V151F0J60p5a+Bpo0cEEG94nIobU+Ik1KMSPXOxo7QYv37bNPuPHY
	 50jFR/ceI5FJQ==
Date: Thu, 12 Sep 2024 11:43:19 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
	upstream@airoha.com, ansuelsmth@gmail.com,
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	benjamin.larsson@genexis.eu
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: airoha: Add the chip-scu node
 for EN7581 SoC
Message-ID: <20240912164319.GA3907493-robh@kernel.org>
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
 <20240911-en7581-pinctrl-v4-1-60ac93d760bb@kernel.org>
 <172608915149.1388705.7137335166206916411.robh@kernel.org>
 <ZuIPo8BMBVGuaGMI@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuIPo8BMBVGuaGMI@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_094322_555922_30DDF0BD 
X-CRM114-Status: GOOD (  25.04  )
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

On Wed, Sep 11, 2024 at 11:46:11PM +0200, Lorenzo Bianconi wrote:
> > 
> > On Wed, 11 Sep 2024 21:50:01 +0200, Lorenzo Bianconi wrote:
> > > This patch adds the chip-scu document bindings for EN7581 SoC.
> > > The airoha chip-scu block provides a configuration interface for clock,
> > > io-muxing and other functionalities used by multiple controllers (e.g.
> > > clock, pinctrl, ecc.) on EN7581 SoC.
> > > 
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  .../bindings/arm/airoha,en7581-chip-scu.yaml       | 42 ++++++++++++++++++++++
> > >  1 file changed, 42 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > 
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240911-en7581-pinctrl-v4-1-60ac93d760bb@kernel.org
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.
> > 
> 
> Hi Rob,
> 
> before posting the series I run make dt_binding_check:
> 
> $ make dt_binding_check DT_SCHEMA_FILES=airoha

Technically, you have to run it without DT_SCHEMA_FILES as sometimes 
there is interaction with other schemas.

>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   CHKDT   Documentation/devicetree/bindings
>   LINT    Documentation/devicetree/bindings
>   DTC_CHK Documentation/devicetree/bindings/arm/airoha.example.dtb
>   DTEX    Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.example.dts
>   DTC_CHK Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.example.dtb
>   DTC_CHK Documentation/devicetree/bindings/clock/airoha,en7523-scu.example.dtb
>   DTC_CHK Documentation/devicetree/bindings/net/airoha,en7581-eth.example.dtb
>   DTC_CHK Documentation/devicetree/bindings/net/airoha,en8811h.example.dtb
>   DTC_CHK Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.example.dtb
>   DTC_CHK Documentation/devicetree/bindings/spi/airoha,en7581-snand.example.dtb
>   DTC_CHK Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.example.dtb
> 
> $yamllint --version
> yamllint 1.35.1
> 
> dtschema is at the latest version.
> Is it a false positive or am I missing something?

Looks like something went sideways. Will look into it. You can ignore 
this.

Rob

