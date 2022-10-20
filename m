Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1217C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGAAR2BMfaAANWL2R8YcIVSEZh0G1rs0+++u0ybOJWQ=; b=oL4GmTWU2yR+sDkvwemFPrN2vh
	t77o3piqFYFHaBMytYeeCIoXYZYIWE5vDWqy/Bs9V/kNjHs3pgqMxbJG0q8ebFalFFf9xmGdz0w8y
	TQ2mwY75XhvFtszM29sw+H3XL/rPy/8sFYmAL68oe5wbTM+jEiFvPtRMFM9NjCXmaRfrlf2hTg22E
	lZS60ZIIkR0zKyXmnzb9zvNNxlECnSotqwockvl3CsSq+aXXocXxIFcAIqJuNeI6Enp6O1sZc5s1R
	Tv5GDA2Qlw0wkJlXzmov+y7nCnGmPr/3R56JF6+1YbA1Gn469qlsUikFkR1kJE4cYl0QWoJuS7zwr
	dDDicfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYcU-000Uv4-Qb; Thu, 20 Oct 2022 16:42:10 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYcQ-000Uq2-8F
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 16:42:08 +0000
Received: by mail-qt1-x836.google.com with SMTP id g11so14079394qts.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 09:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGAAR2BMfaAANWL2R8YcIVSEZh0G1rs0+++u0ybOJWQ=;
        b=n9XO8dfIA6PtGSlMXzxeoH5vZLkJN/qPgV+9tdRknUZG9vkEbK+vAr02Hje6yei4YG
         WqFrxGj8dglk1yNeyhUhkGK2nnlp7t1KTi6BqKbtRDDIsWayM0Pris8nlEorXXLQXfkq
         GKQfpFwTu7EKpyQ02ojTPzNq9mWTw1Gmd0zNpqmIYJevGw1Owa+VXYqqEyVOiLvgPYb1
         8Ap1gf/q6OFbelFhFyQUnS46Vj5IR0j+7uEK3XCdaI48VlVQfLEUyDjSP0X+BXPPoxaM
         SPFL/YxjgVxxaEUz6ZfAfoX0ZymwnTJiAQL7Vd5vZMFvNn/0w1/isSUIGKljQtqmhvuq
         ATcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGAAR2BMfaAANWL2R8YcIVSEZh0G1rs0+++u0ybOJWQ=;
        b=bOiY3yKv2JKic1b8zSKdDTFn4P/DFmp9PiBsHijnbWumtXkesu/7HuH6Vnyf3Fgkfd
         IYAHzLeUgQUa6mDmbEBQqTUGlTNAcbEG0AiO3grvFxUmmlnTtBfg6C9WSEMG5+1twqe4
         +woeMdc43QqKlix5NGwoh234nBnZBRG3TOxwSOpO70LJkWl8AZb+gkA1a4e/ZCoQ6eLr
         JJQEPPLpNsvttBfuX88qV45HxcTkK4vWq0AAz5BLOfTieurm6PeJnodn5Dl184Hw6NPY
         5T5nxHlggAOgr1uOujJi8QhnktwJSieTRakxVu38r2XHXVTxg7hebxGs0aEfxdWemWUf
         ZgWA==
X-Gm-Message-State: ACrzQf0dWP2Sk6FDOmu4rngxxi4PgdIlZb07sUrO+xpGWdxbcee9xW97
	C7BWDgzZC/VJbZc9ioAcgyXEeg==
X-Google-Smtp-Source: AMsMyM5IomthQmzdC4Dq9NmLfyL4YqW1be9IT8LtgUzuYA0I8nVmUicKpJz0j8BzM1Xg/OxBPyArow==
X-Received: by 2002:ac8:5d88:0:b0:39d:804:90a5 with SMTP id d8-20020ac85d88000000b0039d080490a5mr5811848qtx.20.1666284124103;
        Thu, 20 Oct 2022 09:42:04 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id w28-20020a05622a191c00b0039bfe8acff6sm6249223qtc.58.2022.10.20.09.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 09:42:03 -0700 (PDT)
Message-ID: <3cf2801c-9be5-c012-606e-d8fb7c4a218f@linaro.org>
Date: Thu, 20 Oct 2022 12:42:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 3/5] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Mark Brown
 <broonie@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
 <20221005-mt6357-support-v3-3-7e0bd7c315b2@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mt6357-support-v3-3-7e0bd7c315b2@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_094206_340727_3E7E1958 
X-CRM114-Status: GOOD (  14.41  )
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

On 20/10/2022 12:20, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add YAML schema for the MediaTek MT6357 regulators.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../regulator/mediatek,mt6357-regulator.yaml       | 292 +++++++++++++++++++++
>  1 file changed, 292 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> new file mode 100644
> index 000000000000..8dc1245304be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> @@ -0,0 +1,292 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6357-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6357 Regulators
> +
> +maintainers:
> +  - Fabien Parent <fabien.parent@linaro.org>
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +

The binding looks ok, but to be sure: you are aware that this schema is
not effective, does nothing without being referenced somewhere? And that
we do not see this reference neither in the patchset nor in cover letter?

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


