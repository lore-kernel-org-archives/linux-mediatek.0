Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B75BCA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiKlMoAbzNv/jwxWuBGezkhJzPt6gMgWCE6KRRsV3Zo=; b=FOmGjsuMQS/AX2uwhJ6dmDL5PP
	tyUrY+V8EneZzuEJacvWIhwx0b/PjHvngpGdPgVRfFajkCFUmVRHQeOznarAaVO+NCiQP/FyL95/e
	2L3VrHfWIN3K8/gqPGI+0oeW7mlpY1WkTp0cp1hysBTxjzDgeVgLJOhSmJJXpCzcxP1MesBLO9XsT
	+ZTM5bd8TPCWYshoet/OtMDV5oxqWwx72Fms3xnm7qdYVE/Cv2+yVCwS3qZWlgDAdW+vi0406zIJB
	A6fOBa5VBRnn3QJj8BLAMHNos3ZrSGWUjTyN+68WlMjaBbRH7V9lAYxLnaxRlPuTUTqVYJt6sadss
	5I2T5Y/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4SK-003aww-08;
	Tue, 12 Sep 2023 14:33:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4SF-003aue-1x
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 14:33:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-401f68602a8so62241565e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694529204; x=1695134004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiKlMoAbzNv/jwxWuBGezkhJzPt6gMgWCE6KRRsV3Zo=;
        b=fszptwHDRNVHOzQFJr3tx8k+KIv7DNPiSZeLKZMGa/wvuUMR7d7NT77bRTrDo8tykV
         kIeSnxrdZfbL7P8GiaAr5SzvSM8c+ee7kQHnfNbbL2C74UEblHGtKbAvdK341GSGsLRK
         Mi3/1gTa4anwl2QslU7d/JNw7uJTmisv8y9AdJ2SgPE5GNx53ibqgaTC5o/p6SPXizAU
         nFz0CyyAwk+TEsWNhXcYQIoKdKVoqCHOSmV7NSTX+O8LS2iESgbHQfedMgyvFCLvf9Jh
         ze1cNK9ZwhpbpKplqwKGpbyOtZ6MvJ73xTDk+DrRXmmDrTZiiysqEtjXw9Q6MaahL8my
         xydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694529204; x=1695134004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiKlMoAbzNv/jwxWuBGezkhJzPt6gMgWCE6KRRsV3Zo=;
        b=BgoriHyMdG3WmZzqammMmyS/q4Aw9RmguZqjRkEWhvj8u9pvfYqqpyneOf9z5sC5hO
         am+dO07lQczDnTCI2aNn3EYeaD+ElI2ZdX4rlrQcqc6S0JBQc7xUSgFOnzWk4FjbHa8K
         ofuPri7mtly2V4cK6crQQOQmLlMj2hA2Ta/OsEniU9XDW5FyxdBcy9eei/JfVD+Hhrzf
         3l09RHAdNm7k5EehuXZ0CysNUNKCl+q1ddYXtJB0T0+9ynjApYJJNZ+HNbAchEl+eyG5
         OBV+foLhIcbbyKPjssuiUV/oYtPj5hbPyqJla4rqgGrIyapRN+AZP59ersCupGV/UWJe
         N9tw==
X-Gm-Message-State: AOJu0YyL6WShMzIox1EfLm0N9meOELoXs/jYGfv+adh4GGZwNcBxoR/T
	4gr84RcetsTrQQOiRP3md5tQUA==
X-Google-Smtp-Source: AGHT+IGw692kG+QBF3m4iVqEW6FH1FHekmcPGIKplMaHGmXbveDHTo2sU4XYlmMbvG4i4uM+e/g6Vg==
X-Received: by 2002:a7b:c3d6:0:b0:401:7d3b:ccaf with SMTP id t22-20020a7bc3d6000000b004017d3bccafmr11239201wmj.4.1694529203993;
        Tue, 12 Sep 2023 07:33:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id x5-20020a1c7c05000000b003fef5402d2dsm16347408wmc.8.2023.09.12.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 07:33:23 -0700 (PDT)
Message-ID: <bb639e87-a86a-27ef-0d0c-1dd6cbc2178c@linaro.org>
Date: Tue, 12 Sep 2023 16:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230907131630.28346-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230907131630.28346-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_073327_643281_90D42FB7 
X-CRM114-Status: GOOD (  18.55  )
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

On 07/09/2023 15:16, Macpaul Lin wrote:
> 1. Add compatible for MT8395.
> 2. Add bindings for the MediaTek mt8395-evk board, also known
> as the "Genio 1200-EVK".
> 
> The MT8195 and MT8395 belong to the same SoC family,
> with only minor differences in their physical characteristics.
> They utilize unique efuse values for differentiation.
> 
> The booting process and configurations are managed by boot
> loaders, firmware, and TF-A. Consequently, the part numbers
> and procurement channels vary.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> Changes for v2:
>  - add more detail description for mt8395.
>  - add bindings for mt8395, and mt8395-evk.
> 
> Changes for v3:
>  - add back bindings for mt8195 compatible.
> 
> Changes for v4:
>  - No change, update Reviewed-by tag only. Thanks.
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index ae12b1cab9fb..2e8ad49c3479 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -248,6 +248,12 @@ properties:
>            - enum:
>                - mediatek,mt8365-evk
>            - const: mediatek,mt8365
> +      - description: MediaTek Genio 1200 Boards (Genio 1200 EVK)

Drop description. This is an entry for multiple boards, not this one.

Best regards,
Krzysztof


