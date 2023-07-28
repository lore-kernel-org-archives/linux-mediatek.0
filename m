Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92440C001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pbse/FL/bYEXl8Mf1x5aLqpTAzrAh7Ly043ErMcYY4k=; b=CF6jCSmoyboYQ7KA2L1kAm6uBu
	Gpxzl4foW7fwj0Z+XSPicPDdo4MFFBBUi9LBoRqw6YsY379mcNiE9terHaMZMCsiDbrXmhK7+11jG
	BDiRJdPuc24l0qNjXMsozxt57FTYiRPvU4wGjK8LlAlgEPpi92N+wNk3+wt2hnAD6fYsjQjTZYB5x
	U9Mrx5zOQtL3TWCgiuQ5uewVSvx8Q38sM81JaU7HWdVtsFwenRYY3rivRLc8j4zDNwVwp7e60J5Nk
	StxdnBdT1DRR5HynJjvHAXC2QbvHZVmddacn5IjkA5kwpJUoFXCrmYHP452JM/3jPZDvq2Qt+VOWb
	xynfPtbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMuD-003NYP-1k;
	Fri, 28 Jul 2023 12:49:17 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMuA-003NXD-2s
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jul 2023 12:49:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bdcade7fbso234563366b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jul 2023 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690548553; x=1691153353;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pbse/FL/bYEXl8Mf1x5aLqpTAzrAh7Ly043ErMcYY4k=;
        b=c/cFY5nVzAvu7QFQu1rz7uRvwVsVKG81Ki6j04f4TsAe7ATGVGdS4FzmF8VIboOogg
         dd5WRmUNjpKbJGx/YMPDWZl10r9zQSNGavTTjKyMXEow2Vb5e7LH6bUbiGpHpcML3k8v
         3SeNsF7yJU0tZijtUh+Kw4f0T7YzLA9+NPx9BRBafhkq92wHdco7DuK1vfE0xMxB55gv
         QRjZ+hijsp+NXXVbCzxb+sdm1X9NtOsNCCw5b9At1K7cQkiTGixF5vzjb92P7AyY//vo
         Zym9fOFDvmUsQxhpPloWOrTnZE/T1K7GJXtg5Wfr3E1WhYhI3qE8i9OryjYPlcbM6xJr
         HEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548553; x=1691153353;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pbse/FL/bYEXl8Mf1x5aLqpTAzrAh7Ly043ErMcYY4k=;
        b=CCRfIUp5t3Mx3zgpNm1kgzxpZH8mWepOUEnqATfNepTjIYYpRWW+/eJTEMO+9iONwB
         BNXpHl17zcnMlg6F7lTZMKGLW/KDqvS8PonC8TYP+WsDgd+q2/Z25WzbvmUi0Nmi/pn4
         46AmoOVCu4jN+RvJRV/Z7uKseRT+blEC8wl8EQHFIlgDNsg8aRVcMMWUGbPeYYGUDS1t
         Y3XnliwaIomP/Zsrptw6mUc5LlNGNiZFrYYAw0EMN95vI9mFnklOQlVW8agzXOTiZ1Wv
         SokwJz/ChZX0Qu0Oh80EXS4qprSwgYFqpTdoo75tbXwQzFT0KKs6lbl46exFeL4JY08i
         EOmA==
X-Gm-Message-State: ABy/qLbmJUU4fq9AC7cOCEzSQVAvpPiwsmNnWwYtgUQgQV8jyPyDnPfl
	DAdy1dxH38F8hMTLTrcVDk/I5g==
X-Google-Smtp-Source: APBJJlE7Un/8lOfEtuAAfoTFWj+mEND0Z4JJSWgUz9Y7zsFlTWcgLUkH/JhnP38nXuMjCviOhje1ng==
X-Received: by 2002:a17:906:64d5:b0:991:e458:d14 with SMTP id p21-20020a17090664d500b00991e4580d14mr2238981ejn.34.1690548552914;
        Fri, 28 Jul 2023 05:49:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id mb5-20020a170906eb0500b0098963eb0c3dsm2010040ejb.26.2023.07.28.05.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 05:49:12 -0700 (PDT)
Message-ID: <7d70f893-ee75-d355-4b4c-4afe7a72cd7c@linaro.org>
Date: Fri, 28 Jul 2023 14:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 5/6] ASoC: dt-bindings: mediatek,mt7986-wm8960: add
 mt7986-wm8960 document
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-6-maso.huang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728090819.18038-6-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_054914_927365_D0662363 
X-CRM114-Status: GOOD (  17.38  )
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

On 28/07/2023 11:08, Maso Huang wrote:
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
> +

How did you implement Rob's comment? Or did you just ignore it?

Best regards,
Krzysztof


