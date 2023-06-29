Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A2EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljRf0hyGo8Gpwci5RsjZ1gzHX+tCb5+i5VvfOpLuGAs=; b=Xyn9Fo2DgTX2wxxCUfwoXpk5GH
	Y5NcpCcCAi0vo6DjsYwLVOlTyEAdEFKU7xYeLLfWBuDOyNecyZvO+qJsS7NqhcQ/WLi+20r6f1Hzj
	aCNVHwIYYUZh17dB8IUlObENma/u88NAoIjlEv/5DvAUv1pp/4Cn0BDkDnX1TqbEb3U8lyqbVD4tD
	uVAvueOMkgrT0zmjvSlQ3V7HG8dZwCA67DqxSj2taCurGhVAYs1cAELPEWwJ0+js2/rRNAMuyAQLP
	95AlResKlrEJGetE2qm6XYFtBQqgkyqsEpvpRZL7Q80iH3m9qIeuoKUq2Bn4+J/ckKqnaW1hRiNLF
	3WlzIwpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEt6a-001Mfo-27;
	Thu, 29 Jun 2023 14:58:44 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEt6W-001Mei-2V;
	Thu, 29 Jun 2023 14:58:42 +0000
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-780d1c179e2so32265639f.0;
        Thu, 29 Jun 2023 07:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688050718; x=1690642718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljRf0hyGo8Gpwci5RsjZ1gzHX+tCb5+i5VvfOpLuGAs=;
        b=bn77hQmH0UcF1BR4pvtYDUao7ym/a8BdPWHRe3NHMM9YpkFdc1vB1q58swYlXtA0NH
         XabbSW8DI9dvS4I9S9OsOOEdUV5tCATLckuHYvjLj7fJddGQJYjp53/Vw5dCt8IsNAtG
         BcbzdluCtWn5dAlkOPu3+8NSvgTdiGSO6zS732LVKultvB6Q3N5UTNFjKEBDoItDQnTM
         6ojleiCad2vt3+cAohUIZJMM2gwGyMWrFCdw+TQJaI5mdO9pMGuzSurwJD38OmWIdQQG
         InC0mAmtPJ0Uz2ERNMSSCW7+FBGcH83V2UtQ1mJN3k+FAOQt75ftsITwpJpDjBlrHcIT
         7YtQ==
X-Gm-Message-State: AC+VfDzlev+PamBNLf60JAnrEuZri3G+oA9zPqRbIilELksceIYWYY80
	lpHlcEmHIxjrYR0s7NYgcA==
X-Google-Smtp-Source: ACHHUZ4fvxRFhvMqpuckwCnsXWFPC/rwz9erlSudSvlNJ+tRVLwMuByK8y5rQaap4kBc7/3o7vVugA==
X-Received: by 2002:a5d:8c86:0:b0:783:4bd2:3fd2 with SMTP id g6-20020a5d8c86000000b007834bd23fd2mr15394851ion.17.1688050718366;
        Thu, 29 Jun 2023 07:58:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id m5-20020a02cdc5000000b0042036f06b24sm2857172jap.163.2023.06.29.07.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 07:58:37 -0700 (PDT)
Received: (nullmailer pid 2961403 invoked by uid 1000);
	Thu, 29 Jun 2023 14:58:35 -0000
Date: Thu, 29 Jun 2023 08:58:35 -0600
From: Rob Herring <robh@kernel.org>
To: Maso Huang <maso.huang@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Ren Zhijie <renzhijie2@huawei.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: mediatek,mt7986-wm8960: add
 mt7986-wm8960 document
Message-ID: <20230629145835.GA2954895-robh@kernel.org>
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <20230626023501.11120-7-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626023501.11120-7-maso.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_075840_814861_D528AE02 
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

On Mon, Jun 26, 2023 at 10:35:00AM +0800, Maso Huang wrote:
> Add document for mt7986 board with wm8960.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>  .../sound/mediatek,mt7986-wm8960.yaml         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
> new file mode 100644
> index 000000000000..76394f7e5502
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt7986-wm8960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7986 sound card with WM8960 codec
> +
> +maintainers:
> +  - Maso Huang <maso.huang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7986-wm8960-machine
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT7986 platform.
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      sink/source pair of strings. Valid names could be the input or output
> +      widgets of audio components, power supplies, MicBias of codec and the
> +      software switch.
> +
> +  mediatek,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of wm8960 codec.

Please define these properties in a common schema and reference them 
where already used and here. A given property shouldn't have multiple 
type definitions.

Rob

