Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DCBC54798
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8J6wAM5SdKo9linrEdpyeXHu3fS1OvsYBCv/ufwtXn4=; b=pG71piBw6tmP8nH1FdOvRE555H
	eFqMF/JLCbrjWMcrhTU3EbTz1x8J1Redfbqg9eQ+T/KaU0a8eleumfTS7+3sisxeJARVnnl7P9gVn
	fxAUvd2deoq+XIAcBXzV543nnpkAvpaOm3orZpNiz2q0anG7haR/SJgHyRya8cK9XT1uY7Hf/Oj2n
	V/twyJmeN1FBvm5Hy1Hyoeb4oAWOVBY7wmaoHD/R7GE45cSFsW64LT2i8I+lGzlVJCw1utjxsQ3SE
	uqI2B6NddwiczJnZie/7fZja0x9wBnb4fuV5pnOvcYBTH6UWkG+r3owSH9t81FlXCbz6Z2gTTGGGA
	gt1beZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEU7-00000004z8l-2yJn;
	Thu, 07 Mar 2024 14:12:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEU4-00000004z6s-0B8n;
	Thu, 07 Mar 2024 14:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0601A617B3;
	Thu,  7 Mar 2024 14:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76175C433F1;
	Thu,  7 Mar 2024 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709820750;
	bh=nvbQsr5KjGsdgCRWMMm6N+qmKuGEbiis9IDBpCnfHWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6PAGLgFEUhhVnJvxN9VBaasVy+W3B8NrblbXlXKVEObuLjkruTXouwbGYKa3GBI1
	 FJ0VlAfRtDaE5JJfuzJbej0DtmIINDKfOopCmms4fGTiC/gf6fd/jn9AmErabgyRXY
	 FVviSDnbtXKgXWetVHpzUBe50o7wsniQJz9BAQYTE+WY2iRACaHPqdA1U+p0TB3wxg
	 YTvrigZ9SNzD5itbbaw+okGwNGH2+NKjg5sDuxqthcxBh15/V4ZzX2uw4qnOWuTKIk
	 SiKQ8QZhMO+HiFSChgY86lRoZwtKUikxUNyToLVHB2q6z69CISeHTkAhft9xoZX2ww
	 NWn67JxkycS6g==
Date: Thu, 7 Mar 2024 08:12:28 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com,
	amergnat@baylibre.com, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, dianders@chromium.org,
	frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com, ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com, nfraprado@collabora.com,
	alsa-devel@alsa-project.org, shane.chien@mediatek.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 19/22] ASoC: dt-bindings: mt8192: Document
 audio-routing and dai-link subnode
Message-ID: <20240307141228.GA2491015-robh@kernel.org>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
 <20240307114445.196981-20-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307114445.196981-20-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_061232_361639_9DD1258C 
X-CRM114-Status: GOOD (  18.01  )
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

On Thu, Mar 07, 2024 at 12:44:42PM +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
> 

I replied on v1, but one more thing here.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 124 ++++++++++++++++--
>  1 file changed, 115 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> index 7e50f5d65c8f..449454c50dcc 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> @@ -13,6 +13,9 @@ maintainers:
>  description:
>    This binding describes the MT8192 sound card.
>  
> +allOf:
> +  - $ref: sound-card-common.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -20,6 +23,14 @@ properties:
>        - mediatek,mt8192_mt6359_rt1015p_rt5682
>        - mediatek,mt8192_mt6359_rt1015p_rt5682s
>  
> +  audio-routing:
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +      Valid names could be the input or output widgets of audio components,
> +      power supplies, MicBias of codec and the software switch.
> +
>    mediatek,platform:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of MT8192 ASoC platform.
> @@ -27,10 +38,12 @@ properties:
>    mediatek,hdmi-codec:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of HDMI codec.
> +    deprecated: true

The deprecated keyword doesn't do anything at the moment, but my plan 
there is to add a mode to the tools which disables all deprecated 
properties. That will give you want you want in terms of disallowing 
these properties.

That would require dropping them from "required" which I'm fine with you 
doing. (Though technically that's still an ABI change)

Rob

