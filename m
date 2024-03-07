Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B417C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cjc35a25Pjb7wPSCXvGB9mMqNe5wlIz2sViuyVcL0Zg=; b=2mNqPT9C7deuyX6r+hiF6FCEa/
	NaFEuDIJNMS1rNcTPBCaxhsvioAGfAHqwa5n9A/XMqY7/1F2VGbRK2f8f5s0r9gl/rjHl4vSOmvqR
	dW0VVl/or9rKP1Q7YV1dj4QECF7GL04ZtlV4157c086HqqGbskA/b6O6Ry2vdl9FX+BeBvwrA+0Ty
	XYY8SZKSSqjHcfpqmhGTBjNDBnRLg6oZBCaSRScpmtAzFDemTxYfjO8d+5ltNzADkN7h+0RgNnT1y
	+2VoGlZ0TV5LCc5bwW3+IT8emQ/xOLPvlkmQyGdzxufpK0VkApnQCGyk35rVqdd8hC75hwl+QFEdR
	OzYlWVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDxd-00000004mW2-3fV7;
	Thu, 07 Mar 2024 13:39:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDxX-00000004mS9-3WTB;
	Thu, 07 Mar 2024 13:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C5D6ECE2222;
	Thu,  7 Mar 2024 13:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A13C433C7;
	Thu,  7 Mar 2024 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709818733;
	bh=jdziFFhymjkKWVH2L66KHJLIKy2BknU2Y6GQbKeQUN0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=EZURRjwFB6Gt7MazyGetYAEDZL/lr9tOV8UGUjY3V/0VSV11g+uGlqg+v7EiLtZV/
	 BtjbRK0Iwoqh58ZgA3CdcQX84x2D6BX+RnLJ05UX63NrG/KOZzSbhfSzhPDd6Mi4Be
	 FakJCatHxob98B+VZRFUls/7L1xD69bs07V+zYQR5bRlVwbsuCI3iVzd1+2ZtpPDG2
	 eib4cAZTIz9b2oGNI1tpvWBW/mH/5gsTchrX16H2JhihpXGPU0i55WbQF8sdPb+Ig2
	 XwBfFY+d1IWdJiUy4exyAQpwoHlBRI8wziWhbPzN43d11PHd/bCyou8/D+g/s0bAjD
	 yTECBlR97r0Bw==
Date: Thu, 07 Mar 2024 07:38:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, shane.chien@mediatek.com, 
 nicolas.ferre@microchip.com, perex@perex.cz, allen-kh.cheng@mediatek.com, 
 linux-sound@vger.kernel.org, dianders@chromium.org, 
 krzysztof.kozlowski+dt@linaro.org, kernel@collabora.com, 
 matthias.bgg@gmail.com, alpernebiyasak@gmail.com, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, tiwai@suse.com, eugen.hristev@collabora.com, 
 nfraprado@collabora.com, arnd@arndb.de, linux-mediatek@lists.infradead.org, 
 amergnat@baylibre.com, claudiu.beznea@tuxon.dev, frank.li@vivo.com, 
 zhourui@huaqin.corp-partner.google.com, wenst@chromium.org, 
 kuninori.morimoto.gx@renesas.com, 
 xiazhengqiao@huaqin.corp-partner.google.com, trevor.wu@mediatek.com, 
 devicetree@vger.kernel.org, jarkko.nikula@bitmer.com, 
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, shraash@google.com, 
 alsa-devel@alsa-project.org, u.kleine-koenig@pengutronix.de, 
 jiaxin.yu@mediatek.com, broonie@kernel.org, maso.huang@mediatek.com
In-Reply-To: <20240307114445.196981-20-angelogioacchino.delregno@collabora.com>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
 <20240307114445.196981-20-angelogioacchino.delregno@collabora.com>
Message-Id: <170981873007.2495472.10889414408252370603.robh@kernel.org>
Subject: Re: [PATCH v2 19/22] ASoC: dt-bindings: mt8192: Document
 audio-routing and dai-link subnode
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_053856_308536_145E843C 
X-CRM114-Status: GOOD (  11.59  )
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


On Thu, 07 Mar 2024 12:44:42 +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 124 ++++++++++++++++--
>  1 file changed, 115 insertions(+), 9 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.example.dtb: mt8192-sound: 'model' does not match any of the regexes: '.*-dai-link$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240307114445.196981-20-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


