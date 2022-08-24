Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F3BC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 11:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPfUO5L0lKNnEh/7QMnKZQNZUSwxQ1BgscV2x9tCBBY=; b=CMLpMHerLH36hev2jdkiDqe6nf
	wncZvx5zhetay3qbx+mSMzKwG9qzRj32sX3/ja3mi87bqtYBu8ez99d1vJdXmqH1N1RCTDdEsLoHj
	PB7N2cczRLeJ23XgNcL0aSsa9aJ+h9rJjIStc2IzyKJQY0i7DtnxSaGHNXNU9kZiXSIRNHvn5foOk
	ygJ4muxDX+o5/YROrshZIYMWs28PYh0+Js81uqEJLFOg8/FADZeo4/vrwCP2ocf8aBLcsVdMtmHXB
	j6koex7rxLd1pm4Ba2kh1cwNbiuT5mKgOP7L6QN4ZFHKvrhn3um8l6hfTqhwruWWm8lLKdA5oOiY7
	zOzEblWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQoJI-00CM5s-Pq; Wed, 24 Aug 2022 11:12:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQoJ7-00CM1O-Vb; Wed, 24 Aug 2022 11:12:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D1B4618EC;
	Wed, 24 Aug 2022 11:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95404C433B5;
	Wed, 24 Aug 2022 11:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661339544;
	bh=H+veo+Dao6bkJ0QMyFov+hU73WKqs+8y5v0OSddUH8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kBHMSKXnm0q0/ig5wiPntO3Jl5ZlIKYg+9lyllxyXo7josUAAKfnl1BGY3qq5uhyO
	 Z39yjwD4/NFhx2B6Wc/+r0hxaXJ3UbARfcsvcwDHtrvsdD9i4JhAPciVl3T+CrM3hE
	 /EfTraglUjPsMItvnKtQPOtWdoDhkRmhY/G/3keG1xGxXbDlJUrW1CZutdptQFqyPk
	 xmLku2O2USngmtzYaRvm9/aAWs6ObNDWc20kLO8WBsH/+ochtgPB/WbGdw8JMgyDNG
	 LzO0IgWc0DDMNlWKK3zbXjCzwriQw4vMTPFYeOP0n1m836BgYwak6uCgFGY1uhlIZY
	 l8v5dwKXirf2Q==
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Rob Herring <robh@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shane Chien <shane.chien@mediatek.com>
Cc: linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20220823145649.3118479-8-robh@kernel.org>
References: <20220823145649.3118479-8-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Add missing (unevaluated|additional)Properties on child nodes
Message-Id: <166133953831.17904.2785802329558247784.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 12:12:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_041226_076865_0D5723F8 
X-CRM114-Status: GOOD (  12.45  )
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

On Tue, 23 Aug 2022 09:56:39 -0500, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Add missing (unevaluated|additional)Properties on child nodes
      commit: 9e10a1ded6a1b7ffacbb2d9c75fe6aa91623051b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

