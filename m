Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA16C001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZWjSUbecP8us4ps1DOWf4oBRNjgb/r/X56//yR2bMU=; b=n6UTtGQWt1mcbYY0MPLIBuLINp
	YBRKMVBY6VHLSnYGbSF+UJh4ukINl+Cu81quSWhe7bpe2f8xpqtf5Gu+UT7KbUAiCA58ErEQ7g2Ct
	E4DOGrk++bZWl5IqgL8MqSwVUOc8ohgtGlT5XpSFBuhjBrkg6qvz94foMrNxdsfqfx69kc/18ED3n
	Ctq3SIODFO+/G++jCMSaDO/r02UUyC74jB9fbDfXVUE0AWC8FvSI6AuE2e4JtNS+9sJPns2fibNfO
	esEPdglQqRqgZwR4Vi8dc62TfF181hDcNi8GFHjko2OtCfOpZHFikp2Jx9mmkP/SYfBtfpgnPkmSM
	uJgyfmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQVQ-00FA4a-16;
	Mon, 31 Jul 2023 10:52:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQVM-00FA3G-0t;
	Mon, 31 Jul 2023 10:52:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B84B161022;
	Mon, 31 Jul 2023 10:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139D4C433C8;
	Mon, 31 Jul 2023 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690800719;
	bh=VRB/1XE21uItYhBv3v9HcbSnr1pNI+FT1F8W0UoZ4EQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rx3XU9T/DfTBZmTe1X/pitgrSt+EjtnzJoqNRAZuy+u5vwBhkfxh+hUZZrw8G6eyB
	 lFooQITIfBmh8/jxn75ajaVWWyL+K/4SU45HngfcLfFTzUUGPBR5u+9IjcHh4p2VuV
	 Gn/BP1tBlmjRqXbGir615a2nw2/EGblZCbb/EdH53HfxfeXjlH0iUF72exIeOeH8ce
	 iI0zsUs/KwhnnNIx6Lxy7o7ockkHS9S04Qeay5vnvJcuIp6si4rRnNUb+xaSuY4dlr
	 /lvwh+EQxuP3f465WPY0yRWJu6eDmjBQECj4Tp33HLlFzlfhS5JD89tNI3MxRd9Faa
	 LZXL9lzdwZVlg==
Received: (nullmailer pid 2405199 invoked by uid 1000);
	Mon, 31 Jul 2023 10:51:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jonathan Bakker <xc-racer2@live.ca>, Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, Trevor Wu <trevor.wu@mediatek.com>, linux-kernel@vger.kernel.org, Rohit kumar <quic_rohkumar@quicinc.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rao Mandadapu <srivasam@codeaurora.org>, Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org, Takashi Iwai <
 tiwai@suse.com>, Judy Hsiao <judyhsiao@chromium.org>, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20230731094303.185067-7-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-7-krzysztof.kozlowski@linaro.org>
Message-Id: <169080070445.2405101.15748974095026995722.robh@kernel.org>
Subject: Re: [PATCH 06/12] ASoC: dt-bindings: samsung,odroid: use common
 sound card
Date: Mon, 31 Jul 2023 04:51:46 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_035200_401509_5E3A62C8 
X-CRM114-Status: GOOD (  14.84  )
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


On Mon, 31 Jul 2023 11:42:57 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/samsung,odroid.yaml  | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,odroid.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/sound/sound-card-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,odroid.example.dtb: sound: False schema does not allow {'compatible': ['hardkernel,odroid-xu3-audio'], 'model': ['Odroid-XU3'], 'audio-routing': ['Headphone Jack', 'HPL', 'Headphone Jack', 'HPR', 'IN1', 'Mic Jack', 'Mic Jack', 'MICBIAS'], 'cpu': {'sound-dai': [[4294967295, 0]]}, 'codec': {'sound-dai': [[4294967295], [4294967295]]}, '$nodename': ['sound']}
	from schema $id: http://devicetree.org/schemas/sound/samsung,odroid.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,odroid.example.dtb: sound: Unevaluated properties are not allowed ('audio-routing', 'model' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/samsung,odroid.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230731094303.185067-7-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


