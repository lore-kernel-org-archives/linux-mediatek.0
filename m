Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA58BC48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ2JVEDgmiFzKsuSYxpzr/7KrPRAfX7wF19HQuPSEm0=; b=bEjDS5N/tOXF4yQd7T0kmxTFt0
	I5k9gi3NliTvenyVwvhY4KTPz4NvlIcF1tDODZHPRItYKnP2TZ4t8LBeWCI+RVpQLgIv/C5FL/rN4
	GXf+6jO3J/Y79dibQgWNAP+kWEGrG/ZGN52kUDLR9/SA122B2LhvMP45tDwnGDM0fbokNm+LKdTlS
	LaDiBr13R1ude2HYmUVaTSgUajg0lbTTp27Fo3fgJLP8sv5JWEBD/DlCfAzT3wfPARkilDb0dqrQp
	ID6TKQ3dIP+YaFAr6NZhFcGK8FexLROcV/+vjP3mNXy6t+jQhCZqkIToCNdQ73OrByhOhj4DVDGX6
	6lmat1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh9EO-00000009M2Z-2NiP;
	Mon, 04 Mar 2024 14:23:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh9EK-00000009M1E-2TaE;
	Mon, 04 Mar 2024 14:23:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A84D6CE1386;
	Mon,  4 Mar 2024 14:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90565C43390;
	Mon,  4 Mar 2024 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709562223;
	bh=XXxnvR6/7pWjgGR4OrSNwADlQ09xHuL0Usz9cO3xdU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AsPt8hoDUStklKvbr9l5y2fCjUGifbeJjU76gbjhnARANwQXeq28a2bR771tR8nGT
	 noq991Wu1u/PCmt4GmXY7fDKquRwzL5iof/dZkzUfh9seVFkRx739pgn8PWheEu6SG
	 UWs0JrRh19UszyusQy3QxyfcQm8/sMHN5c88pWXSH+PdSW3/3avE5HPVXoLb9tKBdF
	 TTIhXfxcJX8lBh50VfYt0ukdtiFqg/8esZM4/Etf2qaOf17eYQFv2EsnRZg7uqsvSu
	 YR364dIhms7VAjpVoZ2rKs1VYiEaI6QPd6KwtY0QFiCXusYMaYeO3bErFJyEXF+YuE
	 Zek//seAJQ1FA==
Date: Mon, 4 Mar 2024 08:23:41 -0600
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
Subject: Re: [PATCH 19/22] ASoC: dt-bindings: mt8192: Document audio-routing
 and dai-link subnode
Message-ID: <20240304142341.GA156846-robh@kernel.org>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
 <20240227120939.290143-20-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227120939.290143-20-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_062349_025314_26FCE250 
X-CRM114-Status: GOOD (  19.80  )
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

On Tue, Feb 27, 2024 at 01:09:36PM +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 129 ++++++++++++++++--
>  1 file changed, 121 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> index 7e50f5d65c8f..78e221003750 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> @@ -20,6 +20,15 @@ properties:
>        - mediatek,mt8192_mt6359_rt1015p_rt5682
>        - mediatek,mt8192_mt6359_rt1015p_rt5682s
>  
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array

Already defined in sound-card-common.yaml. Add a $ref.

> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +      Valid names could be the input or output widgets of audio components,
> +      power supplies, MicBias of codec and the software switch.

Generally the names are defined here.

> +
>    mediatek,platform:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of MT8192 ASoC platform.
> @@ -27,10 +36,12 @@ properties:
>    mediatek,hdmi-codec:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of HDMI codec.
> +    deprecated: true
>  
>    headset-codec:
>      type: object
>      additionalProperties: false
> +    deprecated: true
>  
>      properties:
>        sound-dai:
> @@ -41,6 +52,7 @@ properties:
>    speaker-codecs:
>      type: object
>      additionalProperties: false
> +    deprecated: true
>  
>      properties:
>        sound-dai:
> @@ -51,13 +63,83 @@ properties:
>      required:
>        - sound-dai
>  
> +patternProperties:
> +  ".*-dai-link$":
> +    type: object
> +    description:
> +      Container for dai-link level properties and CODEC sub-nodes.
> +
> +    properties:
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name
> +        items:
> +          enum:
> +            - I2S0
> +            - I2S1
> +            - I2S2
> +            - I2S3
> +            - I2S4
> +            - I2S5
> +            - I2S6
> +            - I2S7
> +            - I2S8
> +            - I2S9
> +            - TDM
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 2
> +        required:
> +          - sound-dai
> +
> +      dai-format:
> +        description: audio format
> +        items:
> +          enum:
> +            - i2s
> +            - right_j
> +            - left_j
> +            - dsp_a
> +            - dsp_b
> +
> +      mediatek,clk-provider:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description: Indicates dai-link clock master.
> +        items:
> +          enum:
> +            - cpu
> +            - codec
> +
> +    additionalProperties: false

Move this before properties.

> +
> +    required:
> +      - link-name
> +
>  additionalProperties: false
>  
>  required:
>    - compatible
>    - mediatek,platform
> -  - headset-codec
> -  - speaker-codecs
> +
> +allOf:
> +  # Disallow dai-link-xxx nodes if the legacy properties are specified

xxx-dai-link?

> +  - if:
> +      patternProperties:
> +        ".*-dai-link$": false
> +    then:
> +      required:
> +        - headset-codec
> +        - speaker-codecs
> +    else:
> +      properties:
> +        headset-codec: false
> +        speaker-codecs: false
> +        mediatek,hdmi-codec: false

Allowing both would preserve compatibility. That's not needed? If so, 
say why in the commit msg.

>  
>  examples:
>    - |
> @@ -65,19 +147,50 @@ examples:
>      sound: mt8192-sound {
>          compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
>          mediatek,platform = <&afe>;
> -        mediatek,hdmi-codec = <&anx_bridge_dp>;
>          pinctrl-names = "aud_clk_mosi_off",
>                          "aud_clk_mosi_on";
>          pinctrl-0 = <&aud_clk_mosi_off>;
>          pinctrl-1 = <&aud_clk_mosi_on>;
>  
> -        headset-codec {
> -            sound-dai = <&rt5682>;
> +        audio-routing =
> +                "Headphone Jack", "HPOL",
> +                "Headphone Jack", "HPOR",
> +                "IN1P", "Headset Mic",
> +                "Speakers", "Speaker";
> +
> +        spk-playback-dai-link {
> +                link-name = "I2S3";
> +                dai-format = "i2s";
> +                mediatek,clk-provider = "cpu";
> +                codec {
> +                        sound-dai = <&rt1015p>;
> +                };
> +        };
> +
> +        hs-playback-dai-link {
> +                link-name = "I2S8";
> +                dai-format = "i2s";
> +                mediatek,clk-provider = "cpu";
> +                codec {
> +                        sound-dai = <&rt5682 0>;
> +                };
> +        };
> +
> +        hs-capture-dai-link {
> +                link-name = "I2S9";
> +                dai-format = "i2s";
> +                mediatek,clk-provider = "cpu";
> +                codec {
> +                        sound-dai = <&rt5682 0>;
> +                };
>          };
>  
> -        speaker-codecs {
> -            sound-dai = <&rt1015_l>,
> -                        <&rt1015_r>;
> +        displayport-dai-link {
> +                link-name = "TDM";
> +                dai-format = "dsp_a";
> +                codec {
> +                        sound-dai = <&anx_bridge_dp>;
> +                };
>          };
>      };
>  
> -- 
> 2.44.0
> 

