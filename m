Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2292DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Qek6UIHQ+bbCaaLnSaW6r64q6VM+tLrxNDw9LwIzw0=; b=Z1ICKwwJpDMtdrlzxyADp3wZbD
	TIpdxDDCGmjGXUYqoKLTj3QqJUbrHF8uhFbjHz3k+NYnh3mHVEVC5H0nza2OXDqsjnsOn9daclVZ9
	kMkK81gLlhgeLroAygwLmT9DVeMIMwjruYDgXuCo82UnYZ335W17hXzO+Hr+WT4HOJy5EmvP0TesB
	ZToNqcgZDosouyWIJrfrTRNJDM2CTvCD5VVfpknj4A6l1iBjWyYDW2nVY/qdVdrNFmMKYsQKTklRD
	ZwCShUegtfo5je2T9cRsUIxlKNNI7rdyiMDhAw7EaWh6yV58aXC49FuhGXYQUvjy3Gh0Dn1kl+9V4
	f5EhdWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBJ0-008kbz-R1; Tue, 12 Jul 2022 08:31:42 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBIy-008kYR-NU
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 08:31:42 +0000
Received: by mail-lf1-x129.google.com with SMTP id bf9so12688897lfb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Jul 2022 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2Qek6UIHQ+bbCaaLnSaW6r64q6VM+tLrxNDw9LwIzw0=;
        b=q5JieP0nD1nb1WONStATLcRP5Gl7TEysSwqRsbz16Aa1NA0dPPjSljZkAAgT6/tRhG
         6VLQfc5B7FqJF2WtL15C0h/Z8c5syWmEvZ4sFc2rr9Lfe/+uZW+Uy4oI9CB/+RCex592
         IeRL4hDjn42wtoAo0/CsI07N4JDEadx3YRCjHc8R+E4Tvp4EQQw1B3vn2taMHjthwum8
         AyjosCfNoI9A4MM2ln8XfIFNWM6oX94V+NgXFJiJfwLGzHxgM4y2OaUjGEqGOenQ3kuK
         kuoZghny1QSUNlTQ++hfreBwu6Zf8PC1HuPtBKR4dhSfCWbYRHvPUpamjO9wY2TICf4P
         n3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2Qek6UIHQ+bbCaaLnSaW6r64q6VM+tLrxNDw9LwIzw0=;
        b=NugzP6ciBzYB2fm3CGDhqL3DI6tEtoBJcbl0eK4Q5jbSL0OKy1kqapihl3AoA54B56
         opOKmydjxN075/2eRKwM2e8aOQB4174m4N1O7TDda3eR15puj7NCkArMaW7Qml8D5+Fu
         XUE97qCknI1Twb+Hcegib3T9UD1Y2awRyaBoKRCMdNts71CurgTtQ06UQZ2gYgeufgdv
         D4Y2nCnLBqrgoCWtMF/KPzo1jYvoEOz3B01wArPVaGoOolGLP4fhWYA5VPVOQwjF9hqp
         Q/Q2+DOpFmc+dwkc+H0wF18GRFreuOhsDRlfHswHWfX5N9kldugjQFutvL2W3Y+Pcqho
         udfA==
X-Gm-Message-State: AJIora9TP+F5+s92iwcqbU5bIQpkC6UbHdUkPn8Uq050xz12itsZRVrT
	Rs6QOEDGx0t2ysVH1A864JaFMw==
X-Google-Smtp-Source: AGRyM1sErvlK54KDfmiepBO87G/PzDDHBO3xqVuq4WopTZAFMkYpJG4tiwF07DITvORCx+p1AxegEQ==
X-Received: by 2002:a05:6512:12c9:b0:489:fa6e:d371 with SMTP id p9-20020a05651212c900b00489fa6ed371mr374610lfg.37.1657614698997;
        Tue, 12 Jul 2022 01:31:38 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id c19-20020ac25f73000000b0048759bc6c1asm2052737lfc.203.2022.07.12.01.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:31:38 -0700 (PDT)
Message-ID: <68d60eb6-605d-153b-3074-37d1777ea6d8@linaro.org>
Date: Tue, 12 Jul 2022 10:31:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: power: mediatek: Document phandle to
 SCPSYS syscon node
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
 <20220711122503.286743-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711122503.286743-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_013140_803237_E8701F77 
X-CRM114-Status: GOOD (  14.95  )
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

On 11/07/2022 14:25, AngeloGioacchino Del Regno wrote:
> Add a phandle to the syscon block providing access to SCPSYS registers:
> this allows us to avoid using simple-mfd for the SCPSYS node and
> nesting the System Power Manager node inside.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/power/mediatek,power-controller.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 135c6f722091..848fdff7c9d8 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -39,6 +39,11 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  syscon:

This is not a generic property. You need vendor prefix and property name
(can be followed by -syscon).

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon block providing access to SCPSYS registers
> +
>  patternProperties:
>    "^power-domain@[0-9a-f]+$":
>      type: object


Best regards,
Krzysztof

