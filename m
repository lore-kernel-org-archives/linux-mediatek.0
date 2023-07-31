Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D07EC001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4qoHZN1sak2saGQvEn8kLHO6I/CpJEtMoM/v0V04+4=; b=bshb6l9Mcmo9/h47G38t1y05Sb
	7vSQO6WCqQ02uY2/IYlfOJXjKvtdYK9eIvkgPjcJ8zFrKJiJlgCywfVhaVPEwT3ZPp+DRAYsI9XRT
	WnojyOibqJTqaHIP1uhoFNNnfi3Ar89ymYM/SUMTOIBPp2ZR4Xm5hQJSG6r89b7ADMrS7pbErKUxw
	LlXWTGlIDGZRP4SyEDJVWF36sL/iPZDy8Ifgj1fv6ccJDLG5us8U8o/rrzkgGkEcOKZj8n8A93fNJ
	0Tu29OhrR0eIgO6U+NA5NLXKQ+hwOQUDghrX8rOVMXZBE48Ly+7b6jjdxdSVPbYiLE1qT/WVGEuLz
	glwAREtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU3A-00G9T3-0z;
	Mon, 31 Jul 2023 14:39:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU37-00G9SP-0C;
	Mon, 31 Jul 2023 14:39:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F031610A3;
	Mon, 31 Jul 2023 14:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B60C433C7;
	Mon, 31 Jul 2023 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690814342;
	bh=I+HTilLE0eCgqcOxm8A9AzbA88OpHR1hterp6c6XU+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pg+zp2UxyorlYipjOt2QuL2ulmdPZOv6nqgX8rI7HeFvug9s4uUjTa7fk79yJpEJZ
	 kHJIg6Z09MuBmxvZJMz0zBvsfY9SuES52uCVOp98BgNUkZPsAx2MMUEjZugT4Oggog
	 NBGUpxONXSFmhKzNBPavt7eavVNB8kxNt3n0vvryKgwCsd4BwOQsHWUxNWajJc3oH8
	 sZ+ZaPbj4JyaWZAwz6LO1jDGvPA7EMmXVj40RP77w9SdUECS+f+Gc2hB2WZDcmX/8l
	 GrsKzmxO061FUgIS6HjTQ7bAT5+QxQEU5qmOPbePzUCVf5uv7ldYatz7zF8mfbHnLK
	 /z0h20ZI/tWjg==
Received: (nullmailer pid 2931468 invoked by uid 1000);
	Mon, 31 Jul 2023 14:38:59 -0000
Date: Mon, 31 Jul 2023 08:38:59 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Judy Hsiao <judyhsiao@chromium.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org, NXP Linux Team <linux-imx@nxp.com>, Rao Mandadapu <srivasam@codeaurora.org>, Trevor Wu <trevor.wu@mediatek.com>, Jonathan Bakker <xc-racer2@live.ca>, Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, Rohit kumar <quic_rohkumar@quicinc.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Sascha Hauer 
 <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
Message-ID: <20230731143859.GA2928327-robh@kernel.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-4-krzysztof.kozlowski@linaro.org>
 <169080070077.2404962.11506468692056687115.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169080070077.2404962.11506468692056687115.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_073905_209993_BA8881A7 
X-CRM114-Status: GOOD (  16.88  )
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

On Mon, Jul 31, 2023 at 04:51:46AM -0600, Rob Herring wrote:
> 
> On Mon, 31 Jul 2023 11:42:54 +0200, Krzysztof Kozlowski wrote:
> > The mediatek,mt8188-mt6359 Linux sound machine driver requires the
> > "model" property, so binding was incomplete.  Reference the common sound
> > card properties to fix that which also allows to remove duplicated
> > property definitions.  Leave the relevant parts of "audio-routing"
> > description.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/sound/mediatek,mt8188-mt6359.yaml  | 17 +++++++----------
> >  1 file changed, 7 insertions(+), 10 deletions(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml:
> Error in referenced schema matching $id: http://devicetree.org/schemas/sound/sound-card-common.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.example.dtb: sound: False schema does not allow {'compatible': ['mediatek,mt8188-mt6359-evb'], 'model': ['MT6359-EVB'], 'mediatek,platform': [[4294967295]], 'pinctrl-names': ['default'], 'pinctrl-0': [[4294967295]], 'audio-routing': ['Headphone', 'Headphone L', 'Headphone', 'Headphone R', 'AIN1', 'Headset Mic'], 'dai-link-0': {'link-name': ['ETDM3_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu'], 'codec': {'sound-dai': [[4294967295]]}}, '$nodename': ['sound']}
> 	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.example.dtb: sound: Unevaluated properties are not allowed ('model' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#

Looks like patch 2 could not be applied causing this.

Rob

